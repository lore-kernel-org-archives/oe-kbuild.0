Content-Type: multipart/mixed; boundary="===============2358100058630048844=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/dma-iommu.c:1340 iommu_dma_unmap_sg() error: uninitialized symbol 'start'.
Date: Thu, 11 Aug 2022 10:18:42 +0800
Message-ID: <202208111009.WIvpanDD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2358100058630048844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Logan Gunthorpe <logang@deltatee.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   aeb6e6ac18c73ec287b3b1e2c913520699358c13
commit: 30280eee2db10ed6f9f2e1b4ec9197465a96b996 iommu/dma: support PCI P2P=
DMA pages in dma-iommu map_sg
date:   2 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20811/202208111009.WIvpanDD-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/iommu/dma-iommu.c:1340 iommu_dma_unmap_sg() error: uninitialized sy=
mbol 'start'.

vim +/start +1340 drivers/iommu/dma-iommu.c

0db2e5d18f76a6 Robin Murphy      2015-10-01  1292  =

06d60728ff5c01 Christoph Hellwig 2019-05-20  1293  static void iommu_dma_un=
map_sg(struct device *dev, struct scatterlist *sg,
06d60728ff5c01 Christoph Hellwig 2019-05-20  1294  		int nents, enum dma_da=
ta_direction dir, unsigned long attrs)
0db2e5d18f76a6 Robin Murphy      2015-10-01  1295  {
30280eee2db10e Logan Gunthorpe   2022-07-08  1296  	dma_addr_t end =3D 0, s=
tart;
842fe519f68b4d Robin Murphy      2017-03-31  1297  	struct scatterlist *tmp;
842fe519f68b4d Robin Murphy      2017-03-31  1298  	int i;
06d60728ff5c01 Christoph Hellwig 2019-05-20  1299  =

2e727bffbe9375 David Stevens     2021-09-29  1300  	if (dev_use_swiotlb(dev=
)) {
82612d66d51d3b Tom Murphy        2020-11-24  1301  		iommu_dma_unmap_sg_swi=
otlb(dev, sg, nents, dir, attrs);
82612d66d51d3b Tom Murphy        2020-11-24  1302  		return;
82612d66d51d3b Tom Murphy        2020-11-24  1303  	}
82612d66d51d3b Tom Murphy        2020-11-24  1304  =

ee9d4097cc145d David Stevens     2021-09-29  1305  	if (!(attrs & DMA_ATTR_=
SKIP_CPU_SYNC))
ee9d4097cc145d David Stevens     2021-09-29  1306  		iommu_dma_sync_sg_for_=
cpu(dev, sg, nents, dir);
ee9d4097cc145d David Stevens     2021-09-29  1307  =

0db2e5d18f76a6 Robin Murphy      2015-10-01  1308  	/*
0db2e5d18f76a6 Robin Murphy      2015-10-01  1309  	 * The scatterlist segm=
ents are mapped into a single
30280eee2db10e Logan Gunthorpe   2022-07-08  1310  	 * contiguous IOVA allo=
cation, the start and end points
30280eee2db10e Logan Gunthorpe   2022-07-08  1311  	 * just have to be dete=
rmined.
0db2e5d18f76a6 Robin Murphy      2015-10-01  1312  	 */
30280eee2db10e Logan Gunthorpe   2022-07-08  1313  	for_each_sg(sg, tmp, ne=
nts, i) {
30280eee2db10e Logan Gunthorpe   2022-07-08  1314  		if (sg_is_dma_bus_addr=
ess(tmp)) {
30280eee2db10e Logan Gunthorpe   2022-07-08  1315  			sg_dma_unmark_bus_add=
ress(tmp);
30280eee2db10e Logan Gunthorpe   2022-07-08  1316  			continue;
30280eee2db10e Logan Gunthorpe   2022-07-08  1317  		}
30280eee2db10e Logan Gunthorpe   2022-07-08  1318  =

30280eee2db10e Logan Gunthorpe   2022-07-08  1319  		if (sg_dma_len(tmp) =
=3D=3D 0)
30280eee2db10e Logan Gunthorpe   2022-07-08  1320  			break;
30280eee2db10e Logan Gunthorpe   2022-07-08  1321  =

30280eee2db10e Logan Gunthorpe   2022-07-08  1322  		start =3D sg_dma_addre=
ss(tmp);
30280eee2db10e Logan Gunthorpe   2022-07-08  1323  		break;
30280eee2db10e Logan Gunthorpe   2022-07-08  1324  	}
30280eee2db10e Logan Gunthorpe   2022-07-08  1325  =

30280eee2db10e Logan Gunthorpe   2022-07-08  1326  	nents -=3D i;
30280eee2db10e Logan Gunthorpe   2022-07-08  1327  	for_each_sg(tmp, tmp, n=
ents, i) {
30280eee2db10e Logan Gunthorpe   2022-07-08  1328  		if (sg_is_dma_bus_addr=
ess(tmp)) {
30280eee2db10e Logan Gunthorpe   2022-07-08  1329  			sg_dma_unmark_bus_add=
ress(tmp);
30280eee2db10e Logan Gunthorpe   2022-07-08  1330  			continue;
30280eee2db10e Logan Gunthorpe   2022-07-08  1331  		}
30280eee2db10e Logan Gunthorpe   2022-07-08  1332  =

842fe519f68b4d Robin Murphy      2017-03-31  1333  		if (sg_dma_len(tmp) =
=3D=3D 0)
842fe519f68b4d Robin Murphy      2017-03-31  1334  			break;
30280eee2db10e Logan Gunthorpe   2022-07-08  1335  =

30280eee2db10e Logan Gunthorpe   2022-07-08  1336  		end =3D sg_dma_address=
(tmp) + sg_dma_len(tmp);
842fe519f68b4d Robin Murphy      2017-03-31  1337  	}
30280eee2db10e Logan Gunthorpe   2022-07-08  1338  =

30280eee2db10e Logan Gunthorpe   2022-07-08  1339  	if (end)
b61d271e59d7fd Robin Murphy      2019-05-20 @1340  		__iommu_dma_unmap(dev,=
 start, end - start);
0db2e5d18f76a6 Robin Murphy      2015-10-01  1341  }
0db2e5d18f76a6 Robin Murphy      2015-10-01  1342  =


:::::: The code at line 1340 was first introduced by commit
:::::: b61d271e59d7fd679ad9922ce5f16c116c0f8e94 iommu/dma: Move domain look=
up into __iommu_dma_{map,unmap}

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2358100058630048844==--

