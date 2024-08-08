Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6A11F19A
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Aug 2024 22:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723155469; cv=none; b=QUd2riDyVpkpPNydQ/r1qUNemizsVQyXEBySf8XJvrsd5BWocUXNrXwkb9qOoGT8liNel3Vr88n1v2xv3diPPdtxANzFDNMJ5WPHPBlH22KO3QOkrK/X7J+L6fHwGSs/Y+OzUDOWwMbz6w64qbkuARi71/LZa3RfjA6qb5ePuBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723155469; c=relaxed/simple;
	bh=+otKReWZxv85M0B7/J8x4L2H6Zb91rnWpQb/dUMGu3M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gkOiQLQuSlNdzG8d2XeJ+DbGWbJSkZPepBMVClrfKuRdQRMzXC8AYcu4Tn0vkQPhSEWaMVp/Gw2mQC6ExjbgWf4Q6I/SchkLggM9O8oFwwfZwifLjoN3cjNkZF7oRYswlKkZ773PhpFPXU1IoHmT5QR2EVBTUXd9kqDHspMs770=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPZYKH1c; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPZYKH1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723155467; x=1754691467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+otKReWZxv85M0B7/J8x4L2H6Zb91rnWpQb/dUMGu3M=;
  b=SPZYKH1cdk432H3H3bvEsxEwZDqiusHAZljwpk3h6uJxjHr8hHCZ1ix/
   6jtHh2CUrKzjv5Ibck1lbMPhB26wprb20hzJl/UPR+aRdk1HaP6f2y6In
   hy4l9D2x/7lHGxdcieCiYRSHmmI5289zwBEhAUjKQeq19eLx0sqYz/+r6
   bwd86x9sEJNc7p9C4jh4Ay3buMcrFZ4UB66k3F/54C0w6cNs+nuyMz0Kd
   NsCXLYxTo1aWuoThlMkjtj16qe93364yIOn8IZ2D1aKA4cVnZZCODWG14
   9hCa1idSTZVxFkBmjV7xA2tI8bo5JEsFyC8r90L7BOQRYeXLcldWgx/sM
   w==;
X-CSE-ConnectionGUID: hWbItUPIQDeUOayEitPFqA==
X-CSE-MsgGUID: HYXCZCeMRuOSHRyjmzkdCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="32704290"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="32704290"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 15:17:46 -0700
X-CSE-ConnectionGUID: JTKYR69dTOO2NRNVzhMdwg==
X-CSE-MsgGUID: gH/aAqChSaqW9iPm8rnTTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="62210811"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 08 Aug 2024 15:17:45 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scBS2-0006Yz-1z;
	Thu, 08 Aug 2024 22:17:42 +0000
Date: Fri, 9 Aug 2024 06:17:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.1.y 10/91]
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: phy@fe8c0000: reg: [[0,
 4270587904, 0, 131072]] is too short
Message-ID: <202408090604.1b4dGyhw-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>
CC: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   2a5f985c90ffd8f4e2de3a2fd76f00c3e322aa6f
commit: 8129a8776feae59666307627215e7b4f653f3d60 [10/91] dt-bindings: phy: rockchip: add pcie3 phy
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 7 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240809/202408090604.1b4dGyhw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240809/202408090604.1b4dGyhw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408090604.1b4dGyhw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe010000: Unevaluated properties are not allowed ('rx-queues-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /i2c@fe5c0000/rtc@51: failed to match any schema with compatible: ['haoyu,hym8563']
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: phy@fe8c0000: reg: [[0, 4270587904, 0, 131072]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-pcie3-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: phy@fe8c0000: 'data-lanes', 'phy-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-pcie3-phy.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: phy@fe8c0000: Unevaluated properties are not allowed ('data-lanes', 'phy-supply', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-pcie3-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: pcie@fe270000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'legacy-interrupt-controller', 'num-ib-windows', 'num-ob-windows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: pcie@fe280000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'legacy-interrupt-controller', 'num-ib-windows', 'num-ob-windows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: ethernet@fe2a0000: Unevaluated properties are not allowed ('rx-queues-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: vcc3v3-pi6c-05-regulator: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#
--
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: video-codec@fdea0400: 'interrupt-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-vpu.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe010000: Unevaluated properties are not allowed ('rx-queues-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: phy@fe8c0000: reg: [[0, 4270587904, 0, 131072]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-pcie3-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: ethernet@fe2a0000: Unevaluated properties are not allowed ('rx-queues-config', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
--
   	from schema $id: http://devicetree.org/schemas/net/rockchip-dwmac.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /dsi@fe060000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /dsi@fe070000: failed to match any schema with compatible: ['rockchip,rk3568-mipi-dsi', 'snps,dw-mipi-dsi']
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: hdmi@fe0a0000: Unevaluated properties are not allowed ('#sound-dai-cells', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,dw-hdmi.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: pcie@fe260000: Unevaluated properties are not allowed ('interrupt-names', 'interrupts', 'legacy-interrupt-controller', 'num-ib-windows', 'num-ob-windows' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /i2c@fe5e0000/rtc@51: failed to match any schema with compatible: ['haoyu,hym8563']
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: phy@fe8c0000: reg: [[0, 4270587904, 0, 131072]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/rockchip-pcie3-phy.yaml#
   arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: vcc3v3-pcie-regulator: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
