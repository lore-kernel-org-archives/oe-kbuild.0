Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC2333EB1B
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Apr 2026 19:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775072712; cv=none; b=YaKdtZLigoPt4Y7+6ImVBLjixeM4A2bdFB7k8anB84zTMoQw7q5NRCXMT7BTXthudlJzGUC88tNjyxHouwqon7dljz9JU5ufLo8MM3u5n62m7amR3cWnsymqqf8PyKINSTdI7yucl/cp1CthMr0DIhHzVLFGhv1cuwoxb4ROymE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775072712; c=relaxed/simple;
	bh=d8e7vVQLa+hbJs9xAYJOZShx0F+qLFDSzqPTaGORXQI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WC8/f8QGsRGHP+nomYZzP5AMB3G/AGC3qR3zG17YDB9QRHLTSBWyScbFD3+JOSHBDVdg3iDle9ijZ0C2Z7JAE1DZUPS8jZozN8a5Czb3Wv0nE2bhHW2xBQ5gdcbVZHXuzuHNtvXSeDZH9gB+UuN/0qRrcCqbe0Dn8S+cn9Ce4fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPJ2ieOe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPJ2ieOe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775072709; x=1806608709;
  h=date:from:to:cc:subject:message-id;
  bh=d8e7vVQLa+hbJs9xAYJOZShx0F+qLFDSzqPTaGORXQI=;
  b=OPJ2ieOePWPNX9W5jkX0a6MZscdAaiTUF9iVcr7BePn7CYaknFODMzCO
   2NPhDsiWSXRgUBcuQzjbuY9qLdHJjN/3N+3Dzm4n0XbkfJjx2+tWLvrYw
   zTWNWGIK9INxi1aMD8K3wER9TQpnsEsjGr97TkKgv3ISf8MrMdZrM1+bC
   +Syz+jl2omQFk55fM5xI2ZUYgD+eibpLJY1azFeRHYkye20XMJxLLCBr9
   aJrY/S6sJ+bxbf5hy9y292XcIsUllRbrBoRYwaiWGpPa58UYGKSbA1goQ
   dJxM1vwDSx2Cic9ohQ4Z435V8eiT+bRuPRIPdou5RmVRc34++dTt3Ix3a
   A==;
X-CSE-ConnectionGUID: JShSuewaQEe63x9yFME6VA==
X-CSE-MsgGUID: MGkWoOeoRMyY0vx21LUgjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="75159503"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="75159503"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 12:45:08 -0700
X-CSE-ConnectionGUID: KUvSu/rQR2arCILEEcgHTw==
X-CSE-MsgGUID: S4l9HJhUSomhkxhPdA2H3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="228378091"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 01 Apr 2026 12:45:07 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w81Uv-000000008nh-1oXR;
	Wed, 01 Apr 2026 19:45:05 +0000
Date: Wed, 01 Apr 2026 21:44:12 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dtb:
 pinctrl@10005000 (mediatek,mt8188-pinctrl): 'pcie-default' does not match any
 of the regexes: '-pins$', '^pinctrl-[0-9]+$'
Message-ID: <202604012123.InhFJEBy-lkp@intel.com>
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
head:   9147566d801602c9e7fc7f85e989735735bf38ba
commit: f4d1eace54f7b12369935a698af29bca7cf3db49 arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700
date:   6 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-2052-20260401 (https://download.01.org/0day-ci/archive/20260401/202604012123.InhFJEBy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2025.13.dev11+ged7697fd8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604012123.InhFJEBy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f4d1eace54f7 ("arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604012123.InhFJEBy-lkp@intel.com/

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
