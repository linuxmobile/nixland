{
  pkgs,
  lib,
  ...
}: {
  programs.helix.languages = {
    language = let
      biome = lang: {
        command = "biome";
        args = ["format" lang];
      };
      deno = lang: {
        command = "${pkgs.deno}/bin/deno";
        args = ["fmt" "-" "--ext" lang];
      };
      prettier = lang: {
        command = "${pkgs.nodePackages.prettier}/bin/prettier";
        args = ["--parser" lang];
      };
      prettierLangs = map (e: {
        name = e;
        formatter = prettier e;
      });
      langs = ["css" "scss" "json" "html"];

    in
      [
        {
          name = "bash";
          auto-format = true;
          formatter = {
            command = "${pkgs.shfmt}/bin/shfmt";
            args = ["-i" "2"];
          };
        }
        {
          name = "javascript";
          auto-format = true;
          formatter = {
            command = "biome";
            args = ["format" "--stdin-file-path" "a.js"];
          };
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome-lsp"
          ];
        }
        {
          name = "json";
          formatter = biome "json";
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome-lsp"
          ];
        }
        {
          name = "jsx";
          auto-format = true;
          formatter = {
            command = "biome";
            args = ["format" "--stdin-file-path" "a.jsx"];
          };
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome-lsp"
          ];
        }
        {
          name = "markdown";
          auto-format = true;
          formatter = deno "md";
        }
        {
          name = "typescript";
          auto-format = true;
          formatter = {
            command = "biome";
            args = ["format" "--stdin-file-path" "a.ts"];
          };
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome-lsp"
          ];
        }
        {
          name = "tsx";
          auto-format = true;
          formatter = {
            command = "biome";
            args = ["format" "--stdin-file-path" "a.tsx"];
          };
          language-servers = [
            {
              name = "typescript-language-server";
              except-features = ["format"];
            }
            "biome-lsp"
          ];
        }
      ]
      ++ prettierLangs langs;

    language-server = {
      biome-lsp = {
        command = "biome";
        args = ["lsp-proxy"];
      };

      deno-lsp = {
        command = "${pkgs.deno}/bin/deno";
        args = ["lsp"];
        environment.NO_COLOR = "1";
        config.deno = {
          enable = true;
          lint = true;
          unstable = true;
          suggest = {
            completeFunctionCalls = false;
            imports = {hosts."https://deno.land" = true;};
          };
          inlayHints = {
            enumMemberValues.enabled = true;
            functionLikeReturnTypes.enabled = true;
            parameterNames.enabled = "all";
            parameterTypes.enabled = true;
            propertyDeclarationTypes.enabled = true;
            variableTypes.enabled = true;
          };
        };
      };

      emmet-lsp = {
        command = "${pkgs.emmet-ls}/bin/emmet-ls";
        args = ["--stdio"];
      };

      nil = {
        command = lib.getExe pkgs.nil;
        config.nil.formatting.command = ["${lib.getExe pkgs.alejandra}" "-q"];
      };

      unocss-lsp = {
        command = "unocss-language-server";
        args = ["--stdio"];
      };

      vscode-css-language-server = {
        command = "${pkgs.vscode-langservers-extracted}/bin/css-languageserver";
        args = ["--stdio"];
        config = {
          provideFormatter = true;
          css.validate.enable = true;
          scss.validate.enable = true;
        };
      };
    };
  };
}
