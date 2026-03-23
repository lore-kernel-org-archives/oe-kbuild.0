Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B76386C0E
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774258681; cv=none; b=IWcAtk8wYWoiJ4m59cTv3DyN36okuboH1xYosxvdzeGCo320Z0jAg8p4E2YhL/Hl8VPQwu4CI/YUTXpAS18zKVmjXuhrx8ecI+LWqzVApSs1JfzMQajBJp1R7c2yMEQFKhEU0ZRXOQGWAi49w8g9EFHwUxLVEgEyzn8sMI/WgzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774258681; c=relaxed/simple;
	bh=Mh2FkQGvRGG7D5WXNqQF/3/tCeVH7ZiGtMGv+FfMcHY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kaOHG+TU/lYili8c8jl6RMLCfVv62wnAgXldtyqCKAYw1j8+jsM0p17k3jq69PDzByABFoD+ll7lGefQFC0ulHMnjkJEo5vIwYyCB7xk/tsk+nEFFNuonussdq1rLKfuwTjJ9ZEEPEHhbu8rP/JEvOPfGlXCyGCUUjddZ8tuzhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CYnMU9Gn; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CYnMU9Gn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774258680; x=1805794680;
  h=date:from:to:cc:subject:message-id;
  bh=Mh2FkQGvRGG7D5WXNqQF/3/tCeVH7ZiGtMGv+FfMcHY=;
  b=CYnMU9GnHAvg2pkvn6kTDQD6t7LmwrJ78v3Q5cdBqeC1hHiV9tHlS0tG
   yImmmXLluXzyKKY/zanUtDfFa/rhRyzIhUTdZQR+jgDei9LtXhofGd23p
   ljc+juX2BLcXl5mhtrZDMt5Ym2LAJ2fexYMIdI2btJNPQgqo0SQOwQ/Em
   EmYQUtDeAvjX9ryk9h1iEs6qNMLU5czDOIF12KsWtxGSR4BZ3SW78/1RT
   mNHX6ynQz3DlT+1zy2v9gdBYU2dOHWbkZ1gCfGsTn6axDxjoI84/lY5oW
   K7BnimR0nJdeBcVRppufA+yd06N9ea+ZJkSS16yRpmsrU+42ROUVjOFgX
   Q==;
X-CSE-ConnectionGUID: a8J7wDJlQHmJjkmXDL2v7A==
X-CSE-MsgGUID: NyJPDFA0RHmO7W6pdhcibA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="100704028"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="100704028"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:37:58 -0700
X-CSE-ConnectionGUID: VUWLn+sIR9urp7xefbivVg==
X-CSE-MsgGUID: inlhP+WtSOW81bVVwj7fkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="219623136"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Mar 2026 02:37:57 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4bjO-000000000Iz-0WzM;
	Mon, 23 Mar 2026 09:37:54 +0000
Date: Mon, 23 Mar 2026 17:37:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/f2fs/data.c:348 f2fs_write_end_io() error: 'folio'
 dereferencing possible ERR_PTR()
Message-ID: <202603231712.SO7KRW6o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: fb9660481e3ccb26143c0596420487513383e940 f2fs: Convert f2fs_write_end_io() to use a folio_iter
date:   1 year, 1 month ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20260323 (https://download.01.org/0day-ci/archive/20260323/202603231712.SO7KRW6o-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603231712.SO7KRW6o-lkp@intel.com/

New smatch warnings:
fs/f2fs/data.c:348 f2fs_write_end_io() error: 'folio' dereferencing possible ERR_PTR()

Old smatch warnings:
fs/f2fs/data.c:270 f2fs_post_read_work() warn: bitwise AND condition is false here
fs/f2fs/data.c:351 f2fs_write_end_io() error: 'folio' dereferencing possible ERR_PTR()
fs/f2fs/data.c:357 f2fs_write_end_io() error: 'folio' dereferencing possible ERR_PTR()
fs/f2fs/data.c:2227 f2fs_read_multi_pages() warn: missing error code 'ret'

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
