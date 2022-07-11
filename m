Content-Type: multipart/mixed; boundary="===============3375695245584136204=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm-thin-metadata.c:950:7: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Mon, 11 Jul 2022 09:31:43 +0800
Message-ID: <202207110444.Bq2uzASc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3375695245584136204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/md/dm-thin-metadata.c:950:7: warning: Use of memory after it is fr=
eed [clang-analyzer-unix.Malloc]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   952c53cd357c71338a59d444933ed48a879229e1
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 months ago
config: riscv-randconfig-c006-20220707 (https://download.01.org/0day-ci/arc=
hive/20220711/202207110444.Bq2uzASc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 77a38f=
6839980bfac61babb40d83772c51427011)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De1edc277e6f6dfb372216522dfc57f9381c39e35
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1edc277e6f6dfb372216522dfc57f9381c39e35
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
            ^~~~
   drivers/interconnect/core.c:388:3: note: '?' condition is false
                   if (!data)
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/interconnect/core.c:388:3: note: Taking false branch
                   if (!data)
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/interconnect/core.c:485:13: note: Returning from 'of_icc_get_fro=
m_provider'
           dst_data =3D of_icc_get_from_provider(&dst_args);
                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/interconnect/core.c:487:2: note: '?' condition is false
           if (IS_ERR(dst_data)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/interconnect/core.c:487:2: note: '?' condition is false
           if (IS_ERR(dst_data)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/interconnect/core.c:487:2: note: Taking false branch
           if (IS_ERR(dst_data)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/interconnect/core.c:496:2: note: '?' condition is false
           if (IS_ERR(path)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/interconnect/core.c:496:2: note: '?' condition is false
           if (IS_ERR(path)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/interconnect/core.c:496:2: note: Taking false branch
           if (IS_ERR(path)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/interconnect/core.c:501:6: note: Assuming field 'tag' is not equ=
al to 0
           if (src_data->tag && src_data->tag =3D=3D dst_data->tag)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/interconnect/core.c:501:6: note: Left side of '&&' is true
           if (src_data->tag && src_data->tag =3D=3D dst_data->tag)
               ^
   drivers/interconnect/core.c:501:37: note: The right operand of '=3D=3D' =
is a garbage value
           if (src_data->tag && src_data->tag =3D=3D dst_data->tag)
                                              ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> drivers/md/dm-thin-metadata.c:950:7: warning: Use of memory after it is =
freed [clang-analyzer-unix.Malloc]
                   if (dm_pool_metadata_close(pmd) < 0)
                       ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/md/dm-thin-metadata.c:927:6: note: Assuming 'pmd' is non-null
           if (!pmd) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/md/dm-thin-metadata.c:927:2: note: '?' condition is false
           if (!pmd) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm-thin-metadata.c:927:7: note: 'pmd' is non-null
           if (!pmd) {
                ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/md/dm-thin-metadata.c:927:2: note: '?' condition is false
           if (!pmd) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/md/dm-thin-metadata.c:927:2: note: Taking false branch
           if (!pmd) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/md/dm-thin-metadata.c:932:2: note: Loop condition is false.  Exi=
ting loop
           init_rwsem(&pmd->root_lock);
           ^
   include/linux/rwsem.h:106:30: note: expanded from macro 'init_rwsem'
   #define init_rwsem(sem)                                         \
                                                                   ^
   drivers/md/dm-thin-metadata.c:943:2: note: '?' condition is false
           if (r) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/md/dm-thin-metadata.c:943:6: note: 'r' is 0
           if (r) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                           =
             ^~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   drivers/md/dm-thin-metadata.c:943:2: note: '?' condition is false
           if (r) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:69: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ^
   include/linux/compiler.h:69:2: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
           ^
   drivers/md/dm-thin-metadata.c:943:2: note: Taking false branch
           if (r) {

vim +950 drivers/md/dm-thin-metadata.c

3ab91828166895 Joe Thornber   2018-09-10  918  =

991d9fa02da0dd Joe Thornber   2011-10-31  919  struct dm_pool_metadata *dm_=
pool_metadata_open(struct block_device *bdev,
66b1edc05e3f4c Joe Thornber   2012-07-27  920  					       sector_t data_bl=
ock_size,
66b1edc05e3f4c Joe Thornber   2012-07-27  921  					       bool format_devi=
ce)
991d9fa02da0dd Joe Thornber   2011-10-31  922  {
991d9fa02da0dd Joe Thornber   2011-10-31  923  	int r;
991d9fa02da0dd Joe Thornber   2011-10-31  924  	struct dm_pool_metadata *pm=
d;
991d9fa02da0dd Joe Thornber   2011-10-31  925  =

991d9fa02da0dd Joe Thornber   2011-10-31  926  	pmd =3D kmalloc(sizeof(*pmd=
), GFP_KERNEL);
991d9fa02da0dd Joe Thornber   2011-10-31  927  	if (!pmd) {
991d9fa02da0dd Joe Thornber   2011-10-31  928  		DMERR("could not allocate =
metadata struct");
991d9fa02da0dd Joe Thornber   2011-10-31  929  		return ERR_PTR(-ENOMEM);
991d9fa02da0dd Joe Thornber   2011-10-31  930  	}
991d9fa02da0dd Joe Thornber   2011-10-31  931  =

6a0ebd31b6b504 Joe Thornber   2012-07-27  932  	init_rwsem(&pmd->root_lock);
6a0ebd31b6b504 Joe Thornber   2012-07-27  933  	pmd->time =3D 0;
6a0ebd31b6b504 Joe Thornber   2012-07-27  934  	INIT_LIST_HEAD(&pmd->thin_d=
evices);
da105ed5fd7edc Joe Thornber   2012-07-27  935  	pmd->fail_io =3D false;
873f258becca87 Mike Snitzer   2019-04-18  936  	pmd->in_service =3D false;
332627db00a982 Joe Thornber   2012-07-27  937  	pmd->bdev =3D bdev;
9cb6653f9a515f Joe Thornber   2012-07-27  938  	pmd->data_block_size =3D da=
ta_block_size;
ecda7c0280e6b3 Nikos Tsironis 2019-12-04  939  	pmd->pre_commit_fn =3D NULL;
ecda7c0280e6b3 Nikos Tsironis 2019-12-04  940  	pmd->pre_commit_context =3D=
 NULL;
991d9fa02da0dd Joe Thornber   2011-10-31  941  =

66b1edc05e3f4c Joe Thornber   2012-07-27  942  	r =3D __create_persistent_d=
ata_objects(pmd, format_device);
991d9fa02da0dd Joe Thornber   2011-10-31  943  	if (r) {
991d9fa02da0dd Joe Thornber   2011-10-31  944  		kfree(pmd);
991d9fa02da0dd Joe Thornber   2011-10-31  945  		return ERR_PTR(r);
991d9fa02da0dd Joe Thornber   2011-10-31  946  	}
991d9fa02da0dd Joe Thornber   2011-10-31  947  =

991d9fa02da0dd Joe Thornber   2011-10-31  948  	r =3D __begin_transaction(p=
md);
991d9fa02da0dd Joe Thornber   2011-10-31  949  	if (r < 0) {
9cb6653f9a515f Joe Thornber   2012-07-27 @950  		if (dm_pool_metadata_close=
(pmd) < 0)
9cb6653f9a515f Joe Thornber   2012-07-27  951  			DMWARN("%s: dm_pool_metad=
ata_close() failed.", __func__);
9cb6653f9a515f Joe Thornber   2012-07-27  952  		return ERR_PTR(r);
991d9fa02da0dd Joe Thornber   2011-10-31  953  	}
991d9fa02da0dd Joe Thornber   2011-10-31  954  =

3ab91828166895 Joe Thornber   2018-09-10  955  	__set_metadata_reserve(pmd);
3ab91828166895 Joe Thornber   2018-09-10  956  =

991d9fa02da0dd Joe Thornber   2011-10-31  957  	return pmd;
991d9fa02da0dd Joe Thornber   2011-10-31  958  }
991d9fa02da0dd Joe Thornber   2011-10-31  959  =


:::::: The code@line 950 was first introduced by commit
:::::: 9cb6653f9a515f6cb0eaabfb27a2204b0aaf4e48 dm thin metadata: factor ou=
t __write_initial_superblock

:::::: TO: Joe Thornber <ejt@redhat.com>
:::::: CC: Alasdair G Kergon <agk@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3375695245584136204==--

