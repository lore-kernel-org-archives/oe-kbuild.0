Content-Type: multipart/mixed; boundary="===============0236682164587435737=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/iommu/dma-iommu.c:666:25: warning: Opposite expression on both sides of '&'. [oppositeExpression]
Date: Thu, 27 Jan 2022 17:43:52 +0800
Message-ID: <202201271646.VCCnXdNF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0236682164587435737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Jean-Philippe Brucker" <jean-philippe@linaro.org>
CC: Joerg Roedel <jroedel@suse.de>
CC: Eric Auger <eric.auger@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: 8ce4904bfd22de04ac3cd35d469c0a3337bdeb7b iommu/virtio: Enable x86 s=
upport
date:   7 months ago
:::::: branch date: 2 days ago
:::::: commit date: 7 months ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/iommu/dma-iommu.c:666:25: warning: Opposite expression on both s=
ides of '&'. [oppositeExpression]
    min_size =3D alloc_sizes & -alloc_sizes;
                           ^

vim +666 drivers/iommu/dma-iommu.c

0db2e5d18f76a6 Robin Murphy        2015-10-01  644  =

8230ce9a4e206f Christoph Hellwig   2021-01-28  645  /*
8230ce9a4e206f Christoph Hellwig   2021-01-28  646   * If size is less than=
 PAGE_SIZE, then a full CPU page will be allocated,
0db2e5d18f76a6 Robin Murphy        2015-10-01  647   * but an IOMMU which s=
upports smaller pages might not map the whole thing.
0db2e5d18f76a6 Robin Murphy        2015-10-01  648   */
8230ce9a4e206f Christoph Hellwig   2021-01-28  649  static struct page **__=
iommu_dma_alloc_noncontiguous(struct device *dev,
8230ce9a4e206f Christoph Hellwig   2021-01-28  650  		size_t size, struct s=
g_table *sgt, gfp_t gfp, pgprot_t prot,
e8d39a903cc680 Christoph Hellwig   2020-09-01  651  		unsigned long attrs)
0db2e5d18f76a6 Robin Murphy        2015-10-01  652  {
43c5bf11a610ce Robin Murphy        2018-09-12  653  	struct iommu_domain *d=
omain =3D iommu_get_dma_domain(dev);
842fe519f68b4d Robin Murphy        2017-03-31  654  	struct iommu_dma_cooki=
e *cookie =3D domain->iova_cookie;
842fe519f68b4d Robin Murphy        2017-03-31  655  	struct iova_domain *io=
vad =3D &cookie->iovad;
21b95aaf5f2212 Christoph Hellwig   2019-05-20  656  	bool coherent =3D dev_=
is_dma_coherent(dev);
21b95aaf5f2212 Christoph Hellwig   2019-05-20  657  	int ioprot =3D dma_inf=
o_to_prot(DMA_BIDIRECTIONAL, coherent, attrs);
21b95aaf5f2212 Christoph Hellwig   2019-05-20  658  	unsigned int count, mi=
n_size, alloc_sizes =3D domain->pgsize_bitmap;
0db2e5d18f76a6 Robin Murphy        2015-10-01  659  	struct page **pages;
842fe519f68b4d Robin Murphy        2017-03-31  660  	dma_addr_t iova;
0db2e5d18f76a6 Robin Murphy        2015-10-01  661  =

a8e8af35c9f4f7 Lianbo Jiang        2021-01-26  662  	if (static_branch_unli=
kely(&iommu_deferred_attach_enabled) &&
3ab657291638ea Lianbo Jiang        2021-01-26  663  	    iommu_deferred_att=
ach(dev, domain))
795bbbb9b6f803 Tom Murphy          2019-09-08  664  		return NULL;
795bbbb9b6f803 Tom Murphy          2019-09-08  665  =

3b6b7e19e31a81 Robin Murphy        2016-04-13 @666  	min_size =3D alloc_siz=
es & -alloc_sizes;
3b6b7e19e31a81 Robin Murphy        2016-04-13  667  	if (min_size < PAGE_SI=
ZE) {
3b6b7e19e31a81 Robin Murphy        2016-04-13  668  		min_size =3D PAGE_SIZ=
E;
3b6b7e19e31a81 Robin Murphy        2016-04-13  669  		alloc_sizes |=3D PAGE=
_SIZE;
3b6b7e19e31a81 Robin Murphy        2016-04-13  670  	} else {
3b6b7e19e31a81 Robin Murphy        2016-04-13  671  		size =3D ALIGN(size, =
min_size);
3b6b7e19e31a81 Robin Murphy        2016-04-13  672  	}
00085f1efa387a Krzysztof Kozlowski 2016-08-03  673  	if (attrs & DMA_ATTR_A=
LLOC_SINGLE_PAGES)
3b6b7e19e31a81 Robin Murphy        2016-04-13  674  		alloc_sizes =3D min_s=
ize;
3b6b7e19e31a81 Robin Murphy        2016-04-13  675  =

3b6b7e19e31a81 Robin Murphy        2016-04-13  676  	count =3D PAGE_ALIGN(s=
ize) >> PAGE_SHIFT;
c4b17afb0a4e8d Ganapatrao Kulkarni 2018-11-30  677  	pages =3D __iommu_dma_=
alloc_pages(dev, count, alloc_sizes >> PAGE_SHIFT,
c4b17afb0a4e8d Ganapatrao Kulkarni 2018-11-30  678  					gfp);
0db2e5d18f76a6 Robin Murphy        2015-10-01  679  	if (!pages)
0db2e5d18f76a6 Robin Murphy        2015-10-01  680  		return NULL;
0db2e5d18f76a6 Robin Murphy        2015-10-01  681  =

842fe519f68b4d Robin Murphy        2017-03-31  682  	size =3D iova_align(io=
vad, size);
842fe519f68b4d Robin Murphy        2017-03-31  683  	iova =3D iommu_dma_all=
oc_iova(domain, size, dev->coherent_dma_mask, dev);
0db2e5d18f76a6 Robin Murphy        2015-10-01  684  	if (!iova)
0db2e5d18f76a6 Robin Murphy        2015-10-01  685  		goto out_free_pages;
0db2e5d18f76a6 Robin Murphy        2015-10-01  686  =

8230ce9a4e206f Christoph Hellwig   2021-01-28  687  	if (sg_alloc_table_fro=
m_pages(sgt, pages, count, 0, size, GFP_KERNEL))
0db2e5d18f76a6 Robin Murphy        2015-10-01  688  		goto out_free_iova;
0db2e5d18f76a6 Robin Murphy        2015-10-01  689  =

21b95aaf5f2212 Christoph Hellwig   2019-05-20  690  	if (!(ioprot & IOMMU_C=
ACHE)) {
23f88e0a7e9f08 Christoph Hellwig   2019-05-20  691  		struct scatterlist *s=
g;
23f88e0a7e9f08 Christoph Hellwig   2019-05-20  692  		int i;
23f88e0a7e9f08 Christoph Hellwig   2019-05-20  693  =

8230ce9a4e206f Christoph Hellwig   2021-01-28  694  		for_each_sg(sgt->sgl,=
 sg, sgt->orig_nents, i)
23f88e0a7e9f08 Christoph Hellwig   2019-05-20  695  			arch_dma_prep_cohere=
nt(sg_page(sg), sg->length);
0db2e5d18f76a6 Robin Murphy        2015-10-01  696  	}
0db2e5d18f76a6 Robin Murphy        2015-10-01  697  =

8230ce9a4e206f Christoph Hellwig   2021-01-28  698  	if (iommu_map_sg_atomi=
c(domain, iova, sgt->sgl, sgt->orig_nents, ioprot)
0db2e5d18f76a6 Robin Murphy        2015-10-01  699  			< size)
0db2e5d18f76a6 Robin Murphy        2015-10-01  700  		goto out_free_sg;
0db2e5d18f76a6 Robin Murphy        2015-10-01  701  =

8230ce9a4e206f Christoph Hellwig   2021-01-28  702  	sgt->sgl->dma_address =
=3D iova;
e817ee5f2f95ca Christoph Hellwig   2021-01-28  703  	sgt->sgl->dma_length =
=3D size;
8230ce9a4e206f Christoph Hellwig   2021-01-28  704  	return pages;
8230ce9a4e206f Christoph Hellwig   2021-01-28  705  =

8230ce9a4e206f Christoph Hellwig   2021-01-28  706  out_free_sg:
8230ce9a4e206f Christoph Hellwig   2021-01-28  707  	sg_free_table(sgt);
8230ce9a4e206f Christoph Hellwig   2021-01-28  708  out_free_iova:
8230ce9a4e206f Christoph Hellwig   2021-01-28  709  	iommu_dma_free_iova(co=
okie, iova, size, NULL);
8230ce9a4e206f Christoph Hellwig   2021-01-28  710  out_free_pages:
8230ce9a4e206f Christoph Hellwig   2021-01-28  711  	__iommu_dma_free_pages=
(pages, count);
8230ce9a4e206f Christoph Hellwig   2021-01-28  712  	return NULL;
8230ce9a4e206f Christoph Hellwig   2021-01-28  713  }
8230ce9a4e206f Christoph Hellwig   2021-01-28  714  =


:::::: The code at line 666 was first introduced by commit
:::::: 3b6b7e19e31a816ee02a8d4372cbea9ad7db3784 iommu/dma: Finish optimisin=
g higher-order allocations

:::::: TO: Robin Murphy <robin.murphy@arm.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0236682164587435737==--

