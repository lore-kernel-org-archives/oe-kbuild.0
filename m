Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040CD264A97
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Aug 2026 03:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786332795; cv=none; b=nyoNIgQL60/OEHm3YnvoPzuCwot9TT5nG9RbYCDFPt6yM0LBXrVsTa9hwiSksIplRIia18dLfX9OU+pyboAIDWZY+pGW7m31rwTS7Foaa3gRf25XNveSdRYygD3uAkrmrlmvMrNXv7lF6NzfXwH0Ee2FFtPi4sRT5vihqjqNDzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786332795; c=relaxed/simple;
	bh=KO3wU3K9kTUTM3kpw688g1Lit7Mid7R5HkIhqx8BVZo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VzYqWcy9As3lyKimeBS83kSfDS4u8CUWC3aoXWUtyNhImBrW5/yyAUkfZt4vp/b8LuKG22m3YkbF49qYics5JkMZmHwyUJzUcAxCLCVr/9nWmDnyj2vgvtZ8YzGcLLGdMgpTL0CYiIOSRwkr1nmFzSjI/kMPhHvDGZqALaUMXz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3vRoi02; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3vRoi02"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786332792; x=1817868792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KO3wU3K9kTUTM3kpw688g1Lit7Mid7R5HkIhqx8BVZo=;
  b=b3vRoi02IotzMBYE4voTD0kfGp1ZJ+0uFLOYDYWalj8zH7q5Mrrhj7dY
   aIT/mkriI5umr+c6/ZhGvEX56hgDrsN7zDCoBz5qQvNZpxh0UHiQ4a3hC
   vSpaXtzUjh6aWvK134U6Q9vTli1dNcO1eEyO+K/BXh2yLlQ2XG3pMlaCL
   AtfZD2QmhRje8DjUoQ6gesbP8mMEnw8k5IO9fBif6PjInkg5QEVVKNVnU
   xyBguoHKLQJv9qrTJ5EN5YBpAsiYIwWJoMNJelWLqEN8aoGuu1a/beid3
   D9iyrBqrpb/8llwB8YKMNihGj9f2xIdgC/07W/C8pmW9Hb2AIDR1gox3e
   g==;
X-CSE-ConnectionGUID: ROZXQSFgRwOIh25BxpkSYg==
X-CSE-MsgGUID: 6306FTVLRHiDBukXw0CaCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97493436"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="97493436"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 20:33:11 -0700
X-CSE-ConnectionGUID: ZW9M4WcoRkaqAbK6LBZXpQ==
X-CSE-MsgGUID: 0gtDBZOjRuyNMJ0xzJASuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="260316881"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Aug 2026 20:33:09 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtGl9-00000000Mhe-2q4z;
	Mon, 10 Aug 2026 03:33:07 +0000
Date: Mon, 10 Aug 2026 11:32:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [RFC PATCH] drm/sched/tests: Let the DRM scheduler manage job
 lifetimes
Message-ID: <202608101032.caQmA50M-lkp@intel.com>
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
In-Reply-To: <20260707114807.154572-1-marco.pagani@linux.dev>
References: <20260707114807.154572-1-marco.pagani@linux.dev>
TO: Marco Pagani <marco.pagani@linux.dev>

Hi Marco,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on linus/master v7.2-rc6 next-20260807]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marco-Pagani/drm-sched-tests-Let-the-DRM-scheduler-manage-job-lifetimes/20260807-105436
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260707114807.154572-1-marco.pagani%40linux.dev
patch subject: [RFC PATCH] drm/sched/tests: Let the DRM scheduler manage job lifetimes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: mips-randconfig-r062-20260810 (https://download.01.org/0day-ci/archive/20260810/202608101032.caQmA50M-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608101032.caQmA50M-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/scheduler/tests/mock_scheduler.c:139:18-21: ERROR: reference preceded by free on line 135

vim +139 drivers/gpu/drm/scheduler/tests/mock_scheduler.c

2e842124be0d553 Marco Pagani               2026-07-07  106  
5a99350794fec11 Tvrtko Ursulin             2025-03-24  107  /**
5a99350794fec11 Tvrtko Ursulin             2025-03-24  108   * drm_mock_sched_job_new - Create a new mock scheduler job
5a99350794fec11 Tvrtko Ursulin             2025-03-24  109   *
5a99350794fec11 Tvrtko Ursulin             2025-03-24  110   * @test: KUnit test owning the job
5a99350794fec11 Tvrtko Ursulin             2025-03-24  111   * @entity: Scheduler entity of the job
5a99350794fec11 Tvrtko Ursulin             2025-03-24  112   *
5a99350794fec11 Tvrtko Ursulin             2025-03-24  113   * Returns: New mock scheduler job with allocation managed by the test
5a99350794fec11 Tvrtko Ursulin             2025-03-24  114   */
5a99350794fec11 Tvrtko Ursulin             2025-03-24  115  struct drm_mock_sched_job *
5a99350794fec11 Tvrtko Ursulin             2025-03-24  116  drm_mock_sched_job_new(struct kunit *test,
5a99350794fec11 Tvrtko Ursulin             2025-03-24  117  		       struct drm_mock_sched_entity *entity)
5a99350794fec11 Tvrtko Ursulin             2025-03-24  118  {
5a99350794fec11 Tvrtko Ursulin             2025-03-24  119  	struct drm_mock_sched_job *job;
5a99350794fec11 Tvrtko Ursulin             2025-03-24  120  	int ret;
5a99350794fec11 Tvrtko Ursulin             2025-03-24  121  
2e842124be0d553 Marco Pagani               2026-07-07  122  	/* Let the DRM Scheduler manage the lifetime of the job */
2e842124be0d553 Marco Pagani               2026-07-07  123  	job = kzalloc_obj(*job, GFP_KERNEL);
5a99350794fec11 Tvrtko Ursulin             2025-03-24  124  	KUNIT_ASSERT_NOT_NULL(test, job);
5a99350794fec11 Tvrtko Ursulin             2025-03-24  125  
2e842124be0d553 Marco Pagani               2026-07-07  126  	kref_init(&job->refcount);
2e842124be0d553 Marco Pagani               2026-07-07  127  	job->test = test;
2e842124be0d553 Marco Pagani               2026-07-07  128  
5a99350794fec11 Tvrtko Ursulin             2025-03-24  129  	ret = drm_sched_job_init(&job->base,
5a99350794fec11 Tvrtko Ursulin             2025-03-24  130  				 &entity->base,
5a99350794fec11 Tvrtko Ursulin             2025-03-24  131  				 1,
2956554823cedb3 Pierre-Eric Pelloux-Prayer 2025-05-26  132  				 NULL,
2956554823cedb3 Pierre-Eric Pelloux-Prayer 2025-05-26  133  				 1);
2e842124be0d553 Marco Pagani               2026-07-07  134  	if (ret) {
2e842124be0d553 Marco Pagani               2026-07-07 @135  		kfree(job);
2e842124be0d553 Marco Pagani               2026-07-07  136  		KUNIT_ASSERT_EQ_MSG(test, ret, 0, "drm_sched_job_init failed");
2e842124be0d553 Marco Pagani               2026-07-07  137  	}
5a99350794fec11 Tvrtko Ursulin             2025-03-24  138  
5a99350794fec11 Tvrtko Ursulin             2025-03-24 @139  	init_completion(&job->done);
5a99350794fec11 Tvrtko Ursulin             2025-03-24  140  	INIT_LIST_HEAD(&job->link);
1afba39f9305fe4 Thomas Zimmermann          2025-04-07  141  	hrtimer_setup(&job->timer, drm_mock_sched_job_signal_timer,
1afba39f9305fe4 Thomas Zimmermann          2025-04-07  142  		      CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
5a99350794fec11 Tvrtko Ursulin             2025-03-24  143  
2e842124be0d553 Marco Pagani               2026-07-07  144  	ret = kunit_add_action(test, drm_mock_sched_job_cleanup_action, job);
2e842124be0d553 Marco Pagani               2026-07-07  145  	if (ret) {
2e842124be0d553 Marco Pagani               2026-07-07  146  		drm_mock_sched_job_put(job);
2e842124be0d553 Marco Pagani               2026-07-07  147  		KUNIT_ASSERT_EQ_MSG(test, ret, 0, "kunit_add_action failed");
2e842124be0d553 Marco Pagani               2026-07-07  148  	}
2e842124be0d553 Marco Pagani               2026-07-07  149  
5a99350794fec11 Tvrtko Ursulin             2025-03-24  150  	return job;
5a99350794fec11 Tvrtko Ursulin             2025-03-24  151  }
5a99350794fec11 Tvrtko Ursulin             2025-03-24  152  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
