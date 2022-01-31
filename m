Content-Type: multipart/mixed; boundary="===============2687296199393008804=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [leon-rdma:rdma-next 10/16] drivers/infiniband/core/umem.c:201 __ib_umem_get() warn: impossible condition '(npages > (~0)) => (0-u32max > u32max)'
Date: Mon, 31 Jan 2022 16:22:10 +0800
Message-ID: <202201311641.OvXb8L8G-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2687296199393008804==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>
CC: Yishai Hadas <yishaih@mellanox.com>
CC: Feras Daoud <ferasda@mellanox.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git=
 rdma-next
head:   659c776c82b14003666c91799ac3a6a3c4fb3665
commit: bc623e553908107bb16bef04bbe4b2469001fc9a [10/16] RDMA/core: Introdu=
ce peer memory interface
:::::: branch date: 24 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-m021-20220131 (https://download.01.org/0day-ci/arch=
ive/20220131/202201311641.OvXb8L8G-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/infiniband/core/umem.c:201 __ib_umem_get() warn: impossible conditi=
on '(npages > (~0)) =3D> (0-u32max > u32max)'

vim +201 drivers/infiniband/core/umem.c

4a35339958f16d drivers/infiniband/core/umem.c       Shiraz Saleem    2019-0=
5-06  140  =

f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier    2007-0=
3-04  141  /**
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  142   * __ib_umem_get - Pin and DMA map userspace memory.
8ada2c1c0c1d75 drivers/infiniband/core/umem.c       Shachar Raindel  2014-1=
2-11  143   *
c320e527e15483 drivers/infiniband/core/umem.c       Moni Shoua       2020-0=
1-15  144   * @device: IB device to connect UMEM
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier    2007-0=
3-04  145   * @addr: userspace virtual address to start at
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier    2007-0=
3-04  146   * @size: length of region to pin
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier    2007-0=
3-04  147   * @access: IB_ACCESS_xxx flags for memory being pinned
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  148   * @peer_mem_flags: IB_PEER_MEM_xxx flags for memory being used
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier    2007-0=
3-04  149   */
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  150  static struct ib_umem *__ib_umem_get(struct ib_device *device,
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  151  				    unsigned long addr, size_t size, int access,
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  152  				    unsigned long peer_mem_flags)
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  153  {
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier    2007-0=
3-04  154  	struct ib_umem *umem;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  155  	struct page **page_list;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  156  	unsigned long lock_limit;
c6ce580716372d drivers/infiniband/core/umem.c       Doug Ledford     2018-0=
9-21  157  	unsigned long new_pinned;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  158  	unsigned long cur_base;
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik 2020-0=
2-12  159  	unsigned long dma_attr =3D 0;
d4b4dd1b9706e4 drivers/infiniband/core/umem.c       Jason Gunthorpe  2018-0=
9-16  160  	struct mm_struct *mm;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  161  	unsigned long npages;
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  162  	int pinned, ret;
768ae309a96103 drivers/infiniband/core/umem.c       Lorenzo Stoakes  2016-1=
0-13  163  	unsigned int gup_flags =3D FOLL_WRITE;
cb9fbc5c37b69a drivers/infiniband/core/umem.c       Arthur Kepner    2008-0=
4-29  164  =

8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel  2015-0=
3-18  165  	/*
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel  2015-0=
3-18  166  	 * If the combination of the addr and size requested for this m=
emory
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel  2015-0=
3-18  167  	 * region causes an integer overflow, return error.
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel  2015-0=
3-18  168  	 */
66578b0b2f6965 drivers/infiniband/core/umem.c       Yann Droneaud    2015-0=
4-13  169  	if (((addr + size) < addr) ||
66578b0b2f6965 drivers/infiniband/core/umem.c       Yann Droneaud    2015-0=
4-13  170  	    PAGE_ALIGN(addr + size) < (addr + size))
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel  2015-0=
3-18  171  		return ERR_PTR(-EINVAL);
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel  2015-0=
3-18  172  =

eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  173  	if (!can_do_mlock())
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier    2007-0=
3-04  174  		return ERR_PTR(-EPERM);
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  175  =

261dc53f8ee037 drivers/infiniband/core/umem.c       Jason Gunthorpe  2019-0=
8-19  176  	if (access & IB_ACCESS_ON_DEMAND)
261dc53f8ee037 drivers/infiniband/core/umem.c       Jason Gunthorpe  2019-0=
8-19  177  		return ERR_PTR(-EOPNOTSUPP);
261dc53f8ee037 drivers/infiniband/core/umem.c       Jason Gunthorpe  2019-0=
8-19  178  =

41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe  2018-0=
9-16  179  	umem =3D kzalloc(sizeof(*umem), GFP_KERNEL);
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe  2018-0=
9-16  180  	if (!umem)
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe  2018-0=
9-16  181  		return ERR_PTR(-ENOMEM);
c320e527e15483 drivers/infiniband/core/umem.c       Moni Shoua       2020-0=
1-15  182  	umem->ibdev      =3D device;
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier    2007-0=
3-04  183  	umem->length     =3D size;
406f9e5fa9a7a6 drivers/infiniband/core/umem.c       Haggai Eran      2014-1=
2-11  184  	umem->address    =3D addr;
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-0=
9-04  185  	/*
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-0=
9-04  186  	 * Drivers should call ib_umem_find_best_pgsz() to set the iova
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-0=
9-04  187  	 * correctly.
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-0=
9-04  188  	 */
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-0=
9-04  189  	umem->iova =3D addr;
08bb558ac11ab9 drivers/infiniband/core/umem.c       Jack Morgenstein 2018-0=
5-23  190  	umem->writable   =3D ib_access_writable(access);
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe  2018-0=
9-16  191  	umem->owning_mm =3D mm =3D current->mm;
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe  2018-0=
9-16  192  	mmgrab(mm);
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  193  =

f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier    2007-0=
3-04  194  	page_list =3D (struct page **) __get_free_page(GFP_KERNEL);
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier    2007-0=
3-04  195  	if (!page_list) {
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky  2018-0=
7-10  196  		ret =3D -ENOMEM;
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe  2018-0=
9-16  197  		goto umem_kfree;
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier    2007-0=
3-04  198  	}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  199  =

406f9e5fa9a7a6 drivers/infiniband/core/umem.c       Haggai Eran      2014-1=
2-11  200  	npages =3D ib_umem_num_pages(umem);
3312d1c6bdee6a drivers/infiniband/core/umem.c       Doug Ledford     2018-0=
9-21 @201  	if (npages =3D=3D 0 || npages > UINT_MAX) {
3312d1c6bdee6a drivers/infiniband/core/umem.c       Doug Ledford     2018-0=
9-21  202  		ret =3D -EINVAL;
3312d1c6bdee6a drivers/infiniband/core/umem.c       Doug Ledford     2018-0=
9-21  203  		goto out;
3312d1c6bdee6a drivers/infiniband/core/umem.c       Doug Ledford     2018-0=
9-21  204  	}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  205  =

ccbe9f0b11b137 drivers/infiniband/core/umem.c       Jiri Slaby       2010-0=
2-11  206  	lock_limit =3D rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  207  =

b95df5e3e45914 drivers/infiniband/core/umem.c       Davidlohr Bueso  2019-0=
2-06  208  	new_pinned =3D atomic64_add_return(npages, &mm->pinned_vm);
70f8a3ca68d3e1 drivers/infiniband/core/umem.c       Davidlohr Bueso  2019-0=
2-06  209  	if (new_pinned > lock_limit && !capable(CAP_IPC_LOCK)) {
b95df5e3e45914 drivers/infiniband/core/umem.c       Davidlohr Bueso  2019-0=
2-06  210  		atomic64_sub(npages, &mm->pinned_vm);
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  211  		ret =3D -ENOMEM;
c6ce580716372d drivers/infiniband/core/umem.c       Doug Ledford     2018-0=
9-21  212  		goto out;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  213  	}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  214  =

f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier    2007-0=
3-04  215  	cur_base =3D addr & PAGE_MASK;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  216  =

768ae309a96103 drivers/infiniband/core/umem.c       Lorenzo Stoakes  2016-1=
0-13  217  	if (!umem->writable)
768ae309a96103 drivers/infiniband/core/umem.c       Lorenzo Stoakes  2016-1=
0-13  218  		gup_flags |=3D FOLL_FORCE;
768ae309a96103 drivers/infiniband/core/umem.c       Lorenzo Stoakes  2016-1=
0-13  219  =

eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  220  	while (npages) {
928da37a229f34 drivers/infiniband/core/umem.c       Eric Dumazet     2020-0=
7-29  221  		cond_resched();
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  222  		pinned =3D pin_user_pages_fast(cur_base,
8079ffa0e18baa drivers/infiniband/core/umem.c       Roland Dreier    2008-0=
6-06  223  					  min_t(unsigned long, npages,
4789fcdd140952 drivers/infiniband/core/umem.c       John Hubbard     2020-0=
1-30  224  						PAGE_SIZE /
4789fcdd140952 drivers/infiniband/core/umem.c       John Hubbard     2020-0=
1-30  225  						sizeof(struct page *)),
4789fcdd140952 drivers/infiniband/core/umem.c       John Hubbard     2020-0=
1-30  226  					  gup_flags | FOLL_LONGTERM, page_list);
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  227  		if (pinned < 0) {
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  228  			ret =3D pinned;
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky  2018-0=
7-10  229  			goto umem_release;
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  230  		}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  231  =

3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  232  		cur_base +=3D pinned * PAGE_SIZE;
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  233  		npages -=3D pinned;
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  234  		ret =3D sg_alloc_append_table_from_pages(
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  235  			&umem->sgt_append, page_list, pinned, 0,
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  236  			pinned << PAGE_SHIFT, ib_dma_max_seg_size(device),
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  237  			npages, GFP_KERNEL);
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  238  		if (ret) {
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  239  			unpin_user_pages_dirty_lock(page_list, pinned, 0);
0c16d9635e3a51 drivers/infiniband/core/umem.c       Maor Gottlieb    2020-1=
0-04  240  			goto umem_release;
0c16d9635e3a51 drivers/infiniband/core/umem.c       Maor Gottlieb    2020-1=
0-04  241  		}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  242  	}
d10bcf947a3ea2 drivers/infiniband/core/umem.c       Shiraz Saleem    2019-0=
4-02  243  =

f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik 2020-0=
2-12  244  	if (access & IB_ACCESS_RELAXED_ORDERING)
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik 2020-0=
2-12  245  		dma_attr |=3D DMA_ATTR_WEAK_ORDERING;
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik 2020-0=
2-12  246  =

79fbd3e1241cea drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  247  	ret =3D ib_dma_map_sgtable_attrs(device, &umem->sgt_append.sgt,
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik 2020-0=
2-12  248  				       DMA_BIDIRECTIONAL, dma_attr);
79fbd3e1241cea drivers/infiniband/core/umem.c       Maor Gottlieb    2021-0=
8-24  249  	if (ret)
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky  2018-0=
7-10  250  		goto umem_release;
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky  2018-0=
7-10  251  	goto out;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  252  =

1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky  2018-0=
7-10  253  umem_release:
c320e527e15483 drivers/infiniband/core/umem.c       Moni Shoua       2020-0=
1-15  254  	__ib_umem_release(device, umem, 0);
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  255  =

bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  256  	/*
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  257  	 * If the address belongs to peer memory client, then the first
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  258  	 * call to get_user_pages will fail. In this case, try to get
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  259  	 * these pages from the peers.
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  260  	 */
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  261  	//FIXME: this placement is horrible
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  262  	if (ret < 0 && peer_mem_flags & IB_PEER_MEM_ALLOW) {
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  263  		struct ib_umem *new_umem;
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  264  =

bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  265  		new_umem =3D ib_peer_umem_get(umem, ret, peer_mem_flags);
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  266  		if (IS_ERR(new_umem)) {
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  267  			ret =3D PTR_ERR(new_umem);
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  268  			goto vma;
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  269  		}
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  270  		umem =3D new_umem;
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  271  		ret =3D 0;
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  272  		goto out;
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  273  	}
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  274  vma:
70f8a3ca68d3e1 drivers/infiniband/core/umem.c       Davidlohr Bueso  2019-0=
2-06  275  	atomic64_sub(ib_umem_num_pages(umem), &mm->pinned_vm);
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky  2018-0=
7-10  276  out:
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  277  	free_page((unsigned long) page_list);
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky  2018-0=
7-10  278  umem_kfree:
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe  2018-0=
9-16  279  	if (ret) {
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe  2018-0=
9-16  280  		mmdrop(umem->owning_mm);
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky  2018-0=
7-10  281  		kfree(umem);
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe  2018-0=
9-16  282  	}
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky  2018-0=
7-10  283  	return ret ? ERR_PTR(ret) : umem;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier    2005-0=
7-07  284  }
bc623e55390810 drivers/infiniband/core/umem.c       Jason Gunthorpe  2020-1=
1-26  285  =


:::::: The code at line 201 was first introduced by commit
:::::: 3312d1c6bdee6aa912c099c0ac0662d197c52842 RDMA/umem: Minor optimizati=
ons

:::::: TO: Doug Ledford <dledford@redhat.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2687296199393008804==--

