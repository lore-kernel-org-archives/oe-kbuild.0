Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D85D482DF
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Nov 2023 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZyrgK+SS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700564889; x=1732100889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bvY4obDER5CSO8Zq/CJw+7HgDm5X16wVmWNUEwHpNJ8=;
  b=ZyrgK+SSsom4ax1wmaR7zwHLwRfjVYMve2UWDmmsse6BeEbF0UcNaCpL
   x2uGTkzSI1ooFoJ+EJ/JSxESZZkZBbdjs1K7Cd/5Ap7fRfK4WYxfyhIsz
   ag1OyznNErQuQi0ZEdF4/eaEgegYjV4D+bQA3nHbY/kK8RC4c45yfsP+y
   L0VKiK+x2j3PG7vnt69l4pvBFVPBUkZ+1IdnKMaOBu45Esr+mKJTh3toC
   y7st0glVlNMYFJktAEkVTdlioUzZcCQSmCdqGa+yDqpoFBMPXmmsbnnXG
   V+k818lTTiPLxTTmde5Beh9UpS0TFSQ25GZ9xa9+0/7gO6wH2Ahfkdh63
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="10480073"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="10480073"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 03:08:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="1013882422"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="1013882422"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Nov 2023 03:08:02 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Obl-0007ig-0M;
	Tue, 21 Nov 2023 11:07:58 +0000
Date: Tue, 21 Nov 2023 19:07:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 4/5] udmabuf: Pin the pages using pin_user_pages_fd()
 API (v3)
Message-ID: <202311211826.958cWYQt-lkp@intel.com>
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
In-Reply-To: <20231118063233.733523-5-vivek.kasireddy@intel.com>
References: <20231118063233.733523-5-vivek.kasireddy@intel.com>
TO: Vivek Kasireddy <vivek.kasireddy@intel.com>
TO: dri-devel@lists.freedesktop.org
TO: linux-mm@kvack.org
CC: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: David Hildenbrand <david@redhat.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Mike Kravetz <mike.kravetz@oracle.com>
CC: Hugh Dickins <hughd@google.com>
CC: Peter Xu <peterx@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Gerd Hoffmann <kraxel@redhat.com>
CC: Dongwon Kim <dongwon.kim@intel.com>
CC: Junxiao Chang <junxiao.chang@intel.com>

Hi Vivek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/udmabuf-Use-vmf_insert_pfn-and-VM_PFNMAP-for-handling-mmap/20231118-145704
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231118063233.733523-5-vivek.kasireddy%40intel.com
patch subject: [PATCH v4 4/5] udmabuf: Pin the pages using pin_user_pages_fd() API (v3)
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: hexagon-randconfig-r071-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211826.958cWYQt-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311211826.958cWYQt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311211826.958cWYQt-lkp@intel.com/

smatch warnings:
drivers/dma-buf/udmabuf.c:329 udmabuf_create() error: we previously assumed 'ubuf->pages' could be null (see line 250)

vim +329 drivers/dma-buf/udmabuf.c

fbb0de79507819 Gerd Hoffmann       2018-08-27  214  
c1bbed66899726 Gurchetan Singh     2019-12-02  215  static long udmabuf_create(struct miscdevice *device,
c1bbed66899726 Gurchetan Singh     2019-12-02  216  			   struct udmabuf_create_list *head,
c1bbed66899726 Gurchetan Singh     2019-12-02  217  			   struct udmabuf_create_item *list)
fbb0de79507819 Gerd Hoffmann       2018-08-27  218  {
fbb0de79507819 Gerd Hoffmann       2018-08-27  219  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
fbb0de79507819 Gerd Hoffmann       2018-08-27  220  	struct file *memfd = NULL;
fbb0de79507819 Gerd Hoffmann       2018-08-27  221  	struct udmabuf *ubuf;
fbb0de79507819 Gerd Hoffmann       2018-08-27  222  	struct dma_buf *buf;
8038f616ad33f2 Vivek Kasireddy     2023-11-17  223  	pgoff_t pgcnt, pgbuf = 0, pglimit, nr_pages;
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  224  	pgoff_t mapidx, chunkoff, maxchunks;
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  225  	struct hstate *hpstate;
8038f616ad33f2 Vivek Kasireddy     2023-11-17  226  	long ret = -EINVAL;
8038f616ad33f2 Vivek Kasireddy     2023-11-17  227  	int seals;
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
fbb0de79507819 Gerd Hoffmann       2018-08-27 @250  	if (!ubuf->pages) {
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
8038f616ad33f2 Vivek Kasireddy     2023-11-17  261  		if (!shmem_file(memfd) && !is_file_hugepages(memfd))
0d17455ca85ecb Gerd Hoffmann       2018-09-11  262  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  263  		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
7a1c67d7809423 Gerd Hoffmann       2018-09-11  264  		if (seals == -EINVAL)
7a1c67d7809423 Gerd Hoffmann       2018-09-11  265  			goto err;
7a1c67d7809423 Gerd Hoffmann       2018-09-11  266  		ret = -EINVAL;
7a1c67d7809423 Gerd Hoffmann       2018-09-11  267  		if ((seals & SEALS_WANTED) != SEALS_WANTED ||
fbb0de79507819 Gerd Hoffmann       2018-08-27  268  		    (seals & SEALS_DENIED) != 0)
0d17455ca85ecb Gerd Hoffmann       2018-09-11  269  			goto err;
8038f616ad33f2 Vivek Kasireddy     2023-11-17  270  		mapidx = list[i].offset >> PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  271  		pgcnt = list[i].size   >> PAGE_SHIFT;
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  272  		if (is_file_hugepages(memfd)) {
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  273  			if (!ubuf->subpgoff) {
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  274  				ubuf->subpgoff = kmalloc_array(ubuf->pagecount,
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  275  							       sizeof(*ubuf->subpgoff),
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  276  							       GFP_KERNEL);
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  277  				if (!ubuf->subpgoff) {
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  278  					ret = -ENOMEM;
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  279  					goto err;
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  280  				}
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  281  			}
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  282  			hpstate = hstate_file(memfd);
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  283  			mapidx = list[i].offset >> huge_page_shift(hpstate);
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  284  			chunkoff = (list[i].offset &
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  285  				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  286  			maxchunks = huge_page_size(hpstate) >> PAGE_SHIFT;
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  287  		}
8038f616ad33f2 Vivek Kasireddy     2023-11-17  288  
8038f616ad33f2 Vivek Kasireddy     2023-11-17  289  		do {
8038f616ad33f2 Vivek Kasireddy     2023-11-17  290  			nr_pages = shmem_file(memfd) ? pgcnt : 1;
8038f616ad33f2 Vivek Kasireddy     2023-11-17  291  			ret = pin_user_pages_fd(memfd, mapidx, nr_pages,
8038f616ad33f2 Vivek Kasireddy     2023-11-17  292  						ubuf->pages + pgbuf);
8038f616ad33f2 Vivek Kasireddy     2023-11-17  293  			if (ret < 0)
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  294  				goto err;
8038f616ad33f2 Vivek Kasireddy     2023-11-17  295  
8038f616ad33f2 Vivek Kasireddy     2023-11-17  296  			if (is_file_hugepages(memfd)) {
8038f616ad33f2 Vivek Kasireddy     2023-11-17  297  				ubuf->subpgoff[pgbuf] = chunkoff << PAGE_SHIFT;
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  298  				if (++chunkoff == maxchunks) {
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  299  					chunkoff = 0;
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  300  					mapidx++;
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  301  				}
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  302  			}
8038f616ad33f2 Vivek Kasireddy     2023-11-17  303  			pgbuf += nr_pages;
8038f616ad33f2 Vivek Kasireddy     2023-11-17  304  			pgcnt -= nr_pages;
8038f616ad33f2 Vivek Kasireddy     2023-11-17  305  		} while (pgcnt > 0);
fbb0de79507819 Gerd Hoffmann       2018-08-27  306  		fput(memfd);
fbb0de79507819 Gerd Hoffmann       2018-08-27  307  		memfd = NULL;
0d17455ca85ecb Gerd Hoffmann       2018-09-11  308  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  309  
fbb0de79507819 Gerd Hoffmann       2018-08-27  310  	exp_info.ops  = &udmabuf_ops;
fbb0de79507819 Gerd Hoffmann       2018-08-27  311  	exp_info.size = ubuf->pagecount << PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  312  	exp_info.priv = ubuf;
5c074eeabbd332 Gerd Hoffmann       2018-11-14  313  	exp_info.flags = O_RDWR;
fbb0de79507819 Gerd Hoffmann       2018-08-27  314  
c1bbed66899726 Gurchetan Singh     2019-12-02  315  	ubuf->device = device;
fbb0de79507819 Gerd Hoffmann       2018-08-27  316  	buf = dma_buf_export(&exp_info);
fbb0de79507819 Gerd Hoffmann       2018-08-27  317  	if (IS_ERR(buf)) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  318  		ret = PTR_ERR(buf);
0d17455ca85ecb Gerd Hoffmann       2018-09-11  319  		goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  320  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  321  
fbb0de79507819 Gerd Hoffmann       2018-08-27  322  	flags = 0;
fbb0de79507819 Gerd Hoffmann       2018-08-27  323  	if (head->flags & UDMABUF_FLAGS_CLOEXEC)
fbb0de79507819 Gerd Hoffmann       2018-08-27  324  		flags |= O_CLOEXEC;
fbb0de79507819 Gerd Hoffmann       2018-08-27  325  	return dma_buf_fd(buf, flags);
fbb0de79507819 Gerd Hoffmann       2018-08-27  326  
0d17455ca85ecb Gerd Hoffmann       2018-09-11  327  err:
8038f616ad33f2 Vivek Kasireddy     2023-11-17  328  	while (pgbuf-- > 0)
8038f616ad33f2 Vivek Kasireddy     2023-11-17 @329  		if (ubuf->pages[pgbuf])
8038f616ad33f2 Vivek Kasireddy     2023-11-17  330  			unpin_user_page(ubuf->pages[pgbuf]);
683a0e630cb463 Gustavo A. R. Silva 2018-09-04  331  	if (memfd)
fbb0de79507819 Gerd Hoffmann       2018-08-27  332  		fput(memfd);
8129f43f2b3f79 Vivek Kasireddy     2023-11-17  333  	kfree(ubuf->subpgoff);
fbb0de79507819 Gerd Hoffmann       2018-08-27  334  	kfree(ubuf->pages);
fbb0de79507819 Gerd Hoffmann       2018-08-27  335  	kfree(ubuf);
fbb0de79507819 Gerd Hoffmann       2018-08-27  336  	return ret;
fbb0de79507819 Gerd Hoffmann       2018-08-27  337  }
fbb0de79507819 Gerd Hoffmann       2018-08-27  338  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
