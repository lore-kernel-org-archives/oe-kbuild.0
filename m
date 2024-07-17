Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DE5183083
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Jul 2024 17:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721236707; cv=none; b=ky+M8kbqJTye84qCkRDWIUfMer8YU5nOIwnEQbzhwwIIm8dE7CxGmmW7O/dxJpFV9LPXggGNhoa8VWB6mB6YXzzLc3F9ICjiNbkk6W/ksqJjWUXh5xW/lxvKQrkFlK6KJA7b4ERGUFf4xcwyV1TADEUXoaJNx0RgPjU91O3A24M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721236707; c=relaxed/simple;
	bh=3vP1kyv4aYssEqkQiOHN0q9nxReJ5Yo35fM+JhmiSpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c5xqsXovrK3wHMgBe/7zyxOpgreUpHGXL43czGUNfhQr/V5Yzbny/6n+IIWN+BfKt7c+Iyujb3xyjYcCZj3fTeYCw5E02YTc8Rh0P2Q7NMKO/vt7/Okbck1+AOYYlNtW5h4Jr1mgLBLYg4gGupe/nYJJQgl5nk9IYOOnO4ZCOmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ji0LUUlg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ji0LUUlg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721236705; x=1752772705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3vP1kyv4aYssEqkQiOHN0q9nxReJ5Yo35fM+JhmiSpQ=;
  b=ji0LUUlgTByDhxpbD75oz+TMVGLWc1TmuHM0mkvkAuwG/pEwCQjz0MVl
   Ez4Nhd7p21ffhHflw/c11ngXb1PG1DIC8pPtK/oFn5/uvUAa1XDL8VAtT
   NMHl1xwDhCNe9mqkGAJitLD+p/HQcisO9xMVryt611LfT3pxXysF9dJKD
   7qpKT+PnEZIjagMIVyUYxXvcWfT9qTRN2OoHzFQk8b1o2PyCJ/eI0Q2tf
   fsLXjIPG6SZSZuQvTjEBfHTzy7PTHjYJOrd1l3pTgakWNnQGIlIDMqY0d
   3mjPu+gDRi3jGmJy1I3RCL4AwRsrbJKbWpQfHHFOJ327iszJMFj84otdQ
   Q==;
X-CSE-ConnectionGUID: pWNRfcPfTTi3iKU1YeTs/w==
X-CSE-MsgGUID: 9t6oNoTFTc+XDvo+ldMI2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18372755"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="18372755"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 10:18:24 -0700
X-CSE-ConnectionGUID: Up/uLmTLQC6sO6+dPbusjQ==
X-CSE-MsgGUID: oimXXHHkSb+drcyf3BVURg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="50786783"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jul 2024 10:18:23 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU8IH-000gXW-0x;
	Wed, 17 Jul 2024 17:18:21 +0000
Date: Thu, 18 Jul 2024 01:18:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 48/74]
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: pmic@20:
 '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks',
 'clock-names', 'clocks', 'codec' do not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202407180139.AwgtxPuL-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: ckkim <changkon12@gmail.com>
CC: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   fdb4709395deb4bfd668475eec2c0d482f12e1e1
commit: cde511105ecc0476398434a06b2bf08f4c3a9ddb [48/74] ODROID-M1S: arm64/dts: add rk809 audio codec support
:::::: branch date: 13 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-051-20240717 (https://download.01.org/0day-ci/archive/20240718/202407180139.AwgtxPuL-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180139.AwgtxPuL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407180139.AwgtxPuL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'rockchip,px3' was expected
   	'rockchip,px30' was expected
   	'rockchip,px5' was expected
   	'rockchip,rk3128' was expected
   	'rockchip,rk3228' was expected
   	'rockchip,rk3318' was expected
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: /: failed to match any schema with compatible: ['rockchip,rk3566-odroid-m1s', 'rockchip,rk3566']
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: tcs4525@1c: Unevaluated properties are not allowed ('regulator-compatible', 'regulator-init-microvolt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: pmic@20: '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks', 'codec' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk809.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: video-codec@fdea0400: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: i2s@fe410000: Unevaluated properties are not allowed ('rockchip,clk-trcm' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: phy@fe830000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
