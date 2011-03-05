#!/usr/bin/perl

use feature 'say';
use WWW::Vimeo::Simple::Activity qw(user_did);

# retrieve user's activities
my $activities = user_did($user_name);

foreach my $activity (@$activities) {
	say $activity -> user_name;
	say $activity -> type;
	say $activity -> subject_name;
}
