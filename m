Content-Type: multipart/mixed; boundary="===============6305970197148283503=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 6/7] soc: mediatek: mmsys: Add reset controller support
Date: Thu, 15 Jul 2021 08:42:34 +0800
Message-ID: <202107150857.sniQJ86e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6305970197148283503==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210714121116.v2.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d=
@changeid>
References: <20210714121116.v2.6.I15e2419141a69b2e5c7e700c34d92a69df47e04d(=
a)changeid>
TO: Enric Balletbo i Serra <enric.balletbo@collabora.com>
TO: linux-kernel(a)vger.kernel.org
CC: chunkuang.hu(a)kernel.org
CC: hsinyi(a)chromium.org
CC: kernel(a)collabora.com
CC: drinkcat(a)chromium.org
CC: eizan(a)chromium.org
CC: linux-mediatek(a)lists.infradead.org
CC: matthias.bgg(a)gmail.com
CC: jitao.shi(a)mediatek.com
CC: Philipp Zabel <p.zabel@pengutronix.de>

Hi Enric,

I love your patch! Perhaps something to improve:

[auto build test WARNING on robh/for-next]
[also build test WARNING on pza/reset/next linux/master linus/master v5.14-=
rc1 next-20210714]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Enric-Balletbo-i-Serra/Add=
-support-to-the-mmsys-driver-to-be-a-reset-controller/20210714-181318
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-=
next
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
compiler: riscv64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/soc/mediatek/mtk-mmsys.c:104:6: warning: Unused variable: i [unu=
sedVariable]
    int i;
        ^

vim +104 drivers/soc/mediatek/mtk-mmsys.c

2c758e301ed95a Enric Balletbo i Serra 2020-03-25   97  =

08a3068f9490f0 Enric Balletbo i Serra 2021-07-14   98  static int mtk_mmsys=
_reset_update(struct reset_controller_dev *rcdev, unsigned long id,
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14   99  				  bool assert)
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  100  {
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  101  	struct mtk_mmsys *m=
msys =3D container_of(rcdev, struct mtk_mmsys, rcdev);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  102  	unsigned long flags;
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  103  	u32 reg;
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14 @104  	int i;
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  105  =

08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  106  	spin_lock_irqsave(&=
mmsys->lock, flags);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  107  =

08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  108  	reg =3D readl_relax=
ed(mmsys->regs + MMSYS_SW0_RST_B);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  109  =

08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  110  	if (assert)
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  111  		reg &=3D ~BIT(id);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  112  	else
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  113  		reg |=3D BIT(id);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  114  =

08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  115  	writel_relaxed(reg,=
 mmsys->regs + MMSYS_SW0_RST_B);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  116  =

08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  117  	spin_unlock_irqrest=
ore(&mmsys->lock, flags);
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  118  =

08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  119  	return 0;
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  120  }
08a3068f9490f0 Enric Balletbo i Serra 2021-07-14  121  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6305970197148283503==--

