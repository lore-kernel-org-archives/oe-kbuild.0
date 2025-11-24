Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A58296BC1
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 19:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764011496; cv=none; b=iZAzrPPYDfJIW9d9wDOD9RUyw5IuvSfO1w6AMKfVeRYn/djO71l9xZgn8buRSDFUQvqvijEXHwBbSEy4sd+XlCm0SQdU+yYk7t1YtJkA4OBtg1VwWMrlBoYxJB3ZS8B8r+QIkGoT3Ur1FxNyMW+0/KqZsqa34yGbXUwN2HRvfwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764011496; c=relaxed/simple;
	bh=E1errGnFG4PhOcSf7NqfewPrZUedOfJO2UP5NMHPMNw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y3ZKJihWLE6xzy4MOG5+yZEJWvLEn5QheeNhqYSp7g2ExmjCFVk4MqJVnt7KZbDD4YO/ZdvtTbdauTfT0/zyynfe7p/C2kfKlLhTvyAuhNw5MCSD9P4bdbBoMIo/bPcgZ0N0LIo1E2OtvTHDY/HF3TS15cVmYsEKnP8RMN4C1jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k2G3XObK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k2G3XObK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764011494; x=1795547494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E1errGnFG4PhOcSf7NqfewPrZUedOfJO2UP5NMHPMNw=;
  b=k2G3XObKVtM6bnnmr0UJg8ErF4LIg/WYgSgTru6uT8MucH1IBoFCKc8b
   Nl37fGZdvcioN3to4uAS/GkA3AM77/NeTw1NHjc6RBwBXBJLvSdcOVOOW
   2/pU6oie9xEJ7dtreyUDGuwT3/PLJgpZAGiyiHLYtsJRkCl0FLIVBfQzB
   4yL9z3tUYi3L5KJqB8sQhncziRDcGEhV5p9+dW1h8SNhDrUsYYUTG2DRx
   keVZGEH/fnG/aqYKMfogkEnbUOJF/XcKAkpMCwC8Lfb+LDl5BEE5wW0F5
   mgdFOSReKo+VzCSPnDS9qGniAgTokKaGbI9ggmaw/qLZX5mpROyLO15bw
   Q==;
X-CSE-ConnectionGUID: zt+YtRWGS9OPaG+3eZ0wjw==
X-CSE-MsgGUID: FePa08qrQJqAjWN5jljBLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66063074"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="66063074"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 11:11:33 -0800
X-CSE-ConnectionGUID: ZHRGOnMaR1GFr476nDvrDw==
X-CSE-MsgGUID: p9/l4GNKQamHlgialCbk2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; 
   d="scan'208";a="191684710"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 24 Nov 2025 11:11:31 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNbyD-000000000Ij-3IGK;
	Mon, 24 Nov 2025 19:11:29 +0000
Date: Mon, 24 Nov 2025 20:11:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.19-armsoc/dts64 43/65]
 arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb:
 /video-capture@fdfe0000: failed to match any schema with compatible:
 ['rockchip,rk3568-vicap']
Message-ID: <202511242044.Pg7kLTUG-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Michael Riesch <michael.riesch@collabora.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.19-armsoc/dts64
head:   e34003dd2fb05da8f420bbd7b8ec62ab88242c45
commit: 78f316e90906d54c8aa6029e5c19ae83e420e56a [43/65] arm64: dts: rockchip: add vicap node to rk356x
:::::: branch date: 3 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2051-20251122 (https://download.01.org/0day-ci/archive/20251124/202511242044.Pg7kLTUG-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511242044.Pg7kLTUG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511242044.Pg7kLTUG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-d.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg-arc-s.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353p.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353ps.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353v.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg353vs.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-anbernic-rg503.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v1.1.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.1.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
   arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi:488.10-499.6: Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
   arch/arm64/boot/dts/rockchip/rk3566-pinenote-v1.1.dtb: usb2phy@fe8a0000 (rockchip,rk3568-usb2phy): otg-port: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v0.1.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-pinetab2-v2.0.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb10max3.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb20sx.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rgb30.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-rk2023.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-powkiddy-x55.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
   arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3-io.dtb: wifi@1 (brcm,bcm43455-fmac): compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,bcm43455-fmac'] is too short
   	'brcm,bcm43455-fmac' is not one of ['brcm,bcm4329-fmac', 'pci14e4,43dc', 'pci14e4,4464', 'pci14e4,4488', 'pci14e4,4425', 'pci14e4,4433', 'pci14e4,4434', 'pci14e4,449d']
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3e.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-radxa-zero-3w.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-blade.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-cm4.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-soquartz-model-a.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-box-demo.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-nanopi-r3s.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2007.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
   arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dtb: touchscreen@48 (ti,tsc2007): 'ti,rt-thr' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/ti,tsc2007.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r66s.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-fastrhino-r68s.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-hinlink-h66k.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-hinlink-h68k.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5c.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-photonicat.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
--
>> arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: /video-capture@fdfe0000: failed to match any schema with compatible: ['rockchip,rk3568-vicap']
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: panel@0 (jasonic,jt240mhqs-hwt-ek-e3): compatible: ['jasonic,jt240mhqs-hwt-ek-e3', 'sitronix,st7789v'] is too long
   	from schema $id: http://devicetree.org/schemas/display/panel/sitronix,st7789v.yaml
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): compatible:0: 'sitronix,st1624' is not one of ['sitronix,st1232', 'sitronix,st1633']
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): compatible: ['sitronix,st1624', 'sitronix,st1633'] is too long
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: touchscreen@55 (sitronix,st1624): Unevaluated properties are not allowed ('wakeup-source' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/sitronix,st1232.yaml
   arch/arm64/boot/dts/rockchip/rk3568-wolfvision-pf5-vz-2-uhd.dtb: /i2c@fe5a0000/touchscreen@55: failed to match any schema with compatible: ['sitronix,st1624', 'sitronix,st1633']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
