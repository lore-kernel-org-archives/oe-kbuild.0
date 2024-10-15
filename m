Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CCA1FE10B
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Oct 2024 21:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729027737; cv=none; b=eASh3dnHxvd1b3r+cTefzVP17m5FmI+tE9PkJcGi0bVq3g/PVxCkRiEKEMSp1MaCnehlGKB4ZdDq8X061kSik5AeVqVYK3MOCqOc+L/sDGpO9LXuLYQnJaMiNa9wawug74bzr/tvaeRvIc9pXpTFdRSZKOGUq/U0MjJPP9mpCCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729027737; c=relaxed/simple;
	bh=RevVwcGZQR/kKW3lw/Ox0TCa4+XIxOrS81PwTK3sCJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mW3BUKbXjkqVYznw7jNOYpvf+k/dOPxgVwOoNXEPYCn2adzRGpwYwViqTir9ZPhbyFqmEdnaEyRL11FVax8d3xWes3ebdHIilmlqNHZcKk9y3MkuRDDrvsfhEemrxCzJKmoE+fSTzWNtrGijHWodrzmKl94+zR6BM/3hybK5RJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1Vt3Orr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1Vt3Orr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729027736; x=1760563736;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RevVwcGZQR/kKW3lw/Ox0TCa4+XIxOrS81PwTK3sCJs=;
  b=P1Vt3OrrLQwBa4OCH767o6DhZqmjrEA63QwJ/TeKHf+vNH8Q1zq0A08+
   Y+mdEXamaaoUcsofGdB4aebbf2M8IOwWHTx/C03+orAClnCH4zOpNRrNY
   LcA6iD5t2+bNL8vuDRKpCaKTD36K6zTK40MiLtycOoQ2ERbXNDNfx5vWy
   hT8etcI3Fzd5PCI01O67QyLJ/oH0Zp3u1Hfd5m2MR4A6HXvX7MJqjyGK7
   uiEfN9U42SuYNDPiNywaaJywQfVaYfZj1k4Z2ShOoR37B4ZpQ77zWoqAU
   Xh5W6UIVXFfjsc/TwX9RBDNCsS121vj2WNvJJKPTHDNYAlJE4hp1rRnOX
   A==;
X-CSE-ConnectionGUID: w5anCOF+RlGd1tFvMtH7IA==
X-CSE-MsgGUID: V22mbS2QSlmyTfn5NvmvEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="45926040"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="45926040"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 14:28:53 -0700
X-CSE-ConnectionGUID: 0qxgZ5SJRrKfNgdUdMTNcQ==
X-CSE-MsgGUID: eSLJ1BXHRyaHgA37vPslbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="78482926"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 15 Oct 2024 14:28:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0p61-000JxA-0X;
	Tue, 15 Oct 2024 21:28:49 +0000
Date: Wed, 16 Oct 2024 05:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 6/9] drm/i915/display: Add DSC pixel replication
Message-ID: <202410160309.qW597TbA-lkp@intel.com>
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
In-Reply-To: <20241014081000.2844245-7-ankit.k.nautiyal@intel.com>
References: <20241014081000.2844245-7-ankit.k.nautiyal@intel.com>
TO: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: intel-xe@lists.freedesktop.org

Hi Ankit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on next-20241015]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip linus/master v6.12-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankit-Nautiyal/drm-i915-display-Prepare-for-dsc-3-stream-splitter/20241014-161007
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20241014081000.2844245-7-ankit.k.nautiyal%40intel.com
patch subject: [PATCH 6/9] drm/i915/display: Add DSC pixel replication
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20241015 (https://download.01.org/0day-ci/archive/20241016/202410160309.qW597TbA-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410160309.qW597TbA-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_vdsc.c:1022 intel_dsc_get_config() error: uninitialized symbol 'dss_ctl3'.

vim +/dss_ctl3 +1022 drivers/gpu/drm/i915/display/intel_vdsc.c

bd077259d0a9c9 drivers/gpu/drm/i915/display/intel_vdsc.c Suraj Kandpal  2023-08-28   983  
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17   984  void intel_dsc_get_config(struct intel_crtc_state *crtc_state)
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17   985  {
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17   986  	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17   987  	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
32f6734c724335 drivers/gpu/drm/i915/display/intel_vdsc.c Ville Syrjälä  2021-09-13   988  	enum transcoder cpu_transcoder = crtc_state->cpu_transcoder;
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17   989  	enum intel_display_power_domain power_domain;
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17   990  	intel_wakeref_t wakeref;
b9485c7afb2793 drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14   991  	u32 dss_ctl1, dss_ctl2, dss_ctl3;
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17   992  
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17   993  	if (!intel_dsc_source_support(crtc_state))
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17   994  		return;
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17   995  
32f6734c724335 drivers/gpu/drm/i915/display/intel_vdsc.c Ville Syrjälä  2021-09-13   996  	power_domain = intel_dsc_power_domain(crtc, cpu_transcoder);
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17   997  
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17   998  	wakeref = intel_display_power_get_if_enabled(dev_priv, power_domain);
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17   999  	if (!wakeref)
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17  1000  		return;
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17  1001  
32f6734c724335 drivers/gpu/drm/i915/display/intel_vdsc.c Ville Syrjälä  2021-09-13  1002  	dss_ctl1 = intel_de_read(dev_priv, dss_ctl1_reg(crtc, cpu_transcoder));
32f6734c724335 drivers/gpu/drm/i915/display/intel_vdsc.c Ville Syrjälä  2021-09-13  1003  	dss_ctl2 = intel_de_read(dev_priv, dss_ctl2_reg(crtc, cpu_transcoder));
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17  1004  
b9485c7afb2793 drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1005  	if (IS_BATTLEMAGE(dev_priv))
b9485c7afb2793 drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1006  		dss_ctl3 = intel_de_read(dev_priv, BMG_PIPE_DSS_CTL3(crtc_state->cpu_transcoder));
b9485c7afb2793 drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1007  
9653b5b25aaebd drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1008  	crtc_state->dsc.compression_enable = dss_ctl2 & VDSC0_ENABLE;
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17  1009  	if (!crtc_state->dsc.compression_enable)
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17  1010  		goto out;
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17  1011  
74acc63ecbd43d drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1012  	if (dss_ctl1 & JOINER_ENABLE) {
74acc63ecbd43d drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1013  		if (dss_ctl2 & (VDSC2_ENABLE | SMALL_JOINER_CONFIG_3_ENGINES))
74acc63ecbd43d drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1014  			crtc_state->dsc.dsc_split = INTEL_DSC_SPLIT_3_STREAMS;
74acc63ecbd43d drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1015  
74acc63ecbd43d drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1016  		else if (dss_ctl2 & VDSC1_ENABLE)
f0cac2a31b68d3 drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1017  			crtc_state->dsc.dsc_split = INTEL_DSC_SPLIT_2_STREAMS;
74acc63ecbd43d drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1018  	} else {
f0cac2a31b68d3 drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1019  		crtc_state->dsc.dsc_split = INTEL_DSC_SPLIT_DISABLED;
74acc63ecbd43d drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1020  	}
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17  1021  
b9485c7afb2793 drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14 @1022  	if (dss_ctl3 & DSC_PIXEL_REPLICATION_MASK)
b9485c7afb2793 drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1023  		crtc_state->dsc.pixel_replication_count =
b9485c7afb2793 drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1024  			dss_ctl3 & DSC_PIXEL_REPLICATION_MASK;
b9485c7afb2793 drivers/gpu/drm/i915/display/intel_vdsc.c Ankit Nautiyal 2024-10-14  1025  
bd077259d0a9c9 drivers/gpu/drm/i915/display/intel_vdsc.c Suraj Kandpal  2023-08-28  1026  	intel_dsc_get_pps_config(crtc_state);
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17  1027  out:
8a029c113b1791 drivers/gpu/drm/i915/display/intel_vdsc.c Manasi Navare  2020-11-17  1028  	intel_display_power_put(dev_priv, power_domain, wakeref);
a600622c09ddf7 drivers/gpu/drm/i915/intel_vdsc.c         Manasi Navare  2018-11-28  1029  }
1de99ff7371bc6 drivers/gpu/drm/i915/display/intel_vdsc.c Imre Deak      2024-08-05  1030  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
