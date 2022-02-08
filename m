Content-Type: multipart/mixed; boundary="===============4879818776633774251=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 2/2] usb: typec: rt1719: Add support for Richtek RT1719
Date: Tue, 08 Feb 2022 21:27:01 +0800
Message-ID: <202202082156.rDIyTxRl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4879818776633774251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1644246970-18305-3-git-send-email-u0084500@gmail.com>
References: <1644246970-18305-3-git-send-email-u0084500@gmail.com>
TO: "cy_huang" <u0084500@gmail.com>

Hi cy_huang,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on robh/for-next v5.17-rc3 next-20220208]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/cy_huang/Add-Richtek-RT171=
9-USBPD-controller-support/20220207-232502
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: openrisc-randconfig-m031-20220208 (https://download.01.org/0day-ci/=
archive/20220208/202202082156.rDIyTxRl-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/usb/typec/rt1719.c:604 rt1719_irq_handler() error: uninitialized sy=
mbol 'conn_info'.
drivers/usb/typec/rt1719.c:605 rt1719_irq_handler() error: uninitialized sy=
mbol 'conn_stat'.
drivers/usb/typec/rt1719.c:671 rt1719_init_attach_state() error: uninitiali=
zed symbol 'conn_info'.
drivers/usb/typec/rt1719.c:672 rt1719_init_attach_state() error: uninitiali=
zed symbol 'conn_stat'.

vim +/conn_info +604 drivers/usb/typec/rt1719.c

cbda9406acddfe ChiYuan Huang 2022-02-07  590  =

cbda9406acddfe ChiYuan Huang 2022-02-07  591  static irqreturn_t rt1719_irq=
_handler(int irq, void *priv)
cbda9406acddfe ChiYuan Huang 2022-02-07  592  {
cbda9406acddfe ChiYuan Huang 2022-02-07  593  	struct rt1719_data *data =3D=
 priv;
cbda9406acddfe ChiYuan Huang 2022-02-07  594  	u32 events, conn_info;
cbda9406acddfe ChiYuan Huang 2022-02-07  595  	u16 conn_stat;
cbda9406acddfe ChiYuan Huang 2022-02-07  596  	int ret;
cbda9406acddfe ChiYuan Huang 2022-02-07  597  =

cbda9406acddfe ChiYuan Huang 2022-02-07  598  	ret =3D rt1719_read32(data, =
RT1719_REG_EVENTS, &events);
cbda9406acddfe ChiYuan Huang 2022-02-07  599  	ret |=3D rt1719_read32(data,=
 RT1719_REG_POLICYINFO, &conn_info);
cbda9406acddfe ChiYuan Huang 2022-02-07  600  	ret |=3D rt1719_read16(data,=
 RT1719_REG_STATS, &conn_stat);
cbda9406acddfe ChiYuan Huang 2022-02-07  601  	if (ret)
cbda9406acddfe ChiYuan Huang 2022-02-07  602  		return IRQ_NONE;
cbda9406acddfe ChiYuan Huang 2022-02-07  603  =

cbda9406acddfe ChiYuan Huang 2022-02-07 @604  	data->conn_info =3D conn_inf=
o;
cbda9406acddfe ChiYuan Huang 2022-02-07 @605  	data->conn_stat =3D conn_sta=
t;
cbda9406acddfe ChiYuan Huang 2022-02-07  606  =

cbda9406acddfe ChiYuan Huang 2022-02-07  607  	events &=3D (RT1719_INT_DRSW=
_ACCEPT | RT1719_INT_RX_SRCCAP |
cbda9406acddfe ChiYuan Huang 2022-02-07  608  		   RT1719_INT_VBUS_PRESENT =
| RT1719_INT_VBUS_DCT |
cbda9406acddfe ChiYuan Huang 2022-02-07  609  		   RT1719_INT_PE_SNK_RDY);
cbda9406acddfe ChiYuan Huang 2022-02-07  610  =

cbda9406acddfe ChiYuan Huang 2022-02-07  611  	if (events & RT1719_INT_DRSW=
_ACCEPT)
cbda9406acddfe ChiYuan Huang 2022-02-07  612  		rt1719_update_data_role(dat=
a);
cbda9406acddfe ChiYuan Huang 2022-02-07  613  =

cbda9406acddfe ChiYuan Huang 2022-02-07  614  	if (events & RT1719_INT_VBUS=
_PRESENT)
cbda9406acddfe ChiYuan Huang 2022-02-07  615  		rt1719_attach(data);
cbda9406acddfe ChiYuan Huang 2022-02-07  616  =

cbda9406acddfe ChiYuan Huang 2022-02-07  617  	if (events & RT1719_INT_VBUS=
_DCT)
cbda9406acddfe ChiYuan Huang 2022-02-07  618  		rt1719_detach(data);
cbda9406acddfe ChiYuan Huang 2022-02-07  619  =

cbda9406acddfe ChiYuan Huang 2022-02-07  620  	if (events & RT1719_INT_RX_S=
RCCAP)
cbda9406acddfe ChiYuan Huang 2022-02-07  621  		rt1719_update_source_pdos(d=
ata);
cbda9406acddfe ChiYuan Huang 2022-02-07  622  =

cbda9406acddfe ChiYuan Huang 2022-02-07  623  	if (events & RT1719_INT_PE_S=
NK_RDY) {
cbda9406acddfe ChiYuan Huang 2022-02-07  624  		complete(&data->req_complet=
ion);
cbda9406acddfe ChiYuan Huang 2022-02-07  625  		rt1719_update_pwr_opmode(da=
ta);
cbda9406acddfe ChiYuan Huang 2022-02-07  626  	}
cbda9406acddfe ChiYuan Huang 2022-02-07  627  =

cbda9406acddfe ChiYuan Huang 2022-02-07  628  	/* Write 1 to clear already =
handled events */
cbda9406acddfe ChiYuan Huang 2022-02-07  629  	rt1719_write32(data, RT1719_=
REG_EVENTS, events);
cbda9406acddfe ChiYuan Huang 2022-02-07  630  =

cbda9406acddfe ChiYuan Huang 2022-02-07  631  	return IRQ_HANDLED;
cbda9406acddfe ChiYuan Huang 2022-02-07  632  }
cbda9406acddfe ChiYuan Huang 2022-02-07  633  =

cbda9406acddfe ChiYuan Huang 2022-02-07  634  static int rt1719_irq_init(st=
ruct rt1719_data *data)
cbda9406acddfe ChiYuan Huang 2022-02-07  635  {
cbda9406acddfe ChiYuan Huang 2022-02-07  636  	struct i2c_client *i2c =3D t=
o_i2c_client(data->dev);
cbda9406acddfe ChiYuan Huang 2022-02-07  637  	u32 irq_enable;
cbda9406acddfe ChiYuan Huang 2022-02-07  638  	int ret;
cbda9406acddfe ChiYuan Huang 2022-02-07  639  =

cbda9406acddfe ChiYuan Huang 2022-02-07  640  	irq_enable =3D RT1719_INT_DR=
SW_ACCEPT | RT1719_INT_RX_SRCCAP |
cbda9406acddfe ChiYuan Huang 2022-02-07  641  		     RT1719_INT_VBUS_DCT | =
RT1719_INT_VBUS_PRESENT |
cbda9406acddfe ChiYuan Huang 2022-02-07  642  		     RT1719_INT_PE_SNK_RDY;
cbda9406acddfe ChiYuan Huang 2022-02-07  643  =

cbda9406acddfe ChiYuan Huang 2022-02-07  644  	ret =3D rt1719_write32(data,=
 RT1719_REG_MASKS, irq_enable);
cbda9406acddfe ChiYuan Huang 2022-02-07  645  	if (ret) {
cbda9406acddfe ChiYuan Huang 2022-02-07  646  		dev_err(&i2c->dev, "Failed =
to config irq enable\n");
cbda9406acddfe ChiYuan Huang 2022-02-07  647  		return ret;
cbda9406acddfe ChiYuan Huang 2022-02-07  648  	}
cbda9406acddfe ChiYuan Huang 2022-02-07  649  =

cbda9406acddfe ChiYuan Huang 2022-02-07  650  	return devm_request_threaded=
_irq(&i2c->dev, i2c->irq, NULL,
cbda9406acddfe ChiYuan Huang 2022-02-07  651  					 rt1719_irq_handler, IRQ=
F_ONESHOT,
cbda9406acddfe ChiYuan Huang 2022-02-07  652  					 dev_name(&i2c->dev), da=
ta);
cbda9406acddfe ChiYuan Huang 2022-02-07  653  }
cbda9406acddfe ChiYuan Huang 2022-02-07  654  =

cbda9406acddfe ChiYuan Huang 2022-02-07  655  static int rt1719_init_attach=
_state(struct rt1719_data *data)
cbda9406acddfe ChiYuan Huang 2022-02-07  656  {
cbda9406acddfe ChiYuan Huang 2022-02-07  657  	u32 conn_info, irq_clear;
cbda9406acddfe ChiYuan Huang 2022-02-07  658  	u16 conn_stat;
cbda9406acddfe ChiYuan Huang 2022-02-07  659  	int ret;
cbda9406acddfe ChiYuan Huang 2022-02-07  660  =

cbda9406acddfe ChiYuan Huang 2022-02-07  661  	irq_clear =3D RT1719_INT_DRS=
W_ACCEPT | RT1719_INT_RX_SRCCAP |
cbda9406acddfe ChiYuan Huang 2022-02-07  662  		    RT1719_INT_VBUS_DCT | R=
T1719_INT_VBUS_PRESENT |
cbda9406acddfe ChiYuan Huang 2022-02-07  663  		    RT1719_INT_PE_SNK_RDY;
cbda9406acddfe ChiYuan Huang 2022-02-07  664  =

cbda9406acddfe ChiYuan Huang 2022-02-07  665  	ret =3D rt1719_read32(data, =
RT1719_REG_POLICYINFO, &conn_info);
cbda9406acddfe ChiYuan Huang 2022-02-07  666  	ret |=3D rt1719_read16(data,=
 RT1719_REG_STATS, &conn_stat);
cbda9406acddfe ChiYuan Huang 2022-02-07  667  	ret |=3D rt1719_write32(data=
, RT1719_REG_EVENTS, irq_clear);
cbda9406acddfe ChiYuan Huang 2022-02-07  668  	if (ret)
cbda9406acddfe ChiYuan Huang 2022-02-07  669  		return ret;
cbda9406acddfe ChiYuan Huang 2022-02-07  670  =

cbda9406acddfe ChiYuan Huang 2022-02-07 @671  	data->conn_info =3D conn_inf=
o;
cbda9406acddfe ChiYuan Huang 2022-02-07 @672  	data->conn_stat =3D conn_sta=
t;
cbda9406acddfe ChiYuan Huang 2022-02-07  673  =

cbda9406acddfe ChiYuan Huang 2022-02-07  674  	if (conn_info & RT1719_ATTAC=
HDEV_MASK)
cbda9406acddfe ChiYuan Huang 2022-02-07  675  		rt1719_attach(data);
cbda9406acddfe ChiYuan Huang 2022-02-07  676  =

cbda9406acddfe ChiYuan Huang 2022-02-07  677  	if (conn_info & RT1719_PE_EX=
P_CONTRACT) {
cbda9406acddfe ChiYuan Huang 2022-02-07  678  		rt1719_update_source_pdos(d=
ata);
cbda9406acddfe ChiYuan Huang 2022-02-07  679  		rt1719_update_pwr_opmode(da=
ta);
cbda9406acddfe ChiYuan Huang 2022-02-07  680  	}
cbda9406acddfe ChiYuan Huang 2022-02-07  681  =

cbda9406acddfe ChiYuan Huang 2022-02-07  682  	return 0;
cbda9406acddfe ChiYuan Huang 2022-02-07  683  }
cbda9406acddfe ChiYuan Huang 2022-02-07  684  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4879818776633774251==--

