Content-Type: multipart/mixed; boundary="===============8223706994055058753=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] thermal: qcom: tsens-v1: Add support for MSM8992/4 TSENS
Date: Mon, 02 May 2022 07:10:16 +0800
Message-ID: <202205020707.5QHHFhuD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8223706994055058753==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220501202025.211567-2-konrad.dybcio@somainline.org>
References: <20220501202025.211567-2-konrad.dybcio@somainline.org>
TO: Konrad Dybcio <konrad.dybcio@somainline.org>
TO: ~postmarketos/upstreaming(a)lists.sr.ht
CC: martin.botka(a)somainline.org
CC: angelogioacchino.delregno(a)somainline.org
CC: marijn.suijten(a)somainline.org
CC: jamipkettunen(a)somainline.org
CC: Konrad Dybcio <konrad.dybcio@somainline.org>
CC: Amit Kucheria <amitk@kernel.org>
CC: Thara Gopinath <thara.gopinath@linaro.org>
CC: Andy Gross <agross@kernel.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Zhang Rui <rui.zhang@intel.com>
CC: linux-pm(a)vger.kernel.org
CC: linux-arm-msm(a)vger.kernel.org
CC: linux-kernel(a)vger.kernel.org

Hi Konrad,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on rafael-pm/thermal]
[also build test WARNING on robh/for-next v5.18-rc5 next-20220429]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/intel-lab-lkp/linux/commits/Konrad-Dybcio/dt-bin=
dings-thermal-tsens-Add-msm8992-4-compatibles/20220502-042413
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git=
 thermal
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout db030f5538c8beb36e6cde82bead3c57131c58b5
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/thermal/qcom/tsens-v1.c:465:5: warning: Mismatching assignment a=
nd comparison, comparison 'calib_redun_sel=3D=3D0x3' is always false. [assi=
gnIfError]
    if (calib_redun_sel =3D=3D BKP_SEL) {
       ^
   drivers/thermal/qcom/tsens-v1.c:462:18: note: Mismatching assignment and=
 comparison, comparison 'calib_redun_sel=3D=3D0x3' is always false.
    calib_redun_sel =3D  calib_rsel[0] & MSM8994_CAL_SEL_REDUN_MASK;
                    ^
   drivers/thermal/qcom/tsens-v1.c:465:5: note: Mismatching assignment and =
comparison, comparison 'calib_redun_sel=3D=3D0x3' is always false.
    if (calib_redun_sel =3D=3D BKP_SEL) {
       ^
   drivers/thermal/qcom/tsens-v1.c:239:15: warning: Parameter 'p1' can be d=
eclared with const [constParameter]
            u32 *p1, u32 *p2, u32 mode)
                 ^
>> drivers/thermal/qcom/tsens-v1.c:264:37: warning: Parameter 'p' can be de=
clared with const [constParameter]
            u32 base0, u32 base1, u32 *p, u32 mode)
                                       ^

vim +465 drivers/thermal/qcom/tsens-v1.c

0e580290170dfb AngeloGioacchino Del Regno 2019-10-05  415  =

db030f5538c8be Konrad Dybcio              2022-05-01  416  static int calib=
rate_8994(struct tsens_priv *priv)
db030f5538c8be Konrad Dybcio              2022-05-01  417  {
db030f5538c8be Konrad Dybcio              2022-05-01  418  	int base0 =3D 0=
, base1 =3D 0;
db030f5538c8be Konrad Dybcio              2022-05-01  419  	u32 p[16] =3D {=
 [0 ... 15] =3D 532 }; /* HW-specific, undocumented magic value */
db030f5538c8be Konrad Dybcio              2022-05-01  420  	int mode =3D 0;
db030f5538c8be Konrad Dybcio              2022-05-01  421  	u32 *calib0, *c=
alib1, *calib2, *calib_mode, *calib_rsel;
db030f5538c8be Konrad Dybcio              2022-05-01  422  	u32 calib_redun=
_sel;
db030f5538c8be Konrad Dybcio              2022-05-01  423  =

db030f5538c8be Konrad Dybcio              2022-05-01  424  	/* 0x40d0-0x40d=
c */
db030f5538c8be Konrad Dybcio              2022-05-01  425  	calib0 =3D (u32=
 *)qfprom_read(priv->dev, "calib");
db030f5538c8be Konrad Dybcio              2022-05-01  426  	if (IS_ERR(cali=
b0))
db030f5538c8be Konrad Dybcio              2022-05-01  427  		return PTR_ERR=
(calib0);
db030f5538c8be Konrad Dybcio              2022-05-01  428  =

db030f5538c8be Konrad Dybcio              2022-05-01  429  	dev_dbg(priv->d=
ev, "%s: calib0: [0] =3D %u, [1] =3D %u, [2] =3D %u\n",
db030f5538c8be Konrad Dybcio              2022-05-01  430  		__func__, cali=
b0[0], calib0[1], calib0[2]);
db030f5538c8be Konrad Dybcio              2022-05-01  431  =

db030f5538c8be Konrad Dybcio              2022-05-01  432  	/* 0x41c0-0x41c=
8 */
db030f5538c8be Konrad Dybcio              2022-05-01  433  	calib1 =3D (u32=
 *)qfprom_read(priv->dev, "calib_redun1_2");
db030f5538c8be Konrad Dybcio              2022-05-01  434  	if (IS_ERR(cali=
b1))
db030f5538c8be Konrad Dybcio              2022-05-01  435  		return PTR_ERR=
(calib1);
db030f5538c8be Konrad Dybcio              2022-05-01  436  =

db030f5538c8be Konrad Dybcio              2022-05-01  437  	dev_dbg(priv->d=
ev, "%s: calib1: [0] =3D %u, [1] =3D %u\n",
db030f5538c8be Konrad Dybcio              2022-05-01  438  		__func__, cali=
b1[0], calib1[1]);
db030f5538c8be Konrad Dybcio              2022-05-01  439  =

db030f5538c8be Konrad Dybcio              2022-05-01  440  	/* 0x41cc-0x41d=
0 */
db030f5538c8be Konrad Dybcio              2022-05-01  441  	calib2 =3D (u32=
 *)qfprom_read(priv->dev, "calib_redun3");
db030f5538c8be Konrad Dybcio              2022-05-01  442  	if (IS_ERR(cali=
b2))
db030f5538c8be Konrad Dybcio              2022-05-01  443  		return PTR_ERR=
(calib2);
db030f5538c8be Konrad Dybcio              2022-05-01  444  =

db030f5538c8be Konrad Dybcio              2022-05-01  445  	dev_dbg(priv->d=
ev, "%s: calib2: [0] =3D %u\n", __func__, calib2[0]);
db030f5538c8be Konrad Dybcio              2022-05-01  446  =

db030f5538c8be Konrad Dybcio              2022-05-01  447  	/* 0x4440-0x444=
8 */
db030f5538c8be Konrad Dybcio              2022-05-01  448  	calib_mode =3D =
(u32 *)qfprom_read(priv->dev, "calib_redun4_5");
db030f5538c8be Konrad Dybcio              2022-05-01  449  	if (IS_ERR(cali=
b_mode))
db030f5538c8be Konrad Dybcio              2022-05-01  450  		return PTR_ERR=
(calib_mode);
db030f5538c8be Konrad Dybcio              2022-05-01  451  =

db030f5538c8be Konrad Dybcio              2022-05-01  452  	dev_dbg(priv->d=
ev, "%s: calib_mode: [0] =3D %u, [1] =3D %u\n",
db030f5538c8be Konrad Dybcio              2022-05-01  453  		__func__, cali=
b1[0], calib1[1]);
db030f5538c8be Konrad Dybcio              2022-05-01  454  =

db030f5538c8be Konrad Dybcio              2022-05-01  455  	/* 0x4464-0x446=
8 */
db030f5538c8be Konrad Dybcio              2022-05-01  456  	calib_rsel =3D =
(u32 *)qfprom_read(priv->dev, "calib_rsel");
db030f5538c8be Konrad Dybcio              2022-05-01  457  	if (IS_ERR(cali=
b_mode))
db030f5538c8be Konrad Dybcio              2022-05-01  458  		return PTR_ERR=
(calib_mode);
db030f5538c8be Konrad Dybcio              2022-05-01  459  =

db030f5538c8be Konrad Dybcio              2022-05-01  460  	dev_dbg(priv->d=
ev, "%s: calib_rsel: [0] =3D %u\n", __func__, calib_rsel[0]);
db030f5538c8be Konrad Dybcio              2022-05-01  461  =

db030f5538c8be Konrad Dybcio              2022-05-01  462  	calib_redun_sel=
 =3D  calib_rsel[0] & MSM8994_CAL_SEL_REDUN_MASK;
db030f5538c8be Konrad Dybcio              2022-05-01  463  	calib_redun_sel=
 >>=3D MSM8994_CAL_SEL_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  464  =

db030f5538c8be Konrad Dybcio              2022-05-01 @465  	if (calib_redun=
_sel =3D=3D BKP_SEL) {
db030f5538c8be Konrad Dybcio              2022-05-01  466  		dev_dbg(priv->=
dev, "%s: Calibrating in REDUN mode, calib_redun_sel =3D %u",
db030f5538c8be Konrad Dybcio              2022-05-01  467  			__func__, cal=
ib_redun_sel);
db030f5538c8be Konrad Dybcio              2022-05-01  468  		mode =3D calib=
_mode[1] & MSM8994_REDUN_SEL_MASK;
db030f5538c8be Konrad Dybcio              2022-05-01  469  =

db030f5538c8be Konrad Dybcio              2022-05-01  470  		if (mode =3D=
=3D TWO_PT_CALIB) {
db030f5538c8be Konrad Dybcio              2022-05-01  471  			dev_dbg(priv-=
>dev, "%s: REDUN TWO_PT mode, mode =3D %u", __func__, mode);
db030f5538c8be Konrad Dybcio              2022-05-01  472  			base0 =3D (ca=
lib1[0] & MSM8994_BASE0_REDUN_MASK) >> MSM8994_BASE0_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  473  			base1 =3D (ca=
lib1[0] & MSM8994_BASE1_BIT0_REDUN_MASK) >> MSM8994_BASE1_BIT0_REDUN_SHIFT_=
COMPUTE;
db030f5538c8be Konrad Dybcio              2022-05-01  474  			base1 |=3D ca=
lib1[1] & MSM8994_BASE1_BIT1_9_REDUN_MASK;
db030f5538c8be Konrad Dybcio              2022-05-01  475  			p[0] =3D (cal=
ib1[1] & MSM8994_S0_REDUN_MASK) >> MSM8994_S0_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  476  			p[1] =3D (cal=
ib1[1] & MSM8994_S1_REDUN_MASK) >> MSM8994_S1_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  477  			p[2] =3D (cal=
ib1[1] & MSM8994_S2_REDUN_MASK) >> MSM8994_S2_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  478  			p[3] =3D (cal=
ib1[1] & MSM8994_S3_REDUN_MASK) >> MSM8994_S3_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  479  			p[4] =3D (cal=
ib1[1] & MSM8994_S4_REDUN_MASK) >> MSM8994_S4_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  480  			p[5] =3D (cal=
ib1[1] & MSM8994_S5_REDUN_MASK_BIT0_2) >> MSM8994_S5_REDUN_SHIFT_BIT0_2;
db030f5538c8be Konrad Dybcio              2022-05-01  481  			p[5] |=3D (ca=
lib2[0] & MSM8994_S5_REDUN_MASK_BIT3) >> MSM8994_S5_REDUN_SHIFT_BIT3;
db030f5538c8be Konrad Dybcio              2022-05-01  482  			p[6] =3D (cal=
ib2[0] & MSM8994_S6_REDUN_MASK) >> MSM8994_S6_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  483  			p[7] =3D (cal=
ib2[0] & MSM8994_S7_REDUN_MASK) >> MSM8994_S7_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  484  			p[8] =3D (cal=
ib2[0] & MSM8994_S8_REDUN_MASK) >> MSM8994_S8_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  485  			p[9] =3D (cal=
ib2[0] & MSM8994_S9_REDUN_MASK) >> MSM8994_S9_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  486  			p[10] =3D (ca=
lib2[0] & MSM8994_S10_REDUN_MASK) >> MSM8994_S10_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  487  			p[11] =3D (ca=
lib2[0] & MSM8994_S11_REDUN_MASK) >> MSM8994_S11_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  488  			p[12] =3D (ca=
lib2[0] & MSM8994_S12_REDUN_MASK) >> MSM8994_S12_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  489  			p[13] =3D (ca=
lib2[0] & MSM8994_S13_REDUN_MASK) >> MSM8994_S13_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  490  			p[14] =3D (ca=
lib2[0] & MSM8994_S14_REDUN_MASK) >> MSM8994_S14_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  491  			p[15] =3D (ca=
lib2[0] & MSM8994_S15_REDUN_MASK) >> MSM8994_S15_REDUN_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  492  		} else {
db030f5538c8be Konrad Dybcio              2022-05-01  493  			dev_dbg(priv-=
>dev, "%s: REDUN NON-TWO_PT mode, mode =3D %u", __func__, mode);
db030f5538c8be Konrad Dybcio              2022-05-01  494  		}
db030f5538c8be Konrad Dybcio              2022-05-01  495  	} else {
db030f5538c8be Konrad Dybcio              2022-05-01  496  		dev_dbg(priv->=
dev, "%s: Calibrating in NOT-REDUN mode, calib_redun_sel =3D %u",
db030f5538c8be Konrad Dybcio              2022-05-01  497  			__func__, cal=
ib_redun_sel);
db030f5538c8be Konrad Dybcio              2022-05-01  498  		mode =3D (cali=
b0[2] & MSM8994_CAL_SEL_MASK) >> MSM8994_CAL_SEL_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  499  =

db030f5538c8be Konrad Dybcio              2022-05-01  500  		if (mode =3D=
=3D TWO_PT_CALIB) {
db030f5538c8be Konrad Dybcio              2022-05-01  501  			dev_dbg(priv-=
>dev, "%s: NOT-REDUN TWO_PT mode, mode =3D %u", __func__, mode);
db030f5538c8be Konrad Dybcio              2022-05-01  502  			base0 =3D (ca=
lib0[0] & MSM8994_BASE0_MASK) >> MSM8994_BASE0_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  503  			base1 =3D (ca=
lib0[0] & MSM8994_BASE1_MASK) >> MSM8994_BASE1_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  504  			p[0] =3D (cal=
ib0[0] & MSM8994_S0_MASK) >> MSM8994_S0_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  505  			p[1] =3D (cal=
ib0[0] & MSM8994_S1_MASK) >> MSM8994_S1_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  506  			p[2] =3D (cal=
ib0[1] & MSM8994_S2_MASK) >> MSM8994_S2_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  507  			p[3] =3D (cal=
ib0[1] & MSM8994_S3_MASK) >> MSM8994_S3_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  508  			p[4] =3D (cal=
ib0[1] & MSM8994_S4_MASK) >> MSM8994_S4_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  509  			p[5] =3D (cal=
ib0[1] & MSM8994_S5_MASK) >> MSM8994_S5_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  510  			p[6] =3D (cal=
ib0[1] & MSM8994_S6_MASK) >> MSM8994_S6_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  511  			p[7] =3D (cal=
ib0[1] & MSM8994_S7_MASK) >> MSM8994_S7_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  512  			p[8] =3D (cal=
ib0[1] & MSM8994_S8_MASK) >> MSM8994_S8_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  513  			p[9] =3D (cal=
ib0[1] & MSM8994_S9_MASK) >> MSM8994_S9_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  514  			p[10] =3D (ca=
lib0[1] & MSM8994_S10_MASK) >> MSM8994_S10_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  515  			p[11] =3D (ca=
lib0[2] & MSM8994_S11_MASK) >> MSM8994_S11_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  516  			p[12] =3D (ca=
lib0[2] & MSM8994_S12_MASK) >> MSM8994_S12_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  517  			p[13] =3D (ca=
lib0[2] & MSM8994_S13_MASK) >> MSM8994_S13_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  518  			p[14] =3D (ca=
lib0[2] & MSM8994_S14_MASK) >> MSM8994_S14_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  519  			p[15] =3D (ca=
lib0[2] & MSM8994_S15_MASK) >> MSM8994_S15_SHIFT;
db030f5538c8be Konrad Dybcio              2022-05-01  520  		} else {
db030f5538c8be Konrad Dybcio              2022-05-01  521  			dev_dbg(priv-=
>dev, "%s: NOT-REDUN NON-TWO_PT mode, mode =3D %u", __func__, mode);
db030f5538c8be Konrad Dybcio              2022-05-01  522  			/* Keep the i=
nit-time 532 value */
db030f5538c8be Konrad Dybcio              2022-05-01  523  		}
db030f5538c8be Konrad Dybcio              2022-05-01  524  	}
db030f5538c8be Konrad Dybcio              2022-05-01  525  =

db030f5538c8be Konrad Dybcio              2022-05-01  526  	/* 8992 feature=
s less sensors and remaps some */
db030f5538c8be Konrad Dybcio              2022-05-01  527  	if (priv->num_s=
ensors =3D=3D 13) {
db030f5538c8be Konrad Dybcio              2022-05-01  528  		p[6] =3D p[7];
db030f5538c8be Konrad Dybcio              2022-05-01  529  		p[7] =3D p[9];
db030f5538c8be Konrad Dybcio              2022-05-01  530  		p[8] =3D p[10];
db030f5538c8be Konrad Dybcio              2022-05-01  531  		p[9] =3D p[11];
db030f5538c8be Konrad Dybcio              2022-05-01  532  		p[10] =3D p[12=
];
db030f5538c8be Konrad Dybcio              2022-05-01  533  		p[11] =3D p[13=
];
db030f5538c8be Konrad Dybcio              2022-05-01  534  		p[12] =3D p[14=
];
db030f5538c8be Konrad Dybcio              2022-05-01  535  	}
db030f5538c8be Konrad Dybcio              2022-05-01  536  =

db030f5538c8be Konrad Dybcio              2022-05-01  537  	compute_interce=
pt_slope_8994(priv, base0, base1, p, mode);
db030f5538c8be Konrad Dybcio              2022-05-01  538  	kfree(calib0);
db030f5538c8be Konrad Dybcio              2022-05-01  539  	kfree(calib1);
db030f5538c8be Konrad Dybcio              2022-05-01  540  	kfree(calib2);
db030f5538c8be Konrad Dybcio              2022-05-01  541  	kfree(calib_mod=
e);
db030f5538c8be Konrad Dybcio              2022-05-01  542  	kfree(calib_rse=
l);
db030f5538c8be Konrad Dybcio              2022-05-01  543  =

db030f5538c8be Konrad Dybcio              2022-05-01  544  	return 0;
db030f5538c8be Konrad Dybcio              2022-05-01  545  }
db030f5538c8be Konrad Dybcio              2022-05-01  546  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8223706994055058753==--

