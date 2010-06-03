package WWW::Vimeo::Simple::Channel;

use WWW::Vimeo::Simple;

use strict;

=head1 NAME

WWW::Vimeo::Simple::Channel - Object-oriented Vimeo Simple API interface. Channel requests.

=head1 VERSION

Version 0.05

=cut

our $VERSION = '0.05';

=head1 SYNOPSIS

This module is a full object-oriented implementation of the Vimeo Simple
API. The specifications are available at L<http://vimeo.com/api/docs/simple-api>.

Channel requests implementation.

    use WWW::Vimeo::Simple;

    my $foo = WWW::Vimeo::Simple->new();

    my $channel = $foo->channel( $channel_name );

    $channel->videos;
    
    foreach (@{$channel->data}) {
	    print $_ -> {'title'};
    }

=head1 METHODS

=head2 new( $channel_name )

Create a WWW::Vimeo::Simple::Channel object

=cut

sub new {
	my ($class, $channel_name) = @_;
 
	my $self = bless({channel_name => $channel_name}, $class);

	return $self;
}

=head2 info

Fetch channel info for the specified channel

=cut

sub info {
	my $self = shift;
	my $url  = make_url($self, 'info');

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 videos( $page )

Fetch videos in that channel, page optional (default 1)

=cut

sub videos {
	my ($self, $page) = @_;
	my $url  = make_url($self, 'videos', $page);

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 make_url( $request )

Build a Vimeo Simple API url

=cut

sub make_url {
	my ($self, $request, $page) = @_;

	$page = defined $page ? $page : 1;

	my $api_url    = $WWW::Vimeo::Simple::API_URL;
	my $api_format = $WWW::Vimeo::Simple::API_FORMAT;

	return "$api_url/channel/".$self -> {'channel_name'}."/$request.$api_format?page=$page";
}

=head2 data

Return fetched data

=cut

sub data {
	my $self = shift;

	return $self -> {'data'};
}

=head1 CHANNEL INFO DATA

	id 			Channel ID
	name 			Channel name
	description 		Channel description
	logo 			Channel logo (header)
	url 			URL for the channel page
	rss 			RSS feed for the channel's videos
	created_on 		Date the channel was created
	creator_id 		User ID of the channel creator
	creator_display_name 	Name of the User who created the channel
	creator_url 		The URL to the channel creator's profile
	total_videos 		Total # of videos posted in the channel
	total_subscribers 	Total # of users subscribed

=head1 AUTHOR

Alessandro Ghedini, C<< <alexbio at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-www-vimeo-simple at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Vimeo-Simple>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::Vimeo::Simple

You can also look for information at:

=over 4

=item * WWW::Vimeo::Simple homepage

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

1; # End of WWW::Vimeo::Simple::Channel
