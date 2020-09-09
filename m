Content-Type: multipart/mixed; boundary="===============8705971227844127666=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] ARC: [plat-eznps]: Drop support for EZChip NPS platform
Date: Wed, 09 Sep 2020 15:55:42 +0800
Message-ID: <202009091509.lIP1lXJu%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8705971227844127666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200908210601.1746462-1-vgupta@synopsys.com>
References: <20200908210601.1746462-1-vgupta@synopsys.com>
TO: Vineet Gupta <Vineet.Gupta1@synopsys.com>
TO: linux-snps-arc(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: Ofer Levi <oferle@nvidia.com>
CC: Vineet Gupta <Vineet.Gupta1@synopsys.com>

Hi Vineet,

I love your patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v5.9-rc4 next-20200908]
[cannot apply to tip/locking/core linux/master arc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Vineet-Gupta/ARC-plat-eznp=
s-Drop-support-for-EZChip-NPS-platform/20200909-121133
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
34d4ddd359dbcdf6c5fb3f85a179243d7a1cb7f8
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: arc-randconfig-r026-20200909
compiler: arc-elf-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Darc  randconfig
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Darc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arc/Kconfig:100: can't open file "arch/arc/plat-eznps/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:71: oldconfig] Error 1
   make[1]: *** [Makefile:606: oldconfig] Error 2
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> arch/arc/Kconfig:100: can't open file "arch/arc/plat-eznps/Kconfig"
   make[2]: *** [scripts/kconfig/Makefile:71: olddefconfig] Error 1
   make[1]: *** [Makefile:606: olddefconfig] Error 2
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.

# https://github.com/0day-ci/linux/commit/80d11f778086417bae2b58423840deaa2=
e527ce6
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Vineet-Gupta/ARC-plat-eznps-Drop-support-f=
or-EZChip-NPS-platform/20200909-121133
git checkout 80d11f778086417bae2b58423840deaa2e527ce6
vim +100 arch/arc/Kconfig

cfdbc2e16e65c1e Vineet Gupta      2013-01-18   96  =

072eb693904a52d Christian Ruppert 2013-04-12   97  source "arch/arc/plat-tb=
10x/Kconfig"
556cc1c5f528dcc Alexey Brodkin    2014-01-27   98  source "arch/arc/plat-ax=
s10x/Kconfig"
cfdbc2e16e65c1e Vineet Gupta      2013-01-18   99  #New platform adds here
966657890e874d3 Noam Camus        2015-10-16 @100  source "arch/arc/plat-ez=
nps/Kconfig"
a518d63777a4e94 Alexey Brodkin    2017-08-15  101  source "arch/arc/plat-hs=
dk/Kconfig"
93ad700de2abc11 Vineet Gupta      2013-01-22  102  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8705971227844127666==--

