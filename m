Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9596FCF
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 13:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683724293; x=1715260293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Irp53TPzAcd6xqSMQr5hEg5VU1HUXXX5iuvwVPPU08s=;
  b=YaM7dXRe4RJNHzeoX5UnjiBfpiyqjj2EWIPJtzyZoUXpUE0J34S+aLA5
   SqrcO6ArthfLGjF4WSg181nWUE6luDSLw/CQ8IPSPpB+A3LnOcmzexHLs
   1r1m5TRJyoL0sN6nfZTLH/Tl0noldxm9jtnBreOupmM8dNuSlFadnIVAq
   sts2aKQfhlbqKhjK0nLsDkas5p6mytYBXfrzQak0e3WFPpYuLvPf3pHSr
   4zp3CU19Bk8L2OpBKR4uf7eJVoTGvNENGNKYrDVfxyXdUTlPhwx8mbXut
   kAiRVb/NnbNDlx+kxSq+v4bmJ7j+oErajZHSblMONEGWfRkhibeU5tZlD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="436533327"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="436533327"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 06:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="768909370"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="768909370"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 May 2023 06:11:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwjbP-0003JC-0t;
	Wed, 10 May 2023 13:11:31 +0000
Date: Wed, 10 May 2023 21:11:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/erofs/zdata.c:991 z_erofs_decompress_pcluster() warn: ambiguous
 units merge 'pclusterpages' 'page' or 'array_size'
Message-ID: <202305102153.uAOnp87y-lkp@intel.com>
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
head:   16a8829130ca22666ac6236178a6233208d425c3
commit: fe3e5914e6dc8db743fa587748ce1d9ecd4a5dba erofs: try to leave (de)compressed_pages on stack if possible
date:   10 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 10 months ago
config: parisc-randconfig-m041-20230509 (https://download.01.org/0day-ci/archive/20230510/202305102153.uAOnp87y-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305102153.uAOnp87y-lkp@intel.com/

New smatch warnings:
fs/erofs/zdata.c:991 z_erofs_decompress_pcluster() warn: ambiguous units merge 'pclusterpages' 'page' or 'array_size'
fs/erofs/zdata.c:991 z_erofs_decompress_pcluster() warn: ambiguous units merge 'pclusterpages' 'array_size' or 'page'

Old smatch warnings:
fs/erofs/zdata.c:542 z_erofs_register_pcluster() warn: passing a valid pointer to 'PTR_ERR'
fs/erofs/zdata.c:987 z_erofs_decompress_pcluster() warn: ambiguous units merge 'nr_pages' 'page' or 'array_size'
fs/erofs/zdata.c:987 z_erofs_decompress_pcluster() warn: ambiguous units merge 'nr_pages' 'array_size' or 'page'

vim +991 fs/erofs/zdata.c

67139e36d97041 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   956  
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   957  static int z_erofs_decompress_pcluster(struct z_erofs_decompress_backend *be,
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   958  				       int err)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26   959  {
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   960  	struct erofs_sb_info *const sbi = EROFS_SB(be->sb);
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   961  	struct z_erofs_pcluster *pcl = be->pcl;
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29   962  	unsigned int pclusterpages = z_erofs_pclusterpages(pcl);
9f6cc76e6ff063 fs/erofs/zdata.c                  Gao Xiang 2021-04-07   963  	unsigned int i, inputsize, outputsize, llen, nr_pages;
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   964  	struct page *page;
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   965  	int err2;
b6a76183dea8df drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-06-24   966  	bool overlapped, partial;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26   967  
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29   968  	DBG_BUGON(!READ_ONCE(pcl->nr_pages));
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29   969  	mutex_lock(&pcl->lock);
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29   970  	nr_pages = pcl->nr_pages;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26   971  
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   972  	/* allocate (de)compressed page arrays if cannot be kept on stack */
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   973  	be->decompressed_pages = NULL;
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   974  	be->compressed_pages = NULL;
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   975  	be->onstack_used = 0;
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   976  	if (nr_pages <= Z_EROFS_ONSTACK_PAGES) {
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   977  		be->decompressed_pages = be->onstack_pages;
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   978  		be->onstack_used = nr_pages;
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   979  		memset(be->decompressed_pages, 0,
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   980  		       sizeof(struct page *) * nr_pages);
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   981  	}
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   982  
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   983  	if (pclusterpages + be->onstack_used <= Z_EROFS_ONSTACK_PAGES)
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   984  		be->compressed_pages = be->onstack_pages + be->onstack_used;
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   985  
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   986  	if (!be->decompressed_pages)
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   987  		be->decompressed_pages =
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   988  			kvcalloc(nr_pages, sizeof(struct page *),
e73681877d4c3a fs/erofs/zdata.c                  Gao Xiang 2022-07-15   989  				 GFP_KERNEL | __GFP_NOFAIL);
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   990  	if (!be->compressed_pages)
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15  @991  		be->compressed_pages =
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   992  			kvcalloc(pclusterpages, sizeof(struct page *),
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15   993  				 GFP_KERNEL | __GFP_NOFAIL);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26   994  
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   995  	err2 = z_erofs_parse_out_bvecs(be);
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   996  	if (err2)
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   997  		err = err2;
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   998  	err2 = z_erofs_parse_in_bvecs(be, &overlapped);
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang 2022-07-15   999  	if (err2)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1000  		err = err2;
11152496021ea8 drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-03-25  1001  
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang 2019-08-30  1002  	if (err)
11152496021ea8 drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-03-25  1003  		goto out;
11152496021ea8 drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-03-25  1004  
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  1005  	llen = pcl->length >> Z_EROFS_PCLUSTER_LENGTH_BIT;
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  1006  	if (nr_pages << PAGE_SHIFT >= pcl->pageofs_out + llen) {
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  1007  		outputsize = llen;
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  1008  		partial = !(pcl->length & Z_EROFS_PCLUSTER_FULL_LENGTH);
b6a76183dea8df drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-06-24  1009  	} else {
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  1010  		outputsize = (nr_pages << PAGE_SHIFT) - pcl->pageofs_out;
b6a76183dea8df drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-06-24  1011  		partial = true;
b6a76183dea8df drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-06-24  1012  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1013  
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1014  	if (z_erofs_is_inline_pcluster(pcl))
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1015  		inputsize = pcl->tailpacking_size;
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1016  	else
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1017  		inputsize = pclusterpages * PAGE_SIZE;
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1018  
88aaf5a79c5cde drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-06-24  1019  	err = z_erofs_decompress(&(struct z_erofs_decompress_req) {
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1020  					.sb = be->sb,
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1021  					.in = be->compressed_pages,
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1022  					.out = be->decompressed_pages,
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1023  					.pageofs_in = pcl->pageofs_in,
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  1024  					.pageofs_out = pcl->pageofs_out,
9f6cc76e6ff063 fs/erofs/zdata.c                  Gao Xiang 2021-04-07  1025  					.inputsize = inputsize,
88aaf5a79c5cde drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-06-24  1026  					.outputsize = outputsize,
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  1027  					.alg = pcl->algorithmformat,
88aaf5a79c5cde drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-06-24  1028  					.inplace_io = overlapped,
b6a76183dea8df drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-06-24  1029  					.partial_decoding = partial
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1030  				 }, be->pagepool);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1031  
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1032  out:
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1033  	/* must handle all compressed pages before actual file pages */
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1034  	if (z_erofs_is_inline_pcluster(pcl)) {
ed722fbccadb74 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1035  		page = pcl->compressed_bvecs[0].page;
ed722fbccadb74 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1036  		WRITE_ONCE(pcl->compressed_bvecs[0].page, NULL);
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1037  		put_page(page);
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1038  	} else {
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1039  		for (i = 0; i < pclusterpages; ++i) {
ed722fbccadb74 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1040  			page = pcl->compressed_bvecs[i].page;
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1041  
d61fbb6b163494 drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-03-25  1042  			if (erofs_page_is_managed(sbi, page))
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1043  				continue;
d61fbb6b163494 drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-03-25  1044  
6aaa7b0664e688 fs/erofs/zdata.c                  Gao Xiang 2020-12-08  1045  			/* recycle all individual short-lived pages */
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1046  			(void)z_erofs_put_shortlivedpage(be->pagepool, page);
ed722fbccadb74 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1047  			WRITE_ONCE(pcl->compressed_bvecs[i].page, NULL);
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1048  		}
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu    2021-12-29  1049  	}
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1050  	if (be->compressed_pages < be->onstack_pages ||
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1051  	    be->compressed_pages >= be->onstack_pages + Z_EROFS_ONSTACK_PAGES)
fe3e5914e6dc8d fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1052  		kvfree(be->compressed_pages);
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1053  
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1054  	for (i = 0; i < nr_pages; ++i) {
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1055  		page = be->decompressed_pages[i];
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1056  		if (!page)
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1057  			continue;
af692e117cb8cd drivers/staging/erofs/unzip_vle.c Gao Xiang 2019-02-27  1058  
6aaa7b0664e688 fs/erofs/zdata.c                  Gao Xiang 2020-12-08  1059  		DBG_BUGON(z_erofs_page_is_invalidated(page));
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1060  
6aaa7b0664e688 fs/erofs/zdata.c                  Gao Xiang 2020-12-08  1061  		/* recycle all individual short-lived pages */
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1062  		if (z_erofs_put_shortlivedpage(be->pagepool, page))
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1063  			continue;
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1064  		if (err)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1065  			z_erofs_page_mark_eio(page);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1066  		z_erofs_onlinepage_endio(page);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1067  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1068  
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1069  	if (be->decompressed_pages != be->onstack_pages)
4f05687fd70364 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1070  		kvfree(be->decompressed_pages);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1071  
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  1072  	pcl->nr_pages = 0;
06a304cd9cc095 fs/erofs/zdata.c                  Gao Xiang 2022-07-15  1073  	pcl->bvset.nextpage = NULL;
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  1074  	pcl->vcnt = 0;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1075  
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  1076  	/* pcluster lock MUST be taken before the following line */
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang 2019-07-31  1077  	WRITE_ONCE(pcl->next, Z_EROFS_PCLUSTER_NIL);
87ca34a7065db6 fs/erofs/zdata.c                  Gao Xiang 2022-05-29  1078  	mutex_unlock(&pcl->lock);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1079  	return err;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1080  }
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang 2018-07-26  1081  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
