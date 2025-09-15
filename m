Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 170102E63C
	for <oe-kbuild@lists.linux.dev>; Mon, 15 Sep 2025 01:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757898948; cv=none; b=ijvHhaQyoi7RbQGR8lca1UJUzxf8lVEEjJ2iAxVzoO0kP5fzXXqLu7PV9QmCRIj73Bn4q8VB+89bHTcO9ya22FONrviqiWHUuCDrAW6Zzb/CyhOw8J27z2W4n3CtBD/aih1Lk8s4MjUnrIkrq11ePRhqP4XpbU79d1Q/lKaWANQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757898948; c=relaxed/simple;
	bh=JEBos+rzZ3NzgfrVIoKxsuijJv/wFjdZ/YAOm1DellM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mzOQ5bz+H9dG8OcmfIbrsgfqvmXRl4bjRl5gA4QnbPkPLjYtfxL0gzVjNhHaN9U6IpuBfAYinP70g+6SGUyo/BtSw8oj6fvr4skljeYD3JF/rhsgqOKfASqaIODPpI/ADxdfHGxvoGNJPOYE0hGagPrVlB+hoZjDsD2KejNAXKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOczWeyE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOczWeyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757898946; x=1789434946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JEBos+rzZ3NzgfrVIoKxsuijJv/wFjdZ/YAOm1DellM=;
  b=HOczWeyEW7OFNX5SBx6aUdm0g+e/43wQe7Qyz7SsWA8+Vwvl+3eAANsX
   +nxJPEqUSfXd368O5kEwMs+TFKOzm3XrMd6GxYQLLgDqWJet9KHhjsbnT
   HNhhpHH1Y9z7RSSHeA3zxEghfUAoZK26yRp0nAm7Alk5MxGo9aN+MCE9u
   fgqYnvrhSkZ8IH1fbLR9xWAbOtSdHUNQEKII5sAy8YHqnGg5ATkc3ir8x
   KNsP06pN33CoQfJiIV2vza9aNovdjhCO1AN4CvQc2qjGFerth/QmT0XlX
   jgJv5MXDOP1r0EnHcLkrypuG+qrB3vQh4Lxl1/oRj1+JN+0HfXQXk/eP9
   g==;
X-CSE-ConnectionGUID: tvWPzOpVTTmf7sHAX7aGYg==
X-CSE-MsgGUID: D5pb44FES4yHv0BiUbPVNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="59190101"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="59190101"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 18:15:45 -0700
X-CSE-ConnectionGUID: 81cm6kKuTE2ch5Ou8ZNkEg==
X-CSE-MsgGUID: C5Pjc5YsQ1i82BeQoGFQ5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="173630585"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 14 Sep 2025 18:15:44 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uxxoj-000000001vF-0zrh;
	Mon, 15 Sep 2025 01:15:41 +0000
Date: Mon, 15 Sep 2025 03:15:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 50/75]
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb:
 can-phy0 (ti,tcan1051): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202509150311.TTJZK1N1-lkp@intel.com>
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
TO: Maud Spierings <maudspierings@gocontroll.com>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   dc8662956496d2bfeee95eca3cf57d7b9a8f2ba4
commit: cc5717bb35c1c1eb5e8f2db37f938c329b8e530a [50/75] arm64: dts: freescale: imx8mp-moduline-display-106: Use phys to replace xceiver-supply
:::::: branch date: 12 hours ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2051-20250914 (https://download.01.org/0day-ci/archive/20250915/202509150311.TTJZK1N1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509150311.TTJZK1N1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509150311.TTJZK1N1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[92, 6], [92, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e20000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[92, 6], [92, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: can-phy0 (ti,tcan1051): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,tcan1051', 'ti,tcan1042'] is too long
   	'ti,tcan1051' is not one of ['microchip,ata6561']
   	'ti,tcan1051' is not one of ['ti,tcan1042', 'ti,tcan1043', 'nxp,tjr1443']
   	from schema $id: http://devicetree.org/schemas/phy/ti,tcan104x-can.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: /can-phy0: failed to match any schema with compatible: ['ti,tcan1051', 'ti,tcan1042']
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: can-phy1 (ti,tcan1051): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,tcan1051', 'ti,tcan1042'] is too long
   	'ti,tcan1051' is not one of ['microchip,ata6561']
   	'ti,tcan1051' is not one of ['ti,tcan1042', 'ti,tcan1043', 'nxp,tjr1443']
   	from schema $id: http://devicetree.org/schemas/phy/ti,tcan104x-can.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: /can-phy1: failed to match any schema with compatible: ['ti,tcan1051', 'ti,tcan1042']
--
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[92, 6], [92, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e20000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[92, 6], [92, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: can-phy0 (ti,tcan1051): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,tcan1051', 'ti,tcan1042'] is too long
   	'ti,tcan1051' is not one of ['microchip,ata6561']
   	'ti,tcan1051' is not one of ['ti,tcan1042', 'ti,tcan1043', 'nxp,tjr1443']
   	from schema $id: http://devicetree.org/schemas/phy/ti,tcan104x-can.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: /can-phy0: failed to match any schema with compatible: ['ti,tcan1051', 'ti,tcan1042']
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: can-phy1 (ti,tcan1051): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,tcan1051', 'ti,tcan1042'] is too long
   	'ti,tcan1051' is not one of ['microchip,ata6561']
   	'ti,tcan1051' is not one of ['ti,tcan1042', 'ti,tcan1043', 'nxp,tjr1443']
   	from schema $id: http://devicetree.org/schemas/phy/ti,tcan104x-can.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: /can-phy1: failed to match any schema with compatible: ['ti,tcan1051', 'ti,tcan1042']
--
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[92, 6], [92, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e20000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[92, 6], [92, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: can-phy0 (ti,tcan1051): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,tcan1051', 'ti,tcan1042'] is too long
   	'ti,tcan1051' is not one of ['microchip,ata6561']
   	'ti,tcan1051' is not one of ['ti,tcan1042', 'ti,tcan1043', 'nxp,tjr1443']
   	from schema $id: http://devicetree.org/schemas/phy/ti,tcan104x-can.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: /can-phy0: failed to match any schema with compatible: ['ti,tcan1051', 'ti,tcan1042']
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: can-phy1 (ti,tcan1051): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,tcan1051', 'ti,tcan1042'] is too long
   	'ti,tcan1051' is not one of ['microchip,ata6561']
   	'ti,tcan1051' is not one of ['ti,tcan1042', 'ti,tcan1043', 'nxp,tjr1443']
   	from schema $id: http://devicetree.org/schemas/phy/ti,tcan104x-can.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: /can-phy1: failed to match any schema with compatible: ['ti,tcan1051', 'ti,tcan1042']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
