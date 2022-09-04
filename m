Content-Type: multipart/mixed; boundary="===============0791164311419891627=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: use of uninitialized value 'cgrp_flags' [CWE-457]
Date: Sun, 04 Sep 2022 10:47:38 +0800
Message-ID: <202209041027.FQ4SkGyX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0791164311419891627==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: use of un=
initialized value 'cgrp_flags' [CWE-457] [-Wanalyzer-use-of-uninitialized-v=
alue]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Yury Norov <yury.norov@gmail.com>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   65eea2c060aee3bf6d27ea365360059fbd4eeff4
commit: b03fc1173c0c2bb8fad61902a862985cecdc4b1b bitops: let optimize out n=
on-atomic bitops on compile-time constants
date:   9 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-c002-20220830 (https://download.01.org/0day-ci/archi=
ve/20220904/202209041027.FQ4SkGyX-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db03fc1173c0c2bb8fad61902a862985cecdc4b1b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b03fc1173c0c2bb8fad61902a862985cecdc4b1b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/bitops.h:34,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/cgroup.h:12,
                    from kernel/cgroup/cgroup-internal.h:5,
                    from kernel/cgroup/cgroup.c:31:
   In function 'generic_test_bit',
       inlined from 'cgroup_post_fork' at kernel/cgroup/cgroup.c:6345:7:
>> include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: use of =
uninitialized value 'cgrp_flags' [CWE-457] [-Wanalyzer-use-of-uninitialized=
-value]
     127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG=
-1)));
         |                       ~~~~^~~~~~~~~~~~~~
     'cgroup_post_fork': events 1-4
       |
       |kernel/cgroup/cgroup.c:6318:23:
       | 6318 |         unsigned long cgrp_flags =3D 0;
       |      |                       ^~~~~~~~~~
       |      |                       |
       |      |                       (1) region created on stack here
       |......
       | 6330 |         if (likely(child->pid)) {
       |      |            ~           =

       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 6340 |                 put_css_set(cset);
       |      |                 ~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (3) ...to here
       |......
       | 6344 |         if (!(child->flags & PF_KTHREAD)) {
       |      |            ~           =

       |      |            |
       |      |            (4) following 'true' branch...
       |
     'cgroup_post_fork': event 5
       |
       |include/linux/bitops.h:52:11:
       |   52 |           __builtin_constant_p(*(const unsigned long *)(add=
r))) ?       \
       |      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |      |           |
       |      |           (5) ...to here
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
       |   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
       |      |                                             ^
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
       |   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr=
, addr)
       |      |                                         ^~~~~
   kernel/cgroup/cgroup.c:6345:30: note: in expansion of macro 'test_bit'
       | 6345 |                 if (unlikely(test_bit(CGRP_FREEZE, &cgrp_fl=
ags))) {
       |      |                              ^~~~~~~~
       |
     'cgroup_post_fork': event 6
       |
       |include/linux/compiler.h:78:25:
       |   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
       |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                         |
       |      |                         (6) following 'false' branch...
   kernel/cgroup/cgroup.c:6345:21: note: in expansion of macro 'unlikely'
       | 6345 |                 if (unlikely(test_bit(CGRP_FREEZE, &cgrp_fl=
ags))) {
       |      |                     ^~~~~~~~
       |
     'cgroup_post_fork': events 7-8
       |
       |include/asm-generic/bitops/generic-non-atomic.h:127:27:
       |  127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER=
_LONG-1)));
       |      |                       ~~~~^~~~~~~~~~~~~~
       |      |                           |
       |      |                           (7) ...to here
       |      |                           (8) use of uninitialized value 'c=
grp_flags' here
       |
   In function 'generic_test_bit',
       inlined from 'cgroup_post_fork' at kernel/cgroup/cgroup.c:6369:10:
>> include/asm-generic/bitops/generic-non-atomic.h:127:27: warning: use of =
uninitialized value 'cgrp_flags' [CWE-457] [-Wanalyzer-use-of-uninitialized=
-value]
     127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER_LONG=
-1)));
         |                       ~~~~^~~~~~~~~~~~~~
     'cgroup_post_fork': events 1-4
       |
       |kernel/cgroup/cgroup.c:6318:23:
       | 6318 |         unsigned long cgrp_flags =3D 0;
       |      |                       ^~~~~~~~~~
       |      |                       |
       |      |                       (1) region created on stack here
       |......
       | 6330 |         if (likely(child->pid)) {
       |      |            ~           =

       |      |            |
       |      |            (2) following 'false' branch...
       |......
       | 6340 |                 put_css_set(cset);
       |      |                 ~~~~~~~~~~~~~~~~~
       |      |                 |
       |      |                 (3) ...to here
       |......
       | 6344 |         if (!(child->flags & PF_KTHREAD)) {
       |      |            ~           =

       |      |            |
       |      |            (4) following 'true' branch...
       |
     'cgroup_post_fork': event 5
       |
       |include/linux/bitops.h:52:11:
       |   52 |           __builtin_constant_p(*(const unsigned long *)(add=
r))) ?       \
       |      |           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
       |      |           |
       |      |           (5) ...to here
   include/linux/compiler.h:78:45: note: in definition of macro 'unlikely'
       |   78 | # define unlikely(x)    __builtin_expect(!!(x), 0)
       |      |                                             ^
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
       |   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr=
, addr)
       |      |                                         ^~~~~
   kernel/cgroup/cgroup.c:6345:30: note: in expansion of macro 'test_bit'
       | 6345 |                 if (unlikely(test_bit(CGRP_FREEZE, &cgrp_fl=
ags))) {
       |      |                              ^~~~~~~~
       |
     'cgroup_post_fork': event 6
       |
       |include/linux/bitops.h:53:30:
       |   49 |         ((__builtin_constant_p(nr) &&                      =
             \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |   50 |           __builtin_constant_p((uintptr_t)(addr) !=3D (uint=
ptr_t)NULL) && \
       |      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |   51 |           (uintptr_t)(addr) !=3D (uintptr_t)NULL &&        =
               \
       |      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |   52 |           __builtin_constant_p(*(const unsigned long *)(add=
r))) ?       \
       |      |           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |   53 |          const##op(nr, addr) : op(nr, addr))
       |      |          ~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~
       |      |                              |
       |      |                              (6) following 'false' branch...
   include/linux/bitops.h:61:41: note: in expansion of macro 'bitop'
       |   61 | #define test_bit(nr, addr)              bitop(_test_bit, nr=
, addr)
       |      |                                         ^~~~~
   kernel/cgroup/cgroup.c:6369:24: note: in expansion of macro 'test_bit'
       | 6369 |                 kill =3D test_bit(CGRP_KILL, &cgrp_flags);
       |      |                        ^~~~~~~~
       |
     'cgroup_post_fork': events 7-8
       |
       |include/asm-generic/bitops/generic-non-atomic.h:127:27:
       |  127 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER=
_LONG-1)));
       |      |                       ~~~~^~~~~~~~~~~~~~
       |      |                           |
       |      |                           (7) ...to here
       |      |                           (8) use of uninitialized value 'c=
grp_flags' here
       |
   In file included from include/linux/irqflags.h:15,
                    from arch/arm/include/asm/atomic.h:14,
                    from include/linux/atomic.h:7,
                    from include/linux/rcupdate.h:25:
   kernel/cgroup/cgroup.c: In function 'cgroup_file_notify':
   include/linux/typecheck.h:11:19: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      11 |         typeof(x) __dummy2; \
         |                   ^~~~~~~~
   include/linux/jiffies.h:111:10: note: in expansion of macro 'typecheck'
     111 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   include/linux/jiffies.h:120:10: note: in expansion of macro 'time_after_=
eq'
     120 |         (time_after_eq(a,b) && \
         |          ^~~~~~~~~~~~~
   kernel/cgroup/cgroup.c:4284:21: note: in expansion of macro 'time_in_ran=
ge'
    4284 |                 if (time_in_range(jiffies, last, next)) {
         |                     ^~~~~~~~~~~~~
     'cgroup_post_fork': events 1-4
       |
       | 6314 | void cgroup_post_fork(struct task_struct *child,
       |      |      ^~~~~~~~~~~~~~~~
       |      |      |
       |      |      (1) entry to 'cgroup_post_fork'
       |......
       | 6330 |         if (likely(child->pid)) {
       |      |            ~
       |      |            |

vim +/cgrp_flags +127 include/asm-generic/bitops/generic-non-atomic.h

21bb8af513d35c Alexander Lobakin 2022-06-24  113  =

21bb8af513d35c Alexander Lobakin 2022-06-24  114  /**
21bb8af513d35c Alexander Lobakin 2022-06-24  115   * generic_test_bit - Det=
ermine whether a bit is set
21bb8af513d35c Alexander Lobakin 2022-06-24  116   * @nr: bit number to test
21bb8af513d35c Alexander Lobakin 2022-06-24  117   * @addr: Address to star=
t counting from
21bb8af513d35c Alexander Lobakin 2022-06-24  118   */
0e862838f29014 Alexander Lobakin 2022-06-24  119  static __always_inline bo=
ol
0e862838f29014 Alexander Lobakin 2022-06-24  120  generic_test_bit(unsigned=
 long nr, const volatile unsigned long *addr)
21bb8af513d35c Alexander Lobakin 2022-06-24  121  {
21bb8af513d35c Alexander Lobakin 2022-06-24  122  	/*
21bb8af513d35c Alexander Lobakin 2022-06-24  123  	 * Unlike the bitops wit=
h the '__' prefix above, this one *is* atomic,
21bb8af513d35c Alexander Lobakin 2022-06-24  124  	 * so `volatile` must al=
ways stay here with no cast-aways. See
21bb8af513d35c Alexander Lobakin 2022-06-24  125  	 * `Documentation/atomic=
_bitops.txt` for the details.
21bb8af513d35c Alexander Lobakin 2022-06-24  126  	 */
21bb8af513d35c Alexander Lobakin 2022-06-24 @127  	return 1UL & (addr[BIT_W=
ORD(nr)] >> (nr & (BITS_PER_LONG-1)));
21bb8af513d35c Alexander Lobakin 2022-06-24  128  }
21bb8af513d35c Alexander Lobakin 2022-06-24  129  =


:::::: The code at line 127 was first introduced by commit
:::::: 21bb8af513d35c005c401706030f4eb469538d1d bitops: always define asm-g=
eneric non-atomic bitops

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0791164311419891627==--

