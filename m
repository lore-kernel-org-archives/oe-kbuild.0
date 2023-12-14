Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F1C663D
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 01:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OyUTrkSU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702518384; x=1734054384;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Elr32xQi+hjbnJJhzDlO4PbGcT9qgA19xZYHcbAye1k=;
  b=OyUTrkSUIEYeXeLey/OORNhaq3aeV6yt8yJ7P8/KKocCrWJWg9gpgyzk
   HJa21GgAaUCKkI2ANVKDNRIzcMdq1jwh2eI85HEsBALeuS8nphfO08QHB
   Njlf5VBwUOd9LDh7ScWP31zr4c1UBkjU074H8pr+C5xhcvYcMIuHWISZd
   NZJFhjhF+V+NCxD+m6NpzhL+DQSJFmuzA6CdfpWFYGU0aPwkHOFQ5KWmW
   CZ7dxawrjAaP7Tj6ViwQ/kQ0C/SBZvmvR4Q1WYL4rIDhNdXQdEsy6L0RG
   jQg5Gz5yw7ImOpda6seWvjNmfGj3IkpEZn13nX0K6gJcVcTBvT/ahH01L
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="393925391"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="393925391"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 17:46:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; 
   d="scan'208";a="22198627"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 13 Dec 2023 17:46:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDanr-000LP1-13;
	Thu, 14 Dec 2023 01:46:19 +0000
Date: Thu, 14 Dec 2023 09:46:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6539/7300] fs/bcachefs/inode.c:1171
 bch2_delete_dead_inodes() error: potentially using uninitialized 'ret'.
Message-ID: <202312140919.3UmtzaUx-lkp@intel.com>
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
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   48e8992e33abf054bcc0bb2e77b2d43bb899212e
commit: 008e9bf5db2fb925935cd95a42c417569421bdee [6539/7300] bcachefs: Kill for_each_btree_key()
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20231213 (https://download.01.org/0day-ci/archive/20231214/202312140919.3UmtzaUx-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312140919.3UmtzaUx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312140919.3UmtzaUx-lkp@intel.com/

smatch warnings:
fs/bcachefs/inode.c:1171 bch2_delete_dead_inodes() error: potentially using uninitialized 'ret'.

vim +/ret +1171 fs/bcachefs/inode.c

dde8cb11645b7d Kent Overstreet 2023-07-17  1154  
dde8cb11645b7d Kent Overstreet 2023-07-17  1155  int bch2_delete_dead_inodes(struct bch_fs *c)
dde8cb11645b7d Kent Overstreet 2023-07-17  1156  {
6bd68ec266ad71 Kent Overstreet 2023-09-12  1157  	struct btree_trans *trans = bch2_trans_get(c);
dde8cb11645b7d Kent Overstreet 2023-07-17  1158  	struct btree_iter iter;
dde8cb11645b7d Kent Overstreet 2023-07-17  1159  	struct bkey_s_c k;
4bd156c4b44ef3 Kent Overstreet 2023-11-02  1160  	bool need_another_pass;
dde8cb11645b7d Kent Overstreet 2023-07-17  1161  	int ret;
4bd156c4b44ef3 Kent Overstreet 2023-11-02  1162  again:
4bd156c4b44ef3 Kent Overstreet 2023-11-02  1163  	need_another_pass = false;
dde8cb11645b7d Kent Overstreet 2023-07-17  1164  
dde8cb11645b7d Kent Overstreet 2023-07-17  1165  	/*
dde8cb11645b7d Kent Overstreet 2023-07-17  1166  	 * Weird transaction restart handling here because on successful delete,
dde8cb11645b7d Kent Overstreet 2023-07-17  1167  	 * bch2_inode_rm_snapshot() will return a nested transaction restart,
dde8cb11645b7d Kent Overstreet 2023-07-17  1168  	 * but we can't retry because the btree write buffer won't have been
dde8cb11645b7d Kent Overstreet 2023-07-17  1169  	 * flushed and we'd spin:
dde8cb11645b7d Kent Overstreet 2023-07-17  1170  	 */
008e9bf5db2fb9 Kent Overstreet 2023-12-07 @1171  	ret = for_each_btree_key_commit(trans, iter, BTREE_ID_deleted_inodes, POS_MIN,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
