Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBB779C1
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Feb 2023 17:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677001954; x=1708537954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yiZKUJKhUFZlE3mtwbfbbrrV0r2VQmSpRJ5voR7NOPk=;
  b=XXyaCA4s4nBl1LriZHQEjn9pz7ZAgYY3ComOc3KK/PJVqZXMWbGr5WJa
   mhYTH768uEHrrXsFnZ833Gt9YtYterE8tv43y1sjo0j5HPHw/Ow9q1D1+
   cIMPon55BIgbrR9BLVjtkOfXQeAd91cI3hA9IviLJupNhVuGioFmNITIS
   4WwMQy7ddetES6OX0yKqkDour5epdsKisc6kZQmxGRh/uUXJh8Q43CRBQ
   SCPFrSA05e1xE9y/L7ToPFmgqwAGoWSwefMmtFaQSa2VeXB96zgvBxfrU
   mm0LGlvJxBxmzT5teq/NXY54bSrZ/YSv+rBjJk6EC4l/+DjNL6UFz7C2X
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="316428378"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="316428378"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 09:52:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10628"; a="760636119"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="760636119"
Received: from lkp-server01.sh.intel.com (HELO eac18b5d7d93) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Feb 2023 09:52:32 -0800
Received: from kbuild by eac18b5d7d93 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUWoZ-00006P-1K;
	Tue, 21 Feb 2023 17:52:31 +0000
Date: Wed, 22 Feb 2023 01:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8112/13664]
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4393
 guc_init_global_schedule_policy() error: uninitialized symbol 'ret'.
Message-ID: <202302220135.ye19kgIY-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
CC: John Harrison <John.C.Harrison@Intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   465461cf48465b8a0a54025db5ae2b3df7a04577
commit: f0c4fc416e5ea21cfb8f4b3f8d0955bd5a69b154 [8112/13664] drm/i915/guc: Update GuC messages in intel_guc_submission.c
:::::: branch date: 12 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230222/202302220135.ye19kgIY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302220135.ye19kgIY-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4393 guc_init_global_schedule_policy() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1264 gpm_timestamp_shift() error: uninitialized symbol 'reg'.
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1667 __unwind_incomplete_requests() error: uninitialized symbol 'pl'.
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:5342 guc_create_virtual() warn: assigning (-2) to unsigned variable 've->base.instance'
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:5343 guc_create_virtual() warn: assigning (-2) to unsigned variable 've->base.uabi_instance'

vim +/ret +4393 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

1e88da4f6d8938 John Harrison    2022-09-22  4367  
1e88da4f6d8938 John Harrison    2022-09-22  4368  static int guc_init_global_schedule_policy(struct intel_guc *guc)
1e88da4f6d8938 John Harrison    2022-09-22  4369  {
1e88da4f6d8938 John Harrison    2022-09-22  4370  	struct scheduling_policy policy;
1e88da4f6d8938 John Harrison    2022-09-22  4371  	struct intel_gt *gt = guc_to_gt(guc);
1e88da4f6d8938 John Harrison    2022-09-22  4372  	intel_wakeref_t wakeref;
f0c4fc416e5ea2 Michal Wajdeczko 2023-01-28  4373  	int ret;
1e88da4f6d8938 John Harrison    2022-09-22  4374  
9bbba0667f3779 John Harrison    2022-11-29  4375  	if (GUC_SUBMIT_VER(guc) < MAKE_GUC_VER(1, 1, 0))
1e88da4f6d8938 John Harrison    2022-09-22  4376  		return 0;
1e88da4f6d8938 John Harrison    2022-09-22  4377  
1e88da4f6d8938 John Harrison    2022-09-22  4378  	__guc_scheduling_policy_start_klv(&policy);
1e88da4f6d8938 John Harrison    2022-09-22  4379  
1e88da4f6d8938 John Harrison    2022-09-22  4380  	with_intel_runtime_pm(&gt->i915->runtime_pm, wakeref) {
1e88da4f6d8938 John Harrison    2022-09-22  4381  		u32 yield[] = {
1e88da4f6d8938 John Harrison    2022-09-22  4382  			GLOBAL_SCHEDULE_POLICY_RC_YIELD_DURATION,
1e88da4f6d8938 John Harrison    2022-09-22  4383  			GLOBAL_SCHEDULE_POLICY_RC_YIELD_RATIO,
1e88da4f6d8938 John Harrison    2022-09-22  4384  		};
1e88da4f6d8938 John Harrison    2022-09-22  4385  
1e88da4f6d8938 John Harrison    2022-09-22  4386  		__guc_scheduling_policy_add_klv(&policy,
1e88da4f6d8938 John Harrison    2022-09-22  4387  						GUC_SCHEDULING_POLICIES_KLV_ID_RENDER_COMPUTE_YIELD,
1e88da4f6d8938 John Harrison    2022-09-22  4388  						yield, ARRAY_SIZE(yield));
1e88da4f6d8938 John Harrison    2022-09-22  4389  
1e88da4f6d8938 John Harrison    2022-09-22  4390  		ret = __guc_action_set_scheduling_policies(guc, &policy);
1e88da4f6d8938 John Harrison    2022-09-22  4391  	}
1e88da4f6d8938 John Harrison    2022-09-22  4392  
1e88da4f6d8938 John Harrison    2022-09-22 @4393  	return ret;
1e88da4f6d8938 John Harrison    2022-09-22  4394  }
1e88da4f6d8938 John Harrison    2022-09-22  4395  

:::::: The code at line 4393 was first introduced by commit
:::::: 1e88da4f6d8938bef42b3bc6e9c68c795b46ce0f drm/i915/guc: Enable compute scheduling on DG2

:::::: TO: John Harrison <John.C.Harrison@Intel.com>
:::::: CC: John Harrison <John.C.Harrison@Intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
