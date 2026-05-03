Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BE9126C03
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 14:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777818657; cv=none; b=NYR5YRACVb+oi7hz3XvbvNpM5TIBJDJoU9EmlKcmJ5SREhWS1+sdKb2rU8TNjSf8pHdSbWmkZzbnT7iy57mygp7gZGTX2IMKDybXwQ8U40jPnX9F8kYfX7fRkttfcMn/vKbdRnxbkF/RHhIAc22VBYds0f2zVFbLMGNpbrwhOcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777818657; c=relaxed/simple;
	bh=UC3WUw7mObv2GLHLvs2v5PCORImCPlqgOvZr33Ah4Co=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kf14MykjTYgpGnGdlTncgd4Ch+ajBBUhBhRydttNKFZdd5SJKz78rX09lHuJKq12cOzkmugG6w0642b/K3c3RPLnxbebZZ5QXlBwumfYED3OTms2ZEYEJhB7QMwVb5g7laFQnZxA4sQPJl48wN2TIcD2G8Wb7VCzSrbUYxAl+DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SD+1jHl0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SD+1jHl0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777818654; x=1809354654;
  h=date:from:to:cc:subject:message-id;
  bh=UC3WUw7mObv2GLHLvs2v5PCORImCPlqgOvZr33Ah4Co=;
  b=SD+1jHl0rMXq+HW9ouvZ4LB8udyinRUabopZ/mOyqyfQ+N6Rbi16jHS3
   +89uRfCfLEEba56XilUpv7GKKbfBhe0VhudRuQrePwVr/cXausaWcmeXz
   AQwtcmVlthIFMT62kDnLBtdVv9c42T7LmlI4dKYE/R5GlFDnqu69cB36M
   CtHkHhwWEtIS66F4eYyc0NSpily4L7s9sY6jBlwOP8+Q9Onk+tyZ7X+f9
   EqdWYYd+dOTH0JZOVO+Hj/lmUTJW9UCW2UhAvnjNKNVt/9K5NzKrbxIg/
   H4TcxjQi9H1GruTIcpmKO7Usm+hiiDN6dM6wHP66S6PySyou0eKUcLQm6
   A==;
X-CSE-ConnectionGUID: yuWjnffiSeKkjP6S+7HcQw==
X-CSE-MsgGUID: om5mA9xWRfSjzFDrm4v9kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="77721938"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="77721938"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 07:30:53 -0700
X-CSE-ConnectionGUID: pQAieMLeQAqYVj7YY4YCfg==
X-CSE-MsgGUID: s4uCqqd8TqC18xpuEgwzfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="237076688"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 May 2026 07:30:52 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJXqM-000000002dj-0kVi;
	Sun, 03 May 2026 14:30:50 +0000
Date: Sun, 03 May 2026 22:30:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:727:3:
 error: cannot jump from this indirect goto statement to one of its possible
 targets
Message-ID: <202605032243.GdhzXDPj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/UPDATE-20260430-081225/Byungchul-Park/dept-implement-DEPT-DEPendency-Tracker/20251205-152602, commit: 069e0fe43c9fb44fd6565665473441d0b8931348"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Byungchul Park <byungchul@sk.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/UPDATE-20260430-081225/Byungchul-Park/dept-implement-DEPT-DEPendency-Tracker/20251205-152602
head:   46b72c93953595c42867a65ad4829f753ef95b8e
commit: 069e0fe43c9fb44fd6565665473441d0b8931348 dept: assign unique dept_key to each distinct dma fence caller
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260503/202605032243.GdhzXDPj-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605032243.GdhzXDPj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605032243.GdhzXDPj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:727:3: error: cannot jump from this indirect goto statement to one of its possible targets
     727 |                 drm_exec_retry_on_contention(&exec);
         |                 ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:921:9: note: possible target of indirect goto statement
     921 |                                 r = dma_fence_wait(fences[i], true);
         |                                     ^
   include/linux/dma-fence.h:677:2: note: expanded from macro 'dma_fence_wait'
     677 |         sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);      \
         |         ^
   include/linux/dept_sdt.h:46:45: note: expanded from macro 'sdt_might_sleep_start_timeout'
      46 |                 dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, t);\
         |                                                           ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                                         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:921:9: note: jump enters a statement expression
   include/linux/dma-fence.h:677:2: note: expanded from macro 'dma_fence_wait'
     677 |         sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);      \
         |         ^
   include/linux/dept_sdt.h:46:45: note: expanded from macro 'sdt_might_sleep_start_timeout'
      46 |                 dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, t);\
         |                                                           ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                    ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c:921:9: note: jump enters a statement expression
   include/linux/dma-fence.h:673:38: note: expanded from macro 'dma_fence_wait'
     673 | #define dma_fence_wait(f, intr)                                         \
         |                                                                         ^
   1 error generated.
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:1015:3: error: cannot jump from this indirect goto statement to one of its possible targets
    1015 |                 drm_exec_retry_on_contention(&exec);
         |                 ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:1116:3: note: possible target of indirect goto statement
    1116 |                 dma_fence_wait(bo_va->last_pt_update, false);
         |                 ^
   include/linux/dma-fence.h:677:2: note: expanded from macro 'dma_fence_wait'
     677 |         sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);      \
         |         ^
   include/linux/dept_sdt.h:46:45: note: expanded from macro 'sdt_might_sleep_start_timeout'
      46 |                 dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, t);\
         |                                                           ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                                         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:1116:3: note: jump enters a statement expression
   include/linux/dma-fence.h:677:2: note: expanded from macro 'dma_fence_wait'
     677 |         sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);      \
         |         ^
   include/linux/dept_sdt.h:46:45: note: expanded from macro 'sdt_might_sleep_start_timeout'
      46 |                 dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, t);\
         |                                                           ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                    ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:1116:3: note: jump enters a statement expression
   include/linux/dma-fence.h:673:38: note: expanded from macro 'dma_fence_wait'
     673 | #define dma_fence_wait(f, intr)                                         \
         |                                                                         ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:1015:3: error: cannot jump from this indirect goto statement to one of its possible targets
    1015 |                 drm_exec_retry_on_contention(&exec);
         |                 ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:1117:2: note: possible target of indirect goto statement
    1117 |         dma_fence_wait(vm->last_update, false);
         |         ^
   include/linux/dma-fence.h:677:2: note: expanded from macro 'dma_fence_wait'
     677 |         sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);      \
         |         ^
   include/linux/dept_sdt.h:46:45: note: expanded from macro 'sdt_might_sleep_start_timeout'
      46 |                 dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, t);\
         |                                                           ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                                         ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:1117:2: note: jump enters a statement expression
   include/linux/dma-fence.h:677:2: note: expanded from macro 'dma_fence_wait'
     677 |         sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);      \
         |         ^
   include/linux/dept_sdt.h:46:45: note: expanded from macro 'sdt_might_sleep_start_timeout'
      46 |                 dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, t);\
         |                                                           ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                    ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:1117:2: note: jump enters a statement expression
   include/linux/dma-fence.h:673:38: note: expanded from macro 'dma_fence_wait'
     673 | #define dma_fence_wait(f, intr)                                         \
         |                                                                         ^
   2 errors generated.
--
>> drivers/gpu/drm/xe/xe_pagefault.c:109:3: error: cannot jump from this indirect goto statement to one of its possible targets
     109 |                 drm_exec_retry_on_contention(&exec);
         |                 ^
   include/drm/drm_exec.h:123:4: note: expanded from macro 'drm_exec_retry_on_contention'
     123 |                         goto *__drm_exec_retry_ptr;             \
         |                         ^
   drivers/gpu/drm/xe/xe_pagefault.c:126:2: note: possible target of indirect goto statement
     126 |         dma_fence_wait(fence, false);
         |         ^
   include/linux/dma-fence.h:677:2: note: expanded from macro 'dma_fence_wait'
     677 |         sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);      \
         |         ^
   include/linux/dept_sdt.h:46:45: note: expanded from macro 'sdt_might_sleep_start_timeout'
      46 |                 dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, t);\
         |                                                           ^
   include/linux/instruction_pointer.h:10:41: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                                         ^
   drivers/gpu/drm/xe/xe_pagefault.c:126:2: note: jump enters a statement expression
   include/linux/dma-fence.h:677:2: note: expanded from macro 'dma_fence_wait'
     677 |         sdt_might_sleep_start_timeout(NULL, MAX_SCHEDULE_TIMEOUT);      \
         |         ^
   include/linux/dept_sdt.h:46:45: note: expanded from macro 'sdt_might_sleep_start_timeout'
      46 |                 dept_stage_wait(__m, __m ? NULL : &__key, _THIS_IP_, __func__, t);\
         |                                                           ^
   include/linux/instruction_pointer.h:10:20: note: expanded from macro '_THIS_IP_'
      10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
         |                    ^
   drivers/gpu/drm/xe/xe_pagefault.c:126:2: note: jump enters a statement expression
   include/linux/dma-fence.h:673:38: note: expanded from macro 'dma_fence_wait'
     673 | #define dma_fence_wait(f, intr)                                         \
         |                                                                         ^
   1 error generated.


vim +727 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  638  
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  639  int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  640  			    struct drm_file *filp)
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  641  {
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  642  	u32 *syncobj_handles, *timeline_points, *timeline_handles, *bo_handles_read, *bo_handles_write;
2761bb9a31f1b86 Arunpravin Paneer Selvam 2024-11-11  643  	u32 num_syncobj, num_read_bo_handles, num_write_bo_handles;
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  644  	struct drm_amdgpu_userq_fence_info *fence_info = NULL;
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  645  	struct drm_amdgpu_userq_wait *wait_info = data;
4b27406380b0b9a Arunpravin Paneer Selvam 2025-04-11  646  	struct amdgpu_fpriv *fpriv = filp->driver_priv;
4b27406380b0b9a Arunpravin Paneer Selvam 2025-04-11  647  	struct amdgpu_userq_mgr *userq_mgr = &fpriv->userq_mgr;
4b27406380b0b9a Arunpravin Paneer Selvam 2025-04-11  648  	struct amdgpu_usermode_queue *waitq;
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  649  	struct drm_gem_object **gobj_write;
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  650  	struct drm_gem_object **gobj_read;
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  651  	struct dma_fence **fences = NULL;
2761bb9a31f1b86 Arunpravin Paneer Selvam 2024-11-11  652  	u16 num_points, num_fences = 0;
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  653  	int r, i, rentry, wentry, cnt;
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  654  	struct drm_exec exec;
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  655  
2761bb9a31f1b86 Arunpravin Paneer Selvam 2024-11-11  656  	num_read_bo_handles = wait_info->num_bo_read_handles;
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  657  	bo_handles_read = memdup_user(u64_to_user_ptr(wait_info->bo_read_handles),
98a46a408998102 Dan Carpenter            2025-05-23  658  				      size_mul(sizeof(u32), num_read_bo_handles));
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  659  	if (IS_ERR(bo_handles_read))
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  660  		return PTR_ERR(bo_handles_read);
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  661  
2761bb9a31f1b86 Arunpravin Paneer Selvam 2024-11-11  662  	num_write_bo_handles = wait_info->num_bo_write_handles;
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  663  	bo_handles_write = memdup_user(u64_to_user_ptr(wait_info->bo_write_handles),
98a46a408998102 Dan Carpenter            2025-05-23  664  				       size_mul(sizeof(u32), num_write_bo_handles));
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  665  	if (IS_ERR(bo_handles_write)) {
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  666  		r = PTR_ERR(bo_handles_write);
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  667  		goto free_bo_handles_read;
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  668  	}
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  669  
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  670  	num_syncobj = wait_info->num_syncobj_handles;
2761bb9a31f1b86 Arunpravin Paneer Selvam 2024-11-11  671  	syncobj_handles = memdup_user(u64_to_user_ptr(wait_info->syncobj_handles),
98a46a408998102 Dan Carpenter            2025-05-23  672  				      size_mul(sizeof(u32), num_syncobj));
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  673  	if (IS_ERR(syncobj_handles)) {
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  674  		r = PTR_ERR(syncobj_handles);
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  675  		goto free_bo_handles_write;
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  676  	}
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  677  
2761bb9a31f1b86 Arunpravin Paneer Selvam 2024-11-11  678  	num_points = wait_info->num_syncobj_timeline_handles;
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  679  	timeline_handles = memdup_user(u64_to_user_ptr(wait_info->syncobj_timeline_handles),
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  680  				       sizeof(u32) * num_points);
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  681  	if (IS_ERR(timeline_handles)) {
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  682  		r = PTR_ERR(timeline_handles);
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  683  		goto free_syncobj_handles;
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  684  	}
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  685  
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  686  	timeline_points = memdup_user(u64_to_user_ptr(wait_info->syncobj_timeline_points),
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  687  				      sizeof(u32) * num_points);
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  688  	if (IS_ERR(timeline_points)) {
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  689  		r = PTR_ERR(timeline_points);
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  690  		goto free_timeline_handles;
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  691  	}
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  692  
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  693  	gobj_read = kmalloc_array(num_read_bo_handles, sizeof(*gobj_read), GFP_KERNEL);
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  694  	if (!gobj_read) {
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  695  		r = -ENOMEM;
15e30a6e479282f Arunpravin Paneer Selvam 2024-10-30  696  		goto free_timeline_points;
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  697  	}
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  698  
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  699  	for (rentry = 0; rentry < num_read_bo_handles; rentry++) {
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  700  		gobj_read[rentry] = drm_gem_object_lookup(filp, bo_handles_read[rentry]);
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  701  		if (!gobj_read[rentry]) {
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  702  			r = -ENOENT;
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  703  			goto put_gobj_read;
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  704  		}
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  705  	}
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  706  
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  707  	gobj_write = kmalloc_array(num_write_bo_handles, sizeof(*gobj_write), GFP_KERNEL);
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  708  	if (!gobj_write) {
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  709  		r = -ENOMEM;
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  710  		goto put_gobj_read;
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  711  	}
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  712  
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  713  	for (wentry = 0; wentry < num_write_bo_handles; wentry++) {
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  714  		gobj_write[wentry] = drm_gem_object_lookup(filp, bo_handles_write[wentry]);
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  715  		if (!gobj_write[wentry]) {
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  716  			r = -ENOENT;
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  717  			goto put_gobj_write;
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  718  		}
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  719  	}
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  720  
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  721  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  722  		      (num_read_bo_handles + num_write_bo_handles));
e7cf21fbb2773cf Arunpravin Paneer Selvam 2024-10-30  723  
e7cf21fbb2773cf Arunpravin Paneer Selvam 2024-10-30  724  	/* Lock all BOs with retry handling */
a292fdecd72834b Arunpravin Paneer Selvam 2024-10-30  725  	drm_exec_until_all_locked(&exec) {
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30  726  		r = drm_exec_prepare_array(&exec, gobj_read, num_read_bo_handles, 1);
cb4a73f46f253b5 Arunpravin Paneer Selvam 2024-10-30 @727  		drm_exec_retry_on_contention(&exec);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
