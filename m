Content-Type: multipart/mixed; boundary="===============6685018059742845368=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [geert-renesas-drivers:renesas-clk-for-v5.20 14/19] drivers/clk/renesas/clk-r8a7779.c:137 r8a7779_cpg_clocks_init() warn: possible memory leak of 'data'
Date: Sun, 19 Jun 2022 13:24:24 +0800
Message-ID: <202206191333.YmgTGPjZ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6685018059742845368==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-renesas-soc(a)vger.kernel.org
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drive=
rs.git renesas-clk-for-v5.20
head:   080bcd8d5997b1a615e17cab02bd9d16d1d4fbf3
commit: 444877983933d0efaf6788eabf2f750b1c175419 [14/19] clk: renesas: r8a7=
779: Remove struct r8a7779_cpg
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: parisc-randconfig-m031-20220619 (https://download.01.org/0day-ci/ar=
chive/20220619/202206191333.YmgTGPjZ-lkp(a)intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/renesas/clk-r8a7779.c:137 r8a7779_cpg_clocks_init() warn: possi=
ble memory leak of 'data'

vim +/data +137 drivers/clk/renesas/clk-r8a7779.c

7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  112  =

7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  113  static void __init r8a7779_cpg_clocks_init(struct device_node *n=
p)
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  114  {
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  115  	const struct cpg_clk_config *config;
444877983933d0 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2022-0=
6-08  116  	struct clk_onecell_data *data;
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  117  	struct clk **clks;
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  118  	unsigned int i, plla_mult;
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  119  	int num_clks;
931db8a0c646e2 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2016-0=
6-01  120  	u32 mode;
931db8a0c646e2 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2016-0=
6-01  121  =

931db8a0c646e2 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2016-0=
6-01  122  	if (rcar_rst_read_mode_pins(&mode))
931db8a0c646e2 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2016-0=
6-01  123  		return;
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  124  =

7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  125  	num_clks =3D of_property_count_strings(np, "clock-output-names"=
);
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  126  	if (num_clks < 0) {
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  127  		pr_err("%s: failed to count clocks\n", __func__);
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  128  		return;
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  129  	}
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  130  =

444877983933d0 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2022-0=
6-08  131  	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
6396bb221514d2 drivers/clk/renesas/clk-r8a7779.c  Kees Cook          2018-0=
6-12  132  	clks =3D kcalloc(CPG_NUM_CLOCKS, sizeof(*clks), GFP_KERNEL);
444877983933d0 drivers/clk/renesas/clk-r8a7779.c  Geert Uytterhoeven 2022-0=
6-08  133  	if (data =3D=3D NULL || clks =3D=3D NULL) {
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  134  		/* We're leaking memory on purpose, there's no point in cleani=
ng
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  135  		 * up as the system won't boot anyway.
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18  136  		 */
7b42a997bfb93c drivers/clk/shmobile/clk-r8a7779.c Simon Horman       2014-0=
4-18 @137  		return;

:::::: The code@line 137 was first introduced by commit
:::::: 7b42a997bfb93c6ae0709f34ec8e2860757804b5 clk: shmobile: r8a7779: Add=
 clocks support

:::::: TO: Simon Horman <horms+renesas@verge.net.au>
:::::: CC: Mike Turquette <mturquette@linaro.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6685018059742845368==--

