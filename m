Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867F4D279
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Dec 2023 06:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+Y/Q+BK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701844836; x=1733380836;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u4W5iU5L35QJAt46Efcvd//jFJFvukYhNum3bEIsqd0=;
  b=b+Y/Q+BK/hfOOL3UTN9adEDjapsThRS8blLgwhKSkoYCYsCInqTKPttQ
   WTUzQd8ZJrIqTnTYoBJbhWhoGG/b/E5xli8pYnpO2k8VvhR7y7ZQinq0d
   1YttIZ0oMjDYp81z9UwjH+gY70AYL3amkZa4ClF5NAomn+C68HC/hh9WH
   yuLNOPfpWTBniYTEd4Ro0vPxN+bEcZeUoCPIbSiIMLyFSGNzVxuN3d3Nv
   mRAVi50J22OgjrLPiis1Tv39eyfatgkH0NKHl1prPNmqcK/Nt+DRL97X1
   wgtIa3OlT9b8uP+1X8NTzQBPKBGBxjbsRXgCbk30k4APcoG5JoCpu/TYP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="887005"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="887005"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 22:40:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102716534"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1102716534"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 22:40:33 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAla7-000AQA-1z;
	Wed, 06 Dec 2023 06:40:28 +0000
Date: Wed, 6 Dec 2023 14:39:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: io_uring/io_uring.c:2728:33-34: WARNING opportunity for max()
Message-ID: <202312061418.lnSdVLxF-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 03d89a2de25bbc5c77e61a0cf77663978c4b6ea7 io_uring: support for user allocated memory for rings/sqes
date:   7 months ago
:::::: branch date: 33 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-102-20231202 (https://download.01.org/0day-ci/archive/20231206/202312061418.lnSdVLxF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231206/202312061418.lnSdVLxF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202312061418.lnSdVLxF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/io_uring.c:2728:33-34: WARNING opportunity for max()

vim +2728 io_uring/io_uring.c

03d89a2de25bbc5 Jens Axboe 2021-11-05  2704  
03d89a2de25bbc5 Jens Axboe 2021-11-05  2705  static void *__io_uaddr_map(struct page ***pages, unsigned short *npages,
03d89a2de25bbc5 Jens Axboe 2021-11-05  2706  			    unsigned long uaddr, size_t size)
03d89a2de25bbc5 Jens Axboe 2021-11-05  2707  {
03d89a2de25bbc5 Jens Axboe 2021-11-05  2708  	struct page **page_array;
03d89a2de25bbc5 Jens Axboe 2021-11-05  2709  	unsigned int nr_pages;
03d89a2de25bbc5 Jens Axboe 2021-11-05  2710  	int ret;
03d89a2de25bbc5 Jens Axboe 2021-11-05  2711  
03d89a2de25bbc5 Jens Axboe 2021-11-05  2712  	*npages = 0;
03d89a2de25bbc5 Jens Axboe 2021-11-05  2713  
03d89a2de25bbc5 Jens Axboe 2021-11-05  2714  	if (uaddr & (PAGE_SIZE - 1) || !size)
03d89a2de25bbc5 Jens Axboe 2021-11-05  2715  		return ERR_PTR(-EINVAL);
03d89a2de25bbc5 Jens Axboe 2021-11-05  2716  
03d89a2de25bbc5 Jens Axboe 2021-11-05  2717  	nr_pages = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
03d89a2de25bbc5 Jens Axboe 2021-11-05  2718  	if (nr_pages > USHRT_MAX)
03d89a2de25bbc5 Jens Axboe 2021-11-05  2719  		return ERR_PTR(-EINVAL);
03d89a2de25bbc5 Jens Axboe 2021-11-05  2720  	page_array = kvmalloc_array(nr_pages, sizeof(struct page *), GFP_KERNEL);
03d89a2de25bbc5 Jens Axboe 2021-11-05  2721  	if (!page_array)
03d89a2de25bbc5 Jens Axboe 2021-11-05  2722  		return ERR_PTR(-ENOMEM);
03d89a2de25bbc5 Jens Axboe 2021-11-05  2723  
03d89a2de25bbc5 Jens Axboe 2021-11-05  2724  	ret = pin_user_pages_fast(uaddr, nr_pages, FOLL_WRITE | FOLL_LONGTERM,
03d89a2de25bbc5 Jens Axboe 2021-11-05  2725  					page_array);
03d89a2de25bbc5 Jens Axboe 2021-11-05  2726  	if (ret != nr_pages) {
03d89a2de25bbc5 Jens Axboe 2021-11-05  2727  err:
03d89a2de25bbc5 Jens Axboe 2021-11-05 @2728  		io_pages_free(&page_array, ret > 0 ? ret : 0);
03d89a2de25bbc5 Jens Axboe 2021-11-05  2729  		return ret < 0 ? ERR_PTR(ret) : ERR_PTR(-EFAULT);
03d89a2de25bbc5 Jens Axboe 2021-11-05  2730  	}
03d89a2de25bbc5 Jens Axboe 2021-11-05  2731  	/*
03d89a2de25bbc5 Jens Axboe 2021-11-05  2732  	 * Should be a single page. If the ring is small enough that we can
03d89a2de25bbc5 Jens Axboe 2021-11-05  2733  	 * use a normal page, that is fine. If we need multiple pages, then
03d89a2de25bbc5 Jens Axboe 2021-11-05  2734  	 * userspace should use a huge page. That's the only way to guarantee
03d89a2de25bbc5 Jens Axboe 2021-11-05  2735  	 * that we get contigious memory, outside of just being lucky or
03d89a2de25bbc5 Jens Axboe 2021-11-05  2736  	 * (currently) having low memory fragmentation.
03d89a2de25bbc5 Jens Axboe 2021-11-05  2737  	 */
03d89a2de25bbc5 Jens Axboe 2021-11-05  2738  	if (page_array[0] != page_array[ret - 1])
03d89a2de25bbc5 Jens Axboe 2021-11-05  2739  		goto err;
03d89a2de25bbc5 Jens Axboe 2021-11-05  2740  	*pages = page_array;
03d89a2de25bbc5 Jens Axboe 2021-11-05  2741  	*npages = nr_pages;
03d89a2de25bbc5 Jens Axboe 2021-11-05  2742  	return page_to_virt(page_array[0]);
03d89a2de25bbc5 Jens Axboe 2021-11-05  2743  }
03d89a2de25bbc5 Jens Axboe 2021-11-05  2744  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
