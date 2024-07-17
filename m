Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3909187325
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Jul 2024 21:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721250581; cv=none; b=Z/OX22NwfkmNAHy5w33A4BL0JTLh6lzjRYjcg2hvtgyPe4BeIlOOWhsALYDtxVH0QTDFwfJBeNN/4SOQiX176DGvUmBsdPCfixuW3ZhnUmJanS21XZZ6m1p7VxmG2y0ekTBqEkSOUwRmtM8T3ACQ4H4fhhpC1gKYMsJRu2uHq/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721250581; c=relaxed/simple;
	bh=1886F/ToDI06i/gs1vlBVkbvIEng1UZHrrjXHnxA5Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MFRXB74AcxHfue2/ylZLQDrGx8EWfm5pp8YYSe4ZhC5MF3uaucAJl2UqfLGdqc6Zuq6myDJ8OPZO4ZY0fv9gHne3cw7U4D4GiyrktN0o2k+6QvmYvGVYY8D7iT4WNgWMNPDy22tVc2xwgENuRCQVFa+HkC+156Sfs4VaKF6dWkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FLOLDjNr; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FLOLDjNr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721250579; x=1752786579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1886F/ToDI06i/gs1vlBVkbvIEng1UZHrrjXHnxA5Zw=;
  b=FLOLDjNrOoNWjwrDPz9jhB75KRd1FVrpJdOGlNnJaMgPshnUt7MXeq6i
   NczFtyM6pzMivf7/QLAsu042OQ4u+FlxcBUiz4fbu1Pj8SfVtLE6oiGAw
   b5e/a6kil3iCcs3TufZi9B6vDaAYg+Wjcawh9KVrCgkWWnoolgQ/1EOJ9
   S2DE/cpu/VGUzTGIask4GwRxnMH6A5R6eLigvRPEryRccGE5PUTbLLh/g
   syaxlw7yOwuGLUmaEwTb71rgEHzaQOtbYm8PTDoc2MVJp0MjxH7f/kiB2
   AR5j17WV0msGJPIVk/gBS20zCCJOmuow+dESFfcgu1eslhs8G8qVuH21s
   w==;
X-CSE-ConnectionGUID: xFL9nR6jR6OuEP+69XpHUQ==
X-CSE-MsgGUID: m+xJy/XTTE2GLY5BcgnEsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="12596131"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="12596131"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 14:09:38 -0700
X-CSE-ConnectionGUID: 2IZwGsslTZmZ/O5YW27yMQ==
X-CSE-MsgGUID: T8N0Z4O8SxepSc+Rz40hyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="81562604"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jul 2024 14:09:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUBu3-000gfm-1t;
	Wed, 17 Jul 2024 21:09:35 +0000
Date: Thu, 18 Jul 2024 05:09:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 49/74]
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: lcd: lcd-rst-gpio:
 {'rockchip,pins': [[2, 22, 0, 189]], 'phandle': 91} is not of type 'array'
Message-ID: <202407180546.T6CUE47s-lkp@intel.com>
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
TO: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   fdb4709395deb4bfd668475eec2c0d482f12e1e1
commit: 80809145e0b3da448b457a4048c7dcad0a4d24da [49/74] ODROID-M1S: arm64/dts: add support MIPI interface with touch screen
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-051-20240717 (https://download.01.org/0day-ci/archive/20240718/202407180546.T6CUE47s-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240718/202407180546.T6CUE47s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407180546.T6CUE47s-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: i2s@fe410000: Unevaluated properties are not allowed ('rockchip,clk-trcm' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: phy@fe830000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-naneng-combphy.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: usb2phy@fe8a0000: otg-port: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: lcd: lcd-rst-gpio: {'rockchip,pins': [[2, 22, 0, 189]], 'phandle': 91} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: lcd: touch-gpios: {'rockchip,pins': [[4, 10, 0, 191], [0, 20, 0, 191]], 'phandle': 133} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: leds: 'blue', 'red' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
