Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9608428EA
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728291763; cv=none; b=rHrfLNJyNH59Mxm4Jj7yzX1vwl6r5Awr4Br8yVAvGjy25KVOH22a+y+5PwKP4VywBMg8thxzdkJxKtNqdnv3GDOJ9XW0+h4UMeX+JgSP8Qr/IUfg/Dy9xgdqpya6nUHZ0Ke6xxUEu3qD0gyKpCkeYHu+gupgEpprYu7OE9GZZ2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728291763; c=relaxed/simple;
	bh=Yni69zUTmWo3loOdjwEniZsG5GNCRmxZ6HXhLKcUAoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dEXdZB9OCwEJ7jFYMmVX+DcMTeoH8x4rmkTTl+EdV2kjVs7DXlmQpIyx4FJ77/p+iiHHX/OK1ZuqKPcfVWGMe2YSQIdkzHI0CmQcwL6otszet+OiuDbRyi9KTWPZl8imNpezwTpI0/N7H8FxuKR+eMw3DrA3fuiYAtZXpfAnjqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFiXrB1b; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFiXrB1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728291761; x=1759827761;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yni69zUTmWo3loOdjwEniZsG5GNCRmxZ6HXhLKcUAoI=;
  b=KFiXrB1bB49r3kbkDSuTQLQ1Nlu7601yoY/Sj8H2G5JFwhfZgDuJ8PHj
   gMJ3S56TcRCrHyUFuB5vlIYk36sijISs5uFNSwqmAAQZBynPM7xLXJtQa
   4YCSzeNsbzOD+oUX+20k3NTqvj6bGRR439ApEY7GclIDjkq7b5nhhenLi
   7LWOputLLgE8Rp3EWQWQUS1TaDT/32jz5WpAcwk9moL80BfRwrrN12Sal
   ueyTBj5MCryRossrwGqEf70syoqAnhlsSZjnT8rkSPwNN28RfKJ24hhOp
   noe9J8MoAz49FEwMPILY4XcdfeoKNCZnbE2Hy1bFn4WfAiJARXq1HrzD8
   Q==;
X-CSE-ConnectionGUID: o7aVCGLuQm2bzDTZ1DVmwQ==
X-CSE-MsgGUID: jmsGCSyCTbGnkUjIAP7zkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="31132407"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="31132407"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 02:02:41 -0700
X-CSE-ConnectionGUID: Wul/a7DgSKarqcxuYsKHnw==
X-CSE-MsgGUID: B6q/mNCWRD6AxnP+ErVp/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="75381975"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Oct 2024 02:02:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxjdV-0004nQ-35;
	Mon, 07 Oct 2024 09:02:37 +0000
Date: Mon, 7 Oct 2024 17:01:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/i915/display/intel_ddi.c:2225:7-13: opportunity for
 str_enabled_disabled(enable)
Message-ID: <202410071601.TFpXoqgW-lkp@intel.com>
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
TO: Imre Deak <imre.deak@intel.com>
CC: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
commit: 8ab5a03643fc529f0e8663bc4d5b43f8f6885922 drm/i915/dp: Disable FEC ready flag in the sink
date:   11 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-102-20241007 (https://download.01.org/0day-ci/archive/20241007/202410071601.TFpXoqgW-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410071601.TFpXoqgW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_ddi.c:2225:7-13: opportunity for str_enabled_disabled(enable)

vim +2225 drivers/gpu/drm/i915/display/intel_ddi.c

1639406a31c23ca drivers/gpu/drm/i915/display/intel_ddi.c Manasi Navare   2021-01-22  2212  
a322b97589a6af4 drivers/gpu/drm/i915/intel_ddi.c         Anusha Srivatsa 2018-11-28  2213  static void intel_dp_sink_set_fec_ready(struct intel_dp *intel_dp,
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2214  					const struct intel_crtc_state *crtc_state,
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2215  					bool enable)
a322b97589a6af4 drivers/gpu/drm/i915/intel_ddi.c         Anusha Srivatsa 2018-11-28  2216  {
47bdb1caba0bc5a drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2020-03-20  2217  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
47bdb1caba0bc5a drivers/gpu/drm/i915/display/intel_ddi.c Jani Nikula     2020-03-20  2218  
a322b97589a6af4 drivers/gpu/drm/i915/intel_ddi.c         Anusha Srivatsa 2018-11-28  2219  	if (!crtc_state->fec_enable)
a322b97589a6af4 drivers/gpu/drm/i915/intel_ddi.c         Anusha Srivatsa 2018-11-28  2220  		return;
a322b97589a6af4 drivers/gpu/drm/i915/intel_ddi.c         Anusha Srivatsa 2018-11-28  2221  
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2222  	if (drm_dp_dpcd_writeb(&intel_dp->aux, DP_FEC_CONFIGURATION,
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2223  			       enable ? DP_FEC_READY : 0) <= 0)
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2224  		drm_dbg_kms(&i915->drm, "Failed to set FEC_READY to %s in the sink\n",
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24 @2225  			    enable ? "enabled" : "disabled");
6e916b35afa8a37 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2226  
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2227  	if (enable &&
8ab5a03643fc529 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2228  	    drm_dp_dpcd_writeb(&intel_dp->aux, DP_FEC_STATUS,
6e916b35afa8a37 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2229  			       DP_FEC_DECODE_EN_DETECTED | DP_FEC_DECODE_DIS_DETECTED) <= 0)
6e916b35afa8a37 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2230  		drm_dbg_kms(&i915->drm, "Failed to clear FEC detected flags\n");
6e916b35afa8a37 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2231  }
6e916b35afa8a37 drivers/gpu/drm/i915/display/intel_ddi.c Imre Deak       2023-10-24  2232  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
