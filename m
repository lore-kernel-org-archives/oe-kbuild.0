Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC92381AD
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Jun 2024 04:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718857408; cv=none; b=O7W59T1Do7dV1NxDdL5JAvErwQxJjTlGHZVy70avScdKu6H0Lc+D9II3J+8cWl0rInHas0451PjCowgAmebX+O0l8HPOXmqjgVZbp+pKyNr+AAJYRGT9Huu18d4CaBWONeNVPzEqyf9ill2OCid8NBLYo5oAVW05pQTuYPXRaDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718857408; c=relaxed/simple;
	bh=5nnyqetXXZcCwxgCGnlmQuuiR7rD9Dy6SFzFe/suipg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kD3WP5WV3vV+8t6Si5WyglyeY0Ba2liQgpM4fJ6JwNAbv6vx5ww2aqxscyE5QN7g11zlvKGPIIIcf3RzOjhFNt+vbhBRMNGTSc6vM1QAFGmA0FWKzDYuCybuaKbtYhhdPtO1EKV6IMx8RPK+RKPVNx5uZNuhldcAxvYW4g4eQ5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPCmtHqn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPCmtHqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718857406; x=1750393406;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5nnyqetXXZcCwxgCGnlmQuuiR7rD9Dy6SFzFe/suipg=;
  b=VPCmtHqnyEYikGfaSB69Biote0rEUIyoIJdndBCmGZ2po+Pe/kPu6A6E
   /Ky2tdOO35GjfY7fVJu1roGjiR2HgTYBGna79SG2oU/WfX9e68xqfOIc7
   a8mSWwB7Hds4LIdGjAjmy7e8f2GpqTSD+gntH95DrW63lLXwphGSr1QVe
   4kJzxTAB4CjxGV2mRt98jMaX3/vN8yR+6RO+qnyNwF+Xkr5AQ4HYDQif7
   JVA/XmX5/BAPuiArOyYA2UK9JhVrmMdQNCtj00LIkpdbIZgr3Knx322vq
   9yklMGfVuU08LbmntxVpYomddJhQRx+bIulLDIlkdfMkBTWjodDQSpgbp
   g==;
X-CSE-ConnectionGUID: 5BHrSfBkS665DRt5DCE6KQ==
X-CSE-MsgGUID: 3u59X55rR/CjzAwG0HbrZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19691996"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="19691996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 21:23:25 -0700
X-CSE-ConnectionGUID: a7TiFJ4yTh2KbH52cFb3cQ==
X-CSE-MsgGUID: lR0p8ISJQFGRGrH9NuEqiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="72850390"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Jun 2024 21:23:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK9KT-0007IM-1E;
	Thu, 20 Jun 2024 04:23:21 +0000
Date: Thu, 20 Jun 2024 12:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6405/7105] drivers/gpu/drm/xe/xe_oa.c:1170
 xe_oa_mmap() error: uninitialized symbol 'ret'.
Message-ID: <202406201255.I7jsjOoX-lkp@intel.com>
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
TO: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2102cb0d050d34d50b9642a3a50861787527e922
commit: 392bf22238ff88506f410c464ba0c7a84e9de471 [6405/7105] drm/xe/oa/uapi: OA buffer mmap
:::::: branch date: 13 hours ago
:::::: commit date: 33 hours ago
config: x86_64-randconfig-161-20240620 (https://download.01.org/0day-ci/archive/20240620/202406201255.I7jsjOoX-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406201255.I7jsjOoX-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_oa.c:1170 xe_oa_mmap() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/gpu/drm/xe/xe_oa.c:1671 xe_oa_stream_open_ioctl() error: we previously assumed 'oa->xe' could be null (see line 1670)
drivers/gpu/drm/xe/xe_oa.c:1951 xe_oa_add_config_ioctl() error: we previously assumed 'oa->xe' could be null (see line 1950)
drivers/gpu/drm/xe/xe_oa.c:2050 xe_oa_remove_config_ioctl() error: we previously assumed 'oa->xe' could be null (see line 2049)

vim +/ret +1170 drivers/gpu/drm/xe/xe_oa.c

e936f885f1e96f Ashutosh Dixit 2024-06-17  1129  
392bf22238ff88 Ashutosh Dixit 2024-06-17  1130  static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
392bf22238ff88 Ashutosh Dixit 2024-06-17  1131  {
392bf22238ff88 Ashutosh Dixit 2024-06-17  1132  	struct xe_oa_stream *stream = file->private_data;
392bf22238ff88 Ashutosh Dixit 2024-06-17  1133  	struct xe_bo *bo = stream->oa_buffer.bo;
392bf22238ff88 Ashutosh Dixit 2024-06-17  1134  	unsigned long start = vma->vm_start;
392bf22238ff88 Ashutosh Dixit 2024-06-17  1135  	int i, ret;
392bf22238ff88 Ashutosh Dixit 2024-06-17  1136  
392bf22238ff88 Ashutosh Dixit 2024-06-17  1137  	if (xe_perf_stream_paranoid && !perfmon_capable()) {
392bf22238ff88 Ashutosh Dixit 2024-06-17  1138  		drm_dbg(&stream->oa->xe->drm, "Insufficient privilege to map OA buffer\n");
392bf22238ff88 Ashutosh Dixit 2024-06-17  1139  		return -EACCES;
392bf22238ff88 Ashutosh Dixit 2024-06-17  1140  	}
392bf22238ff88 Ashutosh Dixit 2024-06-17  1141  
392bf22238ff88 Ashutosh Dixit 2024-06-17  1142  	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
392bf22238ff88 Ashutosh Dixit 2024-06-17  1143  	if (vma->vm_end - vma->vm_start != XE_OA_BUFFER_SIZE) {
392bf22238ff88 Ashutosh Dixit 2024-06-17  1144  		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
392bf22238ff88 Ashutosh Dixit 2024-06-17  1145  		return -EINVAL;
392bf22238ff88 Ashutosh Dixit 2024-06-17  1146  	}
392bf22238ff88 Ashutosh Dixit 2024-06-17  1147  
392bf22238ff88 Ashutosh Dixit 2024-06-17  1148  	/*
392bf22238ff88 Ashutosh Dixit 2024-06-17  1149  	 * Only support VM_READ, enforce MAP_PRIVATE by checking for
392bf22238ff88 Ashutosh Dixit 2024-06-17  1150  	 * VM_MAYSHARE, don't copy the vma on fork
392bf22238ff88 Ashutosh Dixit 2024-06-17  1151  	 */
392bf22238ff88 Ashutosh Dixit 2024-06-17  1152  	if (vma->vm_flags & (VM_WRITE | VM_EXEC | VM_SHARED | VM_MAYSHARE)) {
392bf22238ff88 Ashutosh Dixit 2024-06-17  1153  		drm_dbg(&stream->oa->xe->drm, "mmap must be read only\n");
392bf22238ff88 Ashutosh Dixit 2024-06-17  1154  		return -EINVAL;
392bf22238ff88 Ashutosh Dixit 2024-06-17  1155  	}
392bf22238ff88 Ashutosh Dixit 2024-06-17  1156  	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
392bf22238ff88 Ashutosh Dixit 2024-06-17  1157  		     VM_MAYWRITE | VM_MAYEXEC);
392bf22238ff88 Ashutosh Dixit 2024-06-17  1158  
392bf22238ff88 Ashutosh Dixit 2024-06-17  1159  	xe_assert(stream->oa->xe, bo->ttm.ttm->num_pages ==
392bf22238ff88 Ashutosh Dixit 2024-06-17  1160  		  (vma->vm_end - vma->vm_start) >> PAGE_SHIFT);
392bf22238ff88 Ashutosh Dixit 2024-06-17  1161  	for (i = 0; i < bo->ttm.ttm->num_pages; i++) {
392bf22238ff88 Ashutosh Dixit 2024-06-17  1162  		ret = remap_pfn_range(vma, start, page_to_pfn(bo->ttm.ttm->pages[i]),
392bf22238ff88 Ashutosh Dixit 2024-06-17  1163  				      PAGE_SIZE, vma->vm_page_prot);
392bf22238ff88 Ashutosh Dixit 2024-06-17  1164  		if (ret)
392bf22238ff88 Ashutosh Dixit 2024-06-17  1165  			break;
392bf22238ff88 Ashutosh Dixit 2024-06-17  1166  
392bf22238ff88 Ashutosh Dixit 2024-06-17  1167  		start += PAGE_SIZE;
392bf22238ff88 Ashutosh Dixit 2024-06-17  1168  	}
392bf22238ff88 Ashutosh Dixit 2024-06-17  1169  
392bf22238ff88 Ashutosh Dixit 2024-06-17 @1170  	return ret;
392bf22238ff88 Ashutosh Dixit 2024-06-17  1171  }
392bf22238ff88 Ashutosh Dixit 2024-06-17  1172  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
