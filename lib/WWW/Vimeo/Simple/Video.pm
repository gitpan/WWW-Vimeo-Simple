package WWW::Vimeo::Simple::Video;

use WWW::Vimeo::Simple;

use strict;

=head1 NAME

WWW::Vimeo::Simple::Video - Object-oriented Vimeo Simple API interface. Video requests.

=head1 VERSION

Version 0.04

=cut

our $VERSION = '0.04';


=head1 SYNOPSIS

This module is a full object-oriented implementation of the Vimeo Simple
API. The specifications are available at L<http://vimeo.com/api/docs/simple-api>.

Video request implementation.

    use WWW::Vimeo::Simple;

    my $foo = WWW::Vimeo::Simple->new();

    my $video  = $foo->video( $video_id );

    $video->info;
    print $video->data->{'id'};

=head1 METHODS

=head2 new( $video_id )

Create a WWW::Vimeo::Simple::Video object

=cut

sub new {
	my ($class, $video_id) = @_;
 
	my $self = bless({video_id => $video_id}, $class);

	return $self;
}

=head2 info

Fetch video info for the specified video

=cut

sub info {
	my $self = shift;

	my $api_url    = $WWW::Vimeo::Simple::API_URL;
	my $api_format = $WWW::Vimeo::Simple::API_FORMAT;

	my $url = "$api_url/video/".$self -> {'video_id'}.".$api_format";

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 data

Return fetched data

=cut

sub data {
	my $self = shift;

	return $self -> {'data'} -> [0];
}

=head1 VIDEO INFO DATA

	title 				Video title
	url 				URL to the Video Page
	id 				Video ID
	description 			The description of the video
	thumbnail_small 		URL to a small version of the thumbnail
	thumbnail_medium 		URL to a medium version of the thumbnail
	thumbnail_large 		URL to a large version of the thumbnail
	user_name 			The user name of the video's uploader
	user_url 			The URL to the user profile
	upload_date 			The date/time the video was uploaded on
	user_portrait_small 		Small user portrait (30px)
	user_portrait_medium 		Medium user portrait (100px)
	user_portrait_large 		Large user portrait (300px)
	stats_number_of_likes 		# of likes
	stats_number_of_views 		# of views
	stats_number_of_comments 	# of comments
	duration 			Duration of the video in seconds
	width 				Standard definition width of the video
	height 				Standard definition height of the video
	tags 				Comma separated list of tags

=head1 AUTHOR

Alessandro Ghedini, C<< <alexbio at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-www-vimeo-simple at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Vimeo-Simple>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

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

=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2010 Alessandro Ghedini.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

1; # End of WWW::Vimeo::Simple::Video
