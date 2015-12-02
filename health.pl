# echo("Good news Health! 0.0");
# # use LWP::Simple;
#
# hook_print('Join', sub {
#   my @info = @{$_[0]};
#   echo(join ", ", @info);
#   if(($info[0] =~ /TheFission$/i) && ($info[1] =~ /./i)) {
#     command("say Good news ".$info[1]."! ".goodNews());
#   }
# });
# sub goodNews {
#   my $url = 'https://news.google.com/news?cf=all&hl=en&output=rss';
#   my $content = `wget -O - $url`;
#   if($content =~ /<item><title>(.*?)<\/title><link>.*?<\/link>/is) {
#     return $1;
#   }
# }
# echo(goodNews());
#   # echo($content);
# # }
# # sub echo {
# #   print $_[0]."\n";
# # }
# # goodNews();
hook_print('Channel Message', sub {
  my @info = @{$_[0]};
  # echo(join ", ", @info);
  if(($info[0] =~ /TheFusion/i) == ($info[2] =~ /wake me up/)) {
    command("say ".("Can't wake up","Wake me up","Save me")[rand 3]) ;
  }
});
