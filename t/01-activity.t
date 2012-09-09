#!perl

use Test::More;

use WWW::Vimeo::Simple::Activity;
can_ok 'WWW::Vimeo::Simple::Activity', qw(user_did happened_to_user contacts_did happened_to_contacts everyone_did);

done_testing;
