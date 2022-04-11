Content-Type: multipart/mixed; boundary="===============7728376126364327671=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/dma/direct.c:109 dma_direct_alloc_swiotlb() warn: should '((page - mem_map) + arch_pfn_offset) << 14' be a 64 bit type?
Date: Tue, 12 Apr 2022 05:55:59 +0800
Message-ID: <202204120527.Z0crbJNU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7728376126364327671==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Robin Murphy <robin.murphy@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ce522ba9ef7e2d9fb22a39eb3371c0c64e2a433e
commit: aea7e2a86a94b2583e1e812c596140034398a169 dma-direct: factor the swi=
otlb code out of __dma_direct_alloc_pages
date:   4 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 months ago
config: arc-randconfig-m031-20220411 (https://download.01.org/0day-ci/archi=
ve/20220412/202204120527.Z0crbJNU-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/dma/direct.c:109 dma_direct_alloc_swiotlb() warn: should '((page - m=
em_map) + arch_pfn_offset) << 14' be a 64 bit type?

vim +109 kernel/dma/direct.c

f4111e39a52aa5 Claire Chang      2021-06-19  104  =

aea7e2a86a94b2 Christoph Hellwig 2021-10-21  105  static struct page *dma_d=
irect_alloc_swiotlb(struct device *dev, size_t size)
aea7e2a86a94b2 Christoph Hellwig 2021-10-21  106  {
aea7e2a86a94b2 Christoph Hellwig 2021-10-21  107  	struct page *page =3D sw=
iotlb_alloc(dev, size);
aea7e2a86a94b2 Christoph Hellwig 2021-10-21  108  =

aea7e2a86a94b2 Christoph Hellwig 2021-10-21 @109  	if (page && !dma_coheren=
t_ok(dev, page_to_phys(page), size)) {
aea7e2a86a94b2 Christoph Hellwig 2021-10-21  110  		swiotlb_free(dev, page,=
 size);
aea7e2a86a94b2 Christoph Hellwig 2021-10-21  111  		return NULL;
aea7e2a86a94b2 Christoph Hellwig 2021-10-21  112  	}
aea7e2a86a94b2 Christoph Hellwig 2021-10-21  113  =

aea7e2a86a94b2 Christoph Hellwig 2021-10-21  114  	return page;
aea7e2a86a94b2 Christoph Hellwig 2021-10-21  115  }
aea7e2a86a94b2 Christoph Hellwig 2021-10-21  116  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7728376126364327671==--

