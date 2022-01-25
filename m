Content-Type: multipart/mixed; boundary="===============8996862954092058941=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH RFC] btrfs: sysfs: add <uuid>/debug/io_accounting/ directory
Date: Wed, 26 Jan 2022 03:17:43 +0800
Message-ID: <202201260130.4VVHtyiM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8996862954092058941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220121052445.37692-1-wqu@suse.com>
References: <20220121052445.37692-1-wqu@suse.com>
TO: Qu Wenruo <wqu@suse.com>

Hi Qu,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on kdave/for-next]
[also build test WARNING on v5.17-rc1 next-20220125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Qu-Wenruo/btrfs-sysfs-add-=
uuid-debug-io_accounting-directory/20220121-132629
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for=
-next
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-c007-20220124 (https://download.01.org/0day-ci/ar=
chive/20220126/202201260130.4VVHtyiM-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 997e12=
8e2a78f5a5434fc75997441ae1ee76f8a4)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/879aebce4c7d6a684b93b9254=
5978dc75bf4abd5
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Qu-Wenruo/btrfs-sysfs-add-uuid-deb=
ug-io_accounting-directory/20220121-132629
        git checkout 879aebce4c7d6a684b93b92545978dc75bf4abd5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                         ^                     ~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:3784:7: warning: Access to field 'flags' results in a=
 dereference of a null pointer (loaded from variable 'bargs') [clang-analyz=
er-core.NullDereference]
           if ((bargs->flags & BTRFS_BALANCE_ARGS_PROFILES) &&
                ^
   fs/btrfs/volumes.c:3875:6: note: Assuming 'path' is non-null
           if (!path) {
               ^~~~~
   fs/btrfs/volumes.c:3875:2: note: Taking false branch
           if (!path) {
           ^
   fs/btrfs/volumes.c:3885:7: note: 'counting' is true
           if (!counting) {
                ^~~~~~~~
   fs/btrfs/volumes.c:3885:2: note: Taking false branch
           if (!counting) {
           ^
   fs/btrfs/volumes.c:3898:2: note: Loop condition is true.  Entering loop =
body
           while (1) {
           ^
   fs/btrfs/volumes.c:3899:9: note: 'counting' is true
                   if ((!counting && atomic_read(&fs_info->balance_pause_re=
q)) ||
                         ^~~~~~~~
   fs/btrfs/volumes.c:3899:18: note: Left side of '&&' is false
                   if ((!counting && atomic_read(&fs_info->balance_pause_re=
q)) ||
                                  ^
   fs/btrfs/volumes.c:3900:7: note: Assuming the condition is false
                       atomic_read(&fs_info->balance_cancel_req)) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:3899:3: note: Taking false branch
                   if ((!counting && atomic_read(&fs_info->balance_pause_re=
q)) ||
                   ^
   fs/btrfs/volumes.c:3907:7: note: Assuming 'ret' is >=3D 0
                   if (ret < 0) {
                       ^~~~~~~
   fs/btrfs/volumes.c:3907:3: note: Taking false branch
                   if (ret < 0) {
                   ^
   fs/btrfs/volumes.c:3916:7: note: Assuming 'ret' is not equal to 0
                   if (ret =3D=3D 0)
                       ^~~~~~~~
   fs/btrfs/volumes.c:3916:3: note: Taking false branch
                   if (ret =3D=3D 0)
                   ^
   fs/btrfs/volumes.c:3921:7: note: Assuming 'ret' is 0
                   if (ret) {
                       ^~~
   fs/btrfs/volumes.c:3921:3: note: Taking false branch
                   if (ret) {
                   ^
   fs/btrfs/volumes.c:3931:7: note: Assuming 'found_key.objectid' is equal =
to 'key.objectid'
                   if (found_key.objectid !=3D key.objectid) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:3931:3: note: Taking false branch
                   if (found_key.objectid !=3D key.objectid) {
                   ^
   fs/btrfs/volumes.c:3939:8: note: 'counting' is true
                   if (!counting) {
                        ^~~~~~~~
   fs/btrfs/volumes.c:3939:3: note: Taking false branch
                   if (!counting) {
                   ^
   fs/btrfs/volumes.c:3945:9: note: Calling 'should_balance_chunk'
                   ret =3D should_balance_chunk(leaf, chunk, found_key.offs=
et);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:3767:2: note: 'bargs' initialized to a null pointer v=
alue
           struct btrfs_balance_args *bargs =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:3771:6: note: Assuming the condition is false
           if (!((chunk_type & BTRFS_BLOCK_GROUP_TYPE_MASK) &
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:3771:2: note: Taking false branch
           if (!((chunk_type & BTRFS_BLOCK_GROUP_TYPE_MASK) &
           ^
   fs/btrfs/volumes.c:3776:6: note: Assuming the condition is false
           if (chunk_type & BTRFS_BLOCK_GROUP_DATA)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:3776:2: note: Taking false branch
           if (chunk_type & BTRFS_BLOCK_GROUP_DATA)
           ^
   fs/btrfs/volumes.c:3778:11: note: Assuming the condition is false
           else if (chunk_type & BTRFS_BLOCK_GROUP_SYSTEM)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:3778:7: note: Taking false branch
           else if (chunk_type & BTRFS_BLOCK_GROUP_SYSTEM)
                ^
   fs/btrfs/volumes.c:3780:11: note: Assuming the condition is false
           else if (chunk_type & BTRFS_BLOCK_GROUP_METADATA)
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:3780:7: note: Taking false branch
           else if (chunk_type & BTRFS_BLOCK_GROUP_METADATA)
                ^
   fs/btrfs/volumes.c:3784:7: note: Access to field 'flags' results in a de=
reference of a null pointer (loaded from variable 'bargs')
           if ((bargs->flags & BTRFS_BALANCE_ARGS_PROFILES) &&
                ^~~~~
   fs/btrfs/volumes.c:4903:4: warning: Value stored to 'ret' is never read =
[clang-analyzer-deadcode.DeadStores]
                           ret =3D 0;
                           ^     ~
   fs/btrfs/volumes.c:4903:4: note: Value stored to 'ret' is never read
                           ret =3D 0;
                           ^     ~
>> fs/btrfs/volumes.c:6780:6: warning: Value stored to 'length' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           u32 length =3D bio->bi_iter.bi_size;
               ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6780:6: note: Value stored to 'length' during its ini=
tialization is never read
           u32 length =3D bio->bi_iter.bi_size;
               ^~~~~~   ~~~~~~~~~~~~~~~~~~~~
>> fs/btrfs/volumes.c:6781:7: warning: Value stored to 'metadata' during it=
s initialization is never read [clang-analyzer-deadcode.DeadStores]
           bool metadata =3D bio->bi_opf & REQ_META;
                ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6781:7: note: Value stored to 'metadata' during its i=
nitialization is never read
           bool metadata =3D bio->bi_opf & REQ_META;
                ^~~~~~~~   ~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6855:9: warning: Use of memory after it is freed [cla=
ng-analyzer-unix.Malloc]
                   dev =3D bioc->stripes[dev_nr].dev;
                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6821:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   fs/btrfs/volumes.c:6821:2: note: Taking false branch
           if (ret) {
           ^
   fs/btrfs/volumes.c:6832:7: note: Assuming the condition is false
           if ((bioc->map_type & BTRFS_BLOCK_GROUP_RAID56_MASK) &&
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6832:55: note: Left side of '&&' is false
           if ((bioc->map_type & BTRFS_BLOCK_GROUP_RAID56_MASK) &&
                                                                ^
   fs/btrfs/volumes.c:6847:6: note: Assuming 'map_length' is >=3D 'length'
           if (map_length < length) {
               ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6847:2: note: Taking false branch
           if (map_length < length) {
           ^
   fs/btrfs/volumes.c:6854:19: note: Assuming 'dev_nr' is < 'total_devs'
           for (dev_nr =3D 0; dev_nr < total_devs; dev_nr++) {
                            ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6854:2: note: Loop condition is true.  Entering loop =
body
           for (dev_nr =3D 0; dev_nr < total_devs; dev_nr++) {
           ^
   fs/btrfs/volumes.c:6856:7: note: Assuming 'dev' is null
                   if (!dev || !dev->bdev || test_bit(BTRFS_DEV_STATE_MISSI=
NG,
                       ^~~~
   fs/btrfs/volumes.c:6856:12: note: Left side of '||' is true
                   if (!dev || !dev->bdev || test_bit(BTRFS_DEV_STATE_MISSI=
NG,
                            ^
   fs/btrfs/volumes.c:6860:4: note: Calling 'bioc_error'
                           bioc_error(bioc, first_bio, logical);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6764:6: note: Assuming the condition is true
           if (atomic_dec_and_test(&bioc->stripes_pending)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6764:2: note: Taking true branch
           if (atomic_dec_and_test(&bioc->stripes_pending)) {
           ^
   fs/btrfs/volumes.c:6766:3: note: Taking false branch
                   WARN_ON(bio !=3D bioc->orig_bio);
                   ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   fs/btrfs/volumes.c:6770:7: note: Assuming the condition is false
                   if (atomic_read(&bioc->error) > bioc->max_errors)
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6770:3: note: Taking false branch
                   if (atomic_read(&bioc->error) > bioc->max_errors)
                   ^
   fs/btrfs/volumes.c:6774:3: note: Calling 'btrfs_end_bioc'
                   btrfs_end_bioc(bioc, bio);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6668:2: note: Calling 'btrfs_put_bioc'
           btrfs_put_bioc(bioc);
           ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:5947:7: note: 'bioc' is non-null
           if (!bioc)
                ^~~~
   fs/btrfs/volumes.c:5947:2: note: Taking false branch
           if (!bioc)
           ^
   fs/btrfs/volumes.c:5949:2: note: Taking true branch
           if (refcount_dec_and_test(&bioc->refs))
           ^
   fs/btrfs/volumes.c:5950:3: note: Memory is released
                   kfree(bioc);
                   ^~~~~~~~~~~
   fs/btrfs/volumes.c:6668:2: note: Returning; memory was released via 1st =
parameter
           btrfs_put_bioc(bioc);
           ^~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6774:3: note: Returning; memory was released via 1st =
parameter
                   btrfs_end_bioc(bioc, bio);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6860:4: note: Returning; memory was released via 1st =
parameter
                           bioc_error(bioc, first_bio, logical);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6861:4: note:  Execution continues on line 6854
                           continue;
                           ^
   fs/btrfs/volumes.c:6854:19: note: Assuming 'dev_nr' is < 'total_devs'
           for (dev_nr =3D 0; dev_nr < total_devs; dev_nr++) {
                            ^~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:6854:2: note: Loop condition is true.  Entering loop =
body
           for (dev_nr =3D 0; dev_nr < total_devs; dev_nr++) {
           ^
   fs/btrfs/volumes.c:6855:9: note: Use of memory after it is freed
                   dev =3D bioc->stripes[dev_nr].dev;
                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/volumes.c:8280:4: warning: Value stored to 'ret' is never read =
[clang-analyzer-deadcode.DeadStores]
                           ret =3D 0;

vim +/length +6780 fs/btrfs/volumes.c

de1ee92ac3bce4 Josef Bacik 2012-10-19  6777  =

879aebce4c7d6a Qu Wenruo   2022-01-21  6778  static void update_io_accounti=
ng(struct btrfs_fs_info *fs_info, struct bio *bio)
879aebce4c7d6a Qu Wenruo   2022-01-21  6779  {
879aebce4c7d6a Qu Wenruo   2022-01-21 @6780  	u32 length =3D bio->bi_iter.b=
i_size;
879aebce4c7d6a Qu Wenruo   2022-01-21 @6781  	bool metadata =3D bio->bi_opf=
 & REQ_META;
879aebce4c7d6a Qu Wenruo   2022-01-21  6782  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8996862954092058941==--

