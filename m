Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C65A306B08
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 20:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781208839; cv=none; b=dDlYinVhl6loMVPUW3nQU+Bn0kEO8zZVk+9q83K5WlF6OPyK5u2QmKMpIj/9JD/npoQS6xpgHXcNVi43xXJaPnwrXy0cGOCQfswF0Zvssi5Ty+KAkaX/POohnhIwb9JhSn/mROVPE+mvc7Jk75GaNjoNB3WeEorK1GZI6dk+BG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781208839; c=relaxed/simple;
	bh=fNxERp0YLZI7f3MDlm0ZTSEABtLzoBu6tdfTc2Z7iQ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Oy6KvLzuCdY43GFKr9WzeDrXMb9ZEfukGphwF0+qq0ALWMQjkSkWowv7ySZph56wDCgdbY2BqAwBnQUceex1EqBqYaOj+AdT0YfVPpFbMCiRT0CJ3z4lXYRcwHxYELCY6tLO6Z2ujxMsV2uIBrxTB+594BYBgpK2pJza0zARriE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mriWSn7n; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mriWSn7n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781208837; x=1812744837;
  h=date:from:to:cc:subject:message-id;
  bh=fNxERp0YLZI7f3MDlm0ZTSEABtLzoBu6tdfTc2Z7iQ8=;
  b=mriWSn7nRdkj2AVolHFKWzq8Y03XQnk5uxtmHC3yBmdWktM4fM0/6NKc
   wVSufFaOdtmSfCSD51qDnq31K9k1DE0v+7k5jZu7ZTgpPzIjyq2SY+o9X
   rceCUXR/bM9172qe2ty5c0/QsLesqeNJSIs9nmFds4k5N9vxXUukpJ0D9
   DRLJij/snkaVXv8xSBiganMxKY9WOTIgVvYv3t6f2nzPTad/2iB6M77+N
   BvFaHszsxSa6O+5BhIqZ+B4lcEPZB/CN9D9Qzlt6gKWkPYTg5URtZj/l8
   VdxCLaOXA18smfrlWYE2U4wOC9cyfjjEjXnnvnTHxoFXfxEcvgRo4pZUP
   w==;
X-CSE-ConnectionGUID: zOqQTfpLQKqNNtW/Z3aWiA==
X-CSE-MsgGUID: zB1Pu/P1TNiNkvLf4O0LVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81942245"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="81942245"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 13:13:56 -0700
X-CSE-ConnectionGUID: DQv80gNyT5+hYig8SwTEDg==
X-CSE-MsgGUID: sXnxmALSTCazAqQjrU3XQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="246673339"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 11 Jun 2026 13:13:56 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXlmj-0000000045V-2qPm;
	Thu, 11 Jun 2026 20:13:53 +0000
Date: Thu, 11 Jun 2026 22:13:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ../../../mm/vma.c:237:39: error: implicit declaration of
 function 'get_rb_root'
Message-ID: <202606112221.JPcGpX2B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Huang Shijie <huangsj@hygon.cn>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Huang-Shijie/mm-use-mapping_mapped-to-simplify-the-code/20260611-142755
head:   ee7e1033fa7e44f962fe205a7d73aa57c32212c7
commit: 325c55f0a357c96a21f650e0d4a3c3c2f869c4a1 mm/fs: split the file's i_mmap tree
date:   14 hours ago
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260611/202606112221.JPcGpX2B-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606112221.JPcGpX2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606112221.JPcGpX2B-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from main.c:10:
   ../../../mm/vma.c: In function '__vma_link_file':
>> ../../../mm/vma.c:237:39: error: implicit declaration of function 'get_rb_root' [-Wimplicit-function-declaration]
     237 |         vma_interval_tree_insert(vma, get_rb_root(vma, mapping));
         |                                       ^~~~~~~~~~~
   ../../../mm/vma.c:237:39: error: passing argument 2 of 'vma_interval_tree_insert' makes pointer from integer without a cast [-Wint-conversion]
     237 |         vma_interval_tree_insert(vma, get_rb_root(vma, mapping));
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
   In file included from vma_internal.h:60,
                    from shared.h:11,
                    from main.c:3:
   include/stubs.h:261:68: note: expected 'struct rb_root_cached *' but argument is of type 'int'
     261 |                                             struct rb_root_cached *rb)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~
>> ../../../mm/vma.c:238:9: error: implicit declaration of function 'inc_mapping_vma' [-Wimplicit-function-declaration]
     238 |         inc_mapping_vma(mapping, vma);
         |         ^~~~~~~~~~~~~~~
   ../../../mm/vma.c: In function '__remove_shared_vm_struct':
>> ../../../mm/vma.c:245:9: error: implicit declaration of function 'i_mmap_tree_lock_write'; did you mean 'i_mmap_lock_write'? [-Wimplicit-function-declaration]
     245 |         i_mmap_tree_lock_write(mapping, vma);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         i_mmap_lock_write
   ../../../mm/vma.c:250:39: error: passing argument 2 of 'vma_interval_tree_remove' makes pointer from integer without a cast [-Wint-conversion]
     250 |         vma_interval_tree_remove(vma, get_rb_root(vma, mapping));
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       |
         |                                       int
   include/stubs.h:266:68: note: expected 'struct rb_root_cached *' but argument is of type 'int'
     266 |                                             struct rb_root_cached *rb)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~
>> ../../../mm/vma.c:251:9: error: implicit declaration of function 'dec_mapping_vma' [-Wimplicit-function-declaration]
     251 |         dec_mapping_vma(mapping, vma);
         |         ^~~~~~~~~~~~~~~
>> ../../../mm/vma.c:253:9: error: implicit declaration of function 'i_mmap_tree_unlock_write'; did you mean 'i_mmap_unlock_write'? [-Wimplicit-function-declaration]
     253 |         i_mmap_tree_unlock_write(mapping, vma);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
         |         i_mmap_unlock_write
   ../../../mm/vma.c: In function 'vma_prepare':
>> ../../../mm/vma.c:301:17: error: implicit declaration of function 'i_mmap_lock_write_prepare'; did you mean 'i_mmap_lock_write'? [-Wimplicit-function-declaration]
     301 |                 i_mmap_lock_write_prepare(vp->mapping);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                 i_mmap_lock_write
   ../../../mm/vma.c:327:41: error: passing argument 2 of 'vma_interval_tree_remove' makes pointer from integer without a cast [-Wint-conversion]
     327 |                                         get_rb_root(vp->vma, vp->mapping));
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   include/stubs.h:266:68: note: expected 'struct rb_root_cached *' but argument is of type 'int'
     266 |                                             struct rb_root_cached *rb)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~
   ../../../mm/vma.c:332:41: error: passing argument 2 of 'vma_interval_tree_remove' makes pointer from integer without a cast [-Wint-conversion]
     332 |                                         get_rb_root(vp->adj_next, vp->mapping));
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   include/stubs.h:266:68: note: expected 'struct rb_root_cached *' but argument is of type 'int'
     266 |                                             struct rb_root_cached *rb)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~
   ../../../mm/vma.c: In function 'vma_complete':
   ../../../mm/vma.c:353:41: error: passing argument 2 of 'vma_interval_tree_insert' makes pointer from integer without a cast [-Wint-conversion]
     353 |                                         get_rb_root(vp->adj_next, vp->mapping));
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   include/stubs.h:261:68: note: expected 'struct rb_root_cached *' but argument is of type 'int'
     261 |                                             struct rb_root_cached *rb)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~
   ../../../mm/vma.c:358:41: error: passing argument 2 of 'vma_interval_tree_insert' makes pointer from integer without a cast [-Wint-conversion]
     358 |                                         get_rb_root(vp->vma, vp->mapping));
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                         |
         |                                         int
   include/stubs.h:261:68: note: expected 'struct rb_root_cached *' but argument is of type 'int'
     261 |                                             struct rb_root_cached *rb)
         |                                             ~~~~~~~~~~~~~~~~~~~~~~~^~
>> ../../../mm/vma.c:386:17: error: implicit declaration of function 'i_mmap_unlock_write_complete'; did you mean 'i_mmap_unlock_write'? [-Wimplicit-function-declaration]
     386 |                 i_mmap_unlock_write_complete(vp->mapping);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 i_mmap_unlock_write
   ../../../mm/vma.c: At top level:
>> ../../../mm/vma.c:2194:40: warning: 'struct rw_semaphore' declared inside parameter list will not be visible outside of this definition or declaration
    2194 |                                 struct rw_semaphore *lock)
         |                                        ^~~~~~~~~~~~
   ../../../mm/vma.c: In function 'vm_lock_mapping':
>> ../../../mm/vma.c:2214:46: error: 'struct mm_struct' has no member named 'mmap_lock'
    2214 |                 i_mmap_nest_lock(mapping, &mm->mmap_lock);
         |                                              ^~
   ../../../mm/vma.c: In function '__mmap_new_file_vma':
>> ../../../mm/vma.c:2525:9: error: implicit declaration of function 'vma_set_tree_idx' [-Wimplicit-function-declaration]
    2525 |         vma_set_tree_idx(vma);
         |         ^~~~~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
