Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F9927A123
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Sep 2025 22:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756853353; cv=none; b=YZv/WPKcPpbE3glXM7Mo9hsi/32yMURCh5Ke2obqMMrd5uaHUXw+GqZ59JAnPzpmX7zgPYoHaoMEsQIbLulWIpVyRNT356aqBkFu5YF/HjwrePbdcJGfqiwZCATrwznP6JkwfXyEm7n8zvpjAclK9+ohUEZoVeDn5miiuELALzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756853353; c=relaxed/simple;
	bh=JumGo/mQkuicdlq6cXs2m23+Tjm/7g1co3TtLez9BiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hm/9NwPjLBrP0jEZMftmj8IoKJT/YPRZPi8PvsBpkxPgPpo3rp4Sj2zHVnV5axsRESnlSgKV6mm1WhGFPJ0MAG5U3HDxYD1RY0tO2M5MSsyXaCzE2q5p3GyGx34wlkGw0UpTaCvUavdFgyICUVAjYgEXvnVsw28URP6cLC6phaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=au32lSkP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="au32lSkP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756853349; x=1788389349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JumGo/mQkuicdlq6cXs2m23+Tjm/7g1co3TtLez9BiA=;
  b=au32lSkP3g98iIzE1UM8NDeCYvQ23o+SoFuasqLMMgUG4kgQ3nDoIyCR
   PlpYOeb+Zm92bNq36AenWyt6WRxgqVFNhIDKwTsbJUNn+TP1MY7sM2rDS
   KUPr7C1CU7jZ1c4ESHgovU9VcFsrrx8kO6flBFqsQoweChyiWEc0asvW8
   m9ig6Pzs2PiDvAAx/S58fLfojL3yElvt/yJEw0HOs8Dwn3140bZ7TFWYj
   rC7PHHpdaEiT8hYFVPEBGV1UrTxVfCWPb4pnCehdU28AjMVl6oLqrTrQc
   EA3xwN8WAxEiEACWoMjDA6iXv7zoc42AwYF+5yDAPIbMC6tQUKTNyUlZw
   g==;
X-CSE-ConnectionGUID: u4w7GSU2QAyAedYuCvIgfg==
X-CSE-MsgGUID: VUnvIhNRQFazRkqkNwl3iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="58185060"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="58185060"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 15:49:08 -0700
X-CSE-ConnectionGUID: L2fB6O2bQWG8OIKXgXaDTw==
X-CSE-MsgGUID: XKJZI42ERk2LbEyZGdqFzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; 
   d="scan'208";a="170980210"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Sep 2025 15:49:06 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utZoF-00035r-1q;
	Tue, 02 Sep 2025 22:49:03 +0000
Date: Wed, 3 Sep 2025 06:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sailus-media-tree:master 229/232]
 arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e10000
 (fsl,imx8mp-isp): power-domains: [[103, 6]] is too short
Message-ID: <202509030629.KFGMDK63-lkp@intel.com>
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
CC: linux-media@vger.kernel.org
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC: Hans Verkuil <hverkuil@xs4all.nl>
CC: "Rob Herring (Arm)" <robh@kernel.org>

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   603957ae903e81fb80d3788297c0f58a68802dfc
commit: 4435a7a3fc283011a7b3e9c3b157aac8384333bd [229/232] dt-bindings: media: rkisp1: Add second power domain on i.MX8MP
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250831 (https://download.01.org/0day-ci/archive/20250903/202509030629.KFGMDK63-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ac23f7465eedd0dd565ffb201f573e7a69695fa3)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250903/202509030629.KFGMDK63-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509030629.KFGMDK63-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[103, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[103, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[100, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[100, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[75, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[75, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[77, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[77, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[120, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[120, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[109, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk2.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[109, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-som.dtsi:266.9-278.5: Warning (graph_child_address): /soc@0/bus@30800000/i2c@30a40000/bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[118, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-dhcom-picoitx.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[118, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[64, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[64, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[68, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-iota2-lumpy.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[68, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[105, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-bl-osm-s.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[105, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[109, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-smarc-eval-carrier.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[109, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[100, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[100, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[71, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-navqp.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[71, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[91, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[91, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[67, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-nitrogen-smarc-universal-board.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[67, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[87, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[87, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[90, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[90, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[93, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[93, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[91, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revb-mi1010ait-1cp1.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[91, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[91, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[91, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[91, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[91, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[123, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[123, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[111, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[111, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[71, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[71, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[78, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw71xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[78, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[84, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw72xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[84, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[86, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw73xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[86, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[81, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw75xx-2x.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[81, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[115, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[115, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[115, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[115, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[113, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[113, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[114, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[114, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[113, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-nonwifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[113, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[120, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dahlia.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[120, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[120, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-dev.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[120, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[118, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-ivy.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[118, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[119, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-mallow.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[119, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[118, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-verdin-wifi-yavia.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[118, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-pcie-ep.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[111, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[111, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[111, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvhg33-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[111, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[100, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-aristainetos3-helios-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[100, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[105, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-kontron-dl.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[105, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[100, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-libra-rdk-fpsc-lvds.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[100, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av123z7m-n17.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-lvds1-imx-lvds-hdmi.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-evk-mx8-dlvds-lcd1.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[97, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-g133han01.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[111, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' is a required property
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[111, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-imx219.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
--
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e10000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e10000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e20000 (fsl,imx8mp-isp): clock-names: ['isp', 'aclk', 'hclk'] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e20000 (fsl,imx8mp-isp): clocks: [[2, 276], [2, 270], [2, 269]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx-rpidsi.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[92, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
