{config, ...}: {
  home.sessionVariables = {
    STARSHIP_CACHE = "${config.xdg.cacheHome}/starship";
  };
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      scan_tiemout = 10;
      add_newline = true;
      line_break.disabled = true;
      format = ''
        [╭╴](fg:arrow)\
        $username\
        $os\
        $git_branch\
        (\
            at \
            $directory\
        )\
        $cmd_duration\
        (\
            via \
            $python\
            $conda\
            $nodejs\
            $c\
            $rust\
            $java\
        )
        [╰─](fg:arrow)$character\
      '';
      username = {
        style_user = "bold os";
        style_root = "bold os_admin";
        format = "[  $user](fg:$style) ";
        disabled = false;
        show_always = true;
      };
      os = {
        format = "on [($name)]($style) ";
        style = "bold blue";
        disabled = true;
        symbols = {
          Alpine = " ";
          Arch = " ";
          Debian = " ";
          EndeavourOS = " ";
          Fedora = " ";
          Linux = " ";
          Macos = " ";
          Manjaro = " ";
          Mint = " ";
          NixOS = " ";
          openSUSE = " ";
          Pop = " ";
          SUSE = " ";
          Ubuntu = " ";
          Windows = " ";
        };
      };
      character = {
        success_symbol = "[󰍟](fg:arrow)";
        error_symbol = "[󰍟](fg:red)";
      };
      directory = {
        format = "[$path](bold $style)[$read_only]($read_only_style) ";
        truncation_length = 2;
        style = "fg:directory";
        read_only_style = "fg:directory";
        before_repo_root_style = "fg:directory";
        truncation_symbol = "…/";
        truncate_to_repo = true;
        read_only = "  ";
      };
      time = {
        disabled = true;
        format = "at [󱑈 $time]($style)";
        time_format = "%H:%M";
        style = "bold fg:time";
      };
      cmd_duration = {
        format = "took [ $duration]($style) ";
        style = "bold fg:duration";
        min_time = 500;
      };
      git_branch = {
        format = "via [$symbol$branch]($style) ";
        style = "bold fg:git";
        symbol = " ";
      };
      git_status = {
        format = "[ $all_status$ahead_behind ]($style)";
        style = "fg:text_color bg:git";
        disabled = true;
      };
      docker_context = {
        disabled = true;
        symbol = " ";
      };
      package.disable = true;
      fill.symbol = " ";
      nodejs = {
        format = "[ $symbol$version ]($style)";
        style = "bg:node fg:text_light";
        symbol = " ";
        version_format = "$''{raw}";
        disabled = false;
      };
      python = {
        disabled = false;
        format = "[ $''{symbol}$''{pyenv_prefix}($''{version})( \($virtualenv\)) ]($style)";
        symbol = " ";
        version_format = "$''{raw}";
        style = "bg:python fg:text_light";
      };
      rust = {
        format = "[ $symbol$version ]($style)";
        style = "bg:rust fg:text_light";
        symbol = " ";
        version_format = "$''{raw}";
        disabled = true;
      };

      nix_shell = {
        symbol = " ";
        heuristic = true;
      };
    };
  };
}
