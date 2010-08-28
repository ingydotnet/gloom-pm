use inc::Module::Install;

name 'Gloom';

perl_version '5.008003';

all_from 'lib/Gloom.pm';
all_from 'lib/Gloom.pod';

abstract 'The Great Little OO Module';

clean_files 't/lib/Foo/Gloom.pm', 't/inc', 'MANIFEST';

WriteAll;
