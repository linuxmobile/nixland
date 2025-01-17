{pkgs, ...}: {
  programs = {
    carapace.enable = true;
    carapace.enableNushellIntegration = true;

    nushell = {
      enable = true;

      plugins = with pkgs.nushellPlugins; [
        skim
        query
        gstat
        # dbus
        polars
        # highlight
      ];

      extraConfig = let
        conf = builtins.toJSON {
          show_banner = false;
          edit_mode = "vi";

          ls.clickable_links = true;
          rm.always_trash = true;

          table = {
            mode = "rounded";
            index_mode = "always";
            header_on_separator = false;
          };

          cursor_shape = {
            vi_insert = "line";
            vi_normal = "block";
          };

          display_errors = {
            exit_code = false;
          };

          menus = [
            {
              name = "completion_menu";
              only_buffer_difference = false;
              marker = "? ";
              type = {
                layout = "columnar"; # list, description
                columns = 4;
                col_padding = 2;
              };
              style = {
                text = "magenta";
                selected_text = "blue_reverse";
                description_text = "yellow";
              };
            }
          ];
        };
        completions = let
          completion = name: ''
            source ${pkgs.nu_scripts}/share/nu_scripts/custom-completions/${name}/${name}-completions.nu
          '';
        in
          names:
            builtins.foldl'
            (prev: str: "${prev}\n${str}") ""
            (map completion names);
      in ''
        $env.config = ${conf};

        ${completions ["git" "nix" "man" "rg"]}

        # use ${pkgs.nu_scripts}/share/nu_scripts/modules/background_task/task.nu
        source ${pkgs.nu_scripts}/share/nu_scripts/modules/formats/from-env.nu

        # const path = "~/.nushellrc.nu"
        # const null = "/dev/null"
        # source (if ($path | path exists) {
        #     $path
        # } else {
        #     $null
        # })


        def fcd [] {
          let dir = (fd --type d | sk | str trim)
          if ($dir != "") {
            cd $dir
          }
        }

        def installed [] {
          nix-store --query --requisites /run/current-system/ | parse --regex '.*?-(.*)' | get capture0 | sk
        }

        def installedall [] {
          nix-store --query --requisites /run/current-system/ | sk | wl-copy
        }

        def search [term: string] {
          nix search nixpkgs --json $term | from json | values | select pname description
        }

        def homesearch [program: string] {
          http get https://raw.githubusercontent.com/mipmip/home-manager-option-search/refs/heads/main/static/data/options-release-23.11.json
          | get options
          | where { |opt|
            $opt.title =~ $program or ($opt.declarations | any { |decl| $decl.name =~ $program })
          }
          | each { |option|
            let type_info = if ($option.type | is-empty) { "No type info" } else { $option.type }
            let default_info = if ($option.default | is-empty) { "null" } else { $option.default }
            let description = if ($option.description | is-empty) { "No description" } else { $option.description }

            {
              title: $option.title,
              type: $type_info,
              description: $description,
              default: $default_info,
              files: ($option.declarations | each { |d| $d.name } | str join ", ")
            }
          }
        }


        def --env fm [...args] {
        	let tmp = (mktemp -t "yazi-cwd.XXXXX")
        	yazi ...$args --cwd-file $tmp
        	let cwd = (open $tmp)
        	if $cwd != "" and $cwd != $env.PWD {
        		cd $cwd
        	}
        	rm -fp $tmp
        }
      '';

      shellAliases = {
        cleanup = "sudo nix-collect-garbage --delete-older-than 1d";
        listgen = "sudo nix-env -p /nix/var/nix/profiles/system --list-generations";
        nixremove = "nix-store --gc";
        bloat = "nix path-info -Sh /run/current-system";
        c = "clear";
        q = "exit";
        cleanram = "sudo sh -c 'sync; echo 3 > /proc/sys/vm/drop_caches'";
        trimall = "sudo fstrim -va";
        temp = "cd /tmp/";
        zed = "zeditor";

        test-build = "sudo nixos-rebuild test --flake .#aesthetic";
        switch-build = "sudo nixos-rebuild switch --flake .#aesthetic";

        # git
        g = "git";
        add = "git add .";
        commit = "git commit";
        push = "git push";
        pull = "git pull";
        diff = "git diff --staged";
        gcld = "git clone --depth 1";
        gco = "git checkout";
        gitgrep = "git ls-files | rg";
        # gitrm = "git ls-files --deleted -z | xargs -0 git rm";

        # cat = "bat --theme=base16 --number --color=always --paging=never --tabs=2 --wrap=never";
        fcd = "cd (fd --type d | sk | str trim)";
        grep = "rg";
        l = "eza -lF --time-style=long-iso --icons";
        # la = "eza -lah --tree";
        # ls = "eza -h --git --icons --color=auto --group-directories-first -s extension";
        ll = "eza -h --git --icons --color=auto --group-directories-first -s extension";
        tree = "eza --tree --icons --tree";

        # systemctl
        us = "systemctl --user";
        rs = "sudo systemctl";
      };

      environmentVariables = {
        PROMPT_INDICATOR_VI_INSERT = "  ";
        PROMPT_INDICATOR_VI_NORMAL = "∙ ";
        PROMPT_COMMAND = "";
        PROMPT_COMMAND_RIGHT = "";
        NIXPKGS_ALLOW_UNFREE = "1";
        NIXPKGS_ALLOW_INSECURE = "1";
        SHELL = "${pkgs.nushell}/bin/nu";
        EDITOR = "hx";
        VISUAL = "hx";
        FLAKE = "/home/linuxmobile/Dev/nixland";
      };
    };
  };
}
