public class Window : Adw.ApplicationWindow {
    public Window (Gtk.Application app) {
        Object (
            application: app,
            title: "Mi App",
            width_request: 375,
            height_request: 500
        );
    }

    construct {
        var headerbar = new Adw.HeaderBar ();

        var entry = new Gtk.Entry () {
            hexpand = true
        };
        entry.placeholder_text = "Agrega tu tarea";

        var button = new Gtk.Button.with_label ("Agregar");

        var bottom_box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 6) {
            hexpand = true,
            margin_start = 12,
            margin_end = 12,
            margin_bottom = 12
        };
        bottom_box.append  (entry);
        bottom_box.append  (button);

        var listbox = new Gtk.ListBox ();
        listbox.hexpand = true;
        listbox.vexpand = true;

        var box = new Gtk.Box (Gtk.Orientation.VERTICAL, 12);
        box.append  (headerbar);
        box.append  (listbox);
        box.append  (bottom_box);

        set_content  (box);

        button.clicked.connect (() => {
            var row = new Widgets.TodoRow (entry.text);

            row.trash.connect (() => {
                listbox.remove (row);
            });

            listbox.append (row);

            entry.text = "";
        });
    }
}