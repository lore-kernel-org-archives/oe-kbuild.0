Content-Type: multipart/mixed; boundary="===============8035692492598195528=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mtd/nand/raw/renesas-nand-controller.c:900 rnandc_setup_interface() warn: passing a valid pointer to 'PTR_ERR'
Date: Wed, 09 Feb 2022 22:07:38 +0800
Message-ID: <202202092212.0gPYBlCk-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8035692492598195528==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e6251ab4551f51fa4cee03523e08051898c3ce82
commit: d8701fe890ecbab239086e7053d62d0f08587d7c mtd: rawnand: renesas: Add=
 new NAND controller driver
date:   7 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 weeks ago
config: arm-randconfig-m031-20220208 (https://download.01.org/0day-ci/archi=
ve/20220209/202202092212.0gPYBlCk-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/mtd/nand/raw/renesas-nand-controller.c:900 rnandc_setup_interface()=
 warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +900 drivers/mtd/nand/raw/renesas-nand-controller.c

d8701fe890ecbab Miquel Raynal 2021-12-17  888  =

d8701fe890ecbab Miquel Raynal 2021-12-17  889  static int rnandc_setup_inte=
rface(struct nand_chip *chip, int chipnr,
d8701fe890ecbab Miquel Raynal 2021-12-17  890  				  const struct nand_inte=
rface_config *conf)
d8701fe890ecbab Miquel Raynal 2021-12-17  891  {
d8701fe890ecbab Miquel Raynal 2021-12-17  892  	struct rnand_chip *rnand =
=3D to_rnand(chip);
d8701fe890ecbab Miquel Raynal 2021-12-17  893  	struct rnandc *rnandc =3D t=
o_rnandc(chip->controller);
d8701fe890ecbab Miquel Raynal 2021-12-17  894  	unsigned int period_ns =3D =
1000000000 / clk_get_rate(rnandc->eclk);
d8701fe890ecbab Miquel Raynal 2021-12-17  895  	const struct nand_sdr_timin=
gs *sdr;
d8701fe890ecbab Miquel Raynal 2021-12-17  896  	unsigned int cyc, cle, ale,=
 bef_dly, ca_to_data;
d8701fe890ecbab Miquel Raynal 2021-12-17  897  =

d8701fe890ecbab Miquel Raynal 2021-12-17  898  	sdr =3D nand_get_sdr_timing=
s(conf);
d8701fe890ecbab Miquel Raynal 2021-12-17  899  	if (IS_ERR(sdr))
d8701fe890ecbab Miquel Raynal 2021-12-17 @900  		return PTR_ERR(sdr);
d8701fe890ecbab Miquel Raynal 2021-12-17  901  =

d8701fe890ecbab Miquel Raynal 2021-12-17  902  	if (sdr->tRP_min !=3D sdr->=
tWP_min || sdr->tREH_min !=3D sdr->tWH_min) {
d8701fe890ecbab Miquel Raynal 2021-12-17  903  		dev_err(rnandc->dev, "Read=
 and write hold times must be identical\n");
d8701fe890ecbab Miquel Raynal 2021-12-17  904  		return -EINVAL;
d8701fe890ecbab Miquel Raynal 2021-12-17  905  	}
d8701fe890ecbab Miquel Raynal 2021-12-17  906  =

d8701fe890ecbab Miquel Raynal 2021-12-17  907  	if (chipnr < 0)
d8701fe890ecbab Miquel Raynal 2021-12-17  908  		return 0;
d8701fe890ecbab Miquel Raynal 2021-12-17  909  =

d8701fe890ecbab Miquel Raynal 2021-12-17  910  	rnand->timings_asyn =3D
d8701fe890ecbab Miquel Raynal 2021-12-17  911  		TIMINGS_ASYN_TRWP(TO_CYCLE=
S64(sdr->tRP_min, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  912  		TIMINGS_ASYN_TRWH(TO_CYCLE=
S64(sdr->tREH_min, period_ns));
d8701fe890ecbab Miquel Raynal 2021-12-17  913  	rnand->tim_seq0 =3D
d8701fe890ecbab Miquel Raynal 2021-12-17  914  		TIM_SEQ0_TCCS(TO_CYCLES64(=
sdr->tCCS_min, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  915  		TIM_SEQ0_TADL(TO_CYCLES64(=
sdr->tADL_min, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  916  		TIM_SEQ0_TRHW(TO_CYCLES64(=
sdr->tRHW_min, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  917  		TIM_SEQ0_TWHR(TO_CYCLES64(=
sdr->tWHR_min, period_ns));
d8701fe890ecbab Miquel Raynal 2021-12-17  918  	rnand->tim_seq1 =3D
d8701fe890ecbab Miquel Raynal 2021-12-17  919  		TIM_SEQ1_TWB(TO_CYCLES64(s=
dr->tWB_max, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  920  		TIM_SEQ1_TRR(TO_CYCLES64(s=
dr->tRR_min, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  921  		TIM_SEQ1_TWW(TO_CYCLES64(s=
dr->tWW_min, period_ns));
d8701fe890ecbab Miquel Raynal 2021-12-17  922  =

d8701fe890ecbab Miquel Raynal 2021-12-17  923  	cyc =3D sdr->tDS_min + sdr-=
>tDH_min;
d8701fe890ecbab Miquel Raynal 2021-12-17  924  	cle =3D sdr->tCLH_min + sdr=
->tCLS_min;
d8701fe890ecbab Miquel Raynal 2021-12-17  925  	ale =3D sdr->tALH_min + sdr=
->tALS_min;
d8701fe890ecbab Miquel Raynal 2021-12-17  926  	bef_dly =3D sdr->tWB_max - =
sdr->tDH_min;
d8701fe890ecbab Miquel Raynal 2021-12-17  927  	ca_to_data =3D sdr->tWHR_mi=
n + sdr->tREA_max - sdr->tDH_min;
d8701fe890ecbab Miquel Raynal 2021-12-17  928  =

d8701fe890ecbab Miquel Raynal 2021-12-17  929  	/*
d8701fe890ecbab Miquel Raynal 2021-12-17  930  	 * D0 =3D CMD -> ADDR =3D t=
CLH + tCLS - 1 cycle
d8701fe890ecbab Miquel Raynal 2021-12-17  931  	 * D1 =3D CMD -> CMD =3D tC=
LH + tCLS - 1 cycle
d8701fe890ecbab Miquel Raynal 2021-12-17  932  	 * D2 =3D CMD -> DLY =3D tW=
B - tDH
d8701fe890ecbab Miquel Raynal 2021-12-17  933  	 * D3 =3D CMD -> DATA =3D t=
WHR + tREA - tDH
d8701fe890ecbab Miquel Raynal 2021-12-17  934  	 */
d8701fe890ecbab Miquel Raynal 2021-12-17  935  	rnand->tim_gen_seq0 =3D
d8701fe890ecbab Miquel Raynal 2021-12-17  936  		TIM_GEN_SEQ0_D0(TO_CYCLES6=
4(cle - cyc, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  937  		TIM_GEN_SEQ0_D1(TO_CYCLES6=
4(cle - cyc, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  938  		TIM_GEN_SEQ0_D2(TO_CYCLES6=
4(bef_dly, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  939  		TIM_GEN_SEQ0_D3(TO_CYCLES6=
4(ca_to_data, period_ns));
d8701fe890ecbab Miquel Raynal 2021-12-17  940  =

d8701fe890ecbab Miquel Raynal 2021-12-17  941  	/*
d8701fe890ecbab Miquel Raynal 2021-12-17  942  	 * D4 =3D ADDR -> CMD =3D t=
ALH + tALS - 1 cyle
d8701fe890ecbab Miquel Raynal 2021-12-17  943  	 * D5 =3D ADDR -> ADDR =3D =
tALH + tALS - 1 cyle
d8701fe890ecbab Miquel Raynal 2021-12-17  944  	 * D6 =3D ADDR -> DLY =3D t=
WB - tDH
d8701fe890ecbab Miquel Raynal 2021-12-17  945  	 * D7 =3D ADDR -> DATA =3D =
tWHR + tREA - tDH
d8701fe890ecbab Miquel Raynal 2021-12-17  946  	 */
d8701fe890ecbab Miquel Raynal 2021-12-17  947  	rnand->tim_gen_seq1 =3D
d8701fe890ecbab Miquel Raynal 2021-12-17  948  		TIM_GEN_SEQ1_D4(TO_CYCLES6=
4(ale - cyc, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  949  		TIM_GEN_SEQ1_D5(TO_CYCLES6=
4(ale - cyc, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  950  		TIM_GEN_SEQ1_D6(TO_CYCLES6=
4(bef_dly, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  951  		TIM_GEN_SEQ1_D7(TO_CYCLES6=
4(ca_to_data, period_ns));
d8701fe890ecbab Miquel Raynal 2021-12-17  952  =

d8701fe890ecbab Miquel Raynal 2021-12-17  953  	/*
d8701fe890ecbab Miquel Raynal 2021-12-17  954  	 * D8 =3D DLY -> DATA =3D t=
RR + tREA
d8701fe890ecbab Miquel Raynal 2021-12-17  955  	 * D9 =3D DLY -> CMD =3D tRR
d8701fe890ecbab Miquel Raynal 2021-12-17  956  	 * D10 =3D DATA -> CMD =3D =
tCLH + tCLS - 1 cycle
d8701fe890ecbab Miquel Raynal 2021-12-17  957  	 * D11 =3D DATA -> DLY =3D =
tWB - tDH
d8701fe890ecbab Miquel Raynal 2021-12-17  958  	 */
d8701fe890ecbab Miquel Raynal 2021-12-17  959  	rnand->tim_gen_seq2 =3D
d8701fe890ecbab Miquel Raynal 2021-12-17  960  		TIM_GEN_SEQ2_D8(TO_CYCLES6=
4(sdr->tRR_min + sdr->tREA_max, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  961  		TIM_GEN_SEQ2_D9(TO_CYCLES6=
4(sdr->tRR_min, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  962  		TIM_GEN_SEQ2_D10(TO_CYCLES=
64(cle - cyc, period_ns)) |
d8701fe890ecbab Miquel Raynal 2021-12-17  963  		TIM_GEN_SEQ2_D11(TO_CYCLES=
64(bef_dly, period_ns));
d8701fe890ecbab Miquel Raynal 2021-12-17  964  =

d8701fe890ecbab Miquel Raynal 2021-12-17  965  	/* D12 =3D DATA -> END =3D =
tCLH - tDH */
d8701fe890ecbab Miquel Raynal 2021-12-17  966  	rnand->tim_gen_seq3 =3D
d8701fe890ecbab Miquel Raynal 2021-12-17  967  		TIM_GEN_SEQ3_D12(TO_CYCLES=
64(sdr->tCLH_min - sdr->tDH_min, period_ns));
d8701fe890ecbab Miquel Raynal 2021-12-17  968  =

d8701fe890ecbab Miquel Raynal 2021-12-17  969  	return 0;
d8701fe890ecbab Miquel Raynal 2021-12-17  970  }
d8701fe890ecbab Miquel Raynal 2021-12-17  971  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8035692492598195528==--

