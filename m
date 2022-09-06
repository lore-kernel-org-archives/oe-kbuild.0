Content-Type: multipart/mixed; boundary="===============8687313838003845031=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 1/8] memory: tegra: Add API for retrieving carveout bounds
Date: Wed, 07 Sep 2022 05:21:58 +0800
Message-ID: <202209070510.K0JvnX0n-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8687313838003845031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
emory/tegra/mc.c:124:86: sparse: sparse: shift too big (32) for type unsign=
ed int"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220906132823.2390953-2-cyndis@kapsi.fi>
References: <20220906132823.2390953-2-cyndis@kapsi.fi>
TO: Mikko Perttunen <cyndis@kapsi.fi>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: David Airlie <airlied@linux.ie>
TO: Daniel Vetter <daniel@ffwll.ch>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Jonathan Hunter <jonathanh@nvidia.com>
CC: devicetree(a)vger.kernel.org
CC: Sameer Pujar <spujar@nvidia.com>
CC: linux-kernel(a)vger.kernel.org
CC: dri-devel(a)lists.freedesktop.org
CC: Mikko Perttunen <mperttunen@nvidia.com>
CC: linux-tegra(a)vger.kernel.org
CC: Ashish Mhetre <amhetre@nvidia.com>

Hi Mikko,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on clk/clk-next krzk-mem-ctrl/for-next pza/reset/n=
ext linus/master v6.0-rc4 next-20220906]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mikko-Perttunen/Supp=
ort-for-NVDEC-on-Tegra234/20220906-215151
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: openrisc-randconfig-s041-20220906 (https://download.01.org/0day-ci/=
archive/20220907/202209070510.K0JvnX0n-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/7e2bd1173420c8e09ec=
90e3322e059a7350482e3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Mikko-Perttunen/Support-for-NVDEC-=
on-Tegra234/20220906-215151
        git checkout 7e2bd1173420c8e09ec90e3322e059a7350482e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Do=
penrisc SHELL=3D/bin/bash drivers/memory/tegra/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/memory/tegra/mc.c: note: in included file (through arch/openrisc=
/include/asm/io.h, include/linux/scatterlist.h, include/linux/dma-mapping.h=
):
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
>> drivers/memory/tegra/mc.c:124:86: sparse: sparse: shift too big (32) for=
 type unsigned int
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:379:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:379:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned int [usertype] value =
@@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned int [user=
type] value
   include/asm-generic/io.h:379:22: sparse:     got restricted __le32 [user=
type]
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: cast to restricted __le=
32
   include/asm-generic/io.h:335:15: sparse: sparse: too many warnings

vim +124 drivers/memory/tegra/mc.c

393d66fd2cacba Thierry Reding  2021-06-03  109  =

7e2bd1173420c8 Mikko Perttunen 2022-09-06  110  int tegra_mc_get_carveout_i=
nfo(struct tegra_mc *mc, unsigned int id,
7e2bd1173420c8 Mikko Perttunen 2022-09-06  111                             =
    phys_addr_t *base, u64 *size)
7e2bd1173420c8 Mikko Perttunen 2022-09-06  112  {
7e2bd1173420c8 Mikko Perttunen 2022-09-06  113  	u32 offset;
7e2bd1173420c8 Mikko Perttunen 2022-09-06  114  =

7e2bd1173420c8 Mikko Perttunen 2022-09-06  115  	if (id < 1 || id >=3D mc->=
soc->num_carveouts)
7e2bd1173420c8 Mikko Perttunen 2022-09-06  116  		return -EINVAL;
7e2bd1173420c8 Mikko Perttunen 2022-09-06  117  =

7e2bd1173420c8 Mikko Perttunen 2022-09-06  118  	if (id < 6)
7e2bd1173420c8 Mikko Perttunen 2022-09-06  119  		offset =3D 0xc0c + 0x50 *=
 (id - 1);
7e2bd1173420c8 Mikko Perttunen 2022-09-06  120  	else
7e2bd1173420c8 Mikko Perttunen 2022-09-06  121  		offset =3D 0x2004 + 0x50 =
* (id - 6);
7e2bd1173420c8 Mikko Perttunen 2022-09-06  122  =

7e2bd1173420c8 Mikko Perttunen 2022-09-06  123  	*base =3D mc_ch_readl(mc, =
MC_BROADCAST_CHANNEL, offset + 0x0);
7e2bd1173420c8 Mikko Perttunen 2022-09-06 @124  	*base |=3D (phys_addr_t)mc=
_ch_readl(mc, MC_BROADCAST_CHANNEL, offset + 0x4) << 32;
7e2bd1173420c8 Mikko Perttunen 2022-09-06  125  =

7e2bd1173420c8 Mikko Perttunen 2022-09-06  126  	if (size)
7e2bd1173420c8 Mikko Perttunen 2022-09-06  127  		*size =3D mc_ch_readl(mc,=
 MC_BROADCAST_CHANNEL, offset + 0x8) << 17;
7e2bd1173420c8 Mikko Perttunen 2022-09-06  128  =

7e2bd1173420c8 Mikko Perttunen 2022-09-06  129  	return 0;
7e2bd1173420c8 Mikko Perttunen 2022-09-06  130  }
7e2bd1173420c8 Mikko Perttunen 2022-09-06  131  EXPORT_SYMBOL_GPL(tegra_mc_=
get_carveout_info);
7e2bd1173420c8 Mikko Perttunen 2022-09-06  132  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8687313838003845031==--

