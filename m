Content-Type: multipart/mixed; boundary="===============2630215671383349305=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3357/9592] drivers/soc/rockchip/dtpm.c:15:12: sparse: sparse: obsolete array initializer, use C99 syntax
Date: Tue, 01 Mar 2022 20:11:08 +0800
Message-ID: <202203012019.rJHP6aue-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2630215671383349305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   e6ada6df471f847da3b09b357e246c62335bc0bb
commit: b9d6c47a2be8d273ecc063afda6e9fd66a35116d [3357/9592] rockchip/soc/d=
rivers: Add DTPM description for rk3399
:::::: branch date: 2 hours ago
:::::: commit date: 4 weeks ago
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/2022030=
1/202203012019.rJHP6aue-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Db9d6c47a2be8d273ecc063afda6e9fd66a35116d
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout b9d6c47a2be8d273ecc063afda6e9fd66a35116d
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm64 SHELL=3D/bin/bash drivers/soc/rockchip/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/soc/rockchip/dtpm.c:15:12: sparse: sparse: obsolete array initia=
lizer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:17:12: sparse: sparse: obsolete array initia=
lizer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:20:12: sparse: sparse: obsolete array initia=
lizer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:23:12: sparse: sparse: obsolete array initia=
lizer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:26:12: sparse: sparse: obsolete array initia=
lizer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:29:12: sparse: sparse: obsolete array initia=
lizer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:32:12: sparse: sparse: obsolete array initia=
lizer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:35:12: sparse: sparse: obsolete array initia=
lizer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:38:12: sparse: sparse: obsolete array initia=
lizer, use C99 syntax
   drivers/soc/rockchip/dtpm.c:41:12: sparse: sparse: obsolete array initia=
lizer, use C99 syntax

vim +15 drivers/soc/rockchip/dtpm.c

b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  13  =

b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  14  static struct dtpm_node __ini=
tdata rk3399_hierarchy[] =3D {
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28 @15  	[0]{ .name =3D "rk3399",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  16  	     .type =3D DTPM_NODE_VIR=
TUAL },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  17  	[1]{ .name =3D "package",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  18  	     .type =3D DTPM_NODE_VIR=
TUAL,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  19  	     .parent =3D &rk3399_hie=
rarchy[0] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  20  	[2]{ .name =3D "/cpus/cpu(a)=
0",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  21  	     .type =3D DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  22  	     .parent =3D &rk3399_hie=
rarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  23  	[3]{ .name =3D "/cpus/cpu(a)=
1",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  24  	     .type =3D DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  25  	     .parent =3D &rk3399_hie=
rarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  26  	[4]{ .name =3D "/cpus/cpu(a)=
2",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  27  	     .type =3D DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  28  	     .parent =3D &rk3399_hie=
rarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  29  	[5]{ .name =3D "/cpus/cpu(a)=
3",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  30  	     .type =3D DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  31  	     .parent =3D &rk3399_hie=
rarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  32  	[6]{ .name =3D "/cpus/cpu(a)=
100",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  33  	     .type =3D DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  34  	     .parent =3D &rk3399_hie=
rarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  35  	[7]{ .name =3D "/cpus/cpu(a)=
101",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  36  	     .type =3D DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  37  	     .parent =3D &rk3399_hie=
rarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  38  	[8]{ .name =3D "/gpu(a)ff9a0=
000",
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  39  	     .type =3D DTPM_NODE_DT,
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  40  	     .parent =3D &rk3399_hie=
rarchy[1] },
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  41  	[9]{ /* sentinel */ }
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  42  };
b9d6c47a2be8d2 Daniel Lezcano 2022-01-28  43  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2630215671383349305==--

