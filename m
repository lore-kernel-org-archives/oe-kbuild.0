Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A7A134D3
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Aug 2023 06:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692339457; x=1723875457;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIGYS+YgHYtde4XrO/524LRNgKz5YSDRknF4bT+Vruw=;
  b=LCpNySCMxXnvfzguAE/jlP7ETTAYN0wEZ1P4/XJmK2tNGfLzD6QTMK+X
   sWsLC9PrRwIcA+zyMCi86hToFUu9IrpEJVg/lcEKX7nK6PJdMn2QVCA8L
   9+Si7l3qiJ2LKZkFWjPN52K1JNke2VQ7kdJEpLcBEp5TpLyr3E/D8EA2A
   W4fSrhABY3UkMIoEPdlBdVe5dGf/bG3XlqrHzDdNZn7bGXKPs/EZGvWWP
   LPHAtxYW1d7KrrXjeTW1YiLnuUzr0pTgUeSkviVOHn002rEjXaTZndgC1
   11sy9/Ae6698/6/ixw/Jm/FtvS3NRO5b3JxgakfmvUIL6kLpI8fM2OlWp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363185489"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="363185489"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 23:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="908740764"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="908740764"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 17 Aug 2023 23:17:34 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWsmG-0002A1-0o;
	Fri, 18 Aug 2023 06:16:29 +0000
Date: Fri, 18 Aug 2023 14:11:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 2/2] udmabuf: Add back support for mapping hugetlb
 pages (v3)
Message-ID: <202308181326.iJ2AxOVj-lkp@intel.com>
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
In-Reply-To: <20230817064623.3424348-3-vivek.kasireddy@intel.com>
References: <20230817064623.3424348-3-vivek.kasireddy@intel.com>
TO: Vivek Kasireddy <vivek.kasireddy@intel.com>
TO: dri-devel@lists.freedesktop.org
TO: linux-mm@kvack.org
CC: Dongwon Kim <dongwon.kim@intel.com>
CC: David Hildenbrand <david@redhat.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Hugh Dickins <hughd@google.com>
CC: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: Peter Xu <peterx@redhat.com>
CC: Gerd Hoffmann <kraxel@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Junxiao Chang <junxiao.chang@intel.com>
CC: Mike Kravetz <mike.kravetz@oracle.com>

Hi Vivek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.5-rc6 next-20230817]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/udmabuf-Use-vmf_insert_pfn-and-VM_PFNMAP-for-handling-mmap/20230817-150922
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230817064623.3424348-3-vivek.kasireddy%40intel.com
patch subject: [PATCH v3 2/2] udmabuf: Add back support for mapping hugetlb pages (v3)
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: i386-randconfig-m021-20230818 (https://download.01.org/0day-ci/archive/20230818/202308181326.iJ2AxOVj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181326.iJ2AxOVj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308181326.iJ2AxOVj-lkp@intel.com/

smatch warnings:
drivers/dma-buf/udmabuf.c:292 udmabuf_create() error: uninitialized symbol 'mapidx'.
drivers/dma-buf/udmabuf.c:301 udmabuf_create() error: uninitialized symbol 'chunkoff'.
drivers/dma-buf/udmabuf.c:302 udmabuf_create() error: uninitialized symbol 'maxchunks'.

vim +/mapidx +292 drivers/dma-buf/udmabuf.c

fbb0de79507819 Gerd Hoffmann       2018-08-27  213  
c1bbed66899726 Gurchetan Singh     2019-12-02  214  static long udmabuf_create(struct miscdevice *device,
c1bbed66899726 Gurchetan Singh     2019-12-02  215  			   struct udmabuf_create_list *head,
c1bbed66899726 Gurchetan Singh     2019-12-02  216  			   struct udmabuf_create_item *list)
fbb0de79507819 Gerd Hoffmann       2018-08-27  217  {
fbb0de79507819 Gerd Hoffmann       2018-08-27  218  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
fbb0de79507819 Gerd Hoffmann       2018-08-27  219  	struct file *memfd = NULL;
16c243e99d335e Vivek Kasireddy     2021-06-09  220  	struct address_space *mapping = NULL;
fbb0de79507819 Gerd Hoffmann       2018-08-27  221  	struct udmabuf *ubuf;
fbb0de79507819 Gerd Hoffmann       2018-08-27  222  	struct dma_buf *buf;
0d17455ca85ecb Gerd Hoffmann       2018-09-11  223  	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  224  	struct page *page, *hpage = NULL;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  225  	pgoff_t mapidx, chunkoff, maxchunks;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  226  	struct hstate *hpstate;
fbb0de79507819 Gerd Hoffmann       2018-08-27  227  	int seals, ret = -EINVAL;
fbb0de79507819 Gerd Hoffmann       2018-08-27  228  	u32 i, flags;
fbb0de79507819 Gerd Hoffmann       2018-08-27  229  
33f35429fc49c0 Gerd Hoffmann       2018-09-11  230  	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
fbb0de79507819 Gerd Hoffmann       2018-08-27  231  	if (!ubuf)
fbb0de79507819 Gerd Hoffmann       2018-08-27  232  		return -ENOMEM;
fbb0de79507819 Gerd Hoffmann       2018-08-27  233  
dc4716d75154b3 Gerd Hoffmann       2018-09-11  234  	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  235  	for (i = 0; i < head->count; i++) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  236  		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
0d17455ca85ecb Gerd Hoffmann       2018-09-11  237  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  238  		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
0d17455ca85ecb Gerd Hoffmann       2018-09-11  239  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  240  		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
dc4716d75154b3 Gerd Hoffmann       2018-09-11  241  		if (ubuf->pagecount > pglimit)
0d17455ca85ecb Gerd Hoffmann       2018-09-11  242  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  243  	}
2b6dd600dd7257 Pavel Skripkin      2021-12-30  244  
2b6dd600dd7257 Pavel Skripkin      2021-12-30  245  	if (!ubuf->pagecount)
2b6dd600dd7257 Pavel Skripkin      2021-12-30  246  		goto err;
2b6dd600dd7257 Pavel Skripkin      2021-12-30  247  
33f35429fc49c0 Gerd Hoffmann       2018-09-11  248  	ubuf->pages = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->pages),
fbb0de79507819 Gerd Hoffmann       2018-08-27  249  				    GFP_KERNEL);
fbb0de79507819 Gerd Hoffmann       2018-08-27  250  	if (!ubuf->pages) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  251  		ret = -ENOMEM;
0d17455ca85ecb Gerd Hoffmann       2018-09-11  252  		goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  253  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  254  
fbb0de79507819 Gerd Hoffmann       2018-08-27  255  	pgbuf = 0;
fbb0de79507819 Gerd Hoffmann       2018-08-27  256  	for (i = 0; i < head->count; i++) {
7a1c67d7809423 Gerd Hoffmann       2018-09-11  257  		ret = -EBADFD;
fbb0de79507819 Gerd Hoffmann       2018-08-27  258  		memfd = fget(list[i].memfd);
fbb0de79507819 Gerd Hoffmann       2018-08-27  259  		if (!memfd)
0d17455ca85ecb Gerd Hoffmann       2018-09-11  260  			goto err;
ff58105a47ede2 Al Viro             2022-08-20  261  		mapping = memfd->f_mapping;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  262  		if (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
0d17455ca85ecb Gerd Hoffmann       2018-09-11  263  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  264  		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
7a1c67d7809423 Gerd Hoffmann       2018-09-11  265  		if (seals == -EINVAL)
7a1c67d7809423 Gerd Hoffmann       2018-09-11  266  			goto err;
7a1c67d7809423 Gerd Hoffmann       2018-09-11  267  		ret = -EINVAL;
7a1c67d7809423 Gerd Hoffmann       2018-09-11  268  		if ((seals & SEALS_WANTED) != SEALS_WANTED ||
fbb0de79507819 Gerd Hoffmann       2018-08-27  269  		    (seals & SEALS_DENIED) != 0)
0d17455ca85ecb Gerd Hoffmann       2018-09-11  270  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  271  		pgoff = list[i].offset >> PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  272  		pgcnt = list[i].size   >> PAGE_SHIFT;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  273  		if (is_file_hugepages(memfd)) {
a7402e47800cd5 Vivek Kasireddy     2023-08-16  274  			if (!ubuf->subpgoff) {
a7402e47800cd5 Vivek Kasireddy     2023-08-16  275  				ubuf->subpgoff = kmalloc_array(ubuf->pagecount,
a7402e47800cd5 Vivek Kasireddy     2023-08-16  276  							       sizeof(*ubuf->subpgoff),
a7402e47800cd5 Vivek Kasireddy     2023-08-16  277  							       GFP_KERNEL);
a7402e47800cd5 Vivek Kasireddy     2023-08-16  278  				if (!ubuf->subpgoff) {
a7402e47800cd5 Vivek Kasireddy     2023-08-16  279  					ret = -ENOMEM;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  280  					goto err;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  281  				}
a7402e47800cd5 Vivek Kasireddy     2023-08-16  282  			}
a7402e47800cd5 Vivek Kasireddy     2023-08-16  283  			hpstate = hstate_file(memfd);
a7402e47800cd5 Vivek Kasireddy     2023-08-16  284  			mapidx = list[i].offset >> huge_page_shift(hpstate);
a7402e47800cd5 Vivek Kasireddy     2023-08-16  285  			chunkoff = (list[i].offset &
a7402e47800cd5 Vivek Kasireddy     2023-08-16  286  				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  287  			maxchunks = huge_page_size(hpstate) >> PAGE_SHIFT;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  288  		}
fbb0de79507819 Gerd Hoffmann       2018-08-27  289  		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
a7402e47800cd5 Vivek Kasireddy     2023-08-16  290  			if (is_file_hugepages(memfd)) {
a7402e47800cd5 Vivek Kasireddy     2023-08-16  291  				if (!hpage) {
a7402e47800cd5 Vivek Kasireddy     2023-08-16 @292  					hpage = find_get_page_flags(mapping, mapidx,
a7402e47800cd5 Vivek Kasireddy     2023-08-16  293  								    FGP_ACCESSED);
a7402e47800cd5 Vivek Kasireddy     2023-08-16  294  					if (!hpage) {
a7402e47800cd5 Vivek Kasireddy     2023-08-16  295  						ret = -EINVAL;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  296  						goto err;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  297  					}
a7402e47800cd5 Vivek Kasireddy     2023-08-16  298  				}
a7402e47800cd5 Vivek Kasireddy     2023-08-16  299  				get_page(hpage);
a7402e47800cd5 Vivek Kasireddy     2023-08-16  300  				ubuf->pages[pgbuf] = hpage;
a7402e47800cd5 Vivek Kasireddy     2023-08-16 @301  				ubuf->subpgoff[pgbuf++] = chunkoff << PAGE_SHIFT;
a7402e47800cd5 Vivek Kasireddy     2023-08-16 @302  				if (++chunkoff == maxchunks) {
a7402e47800cd5 Vivek Kasireddy     2023-08-16  303  					put_page(hpage);
a7402e47800cd5 Vivek Kasireddy     2023-08-16  304  					hpage = NULL;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  305  					chunkoff = 0;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  306  					mapidx++;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  307  				}
a7402e47800cd5 Vivek Kasireddy     2023-08-16  308  			} else {
a7402e47800cd5 Vivek Kasireddy     2023-08-16  309  				mapidx = pgoff + pgidx;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  310  				page = shmem_read_mapping_page(mapping, mapidx);
fbb0de79507819 Gerd Hoffmann       2018-08-27  311  				if (IS_ERR(page)) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  312  					ret = PTR_ERR(page);
0d17455ca85ecb Gerd Hoffmann       2018-09-11  313  					goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  314  				}
fbb0de79507819 Gerd Hoffmann       2018-08-27  315  				ubuf->pages[pgbuf++] = page;
fbb0de79507819 Gerd Hoffmann       2018-08-27  316  			}
a7402e47800cd5 Vivek Kasireddy     2023-08-16  317  		}
fbb0de79507819 Gerd Hoffmann       2018-08-27  318  		fput(memfd);
fbb0de79507819 Gerd Hoffmann       2018-08-27  319  		memfd = NULL;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  320  		if (hpage) {
a7402e47800cd5 Vivek Kasireddy     2023-08-16  321  			put_page(hpage);
a7402e47800cd5 Vivek Kasireddy     2023-08-16  322  			hpage = NULL;
a7402e47800cd5 Vivek Kasireddy     2023-08-16  323  		}
0d17455ca85ecb Gerd Hoffmann       2018-09-11  324  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  325  
fbb0de79507819 Gerd Hoffmann       2018-08-27  326  	exp_info.ops  = &udmabuf_ops;
fbb0de79507819 Gerd Hoffmann       2018-08-27  327  	exp_info.size = ubuf->pagecount << PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  328  	exp_info.priv = ubuf;
5c074eeabbd332 Gerd Hoffmann       2018-11-14  329  	exp_info.flags = O_RDWR;
fbb0de79507819 Gerd Hoffmann       2018-08-27  330  
c1bbed66899726 Gurchetan Singh     2019-12-02  331  	ubuf->device = device;
fbb0de79507819 Gerd Hoffmann       2018-08-27  332  	buf = dma_buf_export(&exp_info);
fbb0de79507819 Gerd Hoffmann       2018-08-27  333  	if (IS_ERR(buf)) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  334  		ret = PTR_ERR(buf);
0d17455ca85ecb Gerd Hoffmann       2018-09-11  335  		goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  336  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  337  
fbb0de79507819 Gerd Hoffmann       2018-08-27  338  	flags = 0;
fbb0de79507819 Gerd Hoffmann       2018-08-27  339  	if (head->flags & UDMABUF_FLAGS_CLOEXEC)
fbb0de79507819 Gerd Hoffmann       2018-08-27  340  		flags |= O_CLOEXEC;
fbb0de79507819 Gerd Hoffmann       2018-08-27  341  	return dma_buf_fd(buf, flags);
fbb0de79507819 Gerd Hoffmann       2018-08-27  342  
0d17455ca85ecb Gerd Hoffmann       2018-09-11  343  err:
fbb0de79507819 Gerd Hoffmann       2018-08-27  344  	while (pgbuf > 0)
fbb0de79507819 Gerd Hoffmann       2018-08-27  345  		put_page(ubuf->pages[--pgbuf]);
683a0e630cb463 Gustavo A. R. Silva 2018-09-04  346  	if (memfd)
fbb0de79507819 Gerd Hoffmann       2018-08-27  347  		fput(memfd);
a7402e47800cd5 Vivek Kasireddy     2023-08-16  348  	kfree(ubuf->subpgoff);
fbb0de79507819 Gerd Hoffmann       2018-08-27  349  	kfree(ubuf->pages);
fbb0de79507819 Gerd Hoffmann       2018-08-27  350  	kfree(ubuf);
fbb0de79507819 Gerd Hoffmann       2018-08-27  351  	return ret;
fbb0de79507819 Gerd Hoffmann       2018-08-27  352  }
fbb0de79507819 Gerd Hoffmann       2018-08-27  353  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
