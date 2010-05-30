use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'WWW::Vimeo::Simple',
    AUTHOR              => q{Alessandro Ghedini <alexbio@cpan.org>},
    VERSION_FROM        => 'lib/WWW/Vimeo/Simple.pm',
    ABSTRACT_FROM       => 'lib/WWW/Vimeo/Simple.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' 		=> 0,
        'LWP::UserAgent' 	=> 0,
	'HTTP::Request::Common' => 0,
	'JSON' 			=> 0
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'WWW-Vimeo-Simple-*' },
);
