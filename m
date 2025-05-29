Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFAB21884B
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748520010; cv=none; b=U8Ve4llioC4MkrYJjhjwCWOHzy21PkD1pqZhQgTiZJEcExxN2uRonWvHwSH1VDHmeEJsNvaRmH/CZCaA4OJKS44TlD1thUOQlLouAX3T5LTHFVy9HtV0N26kwm8TV/CSvXRleAzAWlIAKDRUUJvvt4Xf5udyRCBU2tf7IOpeB6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748520010; c=relaxed/simple;
	bh=OTzhkQzNBbzH0gnNtWUsAUmyVFFZU+xGr0A2YnWg6a8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lnUBeJbgyjGdJG8wEtWM9srwqWuM/h8MYmJm37ZwIjchGz9F7I6qphmnWKZHrHRAxsv6Xm63ew4i0LZEFnY5kt7hLGKiz7+YXUUOsYsRTO5lVZ2zY840hFJb5niJ0J+1R4BfTt0cf1qOQAXczdduaFMHms9G3W99P9Gj6MyKHTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLiCzjYe; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLiCzjYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748520009; x=1780056009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OTzhkQzNBbzH0gnNtWUsAUmyVFFZU+xGr0A2YnWg6a8=;
  b=VLiCzjYe53MPFakHCsxk+qoKq6isxOQ9aVYVjOxbijV/7n7TUlE4cEzp
   zvaicnA0KB8V1119ZyzQBny9Z0P8WHNldZ28UqWFG/H17RgsG7cFm3yIq
   g4WsgdpfaBw+ikd4YP+SGZpcyhvZ/UwyPp0JtJalOjLTl8EhEsFvTB1k/
   izQWwR56DVXfZydmXqpc0TluIBByl7jvrhA6stmHzEgvBtNsQOH2aYka5
   d3voQDosuWaBCo3EyQpCugw2Vc3riWd1lV/77zdw/D13eBEdQQkVdu8Fx
   ym3Uot9wrd4GWjBSL9PKVfcSaNLM4Fmq89bW77+h5l41/QRYZOVv0bDBD
   A==;
X-CSE-ConnectionGUID: 74+xi8KBQq6YfgikQj1d5g==
X-CSE-MsgGUID: UXbBL/iqQ8W4hvy+wrJRkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50275116"
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="50275116"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 05:00:08 -0700
X-CSE-ConnectionGUID: 1PhCCpPjRV+IKFvca1xmtA==
X-CSE-MsgGUID: QWwWyWSzSmWoCt1wHdjA/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,192,1744095600"; 
   d="scan'208";a="143882737"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 May 2025 05:00:06 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKbvX-000Weu-2s;
	Thu, 29 May 2025 12:00:03 +0000
Date: Thu, 29 May 2025 19:59:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/fsl/oca4080.dtb: crypto@300000 (fsl,sec-v4.0):
 'fsl,iommu-parent' does not match any of the regexes: '^jr@[0-9a-f]+$',
 '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
Message-ID: <202505291913.vXErruGg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90b83efa6701656e02c86e7df2cb1765ea602d07
commit: ce4f2199a099c1394ad2343c0e3393690d0cd08f dt-bindings: mmc: mmc-spi-slot: Change voltage-ranges to uint32-matrix
date:   11 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 11 months ago
config: powerpc-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250529/202505291913.vXErruGg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250529/202505291913.vXErruGg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505291913.vXErruGg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: crypto@300000 (fsl,sec-v4.0): 'fsl,iommu-parent' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: sec_mon@314000 (fsl,sec-v4.0-mon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.0-mon'] is too short
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v4.0-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: sec_mon@314000 (fsl,sec-v4.0-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/qman@318000: failed to match any schema with compatible: ['fsl,qman']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/bman@31a000: failed to match any schema with compatible: ['fsl,bman']
--
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: serial@11d600 (fsl,ns16550): Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: crypto@300000 (fsl,sec-v4.0): 'fsl,iommu-parent' does not match any of the regexes: '^jr@[0-9a-f]+$', '^pinctrl-[0-9]+$', '^rtic@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: sec_mon@314000 (fsl,sec-v4.0-mon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v4.0-mon'] is too short
   	'fsl,sec-v5.0-mon' was expected
   	'fsl,sec-v4.0-mon' is not one of ['fsl,sec-v5.3-mon', 'fsl,sec-v5.4-mon']
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: sec_mon@314000 (fsl,sec-v4.0-mon): interrupts: [[93, 2, 0, 0]] is too short
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0-mon.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/qman@318000: failed to match any schema with compatible: ['fsl,qman']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/bman@31a000: failed to match any schema with compatible: ['fsl,bman']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
