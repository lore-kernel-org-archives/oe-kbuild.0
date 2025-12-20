Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AADB78F4F
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 23:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766273573; cv=none; b=tvOvETzdBPzYcpaSuePn/nnTx5VbA4veRQWVkKnzBOB4nECdaXgsj+yzjuI4m5s0yv7LizRNnVfETNgoo+Dc2nixIYocOHoZr3oA/6qC5AOrElX8aVKY0iyvEilAlp5qcxJmsSfxbmyr80vhuqpy+am80LBQ1DjaTvhW0ud+2hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766273573; c=relaxed/simple;
	bh=B2VwBvPQhXUZFSWtf2EAPT4Fm3/zJFmJeVfxoV5/vHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HZpOBGMOZ01Ab31sg4hNxEX/CvYXwK4NZiFMCpC2QKawtmbNCjGajTNTTC7AJyH/02WHginvluVBCwwVptV+PykZFHRX6HVVGA2Gplby4cKlb40ViWOCja459M7EqdFmx9gRIbri/MGTGfGtVdMkSsZoI0Tm6CYxiAZT2sdV+g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EFVxza+t; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EFVxza+t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766273571; x=1797809571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B2VwBvPQhXUZFSWtf2EAPT4Fm3/zJFmJeVfxoV5/vHw=;
  b=EFVxza+tMPu/R/fY2DoNCyIAxgviAtJmaLqgAz7dBGyT5nQfF8yZjU40
   SJsSStsT0JRC8emB45sOfNmSHbd7Z89M0QRkCaJr1b2YpMWDVWfGKISQL
   KNiTsBcW/mBgxtAdXAmX6v4QGRZhCWbmb6xJ+mV+MoHbBkWaNbVLZeudn
   tNtX6Zq/lf3Kmm1DH5YlLzv7GH4H/j5/Dc11DErwiFWlNjWBeqL1J0jt0
   QxOPkxO9RqNugsBmLhCjY+Vv/8OUWkrPLyCYuC6xm/8nkGpTZC4cq3/wz
   gQ4U1Jui5R+HBoROXJXAT/WR83GOPB+d6/fSjH4pAiLnWp29ZJLnmQAyG
   g==;
X-CSE-ConnectionGUID: WLZ288oVQOKbLMuW7Rd+vw==
X-CSE-MsgGUID: GUuQb4chSiiCGUeM5UNKsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68125631"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68125631"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 15:32:51 -0800
X-CSE-ConnectionGUID: VQQpuCWFRYuRVNFnZo0xSw==
X-CSE-MsgGUID: y7Y30UBES0i//3nJRmkodw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="204246808"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 20 Dec 2025 15:32:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX6RL-000000004pY-1nbD;
	Sat, 20 Dec 2025 23:32:47 +0000
Date: Sun, 21 Dec 2025 00:32:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:mediatek/dt64 12/27]
 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dtb:
 pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match
 any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202512210012.iPZKxMdu-lkp@intel.com>
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
CC: arm@kernel.org
TO: Bartosz Bilas <b.bilas@grinn-global.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git mediatek/dt64
head:   9b2d2beaefcfa17259fdbce16d59d660894147cb
commit: bbfb1118fe0e913cfdf49b5c2989cadc39b06781 [12/27] arm64: dts: mediatek: mt8370-grinn-genio-510-sbc: Add Grinn GenioSBC-510
:::::: branch date: 6 weeks ago
:::::: commit date: 10 weeks ago
config: arm64-randconfig-2052-20251219 (https://download.01.org/0day-ci/archive/20251221/202512210012.iPZKxMdu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210012.iPZKxMdu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512210012.iPZKxMdu-lkp@intel.com/

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
