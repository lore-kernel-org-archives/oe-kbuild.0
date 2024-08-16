Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBFA21C5791
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Aug 2024 21:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723845141; cv=none; b=Phf2VGrHlQojKC7CcZrxQDH9LzhZN3lAfsJGmVzAuC4c7a3NVZYdfHb653bzmtl5l9vUJq6fzJeZ8FMQ+mCOXSiCFz8rVrbzMM/j9wgO/ovoyzit+Ofdz+EFKWGESFBRJS44vjw+wZKeYAyIWEWwH0U9T2kTgaLP7I2cs4xBFdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723845141; c=relaxed/simple;
	bh=kD5IGK+Rc2kjwMuSnM9rLILjOLbN7SHvCYD1tvo9xdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NEGL3tZweMJl5SVEqm/vJqejZyLfgqzSoNhaHihLo9WwoU1C4qQFQvDleRciVC6Es1kzVtLP+2UVf/jlbFctnXcUsKjDo0Rdhx2HI09sDy2fQQluNcn2kyv2pCWeeqn6QEFioVytHLVZYUcdBePA0JiR/B6yPvEvq4qRy76uUOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUShO98b; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUShO98b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723845140; x=1755381140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kD5IGK+Rc2kjwMuSnM9rLILjOLbN7SHvCYD1tvo9xdk=;
  b=lUShO98by6Sm5DyapPnBrlzA2FfUzY85kKFXjGwar4uR3xaRl53POcBF
   xWJK/rYuXznt+47fjlwAFI0VVSwgMFFWAb66xwCtGmXiCypQR8+IGfUO6
   Ag5rL66mwGBQj1OP1In3edlnp1zXNPjsYSXKj672RsVzEB1ZO7qlJBbrt
   2Dy11EAk0KNrOPLN0HHWLoPlXeXkM5il2TFwQYB9IYWnAzy8hTNCEO8Xv
   prN3jV0wQ5G4tzVLyEkKVrm/5MlgJyKll69B6zgBZbLDoRVOAUJGeXjm4
   MihabW74xUe2e1hJFJL5yQo/6NuiSwUN7+FhxLUmuh486ozwpIO0Gr4HP
   w==;
X-CSE-ConnectionGUID: DBHTnEb5SbaTSnH/wBJuIQ==
X-CSE-MsgGUID: jIv2aoxiRqqmHaEGjMVvuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22313141"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="22313141"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 14:52:17 -0700
X-CSE-ConnectionGUID: H5C3BjUNQ9WSVHYNXxFkww==
X-CSE-MsgGUID: GigQ4OflR3uDozfqFt7n3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="60568426"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Aug 2024 14:52:16 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf4rl-0006xE-39;
	Fri, 16 Aug 2024 21:52:13 +0000
Date: Sat, 17 Aug 2024 05:52:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v10] drm/i915: WA context support for L3flush
Message-ID: <202408170547.2jcHHUAr-lkp@intel.com>
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
In-Reply-To: <20240813061657.925443-1-nitin.r.gote@intel.com>
References: <20240813061657.925443-1-nitin.r.gote@intel.com>
TO: Nitin Gote <nitin.r.gote@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: venkata.ramana.nayana@intel.com
CC: john.c.harrison@intel.com
CC: chris.p.wilson@intel.com
CC: tejas.upadhyay@intel.com
CC: andi.shyti@intel.com
CC: nitin.r.gote@intel.com

Hi Nitin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.11-rc3 next-20240816]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Nitin-Gote/drm-i915-WA-context-support-for-L3flush/20240814-231915
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240813061657.925443-1-nitin.r.gote%40intel.com
patch subject: [PATCH v10] drm/i915: WA context support for L3flush
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240816 (https://download.01.org/0day-ci/archive/20240817/202408170547.2jcHHUAr-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408170547.2jcHHUAr-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:4415 guc_kernel_context_pin() error: uninitialized symbol 'ret'.

Old smatch warnings:
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1796 __unwind_incomplete_requests() error: uninitialized symbol 'pl'.
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:1868 wake_up_all_tlb_invalidate() warn: iterator 'i' not incremented
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:5851 guc_create_virtual() warn: assigning (-2) to unsigned variable 've->base.instance'
drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c:5852 guc_create_virtual() warn: assigning (-2) to unsigned variable 've->base.uabi_instance'

vim +/ret +4415 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c

209b7955e59e36 drivers/gpu/drm/i915/intel_guc_submission.c       Chris Wilson          2018-07-17  4386  
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4387  static inline int guc_kernel_context_pin(struct intel_guc *guc,
3a4cdf1982f05d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Matthew Brost         2021-07-21  4388  					 struct intel_context *ce)
3a4cdf1982f05d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Matthew Brost         2021-07-21  4389  {
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4390  	int ret;
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4391  
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4392  	/*
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4393  	 * Note: we purposefully do not check the returns below because
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4394  	 * the registration can only fail if a reset is just starting.
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4395  	 * This is called at the end of reset so presumably another reset
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4396  	 * isn't happening and even it did this code would be run again.
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4397  	 */
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4398  
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4399  	if (context_guc_id_invalid(ce)) {
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4400  		ret = pin_guc_id(guc, ce);
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4401  
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4402  		if (ret < 0)
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4403  			return ret;
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4404  	}
58ea7d620c5ebc drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-03-01  4405  
de51de9672a17e drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-11-02  4406  	if (!test_bit(CONTEXT_GUC_INIT, &ce->flags))
de51de9672a17e drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-11-02  4407  		guc_context_init(ce);
de51de9672a17e drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2022-11-02  4408  
078a89e7d6f60a drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Venkata Ramana Nayana 2024-08-13  4409  	if (!intel_context_is_hidden(ce)) {
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4410  		ret = try_context_registration(ce, true);
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4411  		if (ret)
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4412  			unpin_guc_id(guc, ce);
078a89e7d6f60a drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Venkata Ramana Nayana 2024-08-13  4413  	}
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17  4414  
cd414f4f59f64d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c John Harrison         2023-02-17 @4415  	return ret;
3a4cdf1982f05d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Matthew Brost         2021-07-21  4416  }
3a4cdf1982f05d drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c Matthew Brost         2021-07-21  4417  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
