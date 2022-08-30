Content-Type: multipart/mixed; boundary="===============7410322837165590840=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Revert "swiotlb: panic if nslabs is too small"
Date: Wed, 31 Aug 2022 07:20:54 +0800
Message-ID: <202208310701.LKr1WDCh-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7410322837165590840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220829232934.3277747-1-yuzhao@google.com>
References: <20220829232934.3277747-1-yuzhao@google.com>
TO: Yu Zhao <yuzhao@google.com>
TO: Christoph Hellwig <hch@infradead.org>
TO: Marek Szyprowski <m.szyprowski@samsung.com>
TO: Robin Murphy <robin.murphy@arm.com>
TO: Dongli Zhang <dongli.zhang@oracle.com>
CC: iommu(a)lists.linux.dev
CC: linux-kernel(a)vger.kernel.org
CC: Yu Zhao <yuzhao@google.com>

Hi Yu,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on c40e8341e3b3bb27e3a65b06b5b454626234c4f0]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Zhao/Revert-swiot=
lb-panic-if-nslabs-is-too-small/20220830-073123
base:   c40e8341e3b3bb27e3a65b06b5b454626234c4f0
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20831/202208310701.LKr1WDCh-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
kernel/dma/swiotlb.c:334 swiotlb_init_remap() error: uninitialized symbol '=
nslabs'.

vim +/nslabs +334 kernel/dma/swiotlb.c

0a65579cdd28be kernel/dma/swiotlb.c    Claire Chang      2021-06-19  302  =

abbceff7d7a884 lib/swiotlb.c           FUJITA Tomonori   2010-05-10  303  /*
abbceff7d7a884 lib/swiotlb.c           FUJITA Tomonori   2010-05-10  304   =
* Statically reserve bounce buffer space and initialize bounce buffer data
abbceff7d7a884 lib/swiotlb.c           FUJITA Tomonori   2010-05-10  305   =
* structures for the software IO TLB used to implement the DMA API.
abbceff7d7a884 lib/swiotlb.c           FUJITA Tomonori   2010-05-10  306   =
*/
7374153d294eb5 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-14  307  v=
oid __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
7374153d294eb5 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-14  308  	=
	int (*remap)(void *tlb, unsigned long nslabs))
abbceff7d7a884 lib/swiotlb.c           FUJITA Tomonori   2010-05-10  309  {
6424e31b1c050a kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-15  310  	=
struct io_tlb_mem *mem =3D &io_tlb_default_mem;
20347fca71a387 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-08  311  	=
unsigned long nslabs;
a5e891321a2196 kernel/dma/swiotlb.c    Christoph Hellwig 2022-05-11  312  	=
size_t alloc_size;
7374153d294eb5 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-14  313  	=
size_t bytes;
2d29960af0bee8 kernel/dma/swiotlb.c    Christoph Hellwig 2021-03-18  314  	=
void *tlb;
abbceff7d7a884 lib/swiotlb.c           FUJITA Tomonori   2010-05-10  315  =

c6af2aa9ffc976 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-29  316  	=
if (!addressing_limit && !swiotlb_force_bounce)
c6af2aa9ffc976 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-29  317  	=
	return;
c6af2aa9ffc976 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-29  318  	=
if (swiotlb_force_disable)
2726bf3ff2520d kernel/dma/swiotlb.c    Florian Fainelli  2021-03-22  319  	=
	return;
2726bf3ff2520d kernel/dma/swiotlb.c    Florian Fainelli  2021-03-22  320  =

20347fca71a387 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-08  321  	=
/*
20347fca71a387 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-08  322  	=
 * default_nslabs maybe changed when adjust area number.
20347fca71a387 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-08  323  	=
 * So allocate bounce buffer after adjusting area number.
20347fca71a387 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-08  324  	=
 */
20347fca71a387 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-08  325  	=
if (!default_nareas)
20347fca71a387 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-08  326  	=
	swiotlb_adjust_nareas(num_possible_cpus());
20347fca71a387 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-08  327  =

8ba2ed1be90fc2 kernel/dma/swiotlb.c    Christoph Hellwig 2022-02-28  328  	=
/*
8ba2ed1be90fc2 kernel/dma/swiotlb.c    Christoph Hellwig 2022-02-28  329  	=
 * By default allocate the bounce buffer memory from low memory, but
8ba2ed1be90fc2 kernel/dma/swiotlb.c    Christoph Hellwig 2022-02-28  330  	=
 * allow to pick a location everywhere for hypervisors with guest
8ba2ed1be90fc2 kernel/dma/swiotlb.c    Christoph Hellwig 2022-02-28  331  	=
 * memory encryption.
8ba2ed1be90fc2 kernel/dma/swiotlb.c    Christoph Hellwig 2022-02-28  332  	=
 */
7374153d294eb5 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-14  333  r=
etry:
a5e891321a2196 kernel/dma/swiotlb.c    Christoph Hellwig 2022-05-11 @334  	=
bytes =3D PAGE_ALIGN(nslabs << IO_TLB_SHIFT);
8ba2ed1be90fc2 kernel/dma/swiotlb.c    Christoph Hellwig 2022-02-28  335  	=
if (flags & SWIOTLB_ANY)
8ba2ed1be90fc2 kernel/dma/swiotlb.c    Christoph Hellwig 2022-02-28  336  	=
	tlb =3D memblock_alloc(bytes, PAGE_SIZE);
8ba2ed1be90fc2 kernel/dma/swiotlb.c    Christoph Hellwig 2022-02-28  337  	=
else
2d29960af0bee8 kernel/dma/swiotlb.c    Christoph Hellwig 2021-03-18  338  	=
	tlb =3D memblock_alloc_low(bytes, PAGE_SIZE);
1521c607cabe7c kernel/dma/swiotlb.c    Christoph Hellwig 2022-05-11  339  	=
if (!tlb) {
b253fbc6b9640a kernel/dma/swiotlb.c    Yu Zhao           2022-08-29  340  	=
	pr_warn("%s: failed to allocate tlb structure\n", __func__);
1521c607cabe7c kernel/dma/swiotlb.c    Christoph Hellwig 2022-05-11  341  	=
	return;
1521c607cabe7c kernel/dma/swiotlb.c    Christoph Hellwig 2022-05-11  342  	}
6424e31b1c050a kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-15  343  =

7374153d294eb5 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-14  344  	=
if (remap && remap(tlb, nslabs) < 0) {
7374153d294eb5 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-14  345  	=
	memblock_free(tlb, PAGE_ALIGN(bytes));
7374153d294eb5 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-14  346  =

7374153d294eb5 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-14  347  	=
	nslabs =3D ALIGN(nslabs >> 1, IO_TLB_SEGSIZE);
7374153d294eb5 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-14  348  	=
	if (nslabs < IO_TLB_MIN_SLABS)
7374153d294eb5 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-14  349  	=
		panic("%s: Failed to remap %zu bytes\n",
7374153d294eb5 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-14  350  	=
		      __func__, bytes);
7374153d294eb5 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-14  351  	=
	goto retry;
7374153d294eb5 kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-14  352  	}
abbceff7d7a884 lib/swiotlb.c           FUJITA Tomonori   2010-05-10  353  =

a5e891321a2196 kernel/dma/swiotlb.c    Christoph Hellwig 2022-05-11  354  	=
alloc_size =3D PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
6424e31b1c050a kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-15  355  	=
mem->slots =3D memblock_alloc(alloc_size, PAGE_SIZE);
6424e31b1c050a kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-15  356  	=
if (!mem->slots)
6424e31b1c050a kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-15  357  	=
	panic("%s: Failed to allocate %zu bytes align=3D0x%lx\n",
6424e31b1c050a kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-15  358  	=
	      __func__, alloc_size, PAGE_SIZE);
6424e31b1c050a kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-15  359  =

72311809031217 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-21  360  	=
mem->areas =3D memblock_alloc(array_size(sizeof(struct io_tlb_area),
72311809031217 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-21  361  	=
	default_nareas), SMP_CACHE_BYTES);
20347fca71a387 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-08  362  	=
if (!mem->areas)
20347fca71a387 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-08  363  	=
	panic("%s: Failed to allocate mem->areas.\n", __func__);
20347fca71a387 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-08  364  =

20347fca71a387 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-08  365  	=
swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, flags, false,
20347fca71a387 kernel/dma/swiotlb.c    Tianyu Lan        2022-07-08  366  	=
			default_nareas);
6424e31b1c050a kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-15  367  =

6424e31b1c050a kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-15  368  	=
if (flags & SWIOTLB_VERBOSE)
6424e31b1c050a kernel/dma/swiotlb.c    Christoph Hellwig 2022-03-15  369  	=
	swiotlb_print_info();
^1da177e4c3f41 arch/ia64/lib/swiotlb.c Linus Torvalds    2005-04-16  370  }
^1da177e4c3f41 arch/ia64/lib/swiotlb.c Linus Torvalds    2005-04-16  371  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7410322837165590840==--

