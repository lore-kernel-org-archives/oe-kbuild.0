Content-Type: multipart/mixed; boundary="===============4318142080819188972=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/trace/trace_osnoise.c:108:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Tue, 07 Jun 2022 08:05:00 +0800
Message-ID: <202206070837.1BnadQKJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4318142080819188972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: kernel/tr=
ace/trace_osnoise.c:108:9: warning: Dereference of null pointer [clang-anal=
yzer-core.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Bristot de Oliveira <bristot@redhat.com>
CC: "Steven Rostedt (VMware)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f2906aa863381afb0015a9eb7fefad885d4e5a56
commit: bce29ac9ce0bb0b0b146b687ab978378c21e9078 trace: Add osnoise tracer
date:   12 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 12 months ago
config: s390-randconfig-c005-20220605 (https://download.01.org/0day-ci/arch=
ive/20220607/202206070837.1BnadQKJ-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0a90b7=
2c432d70aae035727ece4ba80ce820f381)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbce29ac9ce0bb0b0b146b687ab978378c21e9078
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bce29ac9ce0bb0b0b146b687ab978378c21e9078
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   fs/seq_file.c:549:3: note: Taking true branch
                   if (!IS_ERR(p)) {
                   ^
   fs/seq_file.c:550:16: note: Calling 'mangle_path'
                           char *end =3D mangle_path(buf, p, esc);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/seq_file.c:446:9: note: 's' is <=3D 'p'
           while (s <=3D p) {
                  ^
   fs/seq_file.c:446:2: note: Loop condition is true.  Entering loop body
           while (s <=3D p) {
           ^
   fs/seq_file.c:448:7: note: Assuming 'c' is not equal to 0
                   if (!c) {
                       ^~
   fs/seq_file.c:448:3: note: Taking false branch
                   if (!c) {
                   ^
   fs/seq_file.c:450:14: note: Assuming the condition is true
                   } else if (!strchr(esc, c)) {
                              ^~~~~~~~~~~~~~~
   fs/seq_file.c:450:10: note: Taking true branch
                   } else if (!strchr(esc, c)) {
                          ^
   fs/seq_file.c:451:5: note: Null pointer value stored to 's'
                           *s++ =3D c;
                            ^~~
   fs/seq_file.c:451:9: note: Dereference of null pointer
                           *s++ =3D c;
                           ~~~~~^~~
   fs/seq_file.c:455:9: warning: Dereference of null pointer [clang-analyze=
r-core.NullDereference]
                           *s++ =3D '\\';
                                ^
   fs/seq_file.c:547:6: note: Assuming 'size' is not equal to 0
           if (size) {
               ^~~~
   fs/seq_file.c:547:2: note: Taking true branch
           if (size) {
           ^
   fs/seq_file.c:549:3: note: Taking true branch
                   if (!IS_ERR(p)) {
                   ^
   fs/seq_file.c:550:16: note: Calling 'mangle_path'
                           char *end =3D mangle_path(buf, p, esc);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/seq_file.c:446:9: note: 's' is <=3D 'p'
           while (s <=3D p) {
                  ^
   fs/seq_file.c:446:2: note: Loop condition is true.  Entering loop body
           while (s <=3D p) {
           ^
   fs/seq_file.c:448:7: note: Assuming 'c' is not equal to 0
                   if (!c) {
                       ^~
   fs/seq_file.c:448:3: note: Taking false branch
                   if (!c) {
                   ^
   fs/seq_file.c:450:14: note: Assuming the condition is false
                   } else if (!strchr(esc, c)) {
                              ^~~~~~~~~~~~~~~
   fs/seq_file.c:450:10: note: Taking false branch
                   } else if (!strchr(esc, c)) {
                          ^
   fs/seq_file.c:452:10: note: Taking false branch
                   } else if (s + 4 > p) {
                          ^
   fs/seq_file.c:455:5: note: Null pointer value stored to 's'
                           *s++ =3D '\\';
                            ^~~
   fs/seq_file.c:455:9: note: Dereference of null pointer
                           *s++ =3D '\\';
                           ~~~~~^~~~~~
   include/linux/ioprio.h:79:27: warning: Dereference of null pointer [clan=
g-analyzer-core.NullDereference]
           struct io_context *ioc =3D current->io_context;
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   fs/seq_file.c:155:2: note: Calling 'init_sync_kiocb'
           init_sync_kiocb(&kiocb, file);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:2283:16: note: Calling 'get_current_ioprio'
                   .ki_ioprio =3D get_current_ioprio(),
                                ^~~~~~~~~~~~~~~~~~~~
   include/linux/ioprio.h:79:27: note: Dereference of null pointer
           struct io_context *ioc =3D current->io_context;
                                    ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   Suppressed 6 warnings (5 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   32 warnings generated.
>> kernel/trace/trace_osnoise.c:108:9: warning: Dereference of null pointer=
 [clang-analyzer-core.NullDereference]
           return this_cpu_ptr(&per_cpu_osnoise_var);
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
   kernel/trace/trace_osnoise.c:709:38: note: Calling 'this_cpu_osn_var'
           struct osnoise_variables *osn_var =3D this_cpu_osn_var();
                                               ^~~~~~~~~~~~~~~~~~
   kernel/trace/trace_osnoise.c:108:9: note: Loop condition is false.  Exit=
ing loop
           return this_cpu_ptr(&per_cpu_osnoise_var);
                  ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   kernel/trace/trace_osnoise.c:108:9: note: Dereference of null pointer
           return this_cpu_ptr(&per_cpu_osnoise_var);
                  ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)
                             ^~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:242:2: note: expanded from macro 'raw_cpu_pt=
r'
           arch_raw_cpu_ptr(ptr);                                          \
           ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:182:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   Suppressed 31 warnings (8 in non-user code, 23 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   18 warnings generated.
   Suppressed 18 warnings (6 in non-user code, 12 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
   include/linux/sched/task_stack.h:83:32: warning: Dereference of null poi=
nter [clang-analyzer-core.NullDereference]
           void *stack =3D task_stack_page(current);
                                         ^
   arch/s390/include/asm/current.h:17:45: note: expanded from macro 'curren=
t'
   #define current ((struct task_struct *const)S390_lowcore.current_task)
                                               ^
   arch/s390/include/asm/lowcore.h:192:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   kernel/trace/trace_stack.c:159:19: note: Left side of '||' is false
           int frame_size =3D READ_ONCE(tracer_frame);
                            ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/trace/trace_stack.c:159:19: note: Left side of '||' is false
           int frame_size =3D READ_ONCE(tracer_frame);
                            ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   kernel/trace/trace_stack.c:159:19: note: Left side of '||' is true
           int frame_size =3D READ_ONCE(tracer_frame);
                            ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:291:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))

vim +108 kernel/trace/trace_osnoise.c

bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  102  =

bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  103  /*
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  104   * this_cpu_osn_=
var - Return the per-cpu osnoise_variables on its relative CPU
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  105   */
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  106  static inline st=
ruct osnoise_variables *this_cpu_osn_var(void)
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  107  {
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22 @108  	return this_cpu=
_ptr(&per_cpu_osnoise_var);
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  109  }
bce29ac9ce0bb0 Daniel Bristot de Oliveira 2021-06-22  110  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4318142080819188972==--

