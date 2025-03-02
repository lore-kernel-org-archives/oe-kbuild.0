Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5FEEEB3
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Mar 2025 18:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740938553; cv=none; b=I9yTEMwRV3s528vtZZ1KHgPvYYvyfCAgBDxye+UFYgMqaJ68zwYKa9NVwLREBseX67nZ+NaRO0uLJ9A2t3nU+KqoOUx7MRDY3kf6D0DWDfhZAq26NDX/tnpPrMz/VkmJ2bR77Megcphfw+MHl/0kJy+eKQ89AKbzfwEjg/EltwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740938553; c=relaxed/simple;
	bh=fO0Y6iesJZYIp9S9pEwdwX7BFRs40wRvztRb420UtJg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KGT5hmPdDhtnmvx796r3ZK1aqmqD/AIxV9EjZBJEgbCQqExWn0sl73JjtOCbQIV5iz1ypZoHtrpAantmZYCClUAc/F0O3qs3xOjMybwRbn4EEsF03/FUAKciZ35pYaXn7E83eadLtmdecjoeH037g437toWTIJ0ED67Y8Lg/4vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WKmMd/bs; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WKmMd/bs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740938551; x=1772474551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fO0Y6iesJZYIp9S9pEwdwX7BFRs40wRvztRb420UtJg=;
  b=WKmMd/bs7fwVs3YE2rhTxcnQNNNpB6IanED3GcylJa8quhdiYDbMyaj3
   qFLB1TRdTO32Cn1/2fExphpRsM5yjhHkCihUKCErpiFFTX3vs0rZx1Z6e
   ssKnrs9i9mJxW2ThPf7L4327FQuf6Whk/BAmsO1DDqQpj/PmDskozQise
   xxWswyj7hihPSOpmZt29+I9boAuaJBmCHDt9i6zKnFyRAMqZboBSN3iqX
   HMbXyilsKXX6QK7JyD8zOGqswU2iTvy0SSoFfi4s3jtCw6zzbQnK84KHX
   LwMKdMsI/fXO5WFv+dECinPqsv6vewzspaZel9DSfr3zXaSos910Vi4b4
   A==;
X-CSE-ConnectionGUID: OtlLAX2PQse8RX3Cm0CIOA==
X-CSE-MsgGUID: nwfayUlUTd+pQ1ljCEybsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="29399278"
X-IronPort-AV: E=Sophos;i="6.13,327,1732608000"; 
   d="scan'208";a="29399278"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 10:02:30 -0800
X-CSE-ConnectionGUID: QTtxflu7RdCQL3Uq5tu+bA==
X-CSE-MsgGUID: LeLPCtyTQeCqzd/d4ULYrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154988265"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Mar 2025 10:02:30 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tondz-000HV0-0P;
	Sun, 02 Mar 2025 18:02:27 +0000
Date: Mon, 3 Mar 2025 02:02:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.15-armsoc/dts64 53/64]
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: vop@fdd90000:
 clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2',
 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
Message-ID: <202503030123.iKQAR1N6-lkp@intel.com>
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
TO: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.15-armsoc/dts64
head:   c55c9e91d1643493d0434f246917aea7a2653e0f
commit: b2e668a60ed866ba960acb5310d1fb6bf81d154f [53/64] arm64: dts: rockchip: Add HDMI1 PHY PLL clock source to VOP2 on RK3588
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20250302 (https://download.01.org/0day-ci/archive/20250303/202503030123.iKQAR1N6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030123.iKQAR1N6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503030123.iKQAR1N6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105], [106]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [103], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts:1358.7-1366.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105], [106]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts:626.7-634.4: Warning (graph_child_address): /usb@fc000000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105], [106]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [107], [108]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105], [106]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105], [106]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [105], [106]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [103], [104]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected
--
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: vop@fdd90000: clocks: [[31, 605], [31, 604], [31, 609], [31, 610], [31, 611], [31, 612], [31, 603], [104], [105]] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: vop@fdd90000: clock-names: ['aclk', 'hclk', 'dclk_vp0', 'dclk_vp1', 'dclk_vp2', 'dclk_vp3', 'pclk_vop', 'pll_hdmiphy0', 'pll_hdmiphy1'] is too long
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip-vop2.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: spdif-tx@fddb0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['rockchip,rk3588-spdif', 'rockchip,rk3568-spdif'] is too long
   	'rockchip,rk3066-spdif' was expected
   	'rockchip,rk3228-spdif' was expected
   	'rockchip,rk3328-spdif' was expected
   	'rockchip,rk3366-spdif' was expected
   	'rockchip,rk3368-spdif' was expected
   	'rockchip,rk3399-spdif' was expected
   	'rockchip,rk3568-spdif' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
