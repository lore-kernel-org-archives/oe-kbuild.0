Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBE2ED8
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Jul 2024 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721229921; cv=none; b=P+fbpxlbIgEATv3SNT0WqPVIohK76zntpruGq1ukOQnRPqerY2hJIFfj0HKQ2MO/TXTjXeW3APtT3hvAnIPJQvjXWZHXR1gdsBD6PutVbG54jCBW4lHxDyDizcV5tcDrDg6OD4AWlfrwCpF/aokQ0VxevSOZ1tQtG/Kqg+ctg9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721229921; c=relaxed/simple;
	bh=jPDuouD2pu66ZprpgHWwjFt29OlcRo2kapZ1JSmh1iI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UU0bPXvNXCz5xrixxSGJtO85r0aR2ucMTY6xks/8ZrySovIX/POxuVZ8QKb8J6ofz29C+85pBDvFDkAl797UPQBak3/9W2uu/N4XCrOvNA9nkmkHMlYXtB/zJbnmsFKrxi+5pSmNclCS3wyNXMuMUqu4npIItNiee21Z2HKt9eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R46xiTv0; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R46xiTv0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721229918; x=1752765918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jPDuouD2pu66ZprpgHWwjFt29OlcRo2kapZ1JSmh1iI=;
  b=R46xiTv0WWoHV2JAuZHdBJEK7OL733KgxBy3ma4JhfeZ3/lNagmUFq7d
   hWITp4UfmAMm5sxfcsVj8kIYOj3xMD7yDzVJXBp1hWGKvpFVEcXhZD7AH
   2lsyHDIzl6TayBC9QaAVaHNMCSdOopyhK2c7MuYjT7WycL+lBp0/ZANFx
   Hm8152798AkFO0EPIrBY1mkZFTitle+ZhkREQBKaHqaDc/d+zEsymB1o9
   hnV17QopCOnaoc77WFQmplHPv+/DrNXxMvL2+EzgG8swhYs5cvHiyDiJe
   vd10sBSGS0ZSN3P0zZndT/8BMqYDykAvrNlYiPzO44T7HYuGxxs+iUeYD
   g==;
X-CSE-ConnectionGUID: M9fmx8KrRPOLffI60rz1FQ==
X-CSE-MsgGUID: 7p25lxalSGSNiiUPCHEy1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="18695091"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="18695091"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2024 08:25:18 -0700
X-CSE-ConnectionGUID: AzQkap7wT/uD8iykw95asw==
X-CSE-MsgGUID: Pnt5sZubTEy+WNwvlDBeJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; 
   d="scan'208";a="50378769"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2024 08:25:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sU6Wo-000gQz-2z;
	Wed, 17 Jul 2024 15:25:14 +0000
Date: Wed, 17 Jul 2024 23:24:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.1.y 14/91]
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fd000000: Unevaluated
 properties are not allowed ('power-domains' was unexpected)
Message-ID: <202407172352.WLHY80vy-lkp@intel.com>
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

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   33e59e3417fd2b46d422206b92040e1fe5b6c38d
commit: af52052e79e286b72d81618e6bc9ea37cb2ec2fb [14/91] arm64: dts: rockchip: Add Hardkernel ODROID-M1 board
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 6 months ago
config: arm64-randconfig-051-20240717 (https://download.01.org/0day-ci/archive/20240717/202407172352.WLHY80vy-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240717/202407172352.WLHY80vy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407172352.WLHY80vy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: sata@fc800000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/snps,dwc-ahci.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fcc00000: Unevaluated properties are not allowed ('extcon', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fcc00000: Unevaluated properties are not allowed ('extcon', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fcc00000: Unevaluated properties are not allowed ('dr_mode', 'extcon', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fd000000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fd000000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb@fd000000: Unevaluated properties are not allowed ('dr_mode', 'phy-names', 'phy_type', 'phys', 'snps,dis_u2_susphy_quirk' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /i2c@fdd40000/regulator@1c: failed to match any schema with compatible: ['tcs,tcs4525']
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: pmic@20: '#sound-dai-cells', 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks', 'codec' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/rockchip,rk809.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: video-codec@fdea0400: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: usb2phy@fe8a0000: otg-port: 'vbus-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/phy-rockchip-inno-usb2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: ethernet@fe2a0000: Unevaluated properties are not allowed ('rx-queues-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
