Content-Type: multipart/mixed; boundary="===============6312203417244358174=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mmc/host/renesas_sdhi_core.c:545:0: warning: Same expression used in consecutive assignments of 'new_tap' and 'error_tap'.
Date: Mon, 14 Dec 2020 14:55:23 +0800
Message-ID: <202012141420.5GXc1i8L-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6312203417244358174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Takeshi Saito <takeshi.saito.xv@renesas.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: Wolfram Sang <wsa-dev@sang-engineering.com>
CC: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2c85ebc57b3e1817b6ce1a6b703928e113a90442
commit: a38c078fea0b1393fd2acb50e91057d7e429d9aa mmc: renesas_sdhi: Avoid b=
ad TAP in HS400
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
compiler: c6x-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/mmc/host/renesas_sdhi_core.c:545:0: warning: Same expression use=
d in consecutive assignments of 'new_tap' and 'error_tap'. [duplicateAssign=
Expression]
    unsigned int new_tap =3D priv->tap_set, error_tap =3D priv->tap_set;
   ^
   drivers/mmc/host/renesas_sdhi_core.c:545:0: note: Same expression used i=
n consecutive assignments of 'new_tap' and 'error_tap'.
    unsigned int new_tap =3D priv->tap_set, error_tap =3D priv->tap_set;
   ^
   drivers/mmc/host/renesas_sdhi_core.c:545:0: note: Same expression used i=
n consecutive assignments of 'new_tap' and 'error_tap'.
    unsigned int new_tap =3D priv->tap_set, error_tap =3D priv->tap_set;
   ^

vim +545 drivers/mmc/host/renesas_sdhi_core.c

0c482d829ac4130 Wolfram Sang  2020-01-29  541  =

11a219606a9bc7f Takeshi Saito 2019-12-17  542  static bool renesas_sdhi_man=
ual_correction(struct tmio_mmc_host *host, bool use_4tap)
11a219606a9bc7f Takeshi Saito 2019-12-17  543  {
11a219606a9bc7f Takeshi Saito 2019-12-17  544  	struct renesas_sdhi *priv =
=3D host_to_priv(host);
a38c078fea0b139 Takeshi Saito 2020-04-23 @545  	unsigned int new_tap =3D pr=
iv->tap_set, error_tap =3D priv->tap_set;
11a219606a9bc7f Takeshi Saito 2019-12-17  546  	u32 val;
11a219606a9bc7f Takeshi Saito 2019-12-17  547  =

11a219606a9bc7f Takeshi Saito 2019-12-17  548  	val =3D sd_scc_read32(host,=
 priv, SH_MOBILE_SDHI_SCC_RVSREQ);
11a219606a9bc7f Takeshi Saito 2019-12-17  549  	if (!val)
11a219606a9bc7f Takeshi Saito 2019-12-17  550  		return false;
11a219606a9bc7f Takeshi Saito 2019-12-17  551  =

11a219606a9bc7f Takeshi Saito 2019-12-17  552  	sd_scc_write32(host, priv, =
SH_MOBILE_SDHI_SCC_RVSREQ, 0);
11a219606a9bc7f Takeshi Saito 2019-12-17  553  =

11a219606a9bc7f Takeshi Saito 2019-12-17  554  	/* Change TAP position acco=
rding to correction status */
71cfc92751ac7a3 Takeshi Saito 2019-12-17  555  	if (sd_ctrl_read16(host, CT=
L_VERSION) =3D=3D SDHI_VER_GEN3_SDMMC &&
71cfc92751ac7a3 Takeshi Saito 2019-12-17  556  	    host->mmc->ios.timing =
=3D=3D MMC_TIMING_MMC_HS400) {
a38c078fea0b139 Takeshi Saito 2020-04-23  557  		u32 bad_taps =3D priv->qui=
rks ? priv->quirks->hs400_bad_taps : 0;
71cfc92751ac7a3 Takeshi Saito 2019-12-17  558  		/*
71cfc92751ac7a3 Takeshi Saito 2019-12-17  559  		 * With HS400, the DAT sig=
nal is based on DS, not CLK.
71cfc92751ac7a3 Takeshi Saito 2019-12-17  560  		 * Therefore, use only CMD=
 status.
71cfc92751ac7a3 Takeshi Saito 2019-12-17  561  		 */
71cfc92751ac7a3 Takeshi Saito 2019-12-17  562  		u32 smpcmp =3D sd_scc_read=
32(host, priv, SH_MOBILE_SDHI_SCC_SMPCMP) &
71cfc92751ac7a3 Takeshi Saito 2019-12-17  563  					   SH_MOBILE_SDHI_SCC_S=
MPCMP_CMD_ERR;
a38c078fea0b139 Takeshi Saito 2020-04-23  564  		if (!smpcmp) {
71cfc92751ac7a3 Takeshi Saito 2019-12-17  565  			return false;	/* no error=
 in CMD signal */
a38c078fea0b139 Takeshi Saito 2020-04-23  566  		} else if (smpcmp =3D=3D S=
H_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP) {
71cfc92751ac7a3 Takeshi Saito 2019-12-17  567  			new_tap++;
a38c078fea0b139 Takeshi Saito 2020-04-23  568  			error_tap--;
a38c078fea0b139 Takeshi Saito 2020-04-23  569  		} else if (smpcmp =3D=3D S=
H_MOBILE_SDHI_SCC_SMPCMP_CMD_REQDOWN) {
71cfc92751ac7a3 Takeshi Saito 2019-12-17  570  			new_tap--;
a38c078fea0b139 Takeshi Saito 2020-04-23  571  			error_tap++;
a38c078fea0b139 Takeshi Saito 2020-04-23  572  		} else {
71cfc92751ac7a3 Takeshi Saito 2019-12-17  573  			return true;	/* need retu=
ne */
a38c078fea0b139 Takeshi Saito 2020-04-23  574  		}
a38c078fea0b139 Takeshi Saito 2020-04-23  575  =

a38c078fea0b139 Takeshi Saito 2020-04-23  576  		/*
a38c078fea0b139 Takeshi Saito 2020-04-23  577  		 * When new_tap is a bad t=
ap, we cannot change. Then, we compare
a38c078fea0b139 Takeshi Saito 2020-04-23  578  		 * with the HS200 tuning r=
esult. When smpcmp[error_tap] is OK,
a38c078fea0b139 Takeshi Saito 2020-04-23  579  		 * we can at least retune.
a38c078fea0b139 Takeshi Saito 2020-04-23  580  		 */
a38c078fea0b139 Takeshi Saito 2020-04-23  581  		if (bad_taps & BIT(new_tap=
 % priv->tap_num))
a38c078fea0b139 Takeshi Saito 2020-04-23  582  			return test_bit(error_tap=
 % priv->tap_num, priv->smpcmp);
71cfc92751ac7a3 Takeshi Saito 2019-12-17  583  	} else {
11a219606a9bc7f Takeshi Saito 2019-12-17  584  		if (val & SH_MOBILE_SDHI_S=
CC_RVSREQ_RVSERR)
71cfc92751ac7a3 Takeshi Saito 2019-12-17  585  			return true;    /* need r=
etune */
11a219606a9bc7f Takeshi Saito 2019-12-17  586  		else if (val & SH_MOBILE_S=
DHI_SCC_RVSREQ_REQTAPUP)
71cfc92751ac7a3 Takeshi Saito 2019-12-17  587  			new_tap++;
11a219606a9bc7f Takeshi Saito 2019-12-17  588  		else if (val & SH_MOBILE_S=
DHI_SCC_RVSREQ_REQTAPDOWN)
71cfc92751ac7a3 Takeshi Saito 2019-12-17  589  			new_tap--;
11a219606a9bc7f Takeshi Saito 2019-12-17  590  		else
11a219606a9bc7f Takeshi Saito 2019-12-17  591  			return false;
71cfc92751ac7a3 Takeshi Saito 2019-12-17  592  	}
11a219606a9bc7f Takeshi Saito 2019-12-17  593  =

b2dd9a1325e6806 Wolfram Sang  2020-01-29  594  	priv->tap_set =3D (new_tap =
% priv->tap_num);
11a219606a9bc7f Takeshi Saito 2019-12-17  595  	sd_scc_write32(host, priv, =
SH_MOBILE_SDHI_SCC_TAPSET,
b2dd9a1325e6806 Wolfram Sang  2020-01-29  596  		       priv->tap_set / (us=
e_4tap ? 2 : 1));
11a219606a9bc7f Takeshi Saito 2019-12-17  597  =

11a219606a9bc7f Takeshi Saito 2019-12-17  598  	return false;
11a219606a9bc7f Takeshi Saito 2019-12-17  599  }
11a219606a9bc7f Takeshi Saito 2019-12-17  600  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6312203417244358174==--

