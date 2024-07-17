Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C55181302
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Jul 2024 14:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721225538; cv=none; b=eJ4YgJuMUoj7XJ7NGNUgd4Z8Khth26P+qVfg3YdLyE/kcFhnOPRHicfSpxoin0vfSEAqfQj72g4wWaaJIZIeu+QJXDZGF9uQbrVn2MqyxIIEDjat3UpHGsqMoxGydbKhhgaaUHDW4HTEY+Wyx6FSkFySccZU05AuuP4CnrdqZv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721225538; c=relaxed/simple;
	bh=/sNMp2lDRwJ2JQqtUcMD3rN+Zu3keBcj8OsU7BMUKNg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KWMxwTxIe7Q94FYlJlEBvyB+INTuxiF1Sjxdo8C5aHXa9xPHu6JpTFLAQqbIwDDlryjaAD9q6ojWppMXvvBG840gBS6qPYRl82Ng30Ou+ylD1+kSGcU6O44fP8ZizgUfe/tb+FDPIoTncQeyb/OKB6eEyHcyfnTuKGo3S1gA14o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VB7nz2oP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VB7nz2oP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721225536; x=1752761536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/sNMp2lDRwJ2JQqtUcMD3rN+Zu3keBcj8OsU7BMUKNg=;
  b=VB7nz2oP+Ml6CKNL2XofliIt4rDeKt1e0GhKvQsVu78J5YItM1mxH1nI
   fN8EyBlfipmwE6DEgZT7dHalb2DFyazvPbTDtbV+8Jp7mqT3yZu/s4R5O
   cX4w+NVPDFnMHeId1tJ0t6aoPz0OMC+8MSgqP3cUOgzeCoEJqFV4pp4Dr
   j+he3gkM+QXNYDPLCrVE/p1ee1tEXh1tHXOlIeFOCddOx5VzpfxGPngPa
   cqMiFN6QhPgb1t2tUmJhNmTTQ7IOKc88cvQjxj9ZV4zJ9amcwA54fxeRH
   b/RXAYPJl3W6fRSMZW0qCIgELucFNWq5XJp6LI94A2wPGobZWdhtPn6ni
   A==;
X-CSE-ConnectionGUID: 6ddIeMtNQvGTMFXOC/ka4Q==
X-CSE-MsgGUID: Ntaxw1cTSoefzwdlWNlt7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18869666"
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="18869666"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 07:12:15 -0700
X-CSE-ConnectionGUID: T4d3xd7xSWuZ+HbSO9tXyA==
X-CSE-MsgGUID: OIXhadV7R6CRnQkh53o7Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,214,1716274800"; 
   d="scan'208";a="50460367"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jul 2024 07:12:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU5O8-000gNG-1W;
	Wed, 17 Jul 2024 14:12:12 +0000
Date: Wed, 17 Jul 2024 22:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.6.y 47/74]
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: /: compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202407172205.TkaTYXhh-lkp@intel.com>
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
commit: c00978529119701b9f4401a706df1448fcba2228 [47/74] ODROID-M1S: arm64: dts: rockchip: Add Hardkernel's ODROID-M1S board
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-051-20240717 (https://download.01.org/0day-ci/archive/20240717/202407172205.TkaTYXhh-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407172205.TkaTYXhh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407172205.TkaTYXhh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3566-odroid-m1s', 'rockchip,rk3566'] is too short
   	'vamrs,ficus' was expected
   	'vamrs,rock960' was expected
   	'amarula,vyasa-rk3288' was expected
   	'anbernic,rg351m' was expected
   	'anbernic,rg353p' was expected
   	'anbernic,rg353ps' was expected
   	'anbernic,rg353v' was expected
   	'anbernic,rg353vs' was expected
   	'anbernic,rg503' was expected
--
   	'vamrs,rk3288-vmarc-som' was expected
   	'vamrs,rk3399pro-vmarc-som' was expected
   	'rockchip,rk3036' was expected
   	'rockchip,px3' was expected
   	'rockchip,px30' was expected
   	'rockchip,px5' was expected
   	'rockchip,rk3128' was expected
   	'rockchip,rk3228' was expected
   	'rockchip,rk3318' was expected
   	from schema $id: http://devicetree.org/schemas/arm/rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: /: failed to match any schema with compatible: ['rockchip,rk3566-odroid-m1s', 'rockchip,rk3566']
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: tcs4525@1c: Unevaluated properties are not allowed ('regulator-compatible', 'regulator-init-microvolt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: pmic@20: '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk809.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: video-codec@fdea0400: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: i2s@fe410000: Unevaluated properties are not allowed ('rockchip,clk-trcm' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.yaml#
   arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: i2s@fe420000: reset-names:0: 'm' is not one of ['tx-m', 'rx-m']
   	from schema $id: http://devicetree.org/schemas/sound/rockchip,i2s-tdm.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: phy@fe830000: 'phy-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-naneng-combphy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: usb2phy@fe8a0000: otg-port: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: leds: 'blue', 'red' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
