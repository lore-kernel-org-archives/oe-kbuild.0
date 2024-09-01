Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707A016A943
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Sep 2024 14:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725200449; cv=none; b=bG8F8vZk4hbSU54/QxghwZPPo9jT2akWAZR8ZsGPkrvsIj12Nbx8FSP8ihfIWqUUpiSvNLf8V6WhVr4BZ0pNBn/0YMhKkebpsL3X/7pZo+g+u9NBRCeucD2wffGhxS+N3Ns2rugPU/8w+QXcRhBv2LEVsiiKEOIzQ7VxHFZ9dLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725200449; c=relaxed/simple;
	bh=ZWzTxt58TbnBS58aRf6SYzQ/HWHYxTTmAPxCKpPIoco=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d6CQJK0rpK6KRYsg0DxINDE0jUsOW5UYqHSS9p92inPFACPhWnm5kHd+QKpHEABoSNY4CZv7ubRbVx1lgXiPz+SKx0Z8DE0SStGys7ED1XiqaUi7+7KTJ7sn5PS8eWhFr5EGNS2UGfWm8tC9y8rd6E1y6hf/m7IPjN/IodjtXJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOrGQ+mv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOrGQ+mv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725200448; x=1756736448;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ZWzTxt58TbnBS58aRf6SYzQ/HWHYxTTmAPxCKpPIoco=;
  b=DOrGQ+mv6YTsq4akxbz/6dKkngZTuWhh9bh18ue6/0A2ohSDhokKSB3W
   D0cVT8JqR/5RWcEGXklgVIDOEbHBvAqBnluDJKkvor0dQHPC1i69C4POP
   fkJ8sIIAYwkQEm+t603UsG98UYsOAk+eIXYKWcNZ7Dh6UIXpWbIJ8Obmx
   PxVQFK/ef/2YdlYzmqTT43u3TfdbQtanlj99M7c/mo7fGjdPEo2vv6x7Z
   p+PRjnWtdrNeQ/7guOYAN/SoQ+5K4ZrJFB2jn9lDSrRXYeG5h31+9L05s
   WNCyXd6lD66UmVc46VBJ1YJ/KoUZ8ol7AN7XcE40aWWOiasULZBhvNLmo
   A==;
X-CSE-ConnectionGUID: z2OWpHttQMSuqy+EMRxRow==
X-CSE-MsgGUID: rDtnO8n5R46yq3ggb90ruA==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="41266547"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="41266547"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 07:20:47 -0700
X-CSE-ConnectionGUID: H1xz5H7XTami5vgpG7OenQ==
X-CSE-MsgGUID: exKeMsHeRPiwlF8UeBaQiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="65090717"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 01 Sep 2024 07:20:46 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sklRb-0003iQ-2L;
	Sun, 01 Sep 2024 14:20:43 +0000
Date: Sun, 1 Sep 2024 22:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/omapdrm/dss/dss.o: warning: objtool:
 dss_select_dsi_clk_source+0x44: unreachable instruction
Message-ID: <202409012211.K5hxV5D4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   431c1646e1f86b949fa3685efc50b660a364c2b6
commit: dc6fcaaba5a5411237d042a26c4d46689f3346bb drm/omap: Allow build with COMPILE_TEST=y
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-002-20240829 (https://download.01.org/0day-ci/archive/20240901/202409012211.K5hxV5D4-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409012211.K5hxV5D4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409012211.K5hxV5D4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/omapdrm/dss/dss.o: warning: objtool: dss_select_dsi_clk_source+0x44: unreachable instruction
--
>> drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: dispc_ovl_set_color_mode+0x13c: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_DIVISORo+0x2c: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_BA0_UV_OFFSET+0x34: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_BA1_UV_OFFSET+0x34: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_PIC_SIZE_OFFSET+0x30: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_FIR_COEF_H_OFFSET+0x20: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_FIR_COEF_HV_OFFSET+0x20: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_FIR_COEF_H2_OFFSET+0x28: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_FIR_COEF_HV2_OFFSET+0x38: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_FIR_COEF_V_OFFSET+0x24: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_FIR_COEF_V2_OFFSET+0x28: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: dispc_ovl_set_scale_coef+0x374: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_FIR_OFFSET+0x30: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_FIR2_OFFSET+0x34: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_ACCU0_OFFSET+0x30: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_ACCU1_OFFSET+0x30: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_ACCU2_0_OFFSET+0x34: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_ACCU2_1_OFFSET+0x34: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_ATTR2_OFFSET+0x34: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_CONV_COEF_OFFSET+0x14: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_CPR_COEF_R+0x2c: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_CPR_COEF_G+0x2c: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_CPR_COEF_B+0x2c: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_TIMING_H+0x2c: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_TIMING_V+0x2c: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_POL_FREQ+0x2c: unreachable instruction
>> drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_DATA_CYCLE1+0x2c: unreachable instruction
>> drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_DATA_CYCLE2+0x2c: unreachable instruction
>> drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: DISPC_DATA_CYCLE3+0x2c: unreachable instruction
>> drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: dispc_ovl_set_channel_out+0x124: unreachable instruction
   drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: dispc_mgr_set_clock_div+0xd4: unreachable instruction
>> drivers/gpu/drm/omapdrm/dss/dispc.o: warning: objtool: dispc_mgr_set_lcd_config+0x134: unreachable instruction


objdump-func vmlinux.o dss_select_dsi_clk_source:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
