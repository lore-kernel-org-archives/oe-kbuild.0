Content-Type: multipart/mixed; boundary="===============7891313714411369110=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/s390/include/asm/vtime.h:16:31: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Mon, 08 Aug 2022 10:54:42 +0800
Message-ID: <202208081053.ZNtvXHJm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7891313714411369110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/s390/include/asm/vtime.h:16:31: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]"
:::::: =


BCC: lkp(a)intel.com
CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sven Schnelle <svens@linux.ibm.com>
CC: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Heiko Carstens <hca@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3bc1bc0b59d04e997db25b84babf459ca1cd80b7
commit: 520763a3272abf0ebf161c748bdbc8dad275521c s390/nmi: use irqentry_nmi=
_enter()/irqentry_nmi_exit()
date:   10 days ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 days ago
config: s390-randconfig-c005-20220801 (https://download.01.org/0day-ci/arch=
ive/20220808/202208081053.ZNtvXHJm-lkp(a)intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 52cd00=
cabf479aa7eb6dbb063b7ba41ea57bce9e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D520763a3272abf0ebf161c748bdbc8dad275521c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 520763a3272abf0ebf161c748bdbc8dad275521c
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Ds390 clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

clang-analyzer warnings: (new ones prefixed by >>)
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, p=
cp, val)
                                           ^
   include/linux/percpu-defs.h:375:2: note: expanded from macro '__pcpu_siz=
e_call'
           __verify_pcpu_ptr(&(variable));                                 \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   arch/s390/include/asm/irq.h:80:2: note: Control jumps to 'case 4:'  at l=
ine 80
           __this_cpu_inc(irq_stat.irqs[irq]);
           ^
   include/linux/percpu-defs.h:497:30: note: expanded from macro '__this_cp=
u_inc'
   #define __this_cpu_inc(pcp)             __this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:458:2: note: expanded from macro '__this_cpu=
_add'
           raw_cpu_add(pcp, val);                                          \
           ^
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_a=
dd'
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, p=
cp, val)
                                           ^
   include/linux/percpu-defs.h:376:2: note: expanded from macro '__pcpu_siz=
e_call'
           switch(sizeof(variable)) {                                      \
           ^
   arch/s390/include/asm/irq.h:80:2: note: Loop condition is false.  Exitin=
g loop
           __this_cpu_inc(irq_stat.irqs[irq]);
           ^
   include/linux/percpu-defs.h:497:30: note: expanded from macro '__this_cp=
u_inc'
   #define __this_cpu_inc(pcp)             __this_cpu_add(pcp, 1)
                                           ^
   include/linux/percpu-defs.h:458:2: note: expanded from macro '__this_cpu=
_add'
           raw_cpu_add(pcp, val);                                          \
           ^
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_a=
dd'
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, p=
cp, val)
                                           ^
   note: (skipping 3 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:72:3: note: expanded from macro 'raw_cpu_ge=
neric_to_op'
           *raw_cpu_ptr(&(pcp)) op val;                                    \
            ^
   include/linux/percpu-defs.h:241:2: note: expanded from macro 'raw_cpu_pt=
r'
           __verify_pcpu_ptr(ptr);                                         \
           ^
   include/linux/percpu-defs.h:217:37: note: expanded from macro '__verify_=
pcpu_ptr'
   #define __verify_pcpu_ptr(ptr)                                          \
                                                                           ^
   arch/s390/include/asm/irq.h:80:2: note: Dereference of null pointer
           __this_cpu_inc(irq_stat.irqs[irq]);
           ^
   include/linux/percpu-defs.h:497:30: note: expanded from macro '__this_cp=
u_inc'
   #define __this_cpu_inc(pcp)             __this_cpu_add(pcp, 1)
                                           ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:458:2: note: expanded from macro '__this_cpu=
_add'
           raw_cpu_add(pcp, val);                                          \
           ^~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:422:32: note: expanded from macro 'raw_cpu_a=
dd'
   #define raw_cpu_add(pcp, val)           __pcpu_size_call(raw_cpu_add_, p=
cp, val)
                                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   note: (skipping 5 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/asm-generic/percpu.h:44:31: note: expanded from macro 'arch_raw_=
cpu_ptr'
   #define arch_raw_cpu_ptr(ptr) SHIFT_PERCPU_PTR(ptr, __my_cpu_offset)
                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:231:2: note: expanded from macro 'SHIFT_PERC=
PU_PTR'
           RELOC_HIDE((typeof(*(__p)) __kernel __force *)(__p), (__offset))
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^~~~~
   arch/s390/include/asm/pai.h:54:7: warning: Dereference of null pointer [=
clang-analyzer-core.NullDereference]
           if (!S390_lowcore.ccd)
                ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/nmi.c:178:2: note: Calling 'pai_kernel_enter'
           pai_kernel_enter(regs);
           ^~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pai.h:50:2: note: Taking false branch
           if (!IS_ENABLED(CONFIG_PERF_EVENTS))
           ^
   arch/s390/include/asm/pai.h:52:7: note: Left side of '&&' is false
           if (!static_branch_unlikely(&pai_key))
                ^
   include/linux/jump_label.h:503:52: note: expanded from macro 'static_bra=
nch_unlikely'
   #define static_branch_unlikely(x)       unlikely_notrace(static_key_enab=
led(&(x)->key))
                                                            ^
   include/linux/jump_label.h:411:67: note: expanded from macro 'static_key=
_enabled'
           if (!__builtin_types_compatible_p(typeof(*x), struct static_key)=
 &&     \
                                                                           =
 ^
   arch/s390/include/asm/pai.h:52:6: note: Assuming the condition is false
           if (!static_branch_unlikely(&pai_key))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/pai.h:52:2: note: Taking false branch
           if (!static_branch_unlikely(&pai_key))
           ^
   arch/s390/include/asm/pai.h:54:7: note: Dereference of null pointer
           if (!S390_lowcore.ccd)
                ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
>> arch/s390/include/asm/vtime.h:16:31: warning: Dereference of null pointe=
r [clang-analyzer-core.NullDereference]
           S390_lowcore.system_timer +=3D S390_lowcore.last_update_timer - =
S390_lowcore.exit_timer;
                                        ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/nmi.c:408:6: note: Assuming the condition is true
           if (user_mode(regs))
               ^
   arch/s390/include/asm/ptrace.h:210:26: note: expanded from macro 'user_m=
ode'
   #define user_mode(regs) (((regs)->psw.mask & PSW_MASK_PSTATE) !=3D 0)
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/nmi.c:408:2: note: Taking true branch
           if (user_mode(regs))
           ^
   arch/s390/kernel/nmi.c:409:3: note: Calling 'update_timer_mcck'
                   update_timer_mcck();
                   ^~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/vtime.h:16:31: note: Dereference of null pointer
           S390_lowcore.system_timer +=3D S390_lowcore.last_update_timer - =
S390_lowcore.exit_timer;
                                        ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/nmi.c:51:9: warning: Dereference of null pointer [clang=
-analyzer-core.NullDereference]
           return MACHINE_HAS_VX || MACHINE_HAS_GS;
                  ^
   arch/s390/include/asm/setup.h:92:26: note: expanded from macro 'MACHINE_=
HAS_VX'
   #define MACHINE_HAS_VX          (S390_lowcore.machine_flags & MACHINE_FL=
AG_VX)
                                    ^
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/nmi.c:113:7: note: Calling 'nmi_needs_mcesa'
           if (!nmi_needs_mcesa())
                ^~~~~~~~~~~~~~~~~
   arch/s390/kernel/nmi.c:51:9: note: Dereference of null pointer
           return MACHINE_HAS_VX || MACHINE_HAS_GS;
                  ^
   arch/s390/include/asm/setup.h:92:26: note: expanded from macro 'MACHINE_=
HAS_VX'
   #define MACHINE_HAS_VX          (S390_lowcore.machine_flags & MACHINE_FL=
AG_VX)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/nmi.c:56:6: warning: Dereference of null pointer [clang=
-analyzer-core.NullDereference]
           if (MACHINE_HAS_GS)
               ^
   arch/s390/include/asm/setup.h:95:26: note: expanded from macro 'MACHINE_=
HAS_GS'
   #define MACHINE_HAS_GS          (S390_lowcore.machine_flags & MACHINE_FL=
AG_GS)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/nmi.c:56:6: note: Dereference of null pointer
           if (MACHINE_HAS_GS)
               ^
   arch/s390/include/asm/setup.h:95:26: note: expanded from macro 'MACHINE_=
HAS_GS'
   #define MACHINE_HAS_GS          (S390_lowcore.machine_flags & MACHINE_FL=
AG_GS)
                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/s390/include/asm/lowcore.h:213:22: note: expanded from macro 'S390_=
lowcore'
   #define S390_lowcore (*((struct lowcore *) 0))
                        ^
   arch/s390/kernel/nmi.c:140:10: warning: Dereference of null pointer [cla=
ng-analyzer-core.NullDereference]
           mcck =3D *this_cpu_ptr(&cpu_mcck);
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
   include/linux/compiler.h:170:28: note: expanded from macro 'RELOC_HIDE'
       (typeof(ptr)) (__ptr + (off)); })
                              ^
   arch/s390/kernel/nmi.c:179:2: note: Calling '__s390_handle_mcck'
           __s390_handle_mcck();
           ^~~~~~~~~~~~~~~~~~~~
   arch/s390/kernel/nmi.c:140:10: note: Loop condition is false.  Exiting l=
oop
           mcck =3D *this_cpu_ptr(&cpu_mcck);
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
   arch/s390/kernel/nmi.c:140:10: note: Dereference of null pointer
           mcck =3D *this_cpu_ptr(&cpu_mcck);
                   ^
   include/linux/percpu-defs.h:252:27: note: expanded from macro 'this_cpu_=
ptr'
   #define this_cpu_ptr(ptr) raw_cpu_ptr(ptr)

vim +16 arch/s390/include/asm/vtime.h

56e62a737028360 Sven Schnelle 2020-11-21  13  =

56e62a737028360 Sven Schnelle 2020-11-21  14  static inline void update_tim=
er_mcck(void)
56e62a737028360 Sven Schnelle 2020-11-21  15  {
56e62a737028360 Sven Schnelle 2020-11-21 @16  	S390_lowcore.system_timer +=
=3D S390_lowcore.last_update_timer - S390_lowcore.exit_timer;
56e62a737028360 Sven Schnelle 2020-11-21  17  	S390_lowcore.user_timer +=3D=
 S390_lowcore.exit_timer - S390_lowcore.mcck_enter_timer;
56e62a737028360 Sven Schnelle 2020-11-21  18  	S390_lowcore.last_update_tim=
er =3D S390_lowcore.mcck_enter_timer;
56e62a737028360 Sven Schnelle 2020-11-21  19  }
56e62a737028360 Sven Schnelle 2020-11-21  20  =


:::::: The code at line 16 was first introduced by commit
:::::: 56e62a73702836017564eaacd5212e4d0fa1c01d s390: convert to generic en=
try

:::::: TO: Sven Schnelle <svens@linux.ibm.com>
:::::: CC: Vasily Gorbik <gor@linux.ibm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7891313714411369110==--

