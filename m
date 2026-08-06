Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1955F3E3C4F
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 07:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786000486; cv=none; b=KxyDdVPQfqpXhEQRBKQemMy1nuI8w3R8javUl2c+Eou8Lf4vAzofcFxFaRaKB5cBhBDfXhXr2Sg8CnWWxYleepZCj4/uskJlj6+dDvwCrraoxVjQMsqFi1ZDvyfMGMOXnsWL2GIDH2qw/giWTtTzOUhW0follJk5m9drCUXSwCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786000486; c=relaxed/simple;
	bh=a5c2lnr2mz212K+dyLEfiy9iIu4MYKT8J5lUw4oE3b4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GWW7wLxfihfUG54P1hfOAJkt8TI/48k/ubfpdioSblsEapQWqdtAfDROB5gJzO6o6apSRjftLhG8clGonA7rNifz3/g6km9ayMdSzyUHqTPeGfE9j6Vtua/JO0CXq3jbEJhPGKN56dfxlxtK7TVJKaRL5/almhJctCOFWh38kM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PczCnj+i; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PczCnj+i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786000484; x=1817536484;
  h=date:from:to:cc:subject:message-id;
  bh=a5c2lnr2mz212K+dyLEfiy9iIu4MYKT8J5lUw4oE3b4=;
  b=PczCnj+inHsjSsluX62fvw1UDDPIO27rfBtFCfuuGWyArAcDPs5JmVcF
   s8KNdvQ6bk4jS/akKBywv2hvaeYOZVp3Wluf7xFCf42UeeHEnmklc/Hac
   7K3jr6s2jrKAcfljEo74t+2SL5VyiNNoL42s+gQV0o2VDkI4yuHF0ftof
   bPSBDvjwNclE4qPcz98YYw7OO/GCv2pnIOGiZAgTsBWX78J8ATYIkfQfG
   4c5R1zw1cUEaU6kJAsA4vzFMVdC1ZSbPrFIMGPis7qLo19FprMUWGJxMk
   2GGzZjG8dle4mROJvL/KVkys/t++BIKnrudJpFR6dUbDN7g7BUzfczxQo
   w==;
X-CSE-ConnectionGUID: 2FCA6Kw0RManJjV2hnS4PA==
X-CSE-MsgGUID: PY+TTS7mRRuH8GaO5oz0XA==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="97741269"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="97741269"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 00:14:42 -0700
X-CSE-ConnectionGUID: OlqMxJQCQdqdYzzUnp0y2Q==
X-CSE-MsgGUID: FcreUS30Rl2Zj1er3ZwNdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="264009359"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Aug 2026 00:14:41 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrsJL-000000004aA-1aWH;
	Thu, 06 Aug 2026 07:14:39 +0000
Date: Thu, 06 Aug 2026 09:14:13 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb:
 scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
Message-ID: <202608060909.ZN0qCT12-lkp@intel.com>
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
TO: Gary Bisson <bisson.gary@gmail.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0d839570765118029aa8bf4a95444c6a11aacf85
commit: 9fda4a8a479f030a2a267b1823ffe0687aea8fd4 arm64: dts: mediatek: add device tree for Tungsten 510 board
date:   7 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2054-20260805 (https://download.01.org/0day-ci/archive/20260806/202608060909.ZN0qCT12-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608060909.ZN0qCT12-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9fda4a8a479f ("arm64: dts: mediatek: add device tree for Tungsten 510 board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608060909.ZN0qCT12-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi:945.13-965.4: Warning (avoid_unnecessary_addr_size): /soc/usb@112a1000/usb@0/ethernet@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3081.27-3094.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi:969.7-977.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: hdmi-phy@11d5f000 (mediatek,mt8188-hdmi-phy): clock-output-names:0: 'hdmitx_dig_cts' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,hdmi-phy.yaml
   arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dtb: hdmi-phy@11d5f000 (mediatek,mt8188-hdmi-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-hdmi-phy', 'mediatek,mt8195-hdmi-phy'] is too long
   	'mediatek,mt8188-hdmi-phy' is not one of ['mediatek,mt7623-hdmi-phy']
   	'mediatek,mt2701-hdmi-phy' was expected
   	'mediatek,mt8173-hdmi-phy' was expected
   	'mediatek,mt8195-hdmi-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,hdmi-phy.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
