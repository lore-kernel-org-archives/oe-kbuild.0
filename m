Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF34CA45
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jun 2026 07:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780558563; cv=none; b=kpjoQWtyg3d5ULDGJsWukcVWNjG38/p25ovCVnX0n/o/OfOpUe/8xKTWZlJAfjsR+V4KHU13AdqvKRS8EIstpHVY4f7LPfMFLafGu8BstKaXf8L+R5PxZ+hf7HF/EIydnZq2XZmXbtVN3BDWwSEPsPlmXp3D681vgyh33utut1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780558563; c=relaxed/simple;
	bh=gkvGy/wQJv7PSidOIeuEHPyoDiPRlpAzabB0it7T9mM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fpFryqjVug+Uk+2ECHspI7dab8y/WPYX4Byh5IMbJu16iiqT3oehUjE7d821Dy8RY5F76ueY/HqD4nNyPXAbueHEZt+WoTjKosJ7v3L7Iv8d4mfmCey2NJZ+/W7DbD4pNsop/UkiYSGYYgxHzbR2/cwEE1v1bEO4fxe9ikpAFLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j2oF1ve9; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j2oF1ve9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780558560; x=1812094560;
  h=date:from:to:cc:subject:message-id;
  bh=gkvGy/wQJv7PSidOIeuEHPyoDiPRlpAzabB0it7T9mM=;
  b=j2oF1ve9oKltmi83AS2FXJMx6WCMuhURvpn5akSXp7st+2NMvFZJdA0m
   jEOG5g2n5+YqjhVQrQATV346yoQVPgBGSCFEWiro6sdvrqte1+LivWkBW
   cNtM3xNor3+F9yxyNanvxGt5Gx5D3hnRsKjsphmSPSWcJp4UbPZAeUTul
   oszIfIikvVH5TGmhjwWyODY/J99zOsFZwWLoDdYgyhckpcsrMdyXnhURH
   6qLsq10xKAOr46f0u7UTQ9b3FVV3gUy9sfoeNzD+oml3HFeWUSzkcpQ1l
   HqDHb6FBIqc8mec7obb4oeQSPvm9sWyANCvJ0u6D6NxgnFw1zoCeDSrOB
   g==;
X-CSE-ConnectionGUID: NL12MFq2TwCnSOtwvFEo2Q==
X-CSE-MsgGUID: 8YE9s3k5QwaADnT9BNu+QQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="81505851"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="81505851"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 00:36:00 -0700
X-CSE-ConnectionGUID: 1UMEarKYTwWaM7jyw8+R8w==
X-CSE-MsgGUID: DTmOf+dwSd2HMYqz5ufhLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="268133859"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Jun 2026 00:35:58 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV2cO-000000002Ij-0yR6;
	Thu, 04 Jun 2026 07:35:56 +0000
Date: Thu, 04 Jun 2026 09:35:16 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [drm-misc:drm-misc-next 11/30]
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: edp@fdec0000
 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
Message-ID: <202606040926.goIT3gjf-lkp@intel.com>
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
CC: dri-devel@lists.freedesktop.org
TO: Damon Ding <damon.ding@rock-chips.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   6e7eb171ac96fefa32197afa658e7d9da238be89
commit: 826ab13cf73e7bd5b268085c9594850f6a7fc7fd [11/30] dt-bindings: display: rockchip: analogix-dp: Fix hclk as third clock for RK3588
:::::: branch date: 20 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-2054-20260603 (https://download.01.org/0day-ci/archive/20260604/202606040926.goIT3gjf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606040926.goIT3gjf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606040926.goIT3gjf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-evb.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-coolpi-cm5-genbook.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-io.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[30, 512], [30, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[30, 515], [30, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-friendlyelec-cm3588-nas.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1136.7-1143.4: Warning (avoid_unnecessary_addr_size): /usb@fc000000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts:1151.7-1158.4: Warning (avoid_unnecessary_addr_size): /usb@fc400000/port: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-mnt-reform2.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6-lts.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-ok3588-c.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[30, 512], [30, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6b-wifi.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-ethernet-switch.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-jaguar-pre-ict-tester.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
   arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-ep.dtb: pcie-ep@fe150000 (rockchip,rk3588-pcie-ep): Unevaluated properties are not allowed ('vpcie3v3-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie-ep.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-rock-5b-pcie-srns.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou-haikou-video-demo.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: edp@fdec0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: edp@fdec0000 (rockchip,rk3588-edp): clocks: [[33, 512], [33, 511]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: edp@fded0000 (rockchip,rk3588-edp): clock-names: ['dp', 'pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml
>> arch/arm64/boot/dts/rockchip/rk3588-edgeble-neu6a-wifi.dtb: edp@fded0000 (rockchip,rk3588-edp): clocks: [[33, 515], [33, 514]] is too short
   	from schema $id: http://devicetree.org/schemas/display/rockchip/rockchip,analogix-dp.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
