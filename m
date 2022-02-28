Content-Type: multipart/mixed; boundary="===============3212786972669407777=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 7/7] clocksource/drivers/timer-microchip-pit64b: use mchp_pit64b_{suspend, resume}
Date: Tue, 01 Mar 2022 01:36:08 +0800
Message-ID: <202202282341.MtTmvsDV-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3212786972669407777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220228111923.1400049-8-claudiu.beznea@microchip.com>
References: <20220228111923.1400049-8-claudiu.beznea@microchip.com>
TO: Claudiu Beznea <claudiu.beznea@microchip.com>
TO: daniel.lezcano(a)linaro.org
TO: tglx(a)linutronix.de
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org
CC: Claudiu Beznea <claudiu.beznea@microchip.com>

Hi Claudiu,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/timers/core]
[also build test WARNING on soc/for-next linus/master v5.17-rc6 next-202202=
25]
[cannot apply to daniel-lezcano/clockevents/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Claudiu-Beznea/clocksource=
-drivers-timer-microchip-pit64b-fixes-and-improvements/20220228-191933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 35e13e9=
da9afbce13c1d36465504ece4e65f24fe
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: arm-randconfig-s032-20220227 (https://download.01.org/0day-ci/archi=
ve/20220228/202202282341.MtTmvsDV-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/a354e98d1b37361a46d6272ff=
ccc149e3b8bbbca
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Claudiu-Beznea/clocksource-drivers=
-timer-microchip-pit64b-fixes-and-improvements/20220228-191933
        git checkout a354e98d1b37361a46d6272ffccc149e3b8bbbca
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm SHELL=3D/bin/bash drivers/clocksource/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/clocksource/timer-microchip-pit64b.c:484:1: sparse: sparse: unus=
ed label 'pclk_unprepare'

vim +/pclk_unprepare +484 drivers/clocksource/timer-microchip-pit64b.c

625022a5f16061 Claudiu Beznea 2019-12-13  430  =

625022a5f16061 Claudiu Beznea 2019-12-13  431  static int __init mchp_pit64=
b_dt_init_timer(struct device_node *node,
625022a5f16061 Claudiu Beznea 2019-12-13  432  					    bool clkevt)
625022a5f16061 Claudiu Beznea 2019-12-13  433  {
b9c60a741f06ed Claudiu Beznea 2020-01-06  434  	struct mchp_pit64b_timer ti=
mer;
625022a5f16061 Claudiu Beznea 2019-12-13  435  	unsigned long clk_rate;
625022a5f16061 Claudiu Beznea 2019-12-13  436  	u32 irq =3D 0;
625022a5f16061 Claudiu Beznea 2019-12-13  437  	int ret;
625022a5f16061 Claudiu Beznea 2019-12-13  438  =

625022a5f16061 Claudiu Beznea 2019-12-13  439  	/* Parse DT node. */
625022a5f16061 Claudiu Beznea 2019-12-13  440  	timer.pclk =3D of_clk_get_b=
y_name(node, "pclk");
625022a5f16061 Claudiu Beznea 2019-12-13  441  	if (IS_ERR(timer.pclk))
625022a5f16061 Claudiu Beznea 2019-12-13  442  		return PTR_ERR(timer.pclk);
625022a5f16061 Claudiu Beznea 2019-12-13  443  =

625022a5f16061 Claudiu Beznea 2019-12-13  444  	timer.gclk =3D of_clk_get_b=
y_name(node, "gclk");
625022a5f16061 Claudiu Beznea 2019-12-13  445  	if (IS_ERR(timer.gclk))
625022a5f16061 Claudiu Beznea 2019-12-13  446  		return PTR_ERR(timer.gclk);
625022a5f16061 Claudiu Beznea 2019-12-13  447  =

625022a5f16061 Claudiu Beznea 2019-12-13  448  	timer.base =3D of_iomap(nod=
e, 0);
625022a5f16061 Claudiu Beznea 2019-12-13  449  	if (!timer.base)
625022a5f16061 Claudiu Beznea 2019-12-13  450  		return -ENXIO;
625022a5f16061 Claudiu Beznea 2019-12-13  451  =

625022a5f16061 Claudiu Beznea 2019-12-13  452  	if (clkevt) {
625022a5f16061 Claudiu Beznea 2019-12-13  453  		irq =3D irq_of_parse_and_m=
ap(node, 0);
625022a5f16061 Claudiu Beznea 2019-12-13  454  		if (!irq) {
625022a5f16061 Claudiu Beznea 2019-12-13  455  			ret =3D -ENODEV;
625022a5f16061 Claudiu Beznea 2019-12-13  456  			goto io_unmap;
625022a5f16061 Claudiu Beznea 2019-12-13  457  		}
625022a5f16061 Claudiu Beznea 2019-12-13  458  	}
625022a5f16061 Claudiu Beznea 2019-12-13  459  =

625022a5f16061 Claudiu Beznea 2019-12-13  460  	/* Initialize mode (prescal=
er + SGCK bit). To be used at runtime. */
0faff1ca60d69f Claudiu Beznea 2022-02-28  461  	ret =3D mchp_pit64b_init_mo=
de(&timer, MCHP_PIT64B_DEF_FREQ);
625022a5f16061 Claudiu Beznea 2019-12-13  462  	if (ret)
625022a5f16061 Claudiu Beznea 2019-12-13  463  		goto irq_unmap;
625022a5f16061 Claudiu Beznea 2019-12-13  464  =

a354e98d1b3736 Claudiu Beznea 2022-02-28  465  	if (timer.mode & MCHP_PIT64=
B_MR_SGCLK)
625022a5f16061 Claudiu Beznea 2019-12-13  466  		clk_rate =3D clk_get_rate(=
timer.gclk);
a354e98d1b3736 Claudiu Beznea 2022-02-28  467  	else
625022a5f16061 Claudiu Beznea 2019-12-13  468  		clk_rate =3D clk_get_rate(=
timer.pclk);
625022a5f16061 Claudiu Beznea 2019-12-13  469  	clk_rate =3D clk_rate / (MC=
HP_PIT64B_MODE_TO_PRES(timer.mode) + 1);
625022a5f16061 Claudiu Beznea 2019-12-13  470  =

625022a5f16061 Claudiu Beznea 2019-12-13  471  	if (clkevt)
625022a5f16061 Claudiu Beznea 2019-12-13  472  		ret =3D mchp_pit64b_init_c=
lkevt(&timer, clk_rate, irq);
625022a5f16061 Claudiu Beznea 2019-12-13  473  	else
625022a5f16061 Claudiu Beznea 2019-12-13  474  		ret =3D mchp_pit64b_init_c=
lksrc(&timer, clk_rate);
625022a5f16061 Claudiu Beznea 2019-12-13  475  =

625022a5f16061 Claudiu Beznea 2019-12-13  476  	if (ret)
625022a5f16061 Claudiu Beznea 2019-12-13  477  		goto gclk_unprepare;
625022a5f16061 Claudiu Beznea 2019-12-13  478  =

625022a5f16061 Claudiu Beznea 2019-12-13  479  	return 0;
625022a5f16061 Claudiu Beznea 2019-12-13  480  =

625022a5f16061 Claudiu Beznea 2019-12-13  481  gclk_unprepare:
625022a5f16061 Claudiu Beznea 2019-12-13  482  	if (timer.mode & MCHP_PIT64=
B_MR_SGCLK)
625022a5f16061 Claudiu Beznea 2019-12-13  483  		clk_disable_unprepare(time=
r.gclk);
625022a5f16061 Claudiu Beznea 2019-12-13 @484  pclk_unprepare:
625022a5f16061 Claudiu Beznea 2019-12-13  485  	clk_disable_unprepare(timer=
.pclk);
625022a5f16061 Claudiu Beznea 2019-12-13  486  irq_unmap:
625022a5f16061 Claudiu Beznea 2019-12-13  487  	irq_dispose_mapping(irq);
625022a5f16061 Claudiu Beznea 2019-12-13  488  io_unmap:
625022a5f16061 Claudiu Beznea 2019-12-13  489  	iounmap(timer.base);
625022a5f16061 Claudiu Beznea 2019-12-13  490  =

625022a5f16061 Claudiu Beznea 2019-12-13  491  	return ret;
625022a5f16061 Claudiu Beznea 2019-12-13  492  }
625022a5f16061 Claudiu Beznea 2019-12-13  493  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3212786972669407777==--

