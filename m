Content-Type: multipart/mixed; boundary="===============0622879710644654293=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [miquelraynal:nand/next 26/52] drivers/mtd/nand/raw/denali.c:779 denali_setup_interface() warn: passing a valid pointer to 'PTR_ERR'
Date: Mon, 15 Jun 2020 21:04:01 +0800
Message-ID: <202006152155.n8xsAwOy%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0622879710644654293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>
CC: Boris Brezillon <bbrezillon@kernel.org>

tree:   https://github.com/miquelraynal/linux-0day.git nand/next
head:   33d5c3d07abfc06a44fba577cec76fe8099a0cdc
commit: 20b3d8076851756b42ebe9f21d378abba5560d04 [26/52] mtd: rawnand: s/da=
ta_interface/interface_config/
:::::: branch date: 4 hours ago
:::::: commit date: 5 hours ago
config: i386-randconfig-m031-20200615 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mtd/nand/raw/denali.c:779 denali_setup_interface() warn: passing a =
valid pointer to 'PTR_ERR'

# https://github.com/miquelraynal/linux-0day/commit/20b3d8076851756b42ebe9f=
21d378abba5560d04
git remote add miquelraynal https://github.com/miquelraynal/linux-0day.git
git remote update miquelraynal
git checkout 20b3d8076851756b42ebe9f21d378abba5560d04
vim +/PTR_ERR +779 drivers/mtd/nand/raw/denali.c

ce082596ae4308 drivers/mtd/nand/denali.c     Jason Roberts   2010-05-13  76=
3  =

20b3d807685175 drivers/mtd/nand/raw/denali.c Miquel Raynal   2020-05-29  76=
4  static int denali_setup_interface(struct nand_chip *chip, int chipnr,
20b3d807685175 drivers/mtd/nand/raw/denali.c Miquel Raynal   2020-05-29  76=
5  				  const struct nand_interface_config *conf)
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  76=
6  {
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  76=
7  	static const unsigned int data_setup_on_host =3D 10000;
d8e8fd0ebf8b1b drivers/mtd/nand/raw/denali.c Masahiro Yamada 2019-04-02  76=
8  	struct denali_controller *denali =3D to_denali_controller(chip);
d8e8fd0ebf8b1b drivers/mtd/nand/raw/denali.c Masahiro Yamada 2019-04-02  76=
9  	struct denali_chip_sel *sel;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  77=
0  	const struct nand_sdr_timings *timings;
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  77=
1  	unsigned long t_x, mult_x;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  77=
2  	int acc_clks, re_2_we, re_2_re, we_2_re, addr_2_data;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  77=
3  	int rdwr_en_lo, rdwr_en_hi, rdwr_en_lo_hi, cs_setup;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  77=
4  	int addr_2_data_mask;
2dcfc7b3c89920 drivers/mtd/nand/raw/denali.c Masahiro Yamada 2019-04-02  77=
5  	u32 tmp;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  77=
6  =

1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  77=
7  	timings =3D nand_get_sdr_timings(conf);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  77=
8  	if (IS_ERR(timings))
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13 @77=
9  		return PTR_ERR(timings);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  78=
0  =

1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  78=
1  	/* clk_x period in picoseconds */
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  78=
2  	t_x =3D DIV_ROUND_DOWN_ULL(1000000000000ULL, denali->clk_x_rate);
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  78=
3  	if (!t_x)
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  78=
4  		return -EINVAL;
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  78=
5  =

1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  78=
6  	/*
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  78=
7  	 * The bus interface clock, clk_x, is phase aligned with the core clock.
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  78=
8  	 * The clk_x is an integral multiple N of the core clk.  The value N is
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  78=
9  	 * configured at IP delivery time, and its available value is 4, 5, 6.
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  79=
0  	 */
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  79=
1  	mult_x =3D DIV_ROUND_CLOSEST_ULL(denali->clk_x_rate, denali->clk_rate);
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  79=
2  	if (mult_x < 4 || mult_x > 6)
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  79=
3  		return -EINVAL;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  79=
4  =

1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  79=
5  	if (chipnr =3D=3D NAND_DATA_IFACE_CHECK_ONLY)
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  79=
6  		return 0;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  79=
7  =

d8e8fd0ebf8b1b drivers/mtd/nand/raw/denali.c Masahiro Yamada 2019-04-02  79=
8  	sel =3D &to_denali_chip(chip)->sels[chipnr];
d8e8fd0ebf8b1b drivers/mtd/nand/raw/denali.c Masahiro Yamada 2019-04-02  79=
9  =

1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  80=
0  	/* tRWH -> RE_2_WE */
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  80=
1  	re_2_we =3D DIV_ROUND_UP(timings->tRHW_min, t_x);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  80=
2  	re_2_we =3D min_t(int, re_2_we, RE_2_WE__VALUE);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  80=
3  =

0d3a966d2b34f4 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-16  80=
4  	tmp =3D ioread32(denali->reg + RE_2_WE);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  80=
5  	tmp &=3D ~RE_2_WE__VALUE;
8e4cbf7f0a55a2 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-22  80=
6  	tmp |=3D FIELD_PREP(RE_2_WE__VALUE, re_2_we);
d8e8fd0ebf8b1b drivers/mtd/nand/raw/denali.c Masahiro Yamada 2019-04-02  80=
7  	sel->re_2_we =3D tmp;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  80=
8  =

1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  80=
9  	/* tRHZ -> RE_2_RE */
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  81=
0  	re_2_re =3D DIV_ROUND_UP(timings->tRHZ_max, t_x);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  81=
1  	re_2_re =3D min_t(int, re_2_re, RE_2_RE__VALUE);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  81=
2  =

0d3a966d2b34f4 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-16  81=
3  	tmp =3D ioread32(denali->reg + RE_2_RE);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  81=
4  	tmp &=3D ~RE_2_RE__VALUE;
8e4cbf7f0a55a2 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-22  81=
5  	tmp |=3D FIELD_PREP(RE_2_RE__VALUE, re_2_re);
d8e8fd0ebf8b1b drivers/mtd/nand/raw/denali.c Masahiro Yamada 2019-04-02  81=
6  	sel->re_2_re =3D tmp;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  81=
7  =

7963f58cbf3a72 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-29  81=
8  	/*
7963f58cbf3a72 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-29  81=
9  	 * tCCS, tWHR -> WE_2_RE
7963f58cbf3a72 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-29  82=
0  	 *
7963f58cbf3a72 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-29  82=
1  	 * With WE_2_RE properly set, the Denali controller automatically takes
7963f58cbf3a72 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-29  82=
2  	 * care of the delay; the driver need not set NAND_WAIT_TCCS.
7963f58cbf3a72 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-29  82=
3  	 */
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  82=
4  	we_2_re =3D DIV_ROUND_UP(max(timings->tCCS_min, timings->tWHR_min), t_x=
);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  82=
5  	we_2_re =3D min_t(int, we_2_re, TWHR2_AND_WE_2_RE__WE_2_RE);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  82=
6  =

0d3a966d2b34f4 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-16  82=
7  	tmp =3D ioread32(denali->reg + TWHR2_AND_WE_2_RE);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  82=
8  	tmp &=3D ~TWHR2_AND_WE_2_RE__WE_2_RE;
8e4cbf7f0a55a2 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-22  82=
9  	tmp |=3D FIELD_PREP(TWHR2_AND_WE_2_RE__WE_2_RE, we_2_re);
d8e8fd0ebf8b1b drivers/mtd/nand/raw/denali.c Masahiro Yamada 2019-04-02  83=
0  	sel->hwhr2_and_we_2_re =3D tmp;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  83=
1  =

1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  83=
2  	/* tADL -> ADDR_2_DATA */
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  83=
3  =

1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  83=
4  	/* for older versions, ADDR_2_DATA is only 6 bit wide */
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  83=
5  	addr_2_data_mask =3D TCWAW_AND_ADDR_2_DATA__ADDR_2_DATA;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  83=
6  	if (denali->revision < 0x0501)
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  83=
7  		addr_2_data_mask >>=3D 1;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  83=
8  =

1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  83=
9  	addr_2_data =3D DIV_ROUND_UP(timings->tADL_min, t_x);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  84=
0  	addr_2_data =3D min_t(int, addr_2_data, addr_2_data_mask);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  84=
1  =

0d3a966d2b34f4 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-16  84=
2  	tmp =3D ioread32(denali->reg + TCWAW_AND_ADDR_2_DATA);
8e4cbf7f0a55a2 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-22  84=
3  	tmp &=3D ~TCWAW_AND_ADDR_2_DATA__ADDR_2_DATA;
8e4cbf7f0a55a2 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-22  84=
4  	tmp |=3D FIELD_PREP(TCWAW_AND_ADDR_2_DATA__ADDR_2_DATA, addr_2_data);
d8e8fd0ebf8b1b drivers/mtd/nand/raw/denali.c Masahiro Yamada 2019-04-02  84=
5  	sel->tcwaw_and_addr_2_data =3D tmp;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  84=
6  =

1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  84=
7  	/* tREH, tWH -> RDWR_EN_HI_CNT */
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  84=
8  	rdwr_en_hi =3D DIV_ROUND_UP(max(timings->tREH_min, timings->tWH_min),
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  84=
9  				  t_x);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  85=
0  	rdwr_en_hi =3D min_t(int, rdwr_en_hi, RDWR_EN_HI_CNT__VALUE);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  85=
1  =

0d3a966d2b34f4 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-16  85=
2  	tmp =3D ioread32(denali->reg + RDWR_EN_HI_CNT);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  85=
3  	tmp &=3D ~RDWR_EN_HI_CNT__VALUE;
8e4cbf7f0a55a2 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-22  85=
4  	tmp |=3D FIELD_PREP(RDWR_EN_HI_CNT__VALUE, rdwr_en_hi);
d8e8fd0ebf8b1b drivers/mtd/nand/raw/denali.c Masahiro Yamada 2019-04-02  85=
5  	sel->rdwr_en_hi_cnt =3D tmp;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  85=
6  =

5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  85=
7  	/*
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  85=
8  	 * tREA -> ACC_CLKS
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  85=
9  	 * tRP, tWP, tRHOH, tRC, tWC -> RDWR_EN_LO_CNT
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  86=
0  	 */
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  86=
1  =

5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  86=
2  	/*
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  86=
3  	 * Determine the minimum of acc_clks to meet the setup timing when
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  86=
4  	 * capturing the incoming data.
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  86=
5  	 *
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  86=
6  	 * The delay on the chip side is well-defined as tREA, but we need to
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  86=
7  	 * take additional delay into account. This includes a certain degree
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  86=
8  	 * of unknowledge, such as signal propagation delays on the PCB and
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  86=
9  	 * in the SoC, load capacity of the I/O pins, etc.
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  87=
0  	 */
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  87=
1  	acc_clks =3D DIV_ROUND_UP(timings->tREA_max + data_setup_on_host, t_x);
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  87=
2  =

5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  87=
3  	/* Determine the minimum of rdwr_en_lo_cnt from RE#/WE# pulse width */
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  87=
4  	rdwr_en_lo =3D DIV_ROUND_UP(max(timings->tRP_min, timings->tWP_min), t_=
x);
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  87=
5  =

5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  87=
6  	/* Extend rdwr_en_lo to meet the data hold timing */
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  87=
7  	rdwr_en_lo =3D max_t(int, rdwr_en_lo,
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  87=
8  			   acc_clks - timings->tRHOH_min / t_x);
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  87=
9  =

5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  88=
0  	/* Extend rdwr_en_lo to meet the requirement for RE#/WE# cycle time */
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  88=
1  	rdwr_en_lo_hi =3D DIV_ROUND_UP(max(timings->tRC_min, timings->tWC_min),
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  88=
2  				     t_x);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  88=
3  	rdwr_en_lo =3D max(rdwr_en_lo, rdwr_en_lo_hi - rdwr_en_hi);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  88=
4  	rdwr_en_lo =3D min_t(int, rdwr_en_lo, RDWR_EN_LO_CNT__VALUE);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  88=
5  =

5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  88=
6  	/* Center the data latch timing for extra safety */
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  88=
7  	acc_clks =3D (acc_clks + rdwr_en_lo +
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  88=
8  		    DIV_ROUND_UP(timings->tRHOH_min, t_x)) / 2;
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  88=
9  	acc_clks =3D min_t(int, acc_clks, ACC_CLKS__VALUE);
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  89=
0  =

5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  89=
1  	tmp =3D ioread32(denali->reg + ACC_CLKS);
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  89=
2  	tmp &=3D ~ACC_CLKS__VALUE;
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  89=
3  	tmp |=3D FIELD_PREP(ACC_CLKS__VALUE, acc_clks);
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  89=
4  	sel->acc_clks =3D tmp;
5756f2e8dad46e drivers/mtd/nand/raw/denali.c Masahiro Yamada 2020-03-17  89=
5  =

0d3a966d2b34f4 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-16  89=
6  	tmp =3D ioread32(denali->reg + RDWR_EN_LO_CNT);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  89=
7  	tmp &=3D ~RDWR_EN_LO_CNT__VALUE;
8e4cbf7f0a55a2 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-22  89=
8  	tmp |=3D FIELD_PREP(RDWR_EN_LO_CNT__VALUE, rdwr_en_lo);
d8e8fd0ebf8b1b drivers/mtd/nand/raw/denali.c Masahiro Yamada 2019-04-02  89=
9  	sel->rdwr_en_lo_cnt =3D tmp;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  90=
0  =

1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  90=
1  	/* tCS, tCEA -> CS_SETUP_CNT */
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  90=
2  	cs_setup =3D max3((int)DIV_ROUND_UP(timings->tCS_min, t_x) - rdwr_en_lo,
1dfac31a5a63ac drivers/mtd/nand/raw/denali.c Masahiro Yamada 2018-06-23  90=
3  			(int)DIV_ROUND_UP(timings->tCEA_max, t_x) - acc_clks,
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  90=
4  			0);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  90=
5  	cs_setup =3D min_t(int, cs_setup, CS_SETUP_CNT__VALUE);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  90=
6  =

0d3a966d2b34f4 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-16  90=
7  	tmp =3D ioread32(denali->reg + CS_SETUP_CNT);
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  90=
8  	tmp &=3D ~CS_SETUP_CNT__VALUE;
8e4cbf7f0a55a2 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-09-22  90=
9  	tmp |=3D FIELD_PREP(CS_SETUP_CNT__VALUE, cs_setup);
d8e8fd0ebf8b1b drivers/mtd/nand/raw/denali.c Masahiro Yamada 2019-04-02  91=
0  	sel->cs_setup_cnt =3D tmp;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  91=
1  =

1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  91=
2  	return 0;
1bb88666775e50 drivers/mtd/nand/denali.c     Masahiro Yamada 2017-06-13  91=
3  }
ce082596ae4308 drivers/mtd/nand/denali.c     Jason Roberts   2010-05-13  91=
4  =


:::::: The code at line 779 was first introduced by commit
:::::: 1bb88666775e50fdef1d915d395eca9267bd3ab1 mtd: nand: denali: handle t=
iming parameters by setup_data_interface()

:::::: TO: Masahiro Yamada <yamada.masahiro@socionext.com>
:::::: CC: Boris Brezillon <boris.brezillon@free-electrons.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0622879710644654293==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
75QwweUpfeb2f0YBOwsoKgIA
--===============0622879710644654293==--

