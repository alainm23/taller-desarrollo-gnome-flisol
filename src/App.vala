public class App : Adw.Application {
    public App () {
        Object (
            application_id: "io.github.alainm23.todo",
            flags: GLib.ApplicationFlags.FLAGS_NONE
        );
    }

    protected override void activate () {
        var main_window = new Window (this);
        main_window.present ();
    }

    private static int main (string[] args) {
        var app  = new App ();
        return app.run (args);
    }
}