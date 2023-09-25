Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19CA1BDF8
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Sep 2023 14:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695653823; x=1727189823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lzp4hNCZYjcS7qkbS49TZrGVTSJho3LPNWA/aG7bXTI=;
  b=Z9WBFMk3/P77jasCpNCYicOd5dTJWYbNnbT+PYWEv87Y1SGojGL808ay
   n6nu9RaDz9LGA5iRCJXfhZUIR6r+mXMqc9g58mpkMpaN0f4UVnxE+pZZi
   z0QGkAVDBcldHkpf/0GQn1PYoPGsTCHaW1ZUsVytNFX8mfqmxJyyuC8rr
   C5NH9nwzvZ13LuBSaCcPCKbE/pyFpjsYvMNKUG/ul3Ls1sFxQLR7dUisf
   KHvtdREUzlq0k/MK6YwtU1qVk9qWXyYDRIObF0EGWx6T2vtB5fkN2it6D
   A3zhMUZHDZlq/ub2awIf94+xTR38Wz96zj6Y906QlC0ScNhAZXrT0Gw6V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="385104901"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="385104901"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 07:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="698002025"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="698002025"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 25 Sep 2023 07:56:25 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkn0Y-0001cX-1r;
	Mon, 25 Sep 2023 14:56:22 +0000
Date: Mon, 25 Sep 2023 22:55:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Intel-gfx] [PATCH v13 1/2] drm/i915: Add WABB blit for
 Wa_16018031267 / Wa_16018063123
Message-ID: <202309252243.l3lV6IxF-lkp@intel.com>
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
In-Reply-To: <20230921183729.3763860-2-jonathan.cavitt@intel.com>
References: <20230921183729.3763860-2-jonathan.cavitt@intel.com>
TO: Jonathan Cavitt <jonathan.cavitt@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: andi.shyti@intel.com
CC: chris.p.wilson@linux.intel.com
CC: tomasz.mistat@intel.com
CC: jonathan.cavitt@intel.com
CC: rodrigo.vivi@intel.com
CC: gregory.f.germano@intel.com
CC: matthew.d.roper@intel.com
CC: nirmoy.das@intel.com

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Cavitt/drm-i915-Add-WABB-blit-for-Wa_16018031267-Wa_16018063123/20230922-024907
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230921183729.3763860-2-jonathan.cavitt%40intel.com
patch subject: [Intel-gfx] [PATCH v13 1/2] drm/i915: Add WABB blit for Wa_16018031267 / Wa_16018063123
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20230925 (https://download.01.org/0day-ci/archive/20230925/202309252243.l3lV6IxF-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230925/202309252243.l3lV6IxF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309252243.l3lV6IxF-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4181 guc_kernel_context_pin() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1704 __unwind_incomplete_requests() error: uninitialized symbol 'pl'.
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:5462 guc_create_virtual() warn: assigning (-2) to unsigned variable 've->base.instance'
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:5463 guc_create_virtual() warn: assigning (-2) to unsigned variable 've->base.uabi_instance'

vim +/ret +4181 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

209b7955e59e36 drivers/gpu/drm/i915/intel_guc_submission.c       Chris Wilson    2018-07-17  4152  
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17  4153  static inline int guc_kernel_context_pin(struct intel_guc *guc,
3a4cdf1982f05d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Matthew Brost   2021-07-21  4154  					 struct intel_context *ce)
3a4cdf1982f05d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Matthew Brost   2021-07-21  4155  {
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17  4156  	int ret;
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17  4157  
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2022-03-01  4158  	/*
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2022-03-01  4159  	 * Note: we purposefully do not check the returns below because
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2022-03-01  4160  	 * the registration can only fail if a reset is just starting.
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2022-03-01  4161  	 * This is called at the end of reset so presumably another reset
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2022-03-01  4162  	 * isn't happening and even it did this code would be run again.
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2022-03-01  4163  	 */
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2022-03-01  4164  
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17  4165  	if (context_guc_id_invalid(ce)) {
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17  4166  		ret = pin_guc_id(guc, ce);
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17  4167  
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17  4168  		if (ret < 0)
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17  4169  			return ret;
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17  4170  	}
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2022-03-01  4171  
de51de9672a17e drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2022-11-02  4172  	if (!test_bit(CONTEXT_GUC_INIT, &ce->flags))
de51de9672a17e drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2022-11-02  4173  		guc_context_init(ce);
de51de9672a17e drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2022-11-02  4174  
72d46c25c5d83e drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Jonathan Cavitt 2023-09-21  4175  	if (!intel_context_is_hidden(ce)) {
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17  4176  		ret = try_context_registration(ce, true);
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17  4177  		if (ret)
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17  4178  			unpin_guc_id(guc, ce);
72d46c25c5d83e drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Jonathan Cavitt 2023-09-21  4179  	}
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17  4180  
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison   2023-02-17 @4181  	return ret;
3a4cdf1982f05d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Matthew Brost   2021-07-21  4182  }
3a4cdf1982f05d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Matthew Brost   2021-07-21  4183  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
