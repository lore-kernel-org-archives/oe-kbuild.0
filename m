Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE9923CB
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 06:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751092834; cv=none; b=Z87wacbm1LRBOpSrWnayXLApo8TQjZOEt1LIIf+CBdIEicTmCbWDupJY4B5Gij/RGKVjbAadANnRnShjc7+TAILz3KMTsZyCRMK25i/tTSMkGQxtKri4PnLFeejE97S99A9rPlP/vdSfhgvMBc6TQ04+Wlvb24l6vkGfm2yC0pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751092834; c=relaxed/simple;
	bh=Ed7yibevz2UWv8vQSr+u3tAzqYdqf5+eAjMEoTBjxLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mrNoOnvLJQ6CAHgb5Aqa0FInwalDWHM4uI5fcbGP0PtYwCjF6tjmyis/X9Am5nKqrFJWEQ3zh2cmDDZvaYtVwqpo0FmPWHRF9F2W6vvoIxr43uxiu10KR51cR/aXyU/nBE8ZpE4vPF/A7IxSUhvfdibLM6U1OzUgvIowDRIVdB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KF5I427y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KF5I427y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751092832; x=1782628832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ed7yibevz2UWv8vQSr+u3tAzqYdqf5+eAjMEoTBjxLE=;
  b=KF5I427y1GfNpYt2brAjpMUm9x28TWB60dDV2sqCP046p9PYp4eL6IHg
   QacGJr8RqWc9qonZUyN/WOkBcW0O22wuGp8faXYhb5Ygy/rErAHVDzvPP
   +RoKoKH8XEuf1EWLOflCy+kXhVbdFeHM1Eo3Le/SPgp79+QbF2rGTYZhW
   8slCDCxmaTuPbxlb679Ca5euK+dHZ6uouBD9hNWxchQVMXSQYix/Qp9oK
   W2Wq0k244q2kdrWYWl74yBf6yV3uPOe1E8x5vi25B8bnWjPg27L5ju8wS
   QonpYL1mfFaHui65H+IN6Q6hnnrFmvPnA4jr1xHXcga0GrtHzH9BeUdYH
   Q==;
X-CSE-ConnectionGUID: mRfTFMJSQC6VnZsvVj+zMA==
X-CSE-MsgGUID: lvBm7h3hQbmV6J+vR2BWiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="64844349"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="64844349"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 23:40:32 -0700
X-CSE-ConnectionGUID: EodnJekHQ/q4qW3Adcr7/g==
X-CSE-MsgGUID: RjDDWqD7S96uKgV+zcj52Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="152719803"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Jun 2025 23:40:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVPEi-000Wru-0i;
	Sat, 28 Jun 2025 06:40:28 +0000
Date: Sat, 28 Jun 2025 14:39:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c:329:12-13:
 WARNING kvmalloc is used to allocate this memory at line 303
Message-ID: <202506281410.vruIRwPQ-lkp@intel.com>
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
TO: Ben Skeggs <bskeggs@nvidia.com>
CC: Dave Airlie <airlied@redhat.com>
CC: Timur Tabi <ttabi@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aaf724ed69264719550ec4f194d3ab17b886af9a
commit: 8a8b1ec5261f20d86c76c8fb235ee2441744bc10 drm/nouveau/gsp: split rpc handling out on its own
date:   6 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-102-20250628 (https://download.01.org/0day-ci/archive/20250628/202506281410.vruIRwPQ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506281410.vruIRwPQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c:329:12-13: WARNING kvmalloc is used to allocate this memory at line 303
   drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c:338:12-13: WARNING kvmalloc is used to allocate this memory at line 303

vim +329 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c

8a8b1ec5261f20 Ben Skeggs 2024-11-14  286  
8a8b1ec5261f20 Ben Skeggs 2024-11-14  287  static void *
8a8b1ec5261f20 Ben Skeggs 2024-11-14  288  r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
8a8b1ec5261f20 Ben Skeggs 2024-11-14  289  {
8a8b1ec5261f20 Ben Skeggs 2024-11-14  290  	struct r535_gsp_msg *mqe;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  291  	const u32 max_rpc_size = GSP_MSG_MAX_SIZE - sizeof(*mqe);
8a8b1ec5261f20 Ben Skeggs 2024-11-14  292  	struct nvfw_gsp_rpc *rpc;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  293  	struct r535_gsp_msg_info info = {0};
8a8b1ec5261f20 Ben Skeggs 2024-11-14  294  	u32 expected = gsp_rpc_len;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  295  	void *buf;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  296  
8a8b1ec5261f20 Ben Skeggs 2024-11-14  297  	mqe = r535_gsp_msgq_get_entry(gsp);
8a8b1ec5261f20 Ben Skeggs 2024-11-14  298  	rpc = (struct nvfw_gsp_rpc *)mqe->data;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  299  
8a8b1ec5261f20 Ben Skeggs 2024-11-14  300  	if (WARN_ON(rpc->length > max_rpc_size))
8a8b1ec5261f20 Ben Skeggs 2024-11-14  301  		return NULL;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  302  
8a8b1ec5261f20 Ben Skeggs 2024-11-14 @303  	buf = kvmalloc(max_t(u32, rpc->length, expected), GFP_KERNEL);
8a8b1ec5261f20 Ben Skeggs 2024-11-14  304  	if (!buf)
8a8b1ec5261f20 Ben Skeggs 2024-11-14  305  		return ERR_PTR(-ENOMEM);
8a8b1ec5261f20 Ben Skeggs 2024-11-14  306  
8a8b1ec5261f20 Ben Skeggs 2024-11-14  307  	info.gsp_rpc_buf = buf;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  308  	info.retries = retries;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  309  	info.gsp_rpc_len = rpc->length;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  310  
8a8b1ec5261f20 Ben Skeggs 2024-11-14  311  	buf = r535_gsp_msgq_recv_one_elem(gsp, &info);
8a8b1ec5261f20 Ben Skeggs 2024-11-14  312  	if (IS_ERR(buf)) {
8a8b1ec5261f20 Ben Skeggs 2024-11-14  313  		kvfree(info.gsp_rpc_buf);
8a8b1ec5261f20 Ben Skeggs 2024-11-14  314  		info.gsp_rpc_buf = NULL;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  315  		return buf;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  316  	}
8a8b1ec5261f20 Ben Skeggs 2024-11-14  317  
8a8b1ec5261f20 Ben Skeggs 2024-11-14  318  	if (expected <= max_rpc_size)
8a8b1ec5261f20 Ben Skeggs 2024-11-14  319  		return buf;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  320  
8a8b1ec5261f20 Ben Skeggs 2024-11-14  321  	info.gsp_rpc_buf += info.gsp_rpc_len;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  322  	expected -= info.gsp_rpc_len;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  323  
8a8b1ec5261f20 Ben Skeggs 2024-11-14  324  	while (expected) {
8a8b1ec5261f20 Ben Skeggs 2024-11-14  325  		u32 size;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  326  
8a8b1ec5261f20 Ben Skeggs 2024-11-14  327  		rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), info.retries);
8a8b1ec5261f20 Ben Skeggs 2024-11-14  328  		if (IS_ERR_OR_NULL(rpc)) {
8a8b1ec5261f20 Ben Skeggs 2024-11-14 @329  			kfree(buf);
8a8b1ec5261f20 Ben Skeggs 2024-11-14  330  			return rpc;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  331  		}
8a8b1ec5261f20 Ben Skeggs 2024-11-14  332  
8a8b1ec5261f20 Ben Skeggs 2024-11-14  333  		info.gsp_rpc_len = rpc->length;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  334  		info.continuation = true;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  335  
8a8b1ec5261f20 Ben Skeggs 2024-11-14  336  		rpc = r535_gsp_msgq_recv_one_elem(gsp, &info);
8a8b1ec5261f20 Ben Skeggs 2024-11-14  337  		if (IS_ERR_OR_NULL(rpc)) {
8a8b1ec5261f20 Ben Skeggs 2024-11-14  338  			kfree(buf);
8a8b1ec5261f20 Ben Skeggs 2024-11-14  339  			return rpc;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  340  		}
8a8b1ec5261f20 Ben Skeggs 2024-11-14  341  
8a8b1ec5261f20 Ben Skeggs 2024-11-14  342  		size = info.gsp_rpc_len - sizeof(*rpc);
8a8b1ec5261f20 Ben Skeggs 2024-11-14  343  		expected -= size;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  344  		info.gsp_rpc_buf += size;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  345  	}
8a8b1ec5261f20 Ben Skeggs 2024-11-14  346  
8a8b1ec5261f20 Ben Skeggs 2024-11-14  347  	rpc = buf;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  348  	rpc->length = gsp_rpc_len;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  349  	return buf;
8a8b1ec5261f20 Ben Skeggs 2024-11-14  350  }
8a8b1ec5261f20 Ben Skeggs 2024-11-14  351  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
