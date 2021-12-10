Content-Type: multipart/mixed; boundary="===============3708142634896167163=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [chrome-os:chromeos-5.10 94/100] drivers/iommu/mtk_iommu.c:865 mtk_iommu_mm_dts_parse() error: uninitialized symbol 'larbnode'.
Date: Fri, 10 Dec 2021 20:06:11 +0800
Message-ID: <202112101915.YoEDCiBh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3708142634896167163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: cros-kernel-buildreports(a)googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chr=
omeos-5.10
head:   3eae3ffb66ef2c07a94f385c4160c405cc3a490b
commit: 7fc5fdfd89dcb4030def0f07c3a015509dcca1c6 [94/100] BACKPORT: FROMLIS=
T: iommu/mediatek: Contain MM IOMMU flow with the MM TYPE
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-m031-20211210 (https://download.01.org/0day-ci/arc=
hive/20211210/202112101915.YoEDCiBh-lkp(a)intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iommu/mtk_iommu.c:865 mtk_iommu_mm_dts_parse() error: uninitialized=
 symbol 'larbnode'.
drivers/iommu/mtk_iommu.c:878 mtk_iommu_mm_dts_parse() warn: passing zero t=
o 'PTR_ERR'

vim +/larbnode +865 drivers/iommu/mtk_iommu.c

0df4fabe208d95 Yong Wu 2016-02-23  823  =

7fc5fdfd89dcb4 Yong Wu 2021-09-23  824  static int mtk_iommu_mm_dts_parse(s=
truct device *dev,
7fc5fdfd89dcb4 Yong Wu 2021-09-23  825  				  struct component_match **matc=
h,
7fc5fdfd89dcb4 Yong Wu 2021-09-23  826  				  struct mtk_iommu_data *data)
7fc5fdfd89dcb4 Yong Wu 2021-09-23  827  {
7fc5fdfd89dcb4 Yong Wu 2021-09-23  828  	struct platform_device	*plarbdev;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  829  	struct device_link	*link;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  830  	struct device_node *larbnode, *smi=
comm_node;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  831  	int i, larb_nr, ret;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  832  =

7fc5fdfd89dcb4 Yong Wu 2021-09-23  833  	larb_nr =3D of_count_phandle_with_=
args(dev->of_node, "mediatek,larbs", NULL);
7fc5fdfd89dcb4 Yong Wu 2021-09-23  834  	if (larb_nr < 0)
7fc5fdfd89dcb4 Yong Wu 2021-09-23  835  		return larb_nr;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  836  =

7fc5fdfd89dcb4 Yong Wu 2021-09-23  837  	for (i =3D 0; i < larb_nr; i++) {
7fc5fdfd89dcb4 Yong Wu 2021-09-23  838  		u32 id;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  839  =

7fc5fdfd89dcb4 Yong Wu 2021-09-23  840  		larbnode =3D of_parse_phandle(dev=
->of_node, "mediatek,larbs", i);
7fc5fdfd89dcb4 Yong Wu 2021-09-23  841  		if (!larbnode)
7fc5fdfd89dcb4 Yong Wu 2021-09-23  842  			return -EINVAL;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  843  =

7fc5fdfd89dcb4 Yong Wu 2021-09-23  844  		if (!of_device_is_available(larbn=
ode)) {
7fc5fdfd89dcb4 Yong Wu 2021-09-23  845  			of_node_put(larbnode);
7fc5fdfd89dcb4 Yong Wu 2021-09-23  846  			continue;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  847  		}
7fc5fdfd89dcb4 Yong Wu 2021-09-23  848  =

7fc5fdfd89dcb4 Yong Wu 2021-09-23  849  		ret =3D of_property_read_u32(larb=
node, "mediatek,larb-id", &id);
7fc5fdfd89dcb4 Yong Wu 2021-09-23  850  		if (ret)/* The id is consecutive =
if there is no this property */
7fc5fdfd89dcb4 Yong Wu 2021-09-23  851  			id =3D i;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  852  =

7fc5fdfd89dcb4 Yong Wu 2021-09-23  853  		plarbdev =3D of_find_device_by_no=
de(larbnode);
7fc5fdfd89dcb4 Yong Wu 2021-09-23  854  		if (!plarbdev || !plarbdev->dev.d=
river) {
7fc5fdfd89dcb4 Yong Wu 2021-09-23  855  			of_node_put(larbnode);
7fc5fdfd89dcb4 Yong Wu 2021-09-23  856  			return -EPROBE_DEFER;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  857  		}
7fc5fdfd89dcb4 Yong Wu 2021-09-23  858  		data->larb_imu[id].dev =3D &plarb=
dev->dev;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  859  =

7fc5fdfd89dcb4 Yong Wu 2021-09-23  860  		component_match_add_release(dev, =
match, release_of,
7fc5fdfd89dcb4 Yong Wu 2021-09-23  861  					    compare_of, larbnode);
7fc5fdfd89dcb4 Yong Wu 2021-09-23  862  	}
7fc5fdfd89dcb4 Yong Wu 2021-09-23  863  =

7fc5fdfd89dcb4 Yong Wu 2021-09-23  864  	/* Get smi-common dev from the las=
t larb. */
7fc5fdfd89dcb4 Yong Wu 2021-09-23 @865  	smicomm_node =3D of_parse_phandle(=
larbnode, "mediatek,smi", 0);
7fc5fdfd89dcb4 Yong Wu 2021-09-23  866  	if (!smicomm_node)
7fc5fdfd89dcb4 Yong Wu 2021-09-23  867  		return -EINVAL;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  868  =

7fc5fdfd89dcb4 Yong Wu 2021-09-23  869  	plarbdev =3D of_find_device_by_nod=
e(smicomm_node);
7fc5fdfd89dcb4 Yong Wu 2021-09-23  870  	of_node_put(smicomm_node);
7fc5fdfd89dcb4 Yong Wu 2021-09-23  871  	data->smicomm_dev =3D &plarbdev->d=
ev;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  872  =

7fc5fdfd89dcb4 Yong Wu 2021-09-23  873  	link =3D device_link_add(data->smi=
comm_dev, dev,
7fc5fdfd89dcb4 Yong Wu 2021-09-23  874  			       DL_FLAG_STATELESS | DL_FL=
AG_PM_RUNTIME);
7fc5fdfd89dcb4 Yong Wu 2021-09-23  875  =

7fc5fdfd89dcb4 Yong Wu 2021-09-23  876  	if (!link) {
7fc5fdfd89dcb4 Yong Wu 2021-09-23  877  		dev_err(dev, "Unable link %s.\n",=
 dev_name(data->smicomm_dev));
7fc5fdfd89dcb4 Yong Wu 2021-09-23 @878  		return PTR_ERR(link);
7fc5fdfd89dcb4 Yong Wu 2021-09-23  879  	}
7fc5fdfd89dcb4 Yong Wu 2021-09-23  880  	return 0;
7fc5fdfd89dcb4 Yong Wu 2021-09-23  881  }
7fc5fdfd89dcb4 Yong Wu 2021-09-23  882  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3708142634896167163==--

