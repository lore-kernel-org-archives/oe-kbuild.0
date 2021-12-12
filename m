Content-Type: multipart/mixed; boundary="===============8030948391799947981=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5993/6579] fs/ext4/super.c:5649:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 12 Dec 2021 09:08:47 +0800
Message-ID: <202112120915.2vuv8pWx-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8030948391799947981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Lukas Czerner <lczerner@redhat.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Carlos Maiolino <cmaiolino@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ea922272cbe547bdf58da2aaf240d59782c6a009
commit: cebe85d570cf84804e848332d6721bc9e5300e07 [5993/6579] ext4: switch t=
o the new mount api
:::::: branch date: 28 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-c001-20211210 (https://download.01.org/0day-ci/arch=
ive/20211212/202112120915.2vuv8pWx-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 097a1c=
b1d5ebb3a0ec4bcaed8ba3ff6a8e33c00a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dcebe85d570cf84804e848332d6721bc9e5300e07
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout cebe85d570cf84804e848332d6721bc9e5300e07
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/char/ipmi/ipmi_msghandler.c:4927:4: note: Calling 'kref_put'
                           kref_put(&intf->refcount, intf_free);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kref.h:64:2: note: Assuming the condition is false
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   include/linux/kref.h:64:2: note: '?' condition is false
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   include/linux/kref.h:64:2: note: Assuming the condition is false
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   include/linux/kref.h:64:2: note: '?' condition is true
           if (refcount_dec_and_test(&kref->refcount)) {
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
   include/linux/kref.h:64:2: note: Taking true branch
           if (refcount_dec_and_test(&kref->refcount)) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   include/linux/kref.h:65:3: note: Calling 'intf_free'
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:718:2: note: Memory is released
           kfree(intf);
           ^~~~~~~~~~~
   include/linux/kref.h:65:3: note: Returning; memory was released
                   release(kref);
                   ^~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:4927:4: note: Returning; memory was =
released
                           kref_put(&intf->refcount, intf_free);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/char/ipmi/ipmi_msghandler.c:4938:2: note: Calling 'spinlock_chec=
k'
           spin_lock_irqsave(&intf->seq_lock, flags);
           ^
   include/linux/spinlock.h:379:24: note: expanded from macro 'spin_lock_ir=
qsave'
           raw_spin_lock_irqsave(spinlock_check(lock), flags);     \
           ~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:242:34: note: expanded from macro 'raw_spin_loc=
k_irqsave'
                   flags =3D _raw_spin_lock_irqsave(lock);   \
                                                  ^~~~
   include/linux/spinlock.h:324:2: note: Use of memory after it is freed
           return &lock->rlock;
           ^      ~~~~~~~~~~~~
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/ext4/resize.c:383:3: warning: Value stored to 'group' is never read [=
clang-analyzer-deadcode.DeadStores]
                   group =3D group_data[0].group;
                   ^       ~~~~~~~~~~~~~~~~~~~
   fs/ext4/resize.c:383:3: note: Value stored to 'group' is never read
                   group =3D group_data[0].group;
                   ^       ~~~~~~~~~~~~~~~~~~~
   fs/ext4/resize.c:449:7: warning: Value stored to 'count2' is never read =
[clang-analyzer-deadcode.DeadStores]
           for (count2 =3D count; count > 0;
                ^        ~~~~~
   fs/ext4/resize.c:449:7: note: Value stored to 'count2' is never read
           for (count2 =3D count; count > 0;
                ^        ~~~~~
   fs/ext4/resize.c:1929:3: warning: Value stored to 'err' is never read [c=
lang-analyzer-deadcode.DeadStores]
                   err =3D ret;
                   ^     ~~~
   fs/ext4/resize.c:1929:3: note: Value stored to 'err' is never read
                   err =3D ret;
                   ^     ~~~
   7 warnings generated.
>> fs/ext4/super.c:5649:3: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   fs/ext4/super.c:5649:3: note: Value stored to 'ret' is never read
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   Suppressed 6 warnings (2 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   fs/ext4/fast_commit.c:684:29: warning: Access to field 'b_data' results =
in a dereference of a null pointer (loaded from field 's_fc_bh') [clang-ana=
lyzer-core.NullDereference]
           tl =3D (struct ext4_fc_tl *)(sbi->s_fc_bh->b_data + off);
                                      ^
   fs/ext4/fast_commit.c:1145:6: note: Assuming the condition is false
           if (!test_opt2(sb, JOURNAL_FAST_COMMIT) ||
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/fast_commit.c:1145:6: note: Left side of '||' is false
           if (!test_opt2(sb, JOURNAL_FAST_COMMIT) ||
               ^
   fs/ext4/fast_commit.c:1145:2: note: '?' condition is false
           if (!test_opt2(sb, JOURNAL_FAST_COMMIT) ||
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/fast_commit.c:1145:6: note: Left side of '||' is false
           if (!test_opt2(sb, JOURNAL_FAST_COMMIT) ||
               ^
   fs/ext4/fast_commit.c:1145:2: note: Assuming the condition is true
           if (!test_opt2(sb, JOURNAL_FAST_COMMIT) ||
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:86: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                                       ~~~~=
~~~~~~~~~~~~~^~~~~
   include/linux/compiler.h:69:3: note: expanded from macro '__trace_if_val=
ue'
           (cond) ?                                        \
            ^~~~
   fs/ext4/fast_commit.c:1145:2: note: '?' condition is false
           if (!test_opt2(sb, JOURNAL_FAST_COMMIT) ||
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
   fs/ext4/fast_commit.c:1145:2: note: Taking false branch
           if (!test_opt2(sb, JOURNAL_FAST_COMMIT) ||
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/fast_commit.c:1153:6: note: Assuming the condition is false
           if (ret =3D=3D -EALREADY) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/fast_commit.c:1153:2: note: '?' condition is false
           if (ret =3D=3D -EALREADY) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/fast_commit.c:1153:2: note: '?' condition is false
           if (ret =3D=3D -EALREADY) {
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
   fs/ext4/fast_commit.c:1153:2: note: Taking false branch
           if (ret =3D=3D -EALREADY) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +/ret +5649 fs/ext4/super.c

ac27a0ec112a08 Dave Kleikamp 2006-10-11  5639  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5640  static int ext4_fill_super(s=
truct super_block *sb, struct fs_context *fc)
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5641  {
cebe85d570cf84 Lukas Czerner 2021-10-27  5642  	struct ext4_fs_context *ctx=
 =3D fc->fs_private;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5643  	struct ext4_sb_info *sbi;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5644  	const char *descr;
cebe85d570cf84 Lukas Czerner 2021-10-27  5645  	int ret;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5646  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5647  	sbi =3D ext4_alloc_sbi(sb);
cebe85d570cf84 Lukas Czerner 2021-10-27  5648  	if (!sbi)
7edfd85b1ffd36 Lukas Czerner 2021-10-27 @5649  		ret =3D -ENOMEM;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5650  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5651  	fc->s_fs_info =3D sbi;
cebe85d570cf84 Lukas Czerner 2021-10-27  5652  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5653  	/* Cleanup superblock name =
*/
cebe85d570cf84 Lukas Czerner 2021-10-27  5654  	strreplace(sb->s_id, '/', '=
!');
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5655  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5656  	sbi->s_sb_block =3D 1;	/* D=
efault super block location */
cebe85d570cf84 Lukas Czerner 2021-10-27  5657  	if (ctx->spec & EXT4_SPEC_s=
_sb_block)
cebe85d570cf84 Lukas Czerner 2021-10-27  5658  		sbi->s_sb_block =3D ctx->s=
_sb_block;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5659  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5660  	ret =3D __ext4_fill_super(f=
c, sb, fc->sb_flags & SB_SILENT);
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5661  	if (ret < 0)
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5662  		goto free_sbi;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5663  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5664  	if (sbi->s_journal) {
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5665  		if (test_opt(sb, DATA_FLAG=
S) =3D=3D EXT4_MOUNT_JOURNAL_DATA)
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5666  			descr =3D " journalled da=
ta mode";
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5667  		else if (test_opt(sb, DATA=
_FLAGS) =3D=3D EXT4_MOUNT_ORDERED_DATA)
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5668  			descr =3D " ordered data =
mode";
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5669  		else
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5670  			descr =3D " writeback dat=
a mode";
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5671  	} else
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5672  		descr =3D "out journal";
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5673  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5674  	if (___ratelimit(&ext4_moun=
t_msg_ratelimit, "EXT4-fs mount"))
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5675  		ext4_msg(sb, KERN_INFO, "m=
ounted filesystem with%s. "
cebe85d570cf84 Lukas Czerner 2021-10-27  5676  			 "Quota mode: %s.", descr=
, ext4_quota_mode(sb));
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5677  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5678  	return 0;
cebe85d570cf84 Lukas Czerner 2021-10-27  5679  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5680  free_sbi:
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5681  	ext4_free_sbi(sbi);
cebe85d570cf84 Lukas Czerner 2021-10-27  5682  	fc->s_fs_info =3D NULL;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5683  	return ret;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5684  }
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5685  =


:::::: The code at line 5649 was first introduced by commit
:::::: 7edfd85b1ffd36593011dec96ab395912a340418 ext4: Completely separate o=
ptions parsing and sb setup

:::::: TO: Lukas Czerner <lczerner@redhat.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8030948391799947981==--

