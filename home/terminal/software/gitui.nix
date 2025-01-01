{
  programs.gitui = {
    enable = true;
    keyConfig = ''
      (
        open_help: Some(( code: ?, modifiers: "")),

        move_left: Some(( code: Char('h'), modifiers: "",)),
        move_right: Some(( code: Char('l'), modifiers: "",)),
        move_up: Some(( code: Char('k'), modifiers: "",)),
        move_down: Some(( code: Char('j'), modifiers: "",)),

        popup_up: Some(( code: Char('p'), modifiers: "CONTROL",)),
        popup_down: Some(( code: Char('n'), modifiers: "CONTROL",)),
        page_up: Some(( code: Char('b'), modifiers: "CONTROL",)),
        page_down: Some(( code: Char('f'), modifiers: "CONTROL",)),
        home: Some(( code: Char('g'), modifiers: "",)),
        end: Some(( code: Char('G'), modifiers: "SHIFT",)),
        shift_up: Some(( code: Char('K'), modifiers: "SHIFT",)),
        shift_down: Some(( code: Char('J'), modifiers: "SHIFT",)),

        edit_file: Some(( code: Char('I'), modifiers: "SHIFT",)),

        status_reset_item: Some(( code: Char('U'), modifiers: "SHIFT",)),

        diff_reset_lines: Some(( code: Char('u'), modifiers: "",)),
        diff_stage_lines: Some(( code: Char('s'), modifiers: "",)),

        stashing_save: Some(( code: Char('w'), modifiers: "",)),
        stashing_toggle_index: Some(( code: Char('m'), modifiers: "",)),

        stash_open: Some(( code: Char('l'), modifiers: "",)),

        abort_merge: Some(( code: Char('M'), modifiers: "SHIFT",)),
      )
    '';
  };
}
