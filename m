Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A204DA0B
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Feb 2024 23:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708817750; cv=none; b=LXS+JijJrBIbLF2JcgQZMu1scJV6bFnkQg9zqxQFdghbVV2uu9bz+tgDWTA30UXyNz0apGcjdGjPcnkyqp/VrcFQm5uxNZnc6jYmNcf2ykaL69FZ44jPwcXuFsWlev2O63ubWrg84BpjRHIq7jofkblar8MriXHBlM1rMP6vL4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708817750; c=relaxed/simple;
	bh=5lkeYUOTjT/PTmjGpnMfzJhXccJOik+e4fU/YAaT69U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gSwg8U8l5FGTSKwHxmh32bWwvRtcib7B+UfWvEEjn3pvDOO6AYWk9PAAaOGu4GCA517puaClkrEJungbozdQDx/9q1Rg2mM5Me6dXVlWIpaIUKb9IFK2cs76z5l3rSlfhxgxxOJOACQ37UA3KClgcXlpreDvWaYCX5Ns5/hdEp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ew1/xrts; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ew1/xrts"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708817746; x=1740353746;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5lkeYUOTjT/PTmjGpnMfzJhXccJOik+e4fU/YAaT69U=;
  b=Ew1/xrtsiNXnWmKM0ijjMCkzSsxlglrevuEfq8uRVIEwUTShRwoorv9P
   1QPuKPerdHz1ex7+3Dwa4EcxJZpMtVs2JZX9oa3xU9R4Km78u3Pb3y8WO
   HQAFVPfR7XEHEP3XTdjB0PALHD3piJF+CVP0qB+BJX7/WmaMY2lFnxd5R
   aXWOzeiNlYxBaymjMYXDFYB6GAB/ZcxGmIaJFySwVtf0/xq2Slqii7sXd
   E/OfQMuOJov3t4Qysvhfu3/2lowJ5TLRnwyQUBu1F8o4iWeu+Q9E8K5rw
   8aPRRvHVvNEwNSAdYQrofSWR/KeM463SAsbTrN+RFc/jFwLLOSenhClBR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="20574749"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="20574749"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 15:35:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="6256498"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 24 Feb 2024 15:35:45 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re1YU-00091Q-2D;
	Sat, 24 Feb 2024 23:35:42 +0000
Date: Sun, 25 Feb 2024 07:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/3] drm/i915/psr: Improve fast and IO wake lines
 calculation
Message-ID: <202402250758.KqBqXYrz-lkp@intel.com>
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
In-Reply-To: <20240221075322.2764209-3-jouni.hogander@intel.com>
References: <20240221075322.2764209-3-jouni.hogander@intel.com>
TO: "Jouni Högander" <jouni.hogander@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
CC: "Jouni Högander" <jouni.hogander@intel.com>

Hi Jouni,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip next-20240223]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.8-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jouni-H-gander/drm-i915-display-Add-aux-function-pointer-for-fast-wake-sync-pulse-count/20240221-160220
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20240221075322.2764209-3-jouni.hogander%40intel.com
patch subject: [PATCH 2/3] drm/i915/psr: Improve fast and IO wake lines calculation
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-r081-20240223 (https://download.01.org/0day-ci/archive/20240225/202402250758.KqBqXYrz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402250758.KqBqXYrz-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_psr.c:1203 _compute_alpm_params() error: uninitialized symbol 'io_wake_time'.

vim +/io_wake_time +1203 drivers/gpu/drm/i915/display/intel_psr.c

7903f1d36c3d97 Jouni Högander 2024-02-21  1174  
96a24945731fe9 Jouni Högander 2024-01-30  1175  static bool _compute_alpm_params(struct intel_dp *intel_dp,
cb42e8ede5b475 Jouni Högander 2023-02-21  1176  				 struct intel_crtc_state *crtc_state)
cb42e8ede5b475 Jouni Högander 2023-02-21  1177  {
cb42e8ede5b475 Jouni Högander 2023-02-21  1178  	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
cb42e8ede5b475 Jouni Högander 2023-02-21  1179  	int io_wake_lines, io_wake_time, fast_wake_lines, fast_wake_time;
cb42e8ede5b475 Jouni Högander 2023-02-21  1180  	u8 max_wake_lines;
cb42e8ede5b475 Jouni Högander 2023-02-21  1181  
7903f1d36c3d97 Jouni Högander 2024-02-21  1182  	if (intel_dp->get_aux_fw_sync_len) {
7903f1d36c3d97 Jouni Högander 2024-02-21  1183  		int io_wake_time = get_io_wake_time(intel_dp, crtc_state);
7903f1d36c3d97 Jouni Högander 2024-02-21  1184  		int tfw_exit_latency = 20; /* eDP spec */
7903f1d36c3d97 Jouni Högander 2024-02-21  1185  		int phy_wake = 4;	   /* eDP spec */
7903f1d36c3d97 Jouni Högander 2024-02-21  1186  		int preamble = 8;	   /* eDP spec */
7903f1d36c3d97 Jouni Högander 2024-02-21  1187  		int precharge = intel_dp->get_aux_fw_sync_len() - preamble;
7903f1d36c3d97 Jouni Högander 2024-02-21  1188  
7903f1d36c3d97 Jouni Högander 2024-02-21  1189  		io_wake_time = max(precharge, io_wake_time) + preamble +
7903f1d36c3d97 Jouni Högander 2024-02-21  1190  			phy_wake + tfw_exit_latency;
7903f1d36c3d97 Jouni Högander 2024-02-21  1191  		fast_wake_time = precharge + preamble + phy_wake +
7903f1d36c3d97 Jouni Högander 2024-02-21  1192  			tfw_exit_latency;
29f3067a236ac5 Jouni Högander 2024-01-30  1193  
29f3067a236ac5 Jouni Högander 2024-01-30  1194  		/* TODO: Check how we can use ALPM_CTL fast wake extended field */
cb42e8ede5b475 Jouni Högander 2023-02-21  1195  		max_wake_lines = 12;
cb42e8ede5b475 Jouni Högander 2023-02-21  1196  	} else {
cb42e8ede5b475 Jouni Högander 2023-02-21  1197  		io_wake_time = 50;
cb42e8ede5b475 Jouni Högander 2023-02-21  1198  		fast_wake_time = 32;
cb42e8ede5b475 Jouni Högander 2023-02-21  1199  		max_wake_lines = 8;
cb42e8ede5b475 Jouni Högander 2023-02-21  1200  	}
cb42e8ede5b475 Jouni Högander 2023-02-21  1201  
cb42e8ede5b475 Jouni Högander 2023-02-21  1202  	io_wake_lines = intel_usecs_to_scanlines(
ef0af9db2a2125 Jouni Högander 2023-06-20 @1203  		&crtc_state->hw.adjusted_mode, io_wake_time);
cb42e8ede5b475 Jouni Högander 2023-02-21  1204  	fast_wake_lines = intel_usecs_to_scanlines(
ef0af9db2a2125 Jouni Högander 2023-06-20  1205  		&crtc_state->hw.adjusted_mode, fast_wake_time);
cb42e8ede5b475 Jouni Högander 2023-02-21  1206  
cb42e8ede5b475 Jouni Högander 2023-02-21  1207  	if (io_wake_lines > max_wake_lines ||
cb42e8ede5b475 Jouni Högander 2023-02-21  1208  	    fast_wake_lines > max_wake_lines)
cb42e8ede5b475 Jouni Högander 2023-02-21  1209  		return false;
cb42e8ede5b475 Jouni Högander 2023-02-21  1210  
29f3067a236ac5 Jouni Högander 2024-01-30  1211  	if (!_lnl_compute_alpm_params(intel_dp, crtc_state))
29f3067a236ac5 Jouni Högander 2024-01-30  1212  		return false;
29f3067a236ac5 Jouni Högander 2024-01-30  1213  
942d654171bdaf Jouni Högander 2023-10-24  1214  	if (i915->display.params.psr_safest_params)
cb42e8ede5b475 Jouni Högander 2023-02-21  1215  		io_wake_lines = fast_wake_lines = max_wake_lines;
cb42e8ede5b475 Jouni Högander 2023-02-21  1216  
cb42e8ede5b475 Jouni Högander 2023-02-21  1217  	/* According to Bspec lower limit should be set as 7 lines. */
96a24945731fe9 Jouni Högander 2024-01-30  1218  	intel_dp->psr.alpm_parameters.io_wake_lines = max(io_wake_lines, 7);
96a24945731fe9 Jouni Högander 2024-01-30  1219  	intel_dp->psr.alpm_parameters.fast_wake_lines = max(fast_wake_lines, 7);
cb42e8ede5b475 Jouni Högander 2023-02-21  1220  
cb42e8ede5b475 Jouni Högander 2023-02-21  1221  	return true;
cb42e8ede5b475 Jouni Högander 2023-02-21  1222  }
cb42e8ede5b475 Jouni Högander 2023-02-21  1223  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
