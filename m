Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0C93FFD
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 09:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749894744; cv=none; b=nl+CEpoQWak25jMULEV9+x/YqcR1N9/eYY1gNr34xs9LSQyUNmB/G7q8dArdKXNpTGKqe2JmHJzvpUa7PVw4IlmI32pJ4SzsfAZ8YE7RRpbN46BHY0CxR6DW0PPMtZQ/aabewFsoK9Fy+z9cssJEJ1JJFpxxSPSm+p952coJE1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749894744; c=relaxed/simple;
	bh=a3+M2B2/jHh2EIyOri828P1TWyjj6NfVd7hy0BAyNOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hy0AVJLpMxyO1BY7iBdUI24bj/u9P0/UL1m3Wu7CxJORf6y3FYmBOSsRqCSFw01K4uIdjUBq//MkxtJfKptK2zwpVVqwQSDVqbK5rFLHE5Al0wLoc3tqg82AjYVtIijXUkbFG0gJwVRSL+qc3BZHcaK15vFl/QfsT7VSnH6/O+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g/Svo/nb; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g/Svo/nb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749894743; x=1781430743;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a3+M2B2/jHh2EIyOri828P1TWyjj6NfVd7hy0BAyNOg=;
  b=g/Svo/nbJaSLczegPoANwXMlQN5E6ODdEiCcPPGknkJDnOrxsR8e9+Ec
   BWlv6/a0pkkoVHJg9UqENIVNlubnRCR6ldaAS9e8fISRncADDR+pRIkJD
   wy9tp13vwPNHDRao8BcUtMajcIcwlPPQXZhC8HDr6nAji8M0JxkqqJwEe
   N9y0BUCTQpryGX0cdSYidmrNLHNYYrcyFqQOH7GVcn21yns/sXjlH/KWM
   wWcr1BqCsrpwFeFO82vexc10KIaKUvF9wyp5pvC7uHP3tiWP6Nf8Av3MM
   9JIT1Rq0oVRb6l9I7vgEma9khUQj3XOB/C+Fog0nypvnv43hIYuwp5QNL
   A==;
X-CSE-ConnectionGUID: DqVEMaRZQweQevOEdujd8Q==
X-CSE-MsgGUID: GtgWfZTwT2qnltbnp8D0BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="55903352"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="55903352"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 02:52:22 -0700
X-CSE-ConnectionGUID: Vba+pawLR/q/HWHrmB1tOQ==
X-CSE-MsgGUID: kAFRXc+GQPGQWaRxOpcqeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="148934216"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Jun 2025 02:52:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQNYg-000DPK-3A;
	Sat, 14 Jun 2025 09:52:18 +0000
Date: Sat, 14 Jun 2025 17:51:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [RFC PATCH 3/4] drm/i915/writeback: Add some preliminary
 writeback definitions
Message-ID: <202506141740.CCj2OXji-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250613061550.2893526-4-suraj.kandpal@intel.com>
References: <20250613061550.2893526-4-suraj.kandpal@intel.com>
TO: Suraj Kandpal <suraj.kandpal@intel.com>

Hi Suraj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suraj-Kandpal/drm-writeback-Add-function-that-takes-preallocated-connector/20250613-142752
base:   linus/master
patch link:    https://lore.kernel.org/r/20250613061550.2893526-4-suraj.kandpal%40intel.com
patch subject: [RFC PATCH 3/4] drm/i915/writeback: Add some preliminary writeback definitions
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-102-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141740.CCj2OXji-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202506141740.CCj2OXji-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_display_device.c:838:2-22: duplicated argument to & or |

vim +838 drivers/gpu/drm/i915/display/intel_display_device.c

785778ce21cf50 Jani Nikula   2024-05-22  816  
69d439818fe501 Matt Roper    2023-05-23  817  #define GEN9_LP_DISPLAY			 \
69d439818fe501 Matt Roper    2023-05-23  818  	.dbuf.slice_mask = BIT(DBUF_S1), \
69d439818fe501 Matt Roper    2023-05-23  819  	.has_dp_mst = 1, \
69d439818fe501 Matt Roper    2023-05-23  820  	.has_ddi = 1, \
69d439818fe501 Matt Roper    2023-05-23  821  	.has_fpga_dbg = 1, \
69d439818fe501 Matt Roper    2023-05-23  822  	.has_hotplug = 1, \
69d439818fe501 Matt Roper    2023-05-23  823  	.has_ipc = 1, \
69d439818fe501 Matt Roper    2023-05-23  824  	.has_psr = 1, \
69d439818fe501 Matt Roper    2023-05-23  825  	.has_psr_hw_tracking = 1, \
69d439818fe501 Matt Roper    2023-05-23  826  	HSW_PIPE_OFFSETS, \
69d439818fe501 Matt Roper    2023-05-23  827  	IVB_CURSOR_OFFSETS, \
69d439818fe501 Matt Roper    2023-05-23  828  	IVB_COLORS, \
69d439818fe501 Matt Roper    2023-05-23  829  	\
69d439818fe501 Matt Roper    2023-05-23  830  	.__runtime_defaults.has_dmc = 1, \
69d439818fe501 Matt Roper    2023-05-23  831  	.__runtime_defaults.has_hdcp = 1, \
69d439818fe501 Matt Roper    2023-05-23  832  	.__runtime_defaults.fbc_mask = BIT(INTEL_FBC_A), \
69d439818fe501 Matt Roper    2023-05-23  833  	.__runtime_defaults.pipe_mask = BIT(PIPE_A) | BIT(PIPE_B) | BIT(PIPE_C), \
69d439818fe501 Matt Roper    2023-05-23  834  	.__runtime_defaults.cpu_transcoder_mask = \
69d439818fe501 Matt Roper    2023-05-23  835  		BIT(TRANSCODER_A) | BIT(TRANSCODER_B) | \
69d439818fe501 Matt Roper    2023-05-23  836  		BIT(TRANSCODER_C) | BIT(TRANSCODER_EDP) | \
2798e4d1ccd9b3 Ville Syrjälä 2023-06-16  837  		BIT(TRANSCODER_DSI_A) | BIT(TRANSCODER_DSI_C), \
ff9a930b83a165 Suraj Kandpal 2025-06-13 @838  		BIT(TRANSCODER_WD_0) | BIT(TRANSCODER_WD_0), \
2798e4d1ccd9b3 Ville Syrjälä 2023-06-16  839  	.__runtime_defaults.port_mask = BIT(PORT_A) | BIT(PORT_B) | BIT(PORT_C)
69d439818fe501 Matt Roper    2023-05-23  840  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
