Content-Type: multipart/mixed; boundary="===============1651808321804101740=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kernel/fpu/xstate.c:1785:3: warning: Value stored to 'guest' is never read [clang-analyzer-deadcode.DeadStores]
Date: Fri, 28 Jan 2022 21:42:20 +0800
Message-ID: <202201282146.AWOcMJwk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1651808321804101740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Thomas Gleixner <tglx@linutronix.de>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Jing Liu <jing2.liu@intel.com>
CC: Yang Zhong <yang.zhong@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   23a46422c56144939c091c76cf389aa863ce9c18
commit: 980fe2fddcff21937c93532b4597c8ea450346c1 x86/fpu: Extend fpu_xstate=
_prctl() with guest permissions
date:   3 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 weeks ago
config: i386-randconfig-c001 (https://download.01.org/0day-ci/archive/20220=
128/202201282146.AWOcMJwk-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b713=
8a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D980fe2fddcff21937c93532b4597c8ea450346c1
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 980fe2fddcff21937c93532b4597c8ea450346c1
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   kernel/trace/ring_buffer.c:1055:4: note: expanded from macro 'RB_WARN_ON'
                           if (__same_type(*(b), struct ring_buffer_per_cpu=
)) { \
                           ^
   kernel/trace/ring_buffer.c:3499:3: note: Taking true branch
                   RB_WARN_ON(cpu_buffer, !s_ok);
                   ^
   kernel/trace/ring_buffer.c:1061:4: note: expanded from macro 'RB_WARN_ON'
                           WARN_ON(1);                                     \
                           ^
   include/asm-generic/bug.h:122:2: note: expanded from macro 'WARN_ON'
           if (unlikely(__ret_warn_on))                                    \
           ^
   kernel/trace/ring_buffer.c:3499:3: note: Loop condition is false.  Exiti=
ng loop
                   RB_WARN_ON(cpu_buffer, !s_ok);
                   ^
   kernel/trace/ring_buffer.c:1061:4: note: expanded from macro 'RB_WARN_ON'
                           WARN_ON(1);                                     \
                           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:78:2: note: expanded from macro '__WARN_FLAGS'
           instrumentation_begin();                                \
           ^
   include/linux/instrumentation.h:57:34: note: expanded from macro 'instru=
mentation_begin'
   # define instrumentation_begin()        do { } while(0)
                                           ^
   kernel/trace/ring_buffer.c:3499:3: note: Loop condition is false.  Exiti=
ng loop
                   RB_WARN_ON(cpu_buffer, !s_ok);
                   ^
   kernel/trace/ring_buffer.c:1061:4: note: expanded from macro 'RB_WARN_ON'
                           WARN_ON(1);                                     \
                           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:79:2: note: expanded from macro '__WARN_FLAGS'
           _BUG_FLAGS(ASM_UD2, BUGFLAG_WARNING|(flags));           \
           ^
   arch/x86/include/asm/bug.h:25:37: note: expanded from macro '_BUG_FLAGS'
   #define _BUG_FLAGS(ins, flags)                                          \
                                                                           ^
   kernel/trace/ring_buffer.c:3499:3: note: Loop condition is false.  Exiti=
ng loop
                   RB_WARN_ON(cpu_buffer, !s_ok);
                   ^
   kernel/trace/ring_buffer.c:1061:4: note: expanded from macro 'RB_WARN_ON'
                           WARN_ON(1);                                     \
                           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:81:2: note: expanded from macro '__WARN_FLAGS'
           instrumentation_end();                                  \
           ^
   include/linux/instrumentation.h:58:33: note: expanded from macro 'instru=
mentation_end'
   # define instrumentation_end()          do { } while(0)
                                           ^
   kernel/trace/ring_buffer.c:3499:3: note: Loop condition is false.  Exiti=
ng loop
                   RB_WARN_ON(cpu_buffer, !s_ok);
                   ^
   kernel/trace/ring_buffer.c:1061:4: note: expanded from macro 'RB_WARN_ON'
                           WARN_ON(1);                                     \
                           ^
   include/asm-generic/bug.h:123:3: note: expanded from macro 'WARN_ON'
                   __WARN();                                               \
                   ^
   include/asm-generic/bug.h:96:19: note: expanded from macro '__WARN'
   #define __WARN()                __WARN_FLAGS(BUGFLAG_TAINT(TAINT_WARN))
                                   ^
   arch/x86/include/asm/bug.h:76:33: note: expanded from macro '__WARN_FLAG=
S'
   #define __WARN_FLAGS(flags)                                     \
                                                                   ^
   kernel/trace/ring_buffer.c:3500:3: note: Taking false branch
                   if (likely(!(info->add_timestamp &
                   ^
   kernel/trace/ring_buffer.c:3509:25: note: The right operand of '!=3D' is=
 a garbage value
                   if (unlikely(info->ts !=3D save_before)) {
                                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   1 warning generated.
   Suppressed 1 warnings (1 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
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
   8 warnings generated.
   arch/x86/kernel/cpu/cacheinfo.c:764:5: warning: Value stored to 'l2_id' =
is never read [clang-analyzer-deadcode.DeadStores]
                                   l2_id =3D c->apicid & ~((1 << index_msb)=
 - 1);
                                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   arch/x86/kernel/cpu/cacheinfo.c:764:5: note: Value stored to 'l2_id' is =
never read
                                   l2_id =3D c->apicid & ~((1 << index_msb)=
 - 1);
                                   ^       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   arch/x86/kernel/cpu/cacheinfo.c:764:30: warning: The result of the left =
shift is undefined due to shifting by '4294967295', which is greater or equ=
al to the width of type 'int' [clang-analyzer-core.UndefinedBinaryOperatorR=
esult]
                                   l2_id =3D c->apicid & ~((1 << index_msb)=
 - 1);
                                                            ^  ~~~~~~~~~
   arch/x86/kernel/cpu/cacheinfo.c:732:6: note: Assuming field 'cpuid_level=
' is > 3
           if (c->cpuid_level > 3) {
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                 ^~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   arch/x86/kernel/cpu/cacheinfo.c:732:2: note: '?' condition is false
           if (c->cpuid_level > 3) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   arch/x86/kernel/cpu/cacheinfo.c:732:9: note: Field 'cpuid_level' is > 3
           if (c->cpuid_level > 3) {
                  ^
   arch/x86/kernel/cpu/cacheinfo.c:732:2: note: '?' condition is true
           if (c->cpuid_level > 3) {
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
   arch/x86/kernel/cpu/cacheinfo.c:732:2: note: Taking true branch
           if (c->cpuid_level > 3) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   arch/x86/kernel/cpu/cacheinfo.c:735:3: note: '?' condition is false
                   if (is_initialized =3D=3D 0) {
                   ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   arch/x86/kernel/cpu/cacheinfo.c:735:7: note: 'is_initialized' is equal t=
o 0
                   if (is_initialized =3D=3D 0) {
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
   arch/x86/kernel/cpu/cacheinfo.c:735:3: note: '?' condition is true
                   if (is_initialized =3D=3D 0) {
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
   arch/x86/kernel/cpu/cacheinfo.c:735:3: note: Taking true branch
                   if (is_initialized =3D=3D 0) {
                   ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   arch/x86/kernel/cpu/cacheinfo.c:745:15: note: Assuming 'i' is < 'num_cac=
he_leaves'

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
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============1651808321804101740==--

