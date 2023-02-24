Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F95BD2FF
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Feb 2023 06:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677219761; x=1708755761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iRJOQ78/1VoPiZQDp8hnTIWjIGn4worr4hTKUZ8pKPY=;
  b=BlGiA/Fstl5G93vFyHMaAjBhTZyg42Ci3Aj9x7ZpSrL1nx6kEzdpkbun
   i1yzF7IGE7PRj/NNNuWuPkfkDzRWCXl6Kaw+Hgc4CwuSKudTG1i74HTIk
   vfshS+UHWethxZoX6zkKAH95onCvicR5+FZdTGFMlxhmxuB782ziIUN47
   u2qtUsvwdTB8XBL819tbdVRucDuIOvR70jRWyebHOqZcR02uRgLVSrWzG
   G5smcmslVqniwqqDPh8HW6pZksSwx4HXXBhC31wrD/NxYqcNIYujggAel
   2vb2yZecriiCZQGLMN1PBxmH4p7+h2o49QuR24D8Y+CFb9UxKZQCXB4au
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="321606052"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="321606052"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 22:22:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="674820972"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="674820972"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 23 Feb 2023 22:22:39 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVRTa-0002BZ-2T;
	Fri, 24 Feb 2023 06:22:38 +0000
Date: Fri, 24 Feb 2023 14:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13574/13939] io_uring/rsrc.c:1262
 io_sqe_buffer_register() error: uninitialized symbol 'folio'.
Message-ID: <202302241432.YML1CD5C-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Pavel Begunkov <asml.silence@gmail.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d6d7ce9baaf9e67a85a53afc69a36af716f7670
commit: 57bebf807e2abcf87d96b9de1266104ee2d8fc2f [13574/13939] io_uring/rsrc: optimise registered huge pages
:::::: branch date: 2 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230224/202302241432.YML1CD5C-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302241432.YML1CD5C-lkp@intel.com/

smatch warnings:
io_uring/rsrc.c:1262 io_sqe_buffer_register() error: uninitialized symbol 'folio'.

vim +/folio +1262 io_uring/rsrc.c

73572984481907 Jens Axboe        2022-06-13  1203  
73572984481907 Jens Axboe        2022-06-13  1204  static int io_sqe_buffer_register(struct io_ring_ctx *ctx, struct iovec *iov,
73572984481907 Jens Axboe        2022-06-13  1205  				  struct io_mapped_ubuf **pimu,
73572984481907 Jens Axboe        2022-06-13  1206  				  struct page **last_hpage)
73572984481907 Jens Axboe        2022-06-13  1207  {
73572984481907 Jens Axboe        2022-06-13  1208  	struct io_mapped_ubuf *imu = NULL;
73572984481907 Jens Axboe        2022-06-13  1209  	struct page **pages = NULL;
73572984481907 Jens Axboe        2022-06-13  1210  	unsigned long off;
73572984481907 Jens Axboe        2022-06-13  1211  	size_t size;
73572984481907 Jens Axboe        2022-06-13  1212  	int ret, nr_pages, i;
57bebf807e2abc Pavel Begunkov    2023-02-22  1213  	struct folio *folio;
73572984481907 Jens Axboe        2022-06-13  1214  
73572984481907 Jens Axboe        2022-06-13  1215  	*pimu = ctx->dummy_ubuf;
5ff4fdffad483d Pavel Begunkov    2022-06-15  1216  	if (!iov->iov_base)
73572984481907 Jens Axboe        2022-06-13  1217  		return 0;
73572984481907 Jens Axboe        2022-06-13  1218  
73572984481907 Jens Axboe        2022-06-13  1219  	ret = -ENOMEM;
73572984481907 Jens Axboe        2022-06-13  1220  	pages = io_pin_pages((unsigned long) iov->iov_base, iov->iov_len,
73572984481907 Jens Axboe        2022-06-13  1221  				&nr_pages);
73572984481907 Jens Axboe        2022-06-13  1222  	if (IS_ERR(pages)) {
73572984481907 Jens Axboe        2022-06-13  1223  		ret = PTR_ERR(pages);
73572984481907 Jens Axboe        2022-06-13  1224  		pages = NULL;
73572984481907 Jens Axboe        2022-06-13  1225  		goto done;
73572984481907 Jens Axboe        2022-06-13  1226  	}
73572984481907 Jens Axboe        2022-06-13  1227  
57bebf807e2abc Pavel Begunkov    2023-02-22  1228  	/* If it's a huge page, try to coalesce them into a single bvec entry */
57bebf807e2abc Pavel Begunkov    2023-02-22  1229  	if (nr_pages > 1) {
57bebf807e2abc Pavel Begunkov    2023-02-22  1230  		folio = page_folio(pages[0]);
57bebf807e2abc Pavel Begunkov    2023-02-22  1231  		for (i = 1; i < nr_pages; i++) {
57bebf807e2abc Pavel Begunkov    2023-02-22  1232  			if (page_folio(pages[i]) != folio) {
57bebf807e2abc Pavel Begunkov    2023-02-22  1233  				folio = NULL;
57bebf807e2abc Pavel Begunkov    2023-02-22  1234  				break;
57bebf807e2abc Pavel Begunkov    2023-02-22  1235  			}
57bebf807e2abc Pavel Begunkov    2023-02-22  1236  		}
57bebf807e2abc Pavel Begunkov    2023-02-22  1237  		if (folio) {
57bebf807e2abc Pavel Begunkov    2023-02-22  1238  			folio_put_refs(folio, nr_pages - 1);
57bebf807e2abc Pavel Begunkov    2023-02-22  1239  			nr_pages = 1;
57bebf807e2abc Pavel Begunkov    2023-02-22  1240  		}
57bebf807e2abc Pavel Begunkov    2023-02-22  1241  	}
57bebf807e2abc Pavel Begunkov    2023-02-22  1242  
73572984481907 Jens Axboe        2022-06-13  1243  	imu = kvmalloc(struct_size(imu, bvec, nr_pages), GFP_KERNEL);
73572984481907 Jens Axboe        2022-06-13  1244  	if (!imu)
73572984481907 Jens Axboe        2022-06-13  1245  		goto done;
73572984481907 Jens Axboe        2022-06-13  1246  
73572984481907 Jens Axboe        2022-06-13  1247  	ret = io_buffer_account_pin(ctx, pages, nr_pages, imu, last_hpage);
73572984481907 Jens Axboe        2022-06-13  1248  	if (ret) {
73572984481907 Jens Axboe        2022-06-13  1249  		unpin_user_pages(pages, nr_pages);
73572984481907 Jens Axboe        2022-06-13  1250  		goto done;
73572984481907 Jens Axboe        2022-06-13  1251  	}
73572984481907 Jens Axboe        2022-06-13  1252  
73572984481907 Jens Axboe        2022-06-13  1253  	off = (unsigned long) iov->iov_base & ~PAGE_MASK;
73572984481907 Jens Axboe        2022-06-13  1254  	size = iov->iov_len;
57bebf807e2abc Pavel Begunkov    2023-02-22  1255  	/* store original address for later verification */
57bebf807e2abc Pavel Begunkov    2023-02-22  1256  	imu->ubuf = (unsigned long) iov->iov_base;
57bebf807e2abc Pavel Begunkov    2023-02-22  1257  	imu->ubuf_end = imu->ubuf + iov->iov_len;
57bebf807e2abc Pavel Begunkov    2023-02-22  1258  	imu->nr_bvecs = nr_pages;
57bebf807e2abc Pavel Begunkov    2023-02-22  1259  	*pimu = imu;
57bebf807e2abc Pavel Begunkov    2023-02-22  1260  	ret = 0;
57bebf807e2abc Pavel Begunkov    2023-02-22  1261  
57bebf807e2abc Pavel Begunkov    2023-02-22 @1262  	if (folio) {
57bebf807e2abc Pavel Begunkov    2023-02-22  1263  		bvec_set_page(&imu->bvec[0], pages[0], size, off);
57bebf807e2abc Pavel Begunkov    2023-02-22  1264  		goto done;
57bebf807e2abc Pavel Begunkov    2023-02-22  1265  	}
73572984481907 Jens Axboe        2022-06-13  1266  	for (i = 0; i < nr_pages; i++) {
73572984481907 Jens Axboe        2022-06-13  1267  		size_t vec_len;
73572984481907 Jens Axboe        2022-06-13  1268  
73572984481907 Jens Axboe        2022-06-13  1269  		vec_len = min_t(size_t, size, PAGE_SIZE - off);
cc342a21930f0e Christoph Hellwig 2023-02-03  1270  		bvec_set_page(&imu->bvec[i], pages[i], vec_len, off);
73572984481907 Jens Axboe        2022-06-13  1271  		off = 0;
73572984481907 Jens Axboe        2022-06-13  1272  		size -= vec_len;
73572984481907 Jens Axboe        2022-06-13  1273  	}
73572984481907 Jens Axboe        2022-06-13  1274  done:
73572984481907 Jens Axboe        2022-06-13  1275  	if (ret)
73572984481907 Jens Axboe        2022-06-13  1276  		kvfree(imu);
73572984481907 Jens Axboe        2022-06-13  1277  	kvfree(pages);
73572984481907 Jens Axboe        2022-06-13  1278  	return ret;
73572984481907 Jens Axboe        2022-06-13  1279  }
73572984481907 Jens Axboe        2022-06-13  1280  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
