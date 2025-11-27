Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC17130FC09
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 21:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764277477; cv=none; b=C70KqDZ6P/NzldhCKBCn5RSpmuFToNglfwg390FbEQgRVfHOjUafonFFlzLDkacJHg7Q/ZCkgVqwzG8pX1y+prZQzyQHviSKxjpl1SpQe2MhpwOpJMV1nAstBOChhaPXN7DMAkvNPDZ9Hbypdp377VIt9i08eWT8BWuEwQpiQOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764277477; c=relaxed/simple;
	bh=A0WSlNAP7tgo1lNzHtCpU7XAk36RwpHiTpM8okPFKLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RaYvyMCf0YEBMdkZEGyAbe7lDcARTtw8S46OVGCY6Ewoi1JJdVhYmvh1QpgKLlTf7sH5aR8Y8SFBOD9XlBh+sCegFKzEMMyEXA69/UG0lXq27wmXqTTALsNQ3hF29LQDPoltlCjiLBsYOQMdmVLOK6zB6BpWgHIoepMZ4nhKwrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddQOh2WO; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddQOh2WO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764277476; x=1795813476;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A0WSlNAP7tgo1lNzHtCpU7XAk36RwpHiTpM8okPFKLs=;
  b=ddQOh2WOKrpFi03bbXndFAtb6sUpcS5QwDns1hXSThPZ8BDhLQEhqvca
   g2Zp8TiAsDS3gKnO7O9ky3tdRzf5JgxyFS2h9t1QVEifh2A1ke68y3Z/N
   CJ9U7BsgmDcMBd04n++PuHqu3F5n/lr7/n8LdrqqZpa/rHzybfNfj6WGv
   aPsf1tILBQmnjP02Rn0J/JR/SDBj4/FOhNW6JwEpKsc7Zyxw3XBzzg5cx
   OHpSYLO8YZtCWm8PTHDWUAGPURh6jydo8wi7WayHXnS4WYFabbFG7dCsv
   5I1J7e2jJEdbl+jtMuPB8uT1TFpdEQJ9cPHJZqLOR3R7Zb+OegC173NGO
   A==;
X-CSE-ConnectionGUID: 6g7dxmtpTFSBbB/u4sc9Mw==
X-CSE-MsgGUID: rX2Z7fvnT++GfL0KZ1pvHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="83715163"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="83715163"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 13:04:33 -0800
X-CSE-ConnectionGUID: gYHYqNDGR0ixRvq2CkNd1A==
X-CSE-MsgGUID: g2i8ubVTT3KyZKHmq/XE7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; 
   d="scan'208";a="193408528"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2025 13:04:32 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOjAD-000000005gL-37JI;
	Thu, 27 Nov 2025 21:04:29 +0000
Date: Fri, 28 Nov 2025 05:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11680/12398]
 drivers/gpu/drm/xe/xe_guc_submit.c:2256 guc_exec_queue_unpause_prepare()
 warn: iterator used outside loop: 'job'
Message-ID: <202511280417.SqtqiPAw-lkp@intel.com>
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
TO: Matthew Brost <matthew.brost@intel.com>
CC: Tomasz Lis <tomasz.lis@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
commit: 00937fe1921ab346b6f6a4beaa5c38e14733caa3 [11680/12398] drm/xe/vf: Start re-emission from first unsignaled job during VF migration
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251127 (https://download.01.org/0day-ci/archive/20251128/202511280417.SqtqiPAw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511280417.SqtqiPAw-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_guc_submit.c:2256 guc_exec_queue_unpause_prepare() warn: iterator used outside loop: 'job'

vim +/job +2256 drivers/gpu/drm/xe/xe_guc_submit.c

dd08ebf6c3525a Matthew Brost 2023-03-30  2236  
c25c1010df88f6 Matthew Brost 2025-10-08  2237  static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
c25c1010df88f6 Matthew Brost 2025-10-08  2238  					   struct xe_exec_queue *q)
c25c1010df88f6 Matthew Brost 2025-10-08  2239  {
c25c1010df88f6 Matthew Brost 2025-10-08  2240  	struct xe_gpu_scheduler *sched = &q->guc->sched;
c25c1010df88f6 Matthew Brost 2025-10-08  2241  	struct xe_sched_job *job = NULL;
00937fe1921ab3 Matthew Brost 2025-11-21  2242  	bool restore_replay = false;
c25c1010df88f6 Matthew Brost 2025-10-08  2243  
00937fe1921ab3 Matthew Brost 2025-11-21  2244  	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
00937fe1921ab3 Matthew Brost 2025-11-21  2245  		restore_replay |= job->restore_replay;
00937fe1921ab3 Matthew Brost 2025-11-21  2246  		if (restore_replay) {
1521fad9ad8762 Matthew Brost 2025-10-08  2247  			xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
1521fad9ad8762 Matthew Brost 2025-10-08  2248  				  q->guc->id, xe_sched_job_seqno(job));
1521fad9ad8762 Matthew Brost 2025-10-08  2249  
c25c1010df88f6 Matthew Brost 2025-10-08  2250  			q->ring_ops->emit_job(job);
00937fe1921ab3 Matthew Brost 2025-11-21  2251  			job->restore_replay = true;
00937fe1921ab3 Matthew Brost 2025-11-21  2252  		}
c25c1010df88f6 Matthew Brost 2025-10-08  2253  	}
c25c1010df88f6 Matthew Brost 2025-10-08  2254  
c25c1010df88f6 Matthew Brost 2025-10-08  2255  	if (job)
c25c1010df88f6 Matthew Brost 2025-10-08 @2256  		job->last_replay = true;
c25c1010df88f6 Matthew Brost 2025-10-08  2257  }
c25c1010df88f6 Matthew Brost 2025-10-08  2258  

:::::: The code at line 2256 was first introduced by commit
:::::: c25c1010df88f6eec5c36344b6ceeb938d3020a9 drm/xe/vf: Replay GuC submission state on pause / unpause

:::::: TO: Matthew Brost <matthew.brost@intel.com>
:::::: CC: Matthew Brost <matthew.brost@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
