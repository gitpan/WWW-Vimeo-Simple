package WWW::Vimeo::Simple::Activity;
{
  $WWW::Vimeo::Simple::Activity::VERSION = '0.14';
}

use strict;
use warnings;

use JSON;
use Any::Moose;
use HTTP::Tiny;

use WWW::Vimeo::Simple;
use WWW::Vimeo::Simple::User::Activity;

=head1 NAME

WWW::Vimeo::Simple::Activity - Activity requests for the Vimeo Simple API

=head1 VERSION

version 0.14

=head1 SYNOPSIS

This module is a full object-oriented implementation of the Vimeo Simple
API. The specifications are available at L<http://vimeo.com/api/docs/simple-api>.

Activity requests implementation.

    use feature 'say';
    use WWW::Vimeo::Simple::Activity qw(user_did);

    # retrieve user's activities
    my $activities = user_did($user_name);

    foreach my $activity (@$activities) {
      say $activity -> user_name;
      say $activity -> type;
      say $activity -> subject_name;
    }

=head1 SUBROUTINES

The module exports the following subroutines on request.

=cut

BEGIN {
	use Exporter 'import';
	use vars qw(@ISA @EXPORT_OK);

	@ISA = qw(Exporter);

	@EXPORT_OK = qw(
		user_did
		happened_to_user
		contacts_did
		happened_to_contacts
		everyone_did
	);
}

=head2 user_did( $user_name | $user_id [, $page ] )

Fetch activities by the user. This method returns an array reference
of L<WWW::Vimeo::Simple::Activity> objects.

=cut

sub user_did {
	my ($user, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($user, 'user_did', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @activities;
	foreach my $activity ( @$json_text ) {
		push @activities, WWW::Vimeo::Simple::User::Activity -> new($activity);
	}

	return \@activities;
}

=head2 happened_to_user( $user_name | $user_id [, $page ] )

Fetch activities on the user. This method returns an array reference
of L<WWW::Vimeo::Simple::Activity> objects.

=cut

sub happened_to_user {
	my ($user, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($user, 'happened_to_user', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @activities;
	foreach my $activity ( @$json_text ) {
		push @activities, WWW::Vimeo::Simple::Activity -> new($activity);
	}

	return \@activities;
}

=head2 contacts_did( $user_name | $user_id [, $page ] )

Fetch activities by the user's contacts. This method returns an array
reference of L<WWW::Vimeo::Simple::Activity> objects.

=cut

sub contacts_did {
	my ($user, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($user, 'contacts_did', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @activities;
	foreach my $activity ( @$json_text ) {
		push @activities, WWW::Vimeo::Simple::Activity -> new($activity);
	}

	return \@activities;
}

=head2 happened_to_contacts( $user_name | $user_id [, $page ] )

Fetch activities on the user's contacts. This method returns an array
reference of L<WWW::Vimeo::Simple::Activity> objects.

=cut

sub happened_to_contacts {
	my ($user, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($user, 'happened_to_contacts', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @activities;
	foreach my $activity ( @$json_text ) {
		push @activities, WWW::Vimeo::Simple::Activity -> new($activity);
	}

	return \@activities;
}

=head2 everyone_did( $user_name | $user_id [, $page ] )

Fetch activities by everyone. This method returns an array reference
of L<WWW::Vimeo::Simple::Activity> objects.

=cut

sub everyone_did {
	my ($user, $page) = @_;
	my $http = HTTP::Tiny -> new();
	my $url  = _make_url($user, 'everyone_did', $page);

	my $response = $http -> get($url);
	my $json_text = decode_json $response -> {'content'};

	my @activities;
	foreach my $activity ( @$json_text ) {
		push @activities, WWW::Vimeo::Simple::Activity -> new($activity);
	}

	return \@activities;
}

=head1 INTERNAL SUBROUTINES

=head2 _make_url( $request )

Build a Vimeo Simple API url

=cut

sub _make_url {
	my ($user, $request, $page) = @_;

	$page = defined $page ? $page : 1;

	my $api_url    = $WWW::Vimeo::Simple::API_URL;
	my $api_format = $WWW::Vimeo::Simple::API_FORMAT;

	return "$api_url/activity/$user/$request.$api_format?page=$page";
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

1; # End of WWW::Vimeo::Simple::Activity
