Content-Type: multipart/mixed; boundary="===============5410083890142629908=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/dma/pool.c:91:6: warning: Variable 'ret' is reassigned a value before the old one has been used.
Date: Mon, 28 Sep 2020 11:18:24 +0800
Message-ID: <202009281122.qFKbR1zA%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5410083890142629908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Rich Felker <dalias@libc.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a1b8638ba1320e6684aa98233c15255eb803fac7
commit: 6dfdf673ccb24dccc95b342235cac3e585c5af34 sh: use the generic dma co=
herent remap allocator
date:   6 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 weeks ago
compiler: sh4-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> kernel/dma/pool.c:91:6: warning: Variable 'ret' is reassigned a value be=
fore the old one has been used. [redundantAssignment]
    ret =3D set_memory_decrypted((unsigned long)page_to_virt(page),
        ^
   kernel/dma/pool.c:64:0: note: Variable 'ret' is reassigned a value befor=
e the old one has been used.
    int ret =3D -ENOMEM;
   ^
   kernel/dma/pool.c:91:6: note: Variable 'ret' is reassigned a value befor=
e the old one has been used.
    ret =3D set_memory_decrypted((unsigned long)page_to_virt(page),
        ^

vim +/ret +91 kernel/dma/pool.c

2edc5bb3c5cc42 David Rientjes 2020-04-14   57  =

54adadf9b08571 David Rientjes 2020-04-20   58  static int atomic_pool_expan=
d(struct gen_pool *pool, size_t pool_size,
54adadf9b08571 David Rientjes 2020-04-20   59  			      gfp_t gfp)
e860c299ac0d73 David Rientjes 2020-04-14   60  {
54adadf9b08571 David Rientjes 2020-04-20   61  	unsigned int order;
e860c299ac0d73 David Rientjes 2020-04-14   62  	struct page *page;
e860c299ac0d73 David Rientjes 2020-04-14   63  	void *addr;
54adadf9b08571 David Rientjes 2020-04-20   64  	int ret =3D -ENOMEM;
54adadf9b08571 David Rientjes 2020-04-20   65  =

54adadf9b08571 David Rientjes 2020-04-20   66  	/* Cannot allocate larger t=
han MAX_ORDER-1 */
54adadf9b08571 David Rientjes 2020-04-20   67  	order =3D min(get_order(poo=
l_size), MAX_ORDER-1);
54adadf9b08571 David Rientjes 2020-04-20   68  =

54adadf9b08571 David Rientjes 2020-04-20   69  	do {
54adadf9b08571 David Rientjes 2020-04-20   70  		pool_size =3D 1 << (PAGE_S=
HIFT + order);
c84dc6e68a1d24 David Rientjes 2020-04-14   71  		page =3D alloc_pages(gfp, =
order);
54adadf9b08571 David Rientjes 2020-04-20   72  	} while (!page && order-- >=
 0);
e860c299ac0d73 David Rientjes 2020-04-14   73  	if (!page)
e860c299ac0d73 David Rientjes 2020-04-14   74  		goto out;
e860c299ac0d73 David Rientjes 2020-04-14   75  =

c84dc6e68a1d24 David Rientjes 2020-04-14   76  	arch_dma_prep_coherent(page=
, pool_size);
e860c299ac0d73 David Rientjes 2020-04-14   77  =

76a19940bd62a8 David Rientjes 2020-04-14   78  #ifdef CONFIG_DMA_DIRECT_REM=
AP
c84dc6e68a1d24 David Rientjes 2020-04-14   79  	addr =3D dma_common_contigu=
ous_remap(page, pool_size,
e860c299ac0d73 David Rientjes 2020-04-14   80  					   pgprot_dmacoherent(P=
AGE_KERNEL),
e860c299ac0d73 David Rientjes 2020-04-14   81  					   __builtin_return_add=
ress(0));
e860c299ac0d73 David Rientjes 2020-04-14   82  	if (!addr)
54adadf9b08571 David Rientjes 2020-04-20   83  		goto free_page;
76a19940bd62a8 David Rientjes 2020-04-14   84  #else
76a19940bd62a8 David Rientjes 2020-04-14   85  	addr =3D page_to_virt(page);
76a19940bd62a8 David Rientjes 2020-04-14   86  #endif
76a19940bd62a8 David Rientjes 2020-04-14   87  	/*
76a19940bd62a8 David Rientjes 2020-04-14   88  	 * Memory in the atomic DMA=
 pools must be unencrypted, the pools do not
76a19940bd62a8 David Rientjes 2020-04-14   89  	 * shrink so no re-encrypti=
on occurs in dma_direct_free_pages().
76a19940bd62a8 David Rientjes 2020-04-14   90  	 */
76a19940bd62a8 David Rientjes 2020-04-14  @91  	ret =3D set_memory_decrypte=
d((unsigned long)page_to_virt(page),
76a19940bd62a8 David Rientjes 2020-04-14   92  				   1 << order);
76a19940bd62a8 David Rientjes 2020-04-14   93  	if (ret)
76a19940bd62a8 David Rientjes 2020-04-14   94  		goto remove_mapping;
54adadf9b08571 David Rientjes 2020-04-20   95  	ret =3D gen_pool_add_virt(p=
ool, (unsigned long)addr, page_to_phys(page),
54adadf9b08571 David Rientjes 2020-04-20   96  				pool_size, NUMA_NO_NODE);
e860c299ac0d73 David Rientjes 2020-04-14   97  	if (ret)
76a19940bd62a8 David Rientjes 2020-04-14   98  		goto encrypt_mapping;
e860c299ac0d73 David Rientjes 2020-04-14   99  =

2edc5bb3c5cc42 David Rientjes 2020-04-14  100  	dma_atomic_pool_size_add(gf=
p, pool_size);
e860c299ac0d73 David Rientjes 2020-04-14  101  	return 0;
e860c299ac0d73 David Rientjes 2020-04-14  102  =

76a19940bd62a8 David Rientjes 2020-04-14  103  encrypt_mapping:
76a19940bd62a8 David Rientjes 2020-04-14  104  	ret =3D set_memory_encrypte=
d((unsigned long)page_to_virt(page),
76a19940bd62a8 David Rientjes 2020-04-14  105  				   1 << order);
76a19940bd62a8 David Rientjes 2020-04-14  106  	if (WARN_ON_ONCE(ret)) {
76a19940bd62a8 David Rientjes 2020-04-14  107  		/* Decrypt succeeded but e=
ncrypt failed, purposely leak */
76a19940bd62a8 David Rientjes 2020-04-14  108  		goto out;
76a19940bd62a8 David Rientjes 2020-04-14  109  	}
e860c299ac0d73 David Rientjes 2020-04-14  110  remove_mapping:
76a19940bd62a8 David Rientjes 2020-04-14  111  #ifdef CONFIG_DMA_DIRECT_REM=
AP
c84dc6e68a1d24 David Rientjes 2020-04-14  112  	dma_common_free_remap(addr,=
 pool_size);
76a19940bd62a8 David Rientjes 2020-04-14  113  #endif
76a19940bd62a8 David Rientjes 2020-04-14  114  free_page: __maybe_unused
c84dc6e68a1d24 David Rientjes 2020-04-14  115  	__free_pages(page, order);
e860c299ac0d73 David Rientjes 2020-04-14  116  out:
54adadf9b08571 David Rientjes 2020-04-20  117  	return ret;
54adadf9b08571 David Rientjes 2020-04-20  118  }
54adadf9b08571 David Rientjes 2020-04-20  119  =


:::::: The code@line 91 was first introduced by commit
:::::: 76a19940bd62a81148c303f3df6d0cee9ae4b509 dma-direct: atomic allocati=
ons must come from atomic coherent pools

:::::: TO: David Rientjes <rientjes@google.com>
:::::: CC: Christoph Hellwig <hch@lst.de>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5410083890142629908==--

