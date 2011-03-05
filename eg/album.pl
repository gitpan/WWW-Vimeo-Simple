#!/usr/bin/perl

use feature 'say';
use WWW::Vimeo::Simple::Album;

# create a new album object
my $album = WWW::Vimeo::Simple::Album -> new(id => $album_id);

# retrieve album's information
$album -> info;

# print album's information
say $album -> title;
say $album -> description;
say $album -> url;

# retrieve album's videos
my $videos = $album -> videos;

foreach my $video (@$videos) {
	say $video -> title;
	say $video -> description;
	say $video -> url;
}
