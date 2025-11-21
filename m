Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9707617D6
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 00:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763683362; cv=none; b=S5AUt/GoaJNKbj6u5fc/V1wvtmmULBrcnUivBPlvzc0Ib1CBQvTpnL+VdzSjArTaO8ru66RldrbTPs21piT97kR8J676WB1ylBDoTR/jFtNE2wxqNkYm7oBua4O8SmZd1rK3deIQk1AtHxPbcbxxAjad6+nNxj0qviU96ix7/Ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763683362; c=relaxed/simple;
	bh=hPK4k4dIa0ZDgb3LRLvLqIUa8QorNmUtvdUKyOiRMVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFBLQyv8hjM6HNplr99f3/sPOf84DNiJnF6uQbp3zm1mxBw1N9gUALRUTHgu3MOR/6yu4iFH5nMIGEFhu1bbdwXec+uSdLM7M11C1j4ii/Win0OWOETSDYmc4ax2oFAB1M0Yrm177jceAWciEJQUmFUCbnlJ53gpyqa25vAuA80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HpGjircO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HpGjircO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763683361; x=1795219361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hPK4k4dIa0ZDgb3LRLvLqIUa8QorNmUtvdUKyOiRMVQ=;
  b=HpGjircOYexfKM1E6IbYzxI12cGnIZy3rxiH6VsNO/UxgC+tk3I6+Xy6
   C2cRtzQ/3HMYY52Rwj2jaE0rkstL4gM1Bw4qNeCXhSRWNmGYZnZeXdbAE
   O7o/CUDLmGQ1gtkJ1LLDDdvOIjBBPVayeagrXyPZ49mbozPJ0SZ4LIlk3
   0Tn1K4yGlfwF8EsBx0LdOdRAmewmLIdsQ48MzAkj77adATHeeUuWkpd7c
   VtmAUd2CCcX7GE/tAWTaNmXowjNRbwlFTI9RzOZcbQEmaaCUKOLcuhrSy
   WyuxCJIOSz5YwKq1hxqk07u+dGjJ0GEaoo0yTyTz9YUN4SbkO5+yiA+q4
   w==;
X-CSE-ConnectionGUID: a8tdPdvzS4GmhNXvgFXRWA==
X-CSE-MsgGUID: KTVKs45DT9W6QrjiFXh1bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="65468449"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="65468449"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 16:02:41 -0800
X-CSE-ConnectionGUID: wmt/Mo/hSTuRthg7oN6eQA==
X-CSE-MsgGUID: QCpCv/vuQfK36BtxIW7vig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="191379443"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Nov 2025 16:02:39 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMEbk-0004jv-2Y;
	Fri, 21 Nov 2025 00:02:36 +0000
Date: Fri, 21 Nov 2025 08:01:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] efi: Wrap screen_info in efi_screen_info so
 edid_info can be added later
Message-ID: <202511210709.gaIjYTZF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "maintainer prefers to test the version of patch actually in efi/next"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251119123011.1187249-6-ardb+git@google.com>
References: <20251119123011.1187249-6-ardb+git@google.com>
TO: Ard Biesheuvel <ardb+git@google.com>
TO: linux-efi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: Javier Martinez Canillas <javierm@redhat.com>

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on efi/next]
[also build test ERROR on tip/x86/core drm-misc/drm-misc-next linus/master v6.18-rc6 next-20251120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/efi-Wrap-screen_info-in-efi_screen_info-so-edid_info-can-be-added-later/20251119-203437
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20251119123011.1187249-6-ardb%2Bgit%40google.com
patch subject: [PATCH 1/3] efi: Wrap screen_info in efi_screen_info so edid_info can be added later
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-003-20251121 (https://download.01.org/0day-ci/archive/20251121/202511210709.gaIjYTZF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511210709.gaIjYTZF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511210709.gaIjYTZF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/amd/amdgpu/../display/dc/dc_types.h:38,
                    from drivers/gpu/drm/amd/amdgpu/../display/dc/dm_services_types.h:30,
                    from drivers/gpu/drm/amd/amdgpu/../include/dm_pp_interface.h:26,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu.h:62,
                    from drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:49:
>> drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hw_types.h:221:6: error: 'pixel_format' defined as wrong kind of tag
    enum pixel_format {
         ^~~~~~~~~~~~


vim +/pixel_format +221 drivers/gpu/drm/amd/amdgpu/../display/dc/dc_hw_types.h

4562236b3bc0a2 Harry Wentland 2017-09-12  217  
734a092b1fe407 Eric Bernstein 2017-09-29  218  
734a092b1fe407 Eric Bernstein 2017-09-29  219  
4562236b3bc0a2 Harry Wentland 2017-09-12  220  /* Pixel format */
4562236b3bc0a2 Harry Wentland 2017-09-12 @221  enum pixel_format {
4562236b3bc0a2 Harry Wentland 2017-09-12  222  	/*graph*/
4562236b3bc0a2 Harry Wentland 2017-09-12  223  	PIXEL_FORMAT_UNINITIALIZED,
4562236b3bc0a2 Harry Wentland 2017-09-12  224  	PIXEL_FORMAT_INDEX8,
4562236b3bc0a2 Harry Wentland 2017-09-12  225  	PIXEL_FORMAT_RGB565,
4562236b3bc0a2 Harry Wentland 2017-09-12  226  	PIXEL_FORMAT_ARGB8888,
4562236b3bc0a2 Harry Wentland 2017-09-12  227  	PIXEL_FORMAT_ARGB2101010,
4562236b3bc0a2 Harry Wentland 2017-09-12  228  	PIXEL_FORMAT_ARGB2101010_XRBIAS,
4562236b3bc0a2 Harry Wentland 2017-09-12  229  	PIXEL_FORMAT_FP16,
4562236b3bc0a2 Harry Wentland 2017-09-12  230  	/*video*/
87449a90c2545e Anthony Koo    2017-07-06  231  	PIXEL_FORMAT_420BPP8,
87449a90c2545e Anthony Koo    2017-07-06  232  	PIXEL_FORMAT_420BPP10,
4562236b3bc0a2 Harry Wentland 2017-09-12  233  	/*end of pixel format definition*/
4562236b3bc0a2 Harry Wentland 2017-09-12  234  	PIXEL_FORMAT_INVALID,
4562236b3bc0a2 Harry Wentland 2017-09-12  235  
4562236b3bc0a2 Harry Wentland 2017-09-12  236  	PIXEL_FORMAT_GRPH_BEGIN = PIXEL_FORMAT_INDEX8,
4562236b3bc0a2 Harry Wentland 2017-09-12  237  	PIXEL_FORMAT_GRPH_END = PIXEL_FORMAT_FP16,
87449a90c2545e Anthony Koo    2017-07-06  238  	PIXEL_FORMAT_VIDEO_BEGIN = PIXEL_FORMAT_420BPP8,
87449a90c2545e Anthony Koo    2017-07-06  239  	PIXEL_FORMAT_VIDEO_END = PIXEL_FORMAT_420BPP10,
4562236b3bc0a2 Harry Wentland 2017-09-12  240  	PIXEL_FORMAT_UNKNOWN
4562236b3bc0a2 Harry Wentland 2017-09-12  241  };
4562236b3bc0a2 Harry Wentland 2017-09-12  242  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
