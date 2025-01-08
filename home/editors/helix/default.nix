{
  inputs,
  pkgs,
  ...
}: {
  imports = [./languages.nix];

  programs.helix = {
    enable = true;
    package = inputs.helix.packages.${pkgs.system}.default.overrideAttrs (self: {
      makeWrapperArgs = with pkgs;
        self.makeWrapperArgs
        or []
        ++ [
          "--suffix"
          "PATH"
          ":"
          (lib.makeBinPath [
            biome
            emmet-ls
            marksman
            nil
            vscode-langservers-extracted
            nodePackages.typescript-language-server
            typescript
            nushell
            nufmt
            stylua
            lua-language-server
          ])
        ];
    });

    settings = {
      theme = "current";
      editor = {
        color-modes = true;
        cursorline = true;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        undercurl = true;
        true-color = true;
        soft-wrap.enable = true;
        indent-guides = {
          render = true;
          rainbow-option = "dim";
        };
        lsp = {
          display-messages = true;
          display-inlay-hints = true;
        };
        gutters = ["diagnostics" "line-numbers" "spacer" "diff"];
        statusline = {
          left = ["mode" "version-control"];
          center = ["spinner" "file-base-name"];
          right = ["diagnostics" "file-encoding" "position" "position-percentage" "total-line-numbers"];
          mode = {
            normal = "NORMAL";
            insert = "INSERT";
            select = "SELECT";
          };
        };
        whitespace.characters = {
          space = "·";
          nbsp = "⍽";
          tab = "→";
          newline = "⤶";
        };
        auto-pairs = true;
        clipboard-provider = "wayland";
      };

      keys.insert = {
        C-h = "move_char_left";
        C-j = "move_line_down";
        C-k = "move_line_up";
        C-l = "move_char_right";
        C-e = "goto_line_end";
        C-b = "goto_line_start";
      };

      keys.normal = {
        A-j = ["extend_to_line_bounds" "delete_selection" "paste_after"];
        A-k = ["extend_to_line_bounds" "delete_selection" "move_line_up" "paste_before"];
        A-h = ["delete_selection" "move_char_left" "paste_before"];
        A-l = ["delete_selection" "move_char_right" "paste_after"];

        C-h = ["jump_view_left"];
        C-j = ["jump_view_down"];
        C-k = ["jump_view_up"];
        C-l = ["jump_view_right"];

        tab = ["goto_next_buffer"];
        S-tab = ["goto_previous_buffer"];

        space = {x = ":buffer-close";};

        space.u = {
          f = ":format"; # format using LSP formatter
          w = ":set whitespace.render all";
          W = ":set whitespace.render none";
        };
      };
    };
  };
}
