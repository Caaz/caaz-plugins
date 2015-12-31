my %last = ();
for('Channel Message', 'Private Message to Dialog', 'Your Message') { hook_print($_,\&handle_text,{'data'=>[$_]}); }
for('Channel Msg Hilight','Channel Action','Join','Quit','Part') { hook_print($_,\&reset_last); }
sub reset_last {
  my $where = get_info('channel');
  delete $last{$where};
  return EAT_NONE;
}
sub handle_text {
  my ($event,$where,$nick,$msg) = ($_[1][0],get_info('channel'),@{$_[0]});
  if(($last{$where}) && ($last{$where} eq $nick)) {
    emit_print($event, "\cC20$nick\cO", $msg);
    return EAT_ALL;
  }
  else { $last{$where} = $nick; return EAT_NONE; }
}
