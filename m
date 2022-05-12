Content-Type: multipart/mixed; boundary="===============6819373354401178673=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 9623/11360] drivers/net/wwan/t7xx/t7xx_hif_cldma.c:94:34-44: ERROR: function t7xx_cldma_alloc_and_map_skb called on line 796 inside lock on line 779 but uses GFP_KERNEL
Date: Fri, 13 May 2022 07:03:07 +0800
Message-ID: <202205130656.t51kinLm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6819373354401178673==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Haijun Liu <haijun.liu@mediatek.com>
CC: Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>
CC: Ricardo Martinez <ricardo.martinez@linux.intel.com>
CC: Loic Poulain <loic.poulain@linaro.org>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
CC: Sergey Ryazanov <ryazanov.s.a@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   187b9ac8c348383f7f36c8413d73ad89e9b1e90a
commit: 13e920d93e37fcaef4a9309515798a3cae9dcf19 [9623/11360] net: wwan: t7=
xx: Add core components
:::::: branch date: 13 hours ago
:::::: commit date: 4 days ago
config: csky-randconfig-c023-20220512 (https://download.01.org/0day-ci/arch=
ive/20220513/202205130656.t51kinLm-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/wwan/t7xx/t7xx_hif_cldma.c:94:34-44: ERROR: function t7xx_cl=
dma_alloc_and_map_skb called on line 796 inside lock on line 779 but uses G=
FP_KERNEL

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6819373354401178673==--

