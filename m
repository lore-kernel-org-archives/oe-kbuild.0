Content-Type: multipart/mixed; boundary="===============2329872103743689670=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8521/9759] drivers/iommu/mtk_iommu.c:878 mtk_iommu_mm_dts_parse() error: uninitialized symbol 'larbnode'.
Date: Sat, 07 May 2022 02:14:19 +0800
Message-ID: <202205070247.0InKO8AP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2329872103743689670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Yong Wu <yong.wu@mediatek.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   38a288f5941ef03752887ad86f2d85442358c99a
commit: d2e9a1102cfc22c08450875faa667a60f0b1b1f6 [8521/9759] iommu/mediatek=
: Contain MM IOMMU flow with the MM TYPE
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m031-20220506 (https://download.01.org/0day-ci/=
archive/20220507/202205070247.0InKO8AP-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/iommu/mtk_iommu.c:878 mtk_iommu_mm_dts_parse() error: uninitialized=
 symbol 'larbnode'.

Old smatch warnings:
drivers/iommu/mtk_iommu.c:583 mtk_iommu_iova_to_phys() warn: impossible con=
dition '(pa >=3D 5368709120) =3D> (0-u32max >=3D 5368709120)'

vim +/larbnode +878 drivers/iommu/mtk_iommu.c

0df4fabe208d95 Yong Wu 2016-02-23  833  =

d2e9a1102cfc22 Yong Wu 2022-05-03  834  static int mtk_iommu_mm_dts_parse(s=
truct device *dev, struct component_match **match,
d2e9a1102cfc22 Yong Wu 2022-05-03  835  				  struct mtk_iommu_data *data)
0df4fabe208d95 Yong Wu 2016-02-23  836  {
baf94e6ebff962 Yong Wu 2021-01-11  837  	struct device_node *larbnode, *smi=
comm_node;
baf94e6ebff962 Yong Wu 2021-01-11  838  	struct platform_device *plarbdev;
baf94e6ebff962 Yong Wu 2021-01-11  839  	struct device_link *link;
d2e9a1102cfc22 Yong Wu 2022-05-03  840  	int i, larb_nr, ret;
d2e9a1102cfc22 Yong Wu 2022-05-03  841  =

d2e9a1102cfc22 Yong Wu 2022-05-03  842  	larb_nr =3D of_count_phandle_with_=
args(dev->of_node, "mediatek,larbs", NULL);
d2e9a1102cfc22 Yong Wu 2022-05-03  843  	if (larb_nr < 0)
d2e9a1102cfc22 Yong Wu 2022-05-03  844  		return larb_nr;
d2e9a1102cfc22 Yong Wu 2022-05-03  845  =

d2e9a1102cfc22 Yong Wu 2022-05-03  846  	for (i =3D 0; i < larb_nr; i++) {
d2e9a1102cfc22 Yong Wu 2022-05-03  847  		u32 id;
d2e9a1102cfc22 Yong Wu 2022-05-03  848  =

d2e9a1102cfc22 Yong Wu 2022-05-03  849  		larbnode =3D of_parse_phandle(dev=
->of_node, "mediatek,larbs", i);
d2e9a1102cfc22 Yong Wu 2022-05-03  850  		if (!larbnode)
d2e9a1102cfc22 Yong Wu 2022-05-03  851  			return -EINVAL;
d2e9a1102cfc22 Yong Wu 2022-05-03  852  =

d2e9a1102cfc22 Yong Wu 2022-05-03  853  		if (!of_device_is_available(larbn=
ode)) {
d2e9a1102cfc22 Yong Wu 2022-05-03  854  			of_node_put(larbnode);
d2e9a1102cfc22 Yong Wu 2022-05-03  855  			continue;
d2e9a1102cfc22 Yong Wu 2022-05-03  856  		}
d2e9a1102cfc22 Yong Wu 2022-05-03  857  =

d2e9a1102cfc22 Yong Wu 2022-05-03  858  		ret =3D of_property_read_u32(larb=
node, "mediatek,larb-id", &id);
d2e9a1102cfc22 Yong Wu 2022-05-03  859  		if (ret)/* The id is consecutive =
if there is no this property */
d2e9a1102cfc22 Yong Wu 2022-05-03  860  			id =3D i;
d2e9a1102cfc22 Yong Wu 2022-05-03  861  =

d2e9a1102cfc22 Yong Wu 2022-05-03  862  		plarbdev =3D of_find_device_by_no=
de(larbnode);
d2e9a1102cfc22 Yong Wu 2022-05-03  863  		if (!plarbdev) {
d2e9a1102cfc22 Yong Wu 2022-05-03  864  			of_node_put(larbnode);
d2e9a1102cfc22 Yong Wu 2022-05-03  865  			return -ENODEV;
d2e9a1102cfc22 Yong Wu 2022-05-03  866  		}
d2e9a1102cfc22 Yong Wu 2022-05-03  867  		if (!plarbdev->dev.driver) {
d2e9a1102cfc22 Yong Wu 2022-05-03  868  			of_node_put(larbnode);
d2e9a1102cfc22 Yong Wu 2022-05-03  869  			return -EPROBE_DEFER;
d2e9a1102cfc22 Yong Wu 2022-05-03  870  		}
d2e9a1102cfc22 Yong Wu 2022-05-03  871  		data->larb_imu[id].dev =3D &plarb=
dev->dev;
d2e9a1102cfc22 Yong Wu 2022-05-03  872  =

d2e9a1102cfc22 Yong Wu 2022-05-03  873  		component_match_add_release(dev, =
match, component_release_of,
d2e9a1102cfc22 Yong Wu 2022-05-03  874  					    component_compare_of, larb=
node);
d2e9a1102cfc22 Yong Wu 2022-05-03  875  	}
d2e9a1102cfc22 Yong Wu 2022-05-03  876  =

d2e9a1102cfc22 Yong Wu 2022-05-03  877  	/* Get smi-common dev from the las=
t larb. */
d2e9a1102cfc22 Yong Wu 2022-05-03 @878  	smicomm_node =3D of_parse_phandle(=
larbnode, "mediatek,smi", 0);
d2e9a1102cfc22 Yong Wu 2022-05-03  879  	if (!smicomm_node)
d2e9a1102cfc22 Yong Wu 2022-05-03  880  		return -EINVAL;
d2e9a1102cfc22 Yong Wu 2022-05-03  881  =

d2e9a1102cfc22 Yong Wu 2022-05-03  882  	plarbdev =3D of_find_device_by_nod=
e(smicomm_node);
d2e9a1102cfc22 Yong Wu 2022-05-03  883  	of_node_put(smicomm_node);
d2e9a1102cfc22 Yong Wu 2022-05-03  884  	data->smicomm_dev =3D &plarbdev->d=
ev;
d2e9a1102cfc22 Yong Wu 2022-05-03  885  =

d2e9a1102cfc22 Yong Wu 2022-05-03  886  	link =3D device_link_add(data->smi=
comm_dev, dev,
d2e9a1102cfc22 Yong Wu 2022-05-03  887  			       DL_FLAG_STATELESS | DL_FL=
AG_PM_RUNTIME);
d2e9a1102cfc22 Yong Wu 2022-05-03  888  	if (!link) {
d2e9a1102cfc22 Yong Wu 2022-05-03  889  		dev_err(dev, "Unable to link %s.\=
n", dev_name(data->smicomm_dev));
d2e9a1102cfc22 Yong Wu 2022-05-03  890  		return -EINVAL;
d2e9a1102cfc22 Yong Wu 2022-05-03  891  	}
d2e9a1102cfc22 Yong Wu 2022-05-03  892  	return 0;
d2e9a1102cfc22 Yong Wu 2022-05-03  893  }
d2e9a1102cfc22 Yong Wu 2022-05-03  894  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2329872103743689670==--

