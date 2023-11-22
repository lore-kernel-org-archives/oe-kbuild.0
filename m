Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C8F1FC9
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Nov 2023 02:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ClLNo4kp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700618764; x=1732154764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a9y3lA5YHjFuXlaU1L7xqEgOiGP5EC3cNjjZNXHnJlA=;
  b=ClLNo4kpeAucEEk0w5KGOFm8ZXAr/wCUdnCu/xvkTNU0jq19QiW83xnF
   JLQRSUAYedNB5mwX6LgTIsRRUvwxUjg9Xy+pharAoxvTQz6qIdf2X0P93
   vhERqU6f22ZdWJOX+h6juJBfVS+a4obHuVWYdC9+cxuWuq+29H3Z9yCaC
   0wpUKW7ZzK144kt9Y6tFqsVL5bBHqYKyrfSHzUK5C1Zfa/i3ZsEVXXRbx
   iZ4F+TV/e5HhRkrczjGNGouCo8by0lQEUvsp8wdDPcENU+V7vl/auxUSW
   76fYUievFJ1LAgexVAbgiPmnZEOBl6px4IJCTrfgjSE6OLdaj+68Pj3Fv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="395884503"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="395884503"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 18:06:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="760286660"
X-IronPort-AV: E=Sophos;i="6.04,217,1695711600"; 
   d="scan'208";a="760286660"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Nov 2023 18:06:00 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5cb6-0008Wg-2j;
	Wed, 22 Nov 2023 02:04:57 +0000
Date: Wed, 22 Nov 2023 10:03:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/5] udmabuf: Add back support for mapping hugetlb
 pages (v3)
Message-ID: <202311220940.c47i1TUH-lkp@intel.com>
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
In-Reply-To: <20231118063233.733523-3-vivek.kasireddy@intel.com>
References: <20231118063233.733523-3-vivek.kasireddy@intel.com>
TO: Vivek Kasireddy <vivek.kasireddy@intel.com>

Hi Vivek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/udmabuf-Use-vmf_insert_pfn-and-VM_PFNMAP-for-handling-mmap/20231118-145704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231118063233.733523-3-vivek.kasireddy%40intel.com
patch subject: [PATCH v4 2/5] udmabuf: Add back support for mapping hugetlb pages (v3)
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20231122 (https://download.01.org/0day-ci/archive/20231122/202311220940.c47i1TUH-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231122/202311220940.c47i1TUH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311220940.c47i1TUH-lkp@intel.com/

New smatch warnings:
drivers/dma-buf/udmabuf.c:301 udmabuf_create() error: uninitialized symbol 'chunkoff'.
drivers/dma-buf/udmabuf.c:302 udmabuf_create() error: uninitialized symbol 'maxchunks'.

Old smatch warnings:
drivers/dma-buf/udmabuf.c:292 udmabuf_create() error: uninitialized symbol 'mapidx'.

vim +/chunkoff +301 drivers/dma-buf/udmabuf.c

fbb0de795078190 Gerd Hoffmann       2018-08-27  213  
c1bbed668997268 Gurchetan Singh     2019-12-02  214  static long udmabuf_create(struct miscdevice *device,
c1bbed668997268 Gurchetan Singh     2019-12-02  215  			   struct udmabuf_create_list *head,
c1bbed668997268 Gurchetan Singh     2019-12-02  216  			   struct udmabuf_create_item *list)
fbb0de795078190 Gerd Hoffmann       2018-08-27  217  {
fbb0de795078190 Gerd Hoffmann       2018-08-27  218  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
fbb0de795078190 Gerd Hoffmann       2018-08-27  219  	struct file *memfd = NULL;
16c243e99d335e1 Vivek Kasireddy     2021-06-09  220  	struct address_space *mapping = NULL;
fbb0de795078190 Gerd Hoffmann       2018-08-27  221  	struct udmabuf *ubuf;
fbb0de795078190 Gerd Hoffmann       2018-08-27  222  	struct dma_buf *buf;
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  223  	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  224  	struct page *page, *hpage = NULL;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  225  	pgoff_t mapidx, chunkoff, maxchunks;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  226  	struct hstate *hpstate;
fbb0de795078190 Gerd Hoffmann       2018-08-27  227  	int seals, ret = -EINVAL;
fbb0de795078190 Gerd Hoffmann       2018-08-27  228  	u32 i, flags;
fbb0de795078190 Gerd Hoffmann       2018-08-27  229  
33f35429fc49c09 Gerd Hoffmann       2018-09-11  230  	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
fbb0de795078190 Gerd Hoffmann       2018-08-27  231  	if (!ubuf)
fbb0de795078190 Gerd Hoffmann       2018-08-27  232  		return -ENOMEM;
fbb0de795078190 Gerd Hoffmann       2018-08-27  233  
dc4716d75154b36 Gerd Hoffmann       2018-09-11  234  	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
fbb0de795078190 Gerd Hoffmann       2018-08-27  235  	for (i = 0; i < head->count; i++) {
fbb0de795078190 Gerd Hoffmann       2018-08-27  236  		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  237  			goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  238  		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  239  			goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  240  		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
dc4716d75154b36 Gerd Hoffmann       2018-09-11  241  		if (ubuf->pagecount > pglimit)
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  242  			goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  243  	}
2b6dd600dd72573 Pavel Skripkin      2021-12-30  244  
2b6dd600dd72573 Pavel Skripkin      2021-12-30  245  	if (!ubuf->pagecount)
2b6dd600dd72573 Pavel Skripkin      2021-12-30  246  		goto err;
2b6dd600dd72573 Pavel Skripkin      2021-12-30  247  
33f35429fc49c09 Gerd Hoffmann       2018-09-11  248  	ubuf->pages = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->pages),
fbb0de795078190 Gerd Hoffmann       2018-08-27  249  				    GFP_KERNEL);
fbb0de795078190 Gerd Hoffmann       2018-08-27  250  	if (!ubuf->pages) {
fbb0de795078190 Gerd Hoffmann       2018-08-27  251  		ret = -ENOMEM;
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  252  		goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  253  	}
fbb0de795078190 Gerd Hoffmann       2018-08-27  254  
fbb0de795078190 Gerd Hoffmann       2018-08-27  255  	pgbuf = 0;
fbb0de795078190 Gerd Hoffmann       2018-08-27  256  	for (i = 0; i < head->count; i++) {
7a1c67d78094236 Gerd Hoffmann       2018-09-11  257  		ret = -EBADFD;
fbb0de795078190 Gerd Hoffmann       2018-08-27  258  		memfd = fget(list[i].memfd);
fbb0de795078190 Gerd Hoffmann       2018-08-27  259  		if (!memfd)
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  260  			goto err;
ff58105a47ede2e Al Viro             2022-08-20  261  		mapping = memfd->f_mapping;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  262  		if (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  263  			goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  264  		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
7a1c67d78094236 Gerd Hoffmann       2018-09-11  265  		if (seals == -EINVAL)
7a1c67d78094236 Gerd Hoffmann       2018-09-11  266  			goto err;
7a1c67d78094236 Gerd Hoffmann       2018-09-11  267  		ret = -EINVAL;
7a1c67d78094236 Gerd Hoffmann       2018-09-11  268  		if ((seals & SEALS_WANTED) != SEALS_WANTED ||
fbb0de795078190 Gerd Hoffmann       2018-08-27  269  		    (seals & SEALS_DENIED) != 0)
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  270  			goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  271  		pgoff = list[i].offset >> PAGE_SHIFT;
fbb0de795078190 Gerd Hoffmann       2018-08-27  272  		pgcnt = list[i].size   >> PAGE_SHIFT;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  273  		if (is_file_hugepages(memfd)) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  274  			if (!ubuf->subpgoff) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  275  				ubuf->subpgoff = kmalloc_array(ubuf->pagecount,
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  276  							       sizeof(*ubuf->subpgoff),
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  277  							       GFP_KERNEL);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  278  				if (!ubuf->subpgoff) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  279  					ret = -ENOMEM;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  280  					goto err;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  281  				}
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  282  			}
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  283  			hpstate = hstate_file(memfd);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  284  			mapidx = list[i].offset >> huge_page_shift(hpstate);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  285  			chunkoff = (list[i].offset &
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  286  				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  287  			maxchunks = huge_page_size(hpstate) >> PAGE_SHIFT;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  288  		}
fbb0de795078190 Gerd Hoffmann       2018-08-27  289  		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  290  			if (is_file_hugepages(memfd)) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  291  				if (!hpage) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  292  					hpage = find_get_page_flags(mapping, mapidx,
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  293  								    FGP_ACCESSED);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  294  					if (!hpage) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  295  						ret = -EINVAL;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  296  						goto err;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  297  					}
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  298  				}
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  299  				get_page(hpage);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  300  				ubuf->pages[pgbuf] = hpage;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17 @301  				ubuf->subpgoff[pgbuf++] = chunkoff << PAGE_SHIFT;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17 @302  				if (++chunkoff == maxchunks) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  303  					put_page(hpage);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  304  					hpage = NULL;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  305  					chunkoff = 0;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  306  					mapidx++;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  307  				}
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  308  			} else {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  309  				mapidx = pgoff + pgidx;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  310  				page = shmem_read_mapping_page(mapping, mapidx);
fbb0de795078190 Gerd Hoffmann       2018-08-27  311  				if (IS_ERR(page)) {
fbb0de795078190 Gerd Hoffmann       2018-08-27  312  					ret = PTR_ERR(page);
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  313  					goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  314  				}
fbb0de795078190 Gerd Hoffmann       2018-08-27  315  				ubuf->pages[pgbuf++] = page;
fbb0de795078190 Gerd Hoffmann       2018-08-27  316  			}
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  317  		}
fbb0de795078190 Gerd Hoffmann       2018-08-27  318  		fput(memfd);
fbb0de795078190 Gerd Hoffmann       2018-08-27  319  		memfd = NULL;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  320  		if (hpage) {
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  321  			put_page(hpage);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  322  			hpage = NULL;
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  323  		}
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  324  	}
fbb0de795078190 Gerd Hoffmann       2018-08-27  325  
fbb0de795078190 Gerd Hoffmann       2018-08-27  326  	exp_info.ops  = &udmabuf_ops;
fbb0de795078190 Gerd Hoffmann       2018-08-27  327  	exp_info.size = ubuf->pagecount << PAGE_SHIFT;
fbb0de795078190 Gerd Hoffmann       2018-08-27  328  	exp_info.priv = ubuf;
5c074eeabbd332b Gerd Hoffmann       2018-11-14  329  	exp_info.flags = O_RDWR;
fbb0de795078190 Gerd Hoffmann       2018-08-27  330  
c1bbed668997268 Gurchetan Singh     2019-12-02  331  	ubuf->device = device;
fbb0de795078190 Gerd Hoffmann       2018-08-27  332  	buf = dma_buf_export(&exp_info);
fbb0de795078190 Gerd Hoffmann       2018-08-27  333  	if (IS_ERR(buf)) {
fbb0de795078190 Gerd Hoffmann       2018-08-27  334  		ret = PTR_ERR(buf);
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  335  		goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  336  	}
fbb0de795078190 Gerd Hoffmann       2018-08-27  337  
fbb0de795078190 Gerd Hoffmann       2018-08-27  338  	flags = 0;
fbb0de795078190 Gerd Hoffmann       2018-08-27  339  	if (head->flags & UDMABUF_FLAGS_CLOEXEC)
fbb0de795078190 Gerd Hoffmann       2018-08-27  340  		flags |= O_CLOEXEC;
fbb0de795078190 Gerd Hoffmann       2018-08-27  341  	return dma_buf_fd(buf, flags);
fbb0de795078190 Gerd Hoffmann       2018-08-27  342  
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  343  err:
fbb0de795078190 Gerd Hoffmann       2018-08-27  344  	while (pgbuf > 0)
fbb0de795078190 Gerd Hoffmann       2018-08-27  345  		put_page(ubuf->pages[--pgbuf]);
683a0e630cb463d Gustavo A. R. Silva 2018-09-04  346  	if (memfd)
fbb0de795078190 Gerd Hoffmann       2018-08-27  347  		fput(memfd);
8129f43f2b3f79f Vivek Kasireddy     2023-11-17  348  	kfree(ubuf->subpgoff);
fbb0de795078190 Gerd Hoffmann       2018-08-27  349  	kfree(ubuf->pages);
fbb0de795078190 Gerd Hoffmann       2018-08-27  350  	kfree(ubuf);
fbb0de795078190 Gerd Hoffmann       2018-08-27  351  	return ret;
fbb0de795078190 Gerd Hoffmann       2018-08-27  352  }
fbb0de795078190 Gerd Hoffmann       2018-08-27  353  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
