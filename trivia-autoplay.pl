# 8. Music : Empty was performed by?
# Time's up! The answer was: gary cooper
# Winner: YellowKing; Answer: mars; Time: 4.526s; Streak: 1; Points: 5; Total: 88
# Channel Message
# echo("Trivia 0.6!");
for ('Channel Msg Hilight', 'Channel Message') { hook_print($_, \&trivia_text_handler); }
sub trivia_text_handler {
  if(get_info('channel') =~ /808$/) {
    my @info = @{$_[0]};
    if($info[0] =~ /^Trivia$/) {
      if($info[1] =~ /^\d+\. (.*)\?/) {
        # echo("Trivia question: ".$info[1]);
        my $q = $1;
        foreach(keys %{$c{data}{trivia}{answers}}) {
        $c{tmp}{'trivia'}{'key'} = $q;
          if($_ =~ /$q/i) {
            command("echo ".$c{data}{trivia}{answers}{$q});
            # command("timer ".(3+ int rand 3)." say ".$c{data}{trivia}{answers}{$q});
            delete $c{tmp}{'trivia'}{'key'};;
          }
        }
      }
      elsif($info[1] =~ /^Winner\: .*?\; Answer\: (.*?)\;/) { trivia_save_answer($1); }
      elsif($info[1] =~ /^Time\'s up\! The answer was\: (.*)$/) { trivia_save_answer($1); }
    }
  }
  return EAT_NONE;
}
sub trivia_save_answer {
  my $answer = $_[0];
  # echo("Answer was: $answer");
  if($c{tmp}{trivia}{key}) {
    # echo("Saving to ".$c{tmp}{trivia}{key});
    $c{data}{trivia}{answers}{$c{tmp}{trivia}{key}} = $answer;
    # echo("There are ".(keys $c{data}{trivia}{answers})." answers stored.");
    save_config();
  }
}
