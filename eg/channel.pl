#!/usr/bin/perl

use feature 'say';
use WWW::Vimeo::Simple::Channel;

# create a new channel object
my $channel = WWW::Vimeo::Simple::Channel -> new(name => $channel_id);

# retrieve channel's information
$channel -> info;

# print channel's information
say $channel -> name;
say $channel -> description;
say $channel -> url;

# retrieve channel's videos
my $videos = $channel -> videos;

foreach my $video (@$videos) {
	say $video -> title;
	say $video -> description;
	say $video -> url;
}
