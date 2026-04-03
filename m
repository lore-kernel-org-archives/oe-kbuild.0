Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A52D2D94BA
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775202815; cv=none; b=cFHjXlYUARo3bTvl7pfHp/xtg5OkGKX/DIl9zcryMRnPZi8FoCV/4JkFISUa7htKZOxborI5CcbPSrN57rM0hsfyGkZO+TNd6oAuXxJ3tNSiTMn2TL8P9X+9hMHl9vRu4QvmRT1KjCh+sxhDLx9MHsfviDcDlpIk5Ks8uTEQdho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775202815; c=relaxed/simple;
	bh=DgfgE3NPBtiZj8uke7lVK0JYbY2zS5uI3DSihDCRJFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IndrbZV05eNFwWuJxz2mOVB8M5h+zEOKa+AIMErOG+nI33PiKLrE2DxUUuqCrVejnKN1vDsHJbdraDJahWdWgYJLLhnw14r7v73BdCFV9TPyFwuGHkQqAEASbqhIrQJyBLhlSSGHKql/GFlY1rJlbIThp17l7i6gdVIL4Zqsq1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FVP9tFEU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FVP9tFEU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775202813; x=1806738813;
  h=date:from:to:cc:subject:message-id;
  bh=DgfgE3NPBtiZj8uke7lVK0JYbY2zS5uI3DSihDCRJFY=;
  b=FVP9tFEUaft+sIruSeqD+kWiReLda1Cvgy/EHPPNfdRAUbi38LQNjXqr
   ePPVMcOjySz5uiendWacVJJZS+gqALKYu4rcZlOUKswY5bhNMDh60olKf
   oVGLWYVWERGyxEBQb2+NDdDjSP7q+yvqPYT9Bd6HwR+ifUuZl0In9wYkX
   O+pO9Uupo1V2S0nz3i2J7/say6JajS0QPgTy/R8YnkzP2b4b7HbYyc5yP
   Ek9boMjffE+z+LdDB+Zh3zNUdRuYiKBspYquWL9C70CxSvCuOg0hYrC7w
   Abp3qru3f974/nIVB4WXoYsaX4hREwC7zToFPs2vNyCA734KZjkw2YrbV
   Q==;
X-CSE-ConnectionGUID: FpXWPsnqQ62d/pl6SsoXOQ==
X-CSE-MsgGUID: ZYuWPMA1QP6FXeCWpEOqEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="80154908"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="80154908"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 00:53:33 -0700
X-CSE-ConnectionGUID: ND1CPkhlStyy+pGLLGzVbw==
X-CSE-MsgGUID: He4Lg0OMSAuLJhTOiceuCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="231242644"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 03 Apr 2026 00:53:31 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8ZLM-000000009FN-3DBa;
	Fri, 03 Apr 2026 07:53:28 +0000
Date: Fri, 03 Apr 2026 09:53:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb:
 pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any
 of the regexes: '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202604030926.V0RoxpNp-lkp@intel.com>
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
TO: Mateusz Koza <mateusz.koza@grinn-global.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d8a9a4b11a137909e306e50346148fc5c3b63f9d
commit: f4d1eace54f7b12369935a698af29bca7cf3db49 arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-2052-20260401 (https://download.01.org/0day-ci/archive/20260403/202604030926.V0RoxpNp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030926.V0RoxpNp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f4d1eace54f7 ("arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604030926.V0RoxpNp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: usb@112a1000 (mediatek,mt8188-mtu3): usb@0:hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtu3.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb: usb@0 (mediatek,mt8188-xhci): hub@1:compatible: ['microchip,usb2513bi'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/usb/mediatek,mtk-xhci.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
