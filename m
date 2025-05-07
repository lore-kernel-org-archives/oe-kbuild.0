Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF3920F076
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 12:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622469; cv=none; b=kVbsUVq05Nwc708H85b4tXRw+o2oEMPPd5KJVk5R4qVskk4eoY4duyPj7u2yHQMAhNgdCz3C6eP56UisUvI3pWAt27flt7A543sojz8HsFZJYNTEKJ6EVuM5TYSZsodfqhfdwz/EM4/LI8g7S3Uv5uoQmTBBXCrJU8du8QqWSzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622469; c=relaxed/simple;
	bh=W/5i6sNI/IWHOvusjRS0BKC8+o3FKkxxiXCoPT4Z0Jw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O4VegrgPopNpbFeAmFBelr1La9oOiTNM1BoGFU/6aDNcgAOSXZzK7545ZYc/5u9h7UQN27LWKv84tFN80/IYRidgZZfR22Hw4ELt3KquqphxopRF2wSEGug8RcvPNi8pxYwsidrhevxdAcd222nGXh89jNp4F+omvxObjFxp8wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAJEii45; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAJEii45"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746622468; x=1778158468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/5i6sNI/IWHOvusjRS0BKC8+o3FKkxxiXCoPT4Z0Jw=;
  b=OAJEii45Nw36sIR489gXKGwpLnmnqT8AjYuR2JWZHgcrJUpCDyUS9IdL
   kb2rLkwfoLD3UUIQkVUoC87J7WkcXqz0o75wRYyCetdHVwmkPRCIrK+30
   o++FX9dfOj40cb9ZpmCl26QhlfoAEI9/jOTtG45jN3ciA75DJKgVNcyp0
   I+yRb11cwXAaFKO/45G8UXtP/Kt8LDRNjr10or5Qn9K/CRDCO+MLCabKE
   +h+kcQLdWgxTHv+bHc9164PSvPjP/SZtovgggvpQ2h/o2hJn9cSinrUfh
   A39OKilqgeP2RZdmo4Nj28AnzGfqzVotu5uqx8v1j9TpeysC29U0Njy3K
   A==;
X-CSE-ConnectionGUID: WM/qZ/WKTCOLaqp9cnNNmg==
X-CSE-MsgGUID: GLgAq7cBRcWajS38DPV4DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59702940"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59702940"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:54:26 -0700
X-CSE-ConnectionGUID: ZzIMfOUAQd61xwWDyjrysA==
X-CSE-MsgGUID: /mMnQBrmTdi1wUQgVZBPqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="141141768"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2025 05:54:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCeI3-0007oe-0Q;
	Wed, 07 May 2025 12:54:23 +0000
Date: Wed, 7 May 2025 20:54:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.16-armsoc/dts64 47/52]
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/rng@2a410000:
 failed to match any schema with compatible: ['rockchip,rk3576-rng']
Message-ID: <202505072007.TkKZiu6y-lkp@intel.com>
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
TO: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.16-armsoc/dts64
head:   a706a593cb19796f31d3a888423ef1a71885ae72
commit: 5268f3b5d29887480011b44567bcbf0d422cda94 [47/52] arm64: dts: rockchip: add RK3576 RNG node
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250506 (https://download.01.org/0day-ci/archive/20250507/202505072007.TkKZiu6y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072007.TkKZiu6y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505072007.TkKZiu6y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pcie@2a210000 (rockchip,rk3576-pcie): interrupt-names:5: 'dma0' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: pcie@2a210000 (rockchip,rk3576-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie'] is too long
   	'rockchip,rk3568-pcie' was expected
   	'rockchip,rk3576-pcie' is not one of ['rockchip,rk3588-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/pcie@2a210000: failed to match any schema with compatible: ['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/sata@2a240000: failed to match any schema with compatible: ['rockchip,rk3576-dwc-ahci', 'snps,dwc-ahci']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/sata@2a250000: failed to match any schema with compatible: ['rockchip,rk3576-dwc-ahci', 'snps,dwc-ahci']
>> arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/rng@2a410000: failed to match any schema with compatible: ['rockchip,rk3576-rng']
   arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
--
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pcie@2a210000 (rockchip,rk3576-pcie): interrupt-names:5: 'dma0' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: pcie@2a210000 (rockchip,rk3576-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie'] is too long
   	'rockchip,rk3568-pcie' was expected
   	'rockchip,rk3576-pcie' is not one of ['rockchip,rk3588-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/pcie@2a210000: failed to match any schema with compatible: ['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie']
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/sata@2a240000: failed to match any schema with compatible: ['rockchip,rk3576-dwc-ahci', 'snps,dwc-ahci']
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/sata@2a250000: failed to match any schema with compatible: ['rockchip,rk3576-dwc-ahci', 'snps,dwc-ahci']
>> arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/rng@2a410000: failed to match any schema with compatible: ['rockchip,rk3576-rng']
   arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
--
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pcie@2a210000 (rockchip,rk3576-pcie): interrupt-names:5: 'dma0' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: pcie@2a210000 (rockchip,rk3576-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie'] is too long
   	'rockchip,rk3568-pcie' was expected
   	'rockchip,rk3576-pcie' is not one of ['rockchip,rk3588-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/pcie@2a210000: failed to match any schema with compatible: ['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie']
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/sata@2a240000: failed to match any schema with compatible: ['rockchip,rk3576-dwc-ahci', 'snps,dwc-ahci']
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/sata@2a250000: failed to match any schema with compatible: ['rockchip,rk3576-dwc-ahci', 'snps,dwc-ahci']
>> arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/rng@2a410000: failed to match any schema with compatible: ['rockchip,rk3576-rng']
   arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']
--
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pcie@2a210000 (rockchip,rk3576-pcie): interrupt-names:5: 'dma0' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: pcie@2a210000 (rockchip,rk3576-pcie): compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie'] is too long
   	'rockchip,rk3568-pcie' was expected
   	'rockchip,rk3576-pcie' is not one of ['rockchip,rk3588-pcie']
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/pcie@2a210000: failed to match any schema with compatible: ['rockchip,rk3576-pcie', 'rockchip,rk3568-pcie']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/sata@2a240000: failed to match any schema with compatible: ['rockchip,rk3576-dwc-ahci', 'snps,dwc-ahci']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/sata@2a250000: failed to match any schema with compatible: ['rockchip,rk3576-dwc-ahci', 'snps,dwc-ahci']
>> arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/rng@2a410000: failed to match any schema with compatible: ['rockchip,rk3576-rng']
   arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dtb: /soc/otp@2a580000: failed to match any schema with compatible: ['rockchip,rk3576-otp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
