use Test::More tests => 1;

use strict;
use WWW::Vimeo::Simple::Group;

my $group = WWW::Vimeo::Simple::Group->new;

can_ok($group, qw(info videos users));
