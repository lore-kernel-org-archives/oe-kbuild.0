Content-Type: multipart/mixed; boundary="===============6684165237192815441=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/md/dm-thin-metadata.c:950:7: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Tue, 11 Jan 2022 05:24:16 +0800
Message-ID: <202201110532.YLuoFQMK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6684165237192815441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   133d9c53c9dcbb1b8f317e402e79c44d9eb725c9
commit: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: swit=
ch to static_assert
date:   9 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 weeks ago
config: riscv-randconfig-c006-20220109 (https://download.01.org/0day-ci/arc=
hive/20220111/202201110532.YLuoFQMK-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344=
d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De1edc277e6f6dfb372216522dfc57f9381c39e35
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e1edc277e6f6dfb372216522dfc57f9381c39e35
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                  ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:48:68: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
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
   drivers/virtio/virtio_ring.c:1215:2: note: '?' condition is false
           BUG_ON(id =3D=3D vq->packed.vring.num);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
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
   drivers/virtio/virtio_ring.c:1215:2: note: Taking false branch
           BUG_ON(id =3D=3D vq->packed.vring.num);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/virtio/virtio_ring.c:1215:2: note: Loop condition is false.  Exi=
ting loop
           BUG_ON(id =3D=3D vq->packed.vring.num);
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   drivers/virtio/virtio_ring.c:1219:14: note: Assuming the condition is fa=
lse
           for (n =3D 0; n < out_sgs + in_sgs; n++) {
                       ^~~~~~~~~~~~~~~~~~~~
   drivers/virtio/virtio_ring.c:1219:2: note: Loop condition is false. Exec=
ution continues on line 1256
           for (n =3D 0; n < out_sgs + in_sgs; n++) {
           ^
   drivers/virtio/virtio_ring.c:1256:2: note: '?' condition is false
           if (i < head)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/virtio/virtio_ring.c:1256:6: note: 'i' is >=3D 'head'
           if (i < head)
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
   drivers/virtio/virtio_ring.c:1256:2: note: '?' condition is false
           if (i < head)
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
   drivers/virtio/virtio_ring.c:1256:2: note: Taking false branch
           if (i < head)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/virtio/virtio_ring.c:1278:36: note: Assigned value is garbage or=
 undefined
           vq->packed.vring.desc[head].flags =3D head_flags;
                                             ^ ~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6684165237192815441==--

