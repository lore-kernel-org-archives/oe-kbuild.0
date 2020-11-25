Content-Type: multipart/mixed; boundary="===============7818923840355490662=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [android-goldfish:android-5.4 4/5] drivers/hid/hid-nintendo.c:314 joycon_request_calibration() warn: right shifting more than type allows 16 vs 16
Date: Thu, 26 Nov 2020 05:15:49 +0800
Message-ID: <202011260546.iAsFdDpE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7818923840355490662==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Alistair Delva <adelva@google.com>

tree:   https://android.googlesource.com/kernel/goldfish android-5.4
head:   e03073f66fc4018c29fefbc5ded97a31c3e958b9
commit: e63d24388097cc5592fb085fea19f9f7e9cd1248 [4/5] FROMLIST: HID: ninte=
ndo: add nintendo switch controller driver
:::::: branch date: 9 months ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-m001-20201125 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/hid/hid-nintendo.c:314 joycon_request_calibration() warn: right shi=
fting more than type allows 16 vs 16

Old smatch warnings:
drivers/hid/hid-nintendo.c:315 joycon_request_calibration() warn: right shi=
fting more than type allows 16 vs 24

vim +314 drivers/hid/hid-nintendo.c

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  290  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  291  static const u16 DFLT_=
STICK_CAL_CEN =3D 2000;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  292  static const u16 DFLT_=
STICK_CAL_MAX =3D 3500;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  293  static const u16 DFLT_=
STICK_CAL_MIN =3D 500;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  294  static int joycon_requ=
est_calibration(struct joycon_ctlr *ctlr)
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  295  {
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  296  	struct joycon_subcmd_=
request *req;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  297  	u8 buffer[sizeof(*req=
) + 5] =3D { 0 };
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  298  	struct joycon_input_r=
eport *report;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  299  	struct joycon_stick_c=
al *cal_x;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  300  	struct joycon_stick_c=
al *cal_y;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  301  	s32 x_max_above;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  302  	s32 x_min_below;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  303  	s32 y_max_above;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  304  	s32 y_min_below;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  305  	u8 *data;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  306  	u8 *raw_cal;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  307  	int ret;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  308  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  309  	req =3D (struct joyco=
n_subcmd_request *)buffer;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  310  	req->subcmd_id =3D JC=
_SUBCMD_SPI_FLASH_READ;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  311  	data =3D req->data;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  312  	data[0] =3D 0xFF & JC=
_CAL_DATA_START;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  313  	data[1] =3D 0xFF & (J=
C_CAL_DATA_START >> 8);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29 @314  	data[2] =3D 0xFF & (J=
C_CAL_DATA_START >> 16);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  315  	data[3] =3D 0xFF & (J=
C_CAL_DATA_START >> 24);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  316  	data[4] =3D JC_CAL_DA=
TA_SIZE;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  317  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  318  	hid_dbg(ctlr->hdev, "=
requesting cal data\n");
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  319  	ret =3D joycon_send_s=
ubcmd(ctlr, req, 5);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  320  	if (ret) {
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  321  		hid_warn(ctlr->hdev,
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  322  			 "Failed to read st=
ick cal, using defaults; ret=3D%d\n",
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  323  			 ret);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  324  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  325  		ctlr->left_stick_cal=
_x.center =3D DFLT_STICK_CAL_CEN;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  326  		ctlr->left_stick_cal=
_x.max =3D DFLT_STICK_CAL_MAX;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  327  		ctlr->left_stick_cal=
_x.min =3D DFLT_STICK_CAL_MIN;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  328  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  329  		ctlr->left_stick_cal=
_y.center =3D DFLT_STICK_CAL_CEN;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  330  		ctlr->left_stick_cal=
_y.max =3D DFLT_STICK_CAL_MAX;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  331  		ctlr->left_stick_cal=
_y.min =3D DFLT_STICK_CAL_MIN;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  332  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  333  		ctlr->right_stick_ca=
l_x.center =3D DFLT_STICK_CAL_CEN;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  334  		ctlr->right_stick_ca=
l_x.max =3D DFLT_STICK_CAL_MAX;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  335  		ctlr->right_stick_ca=
l_x.min =3D DFLT_STICK_CAL_MIN;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  336  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  337  		ctlr->right_stick_ca=
l_y.center =3D DFLT_STICK_CAL_CEN;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  338  		ctlr->right_stick_ca=
l_y.max =3D DFLT_STICK_CAL_MAX;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  339  		ctlr->right_stick_ca=
l_y.min =3D DFLT_STICK_CAL_MIN;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  340  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  341  		return ret;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  342  	}
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  343  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  344  	report =3D (struct jo=
ycon_input_report *)ctlr->input_buf;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  345  	raw_cal =3D &report->=
reply.data[5];
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  346  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  347  	/* left stick calibra=
tion parsing */
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  348  	cal_x =3D &ctlr->left=
_stick_cal_x;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  349  	cal_y =3D &ctlr->left=
_stick_cal_y;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  350  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  351  	x_max_above =3D hid_f=
ield_extract(ctlr->hdev, (raw_cal + 0), 0, 12);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  352  	y_max_above =3D hid_f=
ield_extract(ctlr->hdev, (raw_cal + 1), 4, 12);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  353  	cal_x->center =3D hid=
_field_extract(ctlr->hdev, (raw_cal + 3), 0, 12);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  354  	cal_y->center =3D hid=
_field_extract(ctlr->hdev, (raw_cal + 4), 4, 12);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  355  	x_min_below =3D hid_f=
ield_extract(ctlr->hdev, (raw_cal + 6), 0, 12);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  356  	y_min_below =3D hid_f=
ield_extract(ctlr->hdev, (raw_cal + 7), 4, 12);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  357  	cal_x->max =3D cal_x-=
>center + x_max_above;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  358  	cal_x->min =3D cal_x-=
>center - x_min_below;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  359  	cal_y->max =3D cal_y-=
>center + y_max_above;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  360  	cal_y->min =3D cal_y-=
>center - y_min_below;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  361  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  362  	/* right stick calibr=
ation parsing */
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  363  	raw_cal +=3D 9;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  364  	cal_x =3D &ctlr->righ=
t_stick_cal_x;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  365  	cal_y =3D &ctlr->righ=
t_stick_cal_y;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  366  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  367  	cal_x->center =3D hid=
_field_extract(ctlr->hdev, (raw_cal + 0), 0, 12);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  368  	cal_y->center =3D hid=
_field_extract(ctlr->hdev, (raw_cal + 1), 4, 12);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  369  	x_min_below =3D hid_f=
ield_extract(ctlr->hdev, (raw_cal + 3), 0, 12);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  370  	y_min_below =3D hid_f=
ield_extract(ctlr->hdev, (raw_cal + 4), 4, 12);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  371  	x_max_above =3D hid_f=
ield_extract(ctlr->hdev, (raw_cal + 6), 0, 12);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  372  	y_max_above =3D hid_f=
ield_extract(ctlr->hdev, (raw_cal + 7), 4, 12);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  373  	cal_x->max =3D cal_x-=
>center + x_max_above;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  374  	cal_x->min =3D cal_x-=
>center - x_min_below;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  375  	cal_y->max =3D cal_y-=
>center + y_max_above;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  376  	cal_y->min =3D cal_y-=
>center - y_min_below;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  377  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  378  	hid_dbg(ctlr->hdev, "=
calibration:\n"
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  379  			    "l_x_c=3D%d l_x=
_max=3D%d l_x_min=3D%d\n"
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  380  			    "l_y_c=3D%d l_y=
_max=3D%d l_y_min=3D%d\n"
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  381  			    "r_x_c=3D%d r_x=
_max=3D%d r_x_min=3D%d\n"
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  382  			    "r_y_c=3D%d r_y=
_max=3D%d r_y_min=3D%d\n",
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  383  			    ctlr->left_stic=
k_cal_x.center,
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  384  			    ctlr->left_stic=
k_cal_x.max,
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  385  			    ctlr->left_stic=
k_cal_x.min,
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  386  			    ctlr->left_stic=
k_cal_y.center,
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  387  			    ctlr->left_stic=
k_cal_y.max,
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  388  			    ctlr->left_stic=
k_cal_y.min,
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  389  			    ctlr->right_sti=
ck_cal_x.center,
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  390  			    ctlr->right_sti=
ck_cal_x.max,
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  391  			    ctlr->right_sti=
ck_cal_x.min,
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  392  			    ctlr->right_sti=
ck_cal_y.center,
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  393  			    ctlr->right_sti=
ck_cal_y.max,
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  394  			    ctlr->right_sti=
ck_cal_y.min);
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  395  =

e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  396  	return 0;
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  397  }
e63d24388097cc5 Daniel J. Ogorchock 2019-12-29  398  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7818923840355490662==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICPmzvl8AAy5jb25maWcAjFxbc9y2kn7Pr5hyXpIHO5Jsq5zd0gNIgiQyJEED4Fz0wlLksY8q
luQdSSf2v99uACQBEJxk69TG093EtdH9daOhn3/6eUVenh/vb57vbm++fv2x+nJ4OBxvng+fVp/v
vh7+d5XxVcPVimZMvQHh6u7h5ftv3z9c9pfvVu/fvHtzcbFaH44Ph6+r9PHh892XF/j47vHhp59/
gv/9DMT7b9DO8X9WX25vX/+++iU7/Hl387D6/c3bN2evz9//av4Fsilvclb0adoz2RdpevVjIMGP
fkOFZLy5+v3s7dnZKFuRphhZZ04TKWn6ijXrqREglkT2RNZ9wRWPMlgD39AZa0tE09dkn9C+a1jD
FCMVu6aZJ5gxSZKK/gthJj72Wy6csSUdqzLFatrTndKtSC7UxFeloCSD4eUc/l+viMSP9foWeru+
rp4Ozy/fplXEjnvabHoiCliImqmrtxe4HXa8vG4ZdKOoVKu7p9XD4zO2MAmU0B8VM77lVjwl1bDs
r17FyD3p3EXWM+wlqZQjX5IN7ddUNLTqi2vWTuIuJwHORZxVXdckztldL33BlxjvgDHO3xlVZP7B
yMKvcFjRVR0Hd4oLQzzNfhcZUUZz0lWqL7lUDanp1atfHh4fDr+Oay33csNa51BZAv43VdVEb7lk
u77+2NGOxqmzT1LBpexrWnOx74lSJC3dVekkrVgSGTTpwKgE20FEWhoG9kIqp5uAqtUfztLq6eXP
px9Pz4f7Sf0L2lDBUn3UWsETZyYuS5Z8G+fQPKepYjigPIfjLNdzuZY2GWv0eY43UrNCEIVnJMpO
S1flkZLxmrDGp0lWx4T6klGBi7WfN15LFh+UZcz68QZNlICthjWG06y4iEsJKqnY6Mn1Nc+oP8Sc
i5Rm1mzBEjla1xIh6fKSZTTpilxq9Tk8fFo9fg62eDL9PF1L3kFHYHJVWmbc6UZrkSuSEUVOsNFc
OvrscDZgveFj2ldEqj7dp1VEl7Tp3swUdmDr9uiGNkqeZPaJ4CRLoaPTYjVsP8n+6KJyNZd91+KQ
hzOi7u4Px6fYMVEsXfe8oXAO3HN4DaotGM9Y6h7jhiOHZRWNmifDzruqipx0+I8C19YrQdK1UQjH
F/k8oz2RRnQPzjBZUaIe6tUXnsrMZjyaMUFp3SpoSrv5cQwDfcOrrlFE7KNTtFKRoQ3fpxw+H9Y9
bbvf1M3TX6tnGM7qBob29Hzz/LS6ub19fHl4vnv4Mu3Ehgn4uu16kuo2gjXSG+WzI6OINIJ64Z9N
rateL675lWkJB5dsBqs2jiCRGVrSlIKlh6/jqAGBiVREydgSSeatOJiiwWlZ6JT5bdq9/BerOGoZ
TJ1JXg02V++CSLuVjKg+7FgPPHdM8BMAGOh+bIulEXY/D0g4+d4jYYOwHlWFgKt2/QByGgpLLWmR
JhXTR3mcsz9mH0MlrLlw3Dhbm3/MKXq73OmxtUF1sd2pOLafg0dkubq6OHPpuKw12Tn884tJ8Vmj
1gDschq0cf7WU6yukRbZag3T5mzYInn7n8OnFwgSVp8PN88vx8OTJtvFiHA9Oy67tgW0LPumq0mf
EIgJUk+xtdSWNAqYSvfeNTVpe1UlfV51sgxExwZhaucXHyburIPJ+HmcUbFpM9PrQVULwbtWum0A
fkpjp9qImnWbxpITJvooJ83BkZAm27JMeTgMjIPzwXJPLcscP2WJItNQe7LahpzDObimItZYC7hP
Sd/K8hRbt7yoCbHtZnTD0rijsRLQxqIdGiZCRb48zaTNIxPSACR2/DlaYCtjwMS0+wC4AdiAbYz1
VtJ03XLQJXRWAKgc/GCtLURKumG3TQATsI8ZBc8CMCy6XYJWxEF/SbXGZdNYRrjhJv4mNbRmII0T
gIksiLuAEIRbQPGjLCC4wZXm8+C3F0pBbMxb8DoQBKNr17vCRQ1HJebkQ2kJ//CCFi/yML/BaKe0
1VgUQYQjr01Pm8p2Df2CX8COnRXTGmB/GMM//a7hADNQUwcAy4IqDAX6GdIzuzWR3W3EAVpOZL55
CUe18sGIjrUMqoliDTS5TmhmTHBTMzfcduwfrXLwP67eLa8IAXCOGM4xNB2gs+AnHGKn+ZZ7S8GK
hlS5o4B6JpowTlED2Tym1LIEO+iKEsYjYoz3nQiMMMk2TNJhrWNLB00nRAjmbuoaZfe1nFN6b4sn
agIQA1YBFRmMUERCryKeTgwgPXWbaw4S/2AK+tqSvexdjIDKp/2Iu5jaQ2FSapoLNNqkww5P1l7S
j5ElgK9olrn+wpwR6KoPQxRNhFH0m1qHg56SpudnXiJCu2ybCWwPx8+Px/ubh9vDiv738ABwjYAz
TxGwATCfUFi0W22C451bSPAvu5lGu6lNLwagx88V5sQIYAQ3MScrknjHueqSqMeRFV9ikAT2ShR0
QAXLYuhMEQr2AmwCr+OCZZfnAKNaAi2OQXrsIO2lorX2VZghZTlLg1wEuOOcVcMhskvr5xMH0ct3
iRsg73T61/vt+hupRJdqc5zRlGfuaeOdajvVawegrl4dvn6+fPf6+4fL15fvXnkqDotlge2rm+Pt
fzDj/NutTjA/2exz/+nw2VDcBOQaXOaA4Jx9VBBbat8w59V1FxyvGtGhaBBrm2j76uLDKQGyw+Rq
VGBQqqGhhXY8MWju/DKM6z2L7hBHO9NrjGEC4UAMLA5LBCYxMh8yjMYEIT42tIvxCKAUTKbTwBmP
EqBF0HHfFqBRYT4PcJ5BYiYwFdSBEjoAGljaMEFTAtMsZeem7j05rfhRMTMellDRmMQUOFLJkioc
suwkpu6W2DpS0EtHqr7swOdXySRyzWEdAAu/dTCSTkzqj5ciCWvSYOiDLfNOUi/rdunTTucvnV3N
ARxQIqp9irk36njvtjAhVgW2rpJX7x1MhdskCW4hngTcJ5qa5J622+3x8fbw9PR4XD3/+GaibCcU
C6buHCt32DiVnBLVCWoQsWs4kbm7IC1LI6YKmXWrM4PuNwWvspzJMgp9FaAO5idxsBmjyIC5RAxs
oQTdKdh8VKgZ+kH2xszJazQ2EE8AD17VV62UiyKknnqMRDcjrJF5XycOuhooRoX8sY46YlPvEBNW
nY8CTITBa9DPHIKA0UpE+i73cMQAQQHoLjrq5hZhZwjmluaUfrfz4O5In4VRcxHZskYnWhc2qtyg
4aoS0FdwYKmXit65WS340beb8HegnEADl3oWSpWbOkKaf/v+/KJIfJJE8zYL6XRH+rTn/gEwbccu
k6C/YMFNfrrtMNkKR7dSFmJPi7jYUqzvccmD3F8suBhEhwSNpf8BqlVyhGPDUCfYnYrGUKP7Xa8/
xOmtTOMMRLIXcRZgnToy6tHRuXB8OJiiAQhivViYvkKZ6txjXro8JQNbndbtLi2LAPxg1n3jU8DZ
s7qrtUHKSc2q/dXlO1dAbxTEhrV09NpmWDHupRXovJOGgXbgvBtTMyeDeZkTy33h4r2BnAIQJp2Y
M65LwnfuvVDZUqM0wt3wrGbR3SkI6A3jgKfiSRlSgcT+hAQgHzh4scy/dv0ScTE4/4QWCMniTLDt
V+/PZ0yLvZ09sByHYmylrNXcgNZLbktfeffo1wLF4wPR8wKCCo6hI2Y2EsHXYBQSzhUm25fMYO3m
MywBM60VLUi6Dzuo9WUWqMhya76uDES8q5MlOLo5izV/oCreW6jgBF33jw93z49H7ybDCemsX+ya
IPswkxCkraD9RX6KlwoUJCaT5sho18q3vlMbA5qF8frLdn4J0HthyYZ7PUCoXRWEUOzDehp3zVI4
vt5l6EgKz+3E8HZjIsNOGOuVk5kCuBbDgh6WTeNA0nuNAX2xjAnYx75IEIfO0FnaEgSHCuJPlsZx
DC40QA04Y6nYR+/BMA/uuDGQ9ykW7pK0ZQEHjbTE6+Gm56oErK8JDh8z7NQN1ewXvtE22FlDSTNS
EsH/I3uwCgFfm94BVOHttrOQrMKDVw04Cu+HO3p19v3T4ebTmfN/weJiEhjCOy4xTyM6naxc0Ddz
tY7XKVvHONVKOLuOvxDPMwUR2SLdTn+c5tmCGC4IQhltFAfhc38GEJ7GdQJX7ES+QuNUCHMXJmst
RM2CQMLQwdmGamoZZm9sHIOx3prulyyo+UTJnd7Lnud5vNFJovkHpD9KYuo+KkvzuI+UNMVYP15z
dd2fn53FkPl1f/H+zB00UN76okEr8WauoBnf25UCr5bdptd0R2PeTtMx1I9lAAyz7USB2aj9rD3M
CsdSboLIss86F2235V4ydKpgjCDkOPt+bg+U5Quqc172XE/pTq2CeGuA2dcYsh3aJRUrGmj3wms2
20PMiiUyRrMqsgdH7SAhrtqqKyzCnG7FwXkjZK5dgfi+GGC+JGaFjFMPXY430VBkx5sqXq4QSmLR
QxyZ1ZlO78BsYrgBNJ3lsCSZmqevdY6nYhva4tWqm0g8lVKY6Q/Jsn7wSi7PGjC7KXbxvAy5zcIb
/6CRPguz5bYR2VYQBbcIFpR7+9w+/n04rgAg3Hw53B8envVQ0UOtHr9hJau5jB5OjckdxU6XTTzR
MWp1M+kQUlaUtnNKH+QbgI5GRfPi8XPdb8maLkXObR20tnShCay08k7+9qOBUVj8xlKG6fJIytrz
lEMCApfLWfXZr0EX9bGV4Nr4ugszXjUrSmWLAPGTNkuDRmxK2wxSQ0LppHOdgLS16ZIimugwbbWp
6FWADvRIWzZvDeOyXM5Rpisj6KbnGyoEy6ibW/RbAltoa9yW2iHhtBOiAGnsQ2qnlIaifvsb6D12
YaaZOZl/oEgWd+x6FUHLlhrTka2goDRSBmObwliL3JfYLJut/8icjZS1fuDp8hbsc9AdKQpAOQsX
JmY1AHrWpArGFMBaPftOKg6nS4JV1E7x1au5VTPri8anawtBsnCuIS+iwst706YMr52ih1OPkEOY
D2ZdBJ0OS8V4GKGag5EsgH/9bVikFVmSmqqSnxATNOuwOrQkItsi8Fx0YKbLmsSmONkJ0lLH2vh0
eyvut4iMuItuVR6LJEeLybA4ATSILSDEYd3h39HzrYF0Pc+oSB8tDtWDq/x4+L+Xw8Ptj9XT7c1X
E2ZPXtuev6WqucjXY8Ps09eD8+QC6+a8kzhQ+oJvAAtl3h2ex6xp4504j6loHB17QkN+M7rJhjXk
Ql18MU5jjMw0NA/F/tm760VJXp4GwuoXOFmrw/Ptm1+drAYcNhM/Oy4caHVtfvhULz1tRDAJeH7m
1WOhZNokF2ewEB87JtbRtWKSgK2Pn0nkZYB74CDHrACG3971tQ7G9jJPojqzsAZmfe4ebo4/VvT+
5evNDBQx8vZiyo4sxk67txfxfmdt+3nSjZ4j19Vyutv87nj/983xsMqOd//16glolrlZIviJ4V50
RDkTtTY/AC6D+HSS2fZpbqt74ilPzouKjm3F6i1yNt7WDeNXhy/Hm9XnYRaf9CzckscFgYE9m79n
/NbulQbm8jt8gDQkrqa4bBMP2Df4hMQ+6cAHDviQSoO3mYUaSgXwfv7u+XCL2P71p8M3GCUetAk9
e9Genws00aFPGxyUycRaIjfVCnROsZUdul6rrdxaJb0cJz4E5zC3xWtz3xpdmz8gUgVzmETTq7q3
CTp3jQ40sb4vRfgRoF0MXbCgV7GmT+SWhI+fGCwJVgdErtTX4Y2woeKdaIzB2zjdNgPut89jZXN5
15jUCkBahGo6C+xlP7WYV3c2PeHRLZaA8wMmHmVEJqzoeBepVYBwyLgG83gkkmvIAe5jPGqrGecC
kg7JuwWmTYTWs0U3IzeP7UwRS78tmaK2PtttC6sE5Jg1ULoqUH8RNilrDKDtq7hwDwBLAExsMnMt
bzUFzXkoJ+nHpe3BF36LH5oQz6WU2z6BCZqS1IBXsx3o68SWeoCBEJal4QV8JxoIuGErvHK6sJos
oh8I/DB81dW2pg5BfxFrJNL/UBgm7KL56aNpH6fDepobqdQza552FqBjXdZMlYzqm8p3eysYrr2h
mjuiBV7GOy8EnQZoM4W2uCYqgdOvYK8C5qzEY7C/tgzEYw9PYQYkuvBt8BGoOp+V2I/ZgEpx8zR3
SUCVrKnc56H4hT+QaZpbhuJ2s3URQ6gR6fx1kcv+x2cxxuD+49uYmqP21WHp5GDuGp1GB8uPNUOY
zPq3cn3bRdtEPlY/hokSXaCkmZjMknCc4grEc23q1H42j2y4CKEp1gU6WJVnHSZo0Dth2TAejcg6
0R1T6Df0+0Tcl4ih1Z8PSdnY+LwiukBAdxD1AP5XU12eVYR2P9hvVYWNGg2yD/rmjgzmykyicCwW
nCQsCvctrK6K1EoTmx/u3Lg6TiXqQF1KqpkzCr5QDU9+xXbnnsRFVvi52c3o5zHW+LnA2kvzkG3K
r1va0gu/ad4QIFcQD9g8ve/0RugD/tnDN1PSGt9ZOLW60TSZUwM9XEYO2LpI+eb1nzdPh0+rv0yV
8Lfj4+e7MHhGMbuGpzrQYgNcHEr7h0rZEz2NwSDgWHyrC5A6TcOX7/hnDYyA93jxX8LqoSmB0BfM
n2sVdQG6xLpp587PHG13ra0S6PeWsPAklta2Ml2D/NBQ2E9HptvygHjilR7mcynS8c8F+Fo1k2Tx
TJhlo6cUdKH8zspg5eUWII6U6ADGNzs9q7VTisy9a0BVwcLu64S71mSwkvoR4JjLni6FqnjWtCXB
K2TZnE+/8I9FmCLbFjSma/z6qyDdrjiiTgg6nUHphxn6Y1hOvvUSf2Ir4agsMPWRW+CNB1a//M+m
or1JZJkTfiy28U9n9MmQDS8b+oTm+B/Eff57c0fWXHNtBWlbdw7FmvUlyzKszBO1zc/JKB/gJhql
UyLa2vCTIlJXdJ/mS56elKnr0/yiZacH8RHORFzAcKq1PD0ACrF/XMJe5mwRc8GKG07QCN5/9bBO
OXMfD5nXgoOtpt8Pty/PN39+Pei/NbPSdTrPTsYgYU1eK4QSUxvww08XaPXAIGB6dgnQwz51dWyi
aUumgrVqRgazkE4VNNikDStGs7w0WD2T+nD/ePyxqqc04yz7cbKqZCpJqUnTkRhnIuly+CHdEdbJ
GIQ3lEdQSd0gzymM2YHxcnHLxNqYhNisdmYmMe9UWz5zCzvn5/gHFArfVPoXu7FXLObSVl/Ymnq9
d9Mm1WC/fSAX+YsbeO+P98uiV+EzFlMTyxHYOU3UXSSsXUtnAwY908tk/hhDJq7enf0elCH9c3m2
z4l6r1jEsARZTFJClYAwvYxSClFio4tc3c5T/6/UTEOKhg7XLedeDfJ10sVvea7f5rxaYEnzmOtE
Da9Olg7pL7c/WHUqBB0zMzp0wsetsTr6bHgiNY8JR4fR6gcxfoBliuTDcvPBkUnzRyfgkz6viGsW
bRWC/uMHjiXEZ8YAUMuaiFiMhCPQQRjxkOWyNZlMgHuq14l51TBkmLRJag7Pfz8e/wI0GqtjgJOz
prGVAxjiGGz8BSbTqynQNPANseOKQde988O+dJga3OXegwv4hQl6H1tqKqkKHpD8x7iaNFVIOll/
zZFd0uMTkTR+tahljLWIHzvTSLQe0htAi2bI7R22BovR4o1mrX5ITqNwk3m7ylpj4+2fg5kuW1p8
6IqvpwE4YTFx7C4bhNqm9RqD331Wpm3QFpJ1FVP8gskICCKiZdkwVdYyr0lDK9Al07rbLX7Vq65p
aBWMptYzir5mBOQFSJt5NaG6pY1ik84hqcuc1h16zrtwpECaxrK0Jz1x3nVpAkQOc8qoyI4yMDPE
sOTP5UbWodE5ahKPeFSq8WkxakHsGA4yaZe46Z3BcQ38q1e3L3/e3b7yW6+z9/FyPVjrS2928Nvq
IGKN2N9a0CLmQT+eoz4jmb9yl7i69z4FlzdYxEt3hReW8jJyGnX/NWsvF7/Rx9huQjCOGRUbM+rm
dyDjTghZ0TZQE33KCOdMhZR/LLCH/+fsWbbbRnb8Fa/mdC8yLVGSLS2yoPiQKuYrLEqie8PjG/ve
+Nw49rHdM33/foAqUgSKKDtnFnFEAPV+ASgAddiitOm5BjY5TJaOk0Oyu+yyk62Pr7aGCE6riK0c
DFaI+uj+FKMryKCAxTJaMNgu88rxK6LEVpUtlL2tXC33AOkO+d7ZI+IoEhcTxjVpqrFf8auLt7uu
3H6JCsepoxmlBbutmFbj1Jc2Hx+53ofzX8rXa3ppUvxiDd4ruY7lqQGTSmK2wiYfOwo+gENU1RSC
IbdUxA0UEZeFhciDAmpbB5frJc/KwmCE3FHOAjpg+HUOAEeWmIEfF1K3NGQf3sEhRdh4+rGtVbxj
PIKFdGoHYqMuytI7bXvCIzS5v4qRHefshRBu3Drkxw4CHP4AQLDQd916FsylIA2UZltH+RA+6tFH
4MfgxowWq74q7PRJDHFJaWwLBETixeTNta/Ea/3nB+V9jTy5wiBsFrOFL2f9JZzPZyvf9nOmA5lA
ZeJGZIbZjAqREs+wbneks4ogcosgskpUiOx1lpGtFT4C2pawCTNJcdgGK7YewkqKplntS2Qgzx13
mZWnKixoyh4kWaBOaIq9tHGoJEmwySsW4meEdkXW/zDxdOBQKKBR72bUc8TkQBxRQhtg97NI7zBP
wluNwxJJHRcXeOWhSwxdy/YI2LtCFO6PQqISFtUR1k7DY50SsJFoj9I+eexlgLHJA8SwfQQMIrgq
JXqOkPYHjH5ssxv3xCpzuGeEwBZQchrD0zGZGWkLzVq619ICMv1vmg+Sn8ttZwuMpIqnOiC9w1dE
WrJmqytS9zo1UQiZhxvF94G6MLuqVqWIiLJQa+osgMAaw9zpm47HNNp+nUbsYRp/jOwD/FmYd0ZJ
5uuZFG8gbDRmLqVfvN2/8oCQpurXDd5TP46agQm5g6DS/ngy5XUYm06w/g633/59/3ZR3949POGV
1dvTt6cfTDkQwoYjeetw63EMsV2HJ5mw29JDCQG7k5v4y3yz2EztXsPiIr7/n4dv1LyPpTsiiVzq
sY34boFAnfkT4Cx1yKMwi/B2GWUWD1OAZGmWtP58d7VQketjiGYrVaQSMfaVKb2zCV3QGK7Cra7F
RtKaMfjo6mrmZIggvNKe5GUQQ0nepqtU4f/eNuSd0PictcKbtyVr4M+yXUnqA5NLEl733chbhhzA
bOY0N8k1ErsVsuA8UnKsbjPG6/nlbO5Fj+PpJRlq+n5DsBK8zlXW9nWetk4auQH1Yf+iateZ1udl
p9GMGENn/fP22/1k2e3VYj73jUgeVcFq3tK9SsiRZ2g94qyG0OFFSBbOXnDehfkGjHG7kli22wdk
Jh3DBh5rJx+dZKkn7P22IfGprVn0j7/u356e3r5f3Nlq3rkWyZBmH6lto3EHfmQlAfwQirFmLTJu
svk4AYaMFtEElh2SKKzjafbHvTjzAJnXR3qkWUAnVBIYeYT6OhbQbhtGu25f55xlwxTO27qKGA/c
w4w+QpIxz3hjj9plJTOtHbBOtJy6vWaWRGl3HRE9NDu7yWWA2na1azRxUnWSOaYGDgq18WMu5pqU
X1kaUB+el4J0dTMhUkdeeh624mDU6bUSLXOQk9hUnM3ZVD0L6bJogGgT2YS/R/v8CaNQpXS7Uqk7
CAYGudgzlwIPeksgSbUHJok5LgwwlGab5sbvGXUmRLMDythLHZPy+OYpPuKxU468wvCFZ6tHnLPW
evbu9uUifbj/gVEJHx//+vnwzbg4XPwGKX7v1wXZLTCfqlgtFoSVH0CdCiLOC/5S3mfxUIfA2yd8
HqiUaUXeUQ/G6BTQ3yD2IGClob8zKlOYKLnnkPltTm9bjWiA+Fw7kgVMCP5Wi7WKtPeNw1oEkb20
AtqZr0VDwZEbNx0+4RwZsdIsbi9++1Q5ePiO9XE++gcUNAMmeNlrr5JHIal3ZcA0SCJOHkSEPp8z
xOlKCnqEqK7KeehYA2vk498gtxLDbjyZtNNG32MRiDPuStop2e9qHKHXn7n4HZyx+eswxpWxOWzd
DI1YdZBkdhNOC47I5NilNZr/FoQTxKTsHhYBaEFgNmcL40hVHidl19LRaTAhExtN5o6Z+Tjsvtlg
XNCkUaJEkY+1pER6z1W8VsiDhN+efr69PP3AyOkjW2K5utu7e4yHA1T3hAxfTHh+fnp5YzfFOGui
ME6KKDGGjP65NVC5nusDN/dRqbRH0wb+AkvrDovxTuptBfw1aTGuqcSrHo35dr9VvD786+cJ/aiw
t6In+KHP7ae5xSe+0AHQMV/+HobM92Q19vBJ10k0SeU2N4fjqxB7893qn70f5WlwniLJz7vnJ2DQ
uaMjLCbHO4RCzw6uDhoWK/LN9IhiRZwLff3fh7dv3+XpSTeEU69JapLIzdSfxZiDYYlJFXshi3Qv
QozdaxcpWRmKeTjOl30zPn27fbm7+MfLw92/6AF+g/pOWooBdKUcz84iYSaXcmxJi2+kjahHlXqv
tuxQq+LLq2AjpFDrYLYJ6C6JrcOrKWPmQHjROqxUzHnDHtQ1Wl0FcyH3gSBW2r6Hg+FTFrNpDv0B
ULddAyKua3k7IUd/saTYKc/92ZnMc/SMpR5yNItWRHoacGieU0xa3xmz4C6yekz7lMjt88MdyELa
zr7JrCWdtLpqpzlGle7adloBpL9cy/Sw1QVTTN0azIKuC0/tRlfNh289X3RRusaJB2txv08yZjnL
wBgCak9s2KFjmrzikSYHWJej7b5849mERRxmpXiDCOy9KfHsnGvePPns+v3+eIKj5GWsfnoyy5jJ
bgPIMJMxPkwyItH6MTwXQto0pjIOZm5/iGhgTW28F9oRI+W7punoYIxMtbjDu809C4ahicxypGaq
g2BrbNxlnAMlY2bUMCBoilLSWUtTJ3qaDHf8Pi2weOghJV9DI1lorLl7YuN8Khr6aBKJlggbY4hP
wzx6XnVD9PGQYfDmLfAADbMXstbd7reRq1yYpn4+PSzP6U3CkJi+ZIablfHHMvMtpVMHUanhjgbP
Iu7wMV2c57gEo5Q4XoKVbSPeL2qFQh4GmRgkEeLcfxYJx/OtBHEvkuOh7AqqWcGvDiY9miqS482A
c3wByKA82UC16nRMTTGHbSsjhqBULjJvqBtKE5u5pc/RKW9f3h6MFPx8+/LqXB4gdVhfoZ5HNMBD
/FCsoaHzHZFl+m5aGHcTzXNIK6Cs6zHa/Bpb6c+f5rwEloXxITdeVKKV15QeHd8wmgod+GmPmC45
wM+L/AkfVrKvJjQvtz9fbQCGi+z2P+xgM20vq0l/YKkKza3RIN3c7E04pTrM/6jL/I/0x+0rMGzf
H57Juckyi1KJz0HMlyROIrvg6TTARd8NYDcrvLY1hmeOCxKhwuW7DYvrzryU1M35iDnY4F3skmOx
fDUXYIEAw7AlqDB8dDFhHusmltoGZ6hout2jD43iCwb4htwBlA4g3PauAiM/4R856/Nw+/yM9409
EB0iLNXtNwz8NhneEnemFnsOjW18g4Lm+rhJPwrA/pkE3ocDbggXuObhAilJlhSfRQSOpH0uK3Am
eE9QSraNptvy+OqynfSmivZTYKK3gQXyjrlez5ZI7SlCR9sAzc31nmdXJM3b/Q83t2y5nO0kyddU
y4TIOaLTd+0mRAEUhlzkRD4aavuK2/2Pf35Ciez24ef93QXk6b0UMeXl0Wo1n+woBooPW6RK1nMT
Kr8aGInQ2c50m2/5R/sqWFwHq0ver1o3wcpZPzrDFeTWde/0F828id01h1Eim7LByJboEU3dRXos
MC26f2RjHqx7LcXD678/lT8/RdjdPu2maW4Z7RbkSgcjyKNo1+Wf58sptPm8HMf346FjEy80/m2O
JwseEUWCOO+I1OGpcwloJ2OkNUAP7H5WxXF98V/2/wBk7vzi0XpGeE4Qm0CawB9nNakID0BHwOZq
YWkMYuEgl/l6JEWu6OshjLUYnAkp7HJEVvNRBLu31g5SuOoltT3QVyR6QHfKSKBvZwYagm2y7Q1U
ghlvPWLRhUuO5TtQ7LJDslXu3mIYekePMvDFDWG+SxaZF7itQ6Eaz2UsYGF1Nw2LzQHA63L7hQH6
GC0Mhg5bLCYPwBgnX6bcxwa+85iy/2U6XC0xGF5RTJ/YIaEtqwi5JjdkZQ+SJGLqxmF8OIzclUPt
+3ipwwMuZzuekbgPxGmvoo55QvSb4zUShduD/eH1myR0hPEqWLVdXIkxB0GszG94J6ptjvFvmNJt
D8KreNQ1Ks3trvLIQFdtS27BVaQ3i0AvZwQGUlVWanx2BgNnozEB0cSDhJaVxBy5ivVmPQtC6qik
dBZsZjOye1pIMGOrLylAItVdA7jVSoreO1Bs93O0ufmPCzeFb2ZEA7TPo8vFiijlYj2/XJNvnOEK
VepRtRhuLsbNwh5KQ9dSHW3jPNJhFeKdjlMxuDO6v3YgQbRsrI5VWHi07FHgzlfr0ZtUyMi8ump0
C+/CJiCc8ghcTYDn1w04OA/by/XVioy9hW8WUctcU87wtl1KZgQ9Hni+br3ZV4lmgcZ7bJLMZ7Ol
eKA4DR2yjbZX85lz2W9h7l34CIQlog951VDnveb+79vXC/Xz9e3lr0fzsN3r99sXOJrfUErDIi9+
wFF9cQdL9eEZf9KF2qCEIFb7/5HvdAFkSpvLaHFihGgib14SqESz3z58O33haADBP+qBM0CbljEa
R6sYPObCdbv6CRzxBWz2cNS/3IMwCy0b56JDghqReAi9x0s1T6uddQo6UqlIjQhKeCwrTjdWuqzc
II5ObfZPr29jQgcZ4V0DR5pKeemfns/Rt/UbdAP1Jf0tKnX+O2Eiz3WPJ4EI3+tQogRKitNXMfhh
tGe3CGabCbOonBjNufuQy/rsQ5DRwi5UsnxCT6zz3mqiFZlQEX2PaTWwtZMNCpHolE8FYCkBUd0e
tBPs0g5CkiQX88VmefFb+vByf4J/v0+LS1WdoLUQbeIA60rZauuMZ1b+I7TUTO/zbkXO/R1GMOVL
DMJv1LJcwxNGGNUzx2efto1k6WqNefiJmyuyto2dtSMpbMsiln1oDAtB9vavJnIltfkwDpNJmE8h
9j2GbV2GsfGY9RDU5aGI63KrmH2qQ+N/zYITYvSBY4Kq/4PPhWYkxusA+0I4V1eFEfqRiKWpyos6
tploe2x9DpiGthH59TAC+YUNFMqFZZawnuthUx66SBpuIm/s1U2o3rJoavjBws8o7ppiv/EC8Czs
ckw9xTQHZn0On93RTC8TqTST7x2OSSOJ/737hK3TOLhZLj7KAiy8lQXGQ85Aunkwk65CB+xsRVSA
PRBEYCGjSJSpBmSZb2Z//82MJBnGY505lKiAzXmPAHIJZsDryjRNPmwNgskwHEEj4yAI5ca4r2lk
Z3iDREFWZ6Hn2siQ7LXPvBqQdiQnVYsfgMN5+MdfeF7196EhCaclmOmumFcZfJqqeW/FkCA3F8+G
gpjkIgJVhmcEz7QOt0KunCapY4+n7+DFto3yTqeBZ9NBiqwsJ2EJDBzkL/X1Q7e/vLlaLWZSBvlx
vU4uZ5fyfDlTmYes9qpCd7/N8urq16nXVxvJ+4SX39J79Amq22Ul7LUBXWpTosoT9GCgFNwJHYqv
UUgfABvAaOvWJNedztUUqXNgcd5xZKR4l8t+jzR3bLcHoqMCWRCf0dbRFUhDnfbYnfnoZY+CwQjp
F9fZ+UjH9xWYYoVrVbASRxBigUFcwL7kmu8AcHVFnItH6HpDnONAMqVhoJubal+63rN9KWEcVk3C
X0GwIHOhgNyVt7eGLHaJGPmbkmRhVEO/0geCdaYiZrvO6JuExjAKo6Rwn2pAiH3YtVE7jMUpnSBW
GGt0IheTh3/SYhLgsMkIiY3NJe0tJQCmDXYYGubuqwnIJPZ+HfnKwWqU/k1wIDvUZS1dhREayxPS
ybRdLtmHNcjEV3ecRzd7nIkw9g6eat1z5MAYW7EtWtn6K3KUK2fpHYaTavIhPdNOGACcJKqUHFPt
IzlGwfhIsnCr1Ewz4Gj0VUxqKeQGp9ufck/Mfz4GaBz6EVlvQPr+eEbhUR3IaDZ7YOnxwUBYD1VK
m0kxR+kGjxJsd+REoYh6x3rfFu8eHj0yU18Piu1oAwQqIK7BaJ9kmnmoWkDXsLuxEdrNRe+LAU88
B86wpQTz1Qck8JJuCQ7Xf6bDKOwFWea7BJ+8FfePqO2SyPN+YCz7yZOSYkdOAdY/U8yuKZjPlmTw
egCcZiT86ZCICBAY4CI/yadhj809vLVFF/K7G3GybFe0qJMqUOjt1kvP03D5Zj6TmDkoZRVctuIA
xL3LxJhLFsgviGiYy+GHywrf76Cn5jYJ2EFtv/E/AbZg+5OFGlFX5J0tXl/f7MPTtdi45E/kBplK
1kC6otIYIhHOXIws0CUfzp708EU1mjwb2vMMaX78Ml+34rFkX/Wgpe88AgpJtPczkwPFITwl0oQh
NGodrFp5wIcXZMcukV+LTIwHrEM380QG2m198KP8bIpqfUkA4SkEMb7slr6aAcKXJpKTpPl85nlD
ZycdtF/yxGWY+67Ow/qYeAISUzKgCYtStlOgdCDeiE5VDk3ZT/rz3hsF6y+XsymkOyE3CTKkSm8Y
tg2WgGajDzW8Wi58gdho6TqhTzWAbAH8Jb41PUR0INYME1z/JS6n/Kam+cLXfLYjeqYUxKVCnvNF
2PBaDYCxHL1erIOZWDD8TGoWDFQH9Kg9trQa+DVYtaKJ5jnet5hxXRZl/sGWWjDvHzgcsYR3di+p
qPVi45e0h3KOwGHIXuyEqryW9h58rE0+4W2IyN74nkWYzUOYqGPH3SRodZwqmcevkkKjQpV2BYyJ
kq+PSMKvWbn7BaoD3ifkfnVtT1fHPkl6ILBCO63mer7YRPK2jqimlB5arNfzy41n3tQw4jqUzCAo
EcZ0YcYnFvJ+Kh3mcM7vaDKN+24na0BpysS8LSPVV5cZyMDw74OJrlVGPSh0tAlmi7k4HbRidwzw
ufE8ZAyo+UY64GhusBNNjnadR5t5RF1dkkpFcxoWAtNt5nPG2BvYMvioxDJCFXXbiGtGN2YnJV3R
5OYapdkzUwILHUINeGyILNE7Zj4DBb8qo9U5fCiZ6ZuirPTNh5J2k+wPoiMSpSEbdYPei/pkYgNq
6hvZZOHk7qVPf/x4EzupPz9k+aytg2D9ELYgn0CPiYX0NFkGTXVopCJqST2F4KAiliVpHLOxiZO0
lY5ifZ0ybS3wAe+o6fTW88K31Ug7IXcNkIe4NpAoR/MqFuvRIlSzDflOMmTR5YfWRJ4Xq8aoUHSq
E491JiMc3m0TdzhDepb4eQ7vV2SvtALWQh5KQ2G4mFyp3OmAMjLat0cG7DUCZMj3N0YCe2SALVn6
J4AwTiyJgbNQ+CoxEk8uLaAqFwifWM2OW0Iqn0ZhrAo3ywGVGytmYgHVK+g6W7sB2q7XV5vLrQNt
1rNFy2Ewb66M9pxmCsD1VTultNeCTscMCjlOHakojJ1a9UqGzunIGOZDn16WpyvkCQNPjyC2idbz
OW+CSbRc8woY4OUVp0zNK2mMTkVVBvPZko1sjrEmaU/hjacqmUaFyXw2n0du2qxtPIl64YTXaQAC
Z81rZmWPKcxetzgdOyKaubd3z7KCp36FCcAfZm7mRQvZ4pWKnSdi3l/fyXe4VWFN6Tkqt/eQYxoa
KG23eHHC8tENSMktVxAldQjTV0Xak8twU+KU3R8kO1jOQY1/pTG0o3Kt15vNKiexn6qKmntWVbfV
sYlpzIBwjGT4rDZNNnkoDmF5VfH4EFUfVRy3LqFegC9ZbFgEMCkZARiQVRw+zN54+XmxxgXQdyOs
M/FOUmf7aDDiQTOpT68Pd/cXB70dzFlMmvv7u/s745mAmCFQXnh3+/x2/yIFNjg5FhTWgPGneeHj
9IBhdn6bRtX7/eLtCajvL96+D1STu+QT5YWhEPOSCrH5jLOIfxmrAHr69zCXd+cERlMrdJdBprVT
BE6s3kyt/e9g9YcJIkr67+7hFVt+54R+CGYzGDKhFGhkyzwBq2gxmzki0aiaCWt3Wgw7bEajnOEX
Gnl+Ppt96G1BuEr8Ok9gNrNJ0FDBXmFcnEnRWy2d44Z8RIf2PYnotHDMW6Bht7i9urHz399DllpJ
3DweldMoN0rHZDbhF1qLkC7Br27yWl1PZv5wM+YRl6s4zhLPu8U5L9h8drHmr7cYYDYv+bI1U+gR
cRffb1/uyBPG3GPDpN6nbpATF22Gm5x0Bh4e87RWzZ8uXFdJEqchs2O2GAW/i0Q08LEEp8vLTTBt
HgzLF1Hi6LOtwsithNJhPSw29fP5rzev2aEqqgN/3QEBJiydUKJFpim+0YKhbKi1LGLQ/soJaGkR
9umea9l1w5LkIbCm7bV1vTt7iP7A19JZSECeCE0DWTgvDsegUwei2XOwGg5BWGft5/ksWL5Pc/P5
6nLNSf6Psy9rjtxW1vwrepqwY66vuZM1EecBRbKqaHFrgrWoXyp0umW34na3HGr5Xnt+/WQCXAAw
wVLMg92q/JLYlwSQy2/NA5F1fiKJqHyt9YjNlEp+cJ8/bBvpP2RqypEG0nYbhhZ9KZ0pSd7DRDnr
mFn6+y1djA8gOIY3SoE88U0ez7Vo80w82eBNuIsS2r32xFneQ3nXWaznNo1DjGaLH+eJsU9ZFLjR
TaYkcG90hRz/N+pWJb7n3+bxb/DABhf74eYGU0pvITND27ke7Zx04qnzc295nZ940GU1ajjcyG64
YLzB1DdnBuedG1zH+uYg4X3V0s88c8FhsaK9gM9dX3nXvjmmB1tEnonz0t8sEh57rjkt285MrMUT
zjoTnIxv9G0P55zKcvutrJDW5RwWR4y3ol1nj7Qrg9NZQ/fkzONTEs8M6/daEz1ttqQ+zsSw33nK
nclM7tT4Exr5WpHIsYDloVKfnCZMRIViKQXxIsvPhbjJWYJ9laVkrQoR53StWiBFdUVDJVqxvXgm
pAqD8UebbkvmKcAtI116zkzoy5euy7nI4AeZ9MdDXh+Oq93EeOi4LpEu7rpHPcbOhF1ai6LQxNFy
5LHqIM58l44e+xPHjhcssrxEixkgAunQz2sDA64LUrxYm2ZwyqIuI6oiMKwVBUn66FQp0rx3vpkQ
tIryaSignWqGOFKEE5TGSNjLBossk991FxTPpPjaG/FAC6yFCgMzgTCcjuSjjF/82tyheKsFvdS8
7xPGsAaH+HktEifwTCL8fzCb1chpn3hp7DomHU4VLVfegCS1LLZINXjl+VsjDaqTBDOQ8Eiim4aK
T7oUQfpqQ3K0W4NBg6XYw7VDyFFAxCd7VuW6lt9IudYcpEqCXgYEMa+OrnPvEsiuSoSZ7aTtS/X0
bClGnHPkcQ8OgY+f8BJm4e6277UbwpMtIOEmubb9g/KCMUSgtRFl6PB/eWGk9wArB3d3dQa7LH1C
bz42leXp5brn9L4t9QW4cac2f3jEV6WevAEW/vJQt9QMoY2RKXM6O4DuDWzwwPH6/Ph1eSE1VF1E
1kw1dQgJJF7okETIqe1y4X9o9KVD80krdbOtBbTD3Zi6a1SZ0sH2iC5ExSy5qqq3KpBfWGcrj0Ws
VlkqDH9MhopRueruehSOngIK7WAAFlU+sZAZiaidmeWQozIyca9xPVn8xWutdTZ8Z+vgzay63ksS
8o1SYSpbbhkJVZERmaPjLOIdWzomePn+C34KFDF8xY0kcV87JLV2DhlY4HzluzatApWFFtMHFmzr
sqCjUUoO3c5bISrj2Uz1N8sSMtau2BUWXcORI03rC339PnG4UcFjyyFkYBr2t996tl868CdZb7EV
u0t0sVwkDCzD00jLbybGLPLfAHetfZsFeMdLGKK38hBcRY2BXG6xpqjyIdwuFvsihbWatt4aBxes
Hx9d37gpmXztaIu0MXqqtO9KIQgsBpa4iz5qkfFgT0E/1XVPra+H0+hsUdHdAprmogMJl7xeEGav
2ur+LM0mh8FNnT3hzAqSXZ1p1p+CKvwbo0smk44uJq7C66d2DzpjvLeE3BM8UttBCQSsJ8+Vm2NJ
4IVmIyCIZ4YBqxprJi2aQjQ788PtIneqG86DQbH2wjMShatcEPCM7XzBJpV/vy0BVmUU+aT7OlYB
02ByFFJOmsMq1rZooFSNt6ZDpJxPhDA3D/+HOhUXhZY9Fv0NY0S1gNZemeFAVdVKOy+46C1PxeBQ
/ENbSqrc7J9tFqeH1nJmhFG9Tw85nqyxx4ji9yn812pqKoJkcS09YNaz8IjDiRKtcEn9YZVnfN9Q
jFgUtD6eml4V/RCsuXbdgaRFThq68oaCsFxItC/SjhKjEDlBW6H3xsuDXijRJr3vf2xVXzEmoh+0
F6jmvhVmTiqcbWqKWCeLwyXYo8oHuc4aFOGrnSA3O/WQtDzuTAfnYcZ3R4yl0So2CRqC/jwnb8by
xcJLiacj1WstOnoS/dyAvL7XVJ6RKi4VofManWy6UxS0A7Aab0hANkJ5a9jgBhkPMdQCChy8kvpn
U23Y1z9eXp/fvnz7oVVIRH3fFkaRkNimSnCZmSg9n49HUD3hKbPp2Iq+WQx3MG16B4UD+hf0v0K6
pNfqysrCDX3KJnhCI80YZiJfqAC2Aq2yOIzMBpfUKw+ShBZ1BqbEdek3gAG/Vi114SBWjET1oiUo
PD2YBSl4ZblFA7Atigt9BS8WHXFtai++1FsHaedoZeEFD0PSHnxAI9/RRwtqFEcXswsM1VIdgVVo
3OZEWA5L3/O0IlwO4dz858fb07e7f6OL5cFD5k/fYDx9/efu6du/nz6jYsqvA9cvcNpB15k/m6mn
uJSYT2MKnuW82NfC99Fw76h9rsArGsMmp645jGhe5SfbgBFi6TeTcpXhrmU8Lt1rIrLc51Vb0idc
sWAtnp7U4ZUyNe6hgnT3/sXs92oMFKFQl4FApJrP37BAfwcxHHh+lQvA46AptLg9EQWR/vnguLA/
9GYePcN3odPyZNu8fYEE5yyUAaInX5WXtC0zYyWWz03LCPKA7Xih7jnWVU5rIAywo6UiHG8YrViK
QEnCu9lyiKFtDPaXtTcHh2awNt9gMZxhaTVZ+loqfOoOXm7ys/TZ2iMQCX+cwkG1cqxCWl6N2xLK
YdXjDxwC6bwNLPQD8Ct5IFZEVKRdCvGvNJfRsVmjWiEOts46cZ6begoYICYtFjThkd5wEIpqlnik
tbsdHU6X2ld4FrZ/0WBIj/rB/Ki9MM92ywDwqIRpSZSnbgLrt+OZNVi7A8E+uxSW0XC9oCWQ3kqT
MYBC+/hQf6ja6/4Dn91jYuVHJ5rDODB6Hf4zBCOkop8V1BC7WtyUIk9f5pF3cczms/u94W1FdcVB
Pc3CD02uk28xXI33Mzl3E+Svz+jwT912MAmU94isWt3ZO/y0zq26bwd2KVG1fMxrKbRiOnBEROO3
e3GO0lVLJ1Bci9PFGlmGzWjK8w+MovD49vK6lPH6Fkr08um/TGBQ9pT66Xeo6lTn/bnphI6xOOfx
nlXorVzV+nz8/Fn404fdQ6T64z9Vj3nLzKayFzVe7sxDcYxZMQBXEZpajapU1JWqPaXwo+HE7gif
6VfymBL8RWehAXIVXhRpLArjfuypsYJG+qX1nA1BrzQ/9SMZo8L63EmonhxYOLSuevE/0S9u6Ghi
3IT01Y5edEYOaYu6yrJlD33HCvqoOzLBeb/rHk5FTt+aT2nBIdamZTMlxeq6qUt2bwkBOLLlGetA
2qHfkUYu2DhOeXcrS+mQ4WaWBTTWLZ4yPxd8e+zoW/epY451V/BcOKBd6fEKj7Zs2eMpD+IyUVzB
4gzXDEcGgnBDjcGIBk/VoeuNHM3OuDsVAurgBtlIpeg+mE4G5KywCOEiKf7A1cBngjZMMoMqlLzE
CJbGPdLd+LfHP/+E04DIYiEKiu/i4HIZN3atEqPQMZVWkquspYe6gAmPKjpDdkZFcCuML2l2dNfj
P45LX/qrjbMemFpydmsNfyjPmdHChX5YFbTyAeQfywCU3bJNIh5fFh9Wef3R9Wg3ZbLnWcXCzIPh
2mzp86pkKyz+AMbhk5LXZwI9XZIwNLp9kF+Ibr/uUsM6YPSGah9qcj+EXemXAcWXfGMwGl0cu/Rz
oOyCPomNXuGqk6uR4ktbW5U6OEVRp5+kczdKg4Ss2WrJp+O4oD79/Sds6FSNCM1cHdbfsuXYxACN
lEKcMtUdagHwzGoP1OEVRs8Fjrub0F8ZPm26S8LY2ht9W6Re4jrmpZjRIHI92mXLhlo0k2dWinXF
x6ZmxiDN2MZRvZjPRHM4y9sAg1i2SRxG4aKlMu2UJccSqoUuGq5veRRu1pahgYO62ZCjrkr80Kws
EDebQD1oE602hbW8NeyWd3UqvO2Ty2KswO7cmLNJhKtFi1Q3WiK5hLzAaLYuS31PN3eXzdmgLWVp
ek9VIm1StcWz0urYgT3MjYLlyPfdjXsxiiYnj7tckFPfT5KVLm0L3vCVzenSMTdwfLJmRA30QjXo
03euwNkdjxruL//zPFyyLE6JZ3e4ZBDa5I1S0xnJuBeoDv5VxD1XFDCcdKbazQjf0/6wiUKqhedf
H//7SS+3vPdB3116ESSd4z3Jkox1cUIbkFgBEafMjJio8bjUZbmeSmQ0yQxZVPRVnoR066mlovqv
0AHfmrPvX9OOOrfqXIktgdCh1naVI04culhx4tpSTXKH0uzUWdxYXef0gTJJ6sIjIDupJ05B6nKu
e3xTyMNZkj45KGxWqxCTCf/saT0olbXsU28TemRRxyRsRV6KaStsk3YAUaAuF9H50AG4ci0lP9Ox
KQOMx1KpoLWe/Ni25cOyDpK+Eh2rRTt7ZCWShuU42XihxLX5KXbI5Xfzcy/G+LQli9dM6PcApQon
UqbWlvWwkj2gL/VkE4TKuXBEcHBHzvILczZodCIHQdd0a0eEby36CkOhbfj4/faDhy4RVnmkiHSL
xSXjyowM0DdujMoRizYaELJ2AoPNf7WKIFlCv1gMl0YmMTYcamkeOVCS82K1FCNind5z4ugXix5a
U/K9H4WUCKWU0A3COJ57f0SyvBfPU5IlUoO+KR/HcbTRlvcRgy4O3JBanTWOjWP72AvjGx/HviIB
K0CYbJxlYXm19YOYyk2Iuo7Fa5jG5Ln0eXccOXt23OdyIQ3WWr3rYeaGyzKKF6wj37YZVc5jyl2H
dHspXMqqWk3w83oqtFQkcXiSOhAGyPXjG5wLSS8qYzimLPZdamdUGAI30BX9FYS2KJxZKtchQ6Xr
HCGdPkJU4CKdQ7mK1QDftaS68QJqhZk5+vjiOlSqPTSWBQjsgGsBIs8CxLakYrqhQLiwqZyOHGkc
rfbDfYIOk6nU710HodX0d6xyw4N145tjf7VlzquUqJ1w50TRUeeboPeXlmjWjEd0vDIMKbZa/wwd
x/CqIj8W2xb0APnkpjKFyyIV4T0ce7dLAC+VnHBHZSjum7wd+Yg7sYR+HHLq6yp1/Tjxb5R3x9ND
RbTsrodT1bFnIMlQie/L0E2s6tsTj+dw0lnbyAHCDFvmDWSPzFRqWNDC6Mh0KA6R66/Pg2JbMVLJ
VGFo8wvVi6FDDizUBDCnh/kt3g8uUvwtDYjpDzOocz2PmAno64OprjonQGxN5MIgINJ9oMIBWzox
kxDwXFuqgWc5zGg8AW0mr/FYdeVVnrWJi6KMSy2xCERORFZBYC5tfK7xROv7G/JsKJlGYfBd7RVR
QSJYkiyAT2xqAqAGjQBCYswIYBNbWgAKZhGQ5pWk9R2Lef0UCTKNQlr7bd65Utrf39jHVeST46y6
sasBAyWHKzCxHgOVbBCgU9fhM5xQkxLOgySVnjhVsjZWympDZrEhuhyoljaD4z5pw6pxBNSMFwBZ
8DZNYj9aW0eQI/CIZa7uU3mjVvBeNQ2f8LSHSUbWBaE4pu6oFA44/RLNg8DGCQigFZ77iIUXXxU2
SrO0lWFnMnFWC70tQvr0VguOQWHT3a4lMyhq3h67a9HyltIJnNg6P/Q8UsYFKHGi9VlZdC0PA2d9
che8jBKQJm5MQw+OzWtyutiH4sS6RcV4G7o/lqy32hRN3H7irrXssOoTXQ+I58TUXifXQnrOIhYE
q+cFvBGIErJ27SWHfWbtYziDBk5AbRCAhH4Ub6h0j2m2cazGfTOPR9qYjBwfy8ilpZr2XJnylsHB
D71LrK5ApvY0IPt/k+SUHMB2jedJ3K5yN/bJlTwHAXjx5rHk8VzyFkfhiM6eQxev4mkQV+tzZ2Ta
rEtKkm3rr4oRIKuH0eWCxgrarYCGU8uvAPyIAPqey8lAlKgCceLWlu56SZa4a1smy3iceOS8EFC8
ei8AzZ9QQ6momaZ9pdKphR3ovmWZ7NN4fY3sD1W6GuS6r1qX2n8EnZAMBJ1sEUACMpCiykBX41Qw
tKS5cQoBriiJGJlA73oWA4qZJfH8dZZz4sexv3ZmRY7EJc6cCGysgJdRhRbQ+iQXLGuLCDCUsO73
nMwZoKjekxDMtcPOhuQH8lAv3w4WV3Q2Y4tpIqBVk/3BYWLr7x2X3GmE9MVU5+OSgLHd+gIdyfAl
lld5t89r9CQxPOzgDQl7uFb8X47y3DGwN3RgKQlinA70Q4N+n3WN2pEjy6X5xL45oRPa9nouOK2u
RX2xY0UHWwkjXThSH6A7Eela6FZhhse+smxSUzYxvtILQqVrrRzBh5ryV11dXoW1ChC4UWyqNBjp
SPgoXm1mM/bTAONdV+RNI2vyKYhxstHc4xvlgEM6ghZFS0um3zVKjDfpNev5mC49VYDVD5wLkY+a
GrJQ6UyPu6tpGUVOD0pVjbDgtk9Ha2pFfWKgGB4TJnLdnNlDc+wJSFqTC6NIjE8IcykjuNCHnVDY
xkSUSToxCL3NRaueH98+ffn88sdd+/r09vzt6eWvt7v9C1Tm+4verFM6bZcP2eBosye4cC85r1rN
rl8zOB9uXKdG/KYBodq6U5piUPq3Uo20VHVlGerTiQN1I51os850zhjUK6N1UYfH49UEBucQK5X4
WBQdKixQTSAA3q59PujCUk17JgZtV4d95CYEO94tYWhUqjVhfBzXCsHSD0cM1w4tNSfIshOrMTyo
IM9WvWVRobXpwDzlgfTYdVyzuQc436ZXOCsGeh7izj0xMuZtCMcgkAZVdxPw+a7o29QjGzo/ds1Y
VCLzYhtDglo18OaZK/cfZ7aDJVpniXzHyflWL12BcXoNEhTV+BQpU7yTdnARNi+IPQjb3s5WWkCH
5OaXRXoQTbhUYbQkyOFwYNZfXBC5vl6R+jS0+pRu5MjKUiO3PYZ6msKD/aBYa3QpIH68jZcV6z9U
cFq3zlGUpa3zd5D7LOUDOInjnV5EIG5m4ryYsPTw0ZoRDr68hdPe6momN6cqL8yZURcbDFhhS70u
0tjBKU3WAt22MM/Va4G+UGQmo6LnL/9+/PH0eV7q08fXz9oKj57n0pXSQ3K65yoY923DebHVPGDx
rc7ChU2m/lVaHBqhdUN8PaI6UXqEmaLa0l/qTCSmm1ls04oRaSHZYJLlTQsL94RrmiwTAGISpR+D
+FxmI8WxwBgqKa1qC2rYRErM1KCSmtN/fX17/v2v75/QCGwZrGUcTLvMkHaQstRyElTux6rTxpHm
qdprVZEqOtnzdEJe1ntJ7CxMc1UW9Osh7EK1uEUzdCjTLNUBaINw41wuZnbbbBPGbnWmog+LBNFI
TLmOmGm61w7RRIORs+a0G4HJSkjLWlItYdEVBsM0WOSE5kUufbcz4aRnhwlNQjJRy0vSjFuUH7FH
US4jgzNOqKrCiEkO8qHm4USha25BJnq4pKkaGBPNX/C56uOaaOHUBdnnojMOxGWpRmBRrEMRBbDW
YjVn4NCjqT0vUs2FBlLhe9oAA9OS28GHI+vuZz8Fs1vINh1MhRSCtFIhDmGi3dNDn6HJ82p+gw88
rb9nRFxe3PzeXOkQ/Y3VH2GhajLy/IkcphEF0pKkrRLVBmUmLkatIEekrrGcQ5MSnTH5UD/O4vh+
ZiBvDWc4iYwRMmvdmdQk8Be8ycaJF6yosUpwbuLl+oFk6uZWoH3kE9/k9c5ztxW15OQfL2i10y7W
BSRacsETgl6DUflSFRklBW+b1W6Y6FZ1ymO6dQNndS8gjEEEuQ8diwKogNOwD5MV/D4hDX0FJo9S
5oDiebpWTl4EcXQhdlFehY5rFl8QbbabguH+IYFx7ZlpqREk2fYSDo2nps+26E9ytayDXZK0j+mr
50+vL09fnz69vb58f/704066sy/GSBrkxQCyWLY2iY272mjE8v5stKIK9XO9FfriyirfDy/XnqfG
mEO8bP1NYO97VPslLeqGtMvqaKbYsrJiFs9oLY9cJ6QVlqV2K33bKyDdtlMUQNAT6pV2hjfG0jkq
yJrDDGsDtSX3bAWX5mzLYngWrdGJIYmsKQ9GbkQ5N65HU5cC14QQIhJgsIVY3jr6cxk4/nISqAyR
E6zOknPperG/mF5iCFV+uLL69KkfJht6SAhcnG0t2Y52tXqGTXqo2Z70fiEk1sHS8R+CODSrLoQP
kM2f3yQOevTDm2ifKnQdWlocYXLkS5Da8ATVPuQADixv6QPsuxdzTaJYaN8xI0NoDNrhOnAhFE4G
l+re0RwqOHLEbnJZzOwRA8HXXkfeo0xHD+ph6d5Rc268UZy8bY02oGvnv+njUadDu6MciSu2OTOP
DDN5asqe7ekZN/OiV8+j9FPLj5XlvWxmx0cU8Yby3g9AYtwbKxPNhTLoDS48AyeWR3adC0/Kt9iy
0LeMb4Wphn9oLW6FaZi/ZdbQY2XJCsMKbxxvcYvT/TuYLHqlCpM4RN9gGk/tt9jkjLrBtWK1ZDDd
6k955HwPE70JaEyexdTbYLrV6DtWh354s+hWWXtmkafZdzGdQoui9sxY8HLjO7eKhQpqXuzemiGw
sUYWnwIKE8h38a3yC6ZbXSgswG5nBxLSrfoNYtQtLikZvIMriuk4YTPXePB9B1uYvCOxJApuFUxw
WRTBdS44976Hy7vVYILr5pwezs+3ucSJ/l1sFo0Vgy2xyD8Km7TxeAdXYrl5U7laF4T/m2x95N9c
TZDJYnquM91sVvPygGRZsddU2HbHj7ktFILCdkoS5+YoFFwWjwwGl+VKVOE603Y0M8dwZ3CDazzU
32Ir9/jQeatUHBJzolsrKnAlXnBrjUMdVhdGxG22yPNvtr08pN4cXuMR+F1sNztJsLnvqoLVltRk
e0+72X25LNhule2ErsVu8Cy102gmOJpQx4R04Y8XSJVlBpeFJbBFh28gaZPZAhcL/FSkpK9cEWFa
ef2e36m+PX1+frz79PL6RIVUkd+lrBJvJvJza/IyauC1PykZaQwYG6OHQ4ido2PoncYC8ox8wB/K
mKdUAU2upu47DBtKHepPRZY34qHpH510CkqPounnU0ln2Uke3kxAntaqosali9X7XNEsFIntzjV6
epg9MJ62xtUmUqqKtTqlznuDhV2gGKztYaj8y41UKHuoGb5fiGJojxMCzdFtJM+F18hr2XB+tYWB
RPZjmdteQMWgokI6i17A1921vsLER3dwVLDugQ3Hg8k23bDKsfz0+a6q0l85PpUM/ptVp60VvyIE
H2tuW+UoHJtwUbs57d3z69MZ/aD8hNHF71x/E/w8RpRX8sH67Iouz3rlDVMhTlGejbGK+uxKWC2R
+aeXb9/wVkG07Rh0fs5KjLXtcecZQ2emE4NZ0Ku8alTnosoXldCW1HRLrrxgdXOtZJXmK+oJ0Vcx
ZVQ8fv/0/PXr4+s/syv0t7++w7//AZzff7zgH8/eJ/j15/N/3P3++vL97en75x8/L4cRP26h40RY
AZ6XMGrtK1PfM9XrnJyRRTdc002O4fLvn14+i6J8fhr/GgolvL++CH/dX56+/gn/oJP2yYEu++vz
84vy1Z+vL5+efkwffnv+WxsRsgD9iR0z9SVyIGcsDnzNVccEbJKA3ogGjhzDHYfUC4HCoJrQSnLF
Wz9QHwclOeW+7yRLaugHoZkEUkvfY0Sxy5PvOaxIPZ+K9SGZjhlzfdWAU5JhV43j0CwBUv3NMqdT
68W8aqnLOsnAm/rhuu13V2AaO77L+NRxZg9xxqJQmC8J1tPz56cXKzMs/bGb+MtibfvEYk874SF1
NT2hUWS2yz13XC8226Uqk+gUR1FsskM9Ytdd9K8kXxYD8NSGbnAhehIB8vl2wmNH99c9AGcvcehr
7ZFhQzuOUeBoUU6gus4yt1N78T1vaU4guw/n46M2XYlej9140SzpxQsT4VxHSe3p+5SGUQqRikdZ
Lim4rjGijKPY3soSX0xAJPvqg7hC3hCjkt0niWufKv2BJ56wgJNVe/z29Po4rIZUbCf5VXPaRKRB
4DBA+00lDdLFpyWkpogJgrb7+vjji5KB0tbP32BZ/e+nb0/f36bVV19E2gxy911mto0EhCntvFz/
KlOFHfXPV1ir8bKeTBUXgTj0Dnz8GgSPO7FnTfzzBpiJawo47ITL/e/5x6cn2Pq+P71gPBl9FzHb
PvZVG6mh9UIv3hDjffH8orj2/P/Y0iYXjkYRNeeIyy/k9o6YIgFNJU0vmQfnfhmYoDuR5SVS0Pfx
/ljPQY/Sv368vXx7/r9Pd/1JdoeqXTfzY+CPVlUjVDHYUl09uqmBJt5mDVRXiWW6sWtFN4nqGFcD
cxbGkWbNtoTps7TKV/HCIY3mNKbecy6WKiAWWeouMN9WREC9iL7zM9hcy1uyyvahd+nnfJXpknqO
l9CFvaSh41gqckkx1pzyoKiW71LChyFfQ+OF2D6gaRDwRA3VraG4QkQhnbAcOq6lMrvUkXHXybYS
KOUxa8Hkr2auCZ8qnpuh+SzFgJ3yVpdVSdLxCJLrLUU5so2jBqDS57TnhjGNFf3G9S801sGeZskP
OtR33G5Ht/uHys1caDhVRF3gW6iN5g6YWqPUxevH0x2cA+924yln3O/E1cyPN1igH18/3/304/EN
No7nt6ef5wORurjiWZL3WyfZbIhGH9BIcyIliSdn4/yt3x4IorvkjEB+/Nu8MZB0apURFxEwRS6T
nG3U6ZMIrfG/72CZh933DWOe6rVTLya6ix6cD2jjCpt6GaX2KUpXiFmmX47USRLEnpmaJPuLPRuw
X7i1A9SbmosXaBL2RPR8owS9r2rjIOljCX3jRxRxY3REeHADXcF77DSPVLAaO19bAadPNhu6R+kp
Po8Zam4PnZI4qtuXsaccJzGqJ7bPyNWJp5y7l435/TCrM3dRCQnJtveJEQI5UBKu/JSJGWHUX6ZF
ncZmNNbLJ3vZbF4Ye+rOKrLksEkZMyvjvmPOSwxBwNxle0Fx40l2xpHZ3/1knT56r7Ugbqx0KsK2
hoLqebHuCmMmU3vNNE59Y5jDNM70mpZRgK5YiYrqEV3FPeelj2ybzzCvLM8842zyQ+qEKUpWbLEb
VFd0KjldkGMkL+5PJZ3S6x3gzaKvh9omehvkqUvNVz+KzQUGpGrP6cwBCdTAVWOZiSbIXNjg8Ja3
yYhkkulki0MrHVZo64KHUzVZrkSyPhZVB4XB1hNyWYrHorCeQ0nql9e3L3cMTqDPnx6//3r/8vr0
+P2un4f+r6nYTbL+ZC0vDB84zhozsulCdO+wJLq+p7fpNq380Fzfy33W+76Z6EANjaG+h83I7FOc
Jc5GJ7JjEnpG7pJ2NW5bFeQUUOF/pzzmI3fBs/V1Q/104xlNA0M4cZaLpliwPGd5VS5y0/fP/3W7
CPp4SVHDyD6xxc4d6AoschQ///H89vhVFTDuXr5//WeQw35ty1KvLhAWW4jYX6DWsPJa97yZZzNN
IZ6nY5y18S7j7veXVylPLIQbf3N5+M0YLvX24Bmyi6BtzDICtSXdd06gsQyjXlDghARR9SkzE43t
GI/Ei7223PNkX1LGUROqOqAR6fRbOAL45o6esSgKDZm0uMARPTQeT8T5wVuIBGy3cXxD5Do03ZH7
zMifp03v5eZYPuRlXueL0ZTKd5dZc/6nvA4dz3N/poMCG6urszFmOW+9cUr2Ly9ff2AAORgoT19f
/rz7/vQ/9vmQHavq4bqjA3LYjhUikf3r459f0AiAeOhle2rXOu3ZlXWKmelAEE+M+/YonhfnyygA
+bnoMSpaQyvEZWTQWaBeqwIvhrimco70rMWnXctH+7y6CtNPEWBaaWDA7iuuY3I/gQKol5ejxwuF
PLrTuPtJPuqkL+34mPMzRv78/fmPv14f8d1NS+FdH6gFlMHQ5Z3n6+O3p7t///X77xhRdCrewLyD
IVRl6ON0riHQ6qYvdg8qSfm76CoRwBdOqJn2VaYacWLKO3yGLMsuT/sFkDbtA6TCFkBRsX2+LQv9
E/7A6bQQINNCgE5r13R5sa+veQ1n7FqDtk1/mOnTaEEE/pEAOfqAA7Lpy5xgMmqhPYVis+W7vOvy
7Ko+1+1wtUiPW2Vhwe9hHmhR6bBgLL2XoYFVKgZvGMannltflKJF+kJ4uVmOkS9jLN/FgoMdVHSd
Gp4eSG3laRnAb+ipXXPFMJpNXcsOUxsqfdjmneeQJz2AWZcaHzBelNCm9Iu+GDK8t4LQZC59YbgT
kiYVmxunQKBfhWGH7C286AFGhJLWB6CbSWtVtbVk2HF9sslI5JrCx0w2FD5mgO73rjixBWFIW62L
INstAUaOKRO64kUcOFr1yjxxwjjRJzXrYOI2qJmiPpTjIB0jFan5SiIs2iVslsWRWtQVrgfeFx+O
OZHsdU8RDeMZJSV2yi2ztmNZ3ujrhCQt+mwgW7pGgmOHagO8f3AtViQStSwnvlEX7uMibGFmJ/Rj
rWcsiRbDvxlnaZqX+uAuuJl3wa++bU4L0A21JE4FM5I4CUUuXOKvbdekO0ozZ2ATPhlb1hdbWBr6
B32C5A2s+4U55O8fOso8ExA/2+mzFAlTpdU0BGBtrVPTZE3j6rXsk0i9psMluCuyvO6NyjM98Kq6
oPrmfKpkmG9tUZVU2P5Zdc1PjDqzaTzpkfeqOwbspcG2VZngW5CELn0QqqKw6AJh8zPT0FXJbpvl
p+uua+o+r3XRoMphktVNlWvNjGc7z1ggB5pQ5NpnZh+OqH3AGg9ySOJ4ORHrG2kVu556m06KSWJz
3D5++q+vz398eYPjZZlmo9HVIrw0YNe0ZJwPupJzGRApg53jeIHXO9pzuYAq7iX+fkeGBRMM/ckP
nQ8n80MY+RvPo+7WRtTXozIguc8aL6AWVQRP+70X+B5TzOCQPGrCmWmxivvRZrd3qDvNoWowou53
y0ofLolPRqVBsOkr3/P0eEzDimo28ZTozDFEfSVXUyUddVciyjFztueKzmhpoLRgGf0DfKO+F2E5
1rOukk3gXs+a47kZ5uzAOrKVCGctGpgkpFtxgyd26IJTBgALJmH74zC6CAKk9ZYUpjYJybBHSgss
7OpnTLGiXlZPer35tkTMgIdKcU7QonFJHWZnpm0WuQ6dZZde0rqm8hysPdX16Maqoxya0Z2oqY1J
S/9ls2/0Xxjd4giyDyzNJCBkZxJJy2PvecG/FJcAizuA8TPeHGvVySz+vKIGsGmLrSPo7xBme0HG
DdESrDPhf7HTSW1aLQjXvFRm0kgs8nQTJjo9q1he73G3XKRzOGd5q5N4/mFckzR6x84VSOs6ESUX
OCzwa7PblQ0zavKbjE1pUKQer65BzmVjoUtRnVgVl7xDaFl/SZxbfCbDKn+E+pLa0AOXbGQtq0M3
tryWpq4Mbkly0NO+NiVsJarzHpEfCIDXnaZHjuRT3m0bntvlQ52pqHujMRfi90QcP7MlKuOeLkbJ
le+3x51OhuFwRHePHTFK8I7NbK6JHzuCXBXHz4f2Hr3l2loWOHHcgSAoBU0CW1JBqFsCp8sVbxw0
Gks38RXtRVKdPivKGwOMkx6y8YuhNdTEy6YxZhdZsKpv2cmsRFew8np0ozB0zDau2qPF0/dYoyGC
JSzGem8a4Nj2qq9XWU3NDYEQHg/ZL+LiTr3Om2jaPMKwmF0utOFBiP2Y/ysKjN63+HZADJX9zwXp
+mKYu6l66SD7tW3S+7xfrAaZUBxPKc/SohiN0enouEq0EMbt+MdEBmHMWE4XbOOSuETQlRWRYYXd
0i7m0QClH0E4iz13U102KGcKx4/2Co3fdH0YBaFgtqUMmfp/2waRcGYnG2jxcVXcd41Yt3rqFCpX
IV7sa3G3WniLZVpBoQmXliMv6WApgG9Bu9enpx+fHr8+3aXtcVL9GR4aZtbBxoP45P8opixDDXa8
BLmpI7ofEc4Kqtrio2MGO9JK84vvOdHNAmizYkdD+UqmsPvsCuoQPDIV1UWU7HhR5a7VZlSTgB5C
o3rPdajOkqgfRQK1r+iiHKTv/hGVzuE4iLMNnBZOubHVI1K0Zp9I4jh3llmKRA+Mn/PS2kSQBuub
CqqxKzzyCLjCZi6G7/hivbAg6JfsnnZFYnLSNpc6F2vfw3W/fQ/Xvrx/B1davyetdPcurgq67518
5IFFXV1Hj7boNHY5z0ZQ91k4rWr9/XXbpyeerZaGN7tp/C5XLtKVmO/docNVaU2hviquOiAjv1qW
Z3D3fWtqDmxiQ8RXo0rEpn3PJ2LRWmn3S79r98xcOT5ern1mOe7IzvCgy6QsMBlPoBi2fKvRdmZC
VBMYbPXXY1+UnMbcWFWR1ZGLFYlWEN0l2ALl5FYP6GD5YyL3gesE5E4NCB0jZ2YIwoRMMgwDkh6p
es0qPSCLFvpJRNJDMt8yDSOPyGCbeQkN9FeeNlTlR7e2cmTY2yDlflj6ROElQOQpAaJ5JBCSpREQ
GaVs4gi8kmpEAYTEcBoAejRJ0Joc0SkCiMn6Bp6qSq/StVjBKt1S3niluLFl6CN2uRDDZQCsKfqu
vzj/jBAZTVtj2FBpogUmnSaGdyNvoUeODP3sLpLMeexSYwnoepzEiZ74LtF7SPeINpJ0uokGjGz0
fV9F1LpX1Gh6fO87PlGIisFBw0mIYggEjiDMAoUO0QYCUU0tNWDj2RCfGsUyMWK4VrxKNm50PafZ
6D9hyQRnDTdKiPZAIE6IsTIAdMsLcHOxAqtf0R2GYBJZkgTAniSCnJY6AfYdIb3TDwkmH+2DUOWC
ViTGwIhYCylRW8VD1/vbCljTFKCl4jDCfW9t6+xK2I+I8YCHZ2p+It3GHxCLK9/3ZajpMk9Isa9Y
xs2rVwWhazyhXb5HFxcEAz4awvm+LeFMsri1ExzdbpADLcKU5ZjKeeVp+roqEFFSzQDQXT6CdD15
FYTUqsF75nvEBEF6SDV0X8B5npAKe8a9kNpbAUAvtzQQu0TeAvCIzAEAkYpYFIXvApdYcPod2yQx
BczeAVZBujlVBrIzJgbfvVA1nGDvQlVHhW+UQLDcKANVAu4zz4tzCpEihAUJSala+FHwLaEbBx7Y
SzY+Gclg4qiS0CX6HelUPwk60X5IT+h0tKc9lU7JCcLhg4XfJyYT0in5BOnUZBJ0ul4xJUQKOjGT
kJ4QUw/oCSVDSDo9sAaMHFHobMqhy7ux5LOhpAtBp8u7iS3pxHT/bBLyaPFRHM03UetRj/Cq+BOH
xOqA7vCMSKwqsrYH1mgaERCVRiBxSTlZQKsllRzUUtEyOH06TNNY0Q/+2idyO0tZl5HH+xnWAbm/
7TvWHgj0IqzstGoJpZ9B3Yeo1/QqMFxVHIpsqTYDRLW14Od1K65ZHmAb6vJ639MXXcDYsTMJHTEj
yzeUdoi8hfrz6ROaceC3i9sU/JAFGHlsbhNBS7vjhSBdd8qDoKCiqofByFVFWkE54gOQTtvm5X1R
6zRUgu8eTFoBvx7Mpkybo+FlXIMrlrKypLQLEW27Jivu8wejmKmwTV7k9CAecKxZQW/tm7qzBRhF
lrzi0HCWwqAXpqbSS5J/hNLppH1ebYtuMaT2O9I6ACFIom+O+ouPoD9Qz2mInFnZN63JfyryM2/q
grpyEUV46ETgT728BQYGNJMqensj/ca2HaWGjFh/LuoDqxc1yWtewERqKP1WZChT8bqplwx1jgxC
3Zwag9bAsXExLUYq/mi1hpoQsp8R7Y7VtsxblnnaJEJovwmcBfF8yPOSLyacUACtmiNfNG4FvddZ
m6JiD7uScaNCXS6Hr06tCrxqa3b9IgtcErvcNq+qY9kX45hT6HUhVlKjieu+MNNvuj6nlEXFpGU1
Bk0tG3X9VoiLlmpzOPc/1BczkxYWFNQ8sg3EtmTo8BAGvH3St10B26+lpJzBULjXK8tZxY/13iwL
b/McrVTodxbB0efMNsMBgyECq35urGSQVVuaq3BXLdp73+V5zXhhm3e8Yl3/W/MwJDbvkQrdvrL1
xakxc4T1hUOVbV8cYDpXi28O3ZH3UkvF8uER98xry329yueiqJp+MVMuRV3RtlaIfsy7Bitmyerj
QwZbYbNYjGTg7OvhSPlrE7tg2XJVzqE25smrHilS4CvJKFYo7opUXiVwcsEPlmTEyxfApowyA5Mt
VNaca1TlMl+HtJjFi5wmjRC1ZKMQw7fX5pAWulnRPHURJzyWIhlWbtQxpy07kOFYtgUKZlYG+LO2
hTNCnHW4uDN+PaSZkbvlCxlrTDQ7MmFVTe9cSG+//PPj+RP0dvn4j2bzOGVRN61I8JLmxclaARFX
+GSrYs8Op8Ys7NQbK+UwMmHZPqftjvqHNqcvDvHDroEOleaMRHNVqk+A9tyhalZOEXkGJ8J4SZYq
8Oo6hHL9kdH+dSs4X+R8CjIqfZpKt6aHlx9vaGU4mqASgaPw84UZkYLxDMbwXMSJdEUvqGkKEqPh
LHbmMFQICA4zzB2VSNnvqH1BVLvYVcBmlE6/FpUpwYGhgTMR6f4YGNJtrN5oIOkknAprvYbkI5Sq
iKD/DXYU/GEzFNPEyD39cCB1KUQNGn4otmz4TAGqXtlYKxCs+yLV3NyMNKuX3W8vr//wt+dP/0WE
Fx2/Pdb8/1X2JMuN3LD+impOSVWSZ8mWxz7kwF6k7rg39yLJvnQ5tuJRjZcpWa5k3tc/AOyFCyj7
HaY8AkA2VxAEsYhFCI3HNC799laLuheQWRXNRVrZjW7/IjEra08vNgy2nF/O2H4pI8oMXhaukU2q
xtHwSzoXcLBWCoWqEwPivBLttzO05Y3WcAfD2MuBNZhAynEyqkGIejpzBEOXBNnpyWx+yYkeEl+d
nmNS12cN6vnp+SkFLTMajPA572kme1uenGBMBy7aOBFQrqwTq2ICc8qNHqs9kw/Ay9mGq+r8ZMqH
aieCI8kOCF/44vJIY4wMnfRJTDF3xgDnVqOL+Xyz6QIoWwXmczWqxQg8ZWo5t6u+mKsPjz1Qe7sb
Ozi3R66Du07ugeZcVRYT1EyURcAhA6z+FZDrprOz6uSC9Veib+geMwQbotm7CqGlw4k1JvXpXA8w
Khe9dG85skTsPB0quvYFpiqw6q0Tf3453bAuVVStlS+0B5v5z4ZNMeesRQl7VQcz2ABWqbg6nS6S
06kj45xKM9vYsUlGbkMmjH8/7V6+/zL9lcSacukRHsq8vzwABSNcT34Zrxi/Ku5tNEd4B9PdwBAs
szo6By3ZwORb3cQ8YO4OYrb0C+/ICGCwT+/GoSiRk0m5H7utyg5Tvd89PmrnkSwIXH2pe84oYNML
QsPlcBZEeW0vrA6f1tydTiOJQhDUvFC4KznmlK0R+kXjaKfw4dap+c1qaIZF9qjO+L3NhwgTux8H
jJD0NjnI4RxXV7Y9/LN7OmAsVwpVMfkFR/1wt3/cHsylNYxuKbIq1rwW9D5RwghH4wqR6W6/GjYL
6yDk7wxGLah/5uM86KPY8HmSpWA7uiYrN8dFnIHAxqrLQ2CsZBkbY4roslHCPBDKSl1R1n6rRYNA
AHC+s/OL6UWHGT6NOBJlmC8HmLmc8nuoJUaoQ0gEAjuiCHrESEv/sV0IG7IEgpCUhUmlY8n4V4Pk
C7UtKMuVAgTEJX6Um5hg3YpNjEX5exfZi7sKdzd6QJ/zz5sdQS7q41Xg3G0wXa+L7Nony2fsYbpM
+cvjSMPN1Zr6aPnOdXDX2FAZ140K8M6h6XBYltWHVw3W3fMCrMV/2m1fDpqoK6qbDG4rG+ewABwv
odwS85qFnYuC6lvEie4+uCY4f+3uanJ8HFBtFSYLbIShM+i0AkZLlL41myCuikTc8B9mOQTuBs5d
auXlm2VjjIRShtjySE0QTBLe2Dc4tI5+e/3nMIl+/tjuf19NHt+3cBtjAjRFN0XoCpv9QS1UzWY7
JA2xlGj4ROihV1OuBdRBMPE4YLZLYjAudzakxLAC4ar2I0UBLyv2r7RIAwBcaBpYpJKBIiTO8QGM
yyNHIa7yUqsP/3movrXCGiBymdWaS+YI61aV2eklHG/kxtmSq5ejPR0VMkYjPco6zuvE6wI8KSVg
e2Kl/Yhow1Ss8JVP64LWph7fFXa0qYDV6qeBObqpH5qZfBRshP5yxSpNG725mFil3SSa5zLBtXNA
Tk1a6RCqc1VQlcNCZdbg2M5lGd64dIFVLeCw4nWlm4tzJQuQMwNWkcpze2wm5VuWZtjjVPhRmafh
UKHSK4kB8qKqjXReA6r2Um61jF8Zi3T23y7TxR5fFnCcHqWIq6jmvEd6vKEr68FJcaSl0gNOXYKE
uPLoxfGobDsYtkeixF33bCKooCdKG7PyfBtIUs2ishHADiwwXJ8Ketlc6t7OaZgkIss3w7xyDU+u
cHMCE7xqlAxbtJABh46fhVBTKnX5mQDXH6yd657/9Hr/XQYr+fd1/13LggAVRVXAP5GNFbJ5M1mq
yzPd7EbBVvHcsCN3Uc05a3OdZqpYvOiYszNtnWg4R8hhhcgP/PArG5rEIJIBOhgchYBsdTdTBW/k
kbQJVr5rAI9lQFbIusRuqZkDuDcB4heFcrKvYYtmcIJcWfKBLFS9vu/vmVBv8HE4cNv4YjZXgg/R
T0xer/jUA6WXBAPl2Dau/oE/ijgBSWesZeCyadSoQ1b4HCvpbwNerqqEZZ3yMUO9c8FwNlxOOJmh
afv8ethiSi17EMoQX0Ux0oDaMaaErOnH89sjUwlyWeWKhj+Jg5kwkvqXqGBpMwG38/AIAQC0ux3h
pTTILhS9bcrhhwE3TMdxaQ4Fsskv1c+3w/Z5ksMS+7b78evkDbVF/+zuFT2+jGj5/PT6CGB0nlUV
3X38SgYty0GF2wdnMRsrAzLtX+8e7l+fXeVYPBFkm+J/Rpfe69d9fO2q5CNSqfn4I924KrBwhLx+
v3vCNHtGKfXiV6Vh2vZBXYbq2ILqROJzljWLm93T7uU//mOdp+LKb9SHcq7E8BL/qTWhbF4SmhZl
eM1pOza1P+qQwv8O98DJpDaBe2eU5K0o49s84++QPcmmMNIVmBSLSsDZxp8fHYkz7XqH7/QBWX16
dsmdMB1Zn9R75FIj4vR0PufgvYLZ/KTMUH3G6bRHClJD22WLOnMkV+sIyvri8uupYIpW6XzOhuLv
8P1rO1MUUIM3IveACey11NVjjkHPao+Fr0Cc9lgLFPkCMf7oRDoNJMM1RAmIAESvHjuAdjccsahO
WtTGR5JCDbnTQ8xH3RHulhiRhl5qdBGMelKnhc2v4/KaEmYxZizltR/Fha5NA8mCnRK0YBFYROU9
Vt1D1QVGJtLifng5Wh3X0OWZHsu9i80SF7lfs8EJy7AKayWLrnL8EQZ9UuidobdUKKKbSfX+9xsx
pLG/fcQRQCvN8tP2ChgHrskZodRRjW5aNMPM4Cob8KmTdZKIV/WoRFUcliXPp5AMl0+cbi7Sa9sM
RSHDQE5JF7/a+KpCVWxEO7vIUhD/Y0VXoKGw3+p0UO2iKKI8C9s0SM/PHekvkDD3wySvcQqDkNeO
6XMxtACtSn01qbDkm6UoEiOJ7IhQYEESAuIvLeRz6nvaj86yaLyPAci4gMrVst3/87p/vnuB8wWE
5t3hdc+FFThGpghcwmFYFIE8hVGkElvSFC8P+9fdg6YWzYIyN23Ve+mnIx/0vkKRdTPgfArvoZ8m
i+uCyrUhSrDpYIO/nhz2d/e7l0ebUwBn0ayG6lRe1uFSXsUON8iBBlVovDobaSjOE7N8EQdCaAk7
BiBVrhrJK7jxTexZXzC1ZpPRw5yK7oHAaTk0ULj8DgaCquaMtwZ0WjV2Y+EgjtkGM5GYe9tAe8L6
WjGExPiN7lJUlMBj+6zwLhQdPepcUzSKdFkOpJXDo9Uk9FeKP+WAHKJgxAwy9sOzEwcO44xs8hmD
9co4WGqqsa4FIF+Gt2GH59V4sjVFSVnum4JP0U5fKcOlZqKfL3g4AYNFYo0hwNpFyr2UDGixaOyK
dBOuRaX/IHslVCHpadwRI+19exHMRkSNp8MrzY2CIF6IAdu1vgA49x1PKVmMm51U5bz0VcV6VG/8
jWKCyzClSuJUjx4GAHkb8usyMXdM6cuw8g7tSZNZQVr6Nxz9eiFj3+/gfifPLfUV04eFGLZrNJiX
r7nau4tI4gAuaDBMbSHKil9PgMurGONIK2dauEE1hB7XsIe1HqpW2rxg417HSUiqFxm3fxDYsgCN
am5MvDKTLQgk5Q2leuebuQJ5SX+nHoBO286RwmvipI4z9LLORN3oUfCrIZPE+NomQSzvJAxZhih1
CDMbxXWT18L4iY/7pBqhBbIQavxlCgPZka1FmWkjKMFGlP3rRVq3K803UIK4ixDV4NfaMsX3jUV1
1rIvThLZqirmBfS51Z+u/MbhKtW9+rFV5zApibjR6h5h6Mciw6vDn7G3HIFI1oKSVSRJvlZ7phDH
IOvwKkyFaAOzSj0+2loMEC4wjceg7767/6YlKqloR+o8Sm5S1JXw4lhPEcVVnS9L3UHEonIvdYnP
PZRE2yTu9Iu9olO2VAqZb9v3h9fJP8BTLJbCBDQl0BUeyJxkj8hVar7zK+DuSQqFK+6VhijxylQn
6l7AEBAY0z/Ns7hWHzsJBVfFJCjV10VZAh0z0OgfB7uxO9HE3LPhVVhmqkhqSKhwkdXHgwAj1+RF
bKLZiLp2uDU2S+AEHrs7QEqmh7lQe3ccnBmW8VJkdSzHR32MwT9ywyrzzsy1cguJK2mfAF2uw5Rr
DDAsOF6uVCpFou8/p/xezYzfml2khJjDpiI1n34Jafk3nDKH257xWq6VRG6VhEvhwwHBRgzuiXAF
gIQLREZbueUCOxRWcwHHippEEM808yd2RhsL0x63arKy8M3f7dKIfiyhro3vh0VkMmUJIobgLsEd
/H5s1AS/JevizhTC4tv/GrhsFfpwrHYDrr2IIdU6FPgUhSuYv7EQVVPgG78bb20oFWnFTB6hfPK8
EU/MCX1s+cUkCT/RPmbMFZEvEI6T1jhmhdIZjUQeLuoBPnQAxr7KeV5zWfCfzVTzNvgxRAz+snt7
vbiYX/4+/aLshqSioDLElc9O+fTrGtHXTxF9nX9MdDHntT4GET/LBtGnPveJhhupCVxEPOsyiD7T
8HPelcAg4u0CDaLPDIEje71BxOdG0IguTz9R0+VnJvjy9BPjdHn2iTZdfHWPE9wXce23/NuMVs10
9plmA5V7EYjKj3kVj9oWd/mewj0yPYV7+fQUH4+Je+H0FO657incW6uncE/gMB4fd2b6cW+m7u5c
5fFFy3PTAd040WjEWuapIwdfT+GHcCHldRcjCVwTm9Lx3NQTlbmoXQn/BqIbzCPzweeWIvyQpAxD
3nanpwBRPzEsx22arIl5vYg2fB91Cq7xV7FDnECapl6wCeETTYEMP4+kmGuyGHcyq6jRlDLSHmF7
/77fHX7apsAUoEQ5ufE33GOv0Yq2dQsNmBoFbnKwDrBEGWdLXkLxuir5ywh63IeBRdChO8VLR6AO
DfxugwgTB8qgIKwWDcU+0sGkYUWvYHUZ68kUe5IjpY0bJ/LNWnj4sFLliXAohcgyjazsMmg86mPw
bi6NUYV2abSIjqDaBVTgaelNbBqyBy6M9Jt5SYoh+RrgeGQQeHPDajD5jcx9wy3Rzn1lHFyhXBOS
Kv3zCxouPbz++/Lbz7vnu9+eXu8efuxefnu7+2cL9eweftu9HLaPuBa/yKV5td2/bJ8ob+b2BfX0
4xJVHGInu5fdYXf3tPvfPr9r980YruHYfP+qzfJME0IJhSYNlBVi9LxhdWeSFLXhuo/OaMvNt6NH
u7sx2H+Ye3C4JOAqzwfVzf7nj8Pr5P51v5287ifftk8/tnvFtIyIoU9LLeeLBp7Z8FAELNAm9ZIr
Py4iVYdoYuxCkXTvtYE2aamqD0cYSzhI/lbTnS0RrtZfFYVNDUC7BrR4t0mB74slU28H156HO5Tp
o8cWxESvxFHIecKqfrmYzi60FEUdImsSHmg3vaC/Fpj+MMuiqSNgvUx/TB8THVvFqV3ZMmn6VFpd
CDQdP/g6SQXg+99Pu/vfv29/Tu5pGzxiUqyf1uovK2HVFNgLMPR9BhZETNdCvwz0XLby1fn98G37
ctjd3x22D5PwhVoFm3fy7+7wbSLe3l7vd4QK7g53VjN9NVdLPyAMzI/gnBWzkyJPbqYy3KnZPhEu
42rKRpY1KOA/VRa3VRXaC6EKr+MVMySRAAa46mfBI9vT59cHVYPcN9Wzh9RfKG9kPawumVH2a+6k
HprhWVUn5ZoZjHzBxUkZFjvTxA2zs0CIWJfC3v9ZdGQeRiSNMK9QsUjFasOqqbqZw9A0dZMyn0M/
yJW1KqO7t2+u+UmF3fuIA264cVohZWfrEOwet28H+wulfzrjuINEyEd5d2eJimFFAIWpSySnM6ve
bEz1nFW8np5oEYRNTF+5SbBkjy5lBfAIcm45P7PwaXBmVZYGcxsWw6aTHo/2wZcGUwq1ag4DIhza
nZFiNmdt9gf8qRo1uOcLkZgyw45gWOZVyFlNjjTwRUll85tIzKezDml+NIm9rjRXzgGG6jiwXXuV
njIjiDExQ4/1t+rPuGU51WOidIh1Ad8+Nva0klpaZW0W2/tASne7H990V4FxMERoMykHrNUNYRQE
92WDKmu82K6VWlD69vJlgV6Srxcxs3N6hPWmYOKHDWTxEYFOQWy0OIOir8PiJj1eHoXAfUdK19dG
2llHfOz7eDeW/bMYDuBstkFQtSEcwTk7GABXCrobhfMXMKvFATttwyB0tWbBC4xXkbhV8232m0ok
lWC4Si/WOOUd1/xh7D77K2FZYFwDm5jgdBy7+tPTaCvBSTJz0qQ2rA4FM231Ol/Ex06sjsC1S3q0
oyE6uj1dixt3Ixyrp/eL+7Hfvr1pV+phkSzIw9Ti27e5BbtQwxMNdHbDARb5FuVtVQe91FHevTy8
Pk+y9+e/t/vJcvuy3Rs3/oGNVXHrF9x1Mii9Jbl18xhWHJIYThYgjJRnbYQF/CvG6BchmmGr2hzl
RthyF/cewTdhwFb97dYcwoGi1MN/mmi887tXJZ1gcbbIrRZEa4aJrNpCBOTPZjZHwdERdgwPxzeL
lw4G8YyZqwErb3hmb0c8ChInZ0eOEiT1ffsS0MHbwGZEiKqKo6XkT1fJoiocjaYvSrfa402+FjYj
7OBwEb64nP/HXH17Av90s9m4seezDbOCzNpXXDxW7kMrWyhXP+VAZzFsoM0RVOtnGcYSY0n8KEwq
1aKzA7RxUaFjdpZoAVbskm2dVI5B4PwEmWkWi3DjHxPD5HyDOKq8r1c3aRqimpo03BgFU3lpH5FF
4yUdTdV4OtlmfnLZ+iFqfGMfjSylhaWmxb7yqwsKSIB4rMVphYmkX4GVVhVqvvmqvpJeCOvhVcvx
EjXURShtLNHskVoWM1Gl/O3+gN5wd4etzKr6tnt8uTu877eT+2/b+++7l0c1iAla/aiPCKVmmmjj
qz+/fDGw4aZGM+xxvKzyFoXML3x2cnk+UIbwn0CUNx82xkvIQb+qP0FBzJjM5b58GbXInxkiGaFr
9/f+bv9zsn99P+xetpo7IDoeGVEbOowHmyvEsCrKQPQuQXB5ynx8hyjz1LAyVUmSMHNgs7DuMipY
qEWcUR5m6Dc0QdmaeRmoV2T53iMSu4aCoqKmqkKnRxlgslhD8yo/LTZ+JI2iynBhUKBN2wIlfQo4
XiSxrvz1YffCWa/yH396rlPYSgloTN20eildH4KKkD6Wjs6CCAMbP/RueCMAjYS/KhCBKNe9f6yG
8ByPn4B13Dx8Tdb2vypvQbE3aIpGAiVBidTpqDObBXmqdn5AgXQ5prh+VqHokWDCb/EmBEKMHh7l
Vt6PDJEWZFmmZoQqNY99uj1jUm2TTMvWcsbWgtIuQ05grj+bWwQrHJ5+69r0DkYeY4VNGwv1EtEB
RZlysDpqUs9CVMD77Xo9/y91FXVQxzPB2Ld2eRsr+1FBeICYsZjkNhUsYnProM8d8DObQTAvs54f
aT/IwarGI1ColqaiqnI/poADMHil0B5wK+Q8qqeZBKG7QqtxJIQHav8yuAG3lQzlllAWFwNHEdBE
MXi6q4yLAh8FQdnWcOXTuGkX/0idMyJGB0mHFWe1TMwoSn7RtKXW/uBaYchZgsaQCnlyi2/m6kfj
8ho1qZx0lBaxFpQviFPtN/xYBEqXcsovsYRjstTGHuajn91VUOX2nC/DGkNR5otAnbRFjqoEM1Qg
QS/+U9k7gdAwv8LUKrUxBTihBXoVane9AdVIp5h2kTRV1BtPuohSH4VJg4BevNciUYwB0L4hW+pn
Ryc0WLKA/vLeC1YE/bHfvRy+T+AaPnl43r492iYj5BByRYE8NVlQgtEQlX/2lB6KGASIMlkPj7tf
nRTXTRzWf54Na6OTQ60aBgoPTa+7hgRhInTXmZtMYIRBt7egs++DsmT3tP39sHvuhK03Ir2X8L09
UtIEVr9QjzB0F2n8UAsopmArEDn481ghCtaiXPAmZQqVV/Oh+5aBh3Hk4oJ9lwszepdOG9R2RqFq
eLIALhiSN9CfcL++UA1JoDbgiilFHuPN40MRUMVAxR4T2Gzd7iYK0bMeXWZg3bNsIy9gOYJcLu92
mmAtKwQZHSVHdC2QqdrHfWNgqFttniU3Zn+LnNyj1C2HdiedP1us6vG6XuTofitNzIeAsmr8oc+t
p2H9Y1YevChQgAEbOFiuyJn78+S/KUclYwmYbZW+BiYUPTH+1ELTT4Lt3++Pj5Jj6JZRcFXCXEk5
bx0nK0RCK3afXk2+zhyxjQkNs4CJotjri/xGmcN0iFYXIiVKeiFV9pbrEAP7PNKFnhSNhT5BRgGP
+a2gE6I/yyfISr+hDfEJUlh0eFgzTp0sebfhe646NautEsGmncHDtltEcOYlsNzt8e0xR1otd1OD
LP4I1YpjGsOh2dHIaLl2KzrEkeplWBUyCDu2iuVuRhGMzeAjSByENl2JSk074/vUSoL2kojaSkIw
FcoCNEA0LbpN2rgjrfG48vOV9XmoC8AYKxodhhTJrqMem4Nk3aqgOKAlbj2ux0SJ7LlsUnpGSZjR
ryKMhWIqfaj1k+T1/vv7D8kAo7uXRzWqOFzPG1SM1rBKVRkdk4fZyNH2FIQBktdVwkLwOebcxMjf
G2Cm4+SWgfFVXA9qXrCRgs5NYgEweWnB0hxvu0L4cdtN4qHtykzgx9qoyTCRT8Xvx/U1HIJwFAY5
Lye5pkzl1Ph1OFVz3h9bw5sjLJEknTf1CK5gMAPTAUkCdRGLYOQcZtJJFhNmgSnQyAWKn7wKw0LK
D1KNhrZQwwab/PL2Y/eC9lFvv02e3w/b/7bwn+3h/o8//vhVX7GyyiWJ5HaiqaLMV4PDOTM+8mWk
FtYBhlfHpg436qtut7u6WIXWET6QG9txvZY44Ov5uhCOiB3dZ9cV74cp0fKhR78mkqthWNjf7RDO
yvog7knoKo2DSs9hXMxpdQRhV6FPfWsq08aus8d9f236f8y9JhISZx1HggRKGB3M+AOXd1iHUtnF
nJLyKHYODfxbYYAcVT3bDUusx23szikEHzty3UIUhQ2IjQDbnU8fXFyAyYMQWVncHKQTTULsChoT
0V8FQJRB1smA3QXw3KVrwMAhZoqkQmVx+JmOIS68Vh0y+wCPWqP1cQBeKMX40sgIge2IgPEmUnSp
wz76ljpg/Si2YVnCOSHDMTlCSZDoPlAolw8RJyh66RApDPd7bjT2R9QC1/bHn1DvWmpxmVKLXECU
7Qw9zPwbTN06wOhZeVzxtuKEBKFFk8nPEVHpwsrMySxNf3NfGBuLQbbruI5QI1SZ35HolIRhIMCX
BYMEvf1pXSElXfasSvBh39Qz+V1tsuoRKT/o6zyZdDRes1hoIdpGYOe2XK1V/RrW5DhIFq7FjidM
HISUBXF6enlGmj4Ua9XSJTQYNhHtMvyAGQu/vz2GqRkXlu4NsILwogWdLxsrQsqoExCYUe8DOXkZ
aBpC/H1Mzm88EohBUKjx1m+Im4RlistScF1fZqlmS6TcHygYWNy5j4eBOZ0gwS4SsazstR6KMrnp
lU9NperQL87bjm2TrKZGsVZLOeoKvKWjgEzlGKiGvBR0vSa3cT1E3IgY2WnH4RRjgCBvQNg3nC46
4SjxSF9prH4Mr2zu/vFFAD6KyvcA+cSxm3WcS31de7JxhBZVKNjMrgO+sRR/Awo9hNxnK+kOe/3+
+PhVCKdyXBbseYJxSmZpfLzPcnCIAxe802bRoF8SykOc0rJf1NkaQ8mULZxS3Jrv0aYOy64AU2fw
AQoNVfH/AW4r+fV78AEA
--===============7818923840355490662==--

