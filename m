Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE462586EF
	for <oe-kbuild@lists.linux.dev>; Thu, 15 May 2025 22:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747348585; cv=none; b=s+/qkmdiZvKOegKHgh9IIXPSs3ncySSU3eQMo8mqhWjz0nygRBncBLwYCUKFM5UwBJoFLMHoWdl6CXZKRdXN7YI0ciVBKAAW6Gn68AdvbrX2c0oc92OFn9TGxLISEhiWEklpIXxyIHCIpCPlBXTq8UddS13S6RQy2sOos3N4Z0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747348585; c=relaxed/simple;
	bh=6LkFid89wDlbpN2rKE5Bm3D5pLi2UAyolfgW4+YLB90=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d6kOVrXZh8LbVLPSeJew+kkXqyvGR/UBZw7IebDzOgitRzTzXJ3Q3tuuQ0biehC1v5t7bIjiLpqDjl4IPMCaRsRH9u+QOCReFVpa58ceewIi84f8Dpcvt2L7cVWYpfwAc5WNztDoPb3ds4K4wchrKRISUhgYY6yGAICzyoNWlTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVKESuc6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVKESuc6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747348583; x=1778884583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6LkFid89wDlbpN2rKE5Bm3D5pLi2UAyolfgW4+YLB90=;
  b=LVKESuc66w5nAlsDpeUeq7mlguw8iHBO4EC6EcM/FpjT6/F/ZOVJ74RQ
   H6UWre0BL+Iw71eJNwVl4y0t+x1oV6yYsV8nSx3NZnvH5s4YBrnZiBmu+
   q2mUoVZhOYgvJDz8vqrhVyckjX+xTJxnh4QT3CaShNGn6JsZXMmfQqLNS
   2WmtvCbVfzMS8bLyz8qCCvwGzmSFBI6BVsKzTdWBrCLQmAUyqdcbQwzBe
   rd2DRye/+pDIKKtua1IAXg+U4exyRcvL/OxF2fr1q9g1cQOs/65uFoh0W
   2/yBlyb04Mvk4v6aZbxtHB9Fvwm+FPzT9EedUXJbSpKH0nFzne6EHgqQQ
   w==;
X-CSE-ConnectionGUID: ORNHZK2yTlKoGz7K0UlFvw==
X-CSE-MsgGUID: ezxiBlxcQ4GLyJKTVXVBTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="51942104"
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="51942104"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 15:36:22 -0700
X-CSE-ConnectionGUID: NwndEpREQvCrwraRPVa6zQ==
X-CSE-MsgGUID: djPJB/jnT3S4+h0cNzcO9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,292,1739865600"; 
   d="scan'208";a="138557414"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa007.fm.intel.com with ESMTP; 15 May 2025 15:36:23 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFhBb-0000Jl-1b;
	Thu, 15 May 2025 22:36:19 +0000
Date: Fri, 16 May 2025 06:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.16-armsoc/dts64 73/86]
 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb:
 /soc/power-management@ff258000/power-controller: failed to match any schema
 with compatible: ['rockchip,rk3562-power-controller']
Message-ID: <202505160636.zDyWrgOx-lkp@intel.com>
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
TO: Finley Xiao <finley.xiao@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Kever Yang <kever.yang@rock-chips.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.16-armsoc/dts64
head:   1631cbdb808963354ef6b6454bc617cd15f90718
commit: ceb6ef1ea9002669afc0e1ef258e530d3c05d91a [73/86] arm64: dts: rockchip: Add RK3562 evb2 devicetree
:::::: branch date: 10 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2051-20250514 (https://download.01.org/0day-ci/archive/20250516/202505160636.zDyWrgOx-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505160636.zDyWrgOx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505160636.zDyWrgOx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3562.dtsi:624.26-675.5: Warning (simple_bus_reg): /soc/pcie@ff500000: simple-bus unit address format error, expected "fe000000"
   arch/arm64/boot/dts/rockchip/rk3562.dtsi:1115.20-1181.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
>> arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: /soc/power-management@ff258000/power-controller: failed to match any schema with compatible: ['rockchip,rk3562-power-controller']
   arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: pcie@ff500000 (rockchip,rk3562-pcie): interrupt-names:5: 'dma0' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: pcie@ff500000 (rockchip,rk3562-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3562-pcie', 'rockchip,rk3568-pcie'] is too long
   	'rockchip,rk3568-pcie' was expected
   	'rockchip,rk3562-pcie' is not one of ['rockchip,rk3588-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: pcie@ff500000 (rockchip,rk3562-pcie): 'msi-map' is a required property
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: pcie@ff500000 (rockchip,rk3562-pcie): Unevaluated properties are not allowed ('compatible', 'power-domains' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
