use strict;
use Test::More;

use Text::Emoticon::MSN;

my $text = "blah ;-)blah (o)";

my @Tests = (
    # args, filtered_text
    [ { },
      qq(blah <img src="./wink_smile.gif" />blah <img src="./clock.gif" />) ],
    [ { imgbase => "http://example.com/img" },
      qq(blah <img src="http://example.com/img/wink_smile.gif" />blah <img src="http://example.com/img/clock.gif" />) ],
    [ { xhtml => 0 },
      qq(blah <img src="./wink_smile.gif">blah <img src="./clock.gif">) ],
    [ { class => "emo" },
      qq(blah <img src="./wink_smile.gif" class="emo" />blah <img src="./clock.gif" class="emo" />) ],
);

plan tests => scalar(@Tests);

for (@Tests) {
    my($args, $filtered) = @$_;
    my $emoticon = Text::Emoticon::MSN->new(%$args);
    is $emoticon->filter($text), $filtered;
}
