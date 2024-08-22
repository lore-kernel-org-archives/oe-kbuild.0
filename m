Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E3B16A955
	for <oe-kbuild@lists.linux.dev>; Thu, 22 Aug 2024 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724315763; cv=none; b=RG3d4B2pySn9oIDSkSM5SaiV9RYvmzMXRSBSbdlA3EUwwkwK95e14n2sp2zLh5hMLy6bxRWvtnGUCajH3lJqd7U6NuiNsnUyEHeJVeSrKwu+ZgBk0ANIgHjVK1jsmGxH26LTD5geNAbclqvE6OaV/+8cMfnjg/UZdEYgG706b3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724315763; c=relaxed/simple;
	bh=k/fYexF5sIh+5VlyFRdB1SoOKjAUlMqkKTcszgOzv94=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WUFlkHkWoVoPg1oyO4ZX+57tp4x0foTAXgN5cVrajqzKZOIR/ZNKFLgqwb9TouDCrGvA4NMYqL/O+i9y4z6B5gRMH001aXXG/YCoC00OcOjJVhoY08wt6uNrIyB0zl9bnsOjtesWKw2Mtw0eTwbz4IotUWmN0bcLtfLiafuFDTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDt5iweP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDt5iweP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724315763; x=1755851763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k/fYexF5sIh+5VlyFRdB1SoOKjAUlMqkKTcszgOzv94=;
  b=eDt5iwePWvA9QOmgm0HqDKK7iZf8p2U5DSIJ9poKwynUX0VDu8b7b9vg
   n0nmXSlapxAvE7WxHp3IpM1HTnUEhJVhpGG6jtlxUPKWHqMkSPYpBqCaH
   Hs83lJOBif/0C/56iXKu0bjAlJjH2w5pLtKd/nT8cp7iX1FNKRIJhd0av
   Lzi1LXw+Is1v1GJfZ0LBeHexWZGcDg4Cw3GoLCgKkVVp2z9wBSxXkZ/48
   JkD+W2X8ySnG+EQhIEOv2plTDG10fe3GcIzwqoEmVpXSZ8yQyz4ZO/8L0
   rUseU5oun5pHo+WrHgcUHbfyaofkxC018DfnpICMGsFpzD9xM6Bjn6P9P
   g==;
X-CSE-ConnectionGUID: zzzdhgY+SKe+hIwKfNj3Ng==
X-CSE-MsgGUID: bQzHXTmyQ6OYZ0EbXMEKGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33283526"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="33283526"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 01:36:01 -0700
X-CSE-ConnectionGUID: SQIhN+jFRR+CM3i9Yhe4Ow==
X-CSE-MsgGUID: jKesnYx4RgS1Zm7MznHX0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; 
   d="scan'208";a="61905683"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Aug 2024 01:35:58 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sh3IS-000Cbc-1V;
	Thu, 22 Aug 2024 08:35:56 +0000
Date: Thu, 22 Aug 2024 16:35:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 42/44] drm/colorop: Add 3D LUT supports to color
 pipeline
Message-ID: <202408221615.ken4OMsX-lkp@intel.com>
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
In-Reply-To: <20240819205714.316380-43-harry.wentland@amd.com>
References: <20240819205714.316380-43-harry.wentland@amd.com>
TO: Harry Wentland <harry.wentland@amd.com>
TO: dri-devel@lists.freedesktop.org
TO: amd-gfx@lists.freedesktop.org
CC: wayland-devel@lists.freedesktop.org
CC: Alex Hung <alex.hung@amd.com>

Hi Harry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.11-rc4 next-20240821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Harry-Wentland/drm-Add-helper-for-conversion-from-signed-magnitude/20240820-050138
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20240819205714.316380-43-harry.wentland%40amd.com
patch subject: [PATCH v5 42/44] drm/colorop: Add 3D LUT supports to color pipeline
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240821 (https://download.01.org/0day-ci/archive/20240822/202408221615.ken4OMsX-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408221615.ken4OMsX-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_atomic.c:817 drm_atomic_colorop_print_state() warn: variable dereferenced before check 'modes' (see line 815)

vim +/modes +817 drivers/gpu/drm/drm_atomic.c

5e743737421fe9 Rob Clark      2014-12-18  782  
6d584b5f17e967 Harry Wentland 2024-08-19  783  
6d584b5f17e967 Harry Wentland 2024-08-19  784  
6d584b5f17e967 Harry Wentland 2024-08-19  785  static void drm_atomic_colorop_print_state(struct drm_printer *p,
6d584b5f17e967 Harry Wentland 2024-08-19  786  		const struct drm_colorop_state *state)
6d584b5f17e967 Harry Wentland 2024-08-19  787  {
6d584b5f17e967 Harry Wentland 2024-08-19  788  	struct drm_colorop *colorop = state->colorop;
48b66caa355336 Alex Hung      2024-08-19  789  	struct drm_property_blob *modes = state->lut_3d_modes;
48b66caa355336 Alex Hung      2024-08-19  790  	struct drm_mode_3dlut_mode *mode_3dlut;
48b66caa355336 Alex Hung      2024-08-19  791  	int i;
6d584b5f17e967 Harry Wentland 2024-08-19  792  
6d584b5f17e967 Harry Wentland 2024-08-19  793  	drm_printf(p, "colorop[%u]:\n", colorop->base.id);
6d584b5f17e967 Harry Wentland 2024-08-19  794  	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
88610a6515e42a Harry Wentland 2024-08-19  795  	if (colorop->bypass_property)
6d584b5f17e967 Harry Wentland 2024-08-19  796  		drm_printf(p, "\tbypass=%u\n", state->bypass);
cde5ad4dd86192 Harry Wentland 2024-08-19  797  
cde5ad4dd86192 Harry Wentland 2024-08-19  798  	switch (colorop->type) {
cde5ad4dd86192 Harry Wentland 2024-08-19  799  	case DRM_COLOROP_1D_CURVE:
cde5ad4dd86192 Harry Wentland 2024-08-19  800  		drm_printf(p, "\tcurve_1d_type=%s\n",
cde5ad4dd86192 Harry Wentland 2024-08-19  801  			   drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
cde5ad4dd86192 Harry Wentland 2024-08-19  802  		break;
c663fe3c8829d8 Alex Hung      2024-08-19  803  	case DRM_COLOROP_1D_LUT:
c663fe3c8829d8 Alex Hung      2024-08-19  804  		drm_printf(p, "\tsize=%d\n", state->size);
6c299c88d2871a Harry Wentland 2024-08-19  805  		drm_printf(p, "\tinterpolation=%s\n", drm_get_colorop_lut1d_interpolation_name(colorop->lut1d_interpolation));
c663fe3c8829d8 Alex Hung      2024-08-19  806  		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
c663fe3c8829d8 Alex Hung      2024-08-19  807  		break;
cde5ad4dd86192 Harry Wentland 2024-08-19  808  	case DRM_COLOROP_CTM_3X4:
cde5ad4dd86192 Harry Wentland 2024-08-19  809  		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
cde5ad4dd86192 Harry Wentland 2024-08-19  810  		break;
e67bbefa7a1a9e Alex Hung      2024-08-19  811  	case DRM_COLOROP_MULTIPLIER:
e67bbefa7a1a9e Alex Hung      2024-08-19  812  		drm_printf(p, "\tmultiplier=%llu\n", state->multiplier);
e67bbefa7a1a9e Alex Hung      2024-08-19  813  		break;
48b66caa355336 Alex Hung      2024-08-19  814  	case DRM_COLOROP_3D_LUT:
48b66caa355336 Alex Hung      2024-08-19 @815  		mode_3dlut = (struct drm_mode_3dlut_mode *) modes->data;
48b66caa355336 Alex Hung      2024-08-19  816  
48b66caa355336 Alex Hung      2024-08-19 @817  		drm_printf(p, "\tlut_3d_modes blob id=%d\n", modes ? modes->base.id : 0);
48b66caa355336 Alex Hung      2024-08-19  818  		for (i = 0; i < modes->length / sizeof(struct drm_mode_3dlut_mode); i++) {
48b66caa355336 Alex Hung      2024-08-19  819  			drm_printf(p, "\t  lut_size=%d\n", mode_3dlut[i].lut_size);
48b66caa355336 Alex Hung      2024-08-19  820  			drm_printf(p, "\t  lut_strides=%d %d %d\n", mode_3dlut[i].lut_stride[0],
48b66caa355336 Alex Hung      2024-08-19  821  								    mode_3dlut[i].lut_stride[1],
48b66caa355336 Alex Hung      2024-08-19  822  								    mode_3dlut[i].lut_stride[2]);
48b66caa355336 Alex Hung      2024-08-19  823  			drm_printf(p, "\t  interpolation=%s\n",
48b66caa355336 Alex Hung      2024-08-19  824  				   drm_get_colorop_lut3d_interpolation_name(mode_3dlut[i].interpolation));
48b66caa355336 Alex Hung      2024-08-19  825  			drm_printf(p, "\t  color_depth=%d\n", mode_3dlut[i].color_depth);
48b66caa355336 Alex Hung      2024-08-19  826  			drm_printf(p, "\t  color_format=%X\n", mode_3dlut[i].color_format);
48b66caa355336 Alex Hung      2024-08-19  827  			drm_printf(p, "\t  traversal_order=%X\n", mode_3dlut[i].traversal_order);
48b66caa355336 Alex Hung      2024-08-19  828  		}
48b66caa355336 Alex Hung      2024-08-19  829  		drm_printf(p, "\tlut_3d_mode_index=%d\n", state->lut_3d_mode_index);
48b66caa355336 Alex Hung      2024-08-19  830  		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
48b66caa355336 Alex Hung      2024-08-19  831  		break;
cde5ad4dd86192 Harry Wentland 2024-08-19  832  	default:
cde5ad4dd86192 Harry Wentland 2024-08-19  833  		break;
cde5ad4dd86192 Harry Wentland 2024-08-19  834  	}
cde5ad4dd86192 Harry Wentland 2024-08-19  835  
c7d69705679798 Harry Wentland 2024-08-19  836  	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
6d584b5f17e967 Harry Wentland 2024-08-19  837  }
6d584b5f17e967 Harry Wentland 2024-08-19  838  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
