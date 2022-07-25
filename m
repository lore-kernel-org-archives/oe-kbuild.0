Content-Type: multipart/mixed; boundary="===============5265365195745865412=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [kbusch:dma-register 3/4] drivers/nvme/host/pci.c:1802:41: sparse: sparse: shift too big (4096) for type int
Date: Mon, 25 Jul 2022 16:58:23 +0000
Message-ID: <202207242331.8kkEmYBi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5265365195745865412==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/n=
vme/host/pci.c:1802:41: sparse: sparse: shift too big (4096) for type int"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Keith Busch <kbusch@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git dm=
a-register
head:   9de6909fed20955193275bbf9c75ccc85553b7d8
commit: 50a6f6bb876e20cc10372a5b8315924a493f6bf7 [3/4] big-endian and page_=
size fixes
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: alpha-randconfig-s052-20220718 (https://download.01.org/0day-ci/arc=
hive/20220724/202207242331.8kkEmYBi-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/kbusch/linux.git/=
commit/?id=3D50a6f6bb876e20cc10372a5b8315924a493f6bf7
        git remote add kbusch https://git.kernel.org/pub/scm/linux/kernel/g=
it/kbusch/linux.git
        git fetch --no-tags kbusch dma-register
        git checkout 50a6f6bb876e20cc10372a5b8315924a493f6bf7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
lpha SHELL=3D/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/nvme/host/pci.c:1837:17: sparse: sparse: incorrect type in argum=
ent 2 (different base types) @@     expected unsigned long long [usertype] =
addr @@     got restricted __le64 [usertype] @@
   drivers/nvme/host/pci.c:1837:17: sparse:     expected unsigned long long=
 [usertype] addr
   drivers/nvme/host/pci.c:1837:17: sparse:     got restricted __le64 [user=
type]
   drivers/nvme/host/pci.c: note: in included file:
   include/linux/blk-mq.h:1064:39: sparse: sparse: Using plain integer as N=
ULL pointer
   include/linux/blk-mq.h:1064:39: sparse: sparse: Using plain integer as N=
ULL pointer
   include/linux/blk-mq.h:1064:39: sparse: sparse: Using plain integer as N=
ULL pointer
>> drivers/nvme/host/pci.c:1802:41: sparse: sparse: shift too big (4096) fo=
r type int
   drivers/nvme/host/pci.c:1826:49: sparse: sparse: shift too big (4096) fo=
r type int
   drivers/nvme/host/pci.c:1849:45: sparse: sparse: shift too big (4096) fo=
r type int

vim +1802 drivers/nvme/host/pci.c

b60503ba432b16f drivers/block/nvme.c    Matthew Wilcox 2011-01-20  1782  =

8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1783  #i=
fdef CONFIG_HAS_DMA
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1784  /*
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1785   *=
 Important: bvec must be describing a virtually contiguous buffer.
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1786   */
d129ef7beb2bf9b drivers/nvme/host/pci.c Keith Busch    2022-07-18  1787  st=
atic void *nvme_pci_dma_map(struct request_queue *q,
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1788  		=
	       struct bio_vec *bvec, int nr_vecs)
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1789  {
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1790  	s=
truct nvme_ns *ns =3D q->queuedata;
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1791  	s=
truct nvme_dev *dev =3D to_nvme_dev(ns->ctrl);
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1792  	s=
truct nvme_dma_mapping *mapping;
50a6f6bb876e20c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1793  	i=
nt i, j, k, size, ret =3D -ENOMEM;
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1794  =

8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1795  	i=
f (!nr_vecs)
d129ef7beb2bf9b drivers/nvme/host/pci.c Keith Busch    2022-07-18  1796  		=
return ERR_PTR(-EINVAL);
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1797  =

8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1798  	m=
apping =3D kzalloc(sizeof(*mapping), GFP_KERNEL);
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1799  	i=
f (!mapping)
d129ef7beb2bf9b drivers/nvme/host/pci.c Keith Busch    2022-07-18  1800  		=
return ERR_PTR(-ENOMEM);
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1801  =

50a6f6bb876e20c drivers/nvme/host/pci.c Keith Busch    2022-07-18 @1802  	n=
r_vecs =3D nr_vecs << (PAGE_SIZE - NVME_CTRL_PAGE_SIZE);
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1803  	s=
ize =3D nr_vecs * sizeof(*mapping->prps);
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1804  	m=
apping->prps =3D dma_alloc_coherent(dev->dev, size,
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1805  		=
		&mapping->prp_dma_addr, GFP_KERNEL);
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1806  	i=
f (!mapping->prps)
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1807  		=
goto free_mapping;
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1808  =

50a6f6bb876e20c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1809  	f=
or (i =3D 0, j =3D 0; i < nr_vecs; i++) {
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1810  		=
struct bio_vec *bv =3D bvec + i;
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1811  		=
dma_addr_t dma_addr;
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1812  =

8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1813  		=
if (i =3D=3D 0)
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1814  		=
	mapping->offset =3D bv->bv_offset;
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1815  		=
else if (bv->bv_offset) {
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1816  		=
	ret =3D -EINVAL;
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1817  		=
	goto err;
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1818  		}
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1819  =

50a6f6bb876e20c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1820  		=
dma_addr  =3D dma_map_bvec(dev->dev, bv, 0, 0);
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1821  		=
if (dma_mapping_error(dev->dev, dma_addr)) {
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1822  		=
	ret =3D -EIO;
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1823  		=
	goto err;
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1824  		}
50a6f6bb876e20c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1825  =

50a6f6bb876e20c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1826  		=
for (j =3D 0; j < 1 << (PAGE_SIZE - NVME_CTRL_PAGE_SIZE); j++)
50a6f6bb876e20c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1827  		=
	mapping->prps[k++] =3D cpu_to_le64(dma_addr);
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1828  	}
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1829  =

8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1830  	g=
et_device(dev->dev);
d129ef7beb2bf9b drivers/nvme/host/pci.c Keith Busch    2022-07-18  1831  	r=
eturn mapping;
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1832  =

8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1833  er=
r:
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1834  	w=
hile (--i >=3D 0) {
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1835  		=
struct bio_vec *bv =3D bvec + i;
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1836  =

8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1837  		=
dma_unmap_page(dev->dev, mapping->prps[i], bv->bv_len, 0);
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1838  	}
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1839  =

8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1840  	d=
ma_free_coherent(dev->dev, size, (void *)mapping->prps,
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1841  		=
	  mapping->prp_dma_addr);
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1842  fr=
ee_mapping:
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1843  	k=
free(mapping);
d129ef7beb2bf9b drivers/nvme/host/pci.c Keith Busch    2022-07-18  1844  	r=
eturn ERR_PTR(ret);
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1845  }
8c38d1fa715ef4c drivers/nvme/host/pci.c Keith Busch    2022-07-18  1846  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5265365195745865412==--

