Content-Type: multipart/mixed; boundary="===============3213737617545609618=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: security/selinux/ss/services.c:1563:17: warning: Null pointer passed as 1st argument to string length function [clang-analyzer-unix.cstring.NullArg]
Date: Thu, 24 Feb 2022 18:54:32 +0800
Message-ID: <202202241853.8nKl7Hpc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3213737617545609618==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ondrej Mosnacek <omosnace@redhat.com>
CC: Paul Moore <paul@paul-moore.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23d04328444a8fa0ca060c5e532220dac8e8bc26
commit: 9ad6e9cb39c66366bf7b9aece114aca277981a1f selinux: fix race between =
old and new sidtab
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: riscv-randconfig-c006-20220224 (https://download.01.org/0day-ci/arc=
hive/20220224/202202241853.8nKl7Hpc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D9ad6e9cb39c66366bf7b9aece114aca277981a1f
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 9ad6e9cb39c66366bf7b9aece114aca277981a1f
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/btrfs/compression.c:999:14: note: Calling 'alloc_workspace'
           workspace =3D alloc_workspace(type, level);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:875:2: note: Control jumps to 'case BTRFS_COMPRES=
S_NONE:'  at line 876
           switch (type) {
           ^
   fs/btrfs/compression.c:876:35: note: Calling 'alloc_heuristic_ws'
           case BTRFS_COMPRESS_NONE: return alloc_heuristic_ws(level);
                                            ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:838:7: note: Calling 'kzalloc'
           ws =3D kzalloc(sizeof(*ws), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/slab.h:682:9: note: Uninitialized value stored to field 'b=
ucket_b'
           return kmalloc(size, flags | __GFP_ZERO);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:838:7: note: Returning from 'kzalloc'
           ws =3D kzalloc(sizeof(*ws), GFP_KERNEL);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:839:6: note: Assuming 'ws' is non-null
           if (!ws)
               ^~~
   fs/btrfs/compression.c:839:2: note: Taking false branch
           if (!ws)
           ^
   fs/btrfs/compression.c:843:6: note: Assuming field 'sample' is non-null
           if (!ws->sample)
               ^~~~~~~~~~~
   fs/btrfs/compression.c:843:2: note: Taking false branch
           if (!ws->sample)
           ^
   fs/btrfs/compression.c:847:6: note: Assuming field 'bucket' is null
           if (!ws->bucket)
               ^~~~~~~~~~~
   fs/btrfs/compression.c:847:2: note: Taking true branch
           if (!ws->bucket)
           ^
   fs/btrfs/compression.c:848:3: note: Control jumps to line 857
                   goto fail;
                   ^
   fs/btrfs/compression.c:857:2: note: Calling 'free_heuristic_ws'
           free_heuristic_ws(&ws->list);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/compression.c:826:14: note: Left side of '&&' is false
           workspace =3D list_entry(ws, struct heuristic_ws, list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   fs/btrfs/compression.c:826:14: note: Taking false branch
           workspace =3D list_entry(ws, struct heuristic_ws, list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   fs/btrfs/compression.c:826:14: note: Loop condition is false.  Exiting l=
oop
           workspace =3D list_entry(ws, struct heuristic_ws, list);
                       ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:694:2: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
           ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
   #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                       ^
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   fs/btrfs/compression.c:830:2: note: 1st function call argument is an uni=
nitialized value
           kfree(workspace->bucket_b);
           ^     ~~~~~~~~~~~~~~~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   19 warnings generated.
>> security/selinux/ss/services.c:1563:17: warning: Null pointer passed as =
1st argument to string length function [clang-analyzer-unix.cstring.NullArg]
                   context.len =3D strlen(str) + 1;
                                 ^
   security/selinux/ss/services.c:1643:9: note: Calling 'security_context_t=
o_sid_core'
           return security_context_to_sid_core(state, scontext, scontext_le=
n,
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
   security/selinux/ss/services.c:1523:6: note: Assuming 'scontext_len' is =
not equal to 0
           if (!scontext_len)
               ^~~~~~~~~~~~~
   security/selinux/ss/services.c:1523:2: note: Taking false branch
           if (!scontext_len)
           ^
   security/selinux/ss/services.c:1528:6: note: Assuming 'scontext2' is non=
-null
           if (!scontext2)
               ^~~~~~~~~~
   security/selinux/ss/services.c:1528:2: note: Taking false branch
           if (!scontext2)
           ^
   security/selinux/ss/services.c:1531:7: note: Calling 'selinux_initialize=
d'
           if (!selinux_initialized(state)) {
                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   security/selinux/include/security.h:116:9: note: Left side of '||' is tr=
ue
           return smp_load_acquire(&state->initialized);
                  ^
   include/asm-generic/barrier.h:142:29: note: expanded from macro 'smp_loa=
d_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/riscv/include/asm/barrier.h:39:21: note: expanded from macro '__smp=
_load_acquire'
           typeof(*p) ___p1 =3D READ_ONCE(*p);                             =
  \
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:288:29: note: expanded from macro '__nati=
ve_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
                                      ^
   security/selinux/include/security.h:116:9: note: Taking false branch
           return smp_load_acquire(&state->initialized);
                  ^
   include/asm-generic/barrier.h:142:29: note: expanded from macro 'smp_loa=
d_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/riscv/include/asm/barrier.h:39:21: note: expanded from macro '__smp=
_load_acquire'
           typeof(*p) ___p1 =3D READ_ONCE(*p);                             =
  \
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   security/selinux/include/security.h:116:9: note: Loop condition is false=
.  Exiting loop
           return smp_load_acquire(&state->initialized);
                  ^
   include/asm-generic/barrier.h:142:29: note: expanded from macro 'smp_loa=
d_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/riscv/include/asm/barrier.h:39:21: note: expanded from macro '__smp=
_load_acquire'
           typeof(*p) ___p1 =3D READ_ONCE(*p);                             =
  \
                              ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   note: (skipping 1 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:326:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:314:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:304:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   security/selinux/include/security.h:116:9: note: Left side of '||' is tr=
ue
           return smp_load_acquire(&state->initialized);
                  ^
   include/asm-generic/barrier.h:142:29: note: expanded from macro 'smp_loa=
d_acquire'
   #define smp_load_acquire(p) __smp_load_acquire(p)
                               ^
   arch/riscv/include/asm/barrier.h:40:2: note: expanded from macro '__smp_=
load_acquire'
           compiletime_assert_atomic_type(*p);                             \
           ^
   include/linux/compiler_types.h:329:21: note: expanded from macro 'compil=
etime_assert_atomic_type'
           compiletime_assert(__native_word(t),                            \
                              ^
   include/linux/compiler_types.h:288:29: note: expanded from macro '__nati=
ve_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
                                      ^
   security/selinux/include/security.h:116:9: note: Taking false branch
           return smp_load_acquire(&state->initialized);
                  ^

vim +1563 security/selinux/ss/services.c

12b29f34558b9b Stephen Smalley 2008-05-07  1509  =

aa8e712cee93d5 Stephen Smalley 2018-03-01  1510  static int security_contex=
t_to_sid_core(struct selinux_state *state,
aa8e712cee93d5 Stephen Smalley 2018-03-01  1511  					const char *scontext,=
 u32 scontext_len,
12b29f34558b9b Stephen Smalley 2008-05-07  1512  					u32 *sid, u32 def_sid=
, gfp_t gfp_flags,
12b29f34558b9b Stephen Smalley 2008-05-07  1513  					int force)
12b29f34558b9b Stephen Smalley 2008-05-07  1514  {
1b8b31a2e6120b Stephen Smalley 2020-08-19  1515  	struct selinux_policy *po=
licy;
aa8e712cee93d5 Stephen Smalley 2018-03-01  1516  	struct policydb *policydb;
aa8e712cee93d5 Stephen Smalley 2018-03-01  1517  	struct sidtab *sidtab;
9a59daa03df725 Stephen Smalley 2008-05-14  1518  	char *scontext2, *str =3D=
 NULL;
12b29f34558b9b Stephen Smalley 2008-05-07  1519  	struct context context;
12b29f34558b9b Stephen Smalley 2008-05-07  1520  	int rc =3D 0;
12b29f34558b9b Stephen Smalley 2008-05-07  1521  =

2172fa709ab32c Stephen Smalley 2014-01-30  1522  	/* An empty security cont=
ext is never valid. */
2172fa709ab32c Stephen Smalley 2014-01-30  1523  	if (!scontext_len)
2172fa709ab32c Stephen Smalley 2014-01-30  1524  		return -EINVAL;
2172fa709ab32c Stephen Smalley 2014-01-30  1525  =

ef28df55ac27e1 Paul Moore      2017-11-28  1526  	/* Copy the string to all=
ow changes and ensure a NUL terminator */
ef28df55ac27e1 Paul Moore      2017-11-28  1527  	scontext2 =3D kmemdup_nul=
(scontext, scontext_len, gfp_flags);
ef28df55ac27e1 Paul Moore      2017-11-28  1528  	if (!scontext2)
ef28df55ac27e1 Paul Moore      2017-11-28  1529  		return -ENOMEM;
ef28df55ac27e1 Paul Moore      2017-11-28  1530  =

65cddd50980be8 Ondrej Mosnacek 2020-01-07  1531  	if (!selinux_initialized(=
state)) {
12b29f34558b9b Stephen Smalley 2008-05-07  1532  		int i;
12b29f34558b9b Stephen Smalley 2008-05-07  1533  =

12b29f34558b9b Stephen Smalley 2008-05-07  1534  		for (i =3D 1; i < SECINI=
TSID_NUM; i++) {
e3e0b582c321ae Stephen Smalley 2020-02-24  1535  			const char *s =3D initi=
al_sid_to_string[i];
e3e0b582c321ae Stephen Smalley 2020-02-24  1536  =

e3e0b582c321ae Stephen Smalley 2020-02-24  1537  			if (s && !strcmp(s, sco=
ntext2)) {
12b29f34558b9b Stephen Smalley 2008-05-07  1538  				*sid =3D i;
ef28df55ac27e1 Paul Moore      2017-11-28  1539  				goto out;
12b29f34558b9b Stephen Smalley 2008-05-07  1540  			}
12b29f34558b9b Stephen Smalley 2008-05-07  1541  		}
12b29f34558b9b Stephen Smalley 2008-05-07  1542  		*sid =3D SECINITSID_KERN=
EL;
ef28df55ac27e1 Paul Moore      2017-11-28  1543  		goto out;
12b29f34558b9b Stephen Smalley 2008-05-07  1544  	}
12b29f34558b9b Stephen Smalley 2008-05-07  1545  	*sid =3D SECSID_NULL;
12b29f34558b9b Stephen Smalley 2008-05-07  1546  =

9a59daa03df725 Stephen Smalley 2008-05-14  1547  	if (force) {
9a59daa03df725 Stephen Smalley 2008-05-14  1548  		/* Save another copy for=
 storing in uninterpreted form */
4b02b524487622 Eric Paris      2010-11-23  1549  		rc =3D -ENOMEM;
9a59daa03df725 Stephen Smalley 2008-05-14  1550  		str =3D kstrdup(scontext=
2, gfp_flags);
4b02b524487622 Eric Paris      2010-11-23  1551  		if (!str)
4b02b524487622 Eric Paris      2010-11-23  1552  			goto out;
9a59daa03df725 Stephen Smalley 2008-05-14  1553  	}
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  1554  retry:
1b8b31a2e6120b Stephen Smalley 2020-08-19  1555  	rcu_read_lock();
1b8b31a2e6120b Stephen Smalley 2020-08-19  1556  	policy =3D rcu_dereferenc=
e(state->policy);
1b8b31a2e6120b Stephen Smalley 2020-08-19  1557  	policydb =3D &policy->pol=
icydb;
1b8b31a2e6120b Stephen Smalley 2020-08-19  1558  	sidtab =3D policy->sidtab;
aa8e712cee93d5 Stephen Smalley 2018-03-01  1559  	rc =3D string_to_context_=
struct(policydb, sidtab, scontext2,
95ffe194204ae3 Jann Horn       2018-08-06  1560  				      &context, def_si=
d);
12b29f34558b9b Stephen Smalley 2008-05-07  1561  	if (rc =3D=3D -EINVAL && =
force) {
9a59daa03df725 Stephen Smalley 2008-05-14  1562  		context.str =3D str;
efe3de79e0b52c Sachin Grover   2018-05-25 @1563  		context.len =3D strlen(s=
tr) + 1;
9a59daa03df725 Stephen Smalley 2008-05-14  1564  		str =3D NULL;
12b29f34558b9b Stephen Smalley 2008-05-07  1565  	} else if (rc)
4b02b524487622 Eric Paris      2010-11-23  1566  		goto out_unlock;
225621c9348d2a Ondrej Mosnacek 2020-04-17  1567  	rc =3D sidtab_context_to_=
sid(sidtab, &context, sid);
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  1568  	if (rc =3D=3D -ESTALE) {
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  1569  		rcu_read_unlock();
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  1570  		if (context.str) {
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  1571  			str =3D context.str;
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  1572  			context.str =3D NULL;
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  1573  		}
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  1574  		context_destroy(&context=
);
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  1575  		goto retry;
9ad6e9cb39c663 Ondrej Mosnacek 2021-04-07  1576  	}
^1da177e4c3f41 Linus Torvalds  2005-04-16  1577  	context_destroy(&context);
4b02b524487622 Eric Paris      2010-11-23  1578  out_unlock:
1b8b31a2e6120b Stephen Smalley 2020-08-19  1579  	rcu_read_unlock();
4b02b524487622 Eric Paris      2010-11-23  1580  out:
9a59daa03df725 Stephen Smalley 2008-05-14  1581  	kfree(scontext2);
9a59daa03df725 Stephen Smalley 2008-05-14  1582  	kfree(str);
^1da177e4c3f41 Linus Torvalds  2005-04-16  1583  	return rc;
^1da177e4c3f41 Linus Torvalds  2005-04-16  1584  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  1585  =


:::::: The code at line 1563 was first introduced by commit
:::::: efe3de79e0b52ca281ef6691480c8c68c82a4657 selinux: KASAN: slab-out-of=
-bounds in xattr_getsecurity

:::::: TO: Sachin Grover <sgrover@codeaurora.org>
:::::: CC: Paul Moore <paul@paul-moore.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3213737617545609618==--

