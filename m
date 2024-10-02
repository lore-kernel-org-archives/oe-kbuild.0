Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDBB17741
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Oct 2024 03:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727838707; cv=none; b=P5Eqqb+KQ76tDKsDSk8V+8SaUJcWcJvmqwI2JIvoZm4o/iRMdY7bg/Uk27RWapFGcJ0Yx7yWFmv8HYmZmKNZZ7hNUP6rI/WMoHQG4hCscNuAoKNNlyQOPo7QrGpgkNjenYzkTuWZ/lGHC/bs79ElMEbu6vOck0UsTabN49C4GkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727838707; c=relaxed/simple;
	bh=MeRBKh6aflCAH7DPDY6qWg/gBf37TitWj7/+2bF8arY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZbKzhz5vmSmzp/VA3fkbK4HApizLi1m16s1Vd+/TWGV4sSpzr9Seg7qVTGE54VE4o5s+OhGlwc99u2jAQh3alxOm35VOlXXwGgTknv0eZOhQe6vdeBsugCpk+BeL5bnpm0FJzG3xV1FbXGV54ZAU2jJMSrLitItb5f1ObGSiyEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQGWULgc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQGWULgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727838706; x=1759374706;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MeRBKh6aflCAH7DPDY6qWg/gBf37TitWj7/+2bF8arY=;
  b=NQGWULgcP0wWJavKqT+oOzVt8gpDONFSXprEQEkMhMCMi/Ug1+O+1oRH
   3OUu49WXRO6lpMyU92C+u0zfbDbcZD8nVnQwolqWjqAFZ0y3HfOLaCvcT
   kl/UoBSSiHDU9YKWcCADJ/II3upJhXtSWj9440Osn8HxmsPalkY/yOpqd
   9OQAoIBahmEGdtFDovI4PyrXocuF/CtYiByURrIDhtv8eeuo8+Egp5aGS
   rgM8sbcb8TryHxI3nA+e7nn2SmgEQaSNfQ+uLpwDhlOmZGYvaGAwqpajs
   xaJdUrBc5Z35MpLtPamPJkbFagJ3tjynMVSsb59w0y+5MImHz5L7XASN8
   Q==;
X-CSE-ConnectionGUID: 1S7/Io9rSvaQ22ZfQ9XxFg==
X-CSE-MsgGUID: cdDnVbjYRWmzzShmM1AhNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="29875557"
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="29875557"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 20:11:46 -0700
X-CSE-ConnectionGUID: t8ev1BQuQ1ukTNnWuvH/SA==
X-CSE-MsgGUID: u3BaHgUzTxy7DVS5O42O0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,170,1725346800"; 
   d="scan'208";a="78850331"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Oct 2024 20:11:45 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svpm9-000RTn-3D;
	Wed, 02 Oct 2024 03:11:41 +0000
Date: Wed, 2 Oct 2024 11:11:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCHv2] drm/i915/dp: Guarantee a minimum HBlank time
Message-ID: <202410021032.BpJez1ja-lkp@intel.com>
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
In-Reply-To: <20241001074348.2193502-1-arun.r.murthy@intel.com>
References: <20241001074348.2193502-1-arun.r.murthy@intel.com>
TO: Arun R Murthy <arun.r.murthy@intel.com>
TO: intel-xe@lists.freedesktop.org
TO: intel-gfx@lists.freedesktop.org
CC: Arun R Murthy <arun.r.murthy@intel.com>

Hi Arun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on linus/master v6.12-rc1 next-20241001]
[cannot apply to drm-intel/for-linux-next-fixes drm-tip/drm-tip]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-R-Murthy/drm-i915-dp-Guarantee-a-minimum-HBlank-time/20241001-155536
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
patch link:    https://lore.kernel.org/r/20241001074348.2193502-1-arun.r.murthy%40intel.com
patch subject: [PATCHv2] drm/i915/dp: Guarantee a minimum HBlank time
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-104-20241002 (https://download.01.org/0day-ci/archive/20241002/202410021032.BpJez1ja-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410021032.BpJez1ja-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/i915/display/intel_dp_mst.c:178:32-33: WARNING opportunity for max()
   drivers/gpu/drm/i915/display/intel_dp_mst.c:180:32-33: WARNING opportunity for max()

vim +178 drivers/gpu/drm/i915/display/intel_dp_mst.c

9069b77545ca5a Imre Deak     2023-11-17  158  
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  159  static void intel_dp_mst_compute_min_hblank(struct intel_crtc_state *crtc_state,
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  160  					    struct intel_connector *intel_connector,
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  161  					    int bpp_x16)
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  162  {
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  163  	struct intel_encoder *intel_encoder = intel_connector->encoder;
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  164  	struct intel_dp_mst_encoder *intel_mst = enc_to_mst(intel_encoder);
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  165  	struct intel_dp *intel_dp = &intel_mst->primary->dp;
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  166  	struct intel_display *intel_display = to_intel_display(intel_encoder);
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  167  	const struct drm_display_mode *adjusted_mode =
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  168  					&crtc_state->hw.adjusted_mode;
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  169  	u32 symbol_size = intel_dp_is_uhbr(crtc_state) ? 32 : 8;
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  170  	u32 hblank;
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  171  
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  172  	if (DISPLAY_VER(intel_display) < 20)
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  173  		return;
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  174  
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  175  	/* Calculate min Hblank Link Layer Symbol Cycle Count for 8b/10b MST & 128b/132b */
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  176  	hblank = DIV_ROUND_UP((DIV_ROUND_UP(adjusted_mode->htotal - adjusted_mode->hdisplay, 4) * bpp_x16), symbol_size);
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  177  	if (intel_dp_is_uhbr(crtc_state))
9ffe2a8e0d3097 Arun R Murthy 2024-10-01 @178  		intel_dp->min_hblank = hblank > 5 ? hblank : 5;
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  179  	else
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  180  		intel_dp->min_hblank = hblank > 3 ? hblank : 3;
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  181  }
9ffe2a8e0d3097 Arun R Murthy 2024-10-01  182  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
