Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C718180B
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Oct 2024 04:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730088193; cv=none; b=d1oqpUiVh+t7sKVrFvnSiT7dlalGDQg1RpKeFH6Li15XI0PmrpIAkcRaiH+CPh7tCyKYL8/8PLHwkoogp6AtUF21iOddYz4HTJOA0sZVWf7WHna/2OnvUljZVq7wWh/m25Ru9S2vauWqTd0h1jSPDcPSbAagJ4WIRWWQf3SvVRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730088193; c=relaxed/simple;
	bh=Q3hslMxT90kGBYyNNdgLL7A/8r2YrrI2az2SIFl172k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hFo4N6s4AH9zPAGrOItrJclpPW4rX5L+/0oQAlNvucl19W2NYgSh2PO1FghXWi6O8IX+cHixv4iU0rw5RS/2d8RCVgdV/IllnEWTj1a8S5rqtF6Ou+W80hHTVFFr532/pGE5LiAihykPhMybab8J00lgKCjTUIE2fKO3xh8bnyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dsp2Trq6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dsp2Trq6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730088191; x=1761624191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q3hslMxT90kGBYyNNdgLL7A/8r2YrrI2az2SIFl172k=;
  b=dsp2Trq6NeUMrr0rjiD+OBFEYTp3/Xq+Svrk4ToRc4BmUroCxSDjE+7T
   CUt8I9WM0YiIj3o5VkadzVCx+LLQK/rdJ24xJVjw0VfT9atHBeWgiR9YV
   j6ttIr64kigcUyNf27srT5cvq4b1VwDLsSAIWPhiS6hLhMgJtQmEwjyEi
   XCmA/3upHBP7WyBAwSgE7MRCYLeJFWLlbCtQkI+mH3IztZ2PesyrCpbzN
   5HbMUxRX7fIco8IyI6VGRprJtjioFyyZ/slEKZ3kDC/otT2nG17GxTnc9
   wiDoxYxnQS4F3oKDOBBifVkolfOPENfoC48SOiOc05Ra3fD15LRuTo9ty
   A==;
X-CSE-ConnectionGUID: Lo+k51moTc+NZ6DrmV6DoQ==
X-CSE-MsgGUID: pqcYpjazQ+iPJ5hSUMoJYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29449315"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29449315"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 21:03:10 -0700
X-CSE-ConnectionGUID: Wz+mWPSJTZ+t6tVwaEbMXw==
X-CSE-MsgGUID: rL5p5MjLRXWt6N3INI3eyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,238,1725346800"; 
   d="scan'208";a="86085440"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Oct 2024 21:03:08 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5GyA-000bEq-1k;
	Mon, 28 Oct 2024 04:03:06 +0000
Date: Mon, 28 Oct 2024 12:03:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [peterz-queue:locking/test 2/4] drivers/hv/hv_balloon.c:716
 hv_mem_hot_add() warn: iterator 'i' not incremented
Message-ID: <202410281127.BZHhMpft-lkp@intel.com>
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
TO: Przemek Kitszel <przemyslaw.kitszel@intel.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/test
head:   0ada09bc35a2e1483f022cedd25f7e4a4190341e
commit: ccb8687fb7cd23a13632c809b7c557871844d4e6 [2/4] cleanup: Adjust scoped_guard() macros to avoid potential warning
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-r073-20241026 (https://download.01.org/0day-ci/archive/20241028/202410281127.BZHhMpft-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410281127.BZHhMpft-lkp@intel.com/

smatch warnings:
drivers/hv/hv_balloon.c:716 hv_mem_hot_add() warn: iterator 'i' not incremented

vim +/i +716 drivers/hv/hv_balloon.c

1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  705  
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  706  static void hv_mem_hot_add(unsigned long start, unsigned long size,
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  707  				unsigned long pfn_count,
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  708  				struct hv_hotadd_state *has)
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  709  {
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  710  	int ret = 0;
ed07ec93e83ec47 K. Y. Srinivasan  2013-07-14  711  	int i, nid;
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  712  	unsigned long start_pfn;
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  713  	unsigned long processed_pfn;
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  714  	unsigned long total_pfn = pfn_count;
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  715  
8852ebf1948d94e Michael Kelley    2024-05-03 @716  	for (i = 0; i < (size/ha_pages_in_chunk); i++) {
8852ebf1948d94e Michael Kelley    2024-05-03  717  		start_pfn = start + (i * ha_pages_in_chunk);
eece30b9f0046ce Vitaly Kuznetsov  2016-08-24  718  
4f74fb30ea21d8b Mitchell Levy     2023-08-07  719  		scoped_guard(spinlock_irqsave, &dm_device.ha_lock) {
8852ebf1948d94e Michael Kelley    2024-05-03  720  			has->ha_end_pfn += ha_pages_in_chunk;
8852ebf1948d94e Michael Kelley    2024-05-03  721  			processed_pfn = umin(total_pfn, ha_pages_in_chunk);
bb3ca38ef7aa56d Michael Kelley    2024-05-03  722  			total_pfn -= processed_pfn;
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  723  			has->covered_end_pfn += processed_pfn;
4f74fb30ea21d8b Mitchell Levy     2023-08-07  724  		}
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  725  
bc58ebd506c369c David Hildenbrand 2020-04-06  726  		reinit_completion(&dm_device.ol_waitevent);
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  727  
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  728  		nid = memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  729  		ret = add_memory(nid, PFN_PHYS((start_pfn)),
8852ebf1948d94e Michael Kelley    2024-05-03  730  				 HA_BYTES_IN_CHUNK, MHP_MERGE_RESOURCE);
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  731  
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  732  		if (ret) {
223e1e4d2c16fed Vitaly Kuznetsov  2018-03-04  733  			pr_err("hot_add memory failed error is %d\n", ret);
7f4f2302a11173d K. Y. Srinivasan  2013-03-18  734  			if (ret == -EEXIST) {
7f4f2302a11173d K. Y. Srinivasan  2013-03-18  735  				/*
7f4f2302a11173d K. Y. Srinivasan  2013-03-18  736  				 * This error indicates that the error
7f4f2302a11173d K. Y. Srinivasan  2013-03-18  737  				 * is not a transient failure. This is the
7f4f2302a11173d K. Y. Srinivasan  2013-03-18  738  				 * case where the guest's physical address map
7f4f2302a11173d K. Y. Srinivasan  2013-03-18  739  				 * precludes hot adding memory. Stop all further
7f4f2302a11173d K. Y. Srinivasan  2013-03-18  740  				 * memory hot-add.
7f4f2302a11173d K. Y. Srinivasan  2013-03-18  741  				 */
7f4f2302a11173d K. Y. Srinivasan  2013-03-18  742  				do_hot_add = false;
7f4f2302a11173d K. Y. Srinivasan  2013-03-18  743  			}
4f74fb30ea21d8b Mitchell Levy     2023-08-07  744  			scoped_guard(spinlock_irqsave, &dm_device.ha_lock) {
8852ebf1948d94e Michael Kelley    2024-05-03  745  				has->ha_end_pfn -= ha_pages_in_chunk;
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  746  				has->covered_end_pfn -=  processed_pfn;
4f74fb30ea21d8b Mitchell Levy     2023-08-07  747  			}
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  748  			break;
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  749  		}
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  750  
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  751  		/*
bc58ebd506c369c David Hildenbrand 2020-04-06  752  		 * Wait for memory to get onlined. If the kernel onlined the
bc58ebd506c369c David Hildenbrand 2020-04-06  753  		 * memory when adding it, this will return directly. Otherwise,
bc58ebd506c369c David Hildenbrand 2020-04-06  754  		 * it will wait for user space to online the memory. This helps
bc58ebd506c369c David Hildenbrand 2020-04-06  755  		 * to avoid adding memory faster than it is getting onlined. As
bc58ebd506c369c David Hildenbrand 2020-04-06  756  		 * adding succeeded, it is ok to proceed even if the memory was
bc58ebd506c369c David Hildenbrand 2020-04-06  757  		 * not onlined in time.
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  758  		 */
bc58ebd506c369c David Hildenbrand 2020-04-06  759  		wait_for_completion_timeout(&dm_device.ol_waitevent, 5 * HZ);
ae339336dc950b9 K. Y. Srinivasan  2014-04-23  760  		post_status(&dm_device);
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  761  	}
1cac8cd4d146b60 K. Y. Srinivasan  2013-03-15  762  }
9aa8b50b2b3d3a7 K. Y. Srinivasan  2012-11-14  763  

:::::: The code at line 716 was first introduced by commit
:::::: 8852ebf1948d94ecaf4d1113032dda7e58e72b84 hv_balloon: Enable hot-add for memblock sizes > 128 MiB

:::::: TO: Michael Kelley <mhklinux@outlook.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
