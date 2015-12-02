add_plugin({
  'init' => sub {
    # Stuff
  },
  'commands' => {
    # Turns out reloading doesn't work and forcing the actual command doesn't work for shit.
    # 'C.Reload' => sub { load_plugins(); },
    'C.update' => sub {
      echo("Checking for updates...");
      command('exec cd $HOME/.config/hexchat/addons/caaz-plugins/ && git pull');
    }
  }
});
