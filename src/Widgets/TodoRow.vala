public class Widgets.TodoRow : Gtk.ListBoxRow {
    public string todo { get; construct; }

    public signal void trash ();

    public TodoRow (string todo) {
        Object (
            todo: todo
        );
    }

    construct {
        var checkbutton = new Gtk.CheckButton.with_label (todo) {
            hexpand = true
        };

        var edit_entry = new Gtk.Entry ();
        edit_entry.text = todo;

        var popover = new Gtk.Popover ();
        popover.set_child (edit_entry);

        var edit_button = new Gtk.MenuButton () {
            icon_name = "document-edit-symbolic",
            popover = popover
        };
        var trash_button = new Gtk.Button.from_icon_name ("user-trash-symbolic");

        var buttons_box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 3);
        buttons_box.append  (edit_button);
        buttons_box.append  (trash_button);

        var r = new Gtk.Revealer () {
            child = buttons_box,
            transition_type = Gtk.RevealerTransitionType.SLIDE_LEFT
        };

        var main_box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 12);
        main_box.append  (checkbutton);
        main_box.append  (r);

        set_child (main_box);

        var event = new Gtk.EventControllerMotion ();
        add_controller (event);

        event.enter.connect (() => {
            r.reveal_child = true;
        });

        event.leave.connect (() => {
            if (!popover.is_visible ()) {
                r.reveal_child = false;
            }
        });

        trash_button.clicked.connect (() => {
            trash ();
        });

        edit_entry.changed.connect (() => {
            checkbutton.label = edit_entry.text;
        });
    }
}