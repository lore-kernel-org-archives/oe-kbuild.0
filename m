Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DCC3C10
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Apr 2023 14:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680358832; x=1711894832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FBtPNxygOpU5P+ZHOubOdrvvXlm/WrhSa8ssdM1gJwY=;
  b=XaNT7ky/pElEl/aUwtd6FAGMsBvnpEBO2UPTZLKxk3jXqtNgko/fr+9D
   g3pA+X3/Nrjta/Er8Cq92PqExll/CAa4Kzyk7t4QDbYTvbpbX2RwvnlxR
   YJ01zkI9wymX7pMh7/NrdLFqiFqBu/2VQVx5xdwZpWsKq7kuJ8jDQsx6p
   CiqNXzF8F6FtfOHb8k+hZiXooedq/LWzeCi2VA1gsSfb8m1rAk55GQeZc
   LI89+RhnNQDKYNBGY5aFV9zpqhPSWy2AxkA5/AaaNNzQcLRbXikXMJeWG
   PyGtsUJSrA10LGZFgoqUUPbIf+lUyZb+sqyv6z7OH7ZHRiHbHNc4iteey
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="404405687"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="404405687"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 07:20:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="749984313"
X-IronPort-AV: E=Sophos;i="5.98,310,1673942400"; 
   d="scan'208";a="749984313"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 01 Apr 2023 07:20:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pic5l-000MqX-2Q;
	Sat, 01 Apr 2023 14:20:29 +0000
Date: Sat, 1 Apr 2023 22:19:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ocfs2/super.c:1809 ocfs2_mount_volume() warn: missing error code
 'status'
Message-ID: <202304012244.gX4H4rBO-lkp@intel.com>
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
TO: "Heming Zhao via Ocfs2-devel" <ocfs2-devel@oss.oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Joseph Qi <joseph.qi@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b50567bdcad8925ca1e075feb7171c12015afd1
commit: 0737e01de9c411e4db87dcedf4a9789d41b1c5c1 ocfs2: ocfs2_mount_volume does cleanup job before return error
date:   11 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230401/202304012244.gX4H4rBO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304012244.gX4H4rBO-lkp@intel.com/

smatch warnings:
fs/ocfs2/super.c:1809 ocfs2_mount_volume() warn: missing error code 'status'

vim +/status +1809 fs/ocfs2/super.c

ccd979bdbce9fb Mark Fasheh                 2005-12-15  1802  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1803  static int ocfs2_mount_volume(struct super_block *sb)
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1804  {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1805  	int status = 0;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1806  	struct ocfs2_super *osb = OCFS2_SB(sb);
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1807  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1808  	if (ocfs2_is_hard_readonly(osb))
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29 @1809  		goto out;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1810  
5500ab4ed3b8f0 Gang He                     2019-03-05  1811  	mutex_init(&osb->obs_trim_fs_mutex);
5500ab4ed3b8f0 Gang He                     2019-03-05  1812  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1813  	status = ocfs2_dlm_init(osb);
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1814  	if (status < 0) {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1815  		mlog_errno(status);
a52370b3b182f7 Gang He                     2018-01-31  1816  		if (status == -EBADR && ocfs2_userspace_stack(osb))
a52370b3b182f7 Gang He                     2018-01-31  1817  			mlog(ML_ERROR, "couldn't mount because cluster name on"
a52370b3b182f7 Gang He                     2018-01-31  1818  			" disk does not match the running cluster name.\n");
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1819  		goto out;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1820  	}
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1821  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1822  	status = ocfs2_super_lock(osb, 1);
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1823  	if (status < 0) {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1824  		mlog_errno(status);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1825  		goto out_dlm;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1826  	}
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1827  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1828  	/* This will load up the node map and add ourselves to it. */
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1829  	status = ocfs2_find_slot(osb);
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1830  	if (status < 0) {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1831  		mlog_errno(status);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1832  		goto out_super_lock;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1833  	}
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1834  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1835  	/* load all node-local system inodes */
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1836  	status = ocfs2_init_local_system_inodes(osb);
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1837  	if (status < 0) {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1838  		mlog_errno(status);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1839  		goto out_super_lock;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1840  	}
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1841  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1842  	status = ocfs2_check_volume(osb);
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1843  	if (status < 0) {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1844  		mlog_errno(status);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1845  		goto out_system_inodes;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1846  	}
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1847  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1848  	status = ocfs2_truncate_log_init(osb);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1849  	if (status < 0) {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1850  		mlog_errno(status);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1851  		goto out_system_inodes;
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1852  	}
c271c5c22b0a7c Sunil Mushran               2006-12-05  1853  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1854  	ocfs2_super_unlock(osb, 1);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1855  	return 0;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1856  
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1857  out_system_inodes:
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1858  	if (osb->local_alloc_state == OCFS2_LA_ENABLED)
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1859  		ocfs2_shutdown_local_alloc(osb);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1860  	ocfs2_release_system_inodes(osb);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1861  	/* before journal shutdown, we should release slot_info */
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1862  	ocfs2_free_slot_info(osb);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1863  	ocfs2_journal_shutdown(osb);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1864  out_super_lock:
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1865  	ocfs2_super_unlock(osb, 1);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1866  out_dlm:
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1867  	ocfs2_dlm_shutdown(osb, 0);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1868  out:
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1869  	return status;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1870  }
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1871  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
