Content-Type: multipart/mixed; boundary="===============1556385168388499492=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2341/11208] drivers/clk/renesas/clk-r8a7779.c:137 r8a7779_cpg_clocks_init() warn: possible memory leak of 'data'
Date: Tue, 19 Jul 2022 03:13:27 +0800
Message-ID: <202207190350.wHBv8Dou-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1556385168388499492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   036ad6daa8f0fd357af7f50f9da58539eaa6f68c
commit: 444877983933d0efaf6788eabf2f750b1c175419 [2341/11208] clk: renesas:=
 r8a7779: Remove struct r8a7779_cpg
:::::: branch date: 8 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-m031-20220717 (https://download.01.org/0day-ci/arc=
hive/20220719/202207190350.wHBv8Dou-lkp(a)intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

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
--===============1556385168388499492==--

