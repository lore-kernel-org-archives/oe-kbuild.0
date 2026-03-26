Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6813D9035
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 12:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774527226; cv=none; b=akHSO2Zyoe9P79Y/ENfcmXWSv1XDolB1dv3VS+SbI1DmyY6V2UB+nCm2kJ/v/DJRPTH6kpPv8VY5uommG/fo7PSLd+75y2zjFyNXAImk3vd3d78Nkd/zycMMzLfPMCahTSZ6kQAS9MPJBVYL8Ot4MQw4+rupqUZhATcKZyCTPh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774527226; c=relaxed/simple;
	bh=6r/7BpZdMeQj5imvbyBsi0P4fCIjgCupe7YGsWYsS2w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MMVhOjxd1q2NJ4rTcm66yOnI1iuCoMDoWWe7pz4UTdxAVtEhvvSPl8jZ5NXGgtknWvJXS1HvmqDsSEDe895Oimg3wruP3LEAI61cZkLAjfve4aaUn7GEBMtsy0XFgU3xm4XKeHplrIdK5Fw7DzetsIGFUMbgmndLlEcOhFurhqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zmssofw0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zmssofw0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774527224; x=1806063224;
  h=date:from:to:cc:subject:message-id;
  bh=6r/7BpZdMeQj5imvbyBsi0P4fCIjgCupe7YGsWYsS2w=;
  b=Zmssofw0mSJl5vGdV2C2WX9oquRM6iWeimNujlUMW6FxdADRpC0Gr4Ri
   UrWt05R2VOuOWn54V6IzrnS/FzjREIVDowL6Z+whiXQvE+T950FZg6Wh0
   Q0R41ZAW9rSx6NP9U943pktc496ZFFIRafXtBwAJHGs6GxNngkQcrA327
   u/dyQTM61hBIvnzWafGfEkC3DhHDK2xhJFUnCyiRw31v1q9abO1b8PaS9
   FEFgehHbQ3vLmU7qrt8VDiL7VryGn8p4C/oGj0/I2OwNSwQsqHS9sX9y1
   8q0hpC1G6R3ywCmwIkW4q0eUK9SWJo1tYfcAdbfz1/BKrhVIjStodv6cf
   w==;
X-CSE-ConnectionGUID: PoJH90MiR82R7oKOBApWXA==
X-CSE-MsgGUID: G24UduTRTTOCA4DH8NIigg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="78179752"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="78179752"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 05:13:43 -0700
X-CSE-ConnectionGUID: UxUOhggGT9CXTzmO0h10/g==
X-CSE-MsgGUID: Uum5pDdYTAioiN21m7tOVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="229057966"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 26 Mar 2026 05:13:42 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5jak-000000007Gb-2nc7;
	Thu, 26 Mar 2026 12:13:38 +0000
Date: Thu, 26 Mar 2026 13:12:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.1-armsoc/dts64 40/44]
 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: /efuse@fe38c000:
 failed to match any schema with compatible: ['rockchip,rk3568-otp']
Message-ID: <202603261326.mX4skkWC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.1-armsoc/dts64
head:   6cb4ec63ba9a5831621cf951b7af55c67beeb97b
commit: fae36d252e3344eefd95a94c026c170003805917 [40/44] arm64: dts: rockchip: Enable OTP controller for RK356x
:::::: branch date: 13 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260325 (https://download.01.org/0day-ci/archive/20260326/202603261326.mX4skkWC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261326.mX4skkWC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603261326.mX4skkWC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-onething-edge-cube.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: usb2phy@fe8a0000 (rockchip,rk3568-usb2phy): otg-port: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
   arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: wifi@1 (brcm,bcm43455-fmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,bcm43455-fmac'] is too short
   	'brcm,bcm43455-fmac' is not one of ['brcm,bcm4329-fmac', 'pci14e4,43dc', 'pci14e4,4464', 'pci14e4,4488', 'pci14e4,4425', 'pci14e4,4433', 'pci14e4,4434', 'pci14e4,449d']
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2007.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2007.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-tinker-board-3s.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-hinlink-h66k.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-hinlink-h68k.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3j-rpi-cm4.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133-pcb-13.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233-pcb-12-11.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433-pcb-12-10.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
--
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: /efuse@fe38c000: failed to match any schema with compatible: ['rockchip,rk3568-otp']
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
