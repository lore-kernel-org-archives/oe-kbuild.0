Content-Type: multipart/mixed; boundary="===============0652516494380642378=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/dma/direct.c:185 dma_direct_alloc_no_mapping() warn: should '((page - mem_map) + arch_pfn_offset) << 14' be a 64 bit type?
Date: Tue, 12 Apr 2022 03:04:52 +0800
Message-ID: <202204120206.uO1WwdKm-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0652516494380642378==
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
commit: d541ae55d538265861ef729a64d2d816d34ef1e2 dma-direct: factor out a h=
elper for DMA_ATTR_NO_KERNEL_MAPPING allocations
date:   4 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 4 months ago
config: arc-randconfig-m031-20220411 (https://download.01.org/0day-ci/archi=
ve/20220412/202204120206.uO1WwdKm-lkp(a)intel.com/config)
compiler: arc-elf-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/dma/direct.c:185 dma_direct_alloc_no_mapping() warn: should '((page =
- mem_map) + arch_pfn_offset) << 14' be a 64 bit type?

vim +185 kernel/dma/direct.c

5b138c534fda57 kernel/dma/direct.c Christoph Hellwig 2020-10-07  170  =

d541ae55d53826 kernel/dma/direct.c Christoph Hellwig 2021-10-18  171  stati=
c void *dma_direct_alloc_no_mapping(struct device *dev, size_t size,
d541ae55d53826 kernel/dma/direct.c Christoph Hellwig 2021-10-18  172  		dma=
_addr_t *dma_handle, gfp_t gfp)
b18814e767a445 kernel/dma/direct.c Christoph Hellwig 2018-11-04  173  {
b18814e767a445 kernel/dma/direct.c Christoph Hellwig 2018-11-04  174  	stru=
ct page *page;
633d5fce78a61e kernel/dma/direct.c David Rientjes    2020-06-11  175  =

3773dfe6ea4d22 kernel/dma/direct.c Christoph Hellwig 2020-08-17  176  	page=
 =3D __dma_direct_alloc_pages(dev, size, gfp & ~__GFP_ZERO);
080321d3b3139b lib/dma-direct.c    Christoph Hellwig 2017-12-22  177  	if (=
!page)
080321d3b3139b lib/dma-direct.c    Christoph Hellwig 2017-12-22  178  		ret=
urn NULL;
d541ae55d53826 kernel/dma/direct.c Christoph Hellwig 2021-10-18  179  =

d98849aff87911 kernel/dma/direct.c Christoph Hellwig 2019-06-14  180  	/* r=
emove any dirty cache lines on the kernel alias */
d98849aff87911 kernel/dma/direct.c Christoph Hellwig 2019-06-14  181  	if (=
!PageHighMem(page))
d98849aff87911 kernel/dma/direct.c Christoph Hellwig 2019-06-14  182  		arc=
h_dma_prep_coherent(page, size);
d541ae55d53826 kernel/dma/direct.c Christoph Hellwig 2021-10-18  183  =

d98849aff87911 kernel/dma/direct.c Christoph Hellwig 2019-06-14  184  	/* r=
eturn the page pointer as the opaque cookie */
d541ae55d53826 kernel/dma/direct.c Christoph Hellwig 2021-10-18 @185  	*dma=
_handle =3D phys_to_dma_direct(dev, page_to_phys(page));
849facea92fa68 kernel/dma/direct.c Christoph Hellwig 2020-10-07  186  	retu=
rn page;
3acac065508f6c kernel/dma/direct.c Christoph Hellwig 2019-10-29  187  }
3acac065508f6c kernel/dma/direct.c Christoph Hellwig 2019-10-29  188  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0652516494380642378==--

