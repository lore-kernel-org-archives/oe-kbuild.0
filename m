Content-Type: multipart/mixed; boundary="===============6823482422291657374=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/dma/pool.c:62:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Sat, 12 Sep 2020 05:30:24 +0800
Message-ID: <202009120520.bgiKv7tC%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6823482422291657374==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Rientjes <rientjes@google.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e8878ab825450c9ac07a0fc22e1f66fdb62b4f72
commit: 54adadf9b08571fb8b11dc9d0d3a2ddd39825efd dma-pool: dynamically expa=
nding atomic pools
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
compiler: nds32le-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> kernel/dma/pool.c:62:6: warning: Variable 'ret' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    ret =3D gen_pool_add_virt(pool, (unsigned long)addr, page_to_phys(page),
        ^
   kernel/dma/pool.c:37:0: note: Variable 'ret' is reassigned a value befor=
e the old one has been used.
    int ret =3D -ENOMEM;
   ^
   kernel/dma/pool.c:62:6: note: Variable 'ret' is reassigned a value befor=
e the old one has been used.
    ret =3D gen_pool_add_virt(pool, (unsigned long)addr, page_to_phys(page),
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D54adadf9b08571fb8b11dc9d0d3a2ddd39825efd
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 54adadf9b08571fb8b11dc9d0d3a2ddd39825efd
vim +/ret +62 kernel/dma/pool.c

e860c299ac0d73 David Rientjes 2020-04-14  30  =

54adadf9b08571 David Rientjes 2020-04-20  31  static int atomic_pool_expand=
(struct gen_pool *pool, size_t pool_size,
54adadf9b08571 David Rientjes 2020-04-20  32  			      gfp_t gfp)
e860c299ac0d73 David Rientjes 2020-04-14  33  {
54adadf9b08571 David Rientjes 2020-04-20  34  	unsigned int order;
e860c299ac0d73 David Rientjes 2020-04-14  35  	struct page *page;
e860c299ac0d73 David Rientjes 2020-04-14  36  	void *addr;
54adadf9b08571 David Rientjes 2020-04-20  37  	int ret =3D -ENOMEM;
54adadf9b08571 David Rientjes 2020-04-20  38  =

54adadf9b08571 David Rientjes 2020-04-20  39  	/* Cannot allocate larger th=
an MAX_ORDER-1 */
54adadf9b08571 David Rientjes 2020-04-20  40  	order =3D min(get_order(pool=
_size), MAX_ORDER-1);
54adadf9b08571 David Rientjes 2020-04-20  41  =

54adadf9b08571 David Rientjes 2020-04-20  42  	do {
54adadf9b08571 David Rientjes 2020-04-20  43  		pool_size =3D 1 << (PAGE_SH=
IFT + order);
e860c299ac0d73 David Rientjes 2020-04-14  44  =

e860c299ac0d73 David Rientjes 2020-04-14  45  		if (dev_get_cma_area(NULL))
54adadf9b08571 David Rientjes 2020-04-20  46  			page =3D dma_alloc_from_co=
ntiguous(NULL, 1 << order,
54adadf9b08571 David Rientjes 2020-04-20  47  							 order, false);
e860c299ac0d73 David Rientjes 2020-04-14  48  		else
c84dc6e68a1d24 David Rientjes 2020-04-14  49  			page =3D alloc_pages(gfp, =
order);
54adadf9b08571 David Rientjes 2020-04-20  50  	} while (!page && order-- > =
0);
e860c299ac0d73 David Rientjes 2020-04-14  51  	if (!page)
e860c299ac0d73 David Rientjes 2020-04-14  52  		goto out;
e860c299ac0d73 David Rientjes 2020-04-14  53  =

c84dc6e68a1d24 David Rientjes 2020-04-14  54  	arch_dma_prep_coherent(page,=
 pool_size);
e860c299ac0d73 David Rientjes 2020-04-14  55  =

c84dc6e68a1d24 David Rientjes 2020-04-14  56  	addr =3D dma_common_contiguo=
us_remap(page, pool_size,
e860c299ac0d73 David Rientjes 2020-04-14  57  					   pgprot_dmacoherent(PA=
GE_KERNEL),
e860c299ac0d73 David Rientjes 2020-04-14  58  					   __builtin_return_addr=
ess(0));
e860c299ac0d73 David Rientjes 2020-04-14  59  	if (!addr)
54adadf9b08571 David Rientjes 2020-04-20  60  		goto free_page;
e860c299ac0d73 David Rientjes 2020-04-14  61  =

54adadf9b08571 David Rientjes 2020-04-20 @62  	ret =3D gen_pool_add_virt(po=
ol, (unsigned long)addr, page_to_phys(page),
54adadf9b08571 David Rientjes 2020-04-20  63  				pool_size, NUMA_NO_NODE);
e860c299ac0d73 David Rientjes 2020-04-14  64  	if (ret)
e860c299ac0d73 David Rientjes 2020-04-14  65  		goto remove_mapping;
e860c299ac0d73 David Rientjes 2020-04-14  66  =

e860c299ac0d73 David Rientjes 2020-04-14  67  	return 0;
e860c299ac0d73 David Rientjes 2020-04-14  68  =

e860c299ac0d73 David Rientjes 2020-04-14  69  remove_mapping:
c84dc6e68a1d24 David Rientjes 2020-04-14  70  	dma_common_free_remap(addr, =
pool_size);
e860c299ac0d73 David Rientjes 2020-04-14  71  free_page:
54adadf9b08571 David Rientjes 2020-04-20  72  	if (!dma_release_from_contig=
uous(NULL, page, 1 << order))
c84dc6e68a1d24 David Rientjes 2020-04-14  73  		__free_pages(page, order);
e860c299ac0d73 David Rientjes 2020-04-14  74  out:
54adadf9b08571 David Rientjes 2020-04-20  75  	return ret;
54adadf9b08571 David Rientjes 2020-04-20  76  }
54adadf9b08571 David Rientjes 2020-04-20  77  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6823482422291657374==--

