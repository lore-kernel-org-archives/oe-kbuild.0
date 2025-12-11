Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093293B8D5D
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 00:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765413133; cv=none; b=offqpIcOcljyF8/RPYoOyQe/Q0Jl7hSu9nhLb+aW4+xR24ShbmrShsnnt0VFVyiVnEbjzUQPHdT5X/wKpq5rfqS3iZPZEzU/a/urf2AvPzpFoYW9nwZLamu0dBtKKg34Ou3pP+dmoduKnk1/loBB/ScY+D1JKccE/9eVq2QsQvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765413133; c=relaxed/simple;
	bh=SaDanjv1KZhPt3CqyPZvjMs6aGR5rg3DHtBX3Luh/9o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ui56vyqYh5rlKMijV7r/wPNA8TRdamhr70bgRhdK/Hh6WdUneBg7d1wLOtJyoYfnkxwAwh3arQT9/HONqJlQQaZ4IBhsJYxW2MYRBaElfBnRi1Fr2JcyNwFtibdx17gEipGFwQb94jGD6SOd0AakKEU4OItIR2qKxqMyevPsPHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z4znPMgn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z4znPMgn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765413132; x=1796949132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SaDanjv1KZhPt3CqyPZvjMs6aGR5rg3DHtBX3Luh/9o=;
  b=Z4znPMgnxkDclyUHRUxgo3mpX3d7rgACLqqNb9c7hGphKWneFWeb9277
   nLIYZki7OmLpnbiu+VA9Cx2GlQ/sjVkqhKeeQe00RxhyNyDOj2OdD9Goh
   w46Xwljr626UECRG2nzcKq6becWkS5sO5+e8sitv95v2A7iwXqQO0DNsG
   0W/uwPeZmnveo86Miuq/Ge1LlQ8Ld5dDwS0VbsgwQ15aY6BOZaEjJhriq
   FmP4TbdLVBrAONNsxAQChlupY14B/ubanMT9xT2ebcbseqKw7BuaTZyyY
   EIm3ks+fwg7szKcZ9n/5u0J1OvhNcWr3ajVilGr0ZV61/xPATGRI6DaBh
   g==;
X-CSE-ConnectionGUID: Z79dIZRESuuSx9H2doctcA==
X-CSE-MsgGUID: l8JgPrxEQweUIv5wZEsgKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92870185"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="92870185"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 16:32:11 -0800
X-CSE-ConnectionGUID: RUPd5Wf2QFu8TtLAAeqSKw==
X-CSE-MsgGUID: IozYKOQbShaPPqa2Uei+rw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Dec 2025 16:32:10 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTUbI-000000003u1-22Py;
	Thu, 11 Dec 2025 00:32:08 +0000
Date: Thu, 11 Dec 2025 08:31:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/f2fs/data.c:348 f2fs_write_end_io() error: 'folio' dereferencing
 possible ERR_PTR()
Message-ID: <202512110850.9WsI7CfL-lkp@intel.com>
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
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0048fbb4011ec55c32d3148b2cda56433f273375
commit: fb9660481e3ccb26143c0596420487513383e940 f2fs: Convert f2fs_write_end_io() to use a folio_iter
date:   9 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 9 months ago
config: arm-randconfig-r072-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110850.9WsI7CfL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512110850.9WsI7CfL-lkp@intel.com/

New smatch warnings:
fs/f2fs/data.c:348 f2fs_write_end_io() error: 'folio' dereferencing possible ERR_PTR()

Old smatch warnings:
fs/f2fs/data.c:270 f2fs_post_read_work() warn: bitwise AND condition is false here
fs/f2fs/data.c:275 f2fs_post_read_work() warn: bitwise AND condition is false here
fs/f2fs/data.c:351 f2fs_write_end_io() error: 'folio' dereferencing possible ERR_PTR()
fs/f2fs/data.c:357 f2fs_write_end_io() error: 'folio' dereferencing possible ERR_PTR()

vim +/folio +348 fs/f2fs/data.c

4c8ff7095bef64 Chao Yu                 2019-11-01  347  
fb9660481e3ccb Matthew Wilcox (Oracle  2025-02-18 @348) 		type = WB_DATA_TYPE(&folio->page, false);
fb9660481e3ccb Matthew Wilcox (Oracle  2025-02-18  349) 
4e4cbee93d5613 Christoph Hellwig       2017-06-03  350  		if (unlikely(bio->bi_status)) {
fb9660481e3ccb Matthew Wilcox (Oracle  2025-02-18  351) 			mapping_set_error(folio->mapping, -EIO);
b1ca321d1cd8f0 Jaegeuk Kim             2017-12-31  352  			if (type == F2FS_WB_CP_DATA)
a9cfee0ef98e99 Chao Yu                 2022-09-28  353  				f2fs_stop_checkpoint(sbi, true,
a9cfee0ef98e99 Chao Yu                 2022-09-28  354  						STOP_CP_REASON_WRITE_FAIL);
93dfe2ac516250 Jaegeuk Kim             2013-11-30  355  		}
7dff55d27e07c5 Yunlei He               2018-01-11  356  
fb9660481e3ccb Matthew Wilcox (Oracle  2025-02-18  357) 		f2fs_bug_on(sbi, folio->mapping == NODE_MAPPING(sbi) &&
fb9660481e3ccb Matthew Wilcox (Oracle  2025-02-18  358) 				folio->index != nid_of_node(&folio->page));
7dff55d27e07c5 Yunlei He               2018-01-11  359  
36951b38d13ac7 Chao Yu                 2016-11-16  360  		dec_page_count(sbi, type);
fb9660481e3ccb Matthew Wilcox (Oracle  2025-02-18  361) 		if (f2fs_in_warm_node_list(sbi, &folio->page))
fb9660481e3ccb Matthew Wilcox (Oracle  2025-02-18  362) 			f2fs_del_fsync_node_entry(sbi, &folio->page);
fb9660481e3ccb Matthew Wilcox (Oracle  2025-02-18  363) 		clear_page_private_gcing(&folio->page);
fb9660481e3ccb Matthew Wilcox (Oracle  2025-02-18  364) 		folio_end_writeback(folio);
f568849edac861 Linus Torvalds          2014-01-30  365  	}
36951b38d13ac7 Chao Yu                 2016-11-16  366  	if (!get_pages(sbi, F2FS_WB_CP_DATA) &&
f573018491fd82 Jaegeuk Kim             2016-05-17  367  				wq_has_sleeper(&sbi->cp_wait))
93dfe2ac516250 Jaegeuk Kim             2013-11-30  368  		wake_up(&sbi->cp_wait);
93dfe2ac516250 Jaegeuk Kim             2013-11-30  369  
93dfe2ac516250 Jaegeuk Kim             2013-11-30  370  	bio_put(bio);
93dfe2ac516250 Jaegeuk Kim             2013-11-30  371  }
93dfe2ac516250 Jaegeuk Kim             2013-11-30  372  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
