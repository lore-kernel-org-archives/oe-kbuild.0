Content-Type: multipart/mixed; boundary="===============3487156911284836034=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/mmc/host/renesas_sdhi_core.c:701:0: warning: Same expression used in consecutive assignments of 'new_tap' and 'error_tap'. [duplicateAssignExpression]
Date: Sun, 26 Dec 2021 15:56:30 +0800
Message-ID: <202112261358.g3byjIM0-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3487156911284836034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e2ae0d4a6b0ba461542f0fd0ba0b828658013e9f
commit: ea29b20a828511de3348334e529a3d046a180416 init/Kconfig: make COMPILE=
_TEST depend on HAS_IOMEM
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
compiler: s390-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/mmc/host/renesas_sdhi_core.c:701:0: warning: Same expression use=
d in consecutive assignments of 'new_tap' and 'error_tap'. [duplicateAssign=
Expression]
    unsigned int new_tap =3D priv->tap_set, error_tap =3D priv->tap_set;
   ^
   drivers/mmc/host/renesas_sdhi_core.c:701:0: note: Same expression used i=
n consecutive assignments of 'new_tap' and 'error_tap'.
    unsigned int new_tap =3D priv->tap_set, error_tap =3D priv->tap_set;
   ^
   drivers/mmc/host/renesas_sdhi_core.c:701:0: note: Same expression used i=
n consecutive assignments of 'new_tap' and 'error_tap'.
    unsigned int new_tap =3D priv->tap_set, error_tap =3D priv->tap_set;
   ^

vim +701 drivers/mmc/host/renesas_sdhi_core.c

0c482d829ac413 Wolfram Sang  2020-01-29  697  =

11a219606a9bc7 Takeshi Saito 2019-12-17  698  static bool renesas_sdhi_manu=
al_correction(struct tmio_mmc_host *host, bool use_4tap)
11a219606a9bc7 Takeshi Saito 2019-12-17  699  {
11a219606a9bc7 Takeshi Saito 2019-12-17  700  	struct renesas_sdhi *priv =
=3D host_to_priv(host);
a38c078fea0b13 Takeshi Saito 2020-04-23 @701  	unsigned int new_tap =3D pri=
v->tap_set, error_tap =3D priv->tap_set;
11a219606a9bc7 Takeshi Saito 2019-12-17  702  	u32 val;
11a219606a9bc7 Takeshi Saito 2019-12-17  703  =

11a219606a9bc7 Takeshi Saito 2019-12-17  704  	val =3D sd_scc_read32(host, =
priv, SH_MOBILE_SDHI_SCC_RVSREQ);
11a219606a9bc7 Takeshi Saito 2019-12-17  705  	if (!val)
11a219606a9bc7 Takeshi Saito 2019-12-17  706  		return false;
11a219606a9bc7 Takeshi Saito 2019-12-17  707  =

11a219606a9bc7 Takeshi Saito 2019-12-17  708  	sd_scc_write32(host, priv, S=
H_MOBILE_SDHI_SCC_RVSREQ, 0);
11a219606a9bc7 Takeshi Saito 2019-12-17  709  =

11a219606a9bc7 Takeshi Saito 2019-12-17  710  	/* Change TAP position accor=
ding to correction status */
71cfc92751ac7a Takeshi Saito 2019-12-17  711  	if (sd_ctrl_read16(host, CTL=
_VERSION) =3D=3D SDHI_VER_GEN3_SDMMC &&
71cfc92751ac7a Takeshi Saito 2019-12-17  712  	    host->mmc->ios.timing =
=3D=3D MMC_TIMING_MMC_HS400) {
a38c078fea0b13 Takeshi Saito 2020-04-23  713  		u32 bad_taps =3D priv->quir=
ks ? priv->quirks->hs400_bad_taps : 0;
71cfc92751ac7a Takeshi Saito 2019-12-17  714  		/*
71cfc92751ac7a Takeshi Saito 2019-12-17  715  		 * With HS400, the DAT sign=
al is based on DS, not CLK.
71cfc92751ac7a Takeshi Saito 2019-12-17  716  		 * Therefore, use only CMD =
status.
71cfc92751ac7a Takeshi Saito 2019-12-17  717  		 */
71cfc92751ac7a Takeshi Saito 2019-12-17  718  		u32 smpcmp =3D sd_scc_read3=
2(host, priv, SH_MOBILE_SDHI_SCC_SMPCMP) &
71cfc92751ac7a Takeshi Saito 2019-12-17  719  					   SH_MOBILE_SDHI_SCC_SM=
PCMP_CMD_ERR;
a38c078fea0b13 Takeshi Saito 2020-04-23  720  		if (!smpcmp) {
71cfc92751ac7a Takeshi Saito 2019-12-17  721  			return false;	/* no error =
in CMD signal */
a38c078fea0b13 Takeshi Saito 2020-04-23  722  		} else if (smpcmp =3D=3D SH=
_MOBILE_SDHI_SCC_SMPCMP_CMD_REQUP) {
71cfc92751ac7a Takeshi Saito 2019-12-17  723  			new_tap++;
a38c078fea0b13 Takeshi Saito 2020-04-23  724  			error_tap--;
a38c078fea0b13 Takeshi Saito 2020-04-23  725  		} else if (smpcmp =3D=3D SH=
_MOBILE_SDHI_SCC_SMPCMP_CMD_REQDOWN) {
71cfc92751ac7a Takeshi Saito 2019-12-17  726  			new_tap--;
a38c078fea0b13 Takeshi Saito 2020-04-23  727  			error_tap++;
a38c078fea0b13 Takeshi Saito 2020-04-23  728  		} else {
71cfc92751ac7a Takeshi Saito 2019-12-17  729  			return true;	/* need retun=
e */
a38c078fea0b13 Takeshi Saito 2020-04-23  730  		}
a38c078fea0b13 Takeshi Saito 2020-04-23  731  =

a38c078fea0b13 Takeshi Saito 2020-04-23  732  		/*
a38c078fea0b13 Takeshi Saito 2020-04-23  733  		 * When new_tap is a bad ta=
p, we cannot change. Then, we compare
a38c078fea0b13 Takeshi Saito 2020-04-23  734  		 * with the HS200 tuning re=
sult. When smpcmp[error_tap] is OK,
a38c078fea0b13 Takeshi Saito 2020-04-23  735  		 * we can at least retune.
a38c078fea0b13 Takeshi Saito 2020-04-23  736  		 */
a38c078fea0b13 Takeshi Saito 2020-04-23  737  		if (bad_taps & BIT(new_tap =
% priv->tap_num))
a38c078fea0b13 Takeshi Saito 2020-04-23  738  			return test_bit(error_tap =
% priv->tap_num, priv->smpcmp);
71cfc92751ac7a Takeshi Saito 2019-12-17  739  	} else {
11a219606a9bc7 Takeshi Saito 2019-12-17  740  		if (val & SH_MOBILE_SDHI_SC=
C_RVSREQ_RVSERR)
71cfc92751ac7a Takeshi Saito 2019-12-17  741  			return true;    /* need re=
tune */
11a219606a9bc7 Takeshi Saito 2019-12-17  742  		else if (val & SH_MOBILE_SD=
HI_SCC_RVSREQ_REQTAPUP)
71cfc92751ac7a Takeshi Saito 2019-12-17  743  			new_tap++;
11a219606a9bc7 Takeshi Saito 2019-12-17  744  		else if (val & SH_MOBILE_SD=
HI_SCC_RVSREQ_REQTAPDOWN)
71cfc92751ac7a Takeshi Saito 2019-12-17  745  			new_tap--;
11a219606a9bc7 Takeshi Saito 2019-12-17  746  		else
11a219606a9bc7 Takeshi Saito 2019-12-17  747  			return false;
71cfc92751ac7a Takeshi Saito 2019-12-17  748  	}
11a219606a9bc7 Takeshi Saito 2019-12-17  749  =

b2dd9a1325e680 Wolfram Sang  2020-01-29  750  	priv->tap_set =3D (new_tap %=
 priv->tap_num);
11a219606a9bc7 Takeshi Saito 2019-12-17  751  	sd_scc_write32(host, priv, S=
H_MOBILE_SDHI_SCC_TAPSET,
b2dd9a1325e680 Wolfram Sang  2020-01-29  752  		       priv->tap_set / (use=
_4tap ? 2 : 1));
11a219606a9bc7 Takeshi Saito 2019-12-17  753  =

11a219606a9bc7 Takeshi Saito 2019-12-17  754  	return false;
11a219606a9bc7 Takeshi Saito 2019-12-17  755  }
11a219606a9bc7 Takeshi Saito 2019-12-17  756  =


:::::: The code at line 701 was first introduced by commit
:::::: a38c078fea0b1393fd2acb50e91057d7e429d9aa mmc: renesas_sdhi: Avoid ba=
d TAP in HS400

:::::: TO: Takeshi Saito <takeshi.saito.xv@renesas.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3487156911284836034==--

