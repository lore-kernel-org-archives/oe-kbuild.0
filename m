Content-Type: multipart/mixed; boundary="===============0069462594026834597=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mark:arm64/stacktrace/rework-cleanup 3/8] arch/arm64/include/asm/stacktrace.h:70:57: error: 'sdei_stack_normal_ptr' undeclared
Date: Sat, 30 Jul 2022 14:12:04 +0800
Message-ID: <202207301421.sXiXP6tR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0069462594026834597==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mark Rutland <mark.rutland@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm6=
4/stacktrace/rework-cleanup
head:   37ad2f60a7f96676259bde924cf329d652c75e2c
commit: 365ef1c2e3f77492fef937e652f3f85a1818c7f3 [3/8] arm64: stacktrace: m=
ove SDEI stack helpers to stacktrace code
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/2022073=
0/202207301421.sXiXP6tR-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/co=
mmit/?id=3D365ef1c2e3f77492fef937e652f3f85a1818c7f3
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git=
/mark/linux.git
        git fetch --no-tags mark arm64/stacktrace/rework-cleanup
        git checkout 365ef1c2e3f77492fef937e652f3f85a1818c7f3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 W=3D1 O=3Dbuild_dir ARCH=3Darm64 SHELL=3D/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:7,
                    from arch/arm64/include/asm/percpu.h:249,
                    from include/linux/irqflags.h:17,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/context_tracking.h:5,
                    from arch/arm64/kernel/entry-common.c:8:
   arch/arm64/include/asm/stacktrace.h: In function 'on_sdei_normal_stack':
>> arch/arm64/include/asm/stacktrace.h:70:57: error: 'sdei_stack_normal_ptr=
' undeclared (first use in this function)
      70 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_normal_ptr);
         |                                                         ^~~~~~~~=
~~~~~~~~~~~~~
   include/linux/percpu-defs.h:318:16: note: in definition of macro '__pcpu=
_size_call_return'
     318 |         typeof(variable) pscr_ret__;                            =
        \
         |                ^~~~~~~~
   arch/arm64/include/asm/stacktrace.h:70:44: note: in expansion of macro '=
raw_cpu_read'
      70 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_normal_ptr);
         |                                            ^~~~~~~~~~~~
   arch/arm64/include/asm/stacktrace.h:70:57: note: each undeclared identif=
ier is reported only once for each function it appears in
      70 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_normal_ptr);
         |                                                         ^~~~~~~~=
~~~~~~~~~~~~~
   include/linux/percpu-defs.h:318:16: note: in definition of macro '__pcpu=
_size_call_return'
     318 |         typeof(variable) pscr_ret__;                            =
        \
         |                ^~~~~~~~
   arch/arm64/include/asm/stacktrace.h:70:44: note: in expansion of macro '=
raw_cpu_read'
      70 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_normal_ptr);
         |                                            ^~~~~~~~~~~~
   arch/arm64/include/asm/stacktrace.h: In function 'on_sdei_critical_stack=
':
>> arch/arm64/include/asm/stacktrace.h:79:57: error: 'sdei_stack_critical_p=
tr' undeclared (first use in this function)
      79 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_critical_ptr);
         |                                                         ^~~~~~~~=
~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:318:16: note: in definition of macro '__pcpu=
_size_call_return'
     318 |         typeof(variable) pscr_ret__;                            =
        \
         |                ^~~~~~~~
   arch/arm64/include/asm/stacktrace.h:79:44: note: in expansion of macro '=
raw_cpu_read'
      79 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_critical_ptr);
         |                                            ^~~~~~~~~~~~
--
   In file included from include/asm-generic/percpu.h:7,
                    from arch/arm64/include/asm/percpu.h:249,
                    from include/linux/irqflags.h:17,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/audit.h:12,
                    from arch/arm64/kernel/ptrace.c:11:
   arch/arm64/include/asm/stacktrace.h: In function 'on_sdei_normal_stack':
>> arch/arm64/include/asm/stacktrace.h:70:57: error: 'sdei_stack_normal_ptr=
' undeclared (first use in this function)
      70 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_normal_ptr);
         |                                                         ^~~~~~~~=
~~~~~~~~~~~~~
   include/linux/percpu-defs.h:318:16: note: in definition of macro '__pcpu=
_size_call_return'
     318 |         typeof(variable) pscr_ret__;                            =
        \
         |                ^~~~~~~~
   arch/arm64/include/asm/stacktrace.h:70:44: note: in expansion of macro '=
raw_cpu_read'
      70 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_normal_ptr);
         |                                            ^~~~~~~~~~~~
   arch/arm64/include/asm/stacktrace.h:70:57: note: each undeclared identif=
ier is reported only once for each function it appears in
      70 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_normal_ptr);
         |                                                         ^~~~~~~~=
~~~~~~~~~~~~~
   include/linux/percpu-defs.h:318:16: note: in definition of macro '__pcpu=
_size_call_return'
     318 |         typeof(variable) pscr_ret__;                            =
        \
         |                ^~~~~~~~
   arch/arm64/include/asm/stacktrace.h:70:44: note: in expansion of macro '=
raw_cpu_read'
      70 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_normal_ptr);
         |                                            ^~~~~~~~~~~~
   arch/arm64/include/asm/stacktrace.h: In function 'on_sdei_critical_stack=
':
>> arch/arm64/include/asm/stacktrace.h:79:57: error: 'sdei_stack_critical_p=
tr' undeclared (first use in this function)
      79 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_critical_ptr);
         |                                                         ^~~~~~~~=
~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:318:16: note: in definition of macro '__pcpu=
_size_call_return'
     318 |         typeof(variable) pscr_ret__;                            =
        \
         |                ^~~~~~~~
   arch/arm64/include/asm/stacktrace.h:79:44: note: in expansion of macro '=
raw_cpu_read'
      79 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_critical_ptr);
         |                                            ^~~~~~~~~~~~
   arch/arm64/kernel/ptrace.c: At top level:
   arch/arm64/kernel/ptrace.c:2112:5: warning: no previous prototype for 's=
yscall_trace_enter' [-Wmissing-prototypes]
    2112 | int syscall_trace_enter(struct pt_regs *regs)
         |     ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/ptrace.c:2135:6: warning: no previous prototype for 's=
yscall_trace_exit' [-Wmissing-prototypes]
    2135 | void syscall_trace_exit(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~
--
   In file included from include/asm-generic/percpu.h:7,
                    from arch/arm64/include/asm/percpu.h:249,
                    from include/linux/irqflags.h:17,
                    from include/linux/rcupdate.h:26,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/context_tracking.h:5,
                    from arch/arm64/kernel/traps.c:10:
   arch/arm64/include/asm/stacktrace.h: In function 'on_sdei_normal_stack':
>> arch/arm64/include/asm/stacktrace.h:70:57: error: 'sdei_stack_normal_ptr=
' undeclared (first use in this function)
      70 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_normal_ptr);
         |                                                         ^~~~~~~~=
~~~~~~~~~~~~~
   include/linux/percpu-defs.h:318:16: note: in definition of macro '__pcpu=
_size_call_return'
     318 |         typeof(variable) pscr_ret__;                            =
        \
         |                ^~~~~~~~
   arch/arm64/include/asm/stacktrace.h:70:44: note: in expansion of macro '=
raw_cpu_read'
      70 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_normal_ptr);
         |                                            ^~~~~~~~~~~~
   arch/arm64/include/asm/stacktrace.h:70:57: note: each undeclared identif=
ier is reported only once for each function it appears in
      70 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_normal_ptr);
         |                                                         ^~~~~~~~=
~~~~~~~~~~~~~
   include/linux/percpu-defs.h:318:16: note: in definition of macro '__pcpu=
_size_call_return'
     318 |         typeof(variable) pscr_ret__;                            =
        \
         |                ^~~~~~~~
   arch/arm64/include/asm/stacktrace.h:70:44: note: in expansion of macro '=
raw_cpu_read'
      70 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_normal_ptr);
         |                                            ^~~~~~~~~~~~
   arch/arm64/include/asm/stacktrace.h: In function 'on_sdei_critical_stack=
':
>> arch/arm64/include/asm/stacktrace.h:79:57: error: 'sdei_stack_critical_p=
tr' undeclared (first use in this function)
      79 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_critical_ptr);
         |                                                         ^~~~~~~~=
~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:318:16: note: in definition of macro '__pcpu=
_size_call_return'
     318 |         typeof(variable) pscr_ret__;                            =
        \
         |                ^~~~~~~~
   arch/arm64/include/asm/stacktrace.h:79:44: note: in expansion of macro '=
raw_cpu_read'
      79 |         unsigned long low =3D (unsigned long)raw_cpu_read(sdei_s=
tack_critical_ptr);
         |                                            ^~~~~~~~~~~~
   arch/arm64/kernel/traps.c: At top level:
   arch/arm64/kernel/traps.c:802:43: warning: initialized field overwritten=
 [-Woverride-init]
     802 |         [ESR_ELx_EC_UNKNOWN]            =3D "Unknown/Uncategoriz=
ed",
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:802:43: note: (near initialization for 'esr_cl=
ass_str[0]')
   arch/arm64/kernel/traps.c:803:43: warning: initialized field overwritten=
 [-Woverride-init]
     803 |         [ESR_ELx_EC_WFx]                =3D "WFI/WFE",
         |                                           ^~~~~~~~~
   arch/arm64/kernel/traps.c:803:43: note: (near initialization for 'esr_cl=
ass_str[1]')
   arch/arm64/kernel/traps.c:804:43: warning: initialized field overwritten=
 [-Woverride-init]
     804 |         [ESR_ELx_EC_CP15_32]            =3D "CP15 MCR/MRC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:804:43: note: (near initialization for 'esr_cl=
ass_str[3]')
   arch/arm64/kernel/traps.c:805:43: warning: initialized field overwritten=
 [-Woverride-init]
     805 |         [ESR_ELx_EC_CP15_64]            =3D "CP15 MCRR/MRRC",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:805:43: note: (near initialization for 'esr_cl=
ass_str[4]')
   arch/arm64/kernel/traps.c:806:43: warning: initialized field overwritten=
 [-Woverride-init]
     806 |         [ESR_ELx_EC_CP14_MR]            =3D "CP14 MCR/MRC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:806:43: note: (near initialization for 'esr_cl=
ass_str[5]')
   arch/arm64/kernel/traps.c:807:43: warning: initialized field overwritten=
 [-Woverride-init]
     807 |         [ESR_ELx_EC_CP14_LS]            =3D "CP14 LDC/STC",
         |                                           ^~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:807:43: note: (near initialization for 'esr_cl=
ass_str[6]')
   arch/arm64/kernel/traps.c:808:43: warning: initialized field overwritten=
 [-Woverride-init]
     808 |         [ESR_ELx_EC_FP_ASIMD]           =3D "ASIMD",
         |                                           ^~~~~~~
   arch/arm64/kernel/traps.c:808:43: note: (near initialization for 'esr_cl=
ass_str[7]')
   arch/arm64/kernel/traps.c:809:43: warning: initialized field overwritten=
 [-Woverride-init]
     809 |         [ESR_ELx_EC_CP10_ID]            =3D "CP10 MRC/VMRS",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:809:43: note: (near initialization for 'esr_cl=
ass_str[8]')
   arch/arm64/kernel/traps.c:810:43: warning: initialized field overwritten=
 [-Woverride-init]
     810 |         [ESR_ELx_EC_PAC]                =3D "PAC",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:810:43: note: (near initialization for 'esr_cl=
ass_str[9]')
   arch/arm64/kernel/traps.c:811:43: warning: initialized field overwritten=
 [-Woverride-init]
     811 |         [ESR_ELx_EC_CP14_64]            =3D "CP14 MCRR/MRRC",
         |                                           ^~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:811:43: note: (near initialization for 'esr_cl=
ass_str[12]')
   arch/arm64/kernel/traps.c:812:43: warning: initialized field overwritten=
 [-Woverride-init]
     812 |         [ESR_ELx_EC_BTI]                =3D "BTI",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:812:43: note: (near initialization for 'esr_cl=
ass_str[13]')
   arch/arm64/kernel/traps.c:813:43: warning: initialized field overwritten=
 [-Woverride-init]
     813 |         [ESR_ELx_EC_ILL]                =3D "PSTATE.IL",
         |                                           ^~~~~~~~~~~
   arch/arm64/kernel/traps.c:813:43: note: (near initialization for 'esr_cl=
ass_str[14]')
   arch/arm64/kernel/traps.c:814:43: warning: initialized field overwritten=
 [-Woverride-init]
     814 |         [ESR_ELx_EC_SVC32]              =3D "SVC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:814:43: note: (near initialization for 'esr_cl=
ass_str[17]')
   arch/arm64/kernel/traps.c:815:43: warning: initialized field overwritten=
 [-Woverride-init]
     815 |         [ESR_ELx_EC_HVC32]              =3D "HVC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:815:43: note: (near initialization for 'esr_cl=
ass_str[18]')
   arch/arm64/kernel/traps.c:816:43: warning: initialized field overwritten=
 [-Woverride-init]
     816 |         [ESR_ELx_EC_SMC32]              =3D "SMC (AArch32)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:816:43: note: (near initialization for 'esr_cl=
ass_str[19]')
   arch/arm64/kernel/traps.c:817:43: warning: initialized field overwritten=
 [-Woverride-init]
     817 |         [ESR_ELx_EC_SVC64]              =3D "SVC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:817:43: note: (near initialization for 'esr_cl=
ass_str[21]')
   arch/arm64/kernel/traps.c:818:43: warning: initialized field overwritten=
 [-Woverride-init]
     818 |         [ESR_ELx_EC_HVC64]              =3D "HVC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:818:43: note: (near initialization for 'esr_cl=
ass_str[22]')
   arch/arm64/kernel/traps.c:819:43: warning: initialized field overwritten=
 [-Woverride-init]
     819 |         [ESR_ELx_EC_SMC64]              =3D "SMC (AArch64)",
         |                                           ^~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:819:43: note: (near initialization for 'esr_cl=
ass_str[23]')
   arch/arm64/kernel/traps.c:820:43: warning: initialized field overwritten=
 [-Woverride-init]
     820 |         [ESR_ELx_EC_SYS64]              =3D "MSR/MRS (AArch64)",
         |                                           ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:820:43: note: (near initialization for 'esr_cl=
ass_str[24]')
   arch/arm64/kernel/traps.c:821:43: warning: initialized field overwritten=
 [-Woverride-init]
     821 |         [ESR_ELx_EC_SVE]                =3D "SVE",
         |                                           ^~~~~
   arch/arm64/kernel/traps.c:821:43: note: (near initialization for 'esr_cl=
ass_str[25]')
   arch/arm64/kernel/traps.c:822:43: warning: initialized field overwritten=
 [-Woverride-init]
     822 |         [ESR_ELx_EC_ERET]               =3D "ERET/ERETAA/ERETAB",
         |                                           ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/traps.c:822:43: note: (near initialization for 'esr_cl=
ass_str[26]')
   arch/arm64/kernel/traps.c:823:43: warning: initialized field overwritten=
 [-Woverride-init]
     823 |         [ESR_ELx_EC_FPAC]               =3D "FPAC",
         |                                           ^~~~~~
   arch/arm64/kernel/traps.c:823:43: note: (near initialization for 'esr_cl=
ass_str[28]')
   arch/arm64/kernel/traps.c:824:43: warning: initialized field overwritten=
 [-Woverride-init]
     824 |         [ESR_ELx_EC_SME]                =3D "SME",
         |                                           ^~~~~


vim +/sdei_stack_normal_ptr +70 arch/arm64/include/asm/stacktrace.h

365ef1c2e3f7749 Mark Rutland 2022-04-14  66  =

365ef1c2e3f7749 Mark Rutland 2022-04-14  67  static inline bool on_sdei_nor=
mal_stack(unsigned long sp, unsigned long size,
365ef1c2e3f7749 Mark Rutland 2022-04-14  68  					struct stack_info *info)
365ef1c2e3f7749 Mark Rutland 2022-04-14  69  {
365ef1c2e3f7749 Mark Rutland 2022-04-14 @70  	unsigned long low =3D (unsign=
ed long)raw_cpu_read(sdei_stack_normal_ptr);
365ef1c2e3f7749 Mark Rutland 2022-04-14  71  	unsigned long high =3D low + =
SDEI_STACK_SIZE;
365ef1c2e3f7749 Mark Rutland 2022-04-14  72  =

365ef1c2e3f7749 Mark Rutland 2022-04-14  73  	return on_stack(sp, size, low=
, high, STACK_TYPE_SDEI_NORMAL, info);
365ef1c2e3f7749 Mark Rutland 2022-04-14  74  }
365ef1c2e3f7749 Mark Rutland 2022-04-14  75  =

365ef1c2e3f7749 Mark Rutland 2022-04-14  76  static inline bool on_sdei_cri=
tical_stack(unsigned long sp, unsigned long size,
365ef1c2e3f7749 Mark Rutland 2022-04-14  77  					  struct stack_info *info)
365ef1c2e3f7749 Mark Rutland 2022-04-14  78  {
365ef1c2e3f7749 Mark Rutland 2022-04-14 @79  	unsigned long low =3D (unsign=
ed long)raw_cpu_read(sdei_stack_critical_ptr);
365ef1c2e3f7749 Mark Rutland 2022-04-14  80  	unsigned long high =3D low + =
SDEI_STACK_SIZE;
365ef1c2e3f7749 Mark Rutland 2022-04-14  81  =

365ef1c2e3f7749 Mark Rutland 2022-04-14  82  	return on_stack(sp, size, low=
, high, STACK_TYPE_SDEI_CRITICAL, info);
365ef1c2e3f7749 Mark Rutland 2022-04-14  83  }
365ef1c2e3f7749 Mark Rutland 2022-04-14  84  #else
365ef1c2e3f7749 Mark Rutland 2022-04-14  85  static inline bool on_sdei_nor=
mal_stack(unsigned long sp, unsigned long size,
365ef1c2e3f7749 Mark Rutland 2022-04-14  86  					struct stack_info *info)
365ef1c2e3f7749 Mark Rutland 2022-04-14  87  {
365ef1c2e3f7749 Mark Rutland 2022-04-14  88  	return false;
365ef1c2e3f7749 Mark Rutland 2022-04-14  89  }
365ef1c2e3f7749 Mark Rutland 2022-04-14  90  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0069462594026834597==--

