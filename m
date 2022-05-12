Content-Type: multipart/mixed; boundary="===============0612728166326021102=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v1 1/1] arm64: Forget syscall if different from execve*()
Date: Fri, 13 May 2022 07:03:05 +0800
Message-ID: <202205130641.D99Zoljr-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0612728166326021102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220509151958.441240-2-flaniel@linux.microsoft.com>
References: <20220509151958.441240-2-flaniel@linux.microsoft.com>
TO: Francis Laniel <flaniel@linux.microsoft.com>

Hi Francis,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on arm/for-next kvmarm/next soc/for-next xilinx-xl=
nx/master v5.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Francis-Laniel/Call-=
forget_syscall-if-different-than-execve/20220509-232317
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for=
-next/core
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-s031-20220512 (https://download.01.org/0day-ci/arc=
hive/20220513/202205130641.D99Zoljr-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/intel-lab-lkp/linux/commit/305717b29c76677b4f8=
a33adaa9fa36a9edbc35b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Francis-Laniel/Call-forget_syscall=
-if-different-than-execve/20220509-232317
        git checkout 305717b29c76677b4f8a33adaa9fa36a9edbc35b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm64 SHELL=3D/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:13:9: sparse: sparse: preprocessor tok=
en __NR_restart_syscall redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
>> include/uapi/asm-generic/unistd.h:416:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:15:9: sparse: sparse: preprocessor tok=
en __NR_exit redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:306:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:19:9: sparse: sparse: preprocessor tok=
en __NR_read redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:205:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:21:9: sparse: sparse: preprocessor tok=
en __NR_write redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:207:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:25:9: sparse: sparse: preprocessor tok=
en __NR_close redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:185:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:35:9: sparse: sparse: preprocessor tok=
en __NR_execve redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:642:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:37:9: sparse: sparse: preprocessor tok=
en __NR_chdir redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:169:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:51:9: sparse: sparse: preprocessor tok=
en __NR_lseek redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:908:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:53:9: sparse: sparse: preprocessor tok=
en __NR_getpid redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:521:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:55:9: sparse: sparse: preprocessor tok=
en __NR_mount redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:142:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:59:9: sparse: sparse: preprocessor tok=
en __NR_setuid redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:458:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:61:9: sparse: sparse: preprocessor tok=
en __NR_getuid redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:525:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:65:9: sparse: sparse: preprocessor tok=
en __NR_ptrace redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:385:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:85:9: sparse: sparse: preprocessor tok=
en __NR_sync redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:257:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:87:9: sparse: sparse: preprocessor tok=
en __NR_kill redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:418:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:95:9: sparse: sparse: preprocessor tok=
en __NR_dup redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:93:9: sparse: this was the original de=
finition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:99:9: sparse: sparse: preprocessor tok=
en __NR_times redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:472:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:103:9: sparse: sparse: preprocessor to=
ken __NR_brk redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:624:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:105:9: sparse: sparse: preprocessor to=
ken __NR_setgid redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:454:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:107:9: sparse: sparse: preprocessor to=
ken __NR_getgid redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:529:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:111:9: sparse: sparse: preprocessor to=
ken __NR_geteuid redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:527:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:113:9: sparse: sparse: preprocessor to=
ken __NR_getegid redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:531:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:115:9: sparse: sparse: preprocessor to=
ken __NR_acct redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:292:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:117:9: sparse: sparse: preprocessor to=
ken __NR_umount2 redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:140:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:121:9: sparse: sparse: preprocessor to=
ken __NR_ioctl redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:109:9: sparse: this was the original d=
efinition
   arch/arm64/kernel/sys32.c: note: in included file:
   arch/arm64/include/asm/unistd32.h:123:9: sparse: sparse: preprocessor to=
ken __NR_fcntl redefined
   arch/arm64/kernel/sys32.c: note: in included file (through arch/arm64/in=
clude/asm/processor.h, include/linux/rcupdate.h, include/linux/rculist.h, .=
..):
   include/uapi/asm-generic/unistd.h:903:9: sparse: this was the original d=
efinition

vim +416 include/uapi/asm-generic/unistd.h

8a1ab3155c2ac7 David Howells 2012-10-04  414  =

8a1ab3155c2ac7 David Howells 2012-10-04  415  /* kernel/signal.c */
8a1ab3155c2ac7 David Howells 2012-10-04 @416  #define __NR_restart_syscall =
128
8a1ab3155c2ac7 David Howells 2012-10-04  417  __SYSCALL(__NR_restart_syscal=
l, sys_restart_syscall)
8a1ab3155c2ac7 David Howells 2012-10-04  418  #define __NR_kill 129
8a1ab3155c2ac7 David Howells 2012-10-04  419  __SYSCALL(__NR_kill, sys_kill)
8a1ab3155c2ac7 David Howells 2012-10-04  420  #define __NR_tkill 130
8a1ab3155c2ac7 David Howells 2012-10-04  421  __SYSCALL(__NR_tkill, sys_tki=
ll)
8a1ab3155c2ac7 David Howells 2012-10-04  422  #define __NR_tgkill 131
8a1ab3155c2ac7 David Howells 2012-10-04  423  __SYSCALL(__NR_tgkill, sys_tg=
kill)
8a1ab3155c2ac7 David Howells 2012-10-04  424  #define __NR_sigaltstack 132
8a1ab3155c2ac7 David Howells 2012-10-04  425  __SC_COMP(__NR_sigaltstack, s=
ys_sigaltstack, compat_sys_sigaltstack)
8a1ab3155c2ac7 David Howells 2012-10-04  426  #define __NR_rt_sigsuspend 133
8a1ab3155c2ac7 David Howells 2012-10-04  427  __SC_COMP(__NR_rt_sigsuspend,=
 sys_rt_sigsuspend, compat_sys_rt_sigsuspend)
8a1ab3155c2ac7 David Howells 2012-10-04  428  #define __NR_rt_sigaction 134
8a1ab3155c2ac7 David Howells 2012-10-04  429  __SC_COMP(__NR_rt_sigaction, =
sys_rt_sigaction, compat_sys_rt_sigaction)
8a1ab3155c2ac7 David Howells 2012-10-04  430  #define __NR_rt_sigprocmask 1=
35
03e275959850f5 Al Viro       2012-12-25  431  __SC_COMP(__NR_rt_sigprocmask=
, sys_rt_sigprocmask, compat_sys_rt_sigprocmask)
8a1ab3155c2ac7 David Howells 2012-10-04  432  #define __NR_rt_sigpending 136
03e275959850f5 Al Viro       2012-12-25  433  __SC_COMP(__NR_rt_sigpending,=
 sys_rt_sigpending, compat_sys_rt_sigpending)
c8ce48f06503ee Arnd Bergmann 2019-02-18  434  #if defined(__ARCH_WANT_TIME3=
2_SYSCALLS) || __BITS_PER_LONG !=3D 32
8a1ab3155c2ac7 David Howells 2012-10-04  435  #define __NR_rt_sigtimedwait =
137
00bf25d693e7f6 Arnd Bergmann 2019-01-01  436  __SC_COMP_3264(__NR_rt_sigtim=
edwait, sys_rt_sigtimedwait_time32, \
00bf25d693e7f6 Arnd Bergmann 2019-01-01  437  	  sys_rt_sigtimedwait, compa=
t_sys_rt_sigtimedwait_time32)
c8ce48f06503ee Arnd Bergmann 2019-02-18  438  #endif
8a1ab3155c2ac7 David Howells 2012-10-04  439  #define __NR_rt_sigqueueinfo =
138
8a1ab3155c2ac7 David Howells 2012-10-04  440  __SC_COMP(__NR_rt_sigqueueinf=
o, sys_rt_sigqueueinfo, \
8a1ab3155c2ac7 David Howells 2012-10-04  441  	  compat_sys_rt_sigqueueinfo)
8a1ab3155c2ac7 David Howells 2012-10-04  442  #define __NR_rt_sigreturn 139
8a1ab3155c2ac7 David Howells 2012-10-04  443  __SC_COMP(__NR_rt_sigreturn, =
sys_rt_sigreturn, compat_sys_rt_sigreturn)
8a1ab3155c2ac7 David Howells 2012-10-04  444  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0612728166326021102==--

