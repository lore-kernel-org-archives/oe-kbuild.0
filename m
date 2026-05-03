Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C251DF27D
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 19:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777838246; cv=none; b=mbNFRXfzlUNZOCLeguop2aI4pnBX5OX/K1B+wRu7TuPJUsL+gXq77S4SoFnLZqKKvIlQm64EzXdzcUc8l9Vuq/drzp+SjQQGiwsUUCMzJ81GkdsTVGV9GtJYpcOG9g+NUZ/lZl+iXkRW2RtFORFSYMCgewy1j2BcODCn4xovaeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777838246; c=relaxed/simple;
	bh=iz/Y9ynZwZOXe8Ba2CPfkPB/R6KQlmICRSIq2kvxKec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kBLw3p0HwXaL/4fnJC2I3pGF9CqBwno5k5hKss1cUf8M5FQr7Wekg7vrBZE8JKm++q3WfMJE647KRyIjW/A9MV7cArmC+8Fs4qC4n8OBprgYe60WEF14mAHJnIv1/3DpYZcPoh/X5JUIse4IUcaXiBryQ4zPOfAuaoXC56EOrg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRq374j1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRq374j1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777838244; x=1809374244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iz/Y9ynZwZOXe8Ba2CPfkPB/R6KQlmICRSIq2kvxKec=;
  b=NRq374j1Ad7FefPOtaGryQOsHZ4KhkowPIWqBpdNqZD7D/1yLvetICr5
   6YAM/YN1F/hJtUHSaxww4BHKxzT/j8jdiguGfLuDK2RRWMTYttTY/l76+
   kXTiphvEZKI31m2IVBQZE/1lVCW3SI1geYprCAJ/Gfq44VdDMItIeU9UV
   YtjXZI2mV62t1IHzFsX0pM14favnWrcI8Mq1gVY+5A+zOXPchwNBm9gKr
   jIctheQAtVWfzVdQcUoE6LFELLhuFAo+ndgfKfufPfVHKCyfQGGdr5tKi
   s/jrS8lsUT4IdwFcBjIxcyIw9x/rYo0dPd6sd+swBVFFL4fEULXwjZSg2
   Q==;
X-CSE-ConnectionGUID: 5NbgyZ6RTSyD41gVAslrLQ==
X-CSE-MsgGUID: sNzCBFb9SG+3bsx/JnygVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="96275370"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="96275370"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 12:57:23 -0700
X-CSE-ConnectionGUID: RrB8mL9hSnSoBmBrcCxT5g==
X-CSE-MsgGUID: yeYvb52kQx6hNLlE15lKBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="234310825"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 03 May 2026 12:57:23 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJcwK-000000005bt-1dQ0;
	Sun, 03 May 2026 19:57:20 +0000
Date: Sun, 3 May 2026 21:57:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA
 bounce buffer to host
Message-ID: <202605032134.1IrhSdOn-lkp@intel.com>
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
In-Reply-To: <20260430120725.241779-1-wenst@chromium.org>
References: <20260430120725.241779-1-wenst@chromium.org>
TO: "Chen-Yu Tsai" <wenst@chromium.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: "Chen-Yu Tsai" <wenst@chromium.org>
CC: linux-mediatek@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Chen-Yu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20260430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Yu-Tsai/arm64-dts-mediatek-mt8192-asurada-Move-PCIe-DMA-bounce-buffer-to-host/20260503-093251
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260430120725.241779-1-wenst%40chromium.org
patch subject: [PATCH] arm64: dts: mediatek: mt8192-asurada: Move PCIe DMA bounce buffer to host
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-2052-20260503 (https://download.01.org/0day-ci/archive/20260503/202605032134.1IrhSdOn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605032134.1IrhSdOn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605032134.1IrhSdOn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pcie@11230000 (mediatek,mt8192-pcie): Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pcie@0,0: wifi@0,0:reg:0:4: 0 was expected
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: pcie@0,0: wifi@0,0:reg: [[65536, 0, 0, 0, 1048576], [65536, 0, 1048576, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dtb: flash@0 (winbond,w25q64jwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['winbond,w25q64jwm', 'jedec,spi-nor'] is too long
   	'winbond,w25q64jwm' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at(25|26)df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'winbond,w25q64jwm' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected
--
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pmic (mediatek,mt6359): '#sound-dai-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
>> arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pcie@11230000 (mediatek,mt8192-pcie): Unevaluated properties are not allowed ('memory-region' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/mediatek-pcie-gen3.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pcie@0,0: wifi@0,0:reg:0:4: 0 was expected
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: pcie@0,0: wifi@0,0:reg: [[65536, 0, 0, 0, 1048576], [65536, 0, 1048576, 0, 1048576]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml
   arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dtb: flash@0 (winbond,w25q64jwm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['winbond,w25q64jwm', 'jedec,spi-nor'] is too long
   	'winbond,w25q64jwm' does not match '^((((micron|spansion|st),)?(m25p(40|80|16|32|64|128)|n25q(32b|064|128a11|128a13|256a|512a|164k)))|atmel,at(25|26)df(321a|641|081a)|everspin,mr25h(10|40|128|256)|(mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|25635e)|(mxicy|macronix),mx25u(4033|4035)|(spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|(sst|microchip),sst25vf(016b|032b|040b)|(sst,)?sst26wf016b|(sst,)?sst25wf(040b|080)|winbond,w25x(80|32)|(winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$'
   	'winbond,w25q64jwm' is not one of ['issi,is25lp016d', 'micron,mt25qu02g', 'mxicy,mx25r1635f', 'mxicy,mx25u6435f', 'mxicy,mx25v8035f', 'spansion,s25sl12801', 'spansion,s25fs512s']
   	'jedec,spi-nor' was expected

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
