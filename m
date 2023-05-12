Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BAD1116
	for <oe-kbuild@lists.linux.dev>; Fri, 12 May 2023 08:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683881686; x=1715417686;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hqTmHoQklUUyYCkHmJsLpBXoz84UcdY8BDjyg0Mf3Ug=;
  b=POQ7HYMKrFyKktyLqQHN43L0Z71rePZCRk470Qr1vVJG6bqQC85PgTXO
   o5SPhUriDOdNPK8mvEOvdQG+jf+yt6HDnG9H3nfW2IDFhVocw6hBWchhO
   4D2xDB87B7l0S1axw0GBWCeQwlqllQJgzbL6vr00+DHBngkpTREbAQNAk
   2ZZn+Wah9QPxuPCWhxIbDPJ0IYNtXMv9etRJCEYzeopB18Tlz2W1pDCwC
   ien+mYL9CNY+RpJSwaLtQIlWZxU58oQzbSsq6n+YDtiZOHybPCxvTwmXE
   7rf1rWlq1kYYvvsHKGNqeqqmG26NAuc9omRIPvxZoiKulsIfZAjUt0njY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353874478"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="353874478"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 01:54:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="703122834"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="703122834"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 12 May 2023 01:54:44 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxOXz-0004jG-1E;
	Fri, 12 May 2023 08:54:43 +0000
Date: Fri, 12 May 2023 16:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/erofs/zdata.c:967 z_erofs_decompress_pcluster() warn: other
 places set '(struct z_erofs_decompress_backend)->nr_pages' to 'page' instead
 of 'array_size'
Message-ID: <202305121645.MAeWnmEC-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Gao Xiang <hsiangkao@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cc3c44c9fda264c6d401be04e95449a57c1231c6
commit: 2bfab9c0edac5f6031e8956477cd39f7162b208d erofs: record the longest decompressed size in this round
date:   10 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 10 months ago
config: openrisc-randconfig-m031-20230509 (https://download.01.org/0day-ci/archive/20230512/202305121645.MAeWnmEC-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305121645.MAeWnmEC-lkp@intel.com/

New smatch warnings:
fs/erofs/zdata.c:967 z_erofs_decompress_pcluster() warn: other places set '(struct z_erofs_decompress_backend)->nr_pages' to 'page' instead of 'array_size'
fs/erofs/zdata.c:966 z_erofs_decompress_pcluster() warn: ambiguous units merge 'be->nr_pages' 'page' or 'array_size'
fs/erofs/zdata.c:966 z_erofs_decompress_pcluster() warn: ambiguous units merge 'be->nr_pages' 'array_size' or 'page'

Old smatch warnings:
fs/erofs/zdata.c:523 z_erofs_register_pcluster() warn: passing a valid pointer to 'PTR_ERR'
fs/erofs/zdata.c:970 z_erofs_decompress_pcluster() warn: ambiguous units merge 'pclusterpages' 'page' or 'array_size'
fs/erofs/zdata.c:970 z_erofs_decompress_pcluster() warn: ambiguous units merge 'pclusterpages' 'array_size' or 'page'
fs/erofs/zdata.c:1040 z_erofs_decompress_pcluster() warn: ambiguous units merge 'be->nr_pages' 'page' or 'array_size'
fs/erofs/zdata.c:1040 z_erofs_decompress_pcluster() warn: ambiguous units merge 'be->nr_pages' 'array_size' or 'page'

vim +967 fs/erofs/zdata.c

67139e36d97041 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   936  
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   937  static int z_erofs_decompress_pcluster(struct z_erofs_decompress_backend *be,
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   938  				       int err)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26   939  {
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   940  	struct erofs_sb_info *const sbi = EROFS_SB(be->sb);
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   941  	struct z_erofs_pcluster *pcl = be->pcl;
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29   942  	unsigned int pclusterpages = z_erofs_pclusterpages(pcl);
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang 2022-07-15   943  	unsigned int i, inputsize;
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   944  	int err2;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang 2022-07-15   945  	struct page *page;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang 2022-07-15   946  	bool overlapped;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26   947  
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29   948  	mutex_lock(&pcl->lock);
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang 2022-07-15   949  	be->nr_pages = PAGE_ALIGN(pcl->length + pcl->pageofs_out) >> PAGE_SHIFT;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26   950  
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   951  	/* allocate (de)compressed page arrays if cannot be kept on stack */
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   952  	be->decompressed_pages = NULL;
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   953  	be->compressed_pages = NULL;
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   954  	be->onstack_used = 0;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang 2022-07-15   955  	if (be->nr_pages <= Z_EROFS_ONSTACK_PAGES) {
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   956  		be->decompressed_pages = be->onstack_pages;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang 2022-07-15   957  		be->onstack_used = be->nr_pages;
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   958  		memset(be->decompressed_pages, 0,
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang 2022-07-15   959  		       sizeof(struct page *) * be->nr_pages);
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   960  	}
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   961  
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   962  	if (pclusterpages + be->onstack_used <= Z_EROFS_ONSTACK_PAGES)
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   963  		be->compressed_pages = be->onstack_pages + be->onstack_used;
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   964  
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   965  	if (!be->decompressed_pages)
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  @966  		be->decompressed_pages =
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang 2022-07-15  @967  			kvcalloc(be->nr_pages, sizeof(struct page *),
e73681877d4c3a fs/erofs/zdata.c                  Gao Xiang 2022-07-15   968  				 GFP_KERNEL | __GFP_NOFAIL);
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   969  	if (!be->compressed_pages)
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   970  		be->compressed_pages =
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   971  			kvcalloc(pclusterpages, sizeof(struct page *),
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   972  				 GFP_KERNEL | __GFP_NOFAIL);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26   973  
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   974  	err2 = z_erofs_parse_out_bvecs(be);
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   975  	if (err2)
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   976  		err = err2;
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   977  	err2 = z_erofs_parse_in_bvecs(be, &overlapped);
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   978  	if (err2)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   979  		err = err2;
11152496021ea8 drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-03-25   980  
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang 2019-08-30   981  	if (err)
11152496021ea8 drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-03-25   982  		goto out;
11152496021ea8 drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-03-25   983  
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29   984  	if (z_erofs_is_inline_pcluster(pcl))
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29   985  		inputsize = pcl->tailpacking_size;
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29   986  	else
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29   987  		inputsize = pclusterpages * PAGE_SIZE;
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29   988  
88aaf5a79c5cde drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-06-24   989  	err = z_erofs_decompress(&(struct z_erofs_decompress_req) {
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   990  					.sb = be->sb,
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   991  					.in = be->compressed_pages,
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   992  					.out = be->decompressed_pages,
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29   993  					.pageofs_in = pcl->pageofs_in,
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29   994  					.pageofs_out = pcl->pageofs_out,
9f6cc76e6ff063 fs/erofs/zdata.c                  Gao Xiang 2021-04-07   995  					.inputsize = inputsize,
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang 2022-07-15   996  					.outputsize = pcl->length,
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31   997  					.alg = pcl->algorithmformat,
88aaf5a79c5cde drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-06-24   998  					.inplace_io = overlapped,
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang 2022-07-15   999  					.partial_decoding = pcl->partial,
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1000  				 }, be->pagepool);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1001  
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1002  out:
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1003  	/* must handle all compressed pages before actual file pages */
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1004  	if (z_erofs_is_inline_pcluster(pcl)) {
ed722fbccadb74 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1005  		page = pcl->compressed_bvecs[0].page;
ed722fbccadb74 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1006  		WRITE_ONCE(pcl->compressed_bvecs[0].page, NULL);
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1007  		put_page(page);
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1008  	} else {
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1009  		for (i = 0; i < pclusterpages; ++i) {
ed722fbccadb74 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1010  			page = pcl->compressed_bvecs[i].page;
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1011  
d61fbb6b163494 drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-03-25  1012  			if (erofs_page_is_managed(sbi, page))
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1013  				continue;
d61fbb6b163494 drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-03-25  1014  
6aaa7b0664e688 fs/erofs/zdata.c                  Gao Xiang 2020-12-08  1015  			/* recycle all individual short-lived pages */
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1016  			(void)z_erofs_put_shortlivedpage(be->pagepool, page);
ed722fbccadb74 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1017  			WRITE_ONCE(pcl->compressed_bvecs[i].page, NULL);
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1018  		}
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1019  	}
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1020  	if (be->compressed_pages < be->onstack_pages ||
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1021  	    be->compressed_pages >= be->onstack_pages + Z_EROFS_ONSTACK_PAGES)
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1022  		kvfree(be->compressed_pages);
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1023  
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1024  	for (i = 0; i < be->nr_pages; ++i) {
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1025  		page = be->decompressed_pages[i];
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1026  		if (!page)
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1027  			continue;
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1028  
6aaa7b0664e688 fs/erofs/zdata.c                  Gao Xiang 2020-12-08  1029  		DBG_BUGON(z_erofs_page_is_invalidated(page));
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1030  
6aaa7b0664e688 fs/erofs/zdata.c                  Gao Xiang 2020-12-08  1031  		/* recycle all individual short-lived pages */
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1032  		if (z_erofs_put_shortlivedpage(be->pagepool, page))
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1033  			continue;
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1034  		if (err)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1035  			z_erofs_page_mark_eio(page);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1036  		z_erofs_onlinepage_endio(page);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1037  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1038  
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1039  	if (be->decompressed_pages != be->onstack_pages)
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1040  		kvfree(be->decompressed_pages);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1041  
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1042  	pcl->length = 0;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1043  	pcl->partial = true;
06a304cd9cc095 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1044  	pcl->bvset.nextpage = NULL;
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  1045  	pcl->vcnt = 0;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1046  
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  1047  	/* pcluster lock MUST be taken before the following line */
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  1048  	WRITE_ONCE(pcl->next, Z_EROFS_PCLUSTER_NIL);
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  1049  	mutex_unlock(&pcl->lock);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1050  	return err;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1051  }
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1052  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
