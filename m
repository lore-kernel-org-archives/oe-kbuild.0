Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5538FDDD9
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Mar 2024 15:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710429096; cv=none; b=sWv4Uz6Wxs15Cf6pOW/AxbikNVHG/YyfJ9LUqH9kYVX+nqht5w9+n7nAslTLrXWH095/SZitrah7h7T9iJTO3Bago1S0uwqYSdQRG6pOtCvEsNTdBoUChfoftcrSwMmQpsUAa/FE85Cy6/iiH++In2iGx/DchmVauar/ABUQFCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710429096; c=relaxed/simple;
	bh=oEkM5W5mR45J0AEqy1bjqBfxDFQUCX1YtC7V/xrecAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sxb+rP7+VucXjND62YK/y2jU+h8AQffpDjf+vglCOK0GbglttsV3blL+2+34eOQqxs2AiEEhXgudkFrlx/X+WePzu60cGyDGHgtkLmZJaePqr9uWSU3Nz4GuMv+rSoo0p2c0PqaH11z9CqTmTgx3eg4Vh4E6Eo1T5P3l6pNpO4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S1430Xbp; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S1430Xbp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710429094; x=1741965094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oEkM5W5mR45J0AEqy1bjqBfxDFQUCX1YtC7V/xrecAs=;
  b=S1430Xbp5xN8BJjmqvzgF9CWZj7QwytWQdYPa0hdKRFH6JgwLzrgNqVl
   xz/6ybchw7JJJN4BwX1b4j+NmegIdPOtJRMxNRw6oe7MTOIOD9PDzUxgG
   XJ6Z/pxn0vna8Vy/qwptejrafNnE8nKgQ23YQ57bhChE+yhpg7Egb5w4b
   BVuXqeyFcq5/2AHBXkOCwVh3J1oxvMgqIulWVs2IvHvrOGcakELp/8+Ds
   DepHiQUqDlWwfmGZQO+rIih3bLEFsBfNZP8HIYDqUV2xGTNwm48Iyh6z+
   pB/EN3l2qaZ9brR4NIbMBRitGegECSneXqQFICihJTkRfL+Dcru8kImWE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11013"; a="5377750"
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="5377750"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2024 08:11:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,125,1708416000"; 
   d="scan'208";a="17046599"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Mar 2024 08:11:32 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkmjy-000DX1-0s;
	Thu, 14 Mar 2024 15:11:30 +0000
Date: Thu, 14 Mar 2024 23:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [drm-misc:drm-misc-next 12/14]
 drivers/gpu/drm/panthor/panthor_drv.c:715 panthor_submit_ctx_init() warn:
 Please consider using kvcalloc instead of kvmalloc_array
Message-ID: <202403142347.ImmlxcHs-lkp@intel.com>
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
CC: dri-devel@lists.freedesktop.org
TO: Boris Brezillon <bbrezillon@kernel.org>
CC: Steven Price <steven.price@arm.com>

Hi Boris,

First bad commit (maybe != root cause):

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   751b58418250a56329d35de29329f547c43e7c7f
commit: d72f049087d4f973f6332b599c92177e718107de [12/14] drm/panthor: Allow driver compilation
:::::: branch date: 22 hours ago
:::::: commit date: 13 days ago
config: loongarch-randconfig-r071-20240312 (https://download.01.org/0day-ci/archive/20240314/202403142347.ImmlxcHs-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403142347.ImmlxcHs-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/panthor/panthor_drv.c:715 panthor_submit_ctx_init() warn: Please consider using kvcalloc instead of kvmalloc_array
drivers/gpu/drm/panthor/panthor_gpu.c:215 panthor_gpu_init() warn: missing error code? 'ret'
drivers/gpu/drm/panthor/panthor_mmu.c:1268 panthor_vm_prepare_map_op_ctx() warn: missing error code 'ret'
drivers/gpu/drm/panthor/panthor_mmu.c:1322 panthor_vm_prepare_unmap_op_ctx() warn: missing error code 'ret'
drivers/gpu/drm/panthor/panthor_sched.c:1153 csg_slot_sync_state_locked() error: uninitialized symbol 'new_state'.

Old smatch warnings:
arch/loongarch/include/asm/atomic.h:133 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +715 drivers/gpu/drm/panthor/panthor_drv.c

4bdca11507928a Boris Brezillon 2024-02-29  703  
4bdca11507928a Boris Brezillon 2024-02-29  704  /**
4bdca11507928a Boris Brezillon 2024-02-29  705   * panthor_submit_ctx_init() - Initializes a submission context
4bdca11507928a Boris Brezillon 2024-02-29  706   * @ctx: Submit context to initialize.
4bdca11507928a Boris Brezillon 2024-02-29  707   * @file: drm_file this submission happens on.
4bdca11507928a Boris Brezillon 2024-02-29  708   * @job_count: Number of jobs that will be submitted.
4bdca11507928a Boris Brezillon 2024-02-29  709   *
4bdca11507928a Boris Brezillon 2024-02-29  710   * Return: 0 on success, a negative error code otherwise.
4bdca11507928a Boris Brezillon 2024-02-29  711   */
4bdca11507928a Boris Brezillon 2024-02-29  712  static int panthor_submit_ctx_init(struct panthor_submit_ctx *ctx,
4bdca11507928a Boris Brezillon 2024-02-29  713  				   struct drm_file *file, u32 job_count)
4bdca11507928a Boris Brezillon 2024-02-29  714  {
4bdca11507928a Boris Brezillon 2024-02-29 @715  	ctx->jobs = kvmalloc_array(job_count, sizeof(*ctx->jobs),
4bdca11507928a Boris Brezillon 2024-02-29  716  				   GFP_KERNEL | __GFP_ZERO);
4bdca11507928a Boris Brezillon 2024-02-29  717  	if (!ctx->jobs)
4bdca11507928a Boris Brezillon 2024-02-29  718  		return -ENOMEM;
4bdca11507928a Boris Brezillon 2024-02-29  719  
4bdca11507928a Boris Brezillon 2024-02-29  720  	ctx->file = file;
4bdca11507928a Boris Brezillon 2024-02-29  721  	ctx->job_count = job_count;
4bdca11507928a Boris Brezillon 2024-02-29  722  	INIT_LIST_HEAD(&ctx->signals);
4bdca11507928a Boris Brezillon 2024-02-29  723  	drm_exec_init(&ctx->exec,
4bdca11507928a Boris Brezillon 2024-02-29  724  		      DRM_EXEC_INTERRUPTIBLE_WAIT | DRM_EXEC_IGNORE_DUPLICATES,
4bdca11507928a Boris Brezillon 2024-02-29  725  		      0);
4bdca11507928a Boris Brezillon 2024-02-29  726  	return 0;
4bdca11507928a Boris Brezillon 2024-02-29  727  }
4bdca11507928a Boris Brezillon 2024-02-29  728  

:::::: The code at line 715 was first introduced by commit
:::::: 4bdca11507928a4c9174e9b7240e9d058c12a71d drm/panthor: Add the driver frontend block

:::::: TO: Boris Brezillon <boris.brezillon@collabora.com>
:::::: CC: Boris Brezillon <boris.brezillon@collabora.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
