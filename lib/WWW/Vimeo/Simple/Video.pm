package WWW::Vimeo::Simple::Video;
{
  $WWW::Vimeo::Simple::Video::VERSION = '0.14';
}

use strict;
use warnings;

use JSON;
use Any::Moose;
use HTTP::Tiny;

use WWW::Vimeo::Simple;

=head1 NAME

WWW::Vimeo::Simple::Video - Video requests for the Vimeo Simple API

=head1 VERSION

version 0.14

=head1 SYNOPSIS

This module is a full object-oriented implementation of the Vimeo Simple
API. The specifications are available at L<http://vimeo.com/api/docs/simple-api>.

Video request implementation.

    use feature 'say';
    use WWW::Vimeo::Simple::Video;

    # create a new video object
    my $video = WWW::Vimeo::Simple::Video -> new(id => $video_id);

    # retrieve video's information
    $video -> info;

    # print video's information
    say $video -> title;
    say $video -> description;
    say $video -> url;
    ...

=head1 METHODS

=head2 new( id => $video_id )

Create a WWW::Vimeo::Simple::Video object using the gived ID.

A Video object has the following attributes:

=over 4

=item * title

Video title

=cut

has 'title' => (
	is  => 'rw',
	isa => 'Str',
);

=item * url

URL to the Video Page

=cut

has 'url' => (
	is  => 'rw',
	isa => 'Str',
);

=item * id

Video ID

=cut

has 'id' => (
	is  => 'rw',
	isa => 'Int',
);

=item * description

The description of the video

=cut

has 'description' => (
	is  => 'rw',
	isa => 'Str',
);

=item * thumbnail_small

URL to a small version of the thumbnail

=cut

has 'thumbnail_small' => (
	is  => 'rw',
	isa => 'Str',
);

=item * thumbnail_medium

URL to a medium version of the thumbnail

=cut

has 'thumbnail_medium' => (
	is  => 'rw',
	isa => 'Str',
);

=item * thumbnail_large

URL to a large version of the thumbnail

=cut

has 'thumbnail_large' => (
	is  => 'rw',
	isa => 'Str',
);

=item * user_name

The user name of the video's uploader

=cut

has 'user_name' => (
	is  => 'rw',
	isa => 'Str',
);

=item * user_url

The URL to the user profile

=cut

has 'user_url' => (
	is  => 'rw',
	isa => 'Str',
);

=item * upload_date

The date/time the video was uploaded on

=cut

has 'upload_date' => (
	is  => 'rw',
	isa => 'Str',
);

=item * user_portrait_small

Small user portrait (30px)

=cut

has 'user_portrait_small' => (
	is  => 'rw',
	isa => 'Str',
);

=item * user_portrait_medium

Medium user portrait (100px)

=cut

has 'user_portrait_medium' => (
	is  => 'rw',
	isa => 'Str',
);

=item * user_portrait_large

Large user portrait (300px)

=cut

has 'user_portrait_large' => (
	is  => 'rw',
	isa => 'Str',
);

=item * stats_number_of_likes

# of likes

=cut

has 'stats_number_of_likes' => (
	is  => 'rw',
	isa => 'Int',
);

=item * stats_number_of_views

# of views

=cut

has 'stats_number_of_views' => (
	is  => 'rw',
	isa => 'Int',
);

=item * stats_number_of_comments

# of comments

=cut

has 'stats_number_of_comments' => (
	is  => 'rw',
	isa => 'Int',
);

=item * duration

Duration of the video in seconds

=cut

has 'duration' => (
	is  => 'rw',
	isa => 'Int',
);

=item * width

Standard definition width of the video

=cut

has 'width' => (
	is  => 'rw',
	isa => 'Int',
);

=item * height

Standard definition height of the video

=cut

has 'height' => (
	is  => 'rw',
	isa => 'Int',
);

=item * tags

Comma separated list of tags

=cut

has 'tags' => (
	is  => 'rw',
	isa => 'Str',
);

=back

=head2 info

Fetch video info for the specified video.

=cut

sub info {
	my $self = shift;
	my $http = HTTP::Tiny -> new();
	my $url = "$WWW::Vimeo::Simple::API_URL/video/".$self -> {'id'}.".$WWW::Vimeo::Simple::API_FORMAT";

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	for my $key ( keys %{ $json_text -> [0] } ) {
		if (defined $json_text -> [0] -> {$key}) {
			$self -> {$key} = $json_text -> [0] -> {$key};
		}
	}
}

=head1 AUTHOR

Alessandro Ghedini <alexbio@cpan.org>

=head1 LICENSE AND COPYRIGHT

Copyright 2011 Alessandro Ghedini.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

no Any::Moose;

__PACKAGE__ -> meta -> make_immutable;

1; # End of WWW::Vimeo::Simple::Video
