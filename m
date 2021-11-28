Content-Type: multipart/mixed; boundary="===============3216775502959096091=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/nand/raw/pl35x-nand-controller.c:789 pl35x_nfc_setup_interface() warn: passing a valid pointer to 'PTR_ERR'
Date: Mon, 29 Nov 2021 07:23:07 +0800
Message-ID: <202111290715.ri1gAWCJ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3216775502959096091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   d06c942efea40e1701ade200477a7449008d9f24
commit: 08d8c62164a322eb923034acacf25246b775593a mtd: rawnand: pl353: Add s=
upport for the ARM PL353 SMC NAND controller
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-m031-20211128 (https://download.01.org/0day-ci/archi=
ve/20211129/202111290715.ri1gAWCJ-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mtd/nand/raw/pl35x-nand-controller.c:789 pl35x_nfc_setup_interface(=
) warn: passing a valid pointer to 'PTR_ERR'
drivers/mtd/nand/raw/pl35x-nand-controller.c:1126 pl35x_nand_chips_init() e=
rror: uninitialized symbol 'ret'.

vim +/PTR_ERR +789 drivers/mtd/nand/raw/pl35x-nand-controller.c

08d8c62164a322 Miquel Raynal 2021-06-10  776  =

08d8c62164a322 Miquel Raynal 2021-06-10  777  static int pl35x_nfc_setup_in=
terface(struct nand_chip *chip, int cs,
08d8c62164a322 Miquel Raynal 2021-06-10  778  				     const struct nand_in=
terface_config *conf)
08d8c62164a322 Miquel Raynal 2021-06-10  779  {
08d8c62164a322 Miquel Raynal 2021-06-10  780  	struct pl35x_nandc *nfc =3D =
to_pl35x_nandc(chip->controller);
08d8c62164a322 Miquel Raynal 2021-06-10  781  	struct pl35x_nand *plnand =
=3D to_pl35x_nand(chip);
08d8c62164a322 Miquel Raynal 2021-06-10  782  	struct pl35x_nand_timings tm=
gs =3D {};
08d8c62164a322 Miquel Raynal 2021-06-10  783  	const struct nand_sdr_timing=
s *sdr;
08d8c62164a322 Miquel Raynal 2021-06-10  784  	unsigned int period_ns, val;
08d8c62164a322 Miquel Raynal 2021-06-10  785  	struct clk *mclk;
08d8c62164a322 Miquel Raynal 2021-06-10  786  =

08d8c62164a322 Miquel Raynal 2021-06-10  787  	sdr =3D nand_get_sdr_timings=
(conf);
08d8c62164a322 Miquel Raynal 2021-06-10  788  	if (IS_ERR(sdr))
08d8c62164a322 Miquel Raynal 2021-06-10 @789  		return PTR_ERR(sdr);
08d8c62164a322 Miquel Raynal 2021-06-10  790  =

08d8c62164a322 Miquel Raynal 2021-06-10  791  	mclk =3D of_clk_get_by_name(=
nfc->dev->parent->of_node, "memclk");
08d8c62164a322 Miquel Raynal 2021-06-10  792  	if (IS_ERR(mclk)) {
08d8c62164a322 Miquel Raynal 2021-06-10  793  		dev_err(nfc->dev, "Failed t=
o retrieve SMC memclk\n");
08d8c62164a322 Miquel Raynal 2021-06-10  794  		return PTR_ERR(mclk);
08d8c62164a322 Miquel Raynal 2021-06-10  795  	}
08d8c62164a322 Miquel Raynal 2021-06-10  796  =

08d8c62164a322 Miquel Raynal 2021-06-10  797  	/*
08d8c62164a322 Miquel Raynal 2021-06-10  798  	 * SDR timings are given in =
pico-seconds while NFC timings must be
08d8c62164a322 Miquel Raynal 2021-06-10  799  	 * expressed in NAND control=
ler clock cycles. We use the TO_CYCLE()
08d8c62164a322 Miquel Raynal 2021-06-10  800  	 * macro to convert from one=
 to the other.
08d8c62164a322 Miquel Raynal 2021-06-10  801  	 */
08d8c62164a322 Miquel Raynal 2021-06-10  802  	period_ns =3D NSEC_PER_SEC /=
 clk_get_rate(mclk);
08d8c62164a322 Miquel Raynal 2021-06-10  803  =

08d8c62164a322 Miquel Raynal 2021-06-10  804  	/*
08d8c62164a322 Miquel Raynal 2021-06-10  805  	 * PL35X SMC needs one extra=
 read cycle in SDR Mode 5. This is not
08d8c62164a322 Miquel Raynal 2021-06-10  806  	 * written anywhere in the d=
atasheet but is an empirical observation.
08d8c62164a322 Miquel Raynal 2021-06-10  807  	 */
08d8c62164a322 Miquel Raynal 2021-06-10  808  	val =3D TO_CYCLES(sdr->tRC_m=
in, period_ns);
08d8c62164a322 Miquel Raynal 2021-06-10  809  	if (sdr->tRC_min <=3D 20000)
08d8c62164a322 Miquel Raynal 2021-06-10  810  		val++;
08d8c62164a322 Miquel Raynal 2021-06-10  811  =

08d8c62164a322 Miquel Raynal 2021-06-10  812  	tmgs.t_rc =3D val;
08d8c62164a322 Miquel Raynal 2021-06-10  813  	if (tmgs.t_rc !=3D val || tm=
gs.t_rc < 2)
08d8c62164a322 Miquel Raynal 2021-06-10  814  		return -EINVAL;
08d8c62164a322 Miquel Raynal 2021-06-10  815  =

08d8c62164a322 Miquel Raynal 2021-06-10  816  	val =3D TO_CYCLES(sdr->tWC_m=
in, period_ns);
08d8c62164a322 Miquel Raynal 2021-06-10  817  	tmgs.t_wc =3D val;
08d8c62164a322 Miquel Raynal 2021-06-10  818  	if (tmgs.t_wc !=3D val || tm=
gs.t_wc < 2)
08d8c62164a322 Miquel Raynal 2021-06-10  819  		return -EINVAL;
08d8c62164a322 Miquel Raynal 2021-06-10  820  =

08d8c62164a322 Miquel Raynal 2021-06-10  821  	/*
08d8c62164a322 Miquel Raynal 2021-06-10  822  	 * For all SDR modes, PL35X =
SMC needs tREA_max being 1,
08d8c62164a322 Miquel Raynal 2021-06-10  823  	 * this is also an empirical=
 result.
08d8c62164a322 Miquel Raynal 2021-06-10  824  	 */
08d8c62164a322 Miquel Raynal 2021-06-10  825  	tmgs.t_rea =3D 1;
08d8c62164a322 Miquel Raynal 2021-06-10  826  =

08d8c62164a322 Miquel Raynal 2021-06-10  827  	val =3D TO_CYCLES(sdr->tWP_m=
in, period_ns);
08d8c62164a322 Miquel Raynal 2021-06-10  828  	tmgs.t_wp =3D val;
08d8c62164a322 Miquel Raynal 2021-06-10  829  	if (tmgs.t_wp !=3D val || tm=
gs.t_wp < 1)
08d8c62164a322 Miquel Raynal 2021-06-10  830  		return -EINVAL;
08d8c62164a322 Miquel Raynal 2021-06-10  831  =

08d8c62164a322 Miquel Raynal 2021-06-10  832  	val =3D TO_CYCLES(sdr->tCLR_=
min, period_ns);
08d8c62164a322 Miquel Raynal 2021-06-10  833  	tmgs.t_clr =3D val;
08d8c62164a322 Miquel Raynal 2021-06-10  834  	if (tmgs.t_clr !=3D val)
08d8c62164a322 Miquel Raynal 2021-06-10  835  		return -EINVAL;
08d8c62164a322 Miquel Raynal 2021-06-10  836  =

08d8c62164a322 Miquel Raynal 2021-06-10  837  	val =3D TO_CYCLES(sdr->tAR_m=
in, period_ns);
08d8c62164a322 Miquel Raynal 2021-06-10  838  	tmgs.t_ar =3D val;
08d8c62164a322 Miquel Raynal 2021-06-10  839  	if (tmgs.t_ar !=3D val)
08d8c62164a322 Miquel Raynal 2021-06-10  840  		return -EINVAL;
08d8c62164a322 Miquel Raynal 2021-06-10  841  =

08d8c62164a322 Miquel Raynal 2021-06-10  842  	val =3D TO_CYCLES(sdr->tRR_m=
in, period_ns);
08d8c62164a322 Miquel Raynal 2021-06-10  843  	tmgs.t_rr =3D val;
08d8c62164a322 Miquel Raynal 2021-06-10  844  	if (tmgs.t_rr !=3D val)
08d8c62164a322 Miquel Raynal 2021-06-10  845  		return -EINVAL;
08d8c62164a322 Miquel Raynal 2021-06-10  846  =

08d8c62164a322 Miquel Raynal 2021-06-10  847  	if (cs =3D=3D NAND_DATA_IFAC=
E_CHECK_ONLY)
08d8c62164a322 Miquel Raynal 2021-06-10  848  		return 0;
08d8c62164a322 Miquel Raynal 2021-06-10  849  =

08d8c62164a322 Miquel Raynal 2021-06-10  850  	plnand->timings =3D PL35X_SM=
C_NAND_TRC_CYCLES(tmgs.t_rc) |
08d8c62164a322 Miquel Raynal 2021-06-10  851  			  PL35X_SMC_NAND_TWC_CYCLE=
S(tmgs.t_wc) |
08d8c62164a322 Miquel Raynal 2021-06-10  852  			  PL35X_SMC_NAND_TREA_CYCL=
ES(tmgs.t_rea) |
08d8c62164a322 Miquel Raynal 2021-06-10  853  			  PL35X_SMC_NAND_TWP_CYCLE=
S(tmgs.t_wp) |
08d8c62164a322 Miquel Raynal 2021-06-10  854  			  PL35X_SMC_NAND_TCLR_CYCL=
ES(tmgs.t_clr) |
08d8c62164a322 Miquel Raynal 2021-06-10  855  			  PL35X_SMC_NAND_TAR_CYCLE=
S(tmgs.t_ar) |
08d8c62164a322 Miquel Raynal 2021-06-10  856  			  PL35X_SMC_NAND_TRR_CYCLE=
S(tmgs.t_rr);
08d8c62164a322 Miquel Raynal 2021-06-10  857  =

08d8c62164a322 Miquel Raynal 2021-06-10  858  	return 0;
08d8c62164a322 Miquel Raynal 2021-06-10  859  }
08d8c62164a322 Miquel Raynal 2021-06-10  860  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3216775502959096091==--

