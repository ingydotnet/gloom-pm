use inc::Module::Install;

name 'Gloom';

perl_version '5.008003';

abstract 'The Great Little OO Module';

all_from 'lib/Gloom.pm';
all_from 'lib/Gloom.pod';
readme_from 'lib/Gloom.pod';
manifest_skip;

clean_files 't/lib/Foo/Gloom.pm', 't/inc';

WriteAll;
