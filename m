Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6731B7F
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Oct 2023 07:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+9z3/UO"
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696492349; x=1728028349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yyVKRiC9vuwsORdJS+0bEnhKmKaoCkDXQollOJGGXDw=;
  b=c+9z3/UONqxHu/+uE/YvSnrLHpNUS3WAvfRoEsyCDZd32iWKFI1ORyU0
   4vOskBoYPMVfmAmyCd07TEgYvQs1clJ0gpJhZwNkXRO2t6NX2umdoEsdl
   p75jiZryhQQkPYzwOFKHtrRFo8C9TJl0kfcNzj/A6FMZPUjRXIbJPRkpo
   H9Gt8UGTI0imLuxailwZwqKdbwPr2URdW/H6VXIqcjJK+Vh05ilfcrhZt
   bggl9qNpqrAxxkxP9pRJJLImrSE6IcUY0t5fTQQQkiCXkPFHMaRmzmkdB
   Ce2rokjMCs4+uloej80/6lfq72heyGa0gR2bjX8o+Qnwb/dotM9UKJ2v6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="447612995"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="447612995"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 00:52:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="786855438"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; 
   d="scan'208";a="786855438"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Oct 2023 00:52:26 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qoJ9k-000LBC-1F;
	Thu, 05 Oct 2023 07:52:24 +0000
Date: Thu, 5 Oct 2023 15:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:cifs-netfs 35/44] fs/netfs/direct_write.c:54
 netfs_alloc_buffer() error: uninitialized symbol 'ret'.
Message-ID: <202310051502.Xl4aqWU3-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-netfs
head:   c535f8e2b3fd3f2da2d9e75c71e216c4c9ff72db
commit: aa24264b7eba3e3adf3b47b3dedeb3730d5ccc42 [35/44] netfs: Implement unbuffered/DIO write support
:::::: branch date: 9 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-161-20231005 (https://download.01.org/0day-ci/archive/20231005/202310051502.Xl4aqWU3-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231005/202310051502.Xl4aqWU3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310051502.Xl4aqWU3-lkp@intel.com/

smatch warnings:
fs/netfs/direct_write.c:54 netfs_alloc_buffer() error: uninitialized symbol 'ret'.
fs/netfs/io.c:893 netfs_rmw_read() error: uninitialized symbol 'ret'.

vim +/ret +54 fs/netfs/direct_write.c

ed609c947059ee David Howells 2022-02-21  25  
aa24264b7eba3e David Howells 2022-02-21  26  /*
aa24264b7eba3e David Howells 2022-02-21  27   * Allocate a bunch of pages and add them into the xarray buffer starting at
aa24264b7eba3e David Howells 2022-02-21  28   * the given index.
aa24264b7eba3e David Howells 2022-02-21  29   */
aa24264b7eba3e David Howells 2022-02-21  30  static int netfs_alloc_buffer(struct xarray *xa, pgoff_t index, unsigned int nr_pages)
aa24264b7eba3e David Howells 2022-02-21  31  {
aa24264b7eba3e David Howells 2022-02-21  32  	struct page *page;
aa24264b7eba3e David Howells 2022-02-21  33  	unsigned int n;
aa24264b7eba3e David Howells 2022-02-21  34  	int ret;
aa24264b7eba3e David Howells 2022-02-21  35  	LIST_HEAD(list);
aa24264b7eba3e David Howells 2022-02-21  36  
aa24264b7eba3e David Howells 2022-02-21  37  	n = alloc_pages_bulk_list(GFP_NOIO, nr_pages, &list);
aa24264b7eba3e David Howells 2022-02-21  38  	if (n < nr_pages) {
aa24264b7eba3e David Howells 2022-02-21  39  		ret = -ENOMEM;
aa24264b7eba3e David Howells 2022-02-21  40  	}
aa24264b7eba3e David Howells 2022-02-21  41  
aa24264b7eba3e David Howells 2022-02-21  42  	while ((page = list_first_entry_or_null(&list, struct page, lru))) {
aa24264b7eba3e David Howells 2022-02-21  43  		list_del(&page->lru);
aa24264b7eba3e David Howells 2022-02-21  44  		page->index = index;
aa24264b7eba3e David Howells 2022-02-21  45  		ret = xa_insert(xa, index++, page, GFP_NOIO);
aa24264b7eba3e David Howells 2022-02-21  46  		if (ret < 0)
aa24264b7eba3e David Howells 2022-02-21  47  			break;
aa24264b7eba3e David Howells 2022-02-21  48  	}
aa24264b7eba3e David Howells 2022-02-21  49  
aa24264b7eba3e David Howells 2022-02-21  50  	while ((page = list_first_entry_or_null(&list, struct page, lru))) {
aa24264b7eba3e David Howells 2022-02-21  51  		list_del(&page->lru);
aa24264b7eba3e David Howells 2022-02-21  52  		__free_page(page);
aa24264b7eba3e David Howells 2022-02-21  53  	}
aa24264b7eba3e David Howells 2022-02-21 @54  	return ret;
aa24264b7eba3e David Howells 2022-02-21  55  }
aa24264b7eba3e David Howells 2022-02-21  56  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
