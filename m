Content-Type: multipart/mixed; boundary="===============2173890588644203956=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [usb:usb-testing 43/55] drivers/usb/typec/anx7411.c:387 anx7411_register_partner() warn: passing zero to 'PTR_ERR'
Date: Sun, 17 Jul 2022 11:06:40 +0800
Message-ID: <202207171059.zvoL5dcM-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2173890588644203956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-usb(a)vger.kernel.org
TO: Xin Ji <xji@analogixsemi.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
head:   c76d09da77d69d7f737540985912ad2bca654713
commit: fe6d8a9c8e6456f8e7ba6b4ee528460beaf65a71 [43/55] usb: typec: anx741=
1: Add Analogix PD ANX7411 support
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: xtensa-randconfig-m041-20220715 (https://download.01.org/0day-ci/ar=
chive/20220717/202207171059.zvoL5dcM-lkp(a)intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/usb/typec/anx7411.c:387 anx7411_register_partner() warn: passing ze=
ro to 'PTR_ERR'
drivers/usb/typec/anx7411.c:573 anx7411_typec_register_altmode() warn: pass=
ing a valid pointer to 'PTR_ERR'
drivers/usb/typec/anx7411.c:996 anx7411_register_i2c_dummy_clients() error:=
 buffer overflow 'anx7411_i2c_addr' 4 <=3D 7
drivers/usb/typec/anx7411.c:1484 anx7411_i2c_probe() warn: missing error co=
de 'ret'

Old smatch warnings:
drivers/usb/typec/anx7411.c:997 anx7411_register_i2c_dummy_clients() error:=
 buffer overflow 'anx7411_i2c_addr' 4 <=3D 7

vim +/PTR_ERR +387 drivers/usb/typec/anx7411.c

fe6d8a9c8e6456 Xin Ji 2022-07-14  372  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  373  static int anx7411_register_partner(=
struct anx7411_data *ctx,
fe6d8a9c8e6456 Xin Ji 2022-07-14  374  				    int pd, int accessory)
fe6d8a9c8e6456 Xin Ji 2022-07-14  375  {
fe6d8a9c8e6456 Xin Ji 2022-07-14  376  	struct typec_partner_desc desc;
fe6d8a9c8e6456 Xin Ji 2022-07-14  377  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  378  	if (ctx->typec.partner)
fe6d8a9c8e6456 Xin Ji 2022-07-14  379  		return 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  380  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  381  	desc.usb_pd =3D pd;
fe6d8a9c8e6456 Xin Ji 2022-07-14  382  	desc.accessory =3D accessory;
fe6d8a9c8e6456 Xin Ji 2022-07-14  383  	desc.identity =3D NULL;
fe6d8a9c8e6456 Xin Ji 2022-07-14  384  	ctx->typec.partner =3D typec_regist=
er_partner(ctx->typec.port, &desc);
fe6d8a9c8e6456 Xin Ji 2022-07-14  385  	if (IS_ERR(ctx->typec.partner)) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  386  		ctx->typec.partner =3D NULL;
fe6d8a9c8e6456 Xin Ji 2022-07-14 @387  		return PTR_ERR(ctx->typec.partner);
fe6d8a9c8e6456 Xin Ji 2022-07-14  388  	}
fe6d8a9c8e6456 Xin Ji 2022-07-14  389  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  390  	return 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  391  }
fe6d8a9c8e6456 Xin Ji 2022-07-14  392  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  393  static int anx7411_detect_cc_orienta=
tion(struct anx7411_data *ctx)
fe6d8a9c8e6456 Xin Ji 2022-07-14  394  {
fe6d8a9c8e6456 Xin Ji 2022-07-14  395  	struct device *dev =3D &ctx->spi_cl=
ient->dev;
fe6d8a9c8e6456 Xin Ji 2022-07-14  396  	int ret;
fe6d8a9c8e6456 Xin Ji 2022-07-14  397  	int cc1_rd, cc2_rd;
fe6d8a9c8e6456 Xin Ji 2022-07-14  398  	int cc1_ra, cc2_ra;
fe6d8a9c8e6456 Xin Ji 2022-07-14  399  	int cc1_rp, cc2_rp;
fe6d8a9c8e6456 Xin Ji 2022-07-14  400  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  401  	ret =3D anx7411_reg_read(ctx->spi_c=
lient, CC_STATUS);
fe6d8a9c8e6456 Xin Ji 2022-07-14  402  	if (ret < 0)
fe6d8a9c8e6456 Xin Ji 2022-07-14  403  		return ret;
fe6d8a9c8e6456 Xin Ji 2022-07-14  404  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  405  	ctx->typec.cc_status =3D ret;
fe6d8a9c8e6456 Xin Ji 2022-07-14  406  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  407  	cc1_rd =3D ret & CC1_RD ? 1 : 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  408  	cc2_rd =3D ret & CC2_RD ? 1 : 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  409  	cc1_ra =3D ret & CC1_RA ? 1 : 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  410  	cc2_ra =3D ret & CC2_RA ? 1 : 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  411  	cc1_rp =3D CC1_RP(ret);
fe6d8a9c8e6456 Xin Ji 2022-07-14  412  	cc2_rp =3D CC2_RP(ret);
fe6d8a9c8e6456 Xin Ji 2022-07-14  413  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  414  	/* Debug cable, nothing to do */
fe6d8a9c8e6456 Xin Ji 2022-07-14  415  	if (cc1_rd && cc2_rd) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  416  		ctx->typec.cc_orientation_valid =
=3D 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  417  		return anx7411_register_partner(ct=
x, 0, TYPEC_ACCESSORY_DEBUG);
fe6d8a9c8e6456 Xin Ji 2022-07-14  418  	}
fe6d8a9c8e6456 Xin Ji 2022-07-14  419  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  420  	if (cc1_ra && cc2_ra) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  421  		ctx->typec.cc_orientation_valid =
=3D 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  422  		return anx7411_register_partner(ct=
x, 0, TYPEC_ACCESSORY_AUDIO);
fe6d8a9c8e6456 Xin Ji 2022-07-14  423  	}
fe6d8a9c8e6456 Xin Ji 2022-07-14  424  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  425  	ctx->typec.cc_orientation_valid =3D=
 1;
fe6d8a9c8e6456 Xin Ji 2022-07-14  426  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  427  	ret =3D anx7411_register_partner(ct=
x, 1, TYPEC_ACCESSORY_NONE);
fe6d8a9c8e6456 Xin Ji 2022-07-14  428  	if (ret) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  429  		dev_err(dev, "register partner\n");
fe6d8a9c8e6456 Xin Ji 2022-07-14  430  		return ret;
fe6d8a9c8e6456 Xin Ji 2022-07-14  431  	}
fe6d8a9c8e6456 Xin Ji 2022-07-14  432  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  433  	if (cc1_rd || cc1_rp) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  434  		typec_set_orientation(ctx->typec.p=
ort, TYPEC_ORIENTATION_NORMAL);
fe6d8a9c8e6456 Xin Ji 2022-07-14  435  		ctx->typec.cc_connect =3D CC1_CONN=
ECTED;
fe6d8a9c8e6456 Xin Ji 2022-07-14  436  	}
fe6d8a9c8e6456 Xin Ji 2022-07-14  437  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  438  	if (cc2_rd || cc2_rp) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  439  		typec_set_orientation(ctx->typec.p=
ort, TYPEC_ORIENTATION_REVERSE);
fe6d8a9c8e6456 Xin Ji 2022-07-14  440  		ctx->typec.cc_connect =3D CC2_CONN=
ECTED;
fe6d8a9c8e6456 Xin Ji 2022-07-14  441  	}
fe6d8a9c8e6456 Xin Ji 2022-07-14  442  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  443  	return 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  444  }
fe6d8a9c8e6456 Xin Ji 2022-07-14  445  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  446  static int anx7411_set_mux(struct an=
x7411_data *ctx, int pin_assignment)
fe6d8a9c8e6456 Xin Ji 2022-07-14  447  {
fe6d8a9c8e6456 Xin Ji 2022-07-14  448  	int mode =3D TYPEC_STATE_SAFE;
fe6d8a9c8e6456 Xin Ji 2022-07-14  449  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  450  	switch (pin_assignment) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  451  	case SELECT_PIN_ASSIGMENT_U:
fe6d8a9c8e6456 Xin Ji 2022-07-14  452  		/* default 4 line USB 3.1 */
fe6d8a9c8e6456 Xin Ji 2022-07-14  453  		mode =3D TYPEC_STATE_MODAL;
fe6d8a9c8e6456 Xin Ji 2022-07-14  454  		break;
fe6d8a9c8e6456 Xin Ji 2022-07-14  455  	case SELECT_PIN_ASSIGMENT_C:
fe6d8a9c8e6456 Xin Ji 2022-07-14  456  	case SELECT_PIN_ASSIGMENT_E:
fe6d8a9c8e6456 Xin Ji 2022-07-14  457  		/* 4 line DP */
fe6d8a9c8e6456 Xin Ji 2022-07-14  458  		mode =3D TYPEC_STATE_SAFE;
fe6d8a9c8e6456 Xin Ji 2022-07-14  459  		break;
fe6d8a9c8e6456 Xin Ji 2022-07-14  460  	case SELECT_PIN_ASSIGMENT_D:
fe6d8a9c8e6456 Xin Ji 2022-07-14  461  		/* 2 line DP, 2 line USB */
fe6d8a9c8e6456 Xin Ji 2022-07-14  462  		mode =3D TYPEC_MODE_USB3;
fe6d8a9c8e6456 Xin Ji 2022-07-14  463  		break;
fe6d8a9c8e6456 Xin Ji 2022-07-14  464  	default:
fe6d8a9c8e6456 Xin Ji 2022-07-14  465  		mode =3D TYPEC_STATE_SAFE;
fe6d8a9c8e6456 Xin Ji 2022-07-14  466  		break;
fe6d8a9c8e6456 Xin Ji 2022-07-14  467  	}
fe6d8a9c8e6456 Xin Ji 2022-07-14  468  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  469  	ctx->typec.pin_assignment =3D pin_a=
ssignment;
fe6d8a9c8e6456 Xin Ji 2022-07-14  470  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  471  	return typec_set_mode(ctx->typec.po=
rt, mode);
fe6d8a9c8e6456 Xin Ji 2022-07-14  472  }
fe6d8a9c8e6456 Xin Ji 2022-07-14  473  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  474  static int anx7411_set_usb_role(stru=
ct anx7411_data *ctx, enum usb_role role)
fe6d8a9c8e6456 Xin Ji 2022-07-14  475  {
fe6d8a9c8e6456 Xin Ji 2022-07-14  476  	if (!ctx->typec.role_sw)
fe6d8a9c8e6456 Xin Ji 2022-07-14  477  		return 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  478  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  479  	return usb_role_switch_set_role(ctx=
->typec.role_sw, role);
fe6d8a9c8e6456 Xin Ji 2022-07-14  480  }
fe6d8a9c8e6456 Xin Ji 2022-07-14  481  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  482  static int anx7411_data_role_detect(=
struct anx7411_data *ctx)
fe6d8a9c8e6456 Xin Ji 2022-07-14  483  {
fe6d8a9c8e6456 Xin Ji 2022-07-14  484  	int ret;
fe6d8a9c8e6456 Xin Ji 2022-07-14  485  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  486  	ret =3D anx7411_reg_read(ctx->spi_c=
lient, SYSTEM_STSTUS);
fe6d8a9c8e6456 Xin Ji 2022-07-14  487  	if (ret < 0)
fe6d8a9c8e6456 Xin Ji 2022-07-14  488  		return ret;
fe6d8a9c8e6456 Xin Ji 2022-07-14  489  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  490  	ctx->typec.data_role =3D (ret & DAT=
A_ROLE) ? TYPEC_HOST : TYPEC_DEVICE;
fe6d8a9c8e6456 Xin Ji 2022-07-14  491  	ctx->typec.vconn_role =3D (ret & VC=
ONN_STATUS) ? TYPEC_SOURCE : TYPEC_SINK;
fe6d8a9c8e6456 Xin Ji 2022-07-14  492  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  493  	typec_set_data_role(ctx->typec.port=
, ctx->typec.data_role);
fe6d8a9c8e6456 Xin Ji 2022-07-14  494  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  495  	typec_set_vconn_role(ctx->typec.por=
t, ctx->typec.vconn_role);
fe6d8a9c8e6456 Xin Ji 2022-07-14  496  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  497  	if (ctx->typec.data_role =3D=3D TYP=
EC_HOST)
fe6d8a9c8e6456 Xin Ji 2022-07-14  498  		return anx7411_set_usb_role(ctx, U=
SB_ROLE_HOST);
fe6d8a9c8e6456 Xin Ji 2022-07-14  499  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  500  	return anx7411_set_usb_role(ctx, US=
B_ROLE_DEVICE);
fe6d8a9c8e6456 Xin Ji 2022-07-14  501  }
fe6d8a9c8e6456 Xin Ji 2022-07-14  502  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  503  static int anx7411_power_role_detect=
(struct anx7411_data *ctx)
fe6d8a9c8e6456 Xin Ji 2022-07-14  504  {
fe6d8a9c8e6456 Xin Ji 2022-07-14  505  	int ret;
fe6d8a9c8e6456 Xin Ji 2022-07-14  506  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  507  	ret =3D anx7411_reg_read(ctx->spi_c=
lient, SYSTEM_STSTUS);
fe6d8a9c8e6456 Xin Ji 2022-07-14  508  	if (ret < 0)
fe6d8a9c8e6456 Xin Ji 2022-07-14  509  		return ret;
fe6d8a9c8e6456 Xin Ji 2022-07-14  510  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  511  	ctx->typec.power_role =3D (ret & SI=
NK_STATUS) ? TYPEC_SINK : TYPEC_SOURCE;
fe6d8a9c8e6456 Xin Ji 2022-07-14  512  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  513  	if (ctx->typec.power_role =3D=3D TY=
PEC_SOURCE) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  514  		ctx->typec.request_current =3D DEF=
_1_5A;
fe6d8a9c8e6456 Xin Ji 2022-07-14  515  		ctx->typec.request_voltage =3D DEF=
_5V;
fe6d8a9c8e6456 Xin Ji 2022-07-14  516  	}
fe6d8a9c8e6456 Xin Ji 2022-07-14  517  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  518  	typec_set_pwr_role(ctx->typec.port,=
 ctx->typec.power_role);
fe6d8a9c8e6456 Xin Ji 2022-07-14  519  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  520  	return 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  521  }
fe6d8a9c8e6456 Xin Ji 2022-07-14  522  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  523  static int anx7411_cc_status_detect(=
struct anx7411_data *ctx)
fe6d8a9c8e6456 Xin Ji 2022-07-14  524  {
fe6d8a9c8e6456 Xin Ji 2022-07-14  525  	anx7411_detect_cc_orientation(ctx);
fe6d8a9c8e6456 Xin Ji 2022-07-14  526  	anx7411_detect_power_mode(ctx);
fe6d8a9c8e6456 Xin Ji 2022-07-14  527  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  528  	return 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  529  }
fe6d8a9c8e6456 Xin Ji 2022-07-14  530  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  531  static void anx7411_partner_unregist=
er_altmode(struct anx7411_data *ctx)
fe6d8a9c8e6456 Xin Ji 2022-07-14  532  {
fe6d8a9c8e6456 Xin Ji 2022-07-14  533  	int i;
fe6d8a9c8e6456 Xin Ji 2022-07-14  534  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  535  	ctx->typec.dp_altmode_enter =3D 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  536  	ctx->typec.cust_altmode_enter =3D 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  537  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  538  	for (i =3D 0; i < MAX_ALTMODE; i++)
fe6d8a9c8e6456 Xin Ji 2022-07-14  539  		if (ctx->typec.amode[i]) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  540  			typec_unregister_altmode(ctx->typ=
ec.amode[i]);
fe6d8a9c8e6456 Xin Ji 2022-07-14  541  			ctx->typec.amode[i] =3D NULL;
fe6d8a9c8e6456 Xin Ji 2022-07-14  542  		}
fe6d8a9c8e6456 Xin Ji 2022-07-14  543  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  544  	ctx->typec.pin_assignment =3D 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  545  }
fe6d8a9c8e6456 Xin Ji 2022-07-14  546  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  547  static int anx7411_typec_register_al=
tmode(struct anx7411_data *ctx,
fe6d8a9c8e6456 Xin Ji 2022-07-14  548  					  int svid, int vdo)
fe6d8a9c8e6456 Xin Ji 2022-07-14  549  {
fe6d8a9c8e6456 Xin Ji 2022-07-14  550  	struct device *dev =3D &ctx->spi_cl=
ient->dev;
fe6d8a9c8e6456 Xin Ji 2022-07-14  551  	struct typec_altmode_desc desc;
fe6d8a9c8e6456 Xin Ji 2022-07-14  552  	int i;
fe6d8a9c8e6456 Xin Ji 2022-07-14  553  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  554  	desc.svid =3D svid;
fe6d8a9c8e6456 Xin Ji 2022-07-14  555  	desc.vdo =3D vdo;
fe6d8a9c8e6456 Xin Ji 2022-07-14  556  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  557  	for (i =3D 0; i < MAX_ALTMODE; i++)
fe6d8a9c8e6456 Xin Ji 2022-07-14  558  		if (!ctx->typec.amode[i])
fe6d8a9c8e6456 Xin Ji 2022-07-14  559  			break;
fe6d8a9c8e6456 Xin Ji 2022-07-14  560  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  561  	desc.mode =3D i + 1; /* start with =
1 */
fe6d8a9c8e6456 Xin Ji 2022-07-14  562  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  563  	if (i >=3D MAX_ALTMODE) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  564  		dev_err(dev, "no altmode space for=
 registering\n");
fe6d8a9c8e6456 Xin Ji 2022-07-14  565  		return -ENOMEM;
fe6d8a9c8e6456 Xin Ji 2022-07-14  566  	}
fe6d8a9c8e6456 Xin Ji 2022-07-14  567  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  568  	ctx->typec.amode[i] =3D typec_partn=
er_register_altmode(ctx->typec.partner,
fe6d8a9c8e6456 Xin Ji 2022-07-14  569  							     &desc);
fe6d8a9c8e6456 Xin Ji 2022-07-14  570  	if (IS_ERR(ctx->typec.amode[i])) {
fe6d8a9c8e6456 Xin Ji 2022-07-14  571  		dev_err(dev, "failed to register a=
ltmode\n");
fe6d8a9c8e6456 Xin Ji 2022-07-14  572  		ctx->typec.amode[i] =3D NULL;
fe6d8a9c8e6456 Xin Ji 2022-07-14 @573  		return PTR_ERR(ctx->typec.amode);
fe6d8a9c8e6456 Xin Ji 2022-07-14  574  	}
fe6d8a9c8e6456 Xin Ji 2022-07-14  575  =

fe6d8a9c8e6456 Xin Ji 2022-07-14  576  	return 0;
fe6d8a9c8e6456 Xin Ji 2022-07-14  577  }
fe6d8a9c8e6456 Xin Ji 2022-07-14  578  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2173890588644203956==--

