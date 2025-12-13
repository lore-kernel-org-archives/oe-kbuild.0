Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C463B8D75
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Dec 2025 20:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765658303; cv=none; b=OaKTeaumUG4mwyYyE7SVjIwTlxagX6GiF+/uso0movC5vtRtuxyP9CRmfas8jzthmlN3GiBumOHTfiGOC0JzKAd7BsBhqBN5rvkKVwlYV/h/X1z2L0FZrbwM7LN0Grav3dHuoQfieXQy/s2X2rzpd1AT47bEfVchq4LNI27aHoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765658303; c=relaxed/simple;
	bh=LJ4KuwQ8SUQVORrb5vV0DbpoFXMCi22tVO4oezm1UZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=at/xhCq0agPlOt1hC8uQ8W5CBpzlaGQ9wTgSbKlqwORHV+BloC+GDM/wHPXJATOJTFtEqj8/6tAWmeQ/TZtTJU/Mo4SKzq80txb1wM+A0SGyoCKfMQpo63Dw1+Knh3u8kxgyMrmKsxOU6lr8TGHwJ+TtQfb5jD98opJgig1P30o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fl9uNxI1; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fl9uNxI1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765658302; x=1797194302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LJ4KuwQ8SUQVORrb5vV0DbpoFXMCi22tVO4oezm1UZ8=;
  b=Fl9uNxI1nUHheLDaq3H6TGW0ndAwPgTw9O2PpMRLqwTY+83ljz05FAHK
   tF4O14veufgQS5MetPBcyWQq4thHqlRg0ikpL45qqfDZuLAH0vMaKQ2ZB
   Bu1iKRRzKII6xXaba2MuLm3ixuKeB5sq2zEWqIOP/5wmU2KYJf3l+t5l8
   eMU7ZC+C07bfrX2xBPumzO25YxjoRxCQdwyOTMWCdVC66ewhfH5J8Fp1d
   e0L8WsjVzZWOGLa83F0dAI8UjNXhiFI0v4ixNthufmK6ejrRqBxzUXe7L
   XfacQrGaYM/eogSRrd2rw3RCGLhHFwRekCOjQFg4kSsHtASBYKLfGHBhc
   A==;
X-CSE-ConnectionGUID: QXDgUQ1+RNKuklC6cyH50g==
X-CSE-MsgGUID: qqIRqsbMShaUQRUPF5Fs8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67778429"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67778429"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 12:38:22 -0800
X-CSE-ConnectionGUID: d7D7Ir4FTqmOHXYgyYA4bQ==
X-CSE-MsgGUID: HzOHH5FLTjaqDf6ZW7rALw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="228025526"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 Dec 2025 12:38:19 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUWNd-000000008B7-3IUf;
	Sat, 13 Dec 2025 20:38:17 +0000
Date: Sun, 14 Dec 2025 04:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/scheduler/tests/tests_basic.c:136
 drm_sched_basic_test() error: uninitialized symbol 'job'.
Message-ID: <202512140421.rHKiUDik-lkp@intel.com>
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
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: 5a99350794fec11faaed8a4b36a6931e696f672f drm/sched: Add scheduler unit testing infrastructure and some basic tests
date:   9 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 months ago
config: alpha-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251214/202512140421.rHKiUDik-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140421.rHKiUDik-lkp@intel.com/

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
