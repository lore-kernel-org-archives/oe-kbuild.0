Content-Type: multipart/mixed; boundary="===============2473038159943441724=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/dma-iommu.c:699:25: warning: Opposite expression on both sides of '&'. [oppositeExpression]
Date: Sat, 21 Aug 2021 14:31:40 +0800
Message-ID: <202108211427.quEpqzs3-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2473038159943441724==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tom Murphy <murphyt7@tcd.ie>
CC: Will Deacon <will@kernel.org>
CC: Lu Baolu <baolu.lu@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fa54d366a6e4fe3e16322abdb8b5115f8be0da8b
commit: c588072bba6b54b4b946485228b0409f23cd68a6 iommu/vt-d: Convert intel =
iommu driver to the iommu ops
date:   9 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 9 months ago
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iommu/dma-iommu.c:699:25: warning: Opposite expression on both s=
ides of '&'. [oppositeExpression]
    min_size =3D alloc_sizes & -alloc_sizes;
                           ^

vim +699 drivers/iommu/dma-iommu.c

0db2e5d18f76a6 Robin Murphy        2015-10-01  663  =

0db2e5d18f76a6 Robin Murphy        2015-10-01  664  /**
21b95aaf5f2212 Christoph Hellwig   2019-05-20  665   * iommu_dma_alloc_rema=
p - Allocate and map a buffer contiguous in IOVA space
0db2e5d18f76a6 Robin Murphy        2015-10-01  666   * @dev: Device to allo=
cate memory for. Must be a real device
0db2e5d18f76a6 Robin Murphy        2015-10-01  667   *	 attached to an iomm=
u_dma_domain
0db2e5d18f76a6 Robin Murphy        2015-10-01  668   * @size: Size of buffe=
r in bytes
21b95aaf5f2212 Christoph Hellwig   2019-05-20  669   * @dma_handle: Out arg=
ument for allocated DMA handle
0db2e5d18f76a6 Robin Murphy        2015-10-01  670   * @gfp: Allocation fla=
gs
e8d39a903cc680 Christoph Hellwig   2020-09-01  671   * @prot: pgprot_t to u=
se for the remapped mapping
3b6b7e19e31a81 Robin Murphy        2016-04-13  672   * @attrs: DMA attribut=
es for this allocation
0db2e5d18f76a6 Robin Murphy        2015-10-01  673   *
0db2e5d18f76a6 Robin Murphy        2015-10-01  674   * If @size is less tha=
n PAGE_SIZE, then a full CPU page will be allocated,
0db2e5d18f76a6 Robin Murphy        2015-10-01  675   * but an IOMMU which s=
upports smaller pages might not map the whole thing.
0db2e5d18f76a6 Robin Murphy        2015-10-01  676   *
21b95aaf5f2212 Christoph Hellwig   2019-05-20  677   * Return: Mapped virtu=
al address, or NULL on failure.
0db2e5d18f76a6 Robin Murphy        2015-10-01  678   */
21b95aaf5f2212 Christoph Hellwig   2019-05-20  679  static void *iommu_dma_=
alloc_remap(struct device *dev, size_t size,
e8d39a903cc680 Christoph Hellwig   2020-09-01  680  		dma_addr_t *dma_handl=
e, gfp_t gfp, pgprot_t prot,
e8d39a903cc680 Christoph Hellwig   2020-09-01  681  		unsigned long attrs)
0db2e5d18f76a6 Robin Murphy        2015-10-01  682  {
43c5bf11a610ce Robin Murphy        2018-09-12  683  	struct iommu_domain *d=
omain =3D iommu_get_dma_domain(dev);
842fe519f68b4d Robin Murphy        2017-03-31  684  	struct iommu_dma_cooki=
e *cookie =3D domain->iova_cookie;
842fe519f68b4d Robin Murphy        2017-03-31  685  	struct iova_domain *io=
vad =3D &cookie->iovad;
21b95aaf5f2212 Christoph Hellwig   2019-05-20  686  	bool coherent =3D dev_=
is_dma_coherent(dev);
21b95aaf5f2212 Christoph Hellwig   2019-05-20  687  	int ioprot =3D dma_inf=
o_to_prot(DMA_BIDIRECTIONAL, coherent, attrs);
21b95aaf5f2212 Christoph Hellwig   2019-05-20  688  	unsigned int count, mi=
n_size, alloc_sizes =3D domain->pgsize_bitmap;
0db2e5d18f76a6 Robin Murphy        2015-10-01  689  	struct page **pages;
0db2e5d18f76a6 Robin Murphy        2015-10-01  690  	struct sg_table sgt;
842fe519f68b4d Robin Murphy        2017-03-31  691  	dma_addr_t iova;
21b95aaf5f2212 Christoph Hellwig   2019-05-20  692  	void *vaddr;
0db2e5d18f76a6 Robin Murphy        2015-10-01  693  =

21b95aaf5f2212 Christoph Hellwig   2019-05-20  694  	*dma_handle =3D DMA_MA=
PPING_ERROR;
0db2e5d18f76a6 Robin Murphy        2015-10-01  695  =

795bbbb9b6f803 Tom Murphy          2019-09-08  696  	if (unlikely(iommu_dma=
_deferred_attach(dev, domain)))
795bbbb9b6f803 Tom Murphy          2019-09-08  697  		return NULL;
795bbbb9b6f803 Tom Murphy          2019-09-08  698  =

3b6b7e19e31a81 Robin Murphy        2016-04-13 @699  	min_size =3D alloc_siz=
es & -alloc_sizes;
3b6b7e19e31a81 Robin Murphy        2016-04-13  700  	if (min_size < PAGE_SI=
ZE) {
3b6b7e19e31a81 Robin Murphy        2016-04-13  701  		min_size =3D PAGE_SIZ=
E;
3b6b7e19e31a81 Robin Murphy        2016-04-13  702  		alloc_sizes |=3D PAGE=
_SIZE;
3b6b7e19e31a81 Robin Murphy        2016-04-13  703  	} else {
3b6b7e19e31a81 Robin Murphy        2016-04-13  704  		size =3D ALIGN(size, =
min_size);
3b6b7e19e31a81 Robin Murphy        2016-04-13  705  	}
00085f1efa387a Krzysztof Kozlowski 2016-08-03  706  	if (attrs & DMA_ATTR_A=
LLOC_SINGLE_PAGES)
3b6b7e19e31a81 Robin Murphy        2016-04-13  707  		alloc_sizes =3D min_s=
ize;
3b6b7e19e31a81 Robin Murphy        2016-04-13  708  =

3b6b7e19e31a81 Robin Murphy        2016-04-13  709  	count =3D PAGE_ALIGN(s=
ize) >> PAGE_SHIFT;
c4b17afb0a4e8d Ganapatrao Kulkarni 2018-11-30  710  	pages =3D __iommu_dma_=
alloc_pages(dev, count, alloc_sizes >> PAGE_SHIFT,
c4b17afb0a4e8d Ganapatrao Kulkarni 2018-11-30  711  					gfp);
0db2e5d18f76a6 Robin Murphy        2015-10-01  712  	if (!pages)
0db2e5d18f76a6 Robin Murphy        2015-10-01  713  		return NULL;
0db2e5d18f76a6 Robin Murphy        2015-10-01  714  =

842fe519f68b4d Robin Murphy        2017-03-31  715  	size =3D iova_align(io=
vad, size);
842fe519f68b4d Robin Murphy        2017-03-31  716  	iova =3D iommu_dma_all=
oc_iova(domain, size, dev->coherent_dma_mask, dev);
0db2e5d18f76a6 Robin Murphy        2015-10-01  717  	if (!iova)
0db2e5d18f76a6 Robin Murphy        2015-10-01  718  		goto out_free_pages;
0db2e5d18f76a6 Robin Murphy        2015-10-01  719  =

0db2e5d18f76a6 Robin Murphy        2015-10-01  720  	if (sg_alloc_table_fro=
m_pages(&sgt, pages, count, 0, size, GFP_KERNEL))
0db2e5d18f76a6 Robin Murphy        2015-10-01  721  		goto out_free_iova;
0db2e5d18f76a6 Robin Murphy        2015-10-01  722  =

21b95aaf5f2212 Christoph Hellwig   2019-05-20  723  	if (!(ioprot & IOMMU_C=
ACHE)) {
23f88e0a7e9f08 Christoph Hellwig   2019-05-20  724  		struct scatterlist *s=
g;
23f88e0a7e9f08 Christoph Hellwig   2019-05-20  725  		int i;
23f88e0a7e9f08 Christoph Hellwig   2019-05-20  726  =

23f88e0a7e9f08 Christoph Hellwig   2019-05-20  727  		for_each_sg(sgt.sgl, =
sg, sgt.orig_nents, i)
23f88e0a7e9f08 Christoph Hellwig   2019-05-20  728  			arch_dma_prep_cohere=
nt(sg_page(sg), sg->length);
0db2e5d18f76a6 Robin Murphy        2015-10-01  729  	}
0db2e5d18f76a6 Robin Murphy        2015-10-01  730  =

781ca2de89bae1 Tom Murphy          2019-09-08  731  	if (iommu_map_sg_atomi=
c(domain, iova, sgt.sgl, sgt.orig_nents, ioprot)
0db2e5d18f76a6 Robin Murphy        2015-10-01  732  			< size)
0db2e5d18f76a6 Robin Murphy        2015-10-01  733  		goto out_free_sg;
0db2e5d18f76a6 Robin Murphy        2015-10-01  734  =

512317401f6a33 Christoph Hellwig   2019-08-30  735  	vaddr =3D dma_common_p=
ages_remap(pages, size, prot,
21b95aaf5f2212 Christoph Hellwig   2019-05-20  736  			__builtin_return_add=
ress(0));
21b95aaf5f2212 Christoph Hellwig   2019-05-20  737  	if (!vaddr)
21b95aaf5f2212 Christoph Hellwig   2019-05-20  738  		goto out_unmap;
21b95aaf5f2212 Christoph Hellwig   2019-05-20  739  =

21b95aaf5f2212 Christoph Hellwig   2019-05-20  740  	*dma_handle =3D iova;
0db2e5d18f76a6 Robin Murphy        2015-10-01  741  	sg_free_table(&sgt);
21b95aaf5f2212 Christoph Hellwig   2019-05-20  742  	return vaddr;
0db2e5d18f76a6 Robin Murphy        2015-10-01  743  =

21b95aaf5f2212 Christoph Hellwig   2019-05-20  744  out_unmap:
21b95aaf5f2212 Christoph Hellwig   2019-05-20  745  	__iommu_dma_unmap(dev,=
 iova, size);
0db2e5d18f76a6 Robin Murphy        2015-10-01  746  out_free_sg:
0db2e5d18f76a6 Robin Murphy        2015-10-01  747  	sg_free_table(&sgt);
0db2e5d18f76a6 Robin Murphy        2015-10-01  748  out_free_iova:
2a2b8eaa5b2566 Tom Murphy          2020-11-24  749  	iommu_dma_free_iova(co=
okie, iova, size, NULL);
0db2e5d18f76a6 Robin Murphy        2015-10-01  750  out_free_pages:
0db2e5d18f76a6 Robin Murphy        2015-10-01  751  	__iommu_dma_free_pages=
(pages, count);
0db2e5d18f76a6 Robin Murphy        2015-10-01  752  	return NULL;
0db2e5d18f76a6 Robin Murphy        2015-10-01  753  }
0db2e5d18f76a6 Robin Murphy        2015-10-01  754  =


:::::: The code@line 699 was first introduced by commit
:::::: 3b6b7e19e31a816ee02a8d4372cbea9ad7db3784 iommu/dma: Finish optimisin=
g higher-order allocations

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2473038159943441724==--

