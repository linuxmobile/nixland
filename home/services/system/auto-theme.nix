{
  pkgs,
  ...
}: let
  script = pkgs.writeShellScript "theme-changer.sh" ''
    echo "HELIX_THEME: $HELIX_THEME"
    echo "GTK_CONFIG_DIR: $GTK_CONFIG_DIR"
    echo "THEMES_DIR: $THEMES_DIR"

    gsettings monitor org.gnome.desktop.interface color-scheme | while read -r line; do
    COLOR_SCHEME=$(echo $line | awk '{print $2}')
    echo "Detectado cambio de esquema de color: $COLOR_SCHEME"

    GTK_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d "'")
    GTK_THEME_BASE=$(echo $GTK_THEME | sed -E 's/(-hdpi|-xhdpi|-Dark|-Light)//g')

    case "$COLOR_SCHEME" in
    "'prefer-dark'")
      echo "Cambiando tema de Helix a mocha..."
      sed -i 's/^"inherits" = .*/"inherits" = "mocha"/' $HELIX_THEME
      gsettings set org.gnome.desktop.interface gtk-theme "$\{GTK_THEME_BASE\}-Dark"
      gsettings set org.gnome.shell.extensions.user-theme name "$\{GTK_THEME_BASE\}-Dark"
      ;;
    "'default'")
      echo "Cambiando tema de Helix a latte..."
      sed -i 's/^"inherits" = .*/"inherits" = "latte"/' $HELIX_THEME
      gsettings set org.gnome.desktop.interface gtk-theme "$\{GTK_THEME_BASE\}-Light"
      gsettings set org.gnome.shell.extensions.user-theme name "$\{GTK_THEME_BASE\}-Light"
      ;;
    esac

    GTK_THEME=$(gsettings get org.gnome.desktop.interface gtk-theme | tr -d "'")
    THEME_PATH="$THEMES_DIR/$GTK_THEME/gtk-4.0"

    echo "GTK_THEME: $GTK_THEME"
    echo "THEME_PATH: $THEME_PATH"

    if [ -d "$THEME_PATH" ]; then
      echo "Creando enlaces simbólicos en $GTK_CONFIG_DIR..."
      rm -rf "$GTK_CONFIG_DIR/*"
      ln -sfv "$THEME_PATH/*" "$GTK_CONFIG_DIR/"
    else
      echo "No se encontró el directorio del tema: $THEME_PATH"
    fi
    done
  '';
in {
  systemd.user.services.theme-changer = {
    Unit = {
      Description = "Change Software Theme based on Gnome Theme";
      After = ["graphical-session-pre.target"];
      PartOf = ["graphical-session.target"];
    };
    Service = {
      Type = "simple";
      ExecStart = "${script}";
      Restart = "always";
    };

    Install.WantedBy = ["graphical-session.target"];
  };
}
