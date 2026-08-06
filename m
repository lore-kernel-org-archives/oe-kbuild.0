Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB1C439F90
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 10:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786011949; cv=none; b=nC1a4i2Y5c4S0kVLIv8j/g7JnUjXpl9LQsEo6Qps2/IgIoSok0tl5UlJ7iAw6H+8Q5uSxNvjWy3G9WYToS9IrlGfX6zfvb6gzIxWNBlIySbK1vwQSOafv3YfTesSvA7/2zFmP5wIV9My1RXYjE30ayKMfpQnWjgk0k2Pmn6Qdto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786011949; c=relaxed/simple;
	bh=psXyUCUlDmVtb4AeNseLm23iJ2TmZc/GWqhIT44nccE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YR8NsJa1+8FELstBo6HlEOv1k5TcwCv1ZZEhhL0hSok8Y3UTZhRA1mLxYSe6SKsc1dOpGTK/ZdrxnFcsQfq/3pQ0SCH1T629cAUCna7wnxGR1747s5BvcIm08kCrkjA7TjyOXwQaxahybv4jGtysa0jwBwgevYN6/vS0Jxzl9w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAO3fTXA; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAO3fTXA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786011946; x=1817547946;
  h=date:from:to:cc:subject:message-id;
  bh=psXyUCUlDmVtb4AeNseLm23iJ2TmZc/GWqhIT44nccE=;
  b=lAO3fTXABhfTkJZAn9GgBEgfDxrFDw0nTBKrk5NEyF0EaumpbJSxcuol
   9SyY4pG5pjxwlFd+OZ4VmGWDUk0JUwOl+DH5jwObvX5XC1IHvLvXFPwtO
   rnSPWn9DMwHfdW9eCqyVN57SIUtVKY86A59SO1mXcztWxIHlTU5Xf/ZjB
   7pfM/RSzBD80ip4cOE06sGdgBEIJar5wLdSsBR9hf5oqamgHuzfckjIsI
   SfrtXrcVvR1gaQFgmHnMcQtkeOhmcePYJPYWn1wsLfvvYo1VmXBlDdWgi
   cfxC+lpWhMg6wmGrInNpG0qopQam5kb1DaVTkoN01Z0ZJggFqjiQxfOuu
   A==;
X-CSE-ConnectionGUID: jp9faZ9wQXGXJeVIN706Cg==
X-CSE-MsgGUID: ml1j5SclSY2YBxy/NLGzxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="86716701"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="86716701"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 03:25:44 -0700
X-CSE-ConnectionGUID: pawSVIWxRia3Dij7+nRRAg==
X-CSE-MsgGUID: IyzWUDIHS8mM3jnzYBF+qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; 
   d="scan'208";a="291972910"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 06 Aug 2026 03:25:44 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrvID-000000004cI-23bO;
	Thu, 06 Aug 2026 10:25:41 +0000
Date: Thu, 06 Aug 2026 12:25:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb:
 scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
Message-ID: <202608061207.1iLfVuJ7-lkp@intel.com>
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
commit: fe96ff075f960abb9dd1c99c4c4e7f79c4e10172 arm64: dts: mediatek: add device tree for Tungsten 700 board
date:   7 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2054-20260805 (https://download.01.org/0day-ci/archive/20260806/202608061207.1iLfVuJ7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260806/202608061207.1iLfVuJ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: fe96ff075f96 ("arm64: dts: mediatek: add device tree for Tungsten 700 board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608061207.1iLfVuJ7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi:945.13-965.4: Warning (avoid_unnecessary_addr_size): /soc/usb@112a1000/usb@0/ethernet@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3081.27-3094.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@1c008000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi:969.7-977.4: Warning (graph_child_address): /soc/syscon@1c01d000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg: [[0, 275906560, 0, 917504]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
>> arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: scp@10720000 (mediatek,mt8188-scp-dual): reg-names: ['cfg'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/mtk,scp.yaml
   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: hdmi-phy@11d5f000 (mediatek,mt8188-hdmi-phy): clock-output-names:0: 'hdmitx_dig_cts' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,hdmi-phy.yaml
   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtb: hdmi-phy@11d5f000 (mediatek,mt8188-hdmi-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-hdmi-phy', 'mediatek,mt8195-hdmi-phy'] is too long
   	'mediatek,mt8188-hdmi-phy' is not one of ['mediatek,mt7623-hdmi-phy']
   	'mediatek,mt2701-hdmi-phy' was expected
   	'mediatek,mt8173-hdmi-phy' was expected
   	'mediatek,mt8195-hdmi-phy' was expected
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,hdmi-phy.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
