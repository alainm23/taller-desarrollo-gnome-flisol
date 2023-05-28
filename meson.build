project (
    'io.github.alainm23.todo',
    'vala', 'c',
    version: '0.1'
)

gnome = import ('gnome')

executable (
    meson.project_name (),
    'src/App.vala',
    'src/Window.vala',
    'src/Widgets/TodoRow.vala',
    dependencies: [
        dependency ('gtk4'),
        dependency ('libadwaita-1')
    ],
    install: true
)