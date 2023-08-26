Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5D7386
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Aug 2023 01:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693013582; x=1724549582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pOWL2qvac4uhp3nazvJcsFvQCkd8DYDNB1ZCqw9N0h8=;
  b=F3cuBBcdCslEsiBpY3tWwpwM43KR6Dw4EXO0TsGAX3aSrMvZpJjS+Ebr
   Nz01v5bZd08d06mVz8KsJkZEFKppvVHDcYGGDHAAXw+Z267nafnlwSkJW
   ekgQRR1fwkhgT+oC1fEuyZ/rSg2YnkULe4U77sz4/+axndzkGm1LxcZNB
   SqpsZ+JYhipp6SiYPpJ/gKt52WgjaT0WOSYEOvcfZjmLVYCUW8mDe+I2V
   TZaM5PaXacswe4D3zQvzDRnhT2q1XZMWom531tjAFk2GmkJjmG/9SewMD
   sUHtqPsJumtLFcKZqF4nxk9qa0VAZrza2+eMvHlFwxZXt2mGDlhPdEIcE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="405831039"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="405831039"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 18:33:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="767095330"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="767095330"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 25 Aug 2023 18:33:00 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZiAd-0004Dl-0w;
	Sat, 26 Aug 2023 01:32:59 +0000
Date: Sat, 26 Aug 2023 09:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] drm/display/dp: Default 8 bpc support when DSC is
 supported
Message-ID: <202308260936.KLU5QX9V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/display/drm_dp_helper.c:2451:39: sparse: sparse: dubious: !x & y"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230823115425.715644-2-ankit.k.nautiyal@intel.com>
References: <20230823115425.715644-2-ankit.k.nautiyal@intel.com>
TO: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
TO: dri-devel@lists.freedesktop.org
TO: intel-gfx@lists.freedesktop.org

Hi Ankit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master v6.5-rc7 next-20230825]
[cannot apply to drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ankit-Nautiyal/drm-display-dp-Default-8-bpc-support-when-DSC-is-supported/20230823-195946
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20230823115425.715644-2-ankit.k.nautiyal%40intel.com
patch subject: [PATCH 1/2] drm/display/dp: Default 8 bpc support when DSC is supported
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r132-20230823 (https://download.01.org/0day-ci/archive/20230826/202308260936.KLU5QX9V-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260936.KLU5QX9V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308260936.KLU5QX9V-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/display/drm_dp_helper.c:2451:39: sparse: sparse: dubious: !x & y

vim +2451 drivers/gpu/drm/display/drm_dp_helper.c

0575650077eae2 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-10-30  2428  
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2429  /**
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2430   * drm_dp_dsc_sink_supported_input_bpcs() - Get all the input bits per component
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2431   * values supported by the DSC sink.
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2432   * @dsc_dpcd: DSC capabilities from DPCD
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2433   * @dsc_bpc: An array to be filled by this helper with supported
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2434   *           input bpcs.
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2435   *
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2436   * Read the DSC DPCD from the sink device to parse the supported bits per
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2437   * component values. This is used to populate the DSC parameters
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2438   * in the &struct drm_dsc_config by the driver.
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2439   * Driver creates an infoframe using these parameters to populate
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2440   * &struct drm_dsc_pps_infoframe. These are sent to the sink using DSC
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2441   * infoframe using the helper function drm_dsc_pps_infoframe_pack()
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2442   *
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2443   * Returns:
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2444   * Number of input BPC values parsed from the DPCD
05bad2357afcb9 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2019-02-06  2445   */
4d4101c8b32186 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-11-27  2446  int drm_dp_dsc_sink_supported_input_bpcs(const u8 dsc_dpcd[DP_DSC_RECEIVER_CAP_SIZE],
4d4101c8b32186 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-11-27  2447  					 u8 dsc_bpc[3])
0575650077eae2 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-10-30  2448  {
4d4101c8b32186 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-11-27  2449  	int num_bpc = 0;
133b5d2265a650 drivers/gpu/drm/display/drm_dp_helper.c Ankit Nautiyal 2023-08-23  2450  
133b5d2265a650 drivers/gpu/drm/display/drm_dp_helper.c Ankit Nautiyal 2023-08-23 @2451  	if (!dsc_dpcd[DP_DSC_SUPPORT] & DP_DSC_DECOMPRESSION_IS_SUPPORTED)
133b5d2265a650 drivers/gpu/drm/display/drm_dp_helper.c Ankit Nautiyal 2023-08-23  2452  		return 0;
133b5d2265a650 drivers/gpu/drm/display/drm_dp_helper.c Ankit Nautiyal 2023-08-23  2453  
0575650077eae2 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-10-30  2454  	u8 color_depth = dsc_dpcd[DP_DSC_DEC_COLOR_DEPTH_CAP - DP_DSC_SUPPORT];
0575650077eae2 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-10-30  2455  
0575650077eae2 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-10-30  2456  	if (color_depth & DP_DSC_12_BPC)
4d4101c8b32186 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-11-27  2457  		dsc_bpc[num_bpc++] = 12;
0575650077eae2 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-10-30  2458  	if (color_depth & DP_DSC_10_BPC)
4d4101c8b32186 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-11-27  2459  		dsc_bpc[num_bpc++] = 10;
133b5d2265a650 drivers/gpu/drm/display/drm_dp_helper.c Ankit Nautiyal 2023-08-23  2460  
133b5d2265a650 drivers/gpu/drm/display/drm_dp_helper.c Ankit Nautiyal 2023-08-23  2461  	/* A DP DSC Sink devices shall support 8 bpc. */
4d4101c8b32186 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-11-27  2462  	dsc_bpc[num_bpc++] = 8;
0575650077eae2 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-10-30  2463  
4d4101c8b32186 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-11-27  2464  	return num_bpc;
0575650077eae2 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-10-30  2465  }
4d4101c8b32186 drivers/gpu/drm/drm_dp_helper.c         Manasi Navare  2018-11-27  2466  EXPORT_SYMBOL(drm_dp_dsc_sink_supported_input_bpcs);
4342f839ae7e61 drivers/gpu/drm/drm_dp_helper.c         Animesh Manna  2020-03-16  2467  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
