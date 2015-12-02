add_plugin({
  'init' => sub {
    for ('Channel Msg', 'Channel Action') { hook_print($_." Hilight", sub {
      system("notify-send -i hexchat -u low -t 1 Hexchat \"".$_[0][0]." highlighted you in ".get_info('channel')."\"");
    }, { priority => PRI_HIGHEST, data => $_ }); }
  }
});
