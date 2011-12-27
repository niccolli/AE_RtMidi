use 5.014001;
use ExtUtils::MakeMaker;

my $CC = 'g++';

# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME              => 'RtM',
    VERSION_FROM      => 'lib/RtM.pm', # finds $VERSION
    PREREQ_PM         => {}, # e.g., Module::Name => 1.1
    ($] >= 5.005 ?     ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM  => 'lib/RtM.pm', # retrieve abstract from module
       AUTHOR         => 'Yusuke Umahashi <yusuke@local>') : ()),
    LIBS              => [''], # e.g., '-lm'
    DEFINE            => '-D__MACOSX_CORE__', # e.g., '-DHAVE_SOMETHING'
	CC				  => $CC,
	LD				  => '$(CC)',
	INC               => '-I.', # e.g., '-I. -I/usr/include/other'
	# Un-comment this if you add C files to link with later:
    # OBJECT            => '$(O_FILES)', # link all the C files too
	XSOPT			  => '-C++',
	LDDLFLAGS		  => '-bundle -undefined dynamic_lookup -Wall -framework CoreMidi -framework CoreAudio -framework CoreFoundation',
	OPTIMIZE		  => '-arch i386',
	TYPEMAPS		  => ['perlobject.map'],
);
