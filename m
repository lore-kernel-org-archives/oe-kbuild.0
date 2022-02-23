Content-Type: multipart/mixed; boundary="===============2904419163238211954=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [hverkuil-media-tree:for-v5.18r 134/217] drivers/iommu/mtk_iommu.c:855:3-9: ERROR: missing put_device; call of_find_device_by_node on line 848, but without a corresponding object release within this function.
Date: Thu, 24 Feb 2022 04:07:27 +0800
Message-ID: <202202240412.6A5PNE5p-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2904419163238211954==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Yong Wu <yong.wu@mediatek.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git for-v5.18r
head:   ce9df78ab89f9fc79875af9fac11b4ca329c7e35
commit: 7d09aaf831b35ab62c5c24efbe716b8f60ad46ad [134/217] media: iommu/med=
iatek: Add probe_defer for smi-larb
:::::: branch date: 8 hours ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-c023-20220223 (https://download.01.org/0day-ci/archi=
ve/20220224/202202240412.6A5PNE5p-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/iommu/mtk_iommu.c:855:3-9: ERROR: missing put_device; call of_fi=
nd_device_by_node on line 848, but without a corresponding object release w=
ithin this function.
--
>> drivers/iommu/mtk_iommu_v1.c:611:3-9: ERROR: missing put_device; call of=
_find_device_by_node on line 604, but without a corresponding object releas=
e within this function.

vim +855 drivers/iommu/mtk_iommu.c

0df4fabe208d95 Yong Wu       2016-02-23  759  =

0df4fabe208d95 Yong Wu       2016-02-23  760  static int mtk_iommu_probe(st=
ruct platform_device *pdev)
0df4fabe208d95 Yong Wu       2016-02-23  761  {
0df4fabe208d95 Yong Wu       2016-02-23  762  	struct mtk_iommu_data   *dat=
a;
0df4fabe208d95 Yong Wu       2016-02-23  763  	struct device           *dev=
 =3D &pdev->dev;
baf94e6ebff962 Yong Wu       2021-01-11  764  	struct device_node	*larbnode=
, *smicomm_node;
baf94e6ebff962 Yong Wu       2021-01-11  765  	struct platform_device	*plar=
bdev;
baf94e6ebff962 Yong Wu       2021-01-11  766  	struct device_link	*link;
0df4fabe208d95 Yong Wu       2016-02-23  767  	struct resource         *res;
b16c0170b53cfb Joerg Roedel  2017-02-03  768  	resource_size_t		ioaddr;
0df4fabe208d95 Yong Wu       2016-02-23  769  	struct component_match  *mat=
ch =3D NULL;
c2c59456e1fcad Miles Chen    2020-09-04  770  	struct regmap		*infracfg;
0df4fabe208d95 Yong Wu       2016-02-23  771  	void                    *pro=
tect;
0b6c0ad3cfe6bc Andrzej Hajda 2016-03-01  772  	int                     i, l=
arb_nr, ret;
c2c59456e1fcad Miles Chen    2020-09-04  773  	u32			val;
c2c59456e1fcad Miles Chen    2020-09-04  774  	char                    *p;
0df4fabe208d95 Yong Wu       2016-02-23  775  =

0df4fabe208d95 Yong Wu       2016-02-23  776  	data =3D devm_kzalloc(dev, s=
izeof(*data), GFP_KERNEL);
0df4fabe208d95 Yong Wu       2016-02-23  777  	if (!data)
0df4fabe208d95 Yong Wu       2016-02-23  778  		return -ENOMEM;
0df4fabe208d95 Yong Wu       2016-02-23  779  	data->dev =3D dev;
cecdce9d7eed33 Yong Wu       2019-08-24  780  	data->plat_data =3D of_devic=
e_get_match_data(dev);
0df4fabe208d95 Yong Wu       2016-02-23  781  =

0df4fabe208d95 Yong Wu       2016-02-23  782  	/* Protect memory. HW will a=
ccess here while translation fault.*/
0df4fabe208d95 Yong Wu       2016-02-23  783  	protect =3D devm_kzalloc(dev=
, MTK_PROTECT_PA_ALIGN * 2, GFP_KERNEL);
0df4fabe208d95 Yong Wu       2016-02-23  784  	if (!protect)
0df4fabe208d95 Yong Wu       2016-02-23  785  		return -ENOMEM;
0df4fabe208d95 Yong Wu       2016-02-23  786  	data->protect_base =3D ALIGN=
(virt_to_phys(protect), MTK_PROTECT_PA_ALIGN);
0df4fabe208d95 Yong Wu       2016-02-23  787  =

c2c59456e1fcad Miles Chen    2020-09-04  788  	if (MTK_IOMMU_HAS_FLAG(data-=
>plat_data, HAS_4GB_MODE)) {
c2c59456e1fcad Miles Chen    2020-09-04  789  		switch (data->plat_data->m4=
u_plat) {
c2c59456e1fcad Miles Chen    2020-09-04  790  		case M4U_MT2712:
c2c59456e1fcad Miles Chen    2020-09-04  791  			p =3D "mediatek,mt2712-inf=
racfg";
c2c59456e1fcad Miles Chen    2020-09-04  792  			break;
c2c59456e1fcad Miles Chen    2020-09-04  793  		case M4U_MT8173:
c2c59456e1fcad Miles Chen    2020-09-04  794  			p =3D "mediatek,mt8173-inf=
racfg";
c2c59456e1fcad Miles Chen    2020-09-04  795  			break;
c2c59456e1fcad Miles Chen    2020-09-04  796  		default:
c2c59456e1fcad Miles Chen    2020-09-04  797  			p =3D NULL;
c2c59456e1fcad Miles Chen    2020-09-04  798  		}
c2c59456e1fcad Miles Chen    2020-09-04  799  =

c2c59456e1fcad Miles Chen    2020-09-04  800  		infracfg =3D syscon_regmap_=
lookup_by_compatible(p);
c2c59456e1fcad Miles Chen    2020-09-04  801  =

c2c59456e1fcad Miles Chen    2020-09-04  802  		if (IS_ERR(infracfg))
c2c59456e1fcad Miles Chen    2020-09-04  803  			return PTR_ERR(infracfg);
c2c59456e1fcad Miles Chen    2020-09-04  804  =

c2c59456e1fcad Miles Chen    2020-09-04  805  		ret =3D regmap_read(infracf=
g, REG_INFRA_MISC, &val);
c2c59456e1fcad Miles Chen    2020-09-04  806  		if (ret)
c2c59456e1fcad Miles Chen    2020-09-04  807  			return ret;
c2c59456e1fcad Miles Chen    2020-09-04  808  		data->enable_4GB =3D !!(val=
 & F_DDR_4GB_SUPPORT_EN);
c2c59456e1fcad Miles Chen    2020-09-04  809  	}
01e23c93868884 Yong Wu       2016-03-14  810  =

0df4fabe208d95 Yong Wu       2016-02-23  811  	res =3D platform_get_resourc=
e(pdev, IORESOURCE_MEM, 0);
0df4fabe208d95 Yong Wu       2016-02-23  812  	data->base =3D devm_ioremap_=
resource(dev, res);
0df4fabe208d95 Yong Wu       2016-02-23  813  	if (IS_ERR(data->base))
0df4fabe208d95 Yong Wu       2016-02-23  814  		return PTR_ERR(data->base);
b16c0170b53cfb Joerg Roedel  2017-02-03  815  	ioaddr =3D res->start;
0df4fabe208d95 Yong Wu       2016-02-23  816  =

0df4fabe208d95 Yong Wu       2016-02-23  817  	data->irq =3D platform_get_i=
rq(pdev, 0);
0df4fabe208d95 Yong Wu       2016-02-23  818  	if (data->irq < 0)
0df4fabe208d95 Yong Wu       2016-02-23  819  		return data->irq;
0df4fabe208d95 Yong Wu       2016-02-23  820  =

6b717796227ec8 Chao Hao      2020-07-03  821  	if (MTK_IOMMU_HAS_FLAG(data-=
>plat_data, HAS_BCLK)) {
0df4fabe208d95 Yong Wu       2016-02-23  822  		data->bclk =3D devm_clk_get=
(dev, "bclk");
0df4fabe208d95 Yong Wu       2016-02-23  823  		if (IS_ERR(data->bclk))
0df4fabe208d95 Yong Wu       2016-02-23  824  			return PTR_ERR(data->bclk);
2aa4c2597cd671 Yong Wu       2019-08-24  825  	}
0df4fabe208d95 Yong Wu       2016-02-23  826  =

0df4fabe208d95 Yong Wu       2016-02-23  827  	larb_nr =3D of_count_phandle=
_with_args(dev->of_node,
0df4fabe208d95 Yong Wu       2016-02-23  828  					     "mediatek,larbs", N=
ULL);
0df4fabe208d95 Yong Wu       2016-02-23  829  	if (larb_nr < 0)
0df4fabe208d95 Yong Wu       2016-02-23  830  		return larb_nr;
0df4fabe208d95 Yong Wu       2016-02-23  831  =

0df4fabe208d95 Yong Wu       2016-02-23  832  	for (i =3D 0; i < larb_nr; i=
++) {
e6dec92308628c Yong Wu       2017-08-21  833  		u32 id;
0df4fabe208d95 Yong Wu       2016-02-23  834  =

0df4fabe208d95 Yong Wu       2016-02-23  835  		larbnode =3D of_parse_phand=
le(dev->of_node, "mediatek,larbs", i);
0df4fabe208d95 Yong Wu       2016-02-23  836  		if (!larbnode)
0df4fabe208d95 Yong Wu       2016-02-23  837  			return -EINVAL;
0df4fabe208d95 Yong Wu       2016-02-23  838  =

1eb8e4e2b35b4d Wen Yang      2019-04-17  839  		if (!of_device_is_available=
(larbnode)) {
1eb8e4e2b35b4d Wen Yang      2019-04-17  840  			of_node_put(larbnode);
0df4fabe208d95 Yong Wu       2016-02-23  841  			continue;
1eb8e4e2b35b4d Wen Yang      2019-04-17  842  		}
0df4fabe208d95 Yong Wu       2016-02-23  843  =

e6dec92308628c Yong Wu       2017-08-21  844  		ret =3D of_property_read_u3=
2(larbnode, "mediatek,larb-id", &id);
e6dec92308628c Yong Wu       2017-08-21  845  		if (ret)/* The id is consec=
utive if there is no this property */
e6dec92308628c Yong Wu       2017-08-21  846  			id =3D i;
e6dec92308628c Yong Wu       2017-08-21  847  =

0df4fabe208d95 Yong Wu       2016-02-23 @848  		plarbdev =3D of_find_device=
_by_node(larbnode);
1eb8e4e2b35b4d Wen Yang      2019-04-17  849  		if (!plarbdev) {
1eb8e4e2b35b4d Wen Yang      2019-04-17  850  			of_node_put(larbnode);
2fb0feed51085d Yong Wu       2022-01-17  851  			return -ENODEV;
1eb8e4e2b35b4d Wen Yang      2019-04-17  852  		}
7d09aaf831b35a Yong Wu       2022-01-17  853  		if (!plarbdev->dev.driver) {
7d09aaf831b35a Yong Wu       2022-01-17  854  			of_node_put(larbnode);
7d09aaf831b35a Yong Wu       2022-01-17 @855  			return -EPROBE_DEFER;
7d09aaf831b35a Yong Wu       2022-01-17  856  		}
1ee9feb2c9f893 Yong Wu       2019-08-24  857  		data->larb_imu[id].dev =3D =
&plarbdev->dev;
0df4fabe208d95 Yong Wu       2016-02-23  858  =

00c7c81f7b49d9 Russell King  2016-10-19  859  		component_match_add_release=
(dev, &match, release_of,
00c7c81f7b49d9 Russell King  2016-10-19  860  					    compare_of, larbnode=
);
0df4fabe208d95 Yong Wu       2016-02-23  861  	}
0df4fabe208d95 Yong Wu       2016-02-23  862  =

baf94e6ebff962 Yong Wu       2021-01-11  863  	/* Get smi-common dev from t=
he last larb. */
baf94e6ebff962 Yong Wu       2021-01-11  864  	smicomm_node =3D of_parse_ph=
andle(larbnode, "mediatek,smi", 0);
baf94e6ebff962 Yong Wu       2021-01-11  865  	if (!smicomm_node)
baf94e6ebff962 Yong Wu       2021-01-11  866  		return -EINVAL;
baf94e6ebff962 Yong Wu       2021-01-11  867  =

baf94e6ebff962 Yong Wu       2021-01-11  868  	plarbdev =3D of_find_device_=
by_node(smicomm_node);
baf94e6ebff962 Yong Wu       2021-01-11  869  	of_node_put(smicomm_node);
baf94e6ebff962 Yong Wu       2021-01-11  870  	data->smicomm_dev =3D &plarb=
dev->dev;
baf94e6ebff962 Yong Wu       2021-01-11  871  =

c0b57581b73be7 Yong Wu       2021-01-11  872  	pm_runtime_enable(dev);
c0b57581b73be7 Yong Wu       2021-01-11  873  =

baf94e6ebff962 Yong Wu       2021-01-11  874  	link =3D device_link_add(dat=
a->smicomm_dev, dev,
baf94e6ebff962 Yong Wu       2021-01-11  875  			DL_FLAG_STATELESS | DL_FLA=
G_PM_RUNTIME);
baf94e6ebff962 Yong Wu       2021-01-11  876  	if (!link) {
a92a90ac62d328 Dan Carpenter 2021-02-05  877  		dev_err(dev, "Unable to lin=
k %s.\n", dev_name(data->smicomm_dev));
a92a90ac62d328 Dan Carpenter 2021-02-05  878  		ret =3D -EINVAL;
c0b57581b73be7 Yong Wu       2021-01-11  879  		goto out_runtime_disable;
baf94e6ebff962 Yong Wu       2021-01-11  880  	}
baf94e6ebff962 Yong Wu       2021-01-11  881  =

0df4fabe208d95 Yong Wu       2016-02-23  882  	platform_set_drvdata(pdev, d=
ata);
0df4fabe208d95 Yong Wu       2016-02-23  883  =

b16c0170b53cfb Joerg Roedel  2017-02-03  884  	ret =3D iommu_device_sysfs_a=
dd(&data->iommu, dev, NULL,
b16c0170b53cfb Joerg Roedel  2017-02-03  885  				     "mtk-iommu.%pa", &io=
addr);
b16c0170b53cfb Joerg Roedel  2017-02-03  886  	if (ret)
baf94e6ebff962 Yong Wu       2021-01-11  887  		goto out_link_remove;
b16c0170b53cfb Joerg Roedel  2017-02-03  888  =

2d471b20c55e13 Robin Murphy  2021-04-01  889  	ret =3D iommu_device_registe=
r(&data->iommu, &mtk_iommu_ops, dev);
b16c0170b53cfb Joerg Roedel  2017-02-03  890  	if (ret)
986d9ec5f176ff Yong Wu       2021-01-11  891  		goto out_sysfs_remove;
b16c0170b53cfb Joerg Roedel  2017-02-03  892  =

da3cc91b8db403 Yong Wu       2019-11-04  893  	spin_lock_init(&data->tlb_lo=
ck);
7c3a2ec02806a6 Yong Wu       2017-08-21  894  	list_add_tail(&data->list, &=
m4ulist);
7c3a2ec02806a6 Yong Wu       2017-08-21  895  =

986d9ec5f176ff Yong Wu       2021-01-11  896  	if (!iommu_present(&platform=
_bus_type)) {
986d9ec5f176ff Yong Wu       2021-01-11  897  		ret =3D bus_set_iommu(&plat=
form_bus_type, &mtk_iommu_ops);
986d9ec5f176ff Yong Wu       2021-01-11  898  		if (ret)
986d9ec5f176ff Yong Wu       2021-01-11  899  			goto out_list_del;
986d9ec5f176ff Yong Wu       2021-01-11  900  	}
986d9ec5f176ff Yong Wu       2021-01-11  901  =

986d9ec5f176ff Yong Wu       2021-01-11  902  	ret =3D component_master_add=
_with_match(dev, &mtk_iommu_com_ops, match);
986d9ec5f176ff Yong Wu       2021-01-11  903  	if (ret)
986d9ec5f176ff Yong Wu       2021-01-11  904  		goto out_bus_set_null;
986d9ec5f176ff Yong Wu       2021-01-11  905  	return ret;
0df4fabe208d95 Yong Wu       2016-02-23  906  =

986d9ec5f176ff Yong Wu       2021-01-11  907  out_bus_set_null:
986d9ec5f176ff Yong Wu       2021-01-11  908  	bus_set_iommu(&platform_bus_=
type, NULL);
986d9ec5f176ff Yong Wu       2021-01-11  909  out_list_del:
986d9ec5f176ff Yong Wu       2021-01-11  910  	list_del(&data->list);
986d9ec5f176ff Yong Wu       2021-01-11  911  	iommu_device_unregister(&dat=
a->iommu);
986d9ec5f176ff Yong Wu       2021-01-11  912  out_sysfs_remove:
986d9ec5f176ff Yong Wu       2021-01-11  913  	iommu_device_sysfs_remove(&d=
ata->iommu);
baf94e6ebff962 Yong Wu       2021-01-11  914  out_link_remove:
baf94e6ebff962 Yong Wu       2021-01-11  915  	device_link_remove(data->smi=
comm_dev, dev);
c0b57581b73be7 Yong Wu       2021-01-11  916  out_runtime_disable:
c0b57581b73be7 Yong Wu       2021-01-11  917  	pm_runtime_disable(dev);
986d9ec5f176ff Yong Wu       2021-01-11  918  	return ret;
0df4fabe208d95 Yong Wu       2016-02-23  919  }
0df4fabe208d95 Yong Wu       2016-02-23  920  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2904419163238211954==--

