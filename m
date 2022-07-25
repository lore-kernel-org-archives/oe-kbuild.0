Content-Type: multipart/mixed; boundary="===============6983441368109281121=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [norov:__bitmap-for-next 9/30] include/asm-generic/bitops/generic-non-atomic.h:32:9: warning: use of uninitialized value 'tmpmask[0].bits[0]' [CWE-457]
Date: Mon, 25 Jul 2022 16:58:25 +0000
Message-ID: <202207250212.w5dDjXi1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6983441368109281121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/asm-generic/bitops/generic-non-atomic.h:32:9: warning: use of unin=
itialized value 'tmpmask[0].bits[0]' [CWE-457] [-Wanalyzer-use-of-uninitial=
ized-value]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/norov/linux __bitmap-for-next
head:   7ea69874eca96eba31079f53bff149543ee3da1a
commit: 3e7e5baaaba78075a7f3a57432609e363bf2a486 [9/30] bitmap: don't assum=
e compiler evaluates small mem*() builtins calls
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-c002-20220718 (https://download.01.org/0day-ci/archi=
ve/20220725/202207250212.w5dDjXi1-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/norov/linux/commit/3e7e5baaaba78075a7f3a574326=
09e363bf2a486
        git remote add norov https://github.com/norov/linux
        git fetch --no-tags norov __bitmap-for-next
        git checkout 3e7e5baaaba78075a7f3a57432609e363bf2a486
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from include/linux/bitops.h:34,
                    from include/linux/kernel.h:22,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
   In function 'generic___set_bit',
       inlined from '__cpumask_set_cpu' at include/linux/cpumask.h:351:2,
       inlined from 'membarrier_private_expedited' at kernel/sched/membarri=
er.c:372:5:
>> include/asm-generic/bitops/generic-non-atomic.h:32:9: warning: use of un=
initialized value 'tmpmask[0].bits[0]' [CWE-457] [-Wanalyzer-use-of-uniniti=
alized-value]
      32 |         *p  |=3D mask;
         |         ^~
     'membarrier_private_expedited': events 1-4
       |
       |kernel/sched/membarrier.c:311:23:
       |  311 |         cpumask_var_t tmpmask;
       |      |                       ^~~~~~~
       |      |                       |
       |      |                       (1) region created on stack here
       |......
       |  318 |                 if (!(atomic_read(&mm->membarrier_state) &
       |      |                    ~   =

       |      |                    |
       |      |                    (2) following 'false' branch...
       |......
       |  336 |         if (flags !=3D MEMBARRIER_FLAG_SYNC_CORE &&
       |      |            ~           =

       |      |            |
       |      |            (3) ...to here
       |      |            (4) following 'false' branch (when 'flags =3D=3D=
 1')...
       |
     'membarrier_private_expedited': event 5
       |
       |include/linux/compiler.h:86:20:
       |   86 | # define barrier() __asm__ __volatile__("": : :"memory")
       |      |                    ^~~~~~~
       |      |                    |
       |      |                    (5) ...to here
   include/asm-generic/barrier.h:105:25: note: in expansion of macro 'barri=
er'
       |  105 | #define smp_mb()        barrier()
       |      |                         ^~~~~~~
   kernel/sched/membarrier.c:344:9: note: in expansion of macro 'smp_mb'
       |  344 |         smp_mb();       /* system call entry is not a mb. */
       |      |         ^~~~~~
       |
     'membarrier_private_expedited': event 6
       |
       |  346 |         if (cpu_id < 0 && !zalloc_cpumask_var(&tmpmask, GFP=
_KERNEL))
       |      |            ^
       |      |            |
       |      |            (6) following 'true' branch (when 'cpu_id < 0').=
..
       |
     'membarrier_private_expedited': event 7
       |
       |include/linux/bitmap.h:243:22:
       |  243 |                 *dst =3D 0;
       |      |                 ~~~~~^~~
       |      |                      |
       |      |                      (7) ...to here
       |
     'membarrier_private_expedited': event 8
       |
       |include/linux/cpumask.h:190:31:
       |  190 |         for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)mask)
       |      |                         ~~~~~~^~~
       |      |                               |
       |      |                               (8) following 'true' branch (=
when 'cpu =3D=3D 0')...
   include/linux/cpumask.h:815:36: note: in expansion of macro 'for_each_cp=
u'
       |  815 | #define for_each_online_cpu(cpu)   for_each_cpu((cpu), cpu_=
online_mask)
       |      |                                    ^~~~~~~~~~~~
   kernel/sched/membarrier.c:367:17: note: in expansion of macro 'for_each_=
online_cpu'
       |  367 |                 for_each_online_cpu(cpu) {
       |      |                 ^~~~~~~~~~~~~~~~~~~
       |
     'membarrier_private_expedited': event 9
       |
       |include/asm-generic/rwonce.h:44:26:
       |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_t=
ypeof(x) *)&(x))
       |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (9) ...to here
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
       |   50 |         __READ_ONCE(x);                                    =
             \
       |      |         ^~~~~~~~~~~
   include/linux/rcupdate.h:392:50: note: in expansion of macro 'READ_ONCE'
       |  392 |         typeof(*p) *local =3D (typeof(*p) *__force)READ_ONC=
E(p); \
       |      |                                                  ^~~~~~~~~
   include/linux/rcupdate.h:532:9: note: in expansion of macro '__rcu_deref=
erence_check'
       |  532 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu), \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:604:28: note: in expansion of macro 'rcu_derefe=
rence_check'
       |  604 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
       |      |                            ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:370:29: note: in expansion of macro 'rcu_deref=
erence'
       |  370 |                         p =3D rcu_dereference(cpu_rq(cpu)->=
curr);
       |      |                             ^~~~~~~~~~~~~~~
       |
     'membarrier_private_expedited': event 10
       |
       |include/asm-generic/bitops/generic-non-atomic.h:32:9:
       |   32 |         *p  |=3D mask;
       |      |         ^~
       |      |         |
       |      |         (10) use of uninitialized value 'tmpmask[0].bits[0]=
' here
       |
>> include/asm-generic/bitops/generic-non-atomic.h:32:9: warning: use of un=
initialized value 'tmpmask[0].bits[0]' [CWE-457] [-Wanalyzer-use-of-uniniti=
alized-value]
     '__do_sys_membarrier': event 1
       |
       |include/linux/syscalls.h:255:28:
       |  255 |         static inline long __do_sys##name(__MAP(x,__SC_DECL=
,__VA_ARGS__))
       |      |                            ^~~~~~~~
       |      |                            |
       |      |                            (1) entry to '__do_sys_membarrie=
r'
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_D=
EFINEx'
       |  228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
       |      |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DE=
FINEx'
       |  219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##na=
me, __VA_ARGS__)
       |      |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:579:1: note: in expansion of macro 'SYSCALL_DE=
FINE3'
       |  579 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, =
int, cpu_id)
       |      | ^~~~~~~~~~~~~~~
       |
     '__do_sys_membarrier': events 2-6
       |
       |  587 |                 if (unlikely(flags))
       |      |                    ^
       |      |                    |
       |      |                    (2) following 'false' branch...
       |......
       |  591 |         if (!(flags & MEMBARRIER_CMD_FLAG_CPU))
       |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (3) ...to here
       |......
       |  594 |         switch (cmd) {
       |      |         ~~~~~~      =

       |      |         |
       |      |         (4) following 'case 32:' branch...
       |......
       |  618 |         case MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_CORE:
       |      |         ~~~~        =

       |      |         |
       |      |         (5) ...to here
       |  619 |                 return membarrier_private_expedited(MEMBARR=
IER_FLAG_SYNC_CORE, cpu_id);
       |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                        |
       |      |                        (6) calling 'membarrier_private_expe=
dited' from '__do_sys_membarrier'
       |
       +--> 'membarrier_private_expedited': events 7-9
              |
              |  309 | static int membarrier_private_expedited(int flags, i=
nt cpu_id)
              |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |            |
              |      |            (7) entry to 'membarrier_private_expedite=
d'
              |  310 | {
              |  311 |         cpumask_var_t tmpmask;
              |      |                       ~~~~~~~
              |      |                       |
              |      |                       (8) region created on stack he=
re
              |......
              |  315 |         if (flags =3D=3D MEMBARRIER_FLAG_SYNC_CORE) {
              |      |            ~
              |      |            |
              |      |            (9) following 'true' branch (when 'flags =
=3D=3D 1')...
              |
            'membarrier_private_expedited': event 10
              |
              |include/asm-generic/rwonce.h:44:26:
              |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_s=
calar_typeof(x) *)&(x))
              |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (10) ...to here
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
              |   50 |         __READ_ONCE(x);                             =
                    \
              |      |         ^~~~~~~~~~~
   arch/arm/include/asm/atomic.h:25:33: note: in expansion of macro 'READ_O=
NCE'
              |   25 | #define arch_atomic_read(v)     READ_ONCE((v)->count=
er)
              |      |                                 ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:28:16: note: in expansion of =
macro 'arch_atomic_read'
              |   28 |         return arch_atomic_read(v);
              |      |                ^~~~~~~~~~~~~~~~
              |
            'membarrier_private_expedited': events 11-13
              |
              |kernel/sched/membarrier.c:318:20:
              |  318 |                 if (!(atomic_read(&mm->membarrier_st=
ate) &
              |      |                    ^
              |      |                    |
              |      |                    (11) following 'false' branch...
              |......
              |  336 |         if (flags !=3D MEMBARRIER_FLAG_SYNC_CORE &&
              |      |            ~        =

              |      |            |
              |      |            (12) ...to here
              |      |            (13) following 'false' branch (when 'flag=
s =3D=3D 1')...
              |
            'membarrier_private_expedited': event 14
              |
              |include/linux/compiler.h:86:20:
              |   86 | # define barrier() __asm__ __volatile__("": : :"memo=
ry")
              |      |                    ^~~~~~~
              |      |                    |
              |      |                    (14) ...to here
   include/asm-generic/barrier.h:105:25: note: in expansion of macro 'barri=
er'
              |  105 | #define smp_mb()        barrier()
              |      |                         ^~~~~~~
   kernel/sched/membarrier.c:344:9: note: in expansion of macro 'smp_mb'
              |  344 |         smp_mb();       /* system call entry is not =
a mb. */
              |      |         ^~~~~~
              |
            'membarrier_private_expedited': event 15
              |
              |  346 |         if (cpu_id < 0 && !zalloc_cpumask_var(&tmpma=
sk, GFP_KERNEL))
              |      |            ^
              |      |            |
              |      |            (15) following 'true' branch (when 'cpu_i=
d < 0')...
              |
            'membarrier_private_expedited': event 16
              |
              |include/linux/bitmap.h:243:22:
              |  243 |                 *dst =3D 0;
              |      |                 ~~~~~^~~
              |      |                      |
              |      |                      (16) ...to here
              |
            'membarrier_private_expedited': event 17
              |
              |include/linux/cpumask.h:190:31:
              |  190 |         for ((cpu) =3D 0; (cpu) < 1; (cpu)++, (void)=
mask)
              |      |                         ~~~~~~^~~
              |      |                               |
              |      |                               (17) following 'true' =
branch (when 'cpu =3D=3D 0')...
   include/linux/cpumask.h:815:36: note: in expansion of macro 'for_each_cp=
u'
              |  815 | #define for_each_online_cpu(cpu)   for_each_cpu((cpu=
), cpu_online_mask)
              |      |                                    ^~~~~~~~~~~~
   kernel/sched/membarrier.c:367:17: note: in expansion of macro 'for_each_=
online_cpu'
              |  367 |                 for_each_online_cpu(cpu) {
              |      |                 ^~~~~~~~~~~~~~~~~~~
              |
            'membarrier_private_expedited': event 18
              |
              |include/asm-generic/rwonce.h:44:26:
              |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_s=
calar_typeof(x) *)&(x))
              |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~
              |      |                          |
              |      |                          (18) ...to here
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
              |   50 |         __READ_ONCE(x);                             =
                    \
              |      |         ^~~~~~~~~~~
   include/linux/rcupdate.h:392:50: note: in expansion of macro 'READ_ONCE'
              |  392 |         typeof(*p) *local =3D (typeof(*p) *__force)R=
EAD_ONCE(p); \
              |      |                                                  ^~~=
~~~~~~
   include/linux/rcupdate.h:532:9: note: in expansion of macro '__rcu_deref=
erence_check'
              |  532 |         __rcu_dereference_check((p), __UNIQUE_ID(rcu=
), \
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:604:28: note: in expansion of macro 'rcu_derefe=
rence_check'
              |  604 | #define rcu_dereference(p) rcu_dereference_check(p, =
0)
              |      |                            ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:370:29: note: in expansion of macro 'rcu_deref=
erence'
              |  370 |                         p =3D rcu_dereference(cpu_rq=
(cpu)->curr);
              |      |                             ^~~~~~~~~~~~~~~
              |
            'membarrier_private_expedited': event 19
              |
              |include/asm-generic/bitops/generic-non-atomic.h:32:9:
              |   32 |         *p  |=3D mask;
              |      |         ^~
              |      |         |
              |      |         (19) use of uninitialized value 'tmpmask[0].=
bits[0]' here
              |
>> include/asm-generic/bitops/generic-non-atomic.h:32:9: warning: use of un=
initialized value 'tmpmask[0].bits[0]' [CWE-457] [-Wanalyzer-use-of-uniniti=
alized-value]
     '__se_sys_membarrier': event 1
       |
       |include/linux/syscalls.h:247:25:
       |  247 |         asmlinkage long __se_sys##name(__MAP(x,__SC_LONG,__=
VA_ARGS__))  \
       |      |                         ^~~~~~~~
       |      |                         |
       |      |                         (1) entry to '__se_sys_membarrier'
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_D=
EFINEx'
       |  228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
       |      |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DE=
FINEx'
       |  219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##na=
me, __VA_ARGS__)
       |      |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:579:1: note: in expansion of macro 'SYSCALL_DE=
FINE3'
       |  579 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, =
int, cpu_id)
       |      | ^~~~~~~~~~~~~~~
       |
     '__se_sys_membarrier': event 2
       |
       |include/linux/syscalls.h:249:28:
       |  249 |                 long ret =3D __do_sys##name(__MAP(x,__SC_CA=
ST,__VA_ARGS__));\
       |      |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~
       |      |                            |
       |      |                            (2) calling '__do_sys_membarrier=
' from '__se_sys_membarrier'
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_D=
EFINEx'
       |  228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
       |      |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DE=
FINEx'
       |  219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##na=
me, __VA_ARGS__)
       |      |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:579:1: note: in expansion of macro 'SYSCALL_DE=
FINE3'
       |  579 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, flags, =
int, cpu_id)
       |      | ^~~~~~~~~~~~~~~
       |
       +--> '__do_sys_membarrier': event 3
              |
              |include/linux/syscalls.h:255:28:
              |  255 |         static inline long __do_sys##name(__MAP(x,__=
SC_DECL,__VA_ARGS__))
              |      |                            ^~~~~~~~
              |      |                            |
              |      |                            (3) entry to '__do_sys_me=
mbarrier'
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_D=
EFINEx'
              |  228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
              |      |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:219:36: note: in expansion of macro 'SYSCALL_DE=
FINEx'
              |  219 | #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3=
, _##name, __VA_ARGS__)
              |      |                                    ^~~~~~~~~~~~~~~
   kernel/sched/membarrier.c:579:1: note: in expansion of macro 'SYSCALL_DE=
FINE3'
              |  579 | SYSCALL_DEFINE3(membarrier, int, cmd, unsigned int, =
flags, int, cpu_id)
              |      | ^~~~~~~~~~~~~~~
              |
            '__do_sys_membarrier': events 4-8
              |
              |  587 |                 if (unlikely(flags))
              |      |                    ^
              |      |                    |
              |      |                    (4) following 'false' branch...
              |......
              |  591 |         if (!(flags & MEMBARRIER_CMD_FLAG_CPU))
              |      |              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                     |
              |      |                     (5) ...to here
              |......
              |  594 |         switch (cmd) {
              |      |         ~~~~~~      =

              |      |         |
              |      |         (6) following 'case 32:' branch...
              |......
              |  618 |         case MEMBARRIER_CMD_PRIVATE_EXPEDITED_SYNC_C=
ORE:
              |      |         ~~~~        =

              |      |         |
              |      |         (7) ...to here
              |  619 |                 return membarrier_private_expedited(=
MEMBARRIER_FLAG_SYNC_CORE, cpu_id);
              |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (8) calling 'membarrier_priva=
te_expedited' from '__do_sys_membarrier'
              |
              +--> 'membarrier_private_expedited': events 9-11
                     |
                     |  309 | static int membarrier_private_expedited(int f=
lags, int cpu_id)
                     |      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |            |
                     |      |            (9) entry to 'membarrier_private_e=
xpedited'
                     |  310 | {
                     |  311 |         cpumask_var_t tmpmask;
                     |      |                       ~~~~~~~
                     |      |                       |
                     |      |                       (10) region created on =
stack here
                     |......
                     |  315 |         if (flags =3D=3D MEMBARRIER_FLAG_SYNC=
_CORE) {
                     |      |            ~
                     |      |            |
                     |      |            (11) following 'true' branch (when=
 'flags =3D=3D 1')...
                     |
                   'membarrier_private_expedited': event 12
                     |
                     |include/asm-generic/rwonce.h:44:26:
                     |   44 | #define __READ_ONCE(x)  (*(const volatile __u=
nqual_scalar_typeof(x) *)&(x))
                     |      |                         ~^~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                          |
--
   lib/bitmap.c: In function 'bitmap_check_region':
>> lib/bitmap.c:652:35: warning: use of uninitialized value '*r.group_len' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     652 |         if (r->start > r->end || r->group_len =3D=3D 0 || r->off=
 > r->group_len)
         |                                  ~^~~~~~~~~~~
     'bitmap_parselist_user': events 1-4
       |
       |  837 | int bitmap_parselist_user(const char __user *ubuf,
       |      |     ^~~~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'bitmap_parselist_user'
       |......
       |  845 |         if (IS_ERR(buf))
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch...
       |......
       |  848 |         ret =3D bitmap_parselist(buf, maskp, nmaskbits);
       |      |               ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |               |
       |      |               (3) ...to here
       |      |               (4) calling 'bitmap_parselist' from 'bitmap_p=
arselist_user'
       |
       +--> 'bitmap_parselist': events 5-7
              |
              |  796 | int bitmap_parselist(const char *buf, unsigned long =
*maskp, int nmaskbits)
              |      |     ^~~~~~~~~~~~~~~~
              |      |     |
              |      |     (5) entry to 'bitmap_parselist'
              |  797 | {
              |  798 |         struct region r;
              |      |                       ~
              |      |                       |
              |      |                       (6) region created on stack he=
re
              |......
              |  802 |         bitmap_zero(maskp, r.nbits);
              |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (7) calling 'bitmap_zero' from 'bitmap_parse=
list'
              |
              +--> 'bitmap_zero': events 8-10
                     |
                     |include/linux/bitmap.h:238:20:
                     |  238 | static inline void bitmap_zero(unsigned long =
*dst, unsigned int nbits)
                     |      |                    ^~~~~~~~~~~
                     |      |                    |
                     |      |                    (8) entry to 'bitmap_zero'
                     |......
                     |  242 |         if (small_const_nbits(nbits))
                     |      |            ~        =

                     |      |            |
                     |      |            (9) following 'true' branch...
                     |  243 |                 *dst =3D 0;
                     |      |                 ~~~~~~~~
                     |      |                      |
                     |      |                      (10) ...to here
                     |
              <------+
              |
            'bitmap_parselist': events 11-14
              |
              |lib/bitmap.c:802:9:
              |  802 |         bitmap_zero(maskp, r.nbits);
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (11) returning to 'bitmap_parselist' from 'b=
itmap_zero'
              |  803 | =

              |  804 |         while (buf) {
              |      |                ~~~
              |      |                |
              |      |                (12) following 'true' branch (when 'b=
uf' is non-NULL)...
              |  805 |                 buf =3D bitmap_find_region(buf);
              |      |                       ~~~~~~~~~~~~~~~~~~~~~~~
              |      |                       |
              |      |                       (13) ...to here
              |      |                       (14) calling 'bitmap_find_regi=
on' from 'bitmap_parselist'
              |
              +--> 'bitmap_find_region': events 15-18
                     |
                     |  701 | static const char *bitmap_find_region(const c=
har *str)
                     |      |                    ^~~~~~~~~~~~~~~~~~
                     |      |                    |
                     |      |                    (15) entry to 'bitmap_find=
_region'
                     |  702 | {
                     |  703 |         while (__end_of_region(*str))
                     |      |                ~~~~~~~~~~~~~~~
                     |      |                |
                     |      |                (16) following 'false' branch.=
..
                     |......
                     |  706 |         return end_of_str(*str) ? NULL : str;
                     |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
                     |      |                |                       |
                     |      |                (17) ...to here         (18) f=
ollowing 'false' branch...
                     |
                   'bitmap_find_region': event 19
                     |
                     |cc1:
                     | (19): ...to here
                     |
              <------+
              |
            'bitmap_parselist': events 20-23
              |

vim +32 include/asm-generic/bitops/generic-non-atomic.h

21bb8af513d35c0 Alexander Lobakin 2022-06-24  11  =

21bb8af513d35c0 Alexander Lobakin 2022-06-24  12  /*
21bb8af513d35c0 Alexander Lobakin 2022-06-24  13   * Generic definitions fo=
r bit operations, should not be used in regular code
21bb8af513d35c0 Alexander Lobakin 2022-06-24  14   * directly.
21bb8af513d35c0 Alexander Lobakin 2022-06-24  15   */
21bb8af513d35c0 Alexander Lobakin 2022-06-24  16  =

21bb8af513d35c0 Alexander Lobakin 2022-06-24  17  /**
21bb8af513d35c0 Alexander Lobakin 2022-06-24  18   * generic___set_bit - Se=
t a bit in memory
21bb8af513d35c0 Alexander Lobakin 2022-06-24  19   * @nr: the bit to set
21bb8af513d35c0 Alexander Lobakin 2022-06-24  20   * @addr: the address to =
start counting from
21bb8af513d35c0 Alexander Lobakin 2022-06-24  21   *
21bb8af513d35c0 Alexander Lobakin 2022-06-24  22   * Unlike set_bit(), this=
 function is non-atomic and may be reordered.
21bb8af513d35c0 Alexander Lobakin 2022-06-24  23   * If it's called on the =
same region of memory simultaneously, the effect
21bb8af513d35c0 Alexander Lobakin 2022-06-24  24   * may be that only one o=
peration succeeds.
21bb8af513d35c0 Alexander Lobakin 2022-06-24  25   */
21bb8af513d35c0 Alexander Lobakin 2022-06-24  26  static __always_inline vo=
id
0e862838f290147 Alexander Lobakin 2022-06-24  27  generic___set_bit(unsigne=
d long nr, volatile unsigned long *addr)
21bb8af513d35c0 Alexander Lobakin 2022-06-24  28  {
21bb8af513d35c0 Alexander Lobakin 2022-06-24  29  	unsigned long mask =3D B=
IT_MASK(nr);
21bb8af513d35c0 Alexander Lobakin 2022-06-24  30  	unsigned long *p =3D ((u=
nsigned long *)addr) + BIT_WORD(nr);
21bb8af513d35c0 Alexander Lobakin 2022-06-24  31  =

21bb8af513d35c0 Alexander Lobakin 2022-06-24 @32  	*p  |=3D mask;
21bb8af513d35c0 Alexander Lobakin 2022-06-24  33  }
21bb8af513d35c0 Alexander Lobakin 2022-06-24  34  =


:::::: The code@line 32 was first introduced by commit
:::::: 21bb8af513d35c005c401706030f4eb469538d1d bitops: always define asm-g=
eneric non-atomic bitops

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6983441368109281121==--

