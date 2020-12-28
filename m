Content-Type: multipart/mixed; boundary="===============6918186483776887130=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [leon-rdma:rdma-next 9/18] drivers/infiniband/core/umem.c:205 __ib_umem_get() warn: impossible condition '(npages > (~0)) => (0-u32max > u32max)'
Date: Tue, 29 Dec 2020 07:13:22 +0800
Message-ID: <202012290714.26MFTWme-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6918186483776887130==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>
CC: Yishai Hadas <yishaih@mellanox.com>
CC: Feras Daoud <ferasda@mellanox.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git=
 rdma-next
head:   8d9227da5495f0b28eca4c1fae9d0ada6a464fe5
commit: f1b020e9d2ad379b44fe323ff9c2eb27d872fbdd [9/18] RDMA/core: Introduc=
e peer memory interface
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-m021-20201227 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/infiniband/core/umem.c:205 __ib_umem_get() warn: impossible conditi=
on '(npages > (~0)) =3D> (0-u32max > u32max)'

vim +205 drivers/infiniband/core/umem.c

4a35339958f16d4 drivers/infiniband/core/umem.c       Shiraz Saleem     2019=
-05-06  143  =

f7c6a7b5d59980b drivers/infiniband/core/umem.c       Roland Dreier     2007=
-03-04  144  /**
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  145   * __ib_umem_get - Pin and DMA map userspace memory.
8ada2c1c0c1d75a drivers/infiniband/core/umem.c       Shachar Raindel   2014=
-12-11  146   *
c320e527e154830 drivers/infiniband/core/umem.c       Moni Shoua        2020=
-01-15  147   * @device: IB device to connect UMEM
f7c6a7b5d59980b drivers/infiniband/core/umem.c       Roland Dreier     2007=
-03-04  148   * @addr: userspace virtual address to start at
f7c6a7b5d59980b drivers/infiniband/core/umem.c       Roland Dreier     2007=
-03-04  149   * @size: length of region to pin
f7c6a7b5d59980b drivers/infiniband/core/umem.c       Roland Dreier     2007=
-03-04  150   * @access: IB_ACCESS_xxx flags for memory being pinned
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  151   * @peer_mem_flags: IB_PEER_MEM_xxx flags for memory being used
f7c6a7b5d59980b drivers/infiniband/core/umem.c       Roland Dreier     2007=
-03-04  152   */
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  153  static struct ib_umem *__ib_umem_get(struct ib_device *device,
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  154  				    unsigned long addr, size_t size, int access,
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  155  				    unsigned long peer_mem_flags)
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  156  {
f7c6a7b5d59980b drivers/infiniband/core/umem.c       Roland Dreier     2007=
-03-04  157  	struct ib_umem *umem;
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  158  	struct page **page_list;
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  159  	unsigned long lock_limit;
c6ce580716372d7 drivers/infiniband/core/umem.c       Doug Ledford      2018=
-09-21  160  	unsigned long new_pinned;
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  161  	unsigned long cur_base;
f03d9fadfe13a78 drivers/infiniband/core/umem.c       Michael Guralnik  2020=
-02-12  162  	unsigned long dma_attr =3D 0;
d4b4dd1b9706e48 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018=
-09-16  163  	struct mm_struct *mm;
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  164  	unsigned long npages;
f7c6a7b5d59980b drivers/infiniband/core/umem.c       Roland Dreier     2007=
-03-04  165  	int ret;
0c16d9635e3a513 drivers/infiniband/core/umem.c       Maor Gottlieb     2020=
-10-04  166  	struct scatterlist *sg =3D NULL;
768ae309a96103e drivers/infiniband/core/umem.c       Lorenzo Stoakes   2016=
-10-13  167  	unsigned int gup_flags =3D FOLL_WRITE;
cb9fbc5c37b69ac drivers/infiniband/core/umem.c       Arthur Kepner     2008=
-04-29  168  =

8494057ab5e40df drivers/infiniband/core/umem.c       Shachar Raindel   2015=
-03-18  169  	/*
8494057ab5e40df drivers/infiniband/core/umem.c       Shachar Raindel   2015=
-03-18  170  	 * If the combination of the addr and size requested for this=
 memory
8494057ab5e40df drivers/infiniband/core/umem.c       Shachar Raindel   2015=
-03-18  171  	 * region causes an integer overflow, return error.
8494057ab5e40df drivers/infiniband/core/umem.c       Shachar Raindel   2015=
-03-18  172  	 */
66578b0b2f69659 drivers/infiniband/core/umem.c       Yann Droneaud     2015=
-04-13  173  	if (((addr + size) < addr) ||
66578b0b2f69659 drivers/infiniband/core/umem.c       Yann Droneaud     2015=
-04-13  174  	    PAGE_ALIGN(addr + size) < (addr + size))
8494057ab5e40df drivers/infiniband/core/umem.c       Shachar Raindel   2015=
-03-18  175  		return ERR_PTR(-EINVAL);
8494057ab5e40df drivers/infiniband/core/umem.c       Shachar Raindel   2015=
-03-18  176  =

eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  177  	if (!can_do_mlock())
f7c6a7b5d59980b drivers/infiniband/core/umem.c       Roland Dreier     2007=
-03-04  178  		return ERR_PTR(-EPERM);
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  179  =

261dc53f8ee037b drivers/infiniband/core/umem.c       Jason Gunthorpe   2019=
-08-19  180  	if (access & IB_ACCESS_ON_DEMAND)
261dc53f8ee037b drivers/infiniband/core/umem.c       Jason Gunthorpe   2019=
-08-19  181  		return ERR_PTR(-EOPNOTSUPP);
261dc53f8ee037b drivers/infiniband/core/umem.c       Jason Gunthorpe   2019=
-08-19  182  =

41b4deeaa123e62 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018=
-09-16  183  	umem =3D kzalloc(sizeof(*umem), GFP_KERNEL);
41b4deeaa123e62 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018=
-09-16  184  	if (!umem)
41b4deeaa123e62 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018=
-09-16  185  		return ERR_PTR(-ENOMEM);
c320e527e154830 drivers/infiniband/core/umem.c       Moni Shoua        2020=
-01-15  186  	umem->ibdev      =3D device;
f7c6a7b5d59980b drivers/infiniband/core/umem.c       Roland Dreier     2007=
-03-04  187  	umem->length     =3D size;
406f9e5fa9a7a60 drivers/infiniband/core/umem.c       Haggai Eran       2014=
-12-11  188  	umem->address    =3D addr;
a665aca89a41111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-09-04  189  	/*
a665aca89a41111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-09-04  190  	 * Drivers should call ib_umem_find_best_pgsz() to set the io=
va
a665aca89a41111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-09-04  191  	 * correctly.
a665aca89a41111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-09-04  192  	 */
a665aca89a41111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-09-04  193  	umem->iova =3D addr;
08bb558ac11ab94 drivers/infiniband/core/umem.c       Jack Morgenstein  2018=
-05-23  194  	umem->writable   =3D ib_access_writable(access);
41b4deeaa123e62 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018=
-09-16  195  	umem->owning_mm =3D mm =3D current->mm;
41b4deeaa123e62 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018=
-09-16  196  	mmgrab(mm);
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  197  =

f7c6a7b5d59980b drivers/infiniband/core/umem.c       Roland Dreier     2007=
-03-04  198  	page_list =3D (struct page **) __get_free_page(GFP_KERNEL);
f7c6a7b5d59980b drivers/infiniband/core/umem.c       Roland Dreier     2007=
-03-04  199  	if (!page_list) {
1215cb7c88ec888 drivers/infiniband/core/umem.c       Leon Romanovsky   2018=
-07-10  200  		ret =3D -ENOMEM;
41b4deeaa123e62 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018=
-09-16  201  		goto umem_kfree;
f7c6a7b5d59980b drivers/infiniband/core/umem.c       Roland Dreier     2007=
-03-04  202  	}
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  203  =

406f9e5fa9a7a60 drivers/infiniband/core/umem.c       Haggai Eran       2014=
-12-11  204  	npages =3D ib_umem_num_pages(umem);
3312d1c6bdee6aa drivers/infiniband/core/umem.c       Doug Ledford      2018=
-09-21 @205  	if (npages =3D=3D 0 || npages > UINT_MAX) {
3312d1c6bdee6aa drivers/infiniband/core/umem.c       Doug Ledford      2018=
-09-21  206  		ret =3D -EINVAL;
3312d1c6bdee6aa drivers/infiniband/core/umem.c       Doug Ledford      2018=
-09-21  207  		goto out;
3312d1c6bdee6aa drivers/infiniband/core/umem.c       Doug Ledford      2018=
-09-21  208  	}
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  209  =

ccbe9f0b11b137c drivers/infiniband/core/umem.c       Jiri Slaby        2010=
-02-11  210  	lock_limit =3D rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  211  =

b95df5e3e45914c drivers/infiniband/core/umem.c       Davidlohr Bueso   2019=
-02-06  212  	new_pinned =3D atomic64_add_return(npages, &mm->pinned_vm);
70f8a3ca68d3e1f drivers/infiniband/core/umem.c       Davidlohr Bueso   2019=
-02-06  213  	if (new_pinned > lock_limit && !capable(CAP_IPC_LOCK)) {
b95df5e3e45914c drivers/infiniband/core/umem.c       Davidlohr Bueso   2019=
-02-06  214  		atomic64_sub(npages, &mm->pinned_vm);
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  215  		ret =3D -ENOMEM;
c6ce580716372d7 drivers/infiniband/core/umem.c       Doug Ledford      2018=
-09-21  216  		goto out;
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  217  	}
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  218  =

f7c6a7b5d59980b drivers/infiniband/core/umem.c       Roland Dreier     2007=
-03-04  219  	cur_base =3D addr & PAGE_MASK;
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  220  =

768ae309a96103e drivers/infiniband/core/umem.c       Lorenzo Stoakes   2016=
-10-13  221  	if (!umem->writable)
768ae309a96103e drivers/infiniband/core/umem.c       Lorenzo Stoakes   2016=
-10-13  222  		gup_flags |=3D FOLL_FORCE;
768ae309a96103e drivers/infiniband/core/umem.c       Lorenzo Stoakes   2016=
-10-13  223  =

eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  224  	while (npages) {
928da37a229f344 drivers/infiniband/core/umem.c       Eric Dumazet      2020=
-07-29  225  		cond_resched();
dfa0a4fff11b327 drivers/infiniband/core/umem.c       John Hubbard      2020=
-01-30  226  		ret =3D pin_user_pages_fast(cur_base,
8079ffa0e18baaf drivers/infiniband/core/umem.c       Roland Dreier     2008=
-06-06  227  					  min_t(unsigned long, npages,
4789fcdd1409528 drivers/infiniband/core/umem.c       John Hubbard      2020=
-01-30  228  						PAGE_SIZE /
4789fcdd1409528 drivers/infiniband/core/umem.c       John Hubbard      2020=
-01-30  229  						sizeof(struct page *)),
4789fcdd1409528 drivers/infiniband/core/umem.c       John Hubbard      2020=
-01-30  230  					  gup_flags | FOLL_LONGTERM, page_list);
4789fcdd1409528 drivers/infiniband/core/umem.c       John Hubbard      2020=
-01-30  231  		if (ret < 0)
1215cb7c88ec888 drivers/infiniband/core/umem.c       Leon Romanovsky   2018=
-07-10  232  			goto umem_release;
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  233  =

eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  234  		cur_base +=3D ret * PAGE_SIZE;
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  235  		npages -=3D ret;
b116c702791a983 drivers/infiniband/core/umem.c       Christoph Hellwig 2020=
-11-06  236  		sg =3D __sg_alloc_table_from_pages(&umem->sg_head, page_list=
, ret,
b116c702791a983 drivers/infiniband/core/umem.c       Christoph Hellwig 2020=
-11-06  237  				0, ret << PAGE_SHIFT,
b116c702791a983 drivers/infiniband/core/umem.c       Christoph Hellwig 2020=
-11-06  238  				ib_dma_max_seg_size(device), sg, npages,
0c16d9635e3a513 drivers/infiniband/core/umem.c       Maor Gottlieb     2020=
-10-04  239  				GFP_KERNEL);
0c16d9635e3a513 drivers/infiniband/core/umem.c       Maor Gottlieb     2020=
-10-04  240  		umem->sg_nents =3D umem->sg_head.nents;
0c16d9635e3a513 drivers/infiniband/core/umem.c       Maor Gottlieb     2020=
-10-04  241  		if (IS_ERR(sg)) {
0c16d9635e3a513 drivers/infiniband/core/umem.c       Maor Gottlieb     2020=
-10-04  242  			unpin_user_pages_dirty_lock(page_list, ret, 0);
0c16d9635e3a513 drivers/infiniband/core/umem.c       Maor Gottlieb     2020=
-10-04  243  			ret =3D PTR_ERR(sg);
0c16d9635e3a513 drivers/infiniband/core/umem.c       Maor Gottlieb     2020=
-10-04  244  			goto umem_release;
0c16d9635e3a513 drivers/infiniband/core/umem.c       Maor Gottlieb     2020=
-10-04  245  		}
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  246  	}
d10bcf947a3ea24 drivers/infiniband/core/umem.c       Shiraz Saleem     2019=
-04-02  247  =

f03d9fadfe13a78 drivers/infiniband/core/umem.c       Michael Guralnik  2020=
-02-12  248  	if (access & IB_ACCESS_RELAXED_ORDERING)
f03d9fadfe13a78 drivers/infiniband/core/umem.c       Michael Guralnik  2020=
-02-12  249  		dma_attr |=3D DMA_ATTR_WEAK_ORDERING;
f03d9fadfe13a78 drivers/infiniband/core/umem.c       Michael Guralnik  2020=
-02-12  250  =

f03d9fadfe13a78 drivers/infiniband/core/umem.c       Michael Guralnik  2020=
-02-12  251  	umem->nmap =3D
f03d9fadfe13a78 drivers/infiniband/core/umem.c       Michael Guralnik  2020=
-02-12  252  		ib_dma_map_sg_attrs(device, umem->sg_head.sgl, umem->sg_nent=
s,
f03d9fadfe13a78 drivers/infiniband/core/umem.c       Michael Guralnik  2020=
-02-12  253  				    DMA_BIDIRECTIONAL, dma_attr);
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  254  =

3a2e791c9456aab drivers/infiniband/core/umem.c       Leon Romanovsky   2018=
-06-24  255  	if (!umem->nmap) {
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  256  		ret =3D -ENOMEM;
1215cb7c88ec888 drivers/infiniband/core/umem.c       Leon Romanovsky   2018=
-07-10  257  		goto umem_release;
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  258  	}
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  259  =

eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  260  	ret =3D 0;
1215cb7c88ec888 drivers/infiniband/core/umem.c       Leon Romanovsky   2018=
-07-10  261  	goto out;
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  262  =

1215cb7c88ec888 drivers/infiniband/core/umem.c       Leon Romanovsky   2018=
-07-10  263  umem_release:
c320e527e154830 drivers/infiniband/core/umem.c       Moni Shoua        2020=
-01-15  264  	__ib_umem_release(device, umem, 0);
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  265  =

f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  266  	/*
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  267  	 * If the address belongs to peer memory client, then the fir=
st
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  268  	 * call to get_user_pages will fail. In this case, try to get
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  269  	 * these pages from the peers.
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  270  	 */
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  271  	//FIXME: this placement is horrible
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  272  	if (ret < 0 && peer_mem_flags & IB_PEER_MEM_ALLOW) {
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  273  		struct ib_umem *new_umem;
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  274  =

f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  275  		new_umem =3D ib_peer_umem_get(umem, ret, peer_mem_flags);
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  276  		if (IS_ERR(new_umem)) {
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  277  			ret =3D PTR_ERR(new_umem);
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  278  			goto vma;
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  279  		}
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  280  		umem =3D new_umem;
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  281  		ret =3D 0;
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  282  		goto out;
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  283  	}
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  284  vma:
70f8a3ca68d3e1f drivers/infiniband/core/umem.c       Davidlohr Bueso   2019=
-02-06  285  	atomic64_sub(ib_umem_num_pages(umem), &mm->pinned_vm);
1215cb7c88ec888 drivers/infiniband/core/umem.c       Leon Romanovsky   2018=
-07-10  286  out:
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  287  	free_page((unsigned long) page_list);
1215cb7c88ec888 drivers/infiniband/core/umem.c       Leon Romanovsky   2018=
-07-10  288  umem_kfree:
41b4deeaa123e62 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018=
-09-16  289  	if (ret) {
41b4deeaa123e62 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018=
-09-16  290  		mmdrop(umem->owning_mm);
1215cb7c88ec888 drivers/infiniband/core/umem.c       Leon Romanovsky   2018=
-07-10  291  		kfree(umem);
41b4deeaa123e62 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018=
-09-16  292  	}
1215cb7c88ec888 drivers/infiniband/core/umem.c       Leon Romanovsky   2018=
-07-10  293  	return ret ? ERR_PTR(ret) : umem;
eb8ffbfed50e794 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005=
-07-07  294  }
f1b020e9d2ad379 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020=
-11-26  295  =


:::::: The code at line 205 was first introduced by commit
:::::: 3312d1c6bdee6aa912c099c0ac0662d197c52842 RDMA/umem: Minor optimizati=
ons

:::::: TO: Doug Ledford <dledford@redhat.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6918186483776887130==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6918186483776887130==--

