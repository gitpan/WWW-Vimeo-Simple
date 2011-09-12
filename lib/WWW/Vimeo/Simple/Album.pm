package WWW::Vimeo::Simple::Album;
{
  $WWW::Vimeo::Simple::Album::VERSION = '0.08';
}

use JSON;
use Mouse;
use HTTP::Tiny;

use WWW::Vimeo::Simple;
use WWW::Vimeo::Simple::Video;

use warnings;
use strict;

=head1 NAME

WWW::Vimeo::Simple::Album - Album requests for the Vimeo Simple API

=head1 VERSION

version 0.08

=head1 SYNOPSIS

This module is a full object-oriented implementation of the Vimeo Simple
API. The specifications are available at L<http://vimeo.com/api/docs/simple-api>.

Album requests implementation.

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

=head1 METHODS

=head2 new( id => $album_id )

Create a WWW::Vimeo::Simple::Album object using the given album ID.

An Album object has the following attributes:

=over

=item * id

Album ID

=cut

has 'id' => (
	is  => 'rw',
	isa => 'Int',
);

=item * created_on

Date the album was created

=cut

has 'created_on' => (
	is  => 'rw',
	isa => 'Str',
);

=item * last_modified

Date the album was last modified

=cut

has 'last_modified' => (
	is  => 'rw',
	isa => 'Str',
);

=item * title

Album title

=cut

has 'title' => (
	is  => 'rw',
	isa => 'Str',
);

=item * description

Album description

=cut

has 'description' => (
	is  => 'rw',
	isa => 'Str',
);

=item * url

URL for the album page

=cut

has 'url' => (
	is  => 'rw',
	isa => 'Str',
);

=item * thumbnail

Thumbnail

=cut

has 'url' => (
	is  => 'rw',
	isa => 'Str',
);

=item * total_videos

Total # of videos added to the album

=cut

has 'total_videos' => (
	is  => 'rw',
	isa => 'Int',
);

=item * user_id

ID of the user who made the album

=cut

has 'user_id' => (
	is  => 'rw',
	isa => 'Int',
);

=item * user_display_name

Name of the User who created the album

=cut

has 'user_display_name' => (
	is  => 'rw',
	isa => 'Int',
);

=item * user_url

The URL to the album creator's profile

=cut

has 'user_url' => (
	is  => 'rw',
	isa => 'Int',
);

=back

=head2 info

Fetch album info for the specified album.

=cut

sub info {
	my $self = shift;
	my $http = HTTP::Tiny -> new();
	my $url = _make_url($self, 'info');

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	for my $key ( keys %$json_text ) {
		if (defined $json_text -> {$key}) {
			$self -> {$key} = $json_text -> {$key};
		}
	}
}

=head2 videos( $page )

Fetch videos in that album, page optional (default 1). This method returns
an array reference of L<WWW::Vimeo::Simple::Video> objects.

=cut

sub videos {
	my ($self, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($self, 'videos', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @videos;
	foreach my $video ( @$json_text ) {
		push @videos, WWW::Vimeo::Simple::Video -> new($video);
	}

	return \@videos;
}

=head1 INTERNAL SUBROUTINES

=head2 _make_url( $request )

Build a Vimeo Simple API url

=cut

sub _make_url {
	my ($self, $request, $page) = @_;

	$page = defined $page ? $page : 1;

	my $api_url    = $WWW::Vimeo::Simple::API_URL;
	my $api_format = $WWW::Vimeo::Simple::API_FORMAT;

	return "$api_url/album/".$self -> {'id'}."/$request.$api_format?page=$page";
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

1; # End of WWW::Vimeo::Simple::Album
