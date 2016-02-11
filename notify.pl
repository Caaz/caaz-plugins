use Xchat qw(:all);
register('Notify', '1.0.0', 'Use system notifications.');
for ('Channel Msg', 'Channel Action') { hook_print($_." Hilight", sub {
  my $nick = $_[0][0];
  my $channel = get_info('channel');
  # Ignore fracture's output.
  return EAT_NONE if((!$nick) || ($nick =~ /\cC/));
  my $notification = "$nick highlighted you in $channel";
  # my $notification = ($nick)?"$nick highlighted you in $channel":"You received a notification in $channel";
  system("notify-send -i hexchat -u low -t 1 Hexchat \"$notification\"");
  return EAT_NONE;
}, { priority => PRI_HIGHEST, data => $_ }); }
