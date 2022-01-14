Content-Type: multipart/mixed; boundary="===============4493310063739762106=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10999/12117] arch/x86/kernel/fpu/xstate.c:1785:3: warning: Value stored to 'guest' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 14 Jan 2022 12:30:17 +0800
Message-ID: <202201141253.9sdc280i-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4493310063739762106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Jing Liu <jing2.liu@intel.com>
CC: Yang Zhong <yang.zhong@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   27c9d5b3c24af29de643533984f1ba3e650c7c78
commit: 980fe2fddcff21937c93532b4597c8ea450346c1 [10999/12117] x86/fpu: Ext=
end fpu_xstate_prctl() with guest permissions
:::::: branch date: 24 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
114/202201141253.9sdc280i-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 244dd2=
913a43a200f5a6544d424cdc37b771028b)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D980fe2fddcff21937c93532b4597c8ea450346c1
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 980fe2fddcff21937c93532b4597c8ea450346c1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/ext4/extents.c:3637:2: note: '?' condition is false
           if (err > 0)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/extents.c:3637:6: note: 'err' is <=3D 0
           if (err > 0)
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
   fs/ext4/extents.c:3637:2: note: '?' condition is false
           if (err > 0)
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
   fs/ext4/extents.c:3637:2: note: Taking false branch
           if (err > 0)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/extents.c:3641:6: note: Assuming 'err' is 0
           if (!err) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   fs/ext4/extents.c:3641:2: note: '?' condition is false
           if (!err) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   fs/ext4/extents.c:3641:7: note: 'err' is 0
           if (!err) {
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
   fs/ext4/extents.c:3641:2: note: '?' condition is true
           if (!err) {
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
   fs/ext4/extents.c:3641:2: note: Taking true branch
           if (!err) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   fs/ext4/extents.c:3642:9: note: Calling 'ext4_zeroout_es'
                   err =3D ext4_zeroout_es(inode, &zero_ex1);
                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ext4/extents.c:3130:12: note: Assigned value is garbage or undefined
           ee_block  =3D le32_to_cpu(ex->ee_block);
                     ^
   fs/ext4/extents.c:3374:2: warning: Value stored to 'split_flag1' is neve=
r read [clang-analyzer-deadcode.DeadStores]
           split_flag1 =3D 0;
           ^             ~
   fs/ext4/extents.c:3374:2: note: Value stored to 'split_flag1' is never r=
ead
           split_flag1 =3D 0;
           ^             ~
   1 warning generated.
>> arch/x86/kernel/fpu/xstate.c:1785:3: warning: Value stored to 'guest' is=
 never read [clang-analyzer-deadcode.DeadStores]
                   guest =3D true;
                   ^       ~~~~
   arch/x86/kernel/fpu/xstate.c:1785:3: note: Value stored to 'guest' is ne=
ver read
                   guest =3D true;
                   ^       ~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/firmware/dmi_scan.c:78:3: warning: Call to function 'strcpy' is =
insecure as it does not provide bounding of the memory buffer. Replace unbo=
unded copy functions with analogous functions that support length arguments=
 such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(str, bp);
                   ^~~~~~
   drivers/firmware/dmi_scan.c:78:3: note: Call to function 'strcpy' is ins=
ecure as it does not provide bounding of the memory buffer. Replace unbound=
ed copy functions with analogous functions that support length arguments su=
ch as 'strlcpy'. CWE-119
                   strcpy(str, bp);
                   ^~~~~~
   drivers/firmware/dmi_scan.c:287:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy((char *)(dev + 1), name);
           ^~~~~~
   drivers/firmware/dmi_scan.c:287:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy((char *)(dev + 1), name);
           ^~~~~~
   drivers/firmware/dmi_scan.c:376:2: warning: Call to function 'strcpy' is=
 insecure as it does not provide bounding of the memory buffer. Replace unb=
ounded copy functions with analogous functions that support length argument=
s such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy((char *)&dev[1], name);
           ^~~~~~
   drivers/firmware/dmi_scan.c:376:2: note: Call to function 'strcpy' is in=
secure as it does not provide bounding of the memory buffer. Replace unboun=
ded copy functions with analogous functions that support length arguments s=
uch as 'strlcpy'. CWE-119
           strcpy((char *)&dev[1], name);
           ^~~~~~
   drivers/firmware/dmi_scan.c:555:2: warning: Value stored to 'c' is never=
 read [clang-analyzer-deadcode.DeadStores]
           c +=3D print_filtered(buf + c, len - c,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/firmware/dmi_scan.c:555:2: note: Value stored to 'c' is never re=
ad
           c +=3D print_filtered(buf + c, len - c,
           ^    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   lib/oid_registry.c:149:3: warning: Value stored to 'num' is never read [=
clang-analyzer-deadcode.DeadStores]
                   num =3D 0;
                   ^     ~
   lib/oid_registry.c:149:3: note: Value stored to 'num' is never read
                   num =3D 0;
                   ^     ~
   7 warnings generated.
   Suppressed 7 warnings (7 with check filters).
   2 warnings generated.
   drivers/dma-buf/dma-resv.c:525:34: warning: Access to field 'shared_coun=
t' results in a dereference of a null pointer (loaded from variable 'list')=
 [clang-analyzer-core.NullDereference]
                           RCU_INIT_POINTER(list->shared[list->shared_count=
++], f);
                                                         ^
   include/linux/rcupdate.h:854:14: note: expanded from macro 'RCU_INIT_POI=
NTER'
                   WRITE_ONCE(p, RCU_INITIALIZER(v)); \
                              ^
   include/asm-generic/rwonce.h:61:15: note: expanded from macro 'WRITE_ONC=
E'
           __WRITE_ONCE(x, val);                                           \
                        ^
   include/asm-generic/rwonce.h:55:27: note: expanded from macro '__WRITE_O=
NCE'
           *(volatile typeof(x) *)&(x) =3D (val);                          =
  \
                                    ^
   drivers/dma-buf/dma-resv.c:494:2: note: Assuming 'debug_locks' is 0
           dma_resv_assert_held(dst);
           ^
   include/linux/dma-resv.h:271:35: note: expanded from macro 'dma_resv_ass=
ert_held'
   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:310:15: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                        ^~~~~~~~~~~
   include/asm-generic/bug.h:121:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   drivers/dma-buf/dma-resv.c:494:2: note: Left side of '&&' is false
           dma_resv_assert_held(dst);
           ^
   include/linux/dma-resv.h:271:35: note: expanded from macro 'dma_resv_ass=
ert_held'
   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
                                     ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:27: note: expanded from macro 'lockdep_asser=
t'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                                    ^
   drivers/dma-buf/dma-resv.c:494:2: note: '?' condition is false
           dma_resv_assert_held(dst);
           ^
   include/linux/dma-resv.h:271:35: note: expanded from macro 'dma_resv_ass=
ert_held'
   #define dma_resv_assert_held(obj) lockdep_assert_held(&(obj)->lock.base)
                                     ^
   include/linux/lockdep.h:316:2: note: expanded from macro 'lockdep_assert=
_held'
           lockdep_assert(lockdep_is_held(l) !=3D LOCK_STATE_NOT_HELD)
           ^
   include/linux/lockdep.h:310:7: note: expanded from macro 'lockdep_assert'
           do { WARN_ON(debug_locks && !(cond)); } while (0)
                ^

vim +/guest +1785 arch/x86/kernel/fpu/xstate.c

980fe2fddcff21 Thomas Gleixner 2022-01-05  1736  =

db8268df0983ad Chang S. Bae    2021-10-21  1737  /**
db8268df0983ad Chang S. Bae    2021-10-21  1738   * fpu_xstate_prctl - xsta=
te permission operations
db8268df0983ad Chang S. Bae    2021-10-21  1739   * @tsk:	Redundant pointer=
 to current
db8268df0983ad Chang S. Bae    2021-10-21  1740   * @option:	A subfunction =
of arch_prctl()
db8268df0983ad Chang S. Bae    2021-10-21  1741   * @arg2:	option argument
db8268df0983ad Chang S. Bae    2021-10-21  1742   * Return:	0 if successful=
; otherwise, an error code
db8268df0983ad Chang S. Bae    2021-10-21  1743   *
db8268df0983ad Chang S. Bae    2021-10-21  1744   * Option arguments:
db8268df0983ad Chang S. Bae    2021-10-21  1745   *
db8268df0983ad Chang S. Bae    2021-10-21  1746   * ARCH_GET_XCOMP_SUPP: Po=
inter to user space u64 to store the info
db8268df0983ad Chang S. Bae    2021-10-21  1747   * ARCH_GET_XCOMP_PERM: Po=
inter to user space u64 to store the info
db8268df0983ad Chang S. Bae    2021-10-21  1748   * ARCH_REQ_XCOMP_PERM: Fa=
cility number requested
db8268df0983ad Chang S. Bae    2021-10-21  1749   *
db8268df0983ad Chang S. Bae    2021-10-21  1750   * For facilities which re=
quire more than one XSTATE component, the request
db8268df0983ad Chang S. Bae    2021-10-21  1751   * must be the highest sta=
te component number related to that facility,
db8268df0983ad Chang S. Bae    2021-10-21  1752   * e.g. for AMX which requ=
ires XFEATURE_XTILE_CFG(17) and
db8268df0983ad Chang S. Bae    2021-10-21  1753   * XFEATURE_XTILE_DATA(18)=
 this would be XFEATURE_XTILE_DATA(18).
db8268df0983ad Chang S. Bae    2021-10-21  1754   */
db8268df0983ad Chang S. Bae    2021-10-21  1755  long fpu_xstate_prctl(stru=
ct task_struct *tsk, int option, unsigned long arg2)
db8268df0983ad Chang S. Bae    2021-10-21  1756  {
db8268df0983ad Chang S. Bae    2021-10-21  1757  	u64 __user *uptr =3D (u64=
 __user *)arg2;
db8268df0983ad Chang S. Bae    2021-10-21  1758  	u64 permitted, supported;
db8268df0983ad Chang S. Bae    2021-10-21  1759  	unsigned long idx =3D arg=
2;
980fe2fddcff21 Thomas Gleixner 2022-01-05  1760  	bool guest =3D false;
db8268df0983ad Chang S. Bae    2021-10-21  1761  =

db8268df0983ad Chang S. Bae    2021-10-21  1762  	if (tsk !=3D current)
db8268df0983ad Chang S. Bae    2021-10-21  1763  		return -EPERM;
db8268df0983ad Chang S. Bae    2021-10-21  1764  =

db8268df0983ad Chang S. Bae    2021-10-21  1765  	switch (option) {
db8268df0983ad Chang S. Bae    2021-10-21  1766  	case ARCH_GET_XCOMP_SUPP:
db8268df0983ad Chang S. Bae    2021-10-21  1767  		supported =3D fpu_user_c=
fg.max_features |	fpu_user_cfg.legacy_features;
db8268df0983ad Chang S. Bae    2021-10-21  1768  		return put_user(supporte=
d, uptr);
db8268df0983ad Chang S. Bae    2021-10-21  1769  =

db8268df0983ad Chang S. Bae    2021-10-21  1770  	case ARCH_GET_XCOMP_PERM:
db8268df0983ad Chang S. Bae    2021-10-21  1771  		/*
db8268df0983ad Chang S. Bae    2021-10-21  1772  		 * Lockless snapshot as =
it can also change right after the
db8268df0983ad Chang S. Bae    2021-10-21  1773  		 * dropping the lock.
db8268df0983ad Chang S. Bae    2021-10-21  1774  		 */
db8268df0983ad Chang S. Bae    2021-10-21  1775  		permitted =3D xstate_get=
_host_group_perm();
db8268df0983ad Chang S. Bae    2021-10-21  1776  		permitted &=3D XFEATURE_=
MASK_USER_SUPPORTED;
db8268df0983ad Chang S. Bae    2021-10-21  1777  		return put_user(permitte=
d, uptr);
db8268df0983ad Chang S. Bae    2021-10-21  1778  =

980fe2fddcff21 Thomas Gleixner 2022-01-05  1779  	case ARCH_GET_XCOMP_GUEST=
_PERM:
980fe2fddcff21 Thomas Gleixner 2022-01-05  1780  		permitted =3D xstate_get=
_guest_group_perm();
980fe2fddcff21 Thomas Gleixner 2022-01-05  1781  		permitted &=3D XFEATURE_=
MASK_USER_SUPPORTED;
980fe2fddcff21 Thomas Gleixner 2022-01-05  1782  		return put_user(permitte=
d, uptr);
980fe2fddcff21 Thomas Gleixner 2022-01-05  1783  =

980fe2fddcff21 Thomas Gleixner 2022-01-05  1784  	case ARCH_REQ_XCOMP_GUEST=
_PERM:
980fe2fddcff21 Thomas Gleixner 2022-01-05 @1785  		guest =3D true;
980fe2fddcff21 Thomas Gleixner 2022-01-05  1786  		fallthrough;
980fe2fddcff21 Thomas Gleixner 2022-01-05  1787  =

db8268df0983ad Chang S. Bae    2021-10-21  1788  	case ARCH_REQ_XCOMP_PERM:
db8268df0983ad Chang S. Bae    2021-10-21  1789  		if (!IS_ENABLED(CONFIG_X=
86_64))
db8268df0983ad Chang S. Bae    2021-10-21  1790  			return -EOPNOTSUPP;
db8268df0983ad Chang S. Bae    2021-10-21  1791  =

980fe2fddcff21 Thomas Gleixner 2022-01-05  1792  		return xstate_request_pe=
rm(idx, guest);
db8268df0983ad Chang S. Bae    2021-10-21  1793  =

db8268df0983ad Chang S. Bae    2021-10-21  1794  	default:
db8268df0983ad Chang S. Bae    2021-10-21  1795  		return -EINVAL;
db8268df0983ad Chang S. Bae    2021-10-21  1796  	}
db8268df0983ad Chang S. Bae    2021-10-21  1797  }
db8268df0983ad Chang S. Bae    2021-10-21  1798  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4493310063739762106==--

