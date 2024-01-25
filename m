Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90163131E42
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jan 2024 16:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706201306; cv=none; b=VgCy1xuq6rde2PsVoqKqG22j/VTulsKh26MUfbHv306AxUr70jzAkTrnNytdsI8LqHZ401qmF7zXDAShNxJmYwUi7jseGSpx234lkq5F1dj/gQehUwAUa/QUUXFCeX7zhoQI0IjYRaitgVL32jM+6QZbSdXL9S/gcKOLIbMyV8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706201306; c=relaxed/simple;
	bh=1JicgeYHv4yAduefuTUktHtNEd7VfW0mpP8q3kxr/zo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X+PxdRDrahanxxxfe2g8OXcghEsY1OXOOovukmiuHpu3Yl/UkzwYDP04p7OekOIAfp4Z96V4ch+jTUG5C14Bc+V6Q8uHzHuyqVP8fGsk32oPoPpYszJunFKIY3U1mxDjKUV5MLDu/ljGnfXiaaFgNk4mKeOFii4aexNC/3ijGtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j6xg3MsG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j6xg3MsG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706201304; x=1737737304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1JicgeYHv4yAduefuTUktHtNEd7VfW0mpP8q3kxr/zo=;
  b=j6xg3MsGfhxqGuaQBudFLHrpivc035PIn5V0DmUz5HpY2z+WnB/ft46y
   OwMhH3dWV1IFFBEScouF5Cc7TwG8xVGumN0I1tLZRj0Qac76gleMlNEiH
   nWQP2V9P0yrFDjA/SCgjLieZGeyxyq5Mc1BjMMgRH2q+F8GO8jd9srWEC
   ayEfU+ZAwy7fnezHzLz2mENgmrdeP0fGh3JovWJxvSP9FiaiYeZu7mCYk
   jWLxOoJWsJh+4izyaAIiflfnGxdMKBmIZiCDbwanlq1N03jBpeHdSm1Oo
   0O/MPavhjUNBsC8m7TRdy4SFR/m/T6plGsbFxY8is4l/ZB4iOq1N/PVmX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="23679136"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="23679136"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 08:48:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="786817300"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="786817300"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 25 Jan 2024 08:48:04 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rT2tW-0000DB-0I;
	Thu, 25 Jan 2024 16:48:02 +0000
Date: Fri, 26 Jan 2024 00:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/xe/xe_guc_submit.c:1144:1-7: preceding lock on line
 1100
Message-ID: <202401260056.LFLxAl9Z-lkp@intel.com>
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
TO: Matthew Brost <matthew.brost@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6098d87eaf31f48153c984e2adadf14762520a87
commit: dd08ebf6c3525a7ea2186e636df064ea47281987 drm/xe: Introduce a new DRM driver for Intel GPUs
date:   6 weeks ago
:::::: branch date: 16 hours ago
:::::: commit date: 6 weeks ago
config: powerpc64-randconfig-r052-20240125 (https://download.01.org/0day-ci/archive/20240126/202401260056.LFLxAl9Z-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401260056.LFLxAl9Z-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_guc_submit.c:1144:1-7: preceding lock on line 1100

vim +1144 drivers/gpu/drm/xe/xe_guc_submit.c

dd08ebf6c3525a Matthew Brost 2023-03-30  1067  
dd08ebf6c3525a Matthew Brost 2023-03-30  1068  static int guc_engine_init(struct xe_engine *e)
dd08ebf6c3525a Matthew Brost 2023-03-30  1069  {
dd08ebf6c3525a Matthew Brost 2023-03-30  1070  	struct xe_gpu_scheduler *sched;
dd08ebf6c3525a Matthew Brost 2023-03-30  1071  	struct xe_guc *guc = engine_to_guc(e);
dd08ebf6c3525a Matthew Brost 2023-03-30  1072  	struct xe_guc_engine *ge;
dd08ebf6c3525a Matthew Brost 2023-03-30  1073  	long timeout;
dd08ebf6c3525a Matthew Brost 2023-03-30  1074  	int err;
dd08ebf6c3525a Matthew Brost 2023-03-30  1075  
dd08ebf6c3525a Matthew Brost 2023-03-30  1076  	XE_BUG_ON(!xe_device_guc_submission_enabled(guc_to_xe(guc)));
dd08ebf6c3525a Matthew Brost 2023-03-30  1077  
dd08ebf6c3525a Matthew Brost 2023-03-30  1078  	ge = kzalloc(sizeof(*ge), GFP_KERNEL);
dd08ebf6c3525a Matthew Brost 2023-03-30  1079  	if (!ge)
dd08ebf6c3525a Matthew Brost 2023-03-30  1080  		return -ENOMEM;
dd08ebf6c3525a Matthew Brost 2023-03-30  1081  
dd08ebf6c3525a Matthew Brost 2023-03-30  1082  	e->guc = ge;
dd08ebf6c3525a Matthew Brost 2023-03-30  1083  	ge->engine = e;
dd08ebf6c3525a Matthew Brost 2023-03-30  1084  	init_waitqueue_head(&ge->suspend_wait);
dd08ebf6c3525a Matthew Brost 2023-03-30  1085  
dd08ebf6c3525a Matthew Brost 2023-03-30  1086  	timeout = xe_vm_no_dma_fences(e->vm) ? MAX_SCHEDULE_TIMEOUT : HZ * 5;
dd08ebf6c3525a Matthew Brost 2023-03-30  1087  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops, NULL,
dd08ebf6c3525a Matthew Brost 2023-03-30  1088  			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
dd08ebf6c3525a Matthew Brost 2023-03-30  1089  			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
dd08ebf6c3525a Matthew Brost 2023-03-30  1090  			     e->name, gt_to_xe(e->gt)->drm.dev);
dd08ebf6c3525a Matthew Brost 2023-03-30  1091  	if (err)
dd08ebf6c3525a Matthew Brost 2023-03-30  1092  		goto err_free;
dd08ebf6c3525a Matthew Brost 2023-03-30  1093  
dd08ebf6c3525a Matthew Brost 2023-03-30  1094  	sched = &ge->sched;
dd08ebf6c3525a Matthew Brost 2023-03-30  1095  	err = xe_sched_entity_init(&ge->entity, sched);
dd08ebf6c3525a Matthew Brost 2023-03-30  1096  	if (err)
dd08ebf6c3525a Matthew Brost 2023-03-30  1097  		goto err_sched;
dd08ebf6c3525a Matthew Brost 2023-03-30  1098  	e->priority = XE_ENGINE_PRIORITY_NORMAL;
dd08ebf6c3525a Matthew Brost 2023-03-30  1099  
dd08ebf6c3525a Matthew Brost 2023-03-30 @1100  	mutex_lock(&guc->submission_state.lock);
dd08ebf6c3525a Matthew Brost 2023-03-30  1101  
dd08ebf6c3525a Matthew Brost 2023-03-30  1102  	err = alloc_guc_id(guc, e);
dd08ebf6c3525a Matthew Brost 2023-03-30  1103  	if (err)
dd08ebf6c3525a Matthew Brost 2023-03-30  1104  		goto err_entity;
dd08ebf6c3525a Matthew Brost 2023-03-30  1105  
dd08ebf6c3525a Matthew Brost 2023-03-30  1106  	e->entity = &ge->entity;
dd08ebf6c3525a Matthew Brost 2023-03-30  1107  
dd08ebf6c3525a Matthew Brost 2023-03-30  1108  	if (guc_read_stopped(guc))
dd08ebf6c3525a Matthew Brost 2023-03-30  1109  		xe_sched_stop(sched);
dd08ebf6c3525a Matthew Brost 2023-03-30  1110  
dd08ebf6c3525a Matthew Brost 2023-03-30  1111  	mutex_unlock(&guc->submission_state.lock);
dd08ebf6c3525a Matthew Brost 2023-03-30  1112  
dd08ebf6c3525a Matthew Brost 2023-03-30  1113  	switch (e->class) {
dd08ebf6c3525a Matthew Brost 2023-03-30  1114  	case XE_ENGINE_CLASS_RENDER:
dd08ebf6c3525a Matthew Brost 2023-03-30  1115  		sprintf(e->name, "rcs%d", e->guc->id);
dd08ebf6c3525a Matthew Brost 2023-03-30  1116  		break;
dd08ebf6c3525a Matthew Brost 2023-03-30  1117  	case XE_ENGINE_CLASS_VIDEO_DECODE:
dd08ebf6c3525a Matthew Brost 2023-03-30  1118  		sprintf(e->name, "vcs%d", e->guc->id);
dd08ebf6c3525a Matthew Brost 2023-03-30  1119  		break;
dd08ebf6c3525a Matthew Brost 2023-03-30  1120  	case XE_ENGINE_CLASS_VIDEO_ENHANCE:
dd08ebf6c3525a Matthew Brost 2023-03-30  1121  		sprintf(e->name, "vecs%d", e->guc->id);
dd08ebf6c3525a Matthew Brost 2023-03-30  1122  		break;
dd08ebf6c3525a Matthew Brost 2023-03-30  1123  	case XE_ENGINE_CLASS_COPY:
dd08ebf6c3525a Matthew Brost 2023-03-30  1124  		sprintf(e->name, "bcs%d", e->guc->id);
dd08ebf6c3525a Matthew Brost 2023-03-30  1125  		break;
dd08ebf6c3525a Matthew Brost 2023-03-30  1126  	case XE_ENGINE_CLASS_COMPUTE:
dd08ebf6c3525a Matthew Brost 2023-03-30  1127  		sprintf(e->name, "ccs%d", e->guc->id);
dd08ebf6c3525a Matthew Brost 2023-03-30  1128  		break;
dd08ebf6c3525a Matthew Brost 2023-03-30  1129  	default:
dd08ebf6c3525a Matthew Brost 2023-03-30  1130  		XE_WARN_ON(e->class);
dd08ebf6c3525a Matthew Brost 2023-03-30  1131  	}
dd08ebf6c3525a Matthew Brost 2023-03-30  1132  
dd08ebf6c3525a Matthew Brost 2023-03-30  1133  	trace_xe_engine_create(e);
dd08ebf6c3525a Matthew Brost 2023-03-30  1134  
dd08ebf6c3525a Matthew Brost 2023-03-30  1135  	return 0;
dd08ebf6c3525a Matthew Brost 2023-03-30  1136  
dd08ebf6c3525a Matthew Brost 2023-03-30  1137  err_entity:
dd08ebf6c3525a Matthew Brost 2023-03-30  1138  	xe_sched_entity_fini(&ge->entity);
dd08ebf6c3525a Matthew Brost 2023-03-30  1139  err_sched:
dd08ebf6c3525a Matthew Brost 2023-03-30  1140  	xe_sched_fini(&ge->sched);
dd08ebf6c3525a Matthew Brost 2023-03-30  1141  err_free:
dd08ebf6c3525a Matthew Brost 2023-03-30  1142  	kfree(ge);
dd08ebf6c3525a Matthew Brost 2023-03-30  1143  
dd08ebf6c3525a Matthew Brost 2023-03-30 @1144  	return err;
dd08ebf6c3525a Matthew Brost 2023-03-30  1145  }
dd08ebf6c3525a Matthew Brost 2023-03-30  1146  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
