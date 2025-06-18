Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFFE2E54C5
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 13:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750252551; cv=none; b=l+Ao8cLfpIHLiQ24NPK9Qec+acns0h9D5s7Ny5Sa4KiwPnuH2hAowEvnAhE1XeZ4I76jWxsUH447gOXAq9r8bqQSEAhrzD7od9cNJi6ttEFCRBq5gxQh6oOQoh/tIdtxCauvrGP2ZLVpARQBGlEWsiVr75LNHvlOp4+v3O8VpNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750252551; c=relaxed/simple;
	bh=CtAocB0VIXHx7ntQyff0RHB2cdM2fl3eZvcRQnhPgHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BRV8Px6HfqOS0yJf7FKXYskIeU0niHPFhTHTGi3lv2YjW+/dlZxpUEzQm2mjbtnpzztIkfZ3l12ASSrewTRoFOXqpl3c/Gyy9uxM6DRlc8J0xa00XDYokBMcgU3GuBjPWw9FZsWwqaEdGVzfdkaOt8kw1tZ9D8ARa7vQuy2PXno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/VXb8go; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/VXb8go"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750252549; x=1781788549;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CtAocB0VIXHx7ntQyff0RHB2cdM2fl3eZvcRQnhPgHo=;
  b=G/VXb8godifg8svG+12PKHWopcYsOgv+1/WlkRv/T5fCpgq1WtH8ttmO
   a5oKcz6L9vtO3MfXMZ78RE8G/uMKStvsCx1lPTeTyBrQxzvz9EhbfpnMi
   LGQ/vUlCdR/2nenZJDxiDj4KKXdCVNBVcpaQ1HahypfjiT9Ji3VxbWFjn
   5qBJDDIBXac2sapcOsFUhKliL9cGQtWNF8/zBn4HFDmfRrNEVX+9vh77x
   hWbfApvhzV5DYmatnBYJv3qGzWWoP/QGeAiE9fJWhNJSznt4Dxtf7yQDM
   xmm+k0iUtf68F+lQnjlT9EqqrgluWpdLqwbn5PHOcHbdvS6x6oXvLVKhG
   w==;
X-CSE-ConnectionGUID: y07LTp5dQdyO8bQW/d1UnQ==
X-CSE-MsgGUID: IPNvoM0xQ2Gm5OWjaY5fTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52388884"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52388884"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 06:15:47 -0700
X-CSE-ConnectionGUID: rThkFd1eS5qoLtO8xXv49w==
X-CSE-MsgGUID: vYFTdN9iS4iC0zY7VsxQlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="149357197"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 18 Jun 2025 06:15:46 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRsdj-000Jo2-2N;
	Wed, 18 Jun 2025 13:15:43 +0000
Date: Wed, 18 Jun 2025 21:14:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 2699/3311]
 drivers/gpu/drm/etnaviv/etnaviv_sched.c:80 etnaviv_sched_timedout_job()
 warn: variable dereferenced before check 'sched_job' (see line 38)
Message-ID: <202506182125.Qa0wM9xy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Maíra Canal" <mcanal@igalia.com>
CC: Lucas Stach <l.stach@pengutronix.de>
CC: Philipp Stanner <phasta@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6e5ab6fee68df8c40b338baeae6e269fa25a7e25
commit: 61ee19dedb8d753249e20308782bf4e9e2fb7344 [2699/3311] drm/etnaviv: Protect the scheduler's pending list with its lock
:::::: branch date: 7 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250618 (https://download.01.org/0day-ci/archive/20250618/202506182125.Qa0wM9xy-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506182125.Qa0wM9xy-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/etnaviv/etnaviv_sched.c:80 etnaviv_sched_timedout_job() warn: variable dereferenced before check 'sched_job' (see line 38)

vim +/sched_job +80 drivers/gpu/drm/etnaviv/etnaviv_sched.c

e93b6deeb45a78 Lucas Stach       2017-12-04  33  
a6a1f036c74e3d Luben Tuikov      2021-01-20  34  static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
a6a1f036c74e3d Luben Tuikov      2021-01-20  35  							  *sched_job)
e93b6deeb45a78 Lucas Stach       2017-12-04  36  {
6d7a20c0776036 Lucas Stach       2017-12-06  37  	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
61ee19dedb8d75 Maíra Canal       2025-06-02 @38  	struct drm_gpu_scheduler *sched = sched_job->sched;
6d7a20c0776036 Lucas Stach       2017-12-06  39  	struct etnaviv_gpu *gpu = submit->gpu;
e1f3220b957a55 Lucas Stach       2024-07-05  40  	u32 dma_addr, primid = 0;
2c83a726d6fbb5 Lucas Stach       2018-06-27  41  	int change;
2c83a726d6fbb5 Lucas Stach       2018-06-27  42  
2c83a726d6fbb5 Lucas Stach       2018-06-27  43  	/*
2c83a726d6fbb5 Lucas Stach       2018-06-27  44  	 * If the GPU managed to complete this jobs fence, the timout is
2c83a726d6fbb5 Lucas Stach       2018-06-27  45  	 * spurious. Bail out.
2c83a726d6fbb5 Lucas Stach       2018-06-27  46  	 */
6fce3a406108ee Lucas Stach       2018-10-04  47  	if (dma_fence_is_signaled(submit->out_fence))
50248a3ec0f5e5 Lucas Stach       2020-08-24  48  		goto out_no_timeout;
2c83a726d6fbb5 Lucas Stach       2018-06-27  49  
2c83a726d6fbb5 Lucas Stach       2018-06-27  50  	/*
2c83a726d6fbb5 Lucas Stach       2018-06-27  51  	 * If the GPU is still making forward progress on the front-end (which
2c83a726d6fbb5 Lucas Stach       2018-06-27  52  	 * should never loop) we shift out the timeout to give it a chance to
2c83a726d6fbb5 Lucas Stach       2018-06-27  53  	 * finish the job.
2c83a726d6fbb5 Lucas Stach       2018-06-27  54  	 */
2c83a726d6fbb5 Lucas Stach       2018-06-27  55  	dma_addr = gpu_read(gpu, VIVS_FE_DMA_ADDRESS);
2c83a726d6fbb5 Lucas Stach       2018-06-27  56  	change = dma_addr - gpu->hangcheck_dma_addr;
e1f3220b957a55 Lucas Stach       2024-07-05  57  	if (submit->exec_state == ETNA_PIPE_3D) {
e1f3220b957a55 Lucas Stach       2024-07-05  58  		/* guard against concurrent usage from perfmon_sample */
e1f3220b957a55 Lucas Stach       2024-07-05  59  		mutex_lock(&gpu->lock);
e1f3220b957a55 Lucas Stach       2024-07-05  60  		gpu_write(gpu, VIVS_MC_PROFILE_CONFIG0,
e1f3220b957a55 Lucas Stach       2024-07-05  61  			  VIVS_MC_PROFILE_CONFIG0_FE_CURRENT_PRIM <<
e1f3220b957a55 Lucas Stach       2024-07-05  62  			  VIVS_MC_PROFILE_CONFIG0_FE__SHIFT);
e1f3220b957a55 Lucas Stach       2024-07-05  63  		primid = gpu_read(gpu, VIVS_MC_PROFILE_FE_READ);
e1f3220b957a55 Lucas Stach       2024-07-05  64  		mutex_unlock(&gpu->lock);
e1f3220b957a55 Lucas Stach       2024-07-05  65  	}
9ec2afde83c18e Lucas Stach       2023-06-07  66  	if (gpu->state == ETNA_GPU_STATE_RUNNING &&
9ec2afde83c18e Lucas Stach       2023-06-07  67  	    (gpu->completed_fence != gpu->hangcheck_fence ||
e1f3220b957a55 Lucas Stach       2024-07-05  68  	     change < 0 || change > 16 ||
e1f3220b957a55 Lucas Stach       2024-07-05  69  	     (submit->exec_state == ETNA_PIPE_3D &&
e1f3220b957a55 Lucas Stach       2024-07-05  70  	      gpu->hangcheck_primid != primid))) {
2c83a726d6fbb5 Lucas Stach       2018-06-27  71  		gpu->hangcheck_dma_addr = dma_addr;
e1f3220b957a55 Lucas Stach       2024-07-05  72  		gpu->hangcheck_primid = primid;
cdd156955f946b Lucas Stach       2021-12-22  73  		gpu->hangcheck_fence = gpu->completed_fence;
50248a3ec0f5e5 Lucas Stach       2020-08-24  74  		goto out_no_timeout;
2c83a726d6fbb5 Lucas Stach       2018-06-27  75  	}
6d7a20c0776036 Lucas Stach       2017-12-06  76  
704d3d60fec451 Lucas Stach       2024-06-21  77  	/* block scheduler */
704d3d60fec451 Lucas Stach       2024-06-21  78  	drm_sched_stop(&gpu->sched, sched_job);
704d3d60fec451 Lucas Stach       2024-06-21  79  
222b5f04415987 Andrey Grodzovsky 2018-12-04 @80  	if(sched_job)
222b5f04415987 Andrey Grodzovsky 2018-12-04  81  		drm_sched_increase_karma(sched_job);
6d7a20c0776036 Lucas Stach       2017-12-06  82  
6d7a20c0776036 Lucas Stach       2017-12-06  83  	/* get the GPU back into the init state */
9a1fdae5876016 Lucas Stach       2019-08-09  84  	etnaviv_core_dump(submit);
f51d753f81c086 Christian Gmeiner 2022-06-03  85  	etnaviv_gpu_recover_hang(submit);
6d7a20c0776036 Lucas Stach       2017-12-06  86  
222b5f04415987 Andrey Grodzovsky 2018-12-04  87  	drm_sched_resubmit_jobs(&gpu->sched);
222b5f04415987 Andrey Grodzovsky 2018-12-04  88  
b2ef808786d93d Christian König   2024-08-26  89  	drm_sched_start(&gpu->sched, 0);
a6a1f036c74e3d Luben Tuikov      2021-01-20  90  	return DRM_GPU_SCHED_STAT_NOMINAL;
a6a1f036c74e3d Luben Tuikov      2021-01-20  91  
50248a3ec0f5e5 Lucas Stach       2020-08-24  92  out_no_timeout:
61ee19dedb8d75 Maíra Canal       2025-06-02  93  	spin_lock(&sched->job_list_lock);
61ee19dedb8d75 Maíra Canal       2025-06-02  94  	list_add(&sched_job->list, &sched->pending_list);
61ee19dedb8d75 Maíra Canal       2025-06-02  95  	spin_unlock(&sched->job_list_lock);
a6a1f036c74e3d Luben Tuikov      2021-01-20  96  	return DRM_GPU_SCHED_STAT_NOMINAL;
e93b6deeb45a78 Lucas Stach       2017-12-04  97  }
e93b6deeb45a78 Lucas Stach       2017-12-04  98  

:::::: The code at line 80 was first introduced by commit
:::::: 222b5f044159877504dbac9bc1910f89a74136e2 drm/sched: Refactor ring mirror list handling.

:::::: TO: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
