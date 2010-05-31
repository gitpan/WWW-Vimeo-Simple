package WWW::Vimeo::Simple::Activity;

use WWW::Vimeo::Simple;

use strict;

=head1 NAME

WWW::Vimeo::Simple::Activity - Object-oriented Vimeo Simple API interface. Activity requests.

=head1 VERSION

Version 0.03

=cut

our $VERSION = '0.03';

=head1 SYNOPSIS

This module is a full object-oriented implementation of the Vimeo Simple
API. The specifications are available at L<http://vimeo.com/api/docs/simple-api>.

Activity requests implementation.

    use WWW::Vimeo::Simple;

    my $foo = WWW::Vimeo::Simple->new();

    my $activity = $foo->activity( $username );

    $activity->user_did;
    
    foreach (@{$activity->data}) {
	print $_ -> {'type'};
    }

=head1 METHODS

=head2 new( $user_name )

Create a WWW::Vimeo::Simple::Activity object

=cut

sub new {
	my ($class, $user_name) = @_;
 
	my $self = bless({user_name => $user_name}, $class);

	return $self;
}

=head2 user_did

Fetch activities by the user

=cut

sub user_did {
	my $self = shift;
	my $url  = make_url($self, 'user_did');

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 happened_to_user

Fetch activities on the user

=cut

sub happened_to_user {
	my $self = shift;
	my $url  = make_url($self, 'happened_to_user');

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 contacts_did

Fetch activities by the user's contacts

=cut

sub contacts_did {
	my $self = shift;
	my $url  = make_url($self, 'contacts_did');

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 happened_to_contacts

Fetch activities on the user's contacts

=cut

sub happened_to_contacts {
	my $self = shift;
	my $url  = make_url($self, 'happened_to_contacts');

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 everyone_did

Fetch activities by everyone

=cut

sub everyone_did {
	my $self = shift;
	my $url  = make_url($self, 'everyone_did');

	$self -> {'data'} = WWW::Vimeo::Simple -> request($url);
}

=head2 make_url( $request )

Build a Vimeo Simple API url

=cut

sub make_url {
	my ($self, $request) = @_;

	my $api_url    = $WWW::Vimeo::Simple::API_URL;
	my $api_format = $WWW::Vimeo::Simple::API_FORMAT;

	return "$api_url/activity/".$self -> {'user_name'}."/$request.$api_format";
}

=head2 data

Return fetched data

=cut

sub data {
	my $self = shift;

	return $self -> {'data'};
}

=head1 AUTHOR

Alessandro Ghedini, C<< <alexbio at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-www-vimeo-simple at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Vimeo-Simple>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::Vimeo::Simple::Activity

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

1; # End of WWW::Vimeo::Simple::Activity
