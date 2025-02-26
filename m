Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1E423C9
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Feb 2025 04:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740545448; cv=none; b=KF5zIMRnaN0sMk1gJ68vGtkJTMP1f/85M0L3fH0B7JW1Opkztz5I4hGS0TyWl5St81SdPohfTsNqWBqsMX9YjNzo8KtWg9sJ6fbgaeGqzoyIFM0WVeEHXCEX6kAIJIsNkz3srmFm3Kb9Ryz2gehKeuXWvOtqH2HHXKiTCNlLeG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740545448; c=relaxed/simple;
	bh=LrlnM2OkopkiqGBrCf/LepDXtH67jEx8lQKaGmIMR4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t5M+uWBfMc45pggrv5SbvU7wx0lfrv7t4RA0KULezrTnlU0ewLcVu7VtHEFTy3jgg/hu8z3NbNV5KjENb4A1ZJJVRoA1ixlTMJdfi6wOadUIXgKKVN6oaiNVySN8//PnIwwE5hHxunZjUlyOFnVM2eRE0qn/WrEQ9fR3jpFSHaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEePkJSS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEePkJSS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740545446; x=1772081446;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrlnM2OkopkiqGBrCf/LepDXtH67jEx8lQKaGmIMR4M=;
  b=ZEePkJSS1ZWdP1lwXNwTqjz2akiSx6Eah+Fmzo8aeciJ09rxL5nszSty
   T3hLbvJxh1EEDg4dWQaL5D5T2kVq5fWNPrQpPOPsJhINZXmiY25/vMyOi
   PZrpgyxPKHZL2io30AgZCr9L+5OjrRKl2XISF5B+rIrA5pdlfHBs/dIxv
   4ursXbt/xfbcw5sLFJzlhs3+QXtWb4MizGYGqbtYHBu2eGwUBAHPLBiyX
   SssIZGgAonm4YobLAyuXyqMxJgfIRbL9Tcq9VBwscZkpnqamBqjV+nw6R
   0p1n3dnRMXoTe0UAlqgIuLQRl3sLPf5kcFFgTjQ9OK3vKbScYnPxS2n9A
   w==;
X-CSE-ConnectionGUID: Qx5QiCQRTgiIL5kywwMWnQ==
X-CSE-MsgGUID: +8aSK0rfTTaHRdSF/bBukg==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="52015298"
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="52015298"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2025 20:50:45 -0800
X-CSE-ConnectionGUID: FVI8rtARSceJqvL4Jvbptg==
X-CSE-MsgGUID: ATl6O9R+SR6YwPf4GhV+mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,316,1732608000"; 
   d="scan'208";a="117213077"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Feb 2025 20:50:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tn9NZ-000BA5-2i;
	Wed, 26 Feb 2025 04:50:41 +0000
Date: Wed, 26 Feb 2025 12:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 7/8] drm/i915/lobf: Add mutex for alpm update
Message-ID: <202502261244.aUuaLdTn-lkp@intel.com>
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
In-Reply-To: <20250224080847.326350-8-animesh.manna@intel.com>
References: <20250224080847.326350-8-animesh.manna@intel.com>
TO: Animesh Manna <animesh.manna@intel.com>
TO: intel-gfx@lists.freedesktop.org
TO: intel-xe@lists.freedesktop.org
CC: jouni.hogander@intel.com
CC: jani.nikula@intel.com
CC: jeevan.b@intel.com
CC: Animesh Manna <animesh.manna@intel.com>

Hi Animesh,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.14-rc4]
[also build test WARNING on linus/master next-20250225]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Animesh-Manna/drm-i915-lobf-Add-lobf-enablement-in-post-plane-update/20250224-221647
base:   v6.14-rc4
patch link:    https://lore.kernel.org/r/20250224080847.326350-8-animesh.manna%40intel.com
patch subject: [PATCH v4 7/8] drm/i915/lobf: Add mutex for alpm update
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250225 (https://download.01.org/0day-ci/archive/20250226/202502261244.aUuaLdTn-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502261244.aUuaLdTn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_alpm.c:548 intel_alpm_disable() warn: inconsistent returns '&intel_dp->alpm_parameters.lock'.

vim +548 drivers/gpu/drm/i915/display/intel_alpm.c

026d6557dc2749d Animesh Manna 2025-02-24  526  
026d6557dc2749d Animesh Manna 2025-02-24  527  void intel_alpm_disable(struct intel_dp *intel_dp)
026d6557dc2749d Animesh Manna 2025-02-24  528  {
026d6557dc2749d Animesh Manna 2025-02-24  529  	struct intel_display *display = to_intel_display(intel_dp);
026d6557dc2749d Animesh Manna 2025-02-24  530  	enum transcoder cpu_transcoder = intel_dp->alpm_parameters.transcoder;
026d6557dc2749d Animesh Manna 2025-02-24  531  
026d6557dc2749d Animesh Manna 2025-02-24  532  	if (DISPLAY_VER(display) < 20)
026d6557dc2749d Animesh Manna 2025-02-24  533  		return;
026d6557dc2749d Animesh Manna 2025-02-24  534  
737b2873a48f3ab Animesh Manna 2025-02-24  535  	mutex_lock(&intel_dp->alpm_parameters.lock);
737b2873a48f3ab Animesh Manna 2025-02-24  536  
026d6557dc2749d Animesh Manna 2025-02-24  537  	if (!(intel_de_read(display, ALPM_CTL(display, cpu_transcoder)) & ALPM_CTL_ALPM_ENABLE))
026d6557dc2749d Animesh Manna 2025-02-24  538  		return;
026d6557dc2749d Animesh Manna 2025-02-24  539  
026d6557dc2749d Animesh Manna 2025-02-24  540  	intel_de_rmw(display, ALPM_CTL(display, cpu_transcoder),
026d6557dc2749d Animesh Manna 2025-02-24  541  		     ALPM_CTL_ALPM_ENABLE | ALPM_CTL_LOBF_ENABLE |
026d6557dc2749d Animesh Manna 2025-02-24  542  		     ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
026d6557dc2749d Animesh Manna 2025-02-24  543  
026d6557dc2749d Animesh Manna 2025-02-24  544  	intel_de_rmw(display,
026d6557dc2749d Animesh Manna 2025-02-24  545  		     PORT_ALPM_CTL(cpu_transcoder),
026d6557dc2749d Animesh Manna 2025-02-24  546  		     PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
737b2873a48f3ab Animesh Manna 2025-02-24  547  
737b2873a48f3ab Animesh Manna 2025-02-24 @548  	mutex_unlock(&intel_dp->alpm_parameters.lock);
026d6557dc2749d Animesh Manna 2025-02-24  549  }
28ed9ac2641c5df Animesh Manna 2025-02-24  550  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
