Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870407E1
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Aug 2023 04:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692766358; x=1724302358;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XrVoK4Raspnl3CBf9xoknhnAVQu4dNuUu4C7WVWohxc=;
  b=J2C/U6BnzuSi8J+dsAHF8yl3+tZY04GpCePxgoYXvT24eGwWaqoj87Ap
   g1wAgsRPS3ck+/IeF83AISQnQcc+P7m8QD9FasQ7wyURmoJef98TJ3ukR
   jKjg78qc5zlsuLWhvvNRMKwQQFQmdvef7ZkoCVDpWUb5KJGnxQ54h3oXd
   Up5qWL8A3V5S4OLYNMdn5imRg1OMvrbSa52GqYYxYU63tjgrs3Cy2C1eY
   6TBwJRHBGm04df6YZowx0/bn4SZhcIuAkznGZr2Go7fGCghGsit62KvZV
   2UMwrn96IZtTqeN1FuWM9dEhyRiPScUad/3WBFSrtPLUgdTviNX2MV63e
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="359052113"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="359052113"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 21:52:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="826575926"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="826575926"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2023 21:52:36 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYfr6-0000rQ-1s;
	Wed, 23 Aug 2023 04:52:33 +0000
Date: Wed, 23 Aug 2023 12:51:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9878/11453] fs/erofs/zdata.c:1054
 z_erofs_do_read_page() error: we previously assumed 'fe->pcl' could be null
 (see line 1002)
Message-ID: <202308231210.8oBFCxip-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Gao Xiang <hsiangkao@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   28c736b0e92e11bfe2b9997688213dc43cb22182
commit: 3b815464a3094b1095a9f333e5c5fb5a6073d89c [9878/11453] erofs: move preparation logic into z_erofs_pcluster_begin()
:::::: branch date: 21 hours ago
:::::: commit date: 6 days ago
config: parisc-randconfig-r071-20230822 (https://download.01.org/0day-ci/archive/20230823/202308231210.8oBFCxip-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231210.8oBFCxip-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308231210.8oBFCxip-lkp@intel.com/

smatch warnings:
fs/erofs/zdata.c:1054 z_erofs_do_read_page() error: we previously assumed 'fe->pcl' could be null (see line 1002)

vim +1054 fs/erofs/zdata.c

b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23   975  
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang         2019-07-31   976  static int z_erofs_do_read_page(struct z_erofs_decompress_frontend *fe,
6ab5eed6002edc fs/erofs/zdata.c                  Gao Xiang         2023-05-27   977  				struct page *page)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   978  {
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang         2019-07-31   979  	struct inode *const inode = fe->inode;
3b423417d0d1d5 drivers/staging/erofs/unzip_vle.c Chao Yu           2019-01-15   980  	struct erofs_map_blocks *const map = &fe->map;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   981  	const loff_t offset = page_offset(page);
5b220b204c5fcd fs/erofs/zdata.c                  Gao Xiang         2022-07-15   982  	bool tight = true, exclusive;
0fe55a9055f0c9 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   983  	unsigned int cur, end, len, spiltted;
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-18   984  	int err = 0;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   985  
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   986  	/* register locked file pages as online pages in pack */
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   987  	z_erofs_onlinepage_init(page);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   988  
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   989  	spiltted = 0;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   990  	end = PAGE_SIZE;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   991  repeat:
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   992  	cur = end - 1;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   993  
39397a46cff3d7 fs/erofs/zdata.c                  Gao Xiang         2022-05-29   994  	if (offset + cur < map->m_la ||
39397a46cff3d7 fs/erofs/zdata.c                  Gao Xiang         2022-05-29   995  	    offset + cur >= map->m_la + map->m_llen) {
74c5187630e862 fs/erofs/zdata.c                  Gao Xiang         2023-08-17   996  		z_erofs_pcluster_end(fe);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   997  		map->m_la = offset + cur;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26   998  		map->m_llen = 0;
97e86a858bc360 drivers/staging/erofs/zdata.c     Gao Xiang         2019-07-31   999  		err = z_erofs_map_blocks_iter(inode, map, 0);
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-30  1000  		if (err)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1001  			goto out;
3b815464a3094b fs/erofs/zdata.c                  Gao Xiang         2023-08-17 @1002  	} else if (fe->pcl) {
39397a46cff3d7 fs/erofs/zdata.c                  Gao Xiang         2022-05-29  1003  		goto hitted;
39397a46cff3d7 fs/erofs/zdata.c                  Gao Xiang         2022-05-29  1004  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1005  
3b815464a3094b fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1006  	if ((map->m_flags & EROFS_MAP_MAPPED) &&
3b815464a3094b fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1007  	    !(map->m_flags & EROFS_MAP_FRAGMENT)) {
74c5187630e862 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1008  		err = z_erofs_pcluster_begin(fe);
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-30  1009  		if (err)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1010  			goto out;
cecf864d3d76d5 fs/erofs/zdata.c                  Yue Hu            2021-12-29  1011  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1012  hitted:
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-22  1013  	/*
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-22  1014  	 * Ensure the current partial page belongs to this submit chain rather
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-22  1015  	 * than other concurrent submit chains or the noio(bypass) chain since
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-22  1016  	 * those chains are handled asynchronously thus the page cannot be used
387bab8716e20f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1017  	 * for inplace I/O or bvpage (should be processed in a strict order.)
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-22  1018  	 */
967c28b23f6c89 fs/erofs/zdata.c                  Gao Xiang         2023-05-27  1019  	tight &= (fe->mode > Z_EROFS_PCLUSTER_FOLLOWED_NOINPLACE);
dc76ea8c1087b5 fs/erofs/zdata.c                  Gao Xiang         2019-09-22  1020  
8191213a5835b0 fs/erofs/zdata.c                  Chunhai Guo       2023-07-10  1021  	cur = end - min_t(erofs_off_t, offset + end - map->m_la, end);
8d8a09b093d707 fs/erofs/zdata.c                  Gao Xiang         2019-08-30  1022  	if (!(map->m_flags & EROFS_MAP_MAPPED)) {
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1023  		zero_user_segment(page, cur, end);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1024  		goto next_part;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1025  	}
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1026  	if (map->m_flags & EROFS_MAP_FRAGMENT) {
0fe55a9055f0c9 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1027  		erofs_off_t fpos = offset + cur - map->m_la;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1028  
0fe55a9055f0c9 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1029  		len = min_t(unsigned int, map->m_llen - fpos, end - cur);
0fe55a9055f0c9 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1030  		err = z_erofs_read_fragment(inode->i_sb, page, cur, cur + len,
0fe55a9055f0c9 fs/erofs/zdata.c                  Gao Xiang         2023-08-17  1031  				EROFS_I(inode)->z_fragmentoff + fpos);
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1032  		if (err)
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1033  			goto out;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1034  		++spiltted;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1035  		tight = false;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1036  		goto next_part;
b15b2e307c3a19 fs/erofs/zdata.c                  Yue Hu            2022-09-23  1037  	}
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1038  
5b220b204c5fcd fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1039  	exclusive = (!cur && (!spiltted || tight));
a112152f6f3a2a drivers/staging/erofs/unzip_vle.c Gao Xiang         2019-02-27  1040  	if (cur)
db166fc2020d30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1041  		tight &= (fe->mode >= Z_EROFS_PCLUSTER_FOLLOWED);
a112152f6f3a2a drivers/staging/erofs/unzip_vle.c Gao Xiang         2019-02-27  1042  
06a304cd9cc095 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1043  	err = z_erofs_attach_page(fe, &((struct z_erofs_bvec) {
06a304cd9cc095 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1044  					.page = page,
06a304cd9cc095 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1045  					.offset = offset - map->m_la,
06a304cd9cc095 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1046  					.end = end,
5b220b204c5fcd fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1047  				  }), exclusive);
05b63d2beb8b0f fs/erofs/zdata.c                  Gao Xiang         2023-05-27  1048  	if (err)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1049  		goto out;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1050  
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1051  	z_erofs_onlinepage_split(page);
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-18  1052  	/* bump up the number of spiltted parts of a page */
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-18  1053  	++spiltted;
267f2492c8f71d fs/erofs/zdata.c                  Gao Xiang         2022-07-15 @1054  	if (fe->pcl->pageofs_out != (map->m_la & ~PAGE_MASK))
267f2492c8f71d fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1055  		fe->pcl->multibases = true;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1056  	if (fe->pcl->length < offset + end - map->m_la) {
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1057  		fe->pcl->length = offset + end - map->m_la;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1058  		fe->pcl->pageofs_out = map->m_la & ~PAGE_MASK;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1059  	}
e7933278b442f9 fs/erofs/zdata.c                  Gao Xiang         2022-10-14  1060  	if ((map->m_flags & EROFS_MAP_FULL_MAPPED) &&
e7933278b442f9 fs/erofs/zdata.c                  Gao Xiang         2022-10-14  1061  	    !(map->m_flags & EROFS_MAP_PARTIAL_REF) &&
e7933278b442f9 fs/erofs/zdata.c                  Gao Xiang         2022-10-14  1062  	    fe->pcl->length == map->m_llen)
e7933278b442f9 fs/erofs/zdata.c                  Gao Xiang         2022-10-14  1063  		fe->pcl->partial = false;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1064  next_part:
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1065  	/* shorten the remaining extent to update progress */
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1066  	map->m_llen = offset + cur - map->m_la;
2bfab9c0edac5f fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1067  	map->m_flags &= ~EROFS_MAP_FULL_MAPPED;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1068  
2bc7596438aba6 drivers/staging/erofs/unzip_vle.c Kristaps Čivkulis 2018-08-05  1069  	end = cur;
2bc7596438aba6 drivers/staging/erofs/unzip_vle.c Kristaps Čivkulis 2018-08-05  1070  	if (end > 0)
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1071  		goto repeat;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1072  
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-18  1073  out:
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1074  	if (err)
671485516e1c30 fs/erofs/zdata.c                  Gao Xiang         2022-07-15  1075  		z_erofs_page_mark_eio(page);
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1076  	z_erofs_onlinepage_endio(page);
1e05ff36e6921c drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-09-18  1077  	return err;
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1078  }
3883a79abd0227 drivers/staging/erofs/unzip_vle.c Gao Xiang         2018-07-26  1079  

:::::: The code at line 1054 was first introduced by commit
:::::: 267f2492c8f71dac44399988b510f9bf6b074a51 erofs: introduce multi-reference pclusters (fully-referenced)

:::::: TO: Gao Xiang <hsiangkao@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
