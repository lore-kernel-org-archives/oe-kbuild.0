Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB95622AE75
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 08:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752913493; cv=none; b=puVoMY1hDvoJD49tjeb5vPXIz1H7tuujQIyM/yVLXTblNX9MPVvoFS+f18Ur5lN467gjW0LT84Ixfs8fj/s8kXZXNrTE+Ed+nFMEq8RKFd9g1bzQQzAuSK86G1uje6sZ67nufs+pNUUtVWI5CWY7OAYlSboHxG7o74mjgdIu8tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752913493; c=relaxed/simple;
	bh=2eUaueEp3qjW8Suw+8a4LMlF44Vnf0iwd+uQLGRZq14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O/Hjvngd2SBKWxe1xsJ4kavXT/v/9UyhXI/raue1mnFxkE6fUV420F+H0OjCQhT2zo5JJl0qklgX4YUbFdgE/eGswYOdADiZ1RN5NUoXwquJEf2n0xfvUs7ka2dAdpefcS9mWNPW+L/BiCPONkxVix9n/TbmforPDYzh+u30TU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yxmf51aP; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yxmf51aP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752913490; x=1784449490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2eUaueEp3qjW8Suw+8a4LMlF44Vnf0iwd+uQLGRZq14=;
  b=Yxmf51aPlN+9MiDpeovkyXCsTzWmN1+o9oTVYr9LkFkpr7n6GBJw8NJc
   idX86eRVWL0o4iJUD2wVHlkAPxcm8KUBaDEsPL4rBkDRSL1kP0MKTRGB/
   WQb6grcld8AvTvpxKXeK5wlCyLG9dwjtaTdvwvEbmaEq6Q+3snK2HQb2V
   f6LeS6n8I3pbuY/B1OmK/MEbv4ObFwPyTlbRblNBGtXFBpntkNByPx783
   kB20QgHbzy7CwhdPVTzikg1jHcXfkgWPgyCmxS0CWBy6yOIEeVBSsOMtU
   wb+RAB3vxPikwoXZ81e+Zj4PNulWTFLXZAyPMhC63uYPWiuMGpLdb2tNX
   g==;
X-CSE-ConnectionGUID: hkyIq9i9RmCe7mcB5wV2Kg==
X-CSE-MsgGUID: Ra/ZGLT6StyjpFtVZIfcIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="80644790"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="80644790"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 01:24:50 -0700
X-CSE-ConnectionGUID: B+PXg0wvQAS5daxoJFDyNw==
X-CSE-MsgGUID: j1M9r4eZQhGkt8fOvaQuXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="163920384"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Jul 2025 01:24:49 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud2sA-000FLD-2e;
	Sat, 19 Jul 2025 08:24:46 +0000
Date: Sat, 19 Jul 2025 16:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:n/dt-bindings-qcom-naming 7/7]
 arch/arm/boot/dts/ti/omap/omap4-sdp.dtb:
 /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/ethernet@0:
 failed to match any schema with compatible: ['ks8851']
Message-ID: <202507191604.qaCyUj2P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux n/dt-bindings-qcom-naming
head:   cc9ec12e51d6cceb1dda0566a4bb50057effe437
commit: cc9ec12e51d6cceb1dda0566a4bb50057effe437 [7/7] ARM: dts: ti: omap4: Use generic "ethernet" as node name
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-052-20250718 (https://download.01.org/0day-ci/archive/20250719/202507191604.qaCyUj2P-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507191604.qaCyUj2P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507191604.qaCyUj2P-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/ethernet@0: failed to match any schema with compatible: ['ks8851']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
--
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@60000/i2c@0/bh1780@29: failed to match any schema with compatible: ['rohm,bh1780']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/ethernet@0: failed to match any schema with compatible: ['ks8851']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-sdp-es23plus.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/ethernet@0: failed to match any schema with compatible: ['ks8851']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-dvk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
--
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: tsc2004@48 (ti,tsc2004): $nodename:0: 'tsc2004@48' does not match '^touchscreen(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2005.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: twl@48 (ti,twl6030): Unevaluated properties are not allowed ('pwm', 'pwmled', 'usb-comparator' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,twl.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/usb-comparator: failed to match any schema with compatible: ['ti,twl6030-usb']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwm: failed to match any schema with compatible: ['ti,twl6030-pwm']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@48/pwmled: failed to match any schema with compatible: ['ti,twl6030-pwmled']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@70000/i2c@0/twl@4b: failed to match any schema with compatible: ['ti,twl6040']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@96000/mcbsp@0: failed to match any schema with compatible: ['ti,omap4-mcbsp']
>> arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@98000/spi@0/ethernet@0: failed to match any schema with compatible: ['ks8851']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@9c000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: des@0 (ti,omap4-des): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: des@0 (ti,omap4-des): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/ti,omap4-des.yaml#
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@ad000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@b2000/1w@0: failed to match any schema with compatible: ['ti,omap3-1w']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@b4000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@d1000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']
   arch/arm/boot/dts/ti/omap/omap4-var-stk-om44.dtb: /ocp/interconnect@48000000/segment@0/target-module@d5000/mmc@0: failed to match any schema with compatible: ['ti,omap4-hsmmc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
