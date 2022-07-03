Content-Type: multipart/mixed; boundary="===============2348688921698252653=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 2305/7282] drivers/clk/renesas/clk-r8a7778.c:102 r8a7778_cpg_clocks_init() warn: possible memory leak of 'data'
Date: Sun, 03 Jul 2022 16:21:02 +0800
Message-ID: <202207031634.JqOyy8RN-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2348688921698252653==
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
head:   c4185b16aba73929aa76f0d030efbe79ae867808
commit: 1cfeec24273874ffdc5459ef2f138ab61b7207a7 [2305/7282] clk: renesas: =
r8a7778: Remove struct r8a7778_cpg
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: openrisc-randconfig-m031-20220703 (https://download.01.org/0day-ci/=
archive/20220703/202207031634.JqOyy8RN-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/clk/renesas/clk-r8a7778.c:102 r8a7778_cpg_clocks_init() warn: possi=
ble memory leak of 'data'

vim +/data +102 drivers/clk/renesas/clk-r8a7778.c

6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   69  =

6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   70  =

6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   71  static void __init r8a7778_cpg_clocks_init(struct device_node *n=
p)
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   72  {
1cfeec24273874 drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2022-0=
6-08   73  	struct clk_onecell_data *data;
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   74  	struct clk **clks;
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   75  	unsigned int i;
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   76  	int num_clks;
578d601cbc514b drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2016-0=
6-01   77  	u32 mode;
578d601cbc514b drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2016-0=
6-01   78  =

578d601cbc514b drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2016-0=
6-01   79  	if (rcar_rst_read_mode_pins(&mode))
578d601cbc514b drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2016-0=
6-01   80  		return;
578d601cbc514b drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2016-0=
6-01   81  =

578d601cbc514b drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2016-0=
6-01   82  	BUG_ON(!(mode & BIT(19)));
578d601cbc514b drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2016-0=
6-01   83  =

578d601cbc514b drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2016-0=
6-01   84  	cpg_mode_rates =3D (!!(mode & BIT(18)) << 2) |
578d601cbc514b drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2016-0=
6-01   85  			 (!!(mode & BIT(12)) << 1) |
578d601cbc514b drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2016-0=
6-01   86  			 (!!(mode & BIT(11)));
578d601cbc514b drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2016-0=
6-01   87  	cpg_mode_divs =3D (!!(mode & BIT(2)) << 1) |
578d601cbc514b drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2016-0=
6-01   88  			(!!(mode & BIT(1)));
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   89  =

6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   90  	num_clks =3D of_property_count_strings(np, "clock-output-names"=
);
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   91  	if (num_clks < 0) {
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   92  		pr_err("%s: failed to count clocks\n", __func__);
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   93  		return;
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   94  	}
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   95  =

1cfeec24273874 drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2022-0=
6-08   96  	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   97  	clks =3D kcalloc(num_clks, sizeof(*clks), GFP_KERNEL);
1cfeec24273874 drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2022-0=
6-08   98  	if (data =3D=3D NULL || clks =3D=3D NULL) {
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26   99  		/* We're leaking memory on purpose, there's no point in cleani=
ng
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  100  		 * up as the system won't boot anyway.
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  101  		 */
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26 @102  		return;
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  103  	}
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  104  =

1cfeec24273874 drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2022-0=
6-08  105  	data->clks =3D clks;
1cfeec24273874 drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2022-0=
6-08  106  	data->clk_num =3D num_clks;
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  107  =

6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  108  	for (i =3D 0; i < num_clks; ++i) {
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  109  		const char *name;
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  110  		struct clk *clk;
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  111  =

6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  112  		of_property_read_string_index(np, "clock-output-names", i,
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  113  					      &name);
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  114  =

1cfeec24273874 drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2022-0=
6-08  115  		clk =3D r8a7778_cpg_register_clock(np, name);
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  116  		if (IS_ERR(clk))
e665f029a283af drivers/clk/renesas/clk-r8a7778.c  Rob Herring        2018-0=
8-28  117  			pr_err("%s: failed to register %pOFn %s clock (%ld)\n",
e665f029a283af drivers/clk/renesas/clk-r8a7778.c  Rob Herring        2018-0=
8-28  118  			       __func__, np, name, PTR_ERR(clk));
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  119  		else
1cfeec24273874 drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2022-0=
6-08  120  			data->clks[i] =3D clk;
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  121  	}
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  122  =

1cfeec24273874 drivers/clk/renesas/clk-r8a7778.c  Geert Uytterhoeven 2022-0=
6-08  123  	of_clk_add_provider(np, of_clk_src_onecell_get, data);
8bc964aa25e56b drivers/clk/shmobile/clk-r8a7778.c Geert Uytterhoeven 2015-0=
8-04  124  =

8bc964aa25e56b drivers/clk/shmobile/clk-r8a7778.c Geert Uytterhoeven 2015-0=
8-04  125  	cpg_mstp_add_clk_domain(np);
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  126  }
6232c51cb37091 drivers/clk/shmobile/clk-r8a7778.c Ulrich Hecht       2015-0=
2-26  127  =


:::::: The code at line 102 was first introduced by commit
:::::: 6232c51cb370919b116e0aea38d12aa33aae2fa9 ARM: shmobile: r8a7778: com=
mon clock framework CPG driver

:::::: TO: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
:::::: CC: Simon Horman <horms+renesas@verge.net.au>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2348688921698252653==--

