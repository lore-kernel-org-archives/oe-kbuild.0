Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE83B7F0
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 04:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693716286; x=1725252286;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KgGV2fUIndbcGmOXWxOyJelVfNcuJXaFKAGBYeQL0b8=;
  b=nQGiBtmrumAMB3Oh90s6hgUxxZZIBnjP2ieuQtYDSPusopJgwPb0qrpE
   +kC7WxViq0LWiXQxvj9Du5phTwAkFmrovPbLiQyHupsohY5DUpfhhiLa5
   3UYm5gtO8b1aS8EEDvCO1Uc7yZ5U+3W5TnRgtetc9dZBhT6kosU/qgVy9
   D2tjOqDVELI1Bt7fivzvYUX4vOBZtJjW2Afjt9fXjkOS2cmTUGuIzpHx+
   tW21m9nyF57VL+2ujQnTq+BIkV6Qcomq+++VzljCO1S5Ji8tZ0mYG4bBn
   hHywcfOjxbeRAbss0M7565aYtjynpwkZqtwfRLPuheckWQQgkFsPg16Se
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="356736061"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="356736061"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 21:44:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="769638524"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="769638524"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 02 Sep 2023 21:44:43 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qceyX-0002tf-00;
	Sun, 03 Sep 2023 04:44:41 +0000
Date: Sun, 3 Sep 2023 12:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/erofs/zdata.c:1055 z_erofs_do_read_page() error: we previously
 assumed 'fe->pcl' could be null (see line 1003)
Message-ID: <202309031232.ko4S6XwT-lkp@intel.com>
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
CC: Yue Hu <huyue2@coolpad.com>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   92901222f83d988617aee37680cb29e1a743b5e4
commit: aeebae9d77217709f8ae3edb0cd7858ec8c7a9d6 erofs: move preparation logic into z_erofs_pcluster_begin()
date:   11 days ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-161-20230902 (https://download.01.org/0day-ci/archive/20230903/202309031232.ko4S6XwT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309031232.ko4S6XwT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309031232.ko4S6XwT-lkp@intel.com/

smatch warnings:
fs/erofs/zdata.c:1055 z_erofs_do_read_page() error: we previously assumed 'fe->pcl' could be null (see line 1003)

vim +1055 fs/erofs/zdata.c

b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23   976  
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang         2019-07-31   977  static int z_erofs_do_read_page(struct z_erofs_decompress_frontend *fe,
6ab5eed6002edc fs/erofs/zdata.c                  Gao Xiang         2023-05-27   978  				struct page *page)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   979  {
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang         2019-07-31   980  	struct inode *const inode = fe->inode;
3b423417d0d1d5 drivers/staging/erofs/unzip_vle.c Chao Yu           2019-01-15   981  	struct erofs_map_blocks *const map = &fe->map;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   982  	const loff_t offset = page_offset(page);
5b220b204c5fcd fs/erofs/zdata.c                  Gao Xiang         2022-07-15   983  	bool tight = true, exclusive;
8b00be163f7b57 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   984  	unsigned int cur, end, len, spiltted;
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-18   985  	int err = 0;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   986  
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   987  	/* register locked file pages as online pages in pack */
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   988  	z_erofs_onlinepage_init(page);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   989  
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   990  	spiltted = 0;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   991  	end = PAGE_SIZE;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   992  repeat:
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   993  	cur = end - 1;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   994  
39397a46cff3d7 fs/erofs/zdata.c                  Gao Xiang         2022-05-29   995  	if (offset + cur < map->m_la ||
39397a46cff3d7 fs/erofs/zdata.c                  Gao Xiang         2022-05-29   996  	    offset + cur >= map->m_la + map->m_llen) {
dcba1b232e26eb fs/erofs/zdata.c                  Gao Xiang         2023-08-17   997  		z_erofs_pcluster_end(fe);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   998  		map->m_la = offset + cur;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   999  		map->m_llen = 0;
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang         2019-07-31  1000  		err = z_erofs_map_blocks_iter(inode, map, 0);
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-30  1001  		if (err)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1002  			goto out;
aeebae9d772177 fs/erofs/zdata.c                  Gao Xiang         2023-08-17 @1003  	} else if (fe->pcl) {
39397a46cff3d7 fs/erofs/zdata.c                  Gao Xiang         2022-05-29  1004  		goto hitted;
39397a46cff3d7 fs/erofs/zdata.c                  Gao Xiang         2022-05-29  1005  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1006  
aeebae9d772177 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1007  	if ((map->m_flags & EROFS_MAP_MAPPED) &&
aeebae9d772177 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1008  	    !(map->m_flags & EROFS_MAP_FRAGMENT)) {
dcba1b232e26eb fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1009  		err = z_erofs_pcluster_begin(fe);
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-30  1010  		if (err)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1011  			goto out;
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu            2021-12-29  1012  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1013  hitted:
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-22  1014  	/*
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-22  1015  	 * Ensure the current partial page belongs to this submit chain rather
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-22  1016  	 * than other concurrent submit chains or the noio(bypass) chain since
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-22  1017  	 * those chains are handled asynchronously thus the page cannot be used
387bab8716e20f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1018  	 * for inplace I/O or bvpage (should be processed in a strict order.)
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-22  1019  	 */
967c28b23f6c89 fs/erofs/zdata.c                  Gao Xiang         2023-05-27  1020  	tight &= (fe->mode > Z_EROFS_PCLUSTER_FOLLOWED_NOINPLACE);
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-22  1021  
8191213a5835b0 fs/erofs/zdata.c                  Chunhai Guo       2023-07-10  1022  	cur = end - min_t(erofs_off_t, offset + end - map->m_la, end);
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-30  1023  	if (!(map->m_flags & EROFS_MAP_MAPPED)) {
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1024  		zero_user_segment(page, cur, end);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1025  		goto next_part;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1026  	}
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1027  	if (map->m_flags & EROFS_MAP_FRAGMENT) {
8b00be163f7b57 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1028  		erofs_off_t fpos = offset + cur - map->m_la;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1029  
8b00be163f7b57 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1030  		len = min_t(unsigned int, map->m_llen - fpos, end - cur);
8b00be163f7b57 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1031  		err = z_erofs_read_fragment(inode->i_sb, page, cur, cur + len,
8b00be163f7b57 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1032  				EROFS_I(inode)->z_fragmentoff + fpos);
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1033  		if (err)
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1034  			goto out;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1035  		++spiltted;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1036  		tight = false;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1037  		goto next_part;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1038  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1039  
5b220b204c5fcd fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1040  	exclusive = (!cur && (!spiltted || tight));
a112152f6f3a2a drivers/staging/erofs/unzip_vle.c Gao Xiang         2019-02-27  1041  	if (cur)
db166fc2020d30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1042  		tight &= (fe->mode >= Z_EROFS_PCLUSTER_FOLLOWED);
a112152f6f3a2a drivers/staging/erofs/unzip_vle.c Gao Xiang         2019-02-27  1043  
06a304cd9cc095 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1044  	err = z_erofs_attach_page(fe, &((struct z_erofs_bvec) {
06a304cd9cc095 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1045  					.page = page,
06a304cd9cc095 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1046  					.offset = offset - map->m_la,
06a304cd9cc095 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1047  					.end = end,
5b220b204c5fcd fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1048  				  }), exclusive);
05b63d2beb8b0f fs/erofs/zdata.c                  Gao Xiang         2023-05-27  1049  	if (err)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1050  		goto out;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1051  
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1052  	z_erofs_onlinepage_split(page);
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-18  1053  	/* bump up the number of spiltted parts of a page */
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-18  1054  	++spiltted;
267f2492c8f71d fs/erofs/zdata.c                  Gao Xiang         2022-07-15 @1055  	if (fe->pcl->pageofs_out != (map->m_la & ~PAGE_MASK))
267f2492c8f71d fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1056  		fe->pcl->multibases = true;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1057  	if (fe->pcl->length < offset + end - map->m_la) {
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1058  		fe->pcl->length = offset + end - map->m_la;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1059  		fe->pcl->pageofs_out = map->m_la & ~PAGE_MASK;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1060  	}
e7933278b442f9 fs/erofs/zdata.c                  Gao Xiang         2022-10-14  1061  	if ((map->m_flags & EROFS_MAP_FULL_MAPPED) &&
e7933278b442f9 fs/erofs/zdata.c                  Gao Xiang         2022-10-14  1062  	    !(map->m_flags & EROFS_MAP_PARTIAL_REF) &&
e7933278b442f9 fs/erofs/zdata.c                  Gao Xiang         2022-10-14  1063  	    fe->pcl->length == map->m_llen)
e7933278b442f9 fs/erofs/zdata.c                  Gao Xiang         2022-10-14  1064  		fe->pcl->partial = false;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1065  next_part:
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1066  	/* shorten the remaining extent to update progress */
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1067  	map->m_llen = offset + cur - map->m_la;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1068  	map->m_flags &= ~EROFS_MAP_FULL_MAPPED;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1069  
2bc7596438aba6 drivers/staging/erofs/unzip_vle.c Kristaps Čivkulis 2018-08-05  1070  	end = cur;
2bc7596438aba6 drivers/staging/erofs/unzip_vle.c Kristaps Čivkulis 2018-08-05  1071  	if (end > 0)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1072  		goto repeat;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1073  
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-18  1074  out:
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1075  	if (err)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1076  		z_erofs_page_mark_eio(page);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1077  	z_erofs_onlinepage_endio(page);
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-18  1078  	return err;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1079  }
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1080  

:::::: The code at line 1055 was first introduced by commit
:::::: 267f2492c8f71dac44399988b510f9bf6b074a51 erofs: introduce multi-reference pclusters (fully-referenced)

:::::: TO: Gao Xiang <hsiangkao@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
