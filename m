Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259A62F39C7
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 11:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766834141; cv=none; b=bqW2s70UeKPI0Z1Tg0+bRa/qOl6tNssBjeVVqMInHL2Qq0pF7qDrTOyXD/uyQU2rRgQTxMbP58762ziyCDY7eQSEU/93ijzxNSoGmAuJxMBsEdKByl1Nc187hTpmg9WAPn900LIJhLkMBAwZVjCPZhDyWUS0iajUPBoFm/jNaqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766834141; c=relaxed/simple;
	bh=x2mGIBm5/6TreI8aYLWrRMU2XIs6SjzxgPe+COl5u+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P5WsT1uJ0NCFAHJEqBUbn2wxWYjEnue8z2u4f18RWZD2DZWurUSYTwM3eac6eFPJLrSHZ0fhiCqQzPcS1Lx9HjtZdw25J7KV/LUYtWHNZ5Veb8VEdq50ANhvadLWEx2vpdSSkHEYUf37n/QZWCfLXyBBWIVd9bQvopmEPkhIoM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5zmEEnS; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5zmEEnS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766834139; x=1798370139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x2mGIBm5/6TreI8aYLWrRMU2XIs6SjzxgPe+COl5u+Y=;
  b=i5zmEEnSELrV0wN7sIHZckCg7vbkV/2srAs5KqsFd6aK6RCWToj+9Fzd
   3K5ZkZZqj8cvXUv6m+fpLIY4MjJFXxY2aFXTtDQzn29ZQ0kBYdtINmwhu
   6M2wDGvZTFG+ZIRFEDjlQIRtesj8+Ijgdy0YerLI8xyaITe2Gx8ro7VsZ
   VqJODriG3v8dt5Em1XKhCJ4Fh9tCNIQQhTAetpIyFx5vX/E4hK/GlB3cs
   Al1EGADu39lntvTR67poxXPVU2DXhQM6UhaPQpUqsLLqgs83G6CrZLkMQ
   2XopUWETpBzu3axSS/jmwRcOCeVrCrgHucOyDHCJwKSK6Sg0ErBDdtMWl
   Q==;
X-CSE-ConnectionGUID: b4FlMqA2RZqOnY8ZG+m4Rw==
X-CSE-MsgGUID: GUXCKCnRR1yj0riVk9cn9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68587465"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68587465"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 03:15:39 -0800
X-CSE-ConnectionGUID: AVXLoiusT6SMb62rP4lljg==
X-CSE-MsgGUID: R6aUdBPiQze1YBmI7N6FFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205584516"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 27 Dec 2025 03:15:38 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZSGl-000000007Ai-2DZJ;
	Sat, 27 Dec 2025 11:15:35 +0000
Date: Sat, 27 Dec 2025 12:14:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.20 23/30]
 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: fcp@16470000
 (renesas,r9a09g056-fcpvd): False schema does not allow ['aclk', 'pclk',
 'vclk']
Message-ID: <202512271223.3hrJQLA4-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.20
head:   666e5eabd623586d0efa333a863122661c7668c6
commit: 4636957e62eac72dcb145e6900a80d62b0fb87fa [23/30] arm64: dts: renesas: r9a09g056: Add FCPV and VSPD nodes
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2052-20251224 (https://download.01.org/0day-ci/archive/20251227/202512271223.3hrJQLA4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512271223.3hrJQLA4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512271223.3hrJQLA4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible:0: 'renesas,r9a09g047-usb3-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/renesas,rzg3e-usb3-phy.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible: ['renesas,r9a09g056-usb3-phy', 'renesas,r9a09g047-usb3-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/renesas,rzg3e-usb3-phy.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: fcp@16470000 (renesas,r9a09g056-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dtb: fcp@16470000 (renesas,r9a09g056-fcpvd): clocks: [[3, 1, 237], [3, 1, 238], [3, 1, 239]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
--
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible:0: 'renesas,r9a09g047-usb3-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/renesas,rzg3e-usb3-phy.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible: ['renesas,r9a09g056-usb3-phy', 'renesas,r9a09g047-usb3-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/renesas,rzg3e-usb3-phy.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: fcp@16470000 (renesas,r9a09g056-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtb: fcp@16470000 (renesas,r9a09g056-fcpvd): clocks: [[3, 1, 237], [3, 1, 238], [3, 1, 239]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
--
   	['renesas,r9a09g056-dmac', 'renesas,r9a09g057-dmac'] is too long
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r7s72100-dmac', 'renesas,r9a07g043-dmac', 'renesas,r9a07g044-dmac', 'renesas,r9a07g054-dmac', 'renesas,r9a08g045-dmac']
   	'renesas,r9a09g056-dmac' is not one of ['renesas,r9a09g047-dmac']
   	'renesas,r9a09g057-dmac' was expected
   	'renesas,rz-dmac' was expected
   	from schema $id: http://devicetree.org/schemas/dma/renesas,rz-dmac.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible:0: 'renesas,r9a09g047-usb3-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/renesas,rzg3e-usb3-phy.yaml
   arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: usb-phy@15870000 (renesas,r9a09g056-usb3-phy): compatible: ['renesas,r9a09g056-usb3-phy', 'renesas,r9a09g047-usb3-phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/renesas,rzg3e-usb3-phy.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: fcp@16470000 (renesas,r9a09g056-fcpvd): False schema does not allow ['aclk', 'pclk', 'vclk']
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml
>> arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtb: fcp@16470000 (renesas,r9a09g056-fcpvd): clocks: [[3, 1, 237], [3, 1, 238], [3, 1, 239]] is too long
   	from schema $id: http://devicetree.org/schemas/media/renesas,fcp.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
