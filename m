Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9896D1A7
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Mar 2024 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710410189; cv=none; b=urDsMkU6GAxnG9B/Vh+693GGSUgoOKm/xajd4ZimJulHf4t3+xQIbI7DtTzkIjOp9V16QrfJPmxwrwh8uE/XcHG6/KzeRa2cUK7bOi9sRaq2W3T2/SmcvvfaMPlHSaDW7OURBTg97q6/seb3P7DP9QS/PeSDQo9YvwLUeRblcjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710410189; c=relaxed/simple;
	bh=hui4zLYQohw2O5A4O9Dr0yF+A91CfEuBSWeupIxUXq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BwQZg0OqKJLWrfkO86mR19d1hYOa8LypYNo0je4pzzBYXJIVaNHoQp02C3WZbjDoOpUnzu1dvj6OWZtiuaHHr4SE/ycJh+wVvSBNvClSgvOjVD4dc7qDxHC74hrTOkPe/KPzqhVcnCpt58MEvljo25SKqpSbKUMTZf3wfncSUkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U+mGKbOB; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U+mGKbOB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710410187; x=1741946187;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hui4zLYQohw2O5A4O9Dr0yF+A91CfEuBSWeupIxUXq4=;
  b=U+mGKbOBOLAIhLTc8YYj3RiE+h+eNXINswBbjcHr/Zz3ls7ya8rhXOl3
   QEBHqBpjM1Zjky1rV9zAtvHF6k1/6PweZEiD9C43+8gZoC2NLmfY65Ayd
   cIQEzEFNuzSbxIHW/4Mmo28qCM+gJGsT8qKaEeTu0uOxB4hB+P7X8OQp2
   8USYT9aPZQ4XSQNasRWI7wWYf827Kg36tu5OdPknFpduUb74nIm6QLoY+
   XF9+sziwhG9kJBdLOznw3JTDN63zj0sUiUVT9UG0+Kc19EJX/cWG7yvku
   fmZ3pBpTkjE6pngaqf5szxYvDOWP1HnWppbTdiwcnhb+JMDc5OPdeGRmG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5157886"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5157886"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 02:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="12117417"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Mar 2024 02:56:23 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkhoz-000DJl-1m;
	Thu, 14 Mar 2024 09:56:21 +0000
Date: Thu, 14 Mar 2024 17:55:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/erofs/zdata.c:1009 z_erofs_scan_folio() error: we previously
 assumed 'fe->pcl' could be null (see line 1005)
Message-ID: <202403141751.DNs0exU0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gao Xiang <hsiangkao@linux.alibaba.com>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   480e035fc4c714fb5536e64ab9db04fedc89e910
commit: 0e25a788ea2c4a6f5f971279396fcf79f4fecd7b erofs: convert z_erofs_do_read_page() to folios
date:   4 days ago
:::::: branch date: 8 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20240313 (https://download.01.org/0day-ci/archive/20240314/202403141751.DNs0exU0-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403141751.DNs0exU0-lkp@intel.com/

smatch warnings:
fs/erofs/zdata.c:1009 z_erofs_scan_folio() error: we previously assumed 'fe->pcl' could be null (see line 1005)

vim +1009 fs/erofs/zdata.c

b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23   957  
0e25a788ea2c4a fs/erofs/zdata.c                  Gao Xiang         2024-03-05   958  static int z_erofs_scan_folio(struct z_erofs_decompress_frontend *fe,
0e25a788ea2c4a fs/erofs/zdata.c                  Gao Xiang         2024-03-05   959  			      struct folio *folio, bool ra)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   960  {
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang         2019-07-31   961  	struct inode *const inode = fe->inode;
3b423417d0d1d5 drivers/staging/erofs/unzip_vle.c Chao Yu           2019-01-15   962  	struct erofs_map_blocks *const map = &fe->map;
0e25a788ea2c4a fs/erofs/zdata.c                  Gao Xiang         2024-03-05   963  	const loff_t offset = folio_pos(folio);
0e25a788ea2c4a fs/erofs/zdata.c                  Gao Xiang         2024-03-05   964  	const unsigned int bs = i_blocksize(inode), fs = folio_size(folio);
5b220b204c5fcd fs/erofs/zdata.c                  Gao Xiang         2022-07-15   965  	bool tight = true, exclusive;
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   966  	unsigned int cur, end, len, split;
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-18   967  	int err = 0;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   968  
d136d335861613 fs/erofs/zdata.c                  Gao Xiang         2024-03-05   969  	z_erofs_onlinefolio_init(folio);
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   970  	split = 0;
0e25a788ea2c4a fs/erofs/zdata.c                  Gao Xiang         2024-03-05   971  	end = fs;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   972  repeat:
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   973  	if (offset + end - 1 < map->m_la ||
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   974  	    offset + end - 1 >= map->m_la + map->m_llen) {
dcba1b232e26eb fs/erofs/zdata.c                  Gao Xiang         2023-08-17   975  		z_erofs_pcluster_end(fe);
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   976  		map->m_la = offset + end - 1;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   977  		map->m_llen = 0;
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang         2019-07-31   978  		err = z_erofs_map_blocks_iter(inode, map, 0);
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-30   979  		if (err)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15   980  			goto out;
39397a46cff3d7 fs/erofs/zdata.c                  Gao Xiang         2022-05-29   981  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   982  
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   983  	cur = offset > map->m_la ? 0 : map->m_la - offset;
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   984  	/* bump split parts first to avoid several separate cases */
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   985  	++split;
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-22   986  
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-30   987  	if (!(map->m_flags & EROFS_MAP_MAPPED)) {
0e25a788ea2c4a fs/erofs/zdata.c                  Gao Xiang         2024-03-05   988  		folio_zero_segment(folio, cur, end);
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   989  		tight = false;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   990  		goto next_part;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   991  	}
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   992  
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23   993  	if (map->m_flags & EROFS_MAP_FRAGMENT) {
8b00be163f7b57 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   994  		erofs_off_t fpos = offset + cur - map->m_la;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23   995  
8b00be163f7b57 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   996  		len = min_t(unsigned int, map->m_llen - fpos, end - cur);
0e25a788ea2c4a fs/erofs/zdata.c                  Gao Xiang         2024-03-05   997  		err = z_erofs_read_fragment(inode->i_sb, &folio->page, cur,
0e25a788ea2c4a fs/erofs/zdata.c                  Gao Xiang         2024-03-05   998  			cur + len, EROFS_I(inode)->z_fragmentoff + fpos);
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23   999  		if (err)
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1000  			goto out;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1001  		tight = false;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1002  		goto next_part;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1003  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1004  
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17 @1005  	if (!fe->pcl) {
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1006  		err = z_erofs_pcluster_begin(fe);
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1007  		if (err)
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1008  			goto out;
d9281660ff3ffb fs/erofs/zdata.c                  Chunhai Guo       2024-01-26 @1009  		fe->pcl->besteffort |= !ra;
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1010  	}
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1011  
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1012  	/*
0e25a788ea2c4a fs/erofs/zdata.c                  Gao Xiang         2024-03-05  1013  	 * Ensure the current partial folio belongs to this submit chain rather
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1014  	 * than other concurrent submit chains or the noio(bypass) chain since
0e25a788ea2c4a fs/erofs/zdata.c                  Gao Xiang         2024-03-05  1015  	 * those chains are handled asynchronously thus the folio cannot be used
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1016  	 * for inplace I/O or bvpage (should be processed in a strict order.)
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1017  	 */
e4c1cf523d8207 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1018  	tight &= (fe->mode > Z_EROFS_PCLUSTER_FOLLOWED_NOINPLACE);
0e25a788ea2c4a fs/erofs/zdata.c                  Gao Xiang         2024-03-05  1019  	exclusive = (!cur && ((split <= 1) || (tight && bs == fs)));
a112152f6f3a2a drivers/staging/erofs/unzip_vle.c Gao Xiang         2019-02-27  1020  	if (cur)
db166fc2020d30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1021  		tight &= (fe->mode >= Z_EROFS_PCLUSTER_FOLLOWED);
a112152f6f3a2a drivers/staging/erofs/unzip_vle.c Gao Xiang         2019-02-27  1022  
06a304cd9cc095 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1023  	err = z_erofs_attach_page(fe, &((struct z_erofs_bvec) {
0e25a788ea2c4a fs/erofs/zdata.c                  Gao Xiang         2024-03-05  1024  					.page = &folio->page,
06a304cd9cc095 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1025  					.offset = offset - map->m_la,
06a304cd9cc095 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1026  					.end = end,
5b220b204c5fcd fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1027  				  }), exclusive);
05b63d2beb8b0f fs/erofs/zdata.c                  Gao Xiang         2023-05-27  1028  	if (err)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1029  		goto out;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1030  
d136d335861613 fs/erofs/zdata.c                  Gao Xiang         2024-03-05  1031  	z_erofs_onlinefolio_split(folio);
267f2492c8f71d fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1032  	if (fe->pcl->pageofs_out != (map->m_la & ~PAGE_MASK))
267f2492c8f71d fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1033  		fe->pcl->multibases = true;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1034  	if (fe->pcl->length < offset + end - map->m_la) {
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1035  		fe->pcl->length = offset + end - map->m_la;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1036  		fe->pcl->pageofs_out = map->m_la & ~PAGE_MASK;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1037  	}
e7933278b442f9 fs/erofs/zdata.c                  Gao Xiang         2022-10-14  1038  	if ((map->m_flags & EROFS_MAP_FULL_MAPPED) &&
e7933278b442f9 fs/erofs/zdata.c                  Gao Xiang         2022-10-14  1039  	    !(map->m_flags & EROFS_MAP_PARTIAL_REF) &&
e7933278b442f9 fs/erofs/zdata.c                  Gao Xiang         2022-10-14  1040  	    fe->pcl->length == map->m_llen)
e7933278b442f9 fs/erofs/zdata.c                  Gao Xiang         2022-10-14  1041  		fe->pcl->partial = false;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1042  next_part:
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1043  	/* shorten the remaining extent to update progress */
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1044  	map->m_llen = offset + cur - map->m_la;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1045  	map->m_flags &= ~EROFS_MAP_FULL_MAPPED;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1046  
2bc7596438aba6 drivers/staging/erofs/unzip_vle.c Kristaps Čivkulis 2018-08-05  1047  	end = cur;
2bc7596438aba6 drivers/staging/erofs/unzip_vle.c Kristaps Čivkulis 2018-08-05  1048  	if (end > 0)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1049  		goto repeat;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1050  
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-18  1051  out:
d136d335861613 fs/erofs/zdata.c                  Gao Xiang         2024-03-05  1052  	z_erofs_onlinefolio_end(folio, err);
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-18  1053  	return err;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1054  }
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1055  

:::::: The code at line 1009 was first introduced by commit
:::::: d9281660ff3ffb4a05302b485cc59a87e709aefc erofs: relaxed temporary buffers allocation on readahead

:::::: TO: Chunhai Guo <guochunhai@vivo.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
