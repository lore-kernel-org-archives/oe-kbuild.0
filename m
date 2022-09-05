Content-Type: multipart/mixed; boundary="===============4025378705440040546=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 4630/4736] arch/ia64/kernel/sys_ia64.c:188:25: sparse: sparse: typename in expression
Date: Tue, 06 Sep 2022 05:03:23 +0800
Message-ID: <202209060537.4pAkboIA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4025378705440040546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/ia64=
/kernel/sys_ia64.c:188:25: sparse: sparse: typename in expression"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sergei Trofimovich <slyich@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
commit: 8b3fbb74a31e9abe49854c0e7815bc2337076cb4 [4630/4736] ia64: fix cloc=
k_getres(CLOCK_MONOTONIC) to report ITC frequency
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: ia64-randconfig-s043-20220905 (https://download.01.org/0day-ci/arch=
ive/20220906/202209060537.4pAkboIA-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D8b3fbb74a31e9abe49854c0e7815bc2337076cb4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 8b3fbb74a31e9abe49854c0e7815bc2337076cb4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Di=
a64 SHELL=3D/bin/bash arch/ia64/kernel/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/ia64/kernel/sys_ia64.c:188:25: sparse: sparse: typename in expressi=
on
   arch/ia64/kernel/sys_ia64.c:188:29: sparse: sparse: Expected ; at end of=
 statement
   arch/ia64/kernel/sys_ia64.c:188:29: sparse: sparse: got tick_ns
   arch/ia64/kernel/sys_ia64.c:188:39: sparse: sparse: Expected ; at the en=
d of type declaration
   arch/ia64/kernel/sys_ia64.c:188:39: sparse: sparse: got )
>> arch/ia64/kernel/sys_ia64.c:188:39: sparse: sparse: Trying to use reserv=
ed word 'void' as identifier
   arch/ia64/kernel/sys_ia64.c:188:39: sparse: sparse: Expected ; at end of=
 declaration
   arch/ia64/kernel/sys_ia64.c:188:39: sparse: sparse: got __vpp_verify
   arch/ia64/kernel/sys_ia64.c:188:39: sparse: sparse: Expected ; at the en=
d of type declaration
   arch/ia64/kernel/sys_ia64.c:188:39: sparse: sparse: got }
   arch/ia64/kernel/sys_ia64.c:188:39: sparse: sparse: Expected ) in nested=
 declarator
   arch/ia64/kernel/sys_ia64.c:188:39: sparse: sparse: got __attribute__
>> arch/ia64/kernel/sys_ia64.c:188:39: sparse: sparse: Trying to use reserv=
ed word 'typeof' as identifier
   arch/ia64/kernel/sys_ia64.c:188:39: sparse: sparse: Expected ; at the en=
d of type declaration
   arch/ia64/kernel/sys_ia64.c:188:39: sparse: sparse: got }
>> arch/ia64/kernel/sys_ia64.c:190:25: sparse: sparse: Trying to use reserv=
ed word 'return' as identifier
   arch/ia64/kernel/sys_ia64.c:190:32: sparse: sparse: Expected ; at end of=
 declaration
   arch/ia64/kernel/sys_ia64.c:190:32: sparse: sparse: got put_timespec64
   arch/ia64/kernel/sys_ia64.c:191:9: sparse: sparse: Expected ; at the end=
 of type declaration
   arch/ia64/kernel/sys_ia64.c:191:9: sparse: sparse: got }
   arch/ia64/kernel/sys_ia64.c:194:1: sparse: sparse: Expected ; at the end=
 of type declaration
   arch/ia64/kernel/sys_ia64.c:194:1: sparse: sparse: got }
   arch/ia64/kernel/sys_ia64.c:188:25: sparse: sparse: undefined identifier=
 's64'
   arch/ia64/kernel/sys_ia64.c:188:39: sparse: sparse: undefined identifier=
 '__vpp_verify'
   arch/ia64/kernel/sys_ia64.c:189:69: sparse: sparse: undefined identifier=
 'tick_ns'
>> arch/ia64/kernel/sys_ia64.c:189:68: sparse: sparse: invalid initializer

vim +188 arch/ia64/kernel/sys_ia64.c

8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  169  =

8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  170  asmlinkage long
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  171  ia64_clock_getres(const =
clockid_t which_clock, struct __kernel_timespec __user *tp)
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  172  {
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  173  	/*
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  174  	 * ia64's clock_gettime=
() syscall is implemented as a vdso call
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  175  	 * fsys_clock_gettime()=
. Currently it handles only
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  176  	 * CLOCK_REALTIME and C=
LOCK_MONOTONIC. Both are based on
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  177  	 * 'ar.itc' counter whi=
ch gets incremented at a constant
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  178  	 * frequency. It's usua=
lly 400MHz, ~2.5x times slower than CPU
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  179  	 * clock frequency. Whi=
ch is almost a 1ns hrtimer, but not quite.
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  180  	 *
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  181  	 * Let's special-case t=
hese timers to report correct precision
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  182  	 * based on ITC frequen=
cy and not HZ frequency for supported
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  183  	 * clocks.
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  184  	 */
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  185  	switch (which_clock) {
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  186  		case CLOCK_REALTIME:
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20  187  		case CLOCK_MONOTONIC:
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20 @188  			s64 tick_ns =3D DIV_R=
OUND_UP(NSEC_PER_SEC, local_cpu_data->itc_freq);
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20 @189  			struct timespec64 rtn=
_tp =3D ns_to_timespec64(tick_ns);
8b3fbb74a31e9a Sergei Trofimovich 2022-08-20 @190  			return put_timespec64=
(&rtn_tp, tp);

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4025378705440040546==--

