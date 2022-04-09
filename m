Content-Type: multipart/mixed; boundary="===============0954983393766353581=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/scsi/ufs/ufshcd.c:4346:23: warning: Signed integer overflow for expression '(0xD041&0xFFFF)<<16'. [integerOverflow]
Date: Sat, 09 Apr 2022 16:35:45 +0800
Message-ID: <202204091648.FPM6CPdm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0954983393766353581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Bart Van Assche <bvanassche@google.com>
CC: "Martin K. Petersen" <martin.petersen@oracle.com>
CC: Jaegeuk Kim <jaegeuk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   f1b45d8ccb9839b48e5884664470e54520e17f4c
commit: edc0596cc04bf0ac3a69c66e994d3ff8b650ff71 scsi: ufs: core: Stop clea=
ring UNIT ATTENTIONS
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout edc0596cc04bf0ac3a69c66e994d3ff8b650ff71
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/scsi/ufs/ufshcd.c:7721:5: warning: Variable 'gran_to_us_table' c=
an be declared with const [constVariable]
    u8 gran_to_us_table[] =3D {1, 4, 8, 16, 32, 100};
       ^
   drivers/scsi/ufs/ufshcd.c:5378:67: warning: Parameter 'other_mask' can b=
e declared with const [constParameter]
   int ufshcd_update_ee_control(struct ufs_hba *hba, u16 *mask, u16 *other_=
mask,
                                                                     ^
>> drivers/scsi/ufs/ufshcd.c:4346:23: warning: Signed integer overflow for =
expression '(0xD041&0xFFFF)<<16'. [integerOverflow]
     ufshcd_dme_set(hba, UIC_ARG_MIB(DME_LocalFC0ProtectionTimeOutVal),
                         ^
>> drivers/scsi/ufs/ufshcd.c:4348:23: warning: Signed integer overflow for =
expression '(0xD042&0xFFFF)<<16'. [integerOverflow]
     ufshcd_dme_set(hba, UIC_ARG_MIB(DME_LocalTC0ReplayTimeOutVal),
                         ^
>> drivers/scsi/ufs/ufshcd.c:4350:23: warning: Signed integer overflow for =
expression '(0xD043&0xFFFF)<<16'. [integerOverflow]
     ufshcd_dme_set(hba, UIC_ARG_MIB(DME_LocalAFC0ReqTimeOutVal),
                         ^
>> drivers/scsi/ufs/ufshcd.c:410:43: warning: Uninitialized variable: clki-=
>min_freq [uninitvar]
     if (!IS_ERR_OR_NULL(clki->clk) && clki->min_freq &&
                                             ^
   drivers/scsi/ufs/ufshcd.c:406:16: note: Assuming condition is false
    if (list_empty(head))
                  ^
   drivers/scsi/ufs/ufshcd.c:410:43: note: Uninitialized variable: clki->mi=
n_freq
     if (!IS_ERR_OR_NULL(clki->clk) && clki->min_freq &&
                                             ^
   drivers/scsi/ufs/ufshcd.c:1049:26: warning: Uninitialized variable: clki=
->max_freq [uninitvar]
      if (scale_up && clki->max_freq) {
                            ^
   drivers/scsi/ufs/ufshcd.c:1044:16: note: Assuming condition is false
    if (list_empty(head))
                  ^
   drivers/scsi/ufs/ufshcd.c:1049:26: note: Uninitialized variable: clki->m=
ax_freq
      if (scale_up && clki->max_freq) {
                            ^

vim +4346 drivers/scsi/ufs/ufshcd.c

7eb584db73bebb Dolev Raviv   2014-09-25  4282  =

7eb584db73bebb Dolev Raviv   2014-09-25  4283  static int ufshcd_change_pow=
er_mode(struct ufs_hba *hba,
7eb584db73bebb Dolev Raviv   2014-09-25  4284  			     struct ufs_pa_layer_=
attr *pwr_mode)
7eb584db73bebb Dolev Raviv   2014-09-25  4285  {
7eb584db73bebb Dolev Raviv   2014-09-25  4286  	int ret;
7eb584db73bebb Dolev Raviv   2014-09-25  4287  =

7eb584db73bebb Dolev Raviv   2014-09-25  4288  	/* if already configured to=
 the requested pwr_mode */
2355b66ed20ce4 Can Guo       2020-08-24  4289  	if (!hba->force_pmc &&
2355b66ed20ce4 Can Guo       2020-08-24  4290  	    pwr_mode->gear_rx =3D=
=3D hba->pwr_info.gear_rx &&
7eb584db73bebb Dolev Raviv   2014-09-25  4291  	    pwr_mode->gear_tx =3D=
=3D hba->pwr_info.gear_tx &&
7eb584db73bebb Dolev Raviv   2014-09-25  4292  	    pwr_mode->lane_rx =3D=
=3D hba->pwr_info.lane_rx &&
7eb584db73bebb Dolev Raviv   2014-09-25  4293  	    pwr_mode->lane_tx =3D=
=3D hba->pwr_info.lane_tx &&
7eb584db73bebb Dolev Raviv   2014-09-25  4294  	    pwr_mode->pwr_rx =3D=3D=
 hba->pwr_info.pwr_rx &&
7eb584db73bebb Dolev Raviv   2014-09-25  4295  	    pwr_mode->pwr_tx =3D=3D=
 hba->pwr_info.pwr_tx &&
7eb584db73bebb Dolev Raviv   2014-09-25  4296  	    pwr_mode->hs_rate =3D=
=3D hba->pwr_info.hs_rate) {
7eb584db73bebb Dolev Raviv   2014-09-25  4297  		dev_dbg(hba->dev, "%s: pow=
er already configured\n", __func__);
7eb584db73bebb Dolev Raviv   2014-09-25  4298  		return 0;
d3e89bac715534 Seungwon Jeon 2013-08-31  4299  	}
d3e89bac715534 Seungwon Jeon 2013-08-31  4300  =

d3e89bac715534 Seungwon Jeon 2013-08-31  4301  	/*
d3e89bac715534 Seungwon Jeon 2013-08-31  4302  	 * Configure attributes for=
 power mode change with below.
d3e89bac715534 Seungwon Jeon 2013-08-31  4303  	 * - PA_RXGEAR, PA_ACTIVERX=
DATALANES, PA_RXTERMINATION,
d3e89bac715534 Seungwon Jeon 2013-08-31  4304  	 * - PA_TXGEAR, PA_ACTIVETX=
DATALANES, PA_TXTERMINATION,
d3e89bac715534 Seungwon Jeon 2013-08-31  4305  	 * - PA_HSSERIES
d3e89bac715534 Seungwon Jeon 2013-08-31  4306  	 */
7eb584db73bebb Dolev Raviv   2014-09-25  4307  	ufshcd_dme_set(hba, UIC_ARG=
_MIB(PA_RXGEAR), pwr_mode->gear_rx);
7eb584db73bebb Dolev Raviv   2014-09-25  4308  	ufshcd_dme_set(hba, UIC_ARG=
_MIB(PA_ACTIVERXDATALANES),
7eb584db73bebb Dolev Raviv   2014-09-25  4309  			pwr_mode->lane_rx);
7eb584db73bebb Dolev Raviv   2014-09-25  4310  	if (pwr_mode->pwr_rx =3D=3D=
 FASTAUTO_MODE ||
7eb584db73bebb Dolev Raviv   2014-09-25  4311  			pwr_mode->pwr_rx =3D=3D F=
AST_MODE)
d3e89bac715534 Seungwon Jeon 2013-08-31  4312  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(PA_RXTERMINATION), TRUE);
7eb584db73bebb Dolev Raviv   2014-09-25  4313  	else
7eb584db73bebb Dolev Raviv   2014-09-25  4314  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(PA_RXTERMINATION), FALSE);
d3e89bac715534 Seungwon Jeon 2013-08-31  4315  =

7eb584db73bebb Dolev Raviv   2014-09-25  4316  	ufshcd_dme_set(hba, UIC_ARG=
_MIB(PA_TXGEAR), pwr_mode->gear_tx);
7eb584db73bebb Dolev Raviv   2014-09-25  4317  	ufshcd_dme_set(hba, UIC_ARG=
_MIB(PA_ACTIVETXDATALANES),
7eb584db73bebb Dolev Raviv   2014-09-25  4318  			pwr_mode->lane_tx);
7eb584db73bebb Dolev Raviv   2014-09-25  4319  	if (pwr_mode->pwr_tx =3D=3D=
 FASTAUTO_MODE ||
7eb584db73bebb Dolev Raviv   2014-09-25  4320  			pwr_mode->pwr_tx =3D=3D F=
AST_MODE)
d3e89bac715534 Seungwon Jeon 2013-08-31  4321  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(PA_TXTERMINATION), TRUE);
7eb584db73bebb Dolev Raviv   2014-09-25  4322  	else
7eb584db73bebb Dolev Raviv   2014-09-25  4323  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(PA_TXTERMINATION), FALSE);
d3e89bac715534 Seungwon Jeon 2013-08-31  4324  =

7eb584db73bebb Dolev Raviv   2014-09-25  4325  	if (pwr_mode->pwr_rx =3D=3D=
 FASTAUTO_MODE ||
7eb584db73bebb Dolev Raviv   2014-09-25  4326  	    pwr_mode->pwr_tx =3D=3D=
 FASTAUTO_MODE ||
7eb584db73bebb Dolev Raviv   2014-09-25  4327  	    pwr_mode->pwr_rx =3D=3D=
 FAST_MODE ||
7eb584db73bebb Dolev Raviv   2014-09-25  4328  	    pwr_mode->pwr_tx =3D=3D=
 FAST_MODE)
7eb584db73bebb Dolev Raviv   2014-09-25  4329  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(PA_HSSERIES),
7eb584db73bebb Dolev Raviv   2014-09-25  4330  						pwr_mode->hs_rate);
d3e89bac715534 Seungwon Jeon 2013-08-31  4331  =

b1d0d2eb89d4e3 Kiwoong Kim   2020-12-21  4332  	if (!(hba->quirks & UFSHCD_=
QUIRK_SKIP_DEF_UNIPRO_TIMEOUT_SETTING)) {
0834253734cbb4 Can Guo       2019-12-05  4333  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(PA_PWRMODEUSERDATA0),
0834253734cbb4 Can Guo       2019-12-05  4334  				DL_FC0ProtectionTimeOutV=
al_Default);
0834253734cbb4 Can Guo       2019-12-05  4335  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(PA_PWRMODEUSERDATA1),
0834253734cbb4 Can Guo       2019-12-05  4336  				DL_TC0ReplayTimeOutVal_D=
efault);
0834253734cbb4 Can Guo       2019-12-05  4337  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(PA_PWRMODEUSERDATA2),
0834253734cbb4 Can Guo       2019-12-05  4338  				DL_AFC0ReqTimeOutVal_Def=
ault);
0834253734cbb4 Can Guo       2019-12-05  4339  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(PA_PWRMODEUSERDATA3),
0834253734cbb4 Can Guo       2019-12-05  4340  				DL_FC1ProtectionTimeOutV=
al_Default);
0834253734cbb4 Can Guo       2019-12-05  4341  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(PA_PWRMODEUSERDATA4),
0834253734cbb4 Can Guo       2019-12-05  4342  				DL_TC1ReplayTimeOutVal_D=
efault);
0834253734cbb4 Can Guo       2019-12-05  4343  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(PA_PWRMODEUSERDATA5),
0834253734cbb4 Can Guo       2019-12-05  4344  				DL_AFC1ReqTimeOutVal_Def=
ault);
0834253734cbb4 Can Guo       2019-12-05  4345  =

0834253734cbb4 Can Guo       2019-12-05 @4346  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(DME_LocalFC0ProtectionTimeOutVal),
0834253734cbb4 Can Guo       2019-12-05  4347  				DL_FC0ProtectionTimeOutV=
al_Default);
0834253734cbb4 Can Guo       2019-12-05 @4348  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(DME_LocalTC0ReplayTimeOutVal),
0834253734cbb4 Can Guo       2019-12-05  4349  				DL_TC0ReplayTimeOutVal_D=
efault);
0834253734cbb4 Can Guo       2019-12-05 @4350  		ufshcd_dme_set(hba, UIC_AR=
G_MIB(DME_LocalAFC0ReqTimeOutVal),
0834253734cbb4 Can Guo       2019-12-05  4351  				DL_AFC0ReqTimeOutVal_Def=
ault);
b1d0d2eb89d4e3 Kiwoong Kim   2020-12-21  4352  	}
0834253734cbb4 Can Guo       2019-12-05  4353  =

7eb584db73bebb Dolev Raviv   2014-09-25  4354  	ret =3D ufshcd_uic_change_p=
wr_mode(hba, pwr_mode->pwr_rx << 4
7eb584db73bebb Dolev Raviv   2014-09-25  4355  			| pwr_mode->pwr_tx);
7eb584db73bebb Dolev Raviv   2014-09-25  4356  =

7eb584db73bebb Dolev Raviv   2014-09-25  4357  	if (ret) {
d3e89bac715534 Seungwon Jeon 2013-08-31  4358  		dev_err(hba->dev,
7eb584db73bebb Dolev Raviv   2014-09-25  4359  			"%s: power mode change fa=
iled %d\n", __func__, ret);
7eb584db73bebb Dolev Raviv   2014-09-25  4360  	} else {
0263bcd0e83196 Yaniv Gardi   2015-10-28  4361  		ufshcd_vops_pwr_change_not=
ify(hba, POST_CHANGE, NULL,
0263bcd0e83196 Yaniv Gardi   2015-10-28  4362  								pwr_mode);
7eb584db73bebb Dolev Raviv   2014-09-25  4363  =

7eb584db73bebb Dolev Raviv   2014-09-25  4364  		memcpy(&hba->pwr_info, pwr=
_mode,
7eb584db73bebb Dolev Raviv   2014-09-25  4365  			sizeof(struct ufs_pa_laye=
r_attr));
7eb584db73bebb Dolev Raviv   2014-09-25  4366  	}
7eb584db73bebb Dolev Raviv   2014-09-25  4367  =

7eb584db73bebb Dolev Raviv   2014-09-25  4368  	return ret;
7eb584db73bebb Dolev Raviv   2014-09-25  4369  }
7eb584db73bebb Dolev Raviv   2014-09-25  4370  =


:::::: The code at line 4346 was first introduced by commit
:::::: 0834253734cbb40c312c06e5beb9b94ac7cf5e80 scsi: ufs: Do not clear the=
 DL layer timers

:::::: TO: Can Guo <cang@codeaurora.org>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0954983393766353581==--

