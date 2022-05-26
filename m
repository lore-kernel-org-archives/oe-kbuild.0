Content-Type: multipart/mixed; boundary="===============7148503666196768511=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/mmap_lock.c:135:34: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Thu, 26 May 2022 12:07:19 +0800
Message-ID: <202205261113.dojeQ9du-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7148503666196768511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Nicolas Saenz Julienne <nsaenzju@redhat.com>
CC: Axel Rasmussen <axelrasmussen@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d7227785e384d4422b3ca189aa5bf19f462337cc
commit: 832b50725373e8c46781b7d4db104ec9cf564a6b mm: mmap_lock: use local l=
ocks instead of disabling preemption
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: s390-randconfig-c005-20220518 (https://download.01.org/0day-ci/arch=
ive/20220526/202205261113.dojeQ9du-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 853fa8=
ee225edf2d0de94b0dcbd31bea916e825e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D832b50725373e8c46781b7d4db104ec9cf564a6b
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 832b50725373e8c46781b7d4db104ec9cf564a6b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
            ^~~~
   drivers/tty/tty_ioctl.c:402:2: note: '?' condition is false
           if (ld !=3D NULL) {
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
   drivers/tty/tty_ioctl.c:402:2: note: Taking false branch
           if (ld !=3D NULL) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/tty/tty_ioctl.c:408:2: note: Assuming the condition is false
           if (opt & TERMIOS_WAIT) {
           ^
   include/linux/compiler.h:56:45: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   drivers/tty/tty_ioctl.c:408:2: note: '?' condition is false
           if (opt & TERMIOS_WAIT) {
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   drivers/tty/tty_ioctl.c:408:2: note: '?' condition is true
           if (opt & TERMIOS_WAIT) {
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
   drivers/tty/tty_ioctl.c:408:2: note: Taking true branch
           if (opt & TERMIOS_WAIT) {
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   drivers/tty/tty_ioctl.c:410:22: note: Dereference of null pointer
                   if (signal_pending(current))
                                      ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   Suppressed 16 warnings (4 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   arch/s390/include/asm/preempt.h:112:29: warning: Dereference of null poi=
nter [clang-analyzer-core.NullDereference]
           S390_lowcore.preempt_count +=3D val;
                                      ^
   mm/mmap_lock.c:239:2: note: Calling '__preempt_count_add'
           TRACE_MMAP_LOCK_EVENT(released, mm, write);
           ^
   mm/mmap_lock.c:193:3: note: expanded from macro 'TRACE_MMAP_LOCK_EVENT'
                   local_lock(&memcg_paths.lock);                          =
       \
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/local_lock.h:16:27: note: expanded from macro 'local_lock'
   #define local_lock(lock)                __local_lock(lock)
                                           ^~~~~~~~~~~~~~~~~~
   include/linux/local_lock_internal.h:61:3: note: expanded from macro '__l=
ocal_lock'
                   preempt_disable();                              \
                   ^~~~~~~~~~~~~~~~~
   include/linux/preempt.h:177:2: note: expanded from macro 'preempt_disabl=
e'
           preempt_count_inc(); \
           ^~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:170:29: note: expanded from macro 'preempt_count=
_inc'
   #define preempt_count_inc() preempt_count_add(1)
                               ^~~~~~~~~~~~~~~~~~~~
   include/linux/preempt.h:162:32: note: expanded from macro 'preempt_count=
_add'
   #define preempt_count_add(val)  __preempt_count_add(val)
                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/preempt.h:112:29: note: Dereference of null pointer
           S390_lowcore.preempt_count +=3D val;
                                      ^
>> mm/mmap_lock.c:135:34: warning: Dereference of null pointer [clang-analy=
zer-core.NullDereference]
           struct memcg_path *memcg_path =3D this_cpu_ptr(&memcg_paths);
                                           ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_pt=
r'
           arch_raw_cpu_ptr(ptr);                                          \
           ^
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^
   include/linux/compiler.h:182:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   mm/mmap_lock.c:173:6: note: Assuming 'memcg' is not equal to null
           if (memcg =3D=3D NULL)
               ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   mm/mmap_lock.c:173:2: note: '?' condition is false
           if (memcg =3D=3D NULL)
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ^
   include/linux/compiler.h:58:31: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                 ^
   mm/mmap_lock.c:173:6: note: 'memcg' is not equal to null
           if (memcg =3D=3D NULL)
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
   mm/mmap_lock.c:173:6: note: 'memcg' is not equal to null
           if (memcg =3D=3D NULL)
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
   mm/mmap_lock.c:173:2: note: '?' condition is false
           if (memcg =3D=3D NULL)
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
   mm/mmap_lock.c:173:2: note: Taking false branch
           if (memcg =3D=3D NULL)
           ^
   include/linux/compiler.h:56:23: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                         ^
   mm/mmap_lock.c:175:15: note: Assuming field 'cgroup' is not equal to null
           if (unlikely(memcg->css.cgroup =3D=3D NULL))
                        ^
   include/linux/compiler.h:48:41: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:47: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                              ~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:58:52: note: expanded from macro '__trace_if_va=
r'
   #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __tr=
ace_if_value(cond))
                                                      ^~~~
   mm/mmap_lock.c:175:26: note: Field 'cgroup' is not equal to null
           if (unlikely(memcg->css.cgroup =3D=3D NULL))
                                   ^
   mm/mmap_lock.c:175:2: note: '?' condition is false
           if (unlikely(memcg->css.cgroup =3D=3D NULL))
           ^
   include/linux/compiler.h:56:28: note: expanded from macro 'if'
   #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )

vim +135 mm/mmap_lock.c

2b5067a8143e34 Axel Rasmussen         2020-12-14  132  =

2b5067a8143e34 Axel Rasmussen         2020-12-14  133  static inline char *=
get_memcg_path_buf(void)
2b5067a8143e34 Axel Rasmussen         2020-12-14  134  {
832b50725373e8 Nicolas Saenz Julienne 2021-06-28 @135  	struct memcg_path *=
memcg_path =3D this_cpu_ptr(&memcg_paths);
2b5067a8143e34 Axel Rasmussen         2020-12-14  136  	char *buf;
2b5067a8143e34 Axel Rasmussen         2020-12-14  137  	int idx;
2b5067a8143e34 Axel Rasmussen         2020-12-14  138  =

2b5067a8143e34 Axel Rasmussen         2020-12-14  139  	rcu_read_lock();
832b50725373e8 Nicolas Saenz Julienne 2021-06-28  140  	buf =3D rcu_derefer=
ence(memcg_path->buf);
2b5067a8143e34 Axel Rasmussen         2020-12-14  141  	if (buf =3D=3D NULL=
) {
2b5067a8143e34 Axel Rasmussen         2020-12-14  142  		rcu_read_unlock();
2b5067a8143e34 Axel Rasmussen         2020-12-14  143  		return NULL;
2b5067a8143e34 Axel Rasmussen         2020-12-14  144  	}
832b50725373e8 Nicolas Saenz Julienne 2021-06-28  145  	idx =3D local_add_r=
eturn(MEMCG_PATH_BUF_SIZE, &memcg_path->buf_idx) -
2b5067a8143e34 Axel Rasmussen         2020-12-14  146  	      MEMCG_PATH_BU=
F_SIZE;
2b5067a8143e34 Axel Rasmussen         2020-12-14  147  	return &buf[idx];
2b5067a8143e34 Axel Rasmussen         2020-12-14  148  }
2b5067a8143e34 Axel Rasmussen         2020-12-14  149  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7148503666196768511==--

