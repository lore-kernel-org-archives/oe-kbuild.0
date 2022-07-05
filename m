Content-Type: multipart/mixed; boundary="===============6610416527568415344=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/trace/events/ext4.h:1820:1: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Tue, 05 Jul 2022 12:09:09 +0800
Message-ID: <202207051222.G2bplCnH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6610416527568415344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/trace/events/ext4.h:1820:1: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Wang Jianchao <wangjianchao@kuaishou.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Andreas Dilger <adilger@dilger.ca>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c1084b6c5620a743f86947caca66d90f24060f56
commit: 6920b3913235f517728bb69abe9b39047a987113 ext4: add new helper inter=
face ext4_try_to_trim_range()
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-c005-20220702 (https://download.01.org/0day-ci/arch=
ive/20220705/202207051222.G2bplCnH-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 5d7876=
89b14574fe58ba9798563f4a6df6059fbf)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D6920b3913235f517728bb69abe9b39047a987113
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 6920b3913235f517728bb69abe9b39047a987113
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/ext4/mballoc.c:6375:7: note: Assuming the condition is true
                   if (unlikely(EXT4_MB_GRP_NEED_INIT(grp))) {
                       ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/ext4/mballoc.c:6375:3: note: Taking false branch
                   if (unlikely(EXT4_MB_GRP_NEED_INIT(grp))) {
                   ^
   fs/ext4/mballoc.c:6387:7: note: Assuming 'group' is not equal to 'last_g=
roup'
                   if (group =3D=3D last_group)
                       ^~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6387:3: note: Taking false branch
                   if (group =3D=3D last_group)
                   ^
   fs/ext4/mballoc.c:6390:7: note: Assuming 'minlen' is > field 'bb_free'
                   if (grp->bb_free >=3D minlen) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6390:3: note: Taking false branch
                   if (grp->bb_free >=3D minlen) {
                   ^
   fs/ext4/mballoc.c:6372:28: note: Assuming 'group' is <=3D 'last_group'
           for (group =3D first_group; group <=3D last_group; group++) {
                                     ^~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6372:2: note: Loop condition is true.  Entering loop b=
ody
           for (group =3D first_group; group <=3D last_group; group++) {
           ^
   fs/ext4/mballoc.c:6375:7: note: Assuming the condition is true
                   if (unlikely(EXT4_MB_GRP_NEED_INIT(grp))) {
                       ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/ext4/mballoc.c:6375:3: note: Taking false branch
                   if (unlikely(EXT4_MB_GRP_NEED_INIT(grp))) {
                   ^
   fs/ext4/mballoc.c:6387:7: note: Assuming 'group' is not equal to 'last_g=
roup'
                   if (group =3D=3D last_group)
                       ^~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6387:3: note: Taking false branch
                   if (group =3D=3D last_group)
                   ^
   fs/ext4/mballoc.c:6390:7: note: Assuming 'minlen' is <=3D field 'bb_free'
                   if (grp->bb_free >=3D minlen) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6390:3: note: Taking true branch
                   if (grp->bb_free >=3D minlen) {
                   ^
   fs/ext4/mballoc.c:6391:10: note: Calling 'ext4_trim_all_free'
                           cnt =3D ext4_trim_all_free(sb, group, first_clus=
ter,
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   fs/ext4/mballoc.c:6298:6: note: Assuming 'ret' is 0
           if (ret) {
               ^~~
   fs/ext4/mballoc.c:6298:2: note: Taking false branch
           if (ret) {
           ^
   fs/ext4/mballoc.c:6306:6: note: Assuming the condition is true
           if (!EXT4_MB_GRP_WAS_TRIMMED(e4b.bd_info) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6306:44: note: Left side of '||' is true
           if (!EXT4_MB_GRP_WAS_TRIMMED(e4b.bd_info) ||
                                                     ^
   fs/ext4/mballoc.c:6308:9: note: Calling 'ext4_try_to_trim_range'
                   ret =3D ext4_try_to_trim_range(sb, &e4b, start, max, min=
blocks);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   fs/ext4/mballoc.c:6230:11: note: Assuming 'start' is >=3D field 'bb_firs=
t_free'
           start =3D (e4b->bd_info->bb_first_free > start) ?
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6230:10: note: '?' condition is false
           start =3D (e4b->bd_info->bb_first_free > start) ?
                   ^
   fs/ext4/mballoc.c:6235:9: note: Assuming 'start' is <=3D 'max'
           while (start <=3D max) {
                  ^~~~~~~~~~~~
   fs/ext4/mballoc.c:6235:2: note: Loop condition is true.  Entering loop b=
ody
           while (start <=3D max) {
           ^
   fs/ext4/mballoc.c:6237:7: note: Assuming 'start' is <=3D 'max'
                   if (start > max)
                       ^~~~~~~~~~~
   fs/ext4/mballoc.c:6237:3: note: Taking false branch
                   if (start > max)
                   ^
   fs/ext4/mballoc.c:6241:7: note: Assuming the condition is false
                   if ((next - start) >=3D minblocks) {
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6241:3: note: Taking false branch
                   if ((next - start) >=3D minblocks) {
                   ^
   fs/ext4/mballoc.c:6251:28: note: Dereference of null pointer
                   if (fatal_signal_pending(current)) {
                                            ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:200:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> include/trace/events/ext4.h:1820:1: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
   DEFINE_EVENT(ext4__trim, ext4_trim_extent,
   ^
   include/linux/tracepoint.h:542:2: note: expanded from macro 'DEFINE_EVEN=
T'
           DECLARE_TRACE(name, PARAMS(proto), PARAMS(args))
           ^
   include/linux/tracepoint.h:420:15: note: expanded from macro 'DECLARE_TR=
ACE'
                           cpu_online(raw_smp_processor_id()),             \
                                      ^
   arch/s390/include/asm/smp.h:15:32: note: expanded from macro 'raw_smp_pr=
ocessor_id'
   #define raw_smp_processor_id()  (S390_lowcore.cpu_nr)
                                   ^
   fs/ext4/mballoc.c:6352:6: note: Assuming 'minlen' is <=3D field 's_clust=
ers_per_group'
           if (minlen > EXT4_CLUSTERS_PER_GROUP(sb) ||
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6352:6: note: Left side of '||' is false
   fs/ext4/mballoc.c:6353:6: note: Assuming 'start' is < 'max_blks'
               start >=3D max_blks ||
               ^~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6352:6: note: Left side of '||' is false
           if (minlen > EXT4_CLUSTERS_PER_GROUP(sb) ||
               ^
   fs/ext4/mballoc.c:6354:6: note: Assuming field 'len' is >=3D field 's_bl=
ocksize'
               range->len < sb->s_blocksize)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6352:2: note: Taking false branch
           if (minlen > EXT4_CLUSTERS_PER_GROUP(sb) ||
           ^
   fs/ext4/mballoc.c:6356:6: note: Assuming 'end' is < 'max_blks'
           if (end >=3D max_blks)
               ^~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6356:2: note: Taking false branch
           if (end >=3D max_blks)
           ^
   fs/ext4/mballoc.c:6358:6: note: Assuming 'end' is > 'first_data_blk'
           if (end <=3D first_data_blk)
               ^~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6358:2: note: Taking false branch
           if (end <=3D first_data_blk)
           ^
   fs/ext4/mballoc.c:6360:6: note: Assuming 'start' is >=3D 'first_data_blk'
           if (start < first_data_blk)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6360:2: note: Taking false branch
           if (start < first_data_blk)
           ^
   fs/ext4/mballoc.c:6372:28: note: Assuming 'group' is <=3D 'last_group'
           for (group =3D first_group; group <=3D last_group; group++) {
                                     ^~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6372:2: note: Loop condition is true.  Entering loop b=
ody
           for (group =3D first_group; group <=3D last_group; group++) {
           ^
   fs/ext4/mballoc.c:6375:7: note: Assuming the condition is true
                   if (unlikely(EXT4_MB_GRP_NEED_INIT(grp))) {
                       ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/ext4/mballoc.c:6375:3: note: Taking false branch
                   if (unlikely(EXT4_MB_GRP_NEED_INIT(grp))) {
                   ^
   fs/ext4/mballoc.c:6387:7: note: Assuming 'group' is not equal to 'last_g=
roup'
                   if (group =3D=3D last_group)
                       ^~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6387:3: note: Taking false branch
                   if (group =3D=3D last_group)
                   ^
   fs/ext4/mballoc.c:6390:7: note: Assuming 'minlen' is > field 'bb_free'
                   if (grp->bb_free >=3D minlen) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6390:3: note: Taking false branch
                   if (grp->bb_free >=3D minlen) {
                   ^
   fs/ext4/mballoc.c:6372:28: note: Assuming 'group' is <=3D 'last_group'
           for (group =3D first_group; group <=3D last_group; group++) {
                                     ^~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6372:2: note: Loop condition is true.  Entering loop b=
ody
           for (group =3D first_group; group <=3D last_group; group++) {
           ^
   fs/ext4/mballoc.c:6375:7: note: Assuming the condition is true
                   if (unlikely(EXT4_MB_GRP_NEED_INIT(grp))) {
                       ^
   include/linux/compiler.h:78:40: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                             ^~~~
   fs/ext4/mballoc.c:6375:3: note: Taking false branch
                   if (unlikely(EXT4_MB_GRP_NEED_INIT(grp))) {
                   ^
   fs/ext4/mballoc.c:6387:7: note: Assuming 'group' is not equal to 'last_g=
roup'
                   if (group =3D=3D last_group)
                       ^~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6387:3: note: Taking false branch
                   if (group =3D=3D last_group)
                   ^
   fs/ext4/mballoc.c:6390:7: note: Assuming 'minlen' is > field 'bb_free'
                   if (grp->bb_free >=3D minlen) {
                       ^~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/mballoc.c:6390:3: note: Taking false branch
                   if (grp->bb_free >=3D minlen) {
                   ^
   fs/ext4/mballoc.c:6372:28: note: Assuming 'group' is <=3D 'last_group'

vim +1820 include/trace/events/ext4.h

b3d4c2b10b68d2 Tao Ma 2011-07-11  1819  =

b3d4c2b10b68d2 Tao Ma 2011-07-11 @1820  DEFINE_EVENT(ext4__trim, ext4_trim_=
extent,
b3d4c2b10b68d2 Tao Ma 2011-07-11  1821  =

b3d4c2b10b68d2 Tao Ma 2011-07-11  1822  	TP_PROTO(struct super_block *sb,
b3d4c2b10b68d2 Tao Ma 2011-07-11  1823  		 ext4_group_t group,
b3d4c2b10b68d2 Tao Ma 2011-07-11  1824  		 ext4_grpblk_t start,
b3d4c2b10b68d2 Tao Ma 2011-07-11  1825  		 ext4_grpblk_t len),
b3d4c2b10b68d2 Tao Ma 2011-07-11  1826  =

b3d4c2b10b68d2 Tao Ma 2011-07-11  1827  	TP_ARGS(sb, group, start, len)
b3d4c2b10b68d2 Tao Ma 2011-07-11  1828  );
b3d4c2b10b68d2 Tao Ma 2011-07-11  1829  =


:::::: The code@line 1820 was first introduced by commit
:::::: b3d4c2b10b68d205d3eb1b5c17dcb4649a502798 ext4: Add new ext4 trim tra=
cepoints

:::::: TO: Tao Ma <boyu.mt@taobao.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6610416527568415344==--

