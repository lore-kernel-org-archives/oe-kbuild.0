Content-Type: multipart/mixed; boundary="===============5483711216595449217=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/xen/swiotlb-xen.c:206 xen_swiotlb_init() error: uninitialized symbol 'start'.
Date: Mon, 17 Jan 2022 10:59:53 +0800
Message-ID: <202201171049.JsHkmgNy-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5483711216595449217==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79e06c4c4950be2abd8ca5d2428a8c915aa62c24
commit: cbce99527ca7c4e98db9890651d5e9dfc2fb89ac xen-swiotlb: remove xen_io=
_tlb_start and xen_io_tlb_nslabs
date:   10 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-m031-20220116 (https://download.01.org/0day-ci/archi=
ve/20220117/202201171049.JsHkmgNy-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/xen/swiotlb-xen.c:206 xen_swiotlb_init() error: uninitialized symbo=
l 'start'.

Old smatch warnings:
arch/arm/include/asm/dma-direct.h:24 dma_to_pfn() warn: should 'pfn << 12' =
be a 64 bit type?

vim +/start +206 drivers/xen/swiotlb-xen.c

4035b43da6daa5 Christoph Hellwig     2021-03-01  158  =

b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  159  int __ref xen_swiotlb=
_init(int verbose, bool early)
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  160  {
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  161  	unsigned long bytes,=
 order;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  162  	int rc =3D -ENOMEM;
5bab7864b1167f Konrad Rzeszutek Wilk 2012-08-23  163  	enum xen_swiotlb_err=
 m_ret =3D XEN_SWIOTLB_UNKNOWN;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  164  	unsigned int repeat =
=3D 3;
cbce99527ca7c4 Christoph Hellwig     2021-03-01  165  	char *start;
cbce99527ca7c4 Christoph Hellwig     2021-03-01  166  	unsigned long nslabs;
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  167  =

cbce99527ca7c4 Christoph Hellwig     2021-03-01  168  	nslabs =3D swiotlb_n=
r_tbl();
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  169  retry:
cbce99527ca7c4 Christoph Hellwig     2021-03-01  170  	if (!nslabs)
cbce99527ca7c4 Christoph Hellwig     2021-03-01  171  		nslabs =3D DEFAULT_=
NSLABS;
cbce99527ca7c4 Christoph Hellwig     2021-03-01  172  	bytes =3D nslabs << =
IO_TLB_SHIFT;
4035b43da6daa5 Christoph Hellwig     2021-03-01  173  	order =3D get_order(=
bytes);
4e7372e0dc5d7d Stefano Stabellini    2019-05-28  174  =

4e7372e0dc5d7d Stefano Stabellini    2019-05-28  175  	/*
4e7372e0dc5d7d Stefano Stabellini    2019-05-28  176  	 * IO TLB memory alr=
eady allocated. Just use it.
4e7372e0dc5d7d Stefano Stabellini    2019-05-28  177  	 */
cbce99527ca7c4 Christoph Hellwig     2021-03-01  178  	if (io_tlb_start !=
=3D 0)
4e7372e0dc5d7d Stefano Stabellini    2019-05-28  179  		goto end;
4e7372e0dc5d7d Stefano Stabellini    2019-05-28  180  =

b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  181  	/*
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  182  	 * Get IO TLB memory=
 from any location.
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  183  	 */
8a7f97b902f4fb Mike Rapoport         2019-03-11  184  	if (early) {
cbce99527ca7c4 Christoph Hellwig     2021-03-01  185  		start =3D memblock_=
alloc(PAGE_ALIGN(bytes),
15c3c114ed144e Mike Rapoport         2018-10-30  186  						  PAGE_SIZE);
cbce99527ca7c4 Christoph Hellwig     2021-03-01  187  		if (!start)
8a7f97b902f4fb Mike Rapoport         2019-03-11  188  			panic("%s: Failed =
to allocate %lu bytes align=3D0x%lx\n",
8a7f97b902f4fb Mike Rapoport         2019-03-11  189  			      __func__, PA=
GE_ALIGN(bytes), PAGE_SIZE);
8a7f97b902f4fb Mike Rapoport         2019-03-11  190  	} else {
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  191  #define SLABS_PER_PAG=
E (1 << (PAGE_SHIFT - IO_TLB_SHIFT))
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  192  #define IO_TLB_MIN_SL=
ABS ((1<<20) >> IO_TLB_SHIFT)
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  193  		while ((SLABS_PER_P=
AGE << order) > IO_TLB_MIN_SLABS) {
cbce99527ca7c4 Christoph Hellwig     2021-03-01  194  			start =3D (void *)=
xen_get_swiotlb_free_pages(order);
cbce99527ca7c4 Christoph Hellwig     2021-03-01  195  			if (start)
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  196  				break;
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  197  			order--;
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  198  		}
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  199  		if (order !=3D get_=
order(bytes)) {
283c0972d53769 Joe Perches           2013-06-28  200  			pr_warn("Warning: =
only able to allocate %ld MB for software IO TLB\n",
283c0972d53769 Joe Perches           2013-06-28  201  				(PAGE_SIZE << ord=
er) >> 20);
cbce99527ca7c4 Christoph Hellwig     2021-03-01  202  			nslabs =3D SLABS_P=
ER_PAGE << order;
cbce99527ca7c4 Christoph Hellwig     2021-03-01  203  			bytes =3D nslabs <=
< IO_TLB_SHIFT;
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  204  		}
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  205  	}
cbce99527ca7c4 Christoph Hellwig     2021-03-01 @206  	if (!start) {
5bab7864b1167f Konrad Rzeszutek Wilk 2012-08-23  207  		m_ret =3D XEN_SWIOT=
LB_ENOMEM;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  208  		goto error;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  209  	}
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  210  	/*
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  211  	 * And replace that =
memory with pages under 4GB.
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  212  	 */
cbce99527ca7c4 Christoph Hellwig     2021-03-01  213  	rc =3D xen_swiotlb_f=
ixup(start,
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  214  			       bytes,
cbce99527ca7c4 Christoph Hellwig     2021-03-01  215  			       nslabs);
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  216  	if (rc) {
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  217  		if (early)
cbce99527ca7c4 Christoph Hellwig     2021-03-01  218  			memblock_free(__pa=
(start),
2013288f723887 Mike Rapoport         2018-10-30  219  				      PAGE_ALIGN(=
bytes));
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  220  		else {
cbce99527ca7c4 Christoph Hellwig     2021-03-01  221  			free_pages((unsign=
ed long)start, order);
cbce99527ca7c4 Christoph Hellwig     2021-03-01  222  			start =3D NULL;
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  223  		}
5bab7864b1167f Konrad Rzeszutek Wilk 2012-08-23  224  		m_ret =3D XEN_SWIOT=
LB_EFIXUP;
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  225  		goto error;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  226  	}
c468bdee28a1cb Konrad Rzeszutek Wilk 2012-09-17  227  	if (early) {
cbce99527ca7c4 Christoph Hellwig     2021-03-01  228  		if (swiotlb_init_wi=
th_tbl(start, nslabs,
ac2cbab21f318e Yinghai Lu            2013-01-24  229  			 verbose))
ac2cbab21f318e Yinghai Lu            2013-01-24  230  			panic("Cannot allo=
cate SWIOTLB buffer");
c468bdee28a1cb Konrad Rzeszutek Wilk 2012-09-17  231  		rc =3D 0;
c468bdee28a1cb Konrad Rzeszutek Wilk 2012-09-17  232  	} else
cbce99527ca7c4 Christoph Hellwig     2021-03-01  233  		rc =3D swiotlb_late=
_init_with_tbl(start, nslabs);
7453c549f5f648 Konrad Rzeszutek Wilk 2016-12-20  234  =

4e7372e0dc5d7d Stefano Stabellini    2019-05-28  235  end:
7453c549f5f648 Konrad Rzeszutek Wilk 2016-12-20  236  	if (!rc)
7453c549f5f648 Konrad Rzeszutek Wilk 2016-12-20  237  		swiotlb_set_max_seg=
ment(PAGE_SIZE);
7453c549f5f648 Konrad Rzeszutek Wilk 2016-12-20  238  =

b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  239  	return rc;
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  240  error:
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  241  	if (repeat--) {
cbce99527ca7c4 Christoph Hellwig     2021-03-01  242  		nslabs =3D max(1024=
UL, /* Min is 2MB */
cbce99527ca7c4 Christoph Hellwig     2021-03-01  243  					(nslabs >> 1));
283c0972d53769 Joe Perches           2013-06-28  244  		pr_info("Lowering t=
o %luMB\n",
cbce99527ca7c4 Christoph Hellwig     2021-03-01  245  			(nslabs << IO_TLB_=
SHIFT) >> 20);
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  246  		goto retry;
f4b2f07b2ed9b4 Konrad Rzeszutek Wilk 2011-07-22  247  	}
283c0972d53769 Joe Perches           2013-06-28  248  	pr_err("%s (rc:%d)\n=
", xen_swiotlb_error(m_ret), rc);
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  249  	if (early)
5bab7864b1167f Konrad Rzeszutek Wilk 2012-08-23  250  		panic("%s (rc:%d)",=
 xen_swiotlb_error(m_ret), rc);
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  251  	else
cbce99527ca7c4 Christoph Hellwig     2021-03-01  252  		free_pages((unsigne=
d long)start, order);
b8277600536989 Konrad Rzeszutek Wilk 2012-08-23  253  	return rc;
b097186fd29d5b Konrad Rzeszutek Wilk 2010-05-11  254  }
dceb1a6819ab2c Christoph Hellwig     2017-05-21  255  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5483711216595449217==--

