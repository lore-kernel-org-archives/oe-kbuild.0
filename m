Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A9619DF8D
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 11:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178875; cv=none; b=lANt1/V8XJpaH6oYF2nJeUGmCRsVESrmZkb4QwHVaGi8K3hgiMq/yV9GSSRiMO4p1bAbBpMk2KVBZWDybAOkJzZsmcboEjWYrWPHs/OxJmYLnRH64Mu4kSRrpqWM8Q+Es3r/mhN4W1cLf+QxwpSmfn3vkaoqem2WSQ3T48keX3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178875; c=relaxed/simple;
	bh=vVE7p8jqojDo8sr2uMvTBgcBOC04KkkI+FumoQIuyAs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=t5+E6pqJdnYzvRt2BQ2zD+yhqxU/ZtSRUpjXwZyJiaoF1G6KsP962HZfejGbAHZCgwSPl8zzHTtRfR72KScZHnvBCCv5m12caIAb5Z9wdOJ8TTv9CPy4hyPKhdsDr+HmjTzqpoEWgAneSPFpeGh6M4AxUkPd4OPfRkrY9cjH864=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G1aWPIP6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G1aWPIP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767178874; x=1798714874;
  h=date:from:to:cc:subject:message-id;
  bh=vVE7p8jqojDo8sr2uMvTBgcBOC04KkkI+FumoQIuyAs=;
  b=G1aWPIP62YikWKf5XMOSKprRux8FLVLfwMjUsUVVWlr7HkEymRjv53ob
   LvhzqPS9VHLw83Bd79wwxD3CB3fZkhluPUga+SYZ0JmD7+mV4XFGPbvAf
   k1G/yrEcqVZoZmD+pzTfJ/rHwkudDdzibZ0PCSA5Yertk2x1q6sxvU4Ul
   xdlq0FA2nRh8muMkVxUFKd6fR2evSiEcPo0d2Ff0A+5Lwk8gjxfA1yGND
   NhlQSAiQEcC3P5GXlRGnOwu+FzHeZIChnDIUJHY5Vg25pQ8FuoFCwyId4
   EP/QHH5aal+1H/1R4reLFH5iwW04ysezBMuuB5UaLUhHtBjE+51IlZTIk
   g==;
X-CSE-ConnectionGUID: 0C9u5tpiRA2d5WQ9CuNrKg==
X-CSE-MsgGUID: S8gd4m7fR4+6m7Qdjh64mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="68725560"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="68725560"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 02:55:50 -0800
X-CSE-ConnectionGUID: U0cSxqtaQy+MoZiB6NgSqw==
X-CSE-MsgGUID: noxmfYjCR+CZSjYD3JJbIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; 
   d="scan'208";a="232107426"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 31 Dec 2025 02:55:49 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vatrm-00000000037-1DFY;
	Wed, 31 Dec 2025 10:55:46 +0000
Date: Wed, 31 Dec 2025 11:54:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:mediatek/dt64 4/27]
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb:
 jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0',
 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes:
 '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
Message-ID: <202512311122.IGNiWM9R-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Macpaul Lin <macpaul.lin@mediatek.com>
CC: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git mediatek/dt64
head:   9b2d2beaefcfa17259fdbce16d59d660894147cb
commit: e6bd92bb204757a7b1f4b4dc263a82b3985fadd3 [4/27] arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board
:::::: branch date: 8 weeks ago
:::::: commit date: 3 months ago
config: arm64-randconfig-2055-20251230 (https://download.01.org/0day-ci/archive/20251231/202512311122.IGNiWM9R-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512311122.IGNiWM9R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512311122.IGNiWM9R-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi:1172.7-1180.4: Warning (graph_child_address): /soc/syscon@1c01a000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: infra-iommu@10315000 (mediatek,mt8195-iommu-infra): interrupts: [[0, 795, 4, 0], [0, 796, 4, 0], [0, 797, 4, 0], [0, 798, 4, 0], [0, 799, 4, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/mediatek,iommu.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-decoder@1a040000 (mediatek,mt8195-jpgdec): 'jpgdec@0,0', 'jpgdec@0,10000', 'jpgdec@1,0' do not match any of the regexes: '^jpgdec@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegdec.yaml
>> arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dtb: jpeg-encoder@1a030000 (mediatek,mt8195-jpgenc): 'jpgenc@0,0', 'jpgenc@1,0' do not match any of the regexes: '^jpgenc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,mt8195-jpegenc.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
