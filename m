Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC69627A907
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 14:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775225319; cv=none; b=eA8bt9PjBEfAGPlp4xGpFtEyqnaZWBGK/g6qL5KwFsOc/nl3oxJ96GHdWyY4JtuiI/NeBgPvLPDUSM3nD0jGRzyOGzmAZtMnaqK+vaQAZnyndpEN2dicYZNGvNkvJTrykUxWXStAnWRaFNfsuQ+/kWo9bIdxPCCoEseaCvEmPEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775225319; c=relaxed/simple;
	bh=JP66KYVgS0FlrACQZLPTL+F84ZvyIVxsxDbEMQ5cbTM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VGSwApxOifIyKFJ4Ej+bAweqNZu2dAnBXC6avc73J2vEupS3NoiVtAoCJOs5WF3bj4h3XQqswZnQ2/8gJo+Lmq26VvQkpsJx8+dq4vfFg1CfgJ+T8pYevnS9QgXW0cWq2ODfNQ1bfjSPyt0LcnUxRJdklutncFTlJ9LQc4P42os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vj8DQbPi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vj8DQbPi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775225318; x=1806761318;
  h=date:from:to:cc:subject:message-id;
  bh=JP66KYVgS0FlrACQZLPTL+F84ZvyIVxsxDbEMQ5cbTM=;
  b=Vj8DQbPiM8/AXx6r66S0dTukbnTc5yHUEXqrcORr8lb8xo4xPN262srj
   BFequX2rL8Yr0PXOIJurFOBPZEOba8Isc/g8tOtOTjIlDUAegH0x+b9h7
   0R3bNb5E8Oxm3VaKKJVrsSwG5zO3xA68YrbpN2irvYV3Qkvdq18j9cVtk
   PezTeLUKN+gAGzTg5xWUQ5MpAq5UH2uX2fARVReo4yERtIIgaeoi60Hx6
   Y3n7HHNeAIS5Go7qGpoTZ1u0kgJ7TBwR+FI6cEwa6y+qYtV6lykusoROD
   bzxFV4t9wKM+b7TSKEUSPiryzkajGGVxcd4y90QbSFEXLg5sLLmM7/VmY
   w==;
X-CSE-ConnectionGUID: OOtAB6MbTFuYQx57LR1yvw==
X-CSE-MsgGUID: jfMJQEqkS0O94AV7vsuSHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76181594"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76181594"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 07:08:37 -0700
X-CSE-ConnectionGUID: SPgdf/ozQgGJ0b8yiKvJDg==
X-CSE-MsgGUID: jvT6B560TQq7fVRYShNzRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="257732861"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 Apr 2026 07:08:36 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8fCL-000000009Ju-3lQT;
	Fri, 03 Apr 2026 14:08:33 +0000
Date: Fri, 03 Apr 2026 16:08:30 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb:
 pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any
 of the regexes: '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202604031625.4XVkcj5M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Bartosz Bilas <b.bilas@grinn-global.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d8a9a4b11a137909e306e50346148fc5c3b63f9d
commit: bbfb1118fe0e913cfdf49b5c2989cadc39b06781 arm64: dts: mediatek: mt8370-grinn-genio-510-sbc: Add Grinn GenioSBC-510
date:   6 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-2052-20260401 (https://download.01.org/0day-ci/archive/20260403/202604031625.4XVkcj5M-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604031625.4XVkcj5M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bbfb1118fe0e ("arm64: dts: mediatek: mt8370-grinn-genio-510-sbc: Add Grinn GenioSBC-510")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604031625.4XVkcj5M-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: usb@112a1000 (mediatek,mt8188-mtu3): usb@0:hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb: usb@0 (mediatek,mt8188-xhci): hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
