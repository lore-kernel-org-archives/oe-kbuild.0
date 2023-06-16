Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9773DDC9
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jun 2023 10:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686910958; x=1718446958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c0eQK69Ukun/++meIaSrORsRuV2qdCDENvXqK9zEvqA=;
  b=ZaRZJbUepwq+bpe1M0pFB+ZToqBbFF3VF/QMeIZh1oIb0OlSAbLiCv7k
   SdXJApBmg/aAXUbfvkayvFsXiyYFWJwIzV0pg1KeFFrXJHJnWHLAkZhBs
   cVBkdaPuHOT37CAy7wpj+t2D/SBEd98n3lmqjOmwrJ6h+g/y+EUHLSJMq
   /7kplRNeaUPKJ4QEl3FLT8bn177J+rXoOf8pgFkA3K6MsGVoPek13ydg4
   faShTR6oeBykkaAzXO0o88AXqawUnFb+koOewUZa93GL8jJL0HqsxirB3
   CJOwL1fPHBUOIU9etDvv5/HjN8QBaewN1A0bUCwwf6WyWVb6lei/QnuWp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="445561718"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="445561718"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 03:22:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="959566293"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="959566293"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Jun 2023 03:22:21 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qA6az-00017g-1I;
	Fri, 16 Jun 2023 10:22:21 +0000
Date: Fri, 16 Jun 2023 18:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [leon-rdma:rdma-next 27/30] drivers/infiniband/core/umem.c:201
 __ib_umem_get() warn: impossible condition '(npages > (~0)) => (0-u32max >
 u32max)'
Message-ID: <202306161835.rvw7Z4lD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>
CC: Yishai Hadas <yishaih@mellanox.com>
CC: Feras Daoud <ferasda@mellanox.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   66599669bb0b008924b92d96a9b55f55f282e997
commit: 5c21fecb72507422f3cd044a81fca0429a2433f6 [27/30] RDMA/core: Introduce peer memory interface
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: microblaze-randconfig-m041-20230614 (https://download.01.org/0day-ci/archive/20230616/202306161835.rvw7Z4lD-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306161835.rvw7Z4lD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306161835.rvw7Z4lD-lkp@intel.com/

smatch warnings:
drivers/infiniband/core/umem.c:201 __ib_umem_get() warn: impossible condition '(npages > (~0)) => (0-u32max > u32max)'

vim +201 drivers/infiniband/core/umem.c

4a35339958f16d drivers/infiniband/core/umem.c       Shiraz Saleem     2019-05-06  140  
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  141  /**
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  142   * __ib_umem_get - Pin and DMA map userspace memory.
8ada2c1c0c1d75 drivers/infiniband/core/umem.c       Shachar Raindel   2014-12-11  143   *
c320e527e15483 drivers/infiniband/core/umem.c       Moni Shoua        2020-01-15  144   * @device: IB device to connect UMEM
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  145   * @addr: userspace virtual address to start at
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  146   * @size: length of region to pin
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  147   * @access: IB_ACCESS_xxx flags for memory being pinned
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  148   * @peer_mem_flags: IB_PEER_MEM_xxx flags for memory being used
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  149   */
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  150  static struct ib_umem *__ib_umem_get(struct ib_device *device,
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  151  				    unsigned long addr, size_t size, int access,
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  152  				    unsigned long peer_mem_flags)
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  153  {
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  154  	struct ib_umem *umem;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  155  	struct page **page_list;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  156  	unsigned long lock_limit;
c6ce580716372d drivers/infiniband/core/umem.c       Doug Ledford      2018-09-21  157  	unsigned long new_pinned;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  158  	unsigned long cur_base;
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik  2020-02-12  159  	unsigned long dma_attr = 0;
d4b4dd1b9706e4 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  160  	struct mm_struct *mm;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  161  	unsigned long npages;
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  162  	int pinned, ret;
b40656aa7d559a drivers/infiniband/core/umem.c       David Hildenbrand 2022-11-16  163  	unsigned int gup_flags = FOLL_LONGTERM;
cb9fbc5c37b69a drivers/infiniband/core/umem.c       Arthur Kepner     2008-04-29  164  
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel   2015-03-18  165  	/*
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel   2015-03-18  166  	 * If the combination of the addr and size requested for this memory
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel   2015-03-18  167  	 * region causes an integer overflow, return error.
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel   2015-03-18  168  	 */
66578b0b2f6965 drivers/infiniband/core/umem.c       Yann Droneaud     2015-04-13  169  	if (((addr + size) < addr) ||
66578b0b2f6965 drivers/infiniband/core/umem.c       Yann Droneaud     2015-04-13  170  	    PAGE_ALIGN(addr + size) < (addr + size))
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel   2015-03-18  171  		return ERR_PTR(-EINVAL);
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel   2015-03-18  172  
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  173  	if (!can_do_mlock())
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  174  		return ERR_PTR(-EPERM);
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  175  
261dc53f8ee037 drivers/infiniband/core/umem.c       Jason Gunthorpe   2019-08-19  176  	if (access & IB_ACCESS_ON_DEMAND)
261dc53f8ee037 drivers/infiniband/core/umem.c       Jason Gunthorpe   2019-08-19  177  		return ERR_PTR(-EOPNOTSUPP);
261dc53f8ee037 drivers/infiniband/core/umem.c       Jason Gunthorpe   2019-08-19  178  
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  179  	umem = kzalloc(sizeof(*umem), GFP_KERNEL);
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  180  	if (!umem)
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  181  		return ERR_PTR(-ENOMEM);
c320e527e15483 drivers/infiniband/core/umem.c       Moni Shoua        2020-01-15  182  	umem->ibdev      = device;
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  183  	umem->length     = size;
406f9e5fa9a7a6 drivers/infiniband/core/umem.c       Haggai Eran       2014-12-11  184  	umem->address    = addr;
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-09-04  185  	/*
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-09-04  186  	 * Drivers should call ib_umem_find_best_pgsz() to set the iova
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-09-04  187  	 * correctly.
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-09-04  188  	 */
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-09-04  189  	umem->iova = addr;
08bb558ac11ab9 drivers/infiniband/core/umem.c       Jack Morgenstein  2018-05-23  190  	umem->writable   = ib_access_writable(access);
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  191  	umem->owning_mm = mm = current->mm;
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  192  	mmgrab(mm);
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  193  
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  194  	page_list = (struct page **) __get_free_page(GFP_KERNEL);
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  195  	if (!page_list) {
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  196  		ret = -ENOMEM;
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  197  		goto umem_kfree;
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  198  	}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  199  
406f9e5fa9a7a6 drivers/infiniband/core/umem.c       Haggai Eran       2014-12-11  200  	npages = ib_umem_num_pages(umem);
3312d1c6bdee6a drivers/infiniband/core/umem.c       Doug Ledford      2018-09-21 @201  	if (npages == 0 || npages > UINT_MAX) {
3312d1c6bdee6a drivers/infiniband/core/umem.c       Doug Ledford      2018-09-21  202  		ret = -EINVAL;
3312d1c6bdee6a drivers/infiniband/core/umem.c       Doug Ledford      2018-09-21  203  		goto out;
3312d1c6bdee6a drivers/infiniband/core/umem.c       Doug Ledford      2018-09-21  204  	}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  205  
ccbe9f0b11b137 drivers/infiniband/core/umem.c       Jiri Slaby        2010-02-11  206  	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  207  
b95df5e3e45914 drivers/infiniband/core/umem.c       Davidlohr Bueso   2019-02-06  208  	new_pinned = atomic64_add_return(npages, &mm->pinned_vm);
70f8a3ca68d3e1 drivers/infiniband/core/umem.c       Davidlohr Bueso   2019-02-06  209  	if (new_pinned > lock_limit && !capable(CAP_IPC_LOCK)) {
b95df5e3e45914 drivers/infiniband/core/umem.c       Davidlohr Bueso   2019-02-06  210  		atomic64_sub(npages, &mm->pinned_vm);
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  211  		ret = -ENOMEM;
c6ce580716372d drivers/infiniband/core/umem.c       Doug Ledford      2018-09-21  212  		goto out;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  213  	}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  214  
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  215  	cur_base = addr & PAGE_MASK;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  216  
b40656aa7d559a drivers/infiniband/core/umem.c       David Hildenbrand 2022-11-16  217  	if (umem->writable)
b40656aa7d559a drivers/infiniband/core/umem.c       David Hildenbrand 2022-11-16  218  		gup_flags |= FOLL_WRITE;
768ae309a96103 drivers/infiniband/core/umem.c       Lorenzo Stoakes   2016-10-13  219  
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  220  	while (npages) {
928da37a229f34 drivers/infiniband/core/umem.c       Eric Dumazet      2020-07-29  221  		cond_resched();
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  222  		pinned = pin_user_pages_fast(cur_base,
8079ffa0e18baa drivers/infiniband/core/umem.c       Roland Dreier     2008-06-06  223  					  min_t(unsigned long, npages,
4789fcdd140952 drivers/infiniband/core/umem.c       John Hubbard      2020-01-30  224  						PAGE_SIZE /
4789fcdd140952 drivers/infiniband/core/umem.c       John Hubbard      2020-01-30  225  						sizeof(struct page *)),
b40656aa7d559a drivers/infiniband/core/umem.c       David Hildenbrand 2022-11-16  226  					  gup_flags, page_list);
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  227  		if (pinned < 0) {
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  228  			ret = pinned;
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  229  			goto umem_release;
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  230  		}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  231  
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  232  		cur_base += pinned * PAGE_SIZE;
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  233  		npages -= pinned;
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  234  		ret = sg_alloc_append_table_from_pages(
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  235  			&umem->sgt_append, page_list, pinned, 0,
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  236  			pinned << PAGE_SHIFT, ib_dma_max_seg_size(device),
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  237  			npages, GFP_KERNEL);
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  238  		if (ret) {
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  239  			unpin_user_pages_dirty_lock(page_list, pinned, 0);
0c16d9635e3a51 drivers/infiniband/core/umem.c       Maor Gottlieb     2020-10-04  240  			goto umem_release;
0c16d9635e3a51 drivers/infiniband/core/umem.c       Maor Gottlieb     2020-10-04  241  		}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  242  	}
d10bcf947a3ea2 drivers/infiniband/core/umem.c       Shiraz Saleem     2019-04-02  243  
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik  2020-02-12  244  	if (access & IB_ACCESS_RELAXED_ORDERING)
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik  2020-02-12  245  		dma_attr |= DMA_ATTR_WEAK_ORDERING;
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik  2020-02-12  246  
79fbd3e1241cea drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  247  	ret = ib_dma_map_sgtable_attrs(device, &umem->sgt_append.sgt,
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik  2020-02-12  248  				       DMA_BIDIRECTIONAL, dma_attr);
79fbd3e1241cea drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  249  	if (ret)
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  250  		goto umem_release;
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  251  	goto out;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  252  
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  253  umem_release:
c320e527e15483 drivers/infiniband/core/umem.c       Moni Shoua        2020-01-15  254  	__ib_umem_release(device, umem, 0);
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  255  
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  256  	/*
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  257  	 * If the address belongs to peer memory client, then the first
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  258  	 * call to get_user_pages will fail. In this case, try to get
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  259  	 * these pages from the peers.
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  260  	 */
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  261  	//FIXME: this placement is horrible
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  262  	if (ret < 0 && peer_mem_flags & IB_PEER_MEM_ALLOW) {
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  263  		struct ib_umem *new_umem;
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  264  
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  265  		new_umem = ib_peer_umem_get(umem, ret, peer_mem_flags);
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  266  		if (IS_ERR(new_umem)) {
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  267  			ret = PTR_ERR(new_umem);
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  268  			goto vma;
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  269  		}
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  270  		umem = new_umem;
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  271  		ret = 0;
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  272  		goto out;
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  273  	}
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  274  vma:
70f8a3ca68d3e1 drivers/infiniband/core/umem.c       Davidlohr Bueso   2019-02-06  275  	atomic64_sub(ib_umem_num_pages(umem), &mm->pinned_vm);
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  276  out:
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  277  	free_page((unsigned long) page_list);
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  278  umem_kfree:
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  279  	if (ret) {
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  280  		mmdrop(umem->owning_mm);
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  281  		kfree(umem);
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  282  	}
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  283  	return ret ? ERR_PTR(ret) : umem;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  284  }
5c21fecb725074 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  285  

:::::: The code at line 201 was first introduced by commit
:::::: 3312d1c6bdee6aa912c099c0ac0662d197c52842 RDMA/umem: Minor optimizations

:::::: TO: Doug Ledford <dledford@redhat.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
