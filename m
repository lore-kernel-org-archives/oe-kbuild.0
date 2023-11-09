Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA75225D7
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Nov 2023 17:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V/+MUvKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699551552; x=1731087552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v+gk6p2v9fS0t8SrNHtQxXN2oSCZ1SWbEVxSddt/JIA=;
  b=V/+MUvKnNprdtu4oeOpB1v3YEuzPtsSyQKRe7iQkicwNheY9xKVMZVOP
   Gg5l2f907Jb/FukLXh5EFH4RkHf+pj30ykU3A7Gy5LGR45mK60Hs2Tlsn
   TkQ+CaJ3e8yz+IWHDF3yj099KMghIkaZ9G2g+SVeDfry4FHUhdDi1fe70
   70eqT8Kp8eNGJa5a2xwAqOHBZMSeNBTo9QbiYx7wNZNOYmbWqdyX4rTti
   wRCuvbjWEAKlBsPP9clzl5C/UWFRy8+uw2CDHFLic8fsQLKMD7p+OODHE
   zXaDAvVjtgHkmAbdYZkXCqWgkXSGsiqQYztU2sz739VzQPclDr/dsWCqX
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="380427031"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="380427031"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 09:39:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="936928225"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="936928225"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 09 Nov 2023 09:39:09 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r18zj-0008zi-0w;
	Thu, 09 Nov 2023 17:39:07 +0000
Date: Fri, 10 Nov 2023 01:26:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [leon-rdma:rdma-next 2/7] drivers/infiniband/core/umem.c:202
 __ib_umem_get() warn: impossible condition '(npages > (~0)) => (0-u32max >
 u32max)'
Message-ID: <202311100042.MVBKGnlu-lkp@intel.com>
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
head:   824e6be8b428c3b4fa41a80e606133381f0436fe
commit: 7ad3383d50e54ba612d36588b5cb34c8ce66cf1e [2/7] RDMA/core: Introduce peer memory interface
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20231107 (https://download.01.org/0day-ci/archive/20231110/202311100042.MVBKGnlu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231110/202311100042.MVBKGnlu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311100042.MVBKGnlu-lkp@intel.com/

smatch warnings:
drivers/infiniband/core/umem.c:202 __ib_umem_get() warn: impossible condition '(npages > (~0)) => (0-u32max > u32max)'

vim +202 drivers/infiniband/core/umem.c

4a35339958f16d drivers/infiniband/core/umem.c       Shiraz Saleem     2019-05-06  141  
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  142  /**
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  143   * __ib_umem_get - Pin and DMA map userspace memory.
8ada2c1c0c1d75 drivers/infiniband/core/umem.c       Shachar Raindel   2014-12-11  144   *
c320e527e15483 drivers/infiniband/core/umem.c       Moni Shoua        2020-01-15  145   * @device: IB device to connect UMEM
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  146   * @addr: userspace virtual address to start at
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  147   * @size: length of region to pin
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  148   * @access: IB_ACCESS_xxx flags for memory being pinned
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  149   * @peer_mem_flags: IB_PEER_MEM_xxx flags for memory being used
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  150   */
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  151  static struct ib_umem *__ib_umem_get(struct ib_device *device,
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  152  				    unsigned long addr, size_t size, int access,
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  153  				    unsigned long peer_mem_flags)
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  154  {
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  155  	struct ib_umem *umem;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  156  	struct page **page_list;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  157  	unsigned long lock_limit;
c6ce580716372d drivers/infiniband/core/umem.c       Doug Ledford      2018-09-21  158  	unsigned long new_pinned;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  159  	unsigned long cur_base;
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik  2020-02-12  160  	unsigned long dma_attr = 0;
d4b4dd1b9706e4 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  161  	struct mm_struct *mm;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  162  	unsigned long npages;
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  163  	int pinned, ret;
b40656aa7d559a drivers/infiniband/core/umem.c       David Hildenbrand 2022-11-16  164  	unsigned int gup_flags = FOLL_LONGTERM;
cb9fbc5c37b69a drivers/infiniband/core/umem.c       Arthur Kepner     2008-04-29  165  
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel   2015-03-18  166  	/*
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel   2015-03-18  167  	 * If the combination of the addr and size requested for this memory
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel   2015-03-18  168  	 * region causes an integer overflow, return error.
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel   2015-03-18  169  	 */
66578b0b2f6965 drivers/infiniband/core/umem.c       Yann Droneaud     2015-04-13  170  	if (((addr + size) < addr) ||
66578b0b2f6965 drivers/infiniband/core/umem.c       Yann Droneaud     2015-04-13  171  	    PAGE_ALIGN(addr + size) < (addr + size))
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel   2015-03-18  172  		return ERR_PTR(-EINVAL);
8494057ab5e40d drivers/infiniband/core/umem.c       Shachar Raindel   2015-03-18  173  
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  174  	if (!can_do_mlock())
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  175  		return ERR_PTR(-EPERM);
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  176  
261dc53f8ee037 drivers/infiniband/core/umem.c       Jason Gunthorpe   2019-08-19  177  	if (access & IB_ACCESS_ON_DEMAND)
261dc53f8ee037 drivers/infiniband/core/umem.c       Jason Gunthorpe   2019-08-19  178  		return ERR_PTR(-EOPNOTSUPP);
261dc53f8ee037 drivers/infiniband/core/umem.c       Jason Gunthorpe   2019-08-19  179  
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  180  	umem = kzalloc(sizeof(*umem), GFP_KERNEL);
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  181  	if (!umem)
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  182  		return ERR_PTR(-ENOMEM);
c320e527e15483 drivers/infiniband/core/umem.c       Moni Shoua        2020-01-15  183  	umem->ibdev      = device;
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  184  	umem->length     = size;
406f9e5fa9a7a6 drivers/infiniband/core/umem.c       Haggai Eran       2014-12-11  185  	umem->address    = addr;
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-09-04  186  	/*
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-09-04  187  	 * Drivers should call ib_umem_find_best_pgsz() to set the iova
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-09-04  188  	 * correctly.
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-09-04  189  	 */
a665aca89a4111 drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-09-04  190  	umem->iova = addr;
08bb558ac11ab9 drivers/infiniband/core/umem.c       Jack Morgenstein  2018-05-23  191  	umem->writable   = ib_access_writable(access);
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  192  	umem->owning_mm = mm = current->mm;
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  193  	mmgrab(mm);
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  194  
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  195  	page_list = (struct page **) __get_free_page(GFP_KERNEL);
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  196  	if (!page_list) {
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  197  		ret = -ENOMEM;
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  198  		goto umem_kfree;
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  199  	}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  200  
406f9e5fa9a7a6 drivers/infiniband/core/umem.c       Haggai Eran       2014-12-11  201  	npages = ib_umem_num_pages(umem);
3312d1c6bdee6a drivers/infiniband/core/umem.c       Doug Ledford      2018-09-21 @202  	if (npages == 0 || npages > UINT_MAX) {
3312d1c6bdee6a drivers/infiniband/core/umem.c       Doug Ledford      2018-09-21  203  		ret = -EINVAL;
3312d1c6bdee6a drivers/infiniband/core/umem.c       Doug Ledford      2018-09-21  204  		goto out;
3312d1c6bdee6a drivers/infiniband/core/umem.c       Doug Ledford      2018-09-21  205  	}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  206  
ccbe9f0b11b137 drivers/infiniband/core/umem.c       Jiri Slaby        2010-02-11  207  	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  208  
b95df5e3e45914 drivers/infiniband/core/umem.c       Davidlohr Bueso   2019-02-06  209  	new_pinned = atomic64_add_return(npages, &mm->pinned_vm);
70f8a3ca68d3e1 drivers/infiniband/core/umem.c       Davidlohr Bueso   2019-02-06  210  	if (new_pinned > lock_limit && !capable(CAP_IPC_LOCK)) {
b95df5e3e45914 drivers/infiniband/core/umem.c       Davidlohr Bueso   2019-02-06  211  		atomic64_sub(npages, &mm->pinned_vm);
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  212  		ret = -ENOMEM;
c6ce580716372d drivers/infiniband/core/umem.c       Doug Ledford      2018-09-21  213  		goto out;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  214  	}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  215  
f7c6a7b5d59980 drivers/infiniband/core/umem.c       Roland Dreier     2007-03-04  216  	cur_base = addr & PAGE_MASK;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  217  
b40656aa7d559a drivers/infiniband/core/umem.c       David Hildenbrand 2022-11-16  218  	if (umem->writable)
b40656aa7d559a drivers/infiniband/core/umem.c       David Hildenbrand 2022-11-16  219  		gup_flags |= FOLL_WRITE;
768ae309a96103 drivers/infiniband/core/umem.c       Lorenzo Stoakes   2016-10-13  220  
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  221  	while (npages) {
928da37a229f34 drivers/infiniband/core/umem.c       Eric Dumazet      2020-07-29  222  		cond_resched();
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  223  		pinned = pin_user_pages_fast(cur_base,
8079ffa0e18baa drivers/infiniband/core/umem.c       Roland Dreier     2008-06-06  224  					  min_t(unsigned long, npages,
4789fcdd140952 drivers/infiniband/core/umem.c       John Hubbard      2020-01-30  225  						PAGE_SIZE /
4789fcdd140952 drivers/infiniband/core/umem.c       John Hubbard      2020-01-30  226  						sizeof(struct page *)),
b40656aa7d559a drivers/infiniband/core/umem.c       David Hildenbrand 2022-11-16  227  					  gup_flags, page_list);
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  228  		if (pinned < 0) {
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  229  			ret = pinned;
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  230  			goto umem_release;
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  231  		}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  232  
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  233  		cur_base += pinned * PAGE_SIZE;
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  234  		npages -= pinned;
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  235  		ret = sg_alloc_append_table_from_pages(
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  236  			&umem->sgt_append, page_list, pinned, 0,
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  237  			pinned << PAGE_SHIFT, ib_dma_max_seg_size(device),
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  238  			npages, GFP_KERNEL);
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  239  		if (ret) {
3e302dbc6774a2 drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  240  			unpin_user_pages_dirty_lock(page_list, pinned, 0);
0c16d9635e3a51 drivers/infiniband/core/umem.c       Maor Gottlieb     2020-10-04  241  			goto umem_release;
0c16d9635e3a51 drivers/infiniband/core/umem.c       Maor Gottlieb     2020-10-04  242  		}
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  243  	}
d10bcf947a3ea2 drivers/infiniband/core/umem.c       Shiraz Saleem     2019-04-02  244  
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik  2020-02-12  245  	if (access & IB_ACCESS_RELAXED_ORDERING)
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik  2020-02-12  246  		dma_attr |= DMA_ATTR_WEAK_ORDERING;
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik  2020-02-12  247  
79fbd3e1241cea drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  248  	ret = ib_dma_map_sgtable_attrs(device, &umem->sgt_append.sgt,
f03d9fadfe13a7 drivers/infiniband/core/umem.c       Michael Guralnik  2020-02-12  249  				       DMA_BIDIRECTIONAL, dma_attr);
79fbd3e1241cea drivers/infiniband/core/umem.c       Maor Gottlieb     2021-08-24  250  	if (ret)
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  251  		goto umem_release;
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  252  	goto out;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  253  
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  254  umem_release:
c320e527e15483 drivers/infiniband/core/umem.c       Moni Shoua        2020-01-15  255  	__ib_umem_release(device, umem, 0);
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  256  
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  257  	/*
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  258  	 * If the address belongs to peer memory client, then the first
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  259  	 * call to get_user_pages will fail. In this case, try to get
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  260  	 * these pages from the peers.
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  261  	 */
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  262  	//FIXME: this placement is horrible
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  263  	if (ret < 0 && peer_mem_flags & IB_PEER_MEM_ALLOW) {
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  264  		struct ib_umem *new_umem;
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  265  
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  266  		new_umem = ib_peer_umem_get(umem, ret, peer_mem_flags);
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  267  		if (IS_ERR(new_umem)) {
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  268  			ret = PTR_ERR(new_umem);
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  269  			goto vma;
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  270  		}
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  271  		umem = new_umem;
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  272  		ret = 0;
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  273  		goto out;
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  274  	}
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  275  vma:
70f8a3ca68d3e1 drivers/infiniband/core/umem.c       Davidlohr Bueso   2019-02-06  276  	atomic64_sub(ib_umem_num_pages(umem), &mm->pinned_vm);
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  277  out:
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  278  	free_page((unsigned long) page_list);
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  279  umem_kfree:
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  280  	if (ret) {
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  281  		mmdrop(umem->owning_mm);
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  282  		kfree(umem);
41b4deeaa123e6 drivers/infiniband/core/umem.c       Jason Gunthorpe   2018-09-16  283  	}
1215cb7c88ec88 drivers/infiniband/core/umem.c       Leon Romanovsky   2018-07-10  284  	return ret ? ERR_PTR(ret) : umem;
eb8ffbfed50e79 drivers/infiniband/core/uverbs_mem.c Roland Dreier     2005-07-07  285  }
7ad3383d50e54b drivers/infiniband/core/umem.c       Jason Gunthorpe   2020-11-26  286  

:::::: The code at line 202 was first introduced by commit
:::::: 3312d1c6bdee6aa912c099c0ac0662d197c52842 RDMA/umem: Minor optimizations

:::::: TO: Doug Ledford <dledford@redhat.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
