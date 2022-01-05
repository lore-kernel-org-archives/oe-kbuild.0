Content-Type: multipart/mixed; boundary="===============3812697440339043596=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] media: atmel: atmel-isc: Fix PM disable depth imbalance in atmel_isc_probe
Date: Thu, 06 Jan 2022 02:52:01 +0800
Message-ID: <202201060215.P1FTGS2p-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3812697440339043596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220105111056.4662-1-linmq006@gmail.com>
References: <20220105111056.4662-1-linmq006@gmail.com>
TO: Miaoqian Lin <linmq006@gmail.com>
CC: linmq006(a)gmail.com
CC: Eugen Hristev <eugen.hristev@microchip.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Nicolas Ferre <nicolas.ferre@microchip.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Ludovic Desroches <ludovic.desroches@microchip.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: linux-arm-kernel(a)lists.infradead.org
CC: linux-kernel(a)vger.kernel.org

Hi Miaoqian,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on media-tree/master]
[also build test WARNING on v5.16-rc8 next-20220105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Miaoqian-Lin/media-atmel-a=
tmel-isc-Fix-PM-disable-depth-imbalance-in-atmel_isc_probe/20220105-191228
base:   git://linuxtv.org/media_tree.git master
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: alpha-randconfig-s031-20220105 (https://download.01.org/0day-ci/arc=
hive/20220106/202201060215.P1FTGS2p-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/f116d8f81c642486900c9589a=
7c10d137d7eb0a2
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Miaoqian-Lin/media-atmel-atmel-isc=
-Fix-PM-disable-depth-imbalance-in-atmel_isc_probe/20220105-191228
        git checkout f116d8f81c642486900c9589a7c10d137d7eb0a2
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
lpha SHELL=3D/bin/bash drivers/media/platform/atmel/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/media/platform/atmel/atmel-sama5d2-isc.c:562:1: sparse: sparse: =
unused label 'disable_pm_runtime'

vim +/disable_pm_runtime +562 drivers/media/platform/atmel/atmel-sama5d2-is=
c.c

0a0e265515db76 Eugen Hristev    2019-06-12  380  =

0a0e265515db76 Eugen Hristev    2019-06-12  381  static int atmel_isc_probe=
(struct platform_device *pdev)
0a0e265515db76 Eugen Hristev    2019-06-12  382  {
0a0e265515db76 Eugen Hristev    2019-06-12  383  	struct device *dev =3D &p=
dev->dev;
0a0e265515db76 Eugen Hristev    2019-06-12  384  	struct isc_device *isc;
0a0e265515db76 Eugen Hristev    2019-06-12  385  	struct resource *res;
0a0e265515db76 Eugen Hristev    2019-06-12  386  	void __iomem *io_base;
0a0e265515db76 Eugen Hristev    2019-06-12  387  	struct isc_subdev_entity =
*subdev_entity;
0a0e265515db76 Eugen Hristev    2019-06-12  388  	int irq;
0a0e265515db76 Eugen Hristev    2019-06-12  389  	int ret;
d51470069eb169 Eugen Hristev    2021-04-13  390  	u32 ver;
0a0e265515db76 Eugen Hristev    2019-06-12  391  =

0a0e265515db76 Eugen Hristev    2019-06-12  392  	isc =3D devm_kzalloc(dev,=
 sizeof(*isc), GFP_KERNEL);
0a0e265515db76 Eugen Hristev    2019-06-12  393  	if (!isc)
0a0e265515db76 Eugen Hristev    2019-06-12  394  		return -ENOMEM;
0a0e265515db76 Eugen Hristev    2019-06-12  395  =

0a0e265515db76 Eugen Hristev    2019-06-12  396  	platform_set_drvdata(pdev=
, isc);
0a0e265515db76 Eugen Hristev    2019-06-12  397  	isc->dev =3D dev;
0a0e265515db76 Eugen Hristev    2019-06-12  398  =

0a0e265515db76 Eugen Hristev    2019-06-12  399  	res =3D platform_get_reso=
urce(pdev, IORESOURCE_MEM, 0);
0a0e265515db76 Eugen Hristev    2019-06-12  400  	io_base =3D devm_ioremap_=
resource(dev, res);
0a0e265515db76 Eugen Hristev    2019-06-12  401  	if (IS_ERR(io_base))
0a0e265515db76 Eugen Hristev    2019-06-12  402  		return PTR_ERR(io_base);
0a0e265515db76 Eugen Hristev    2019-06-12  403  =

0a0e265515db76 Eugen Hristev    2019-06-12  404  	isc->regmap =3D devm_regm=
ap_init_mmio(dev, io_base, &isc_regmap_config);
0a0e265515db76 Eugen Hristev    2019-06-12  405  	if (IS_ERR(isc->regmap)) {
0a0e265515db76 Eugen Hristev    2019-06-12  406  		ret =3D PTR_ERR(isc->reg=
map);
0a0e265515db76 Eugen Hristev    2019-06-12  407  		dev_err(dev, "failed to =
init register map: %d\n", ret);
0a0e265515db76 Eugen Hristev    2019-06-12  408  		return ret;
0a0e265515db76 Eugen Hristev    2019-06-12  409  	}
0a0e265515db76 Eugen Hristev    2019-06-12  410  =

0a0e265515db76 Eugen Hristev    2019-06-12  411  	irq =3D platform_get_irq(=
pdev, 0);
97299a3035328d Stephen Boyd     2019-07-30  412  	if (irq < 0)
97299a3035328d Stephen Boyd     2019-07-30  413  		return irq;
0a0e265515db76 Eugen Hristev    2019-06-12  414  =

0a0e265515db76 Eugen Hristev    2019-06-12  415  	ret =3D devm_request_irq(=
dev, irq, isc_interrupt, 0,
d5475b3c901a00 Eugen Hristev    2021-04-13  416  			       "atmel-sama5d2-i=
sc", isc);
0a0e265515db76 Eugen Hristev    2019-06-12  417  	if (ret < 0) {
0a0e265515db76 Eugen Hristev    2019-06-12  418  		dev_err(dev, "can't regi=
ster ISR for IRQ %u (ret=3D%i)\n",
0a0e265515db76 Eugen Hristev    2019-06-12  419  			irq, ret);
0a0e265515db76 Eugen Hristev    2019-06-12  420  		return ret;
0a0e265515db76 Eugen Hristev    2019-06-12  421  	}
0a0e265515db76 Eugen Hristev    2019-06-12  422  =

f84bc784fa614a Eugen Hristev    2021-04-13  423  	isc->gamma_table =3D isc_=
sama5d2_gamma_table;
f84bc784fa614a Eugen Hristev    2021-04-13  424  	isc->gamma_max =3D 2;
f84bc784fa614a Eugen Hristev    2021-04-13  425  =

f794bc16a52da7 Eugen Hristev    2021-04-13  426  	isc->max_width =3D ISC_SA=
MA5D2_MAX_SUPPORT_WIDTH;
f794bc16a52da7 Eugen Hristev    2021-04-13  427  	isc->max_height =3D ISC_S=
AMA5D2_MAX_SUPPORT_HEIGHT;
f794bc16a52da7 Eugen Hristev    2021-04-13  428  =

883285556388af Eugen Hristev    2021-04-13  429  	isc->config_dpc =3D isc_s=
ama5d2_config_dpc;
2ede3975c0a853 Eugen Hristev    2021-04-13  430  	isc->config_csc =3D isc_s=
ama5d2_config_csc;
d3b2ee5478c856 Eugen Hristev    2021-04-13  431  	isc->config_cbc =3D isc_s=
ama5d2_config_cbc;
2873f85bd318bf Eugen Hristev    2021-04-13  432  	isc->config_cc =3D isc_sa=
ma5d2_config_cc;
e48848a6af150e Eugen Hristev    2021-04-13  433  	isc->config_gam =3D isc_s=
ama5d2_config_gam;
ef9b7779688b2d Eugen Hristev    2021-04-13  434  	isc->config_rlp =3D isc_s=
ama5d2_config_rlp;
8f1b451c87ee05 Eugen Hristev    2021-04-13  435  	isc->config_ctrls =3D isc=
_sama5d2_config_ctrls;
2ede3975c0a853 Eugen Hristev    2021-04-13  436  =

049a38fc9681b3 Eugen Hristev    2021-04-13  437  	isc->adapt_pipeline =3D i=
sc_sama5d2_adapt_pipeline;
049a38fc9681b3 Eugen Hristev    2021-04-13  438  =

ffeeb01d11397b Eugen Hristev    2021-04-13  439  	isc->offsets.csc =3D ISC_=
SAMA5D2_CSC_OFFSET;
4fc9e8a775d4b3 Eugen Hristev    2021-04-13  440  	isc->offsets.cbc =3D ISC_=
SAMA5D2_CBC_OFFSET;
87b62b6d55dd78 Eugen Hristev    2021-04-13  441  	isc->offsets.sub422 =3D I=
SC_SAMA5D2_SUB422_OFFSET;
87b62b6d55dd78 Eugen Hristev    2021-04-13  442  	isc->offsets.sub420 =3D I=
SC_SAMA5D2_SUB420_OFFSET;
40ee17d1b41ccc Eugen Hristev    2021-04-13  443  	isc->offsets.rlp =3D ISC_=
SAMA5D2_RLP_OFFSET;
1a3ac5d51541b6 Eugen Hristev    2021-04-13  444  	isc->offsets.his =3D ISC_=
SAMA5D2_HIS_OFFSET;
e891009857716e Eugen Hristev    2021-04-13  445  	isc->offsets.dma =3D ISC_=
SAMA5D2_DMA_OFFSET;
d51470069eb169 Eugen Hristev    2021-04-13  446  	isc->offsets.version =3D =
ISC_SAMA5D2_VERSION_OFFSET;
629de518e6f3b8 Eugen Hristev    2021-04-13  447  	isc->offsets.his_entry =
=3D ISC_SAMA5D2_HIS_ENTRY_OFFSET;
ffeeb01d11397b Eugen Hristev    2021-04-13  448  =

415dbe4efafa29 Eugen Hristev    2021-04-13  449  	isc->controller_formats =
=3D sama5d2_controller_formats;
415dbe4efafa29 Eugen Hristev    2021-04-13  450  	isc->controller_formats_s=
ize =3D ARRAY_SIZE(sama5d2_controller_formats);
415dbe4efafa29 Eugen Hristev    2021-04-13  451  	isc->formats_list =3D sam=
a5d2_formats_list;
415dbe4efafa29 Eugen Hristev    2021-04-13  452  	isc->formats_list_size =
=3D ARRAY_SIZE(sama5d2_formats_list);
415dbe4efafa29 Eugen Hristev    2021-04-13  453  =

cd5af39467bdc7 Eugen Hristev    2021-04-13  454  	/* sama5d2-isc - 8 bits p=
er beat */
cd5af39467bdc7 Eugen Hristev    2021-04-13  455  	isc->dcfg =3D ISC_DCFG_YM=
BSIZE_BEATS8 | ISC_DCFG_CMBSIZE_BEATS8;
cd5af39467bdc7 Eugen Hristev    2021-04-13  456  =

d7f26849ed7cc8 Eugen Hristev    2021-09-13  457  	/* sama5d2-isc : ISPCK is=
 required and mandatory */
d7f26849ed7cc8 Eugen Hristev    2021-09-13  458  	isc->ispck_required =3D t=
rue;
d7f26849ed7cc8 Eugen Hristev    2021-09-13  459  =

0a0e265515db76 Eugen Hristev    2019-06-12  460  	ret =3D isc_pipeline_init=
(isc);
0a0e265515db76 Eugen Hristev    2019-06-12  461  	if (ret)
0a0e265515db76 Eugen Hristev    2019-06-12  462  		return ret;
0a0e265515db76 Eugen Hristev    2019-06-12  463  =

0a0e265515db76 Eugen Hristev    2019-06-12  464  	isc->hclock =3D devm_clk_=
get(dev, "hclock");
0a0e265515db76 Eugen Hristev    2019-06-12  465  	if (IS_ERR(isc->hclock)) {
0a0e265515db76 Eugen Hristev    2019-06-12  466  		ret =3D PTR_ERR(isc->hcl=
ock);
0a0e265515db76 Eugen Hristev    2019-06-12  467  		dev_err(dev, "failed to =
get hclock: %d\n", ret);
0a0e265515db76 Eugen Hristev    2019-06-12  468  		return ret;
0a0e265515db76 Eugen Hristev    2019-06-12  469  	}
0a0e265515db76 Eugen Hristev    2019-06-12  470  =

0a0e265515db76 Eugen Hristev    2019-06-12  471  	ret =3D clk_prepare_enabl=
e(isc->hclock);
0a0e265515db76 Eugen Hristev    2019-06-12  472  	if (ret) {
0a0e265515db76 Eugen Hristev    2019-06-12  473  		dev_err(dev, "failed to =
enable hclock: %d\n", ret);
0a0e265515db76 Eugen Hristev    2019-06-12  474  		return ret;
0a0e265515db76 Eugen Hristev    2019-06-12  475  	}
0a0e265515db76 Eugen Hristev    2019-06-12  476  =

0a0e265515db76 Eugen Hristev    2019-06-12  477  	ret =3D isc_clk_init(isc);
0a0e265515db76 Eugen Hristev    2019-06-12  478  	if (ret) {
0a0e265515db76 Eugen Hristev    2019-06-12  479  		dev_err(dev, "failed to =
init isc clock: %d\n", ret);
0a0e265515db76 Eugen Hristev    2019-06-12  480  		goto unprepare_hclk;
0a0e265515db76 Eugen Hristev    2019-06-12  481  	}
0a0e265515db76 Eugen Hristev    2019-06-12  482  	ret =3D v4l2_device_regis=
ter(dev, &isc->v4l2_dev);
0a0e265515db76 Eugen Hristev    2019-06-12  483  	if (ret) {
0a0e265515db76 Eugen Hristev    2019-06-12  484  		dev_err(dev, "unable to =
register v4l2 device.\n");
0a0e265515db76 Eugen Hristev    2019-06-12  485  		goto unprepare_clk;
0a0e265515db76 Eugen Hristev    2019-06-12  486  	}
0a0e265515db76 Eugen Hristev    2019-06-12  487  =

0a0e265515db76 Eugen Hristev    2019-06-12  488  	ret =3D isc_parse_dt(dev,=
 isc);
0a0e265515db76 Eugen Hristev    2019-06-12  489  	if (ret) {
0a0e265515db76 Eugen Hristev    2019-06-12  490  		dev_err(dev, "fail to pa=
rse device tree\n");
0a0e265515db76 Eugen Hristev    2019-06-12  491  		goto unregister_v4l2_dev=
ice;
0a0e265515db76 Eugen Hristev    2019-06-12  492  	}
0a0e265515db76 Eugen Hristev    2019-06-12  493  =

0a0e265515db76 Eugen Hristev    2019-06-12  494  	if (list_empty(&isc->subd=
ev_entities)) {
0a0e265515db76 Eugen Hristev    2019-06-12  495  		dev_err(dev, "no subdev =
found\n");
0a0e265515db76 Eugen Hristev    2019-06-12  496  		ret =3D -ENODEV;
0a0e265515db76 Eugen Hristev    2019-06-12  497  		goto unregister_v4l2_dev=
ice;
0a0e265515db76 Eugen Hristev    2019-06-12  498  	}
0a0e265515db76 Eugen Hristev    2019-06-12  499  =

0a0e265515db76 Eugen Hristev    2019-06-12  500  	list_for_each_entry(subde=
v_entity, &isc->subdev_entities, list) {
d6701f13bd0747 Ezequiel Garcia  2021-01-18  501  		struct v4l2_async_subdev=
 *asd;
3c8c153914812a Sakari Ailus     2021-03-05  502  		struct fwnode_handle *fw=
node =3D
3c8c153914812a Sakari Ailus     2021-03-05  503  			of_fwnode_handle(subdev=
_entity->epn);
d6701f13bd0747 Ezequiel Garcia  2021-01-18  504  =

3c8c153914812a Sakari Ailus     2021-03-05  505  		v4l2_async_nf_init(&subd=
ev_entity->notifier);
0a0e265515db76 Eugen Hristev    2019-06-12  506  =

3c8c153914812a Sakari Ailus     2021-03-05  507  		asd =3D v4l2_async_nf_ad=
d_fwnode_remote(&subdev_entity->notifier,
3c8c153914812a Sakari Ailus     2021-03-05  508  						      fwnode,
b01edcbd409cf7 Laurent Pinchart 2021-01-18  509  						      struct v4l2_as=
ync_subdev);
d6701f13bd0747 Ezequiel Garcia  2021-01-18  510  =

d6701f13bd0747 Ezequiel Garcia  2021-01-18  511  		of_node_put(subdev_entit=
y->epn);
d6701f13bd0747 Ezequiel Garcia  2021-01-18  512  		subdev_entity->epn =3D N=
ULL;
d6701f13bd0747 Ezequiel Garcia  2021-01-18  513  =

d6701f13bd0747 Ezequiel Garcia  2021-01-18  514  		if (IS_ERR(asd)) {
d6701f13bd0747 Ezequiel Garcia  2021-01-18  515  			ret =3D PTR_ERR(asd);
0a0e265515db76 Eugen Hristev    2019-06-12  516  			goto cleanup_subdev;
0a0e265515db76 Eugen Hristev    2019-06-12  517  		}
0a0e265515db76 Eugen Hristev    2019-06-12  518  =

0a0e265515db76 Eugen Hristev    2019-06-12  519  		subdev_entity->notifier.=
ops =3D &isc_async_ops;
0a0e265515db76 Eugen Hristev    2019-06-12  520  =

3c8c153914812a Sakari Ailus     2021-03-05  521  		ret =3D v4l2_async_nf_re=
gister(&isc->v4l2_dev,
0a0e265515db76 Eugen Hristev    2019-06-12  522  					     &subdev_entity->=
notifier);
0a0e265515db76 Eugen Hristev    2019-06-12  523  		if (ret) {
0a0e265515db76 Eugen Hristev    2019-06-12  524  			dev_err(dev, "fail to r=
egister async notifier\n");
0a0e265515db76 Eugen Hristev    2019-06-12  525  			goto cleanup_subdev;
0a0e265515db76 Eugen Hristev    2019-06-12  526  		}
0a0e265515db76 Eugen Hristev    2019-06-12  527  =

0a0e265515db76 Eugen Hristev    2019-06-12  528  		if (video_is_registered(=
&isc->video_dev))
0a0e265515db76 Eugen Hristev    2019-06-12  529  			break;
0a0e265515db76 Eugen Hristev    2019-06-12  530  	}
0a0e265515db76 Eugen Hristev    2019-06-12  531  =

0a0e265515db76 Eugen Hristev    2019-06-12  532  	pm_runtime_set_active(dev=
);
0a0e265515db76 Eugen Hristev    2019-06-12  533  	pm_runtime_enable(dev);
0a0e265515db76 Eugen Hristev    2019-06-12  534  	pm_request_idle(dev);
0a0e265515db76 Eugen Hristev    2019-06-12  535  =

d7f26849ed7cc8 Eugen Hristev    2021-09-13  536  	isc->ispck =3D isc->isc_c=
lks[ISC_ISPCK].clk;
d7f26849ed7cc8 Eugen Hristev    2021-09-13  537  =

d7f26849ed7cc8 Eugen Hristev    2021-09-13  538  	ret =3D clk_prepare_enabl=
e(isc->ispck);
d7f26849ed7cc8 Eugen Hristev    2021-09-13  539  	if (ret) {
d7f26849ed7cc8 Eugen Hristev    2021-09-13  540  		dev_err(dev, "failed to =
enable ispck: %d\n", ret);
d7f26849ed7cc8 Eugen Hristev    2021-09-13  541  		goto cleanup_subdev;
d7f26849ed7cc8 Eugen Hristev    2021-09-13  542  	}
d7f26849ed7cc8 Eugen Hristev    2021-09-13  543  =

d7f26849ed7cc8 Eugen Hristev    2021-09-13  544  	/* ispck should be greate=
r or equal to hclock */
d7f26849ed7cc8 Eugen Hristev    2021-09-13  545  	ret =3D clk_set_rate(isc-=
>ispck, clk_get_rate(isc->hclock));
d7f26849ed7cc8 Eugen Hristev    2021-09-13  546  	if (ret) {
d7f26849ed7cc8 Eugen Hristev    2021-09-13  547  		dev_err(dev, "failed to =
set ispck rate: %d\n", ret);
d7f26849ed7cc8 Eugen Hristev    2021-09-13  548  		goto unprepare_clk;
d7f26849ed7cc8 Eugen Hristev    2021-09-13  549  	}
d7f26849ed7cc8 Eugen Hristev    2021-09-13  550  =

d51470069eb169 Eugen Hristev    2021-04-13  551  	regmap_read(isc->regmap, =
ISC_VERSION + isc->offsets.version, &ver);
d51470069eb169 Eugen Hristev    2021-04-13  552  	dev_info(dev, "Microchip =
ISC version %x\n", ver);
d51470069eb169 Eugen Hristev    2021-04-13  553  =

0a0e265515db76 Eugen Hristev    2019-06-12  554  	return 0;
0a0e265515db76 Eugen Hristev    2019-06-12  555  =

d7f26849ed7cc8 Eugen Hristev    2021-09-13  556  unprepare_clk:
d7f26849ed7cc8 Eugen Hristev    2021-09-13  557  	clk_disable_unprepare(isc=
->ispck);
d7f26849ed7cc8 Eugen Hristev    2021-09-13  558  =

0a0e265515db76 Eugen Hristev    2019-06-12  559  cleanup_subdev:
0a0e265515db76 Eugen Hristev    2019-06-12  560  	isc_subdev_cleanup(isc);
0a0e265515db76 Eugen Hristev    2019-06-12  561  =

f116d8f81c6424 Miaoqian Lin     2022-01-05 @562  disable_pm_runtime:
f116d8f81c6424 Miaoqian Lin     2022-01-05  563  	pm_runtime_disable(dev);
f116d8f81c6424 Miaoqian Lin     2022-01-05  564  =

0a0e265515db76 Eugen Hristev    2019-06-12  565  unregister_v4l2_device:
0a0e265515db76 Eugen Hristev    2019-06-12  566  	v4l2_device_unregister(&i=
sc->v4l2_dev);
0a0e265515db76 Eugen Hristev    2019-06-12  567  =

0a0e265515db76 Eugen Hristev    2019-06-12  568  unprepare_hclk:
0a0e265515db76 Eugen Hristev    2019-06-12  569  	clk_disable_unprepare(isc=
->hclock);
0a0e265515db76 Eugen Hristev    2019-06-12  570  =

0a0e265515db76 Eugen Hristev    2019-06-12  571  	isc_clk_cleanup(isc);
0a0e265515db76 Eugen Hristev    2019-06-12  572  =

0a0e265515db76 Eugen Hristev    2019-06-12  573  	return ret;
0a0e265515db76 Eugen Hristev    2019-06-12  574  }
0a0e265515db76 Eugen Hristev    2019-06-12  575  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3812697440339043596==--

