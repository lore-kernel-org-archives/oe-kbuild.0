Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5493168BA
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Oct 2023 20:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d3pPgJ7M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697316616; x=1728852616;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4DXFqPdPXIbrHZAS1GXbADjVXtix7mPvFqaz0qaooKo=;
  b=d3pPgJ7M+9eIrCB/GVObkbgZbW2KvngbEkR03ZAnsc4QLAEr6wzTbF5j
   VBi9dt+Ct5hDyRc7XYl2joyshwgDYN6G8XrqHhOG6XjeY11dz7QL5NIV/
   vFtEIvtmEzBpIh8J0W0LUk2kyXTbdjZf1fKiuSr+Em7oScd+vzghTAPD6
   NQTNuz7tVtuuiiVrBJvqGpNaTlfbyIsYspBMc6usgh4eWXHHVXAGMiY/h
   6BLEgX/PSs9wYIO4OAkiTdXtiGnUAnzAM3X374bnyNOe7JFhO6TXAR9yo
   Fr/lNR2VJ/cH+MHpntT/jug5l9aNqcZodTDspI/X01RRpreF++1yw7/2G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="365611142"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="365611142"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 13:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002389128"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="1002389128"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Oct 2023 13:50:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrlaO-0006dN-1K;
	Sat, 14 Oct 2023 20:50:12 +0000
Date: Sun, 15 Oct 2023 04:49:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Support FP16 compressed formats on
 MTL
Message-ID: <202310150454.S9QF86bl-lkp@intel.com>
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
In-Reply-To: <20231011102356.22014-1-melanie.lobo@intel.com>
References: <20231011102356.22014-1-melanie.lobo@intel.com>
TO: Melanie Lobo <melanie.lobo@intel.com>
TO: intel-gfx@lists.freedesktop.org
CC: juha-pekka.heikkila@intel.com

Hi Melanie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-tip/drm-tip]

url:    https://github.com/intel-lab-lkp/linux/commits/Melanie-Lobo/drm-i915-Support-FP16-compressed-formats-on-MTL/20231011-181214
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
patch link:    https://lore.kernel.org/r/20231011102356.22014-1-melanie.lobo%40intel.com
patch subject: [Intel-gfx] [PATCH] drm/i915: Support FP16 compressed formats on MTL
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20231015 (https://download.01.org/0day-ci/archive/20231015/202310150454.S9QF86bl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231015/202310150454.S9QF86bl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310150454.S9QF86bl-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/skl_universal_plane.c:2126 gen12_plane_format_mod_supported() warn: ignoring unreachable code.

vim +2126 drivers/gpu/drm/i915/display/skl_universal_plane.c

46d12f911821f7 Dave Airlie           2021-02-05  2080  
46d12f911821f7 Dave Airlie           2021-02-05  2081  static bool gen12_plane_format_mod_supported(struct drm_plane *_plane,
46d12f911821f7 Dave Airlie           2021-02-05  2082  					     u32 format, u64 modifier)
46d12f911821f7 Dave Airlie           2021-02-05  2083  {
46d12f911821f7 Dave Airlie           2021-02-05  2084  	struct intel_plane *plane = to_intel_plane(_plane);
46d12f911821f7 Dave Airlie           2021-02-05  2085  
e2b8329432b880 Imre Deak             2021-10-20  2086  	if (!intel_fb_plane_supports_modifier(plane, modifier))
1a7910368cba1e José Roberto de Souza 2021-05-14  2087  		return false;
46d12f911821f7 Dave Airlie           2021-02-05  2088  
46d12f911821f7 Dave Airlie           2021-02-05  2089  	switch (format) {
46d12f911821f7 Dave Airlie           2021-02-05  2090  	case DRM_FORMAT_XRGB8888:
46d12f911821f7 Dave Airlie           2021-02-05  2091  	case DRM_FORMAT_XBGR8888:
46d12f911821f7 Dave Airlie           2021-02-05  2092  	case DRM_FORMAT_ARGB8888:
46d12f911821f7 Dave Airlie           2021-02-05  2093  	case DRM_FORMAT_ABGR8888:
e359c47bfa6155 Imre Deak             2021-10-20  2094  		if (intel_fb_is_ccs_modifier(modifier))
46d12f911821f7 Dave Airlie           2021-02-05  2095  			return true;
46d12f911821f7 Dave Airlie           2021-02-05  2096  		fallthrough;
46d12f911821f7 Dave Airlie           2021-02-05  2097  	case DRM_FORMAT_YUYV:
46d12f911821f7 Dave Airlie           2021-02-05  2098  	case DRM_FORMAT_YVYU:
46d12f911821f7 Dave Airlie           2021-02-05  2099  	case DRM_FORMAT_UYVY:
46d12f911821f7 Dave Airlie           2021-02-05  2100  	case DRM_FORMAT_VYUY:
46d12f911821f7 Dave Airlie           2021-02-05  2101  	case DRM_FORMAT_NV12:
46d12f911821f7 Dave Airlie           2021-02-05  2102  	case DRM_FORMAT_XYUV8888:
46d12f911821f7 Dave Airlie           2021-02-05  2103  	case DRM_FORMAT_P010:
46d12f911821f7 Dave Airlie           2021-02-05  2104  	case DRM_FORMAT_P012:
46d12f911821f7 Dave Airlie           2021-02-05  2105  	case DRM_FORMAT_P016:
0b2c31dd886865 Imre Deak             2021-10-20  2106  		if (intel_fb_is_mc_ccs_modifier(modifier))
46d12f911821f7 Dave Airlie           2021-02-05  2107  			return true;
46d12f911821f7 Dave Airlie           2021-02-05  2108  		fallthrough;
46d12f911821f7 Dave Airlie           2021-02-05  2109  	case DRM_FORMAT_RGB565:
46d12f911821f7 Dave Airlie           2021-02-05  2110  	case DRM_FORMAT_XRGB2101010:
46d12f911821f7 Dave Airlie           2021-02-05  2111  	case DRM_FORMAT_XBGR2101010:
46d12f911821f7 Dave Airlie           2021-02-05  2112  	case DRM_FORMAT_ARGB2101010:
46d12f911821f7 Dave Airlie           2021-02-05  2113  	case DRM_FORMAT_ABGR2101010:
46d12f911821f7 Dave Airlie           2021-02-05  2114  	case DRM_FORMAT_XVYU2101010:
46d12f911821f7 Dave Airlie           2021-02-05  2115  	case DRM_FORMAT_C8:
46d12f911821f7 Dave Airlie           2021-02-05  2116  	case DRM_FORMAT_XBGR16161616F:
46d12f911821f7 Dave Airlie           2021-02-05  2117  	case DRM_FORMAT_ABGR16161616F:
46d12f911821f7 Dave Airlie           2021-02-05  2118  	case DRM_FORMAT_XRGB16161616F:
46d12f911821f7 Dave Airlie           2021-02-05  2119  	case DRM_FORMAT_ARGB16161616F:
46d12f911821f7 Dave Airlie           2021-02-05  2120  	case DRM_FORMAT_Y210:
46d12f911821f7 Dave Airlie           2021-02-05  2121  	case DRM_FORMAT_Y212:
46d12f911821f7 Dave Airlie           2021-02-05  2122  	case DRM_FORMAT_Y216:
46d12f911821f7 Dave Airlie           2021-02-05  2123  	case DRM_FORMAT_XVYU12_16161616:
46d12f911821f7 Dave Airlie           2021-02-05  2124  	case DRM_FORMAT_XVYU16161616:
46d12f911821f7 Dave Airlie           2021-02-05  2125  		return true;
46d12f911821f7 Dave Airlie           2021-02-05 @2126  		fallthrough;
46d12f911821f7 Dave Airlie           2021-02-05  2127  	default:
46d12f911821f7 Dave Airlie           2021-02-05  2128  		return false;
46d12f911821f7 Dave Airlie           2021-02-05  2129  	}
46d12f911821f7 Dave Airlie           2021-02-05  2130  }
46d12f911821f7 Dave Airlie           2021-02-05  2131  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
