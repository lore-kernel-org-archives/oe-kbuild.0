Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE021D5ADE
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 21:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730928820; cv=none; b=iYp07y3yW75pxORqRBXiKUn2hGUHARukPOL4Ot0QbhOujvvIu4thA44nN8XVnVLVyzOBsaSVRPFk8WPfShahxigOsika38Jb+pU1rpiI4ezc+Su56fWCUAHdmcOsregMJUFuQu73+31BLnOMWd2U2zuAoQ1HPZ+4w9TLuZ9CuHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730928820; c=relaxed/simple;
	bh=De0wii4mWTvTRIV88Q7jLoieqVlupjHJUvIJcYdvjzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YH4TnpnVK3I/lGBVW1dXknnO+Xi+sAPD4V5qHSocCVgx3m02vtE4nSjkoMP6M1CtgHeFa+0d5DbAIct9nAeROt3LEvOOuP06kM2p/i1Y+pR48QRNv9xQNzHDBvua3DQqWS8PbWFqx+Ncl+tn90iKAh9g9YQ4A8AeStu3TJePXZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TaPlmUlQ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TaPlmUlQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730928818; x=1762464818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=De0wii4mWTvTRIV88Q7jLoieqVlupjHJUvIJcYdvjzo=;
  b=TaPlmUlQbMF9qWWVj82c2wcvtNWtE1vrstLeMqilwu+dWXz7SwSg2hfq
   +ha8/3/dVsvCzcKjqO+SwzI9nSn6/FwCtYrXGwk91KSGWRpCod+MWgvWm
   4glwve1IrX53mYzoAQyCeeA2iPwYRlAZuL/TWktjQwRo+kF+v7c3BNi0d
   gQhyJbFdR9UEHwNCBqx4GNHhQxxHq79aYNnz3m3g2rLF299p51ZwMucWw
   h+SdrxGGaqkd2wSZnSk3jBpzmE5vhgmbXSAfQEcQEVhprdSpToEbqjx+L
   CE71lpy+lsuuwgjPyfWxAy2VjILmOyXnfavIK63Wc4ziGm+LEGNE2s4oU
   A==;
X-CSE-ConnectionGUID: +XnejOmeQbq+5/HvHhJY8A==
X-CSE-MsgGUID: pdySL/ryQfuOvIo5+ggQxw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53308241"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="53308241"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 13:33:38 -0800
X-CSE-ConnectionGUID: WvIo4MHhSS25uFagJnTyGw==
X-CSE-MsgGUID: xukVUUOpS5OsjMUDEIW7HQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,263,1725346800"; 
   d="scan'208";a="89362287"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2024 13:33:37 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8neh-000pRh-0R;
	Wed, 06 Nov 2024 21:33:35 +0000
Date: Thu, 7 Nov 2024 05:33:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb:
 gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names',
 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202411070530.kgA5EeIi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   c9272c37b2b5aa8d04d7dcdb694b2caaf6b530ca
commit: c95fefb518d78c3a0852393e60d9163c4c54fdd2 [1/1] CHROMIUM: arm64: dts: mt8186: Optimize corsola-magneton dts
:::::: branch date: 9 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241107/202411070530.kgA5EeIi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411070530.kgA5EeIi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411070530.kgA5EeIi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: usb@11280000: #address-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: usb@11280000: #size-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: efuse@11cb0000: Unevaluated properties are not allowed ('calib', 'data1', 'data1-1' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/mediatek,efuse.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: gpu@13040000: 'power_model@0', 'power_model@1', 'supply-names', 'volt-bin-mapping' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: gpu@13040000: sram-supply: False schema does not allow [[129]]
   	from schema $id: http://devicetree.org/schemas/gpu/arm,mali-bifrost.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/gpu@13040000/power_model@0: failed to match any schema with compatible: ['arm,mali-simple-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: /soc/gpu@13040000/power_model@1: failed to match any schema with compatible: ['arm,mali-g52_r1-power-model']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: dpi@1400a000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: dpi@1400a000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: dpi@1400a000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-magneton-sku393218.dtb: clock-controller@15020000: 'mediatek,gce-client-reg' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
