Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8927FD
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 00:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OOSUZqfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699316702; x=1730852702;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=KlkEZn+ScrH1aAk8LyayB/V8xC84FG6u/i3e7qBz4lc=;
  b=OOSUZqfJcZRxcm5rt7CtBS48UrhmQlupEUv6IDfehNRYSC8thdRgISqJ
   Ukr+naD8WLLT33NoleuGnCxh6GO/PyXMuWS4blejhvgtTmCUfufOl6lod
   I9RnczwVyhurD9HWoB21L7qI+Xj2A+PopiYkvGLE8BAihnsKmQfiZd4L4
   +p/oVmYPwZQhxyPcCzyZTJ5WRvfbCOZ6iOTumALFVUAEN7IsPnOK/KC4c
   zSy8xnydbsBugF/4NsRyN0Fu6ef7b6hjF5NLMYSfA60bMRrVs/VnsAvof
   1LlCzdp+ZI+Q1V21cz00iO8DN4KBPFuXoyTjlApou4zeEO+ajj8sjQ4Al
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="420505999"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="420505999"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 16:25:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="738942227"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="738942227"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Nov 2023 16:24:59 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r09tp-0006qG-0J;
	Tue, 07 Nov 2023 00:24:57 +0000
Date: Tue, 7 Nov 2023 08:24:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/scheduler/sched_main.c:905 drm_sched_select_entity()
 error: uninitialized symbol 'entity'.
Message-ID: <202311070701.YgtLNfrg-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Luben Tuikov <luben.tuikov@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: 56e449603f0ac580700621a356d35d5716a62ce5 drm/sched: Convert the GPU scheduler to variable number of run-queues
date:   11 days ago
:::::: branch date: 21 hours ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231107/202311070701.YgtLNfrg-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311070701.YgtLNfrg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311070701.YgtLNfrg-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/scheduler/sched_main.c:905 drm_sched_select_entity() error: uninitialized symbol 'entity'.
drivers/gpu/drm/scheduler/sched_main.c:1124 drm_sched_init() warn: Please consider using kcalloc instead of kmalloc_array

vim +/entity +905 drivers/gpu/drm/scheduler/sched_main.c

88079006dc412c drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-24  879  
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  880  /**
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  881   * drm_sched_select_entity - Select next entity to process
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  882   *
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  883   * @sched: scheduler instance
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  884   *
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  885   * Returns the entity to process or NULL if none are found.
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  886   */
1b1f42d8fde4fe drivers/gpu/drm/scheduler/gpu_scheduler.c     Lucas Stach       2017-12-06  887  static struct drm_sched_entity *
1b1f42d8fde4fe drivers/gpu/drm/scheduler/gpu_scheduler.c     Lucas Stach       2017-12-06  888  drm_sched_select_entity(struct drm_gpu_scheduler *sched)
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  889  {
1b1f42d8fde4fe drivers/gpu/drm/scheduler/gpu_scheduler.c     Lucas Stach       2017-12-06  890  	struct drm_sched_entity *entity;
d033a6de800541 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Chunming Zhou     2015-11-05  891  	int i;
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  892  
e072700869dd96 drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2023-05-17  893  	if (!drm_sched_can_queue(sched))
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  894  		return NULL;
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  895  
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  896  	/* Kernel run queue has higher priority than normal run queue*/
56e449603f0ac5 drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2023-10-14  897  	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
08fb97de03aa22 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2022-09-30  898  		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
56e449603f0ac5 drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2023-10-14  899  			drm_sched_rq_select_entity_fifo(sched->sched_rq[i]) :
56e449603f0ac5 drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2023-10-14  900  			drm_sched_rq_select_entity_rr(sched->sched_rq[i]);
d033a6de800541 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Chunming Zhou     2015-11-05  901  		if (entity)
d033a6de800541 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Chunming Zhou     2015-11-05  902  			break;
d033a6de800541 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Chunming Zhou     2015-11-05  903  	}
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  904  
3d65193635e122 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-11-12 @905  	return entity;
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  906  }
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  907  

:::::: The code at line 905 was first introduced by commit
:::::: 3d65193635e122d0783b97cb2202b7f21601037a drm/amdgpu: move dependency handling out of atomic section v2

:::::: TO: Christian König <christian.koenig@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
