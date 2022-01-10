Content-Type: multipart/mixed; boundary="===============2011613443407420307=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10276/11918] arch/mips/include/asm/asm.h:313:9: sparse: this was the original definition
Date: Mon, 10 Jan 2022 22:24:55 +0800
Message-ID: <202201102243.AK3oH2Hf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2011613443407420307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Huang Pei <huangpei@loongson.cn>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   57c149e506d5bec1b845ad1a8a631063fcac1f6e
commit: f0b7ddbd794bdffade370f22bb7a774002208ef4 [10276/11918] MIPS: retire=
 "asm/llsc.h"
:::::: branch date: 6 hours ago
:::::: commit date: 5 days ago
config: mips-randconfig-s032-20220107 (https://download.01.org/0day-ci/arch=
ive/20220110/202201102243.AK3oH2Hf-lkp(a)intel.com/config)
compiler: mips64el-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Df0b7ddbd794bdffade370f22bb7a774002208ef4
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f0b7ddbd794bdffade370f22bb7a774002208ef4
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
ips SHELL=3D/bin/bash sound/pci/ca0106/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   sound/pci/ca0106/ca0106_mixer.c: note: in included file:
   sound/pci/ca0106/ca0106.h:62:9: sparse: sparse: preprocessor token PTR r=
edefined
   sound/pci/ca0106/ca0106_mixer.c: note: in included file (through arch/mi=
ps/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ..=
.):
>> arch/mips/include/asm/asm.h:313:9: sparse: this was the original definit=
ion
--
   command-line: note: in included file:
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQUIRE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_SEQ_CST redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_ACQ_REL redefin=
ed
   builtin:0:0: sparse: this was the original definition
   builtin:1:9: sparse: sparse: preprocessor token __ATOMIC_RELEASE redefin=
ed
   builtin:0:0: sparse: this was the original definition
   sound/pci/ca0106/ca0106_main.c: note: in included file:
   sound/pci/ca0106/ca0106.h:62:9: sparse: sparse: preprocessor token PTR r=
edefined
   sound/pci/ca0106/ca0106_main.c: note: in included file (through arch/mip=
s/include/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h, ...=
):
>> arch/mips/include/asm/asm.h:313:9: sparse: this was the original definit=
ion

vim +313 arch/mips/include/asm/asm.h

^1da177e4c3f41 include/asm-mips/asm.h Linus Torvalds 2005-04-16  312  =

^1da177e4c3f41 include/asm-mips/asm.h Linus Torvalds 2005-04-16 @313  #defi=
ne PTR		.dword
^1da177e4c3f41 include/asm-mips/asm.h Linus Torvalds 2005-04-16  314  #defi=
ne PTRSIZE		8
^1da177e4c3f41 include/asm-mips/asm.h Linus Torvalds 2005-04-16  315  #defi=
ne PTRLOG		3
^1da177e4c3f41 include/asm-mips/asm.h Linus Torvalds 2005-04-16  316  #endif
^1da177e4c3f41 include/asm-mips/asm.h Linus Torvalds 2005-04-16  317  =


:::::: The code at line 313 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2011613443407420307==--

