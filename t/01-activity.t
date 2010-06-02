use Test::More tests => 1;

use strict;
use WWW::Vimeo::Simple;

my $vimeo = WWW::Vimeo::Simple->new;

my $activity = WWW::Vimeo::Simple->activity;

can_ok($activity, qw(user_did happened_to_user contacts_did happened_to_contacts everyone_did data));
