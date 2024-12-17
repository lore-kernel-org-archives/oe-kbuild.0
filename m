Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4037F1F3D3C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Dec 2024 13:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734441360; cv=none; b=NuzpGZWP9UixWJpIioraozYlaOJyrRjeD1n8yYZ3U/exy17VzfYoJMGoLoiTtJc6GHM9/BGIKy+P45bBbc97Oa1bg1foKzOtIeABw0HAPKjU8y5FN9RjnJQXLvS9Ac8HJsCKlITBgUTBdUPqFcXlWxIRQGusWCjiIXKR4MqwmW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734441360; c=relaxed/simple;
	bh=AeiX2IkSJJ40Jy7iDQide6EYK88rWGSss+ZwaPX8SGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jwaBYnFFllgVeu6goPTJ1t1eh6SFzadYTBIf/v4zaBrm5HnXQgGSoLEguAmXi3mx5vwHzmN9XzF3zrv5uQcvSphQZTkDV0yfb9u8plPOVQHzBvKzFS7vpVyZFtPJ97qvLuLVE1gg1RY/jfHRrCHnpLfscnaJS3oL9oEjGrSr89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EoZu7535; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EoZu7535"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734441358; x=1765977358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AeiX2IkSJJ40Jy7iDQide6EYK88rWGSss+ZwaPX8SGQ=;
  b=EoZu7535wps/iWllJ8Lhd9KlL5uYPz9YhU6BFqQaIq/Q8PveX5gD3xZU
   +MyksVviSfsgMOQZbvCWas/23CsR2cDCf4X+2WG6YLin4g4ItaYCcMxyL
   s0VySNn6dRmRDNPxrx/vSX2ZafivHMFCZz87QHFJjb/clsBnKOcPVmM2m
   KrtV1HTT8eOtKgbcUwikXbJgyddCJdGVirLRbjYbA8YtBVNELtG7jDwMN
   fKguJvuN6olEduKMSltWBaF3QDAzUQ1GJ3pyv0bpd6U26qctLSm8B1QL3
   HLuNfpmCsxpTLA4uLQFfyiTejROPUJGH5SlX9z07SOOLhcFjVuTXOElou
   w==;
X-CSE-ConnectionGUID: gqa0/KvsTOCymzsk6GCwHQ==
X-CSE-MsgGUID: GwR8Ja8USYCR1QTfM2SQqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="34158802"
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="34158802"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 05:15:54 -0800
X-CSE-ConnectionGUID: x2gT0FHfQaaMjnmVsdp/BA==
X-CSE-MsgGUID: gbFlbYsqRsmnKM9+en6rbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="128516969"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Dec 2024 05:15:52 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNXQU-000F0u-0H;
	Tue, 17 Dec 2024 13:15:50 +0000
Date: Tue, 17 Dec 2024 21:15:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/sched/ext.c:2043 consume_dispatch_q() warn: inconsistent
 returns '&dsq->lock'.
Message-ID: <202412172117.K3LulTmB-lkp@intel.com>
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
TO: Tejun Heo <tj@kernel.org>
CC: David Vernet <dvernet@meta.com>
CC: Josh Don <joshdon@google.com>

Hi Tejun,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f44d154d6e3d633d4c49a5d6aed8a0e4684ae25e
commit: 7b0888b7cc1924b74ce660e02f6211df8dd46e7b sched_ext: Implement core-sched support
date:   6 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r073-20241207 (https://download.01.org/0day-ci/archive/20241217/202412172117.K3LulTmB-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412172117.K3LulTmB-lkp@intel.com/

smatch warnings:
kernel/sched/ext.c:2043 consume_dispatch_q() warn: inconsistent returns '&dsq->lock'.
kernel/sched/ext.c:4545 scx_ops_enable() warn: Calling kobject_put|get with state->initialized unset from line: 4329
kernel/sched/ext.c:4545 scx_ops_enable() warn: Calling kobject_put|get with state->initialized unset from line: 4329
kernel/sched/ext.c:4545 scx_ops_enable() warn: Calling kobject_put|get with state->initialized unset from line: 4329
kernel/sched/ext.c:4545 scx_ops_enable() warn: Calling kobject_put|get with state->initialized unset from line: 4329

vim +2043 kernel/sched/ext.c

f0e1a0643a59bf Tejun Heo 2024-06-18  2016  
f0e1a0643a59bf Tejun Heo 2024-06-18  2017  static bool consume_dispatch_q(struct rq *rq, struct rq_flags *rf,
f0e1a0643a59bf Tejun Heo 2024-06-18  2018  			       struct scx_dispatch_q *dsq)
f0e1a0643a59bf Tejun Heo 2024-06-18  2019  {
f0e1a0643a59bf Tejun Heo 2024-06-18  2020  	struct task_struct *p;
f0e1a0643a59bf Tejun Heo 2024-06-18  2021  retry:
f0e1a0643a59bf Tejun Heo 2024-06-18  2022  	if (list_empty(&dsq->list))
f0e1a0643a59bf Tejun Heo 2024-06-18  2023  		return false;
f0e1a0643a59bf Tejun Heo 2024-06-18  2024  
f0e1a0643a59bf Tejun Heo 2024-06-18  2025  	raw_spin_lock(&dsq->lock);
f0e1a0643a59bf Tejun Heo 2024-06-18  2026  
f0e1a0643a59bf Tejun Heo 2024-06-18  2027  	list_for_each_entry(p, &dsq->list, scx.dsq_node) {
f0e1a0643a59bf Tejun Heo 2024-06-18  2028  		struct rq *task_rq = task_rq(p);
f0e1a0643a59bf Tejun Heo 2024-06-18  2029  
f0e1a0643a59bf Tejun Heo 2024-06-18  2030  		if (rq == task_rq) {
f0e1a0643a59bf Tejun Heo 2024-06-18  2031  			consume_local_task(rq, dsq, p);
f0e1a0643a59bf Tejun Heo 2024-06-18  2032  			return true;
f0e1a0643a59bf Tejun Heo 2024-06-18  2033  		}
f0e1a0643a59bf Tejun Heo 2024-06-18  2034  
f0e1a0643a59bf Tejun Heo 2024-06-18  2035  		if (task_can_run_on_remote_rq(p, rq)) {
f0e1a0643a59bf Tejun Heo 2024-06-18  2036  			if (likely(consume_remote_task(rq, rf, dsq, p, task_rq)))
f0e1a0643a59bf Tejun Heo 2024-06-18  2037  				return true;
f0e1a0643a59bf Tejun Heo 2024-06-18  2038  			goto retry;
f0e1a0643a59bf Tejun Heo 2024-06-18  2039  		}
f0e1a0643a59bf Tejun Heo 2024-06-18  2040  	}
f0e1a0643a59bf Tejun Heo 2024-06-18  2041  
f0e1a0643a59bf Tejun Heo 2024-06-18  2042  	raw_spin_unlock(&dsq->lock);
f0e1a0643a59bf Tejun Heo 2024-06-18 @2043  	return false;
f0e1a0643a59bf Tejun Heo 2024-06-18  2044  }
f0e1a0643a59bf Tejun Heo 2024-06-18  2045  

:::::: The code at line 2043 was first introduced by commit
:::::: f0e1a0643a59bf1f922fa209cec86a170b784f3f sched_ext: Implement BPF extensible scheduler class

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
