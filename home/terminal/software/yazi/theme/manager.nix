{
  programs.yazi.theme.manager = {
    cwd = {fg = "cyan";};

    # Hovered
    hovered = {
      fg = "black";
      bg = "blue";
    };

    preview_hovered = {
      fg = "black";
      bg = "blue";
    };

    # Find
    find_keyword = {
      fg = "yellow";
      italic = true;
    };
    find_position = {
      fg = "magenta";
      bg = "reset";
      italic = true;
    };

    # Marker
    marker_selected = {
      fg = "green";
      # bg = "green";
    };
    marker_copied = {
      fg = "yellow";
      # bg = "yellow";
    };
    marker_cut = {
      fg = "red";
      # bg = "red";
    };

    # Tab
    tab_active = {
      fg = "black";
      bg = "blue";
    };
    tab_inactive = {
      fg = "white";
      bg = "darkgray";
    };
    tab_width = 1;

    # Border;
    border_symbol = "│";
    border_style = {fg = "gray";};

    # Offset;
    folder_offset = [1 0 1 0];
    preview_offset = [1 1 1 1];

    # Highing;
    syntect_theme = "";
  };
}
