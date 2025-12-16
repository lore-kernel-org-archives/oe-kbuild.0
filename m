Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E62C330B31
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 05:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765863984; cv=none; b=aLue6axD7LqU6QJ0UG1LB9wT6YyBRVwpcu1poAjmkadItiiJ726nz+DEL78MV11N2C1V8vn0PFIaOjQVEJc9ncxmo/9UnvNOF5dk7KfOr6yeAyYorhZGZWBo/nmnPtkg33e+p2Wmebq94/4GKzSHulqG0ibqe51s1nbaRzy5r+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765863984; c=relaxed/simple;
	bh=LEef4NnWrS6Jr5vvIAevF6Rl5WiwDLkaX9QmAKi2ZIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PfhXRSod529ViPeA60T7n5L1544iP/uX7+81tRRBPCLAn6aUbpXQk8Je+rHOIhV+INl1UU+HyXJO90zqKWltd+API8EFncJMlgH0dWC5pdQFxbd5oOQHHtQ8MXCrD7oVii8vaIob5i5+7hoIDqGF3+pmv/miePWIXEdNPUSwPo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cur7hJVu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cur7hJVu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765863977; x=1797399977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LEef4NnWrS6Jr5vvIAevF6Rl5WiwDLkaX9QmAKi2ZIA=;
  b=Cur7hJVub+Dr2o6i0zZ/SXlCRzLN9UzHz2sXANndUyjOeff3rFhllmfL
   9+ZcWDZTwGxZR25GbNV8pXuNUivi8glmarhqeXOw1gLdyvECIEQwBfnQW
   Nxh1MCJ366ZEGXRRHVaQbARKtn3r+Nk3t922O2l2RP1Myu3J/eKjrdtWs
   TST/XirPcOeYrV25/J5l3WBJBWhxWTf0rEGS7VVUFZdC7mm8UEYt/9wu3
   cNNhB3wgzHtZ82AC1Kw3GHt0sOsd3Y6SyQie4fR4QTucA9YnFzVJ5kWGs
   8q3mUgwxSCMZ2+9IePypvDCZso9yIiUccVX/tyEz0Grp0NzBC3HuNgYWY
   w==;
X-CSE-ConnectionGUID: 4opgJ2RkSea6U6/j2YmBTw==
X-CSE-MsgGUID: fMLvsoh4Q/6R4rXnRVHsiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85187789"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="85187789"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 21:46:04 -0800
X-CSE-ConnectionGUID: JwYducLsT+eOB42INgaUsQ==
X-CSE-MsgGUID: HDSWwfmaQXGvJ6jQvlwNhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="235326983"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 15 Dec 2025 21:46:02 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVNsl-000000001Cv-2mnt;
	Tue, 16 Dec 2025 05:45:59 +0000
Date: Tue, 16 Dec 2025 13:45:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/scheduler/tests/tests_basic.c:136
 drm_sched_basic_test() error: uninitialized symbol 'job'.
Message-ID: <202512161353.I4dMzHZU-lkp@intel.com>
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
TO: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Philipp Stanner <phasta@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 5a99350794fec11faaed8a4b36a6931e696f672f drm/sched: Add scheduler unit testing infrastructure and some basic tests
date:   9 months ago
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: alpha-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251216/202512161353.I4dMzHZU-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512161353.I4dMzHZU-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/scheduler/tests/tests_basic.c:136 drm_sched_basic_test() error: uninitialized symbol 'job'.

Old smatch warnings:
drivers/gpu/drm/scheduler/tests/tests_basic.c:176 drm_sched_basic_entity_cleanup() error: uninitialized symbol 'mid'.

vim +/job +136 drivers/gpu/drm/scheduler/tests/tests_basic.c

5a99350794fec1 Tvrtko Ursulin 2025-03-24  106  
5a99350794fec1 Tvrtko Ursulin 2025-03-24  107  static void drm_sched_basic_test(struct kunit *test)
5a99350794fec1 Tvrtko Ursulin 2025-03-24  108  {
5a99350794fec1 Tvrtko Ursulin 2025-03-24  109  	const struct drm_sched_basic_params *params = test->param_value;
5a99350794fec1 Tvrtko Ursulin 2025-03-24  110  	struct drm_mock_scheduler *sched = test->priv;
5a99350794fec1 Tvrtko Ursulin 2025-03-24  111  	struct drm_mock_sched_job *job, *prev = NULL;
5a99350794fec1 Tvrtko Ursulin 2025-03-24  112  	struct drm_mock_sched_entity **entity;
5a99350794fec1 Tvrtko Ursulin 2025-03-24  113  	unsigned int i, cur_ent = 0;
5a99350794fec1 Tvrtko Ursulin 2025-03-24  114  	bool done;
5a99350794fec1 Tvrtko Ursulin 2025-03-24  115  
5a99350794fec1 Tvrtko Ursulin 2025-03-24  116  	entity = kunit_kcalloc(test, params->num_entities, sizeof(*entity),
5a99350794fec1 Tvrtko Ursulin 2025-03-24  117  			       GFP_KERNEL);
5a99350794fec1 Tvrtko Ursulin 2025-03-24  118  	KUNIT_ASSERT_NOT_NULL(test, entity);
5a99350794fec1 Tvrtko Ursulin 2025-03-24  119  
5a99350794fec1 Tvrtko Ursulin 2025-03-24  120  	for (i = 0; i < params->num_entities; i++)
5a99350794fec1 Tvrtko Ursulin 2025-03-24  121  		entity[i] = drm_mock_sched_entity_new(test,
5a99350794fec1 Tvrtko Ursulin 2025-03-24  122  						      DRM_SCHED_PRIORITY_NORMAL,
5a99350794fec1 Tvrtko Ursulin 2025-03-24  123  						      sched);
5a99350794fec1 Tvrtko Ursulin 2025-03-24  124  
5a99350794fec1 Tvrtko Ursulin 2025-03-24  125  	for (i = 0; i < params->queue_depth; i++) {
5a99350794fec1 Tvrtko Ursulin 2025-03-24  126  		job = drm_mock_sched_job_new(test, entity[cur_ent++]);
5a99350794fec1 Tvrtko Ursulin 2025-03-24  127  		cur_ent %= params->num_entities;
5a99350794fec1 Tvrtko Ursulin 2025-03-24  128  		drm_mock_sched_job_set_duration_us(job, params->job_us);
5a99350794fec1 Tvrtko Ursulin 2025-03-24  129  		if (params->dep_chain && prev)
5a99350794fec1 Tvrtko Ursulin 2025-03-24  130  			drm_sched_job_add_dependency(&job->base,
5a99350794fec1 Tvrtko Ursulin 2025-03-24  131  						     dma_fence_get(&prev->base.s_fence->finished));
5a99350794fec1 Tvrtko Ursulin 2025-03-24  132  		drm_mock_sched_job_submit(job);
5a99350794fec1 Tvrtko Ursulin 2025-03-24  133  		prev = job;
5a99350794fec1 Tvrtko Ursulin 2025-03-24  134  	}
5a99350794fec1 Tvrtko Ursulin 2025-03-24  135  
5a99350794fec1 Tvrtko Ursulin 2025-03-24 @136  	done = drm_mock_sched_job_wait_finished(job, HZ);
5a99350794fec1 Tvrtko Ursulin 2025-03-24  137  	KUNIT_ASSERT_TRUE(test, done);
5a99350794fec1 Tvrtko Ursulin 2025-03-24  138  
5a99350794fec1 Tvrtko Ursulin 2025-03-24  139  	for (i = 0; i < params->num_entities; i++)
5a99350794fec1 Tvrtko Ursulin 2025-03-24  140  		drm_mock_sched_entity_free(entity[i]);
5a99350794fec1 Tvrtko Ursulin 2025-03-24  141  }
5a99350794fec1 Tvrtko Ursulin 2025-03-24  142  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
