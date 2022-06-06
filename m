Content-Type: multipart/mixed; boundary="===============0535584994810984972=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm/mach-sa1100/jornada720_ssp.c:24: warning: expecting prototype for arch/arm/mac(). Prototype was for DEFINE_SPINLOCK() instead
Date: Tue, 07 Jun 2022 04:37:08 +0800
Message-ID: <202206070454.VCS7NMnB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0535584994810984972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 arch/arm/mach-sa1100/jornada720_ssp.c:24: warning: expecting prototype for=
 arch/arm/mac(). Prototype was for DEFINE_SPINLOCK() instead"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Aditya Srivastava <yashsri421@gmail.com>
CC: Jonathan Corbet <corbet@lwn.net>

Hi Aditya,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f2906aa863381afb0015a9eb7fefad885d4e5a56
commit: f9bbc12ccb35ac8b3fa01cec1a19cb523a7707c7 scripts: kernel-doc: impro=
ve parsing for kernel-doc comments syntax
date:   1 year, 2 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 1 year, 2 months ago
config: arm-randconfig-c002-20220604 (https://download.01.org/0day-ci/archi=
ve/20220607/202206070454.VCS7NMnB-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project b364c7=
6683f8ef241025a9556300778c07b590c2)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df9bbc12ccb35ac8b3fa01cec1a19cb523a7707c7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f9bbc12ccb35ac8b3fa01cec1a19cb523a7707c7
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/arm/mach-sa1100/jornada720_ssp.c:24: warning: expecting prototype f=
or arch/arm/mac(). Prototype was for DEFINE_SPINLOCK() instead
   arch/arm/mach-sa1100/jornada720_ssp.c:34: warning: Function parameter or=
 member 'byte' not described in 'jornada_ssp_reverse'
   arch/arm/mach-sa1100/jornada720_ssp.c:57: warning: Function parameter or=
 member 'byte' not described in 'jornada_ssp_byte'
   arch/arm/mach-sa1100/jornada720_ssp.c:85: warning: Function parameter or=
 member 'byte' not described in 'jornada_ssp_inout'


vim +24 arch/arm/mach-sa1100/jornada720_ssp.c

69ebb22277a53f6 Kristoffer Ericson 2007-07-20  23  =

69ebb22277a53f6 Kristoffer Ericson 2007-07-20 @24  static DEFINE_SPINLOCK(j=
ornada_ssp_lock);
69ebb22277a53f6 Kristoffer Ericson 2007-07-20  25  static unsigned long jor=
nada_ssp_flags;
69ebb22277a53f6 Kristoffer Ericson 2007-07-20  26  =


:::::: The code at line 24 was first introduced by commit
:::::: 69ebb22277a53f612ccd632ceb73ed87c9093412 [ARM] 4506/1: HP Jornada 7X=
X: Addition of SSP Platform Driver

:::::: TO: Kristoffer Ericson <Kristoffer_e1@hotmail.com>
:::::: CC: Russell King <rmk+kernel@arm.linux.org.uk>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0535584994810984972==--

