Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2082E56A
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 02:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775095879; cv=none; b=FJM2J9x8ILO5IswJRF4Ua0DXzS+6JWFNOtGbipAdMg5jEhL8hSD7Q+Mbm+WYQ8PNM3nh8loIHrX26cUj5z62IzEeTckAXqRvkiMax+GMHs0gLBeJimsQAbsITS4yDTwiOdVRBUThcGAiC3Q+Dk3oTKt+hW02AP39bY4VMc3AvLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775095879; c=relaxed/simple;
	bh=sFqyv16jaH6u+965ZZ5wTk5cy4+Hw04yfTWeYeC37hg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q0ujPU9RSJ/7pY1IFRj3ikRHnWwUKJxjt1f3eiHAV27g7farRlo6HLfme19OkaMKOHzbnRm1qGEMs6z4KZtkH+s8iL/4LEHH8m1U7/Nqs8eKnJTdsvTPflffEbMF2tZdrbGs4yFhDNu6eL+i5Eh1ZdFUNLQABB7Gvm8yqxqVLVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUNc0o40; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUNc0o40"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775095877; x=1806631877;
  h=date:from:to:cc:subject:message-id;
  bh=sFqyv16jaH6u+965ZZ5wTk5cy4+Hw04yfTWeYeC37hg=;
  b=UUNc0o40wOXYT63g90LnA3i2ewXq3fH00ZUeMp9laLDiLIicOeytFWtM
   fYuoUOdewNbqDm3YiOLe25rmua2Yk6MTV9HpiEm8QAifBEmms6zOcJlbz
   PBScuJ4m00HniTCkSP7gJO1GlcrdQ0TvtsJ0xTceH0Fcy6qAn5P2UOLIW
   WGJhLlE0bcTud29CafrsnFYXX+HA+DF4JFzLGfWW82IDYavceWeNwZwDm
   GR5OUhyCshOZdM8JlLgneZpGpHdnJts2cZS2pLKoayfHJIq8GLaM4Z98Z
   U9R3A3+SPaMaDUGxFs/EwyeLBtGRznsblLchr0mBKqazyYn7OckooEX2p
   w==;
X-CSE-ConnectionGUID: oUW3UhvaQAuhHGmXIOxh6A==
X-CSE-MsgGUID: v2xCT+gETXe2Yz0HFM98UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="76263585"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="76263585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 19:11:17 -0700
X-CSE-ConnectionGUID: JUKOxFWTTNWg+DyFRM4X9A==
X-CSE-MsgGUID: HmYjPcA0TBWDKK656DUUsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="231256987"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 01 Apr 2026 19:11:16 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w87Wb-000000008y9-2q4O;
	Thu, 02 Apr 2026 02:11:13 +0000
Date: Thu, 02 Apr 2026 04:10:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb:
 pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any
 of the regexes: '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202604020451.nkHYLh3j-lkp@intel.com>
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
head:   9147566d801602c9e7fc7f85e989735735bf38ba
commit: bbfb1118fe0e913cfdf49b5c2989cadc39b06781 arm64: dts: mediatek: mt8370-grinn-genio-510-sbc: Add Grinn GenioSBC-510
date:   6 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-2052-20260401 (https://download.01.org/0day-ci/archive/20260402/202604020451.nkHYLh3j-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2025.13.dev11+ged7697fd8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260402/202604020451.nkHYLh3j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bbfb1118fe0e ("arm64: dts: mediatek: mt8370-grinn-genio-510-sbc: Add Grinn GenioSBC-510")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604020451.nkHYLh3j-lkp@intel.com/

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
