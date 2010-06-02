package WWW::Vimeo::Simple;

use WWW::Vimeo::Simple::Activity;
use WWW::Vimeo::Simple::Album;
use WWW::Vimeo::Simple::Channel;
use WWW::Vimeo::Simple::Group;
use WWW::Vimeo::Simple::User;
use WWW::Vimeo::Simple::Video;

use Carp;
use LWP::UserAgent;
use HTTP::Request::Common;
use JSON;

use strict;

=head1 NAME

WWW::Vimeo::Simple - Object-oriented Vimeo Simple API interface.

=head1 VERSION

Version 0.04

=cut

our $VERSION = '0.04';


=head1 SYNOPSIS

This module is a full object-oriented implementation of the Vimeo Simple
API. The specifications are available at L<http://vimeo.com/api/docs/simple-api>.

    use WWW::Vimeo::Simple;

    my $foo = WWW::Vimeo::Simple->new();

    my $user  = $foo->user( $user );
    my $video = $foo->video( $video_id );
    ...

=cut

our $API_URL     = "http://vimeo.com/api/v2";
our $API_FORMAT  = "json";

=head1 METHODS

=head2 new

Create a L<WWW::Vimeo::Simple> object.

=cut

sub new {
	my ($class) = @_;
 
	my $self = bless({}, $class);

	return $self;
}

=head2 user( $user )

Return a L<WWW::Vimeo::Simple::User> object.

=cut

sub user {
	my ($self, $user) = @_;

	return WWW::Vimeo::Simple::User -> new($user);
}

=head2 video( $video_id )

Return a L<WWW::Vimeo::Simple::Video> object.

=cut

sub video {
	my ($self, $video_id) = @_;

	return WWW::Vimeo::Simple::Video -> new($video_id);
}

=head2 activity( $username )

Return a L<WWW::Vimeo::Simple::Activity> object.

=cut

sub activity {
	my ($self, $user) = @_;

	return WWW::Vimeo::Simple::Activity -> new($user);
}

=head2 album( $album_id )

Return a L<WWW::Vimeo::Simple::Album> object.

=cut

sub album {
	my ($self, $album_id) = @_;

	return WWW::Vimeo::Simple::Album -> new($album_id);
}

=head2 channel( $channel_name )

Return a L<WWW::Vimeo::Simple::Channel> object.

=cut

sub channel {
	my ($self, $channel_name) = @_;

	return WWW::Vimeo::Simple::Channel -> new($channel_name);
}

=head2 group( $group_name )

Return a L<WWW::Vimeo::Simple::Group> object.

=cut

sub group {
	my ($self, $group_name) = @_;

	return WWW::Vimeo::Simple::Group -> new($group_name);
}

=head2 request( $url )

Make a GET request and parse the response.

=cut

sub request {
	my ($self, $url) = @_;
	
	my $response = WWW::Vimeo::Simple -> get_request($url);
	my $data     = WWW::Vimeo::Simple -> parse_response($response);

	return $data;
}

=head2 get_request( $url )

Make a GET request.

=cut

sub get_request {
	my ($self, $url) = @_;
	my $ua = LWP::UserAgent -> new;
	$ua -> agent("");  

	my $response = $ua -> request(GET $url) -> as_string;

	my $status = (split / /,(split /\n/, $response)[0])[1];

	croak "ERROR: Server reported status $status" if $status != 200;

	return $response;
}

=head2 parse_response( $data )

Parse the response of a GET request.

=cut

sub parse_response {
	my $self = shift;
	my @data = split('\n\n', shift);
	
	my $json_text = decode_json $data[1];
	use Data::Dumper;
	die Dumper $json_text;
	
	return $json_text;
}

=head1 AUTHOR

Alessandro Ghedini, C<< <alexbio at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-www-vimeo-simple at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Vimeo-Simple>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::Vimeo::Simple
    
    perldoc WWW::Vimeo::Simple::Activity
    
    perldoc WWW::Vimeo::Simple::Album
    
    perldoc WWW::Vimeo::Simple::Channel
    
    perldoc WWW::Vimeo::Simple::Group
    
    perldoc WWW::Vimeo::Simple::User
    
    perldoc WWW::Vimeo::Simple::Video

You can also look for information at:

=over 4

=item * TwitShell homepage

L<http://alexlog.co.cc/projects/www-vimeo-simple>

=item * Git repository

L<http://github.com/AlexBio/WWW-Vimeo-Simple>

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WWW-Vimeo-Simple>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WWW-Vimeo-Simple>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WWW-Vimeo-Simple>

=item * Search CPAN

L<http://search.cpan.org/dist/WWW-Vimeo-Simple/>

=back

=head1 LICENSE AND COPYRIGHT

Copyright 2010 Alessandro Ghedini.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of WWW::Vimeo::Simple
