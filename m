Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062B82F22
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jul 2024 03:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722396919; cv=none; b=VX2UTo/7HwbSg/0zaTSKoOKa4fYeM9NX94J/BdEOS4eVFAxvJZKpvK+R7q5IsVQpA2hgAM4gPD+0PLA1T3CQ1X7hhS7tLeBP62X7lN2gIbbyDx1jtYrFMdOFmA+bIyuqrvVd6T3wzuSWKx486E3ihMFxgLR2HAG2yVPUaJJ7Z9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722396919; c=relaxed/simple;
	bh=xmm2c+h85Rd0qTqz2EURxeMQHbcQd9Exbb2WsXJhFNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qa3TsJrUWZg1C4LnxbNmIT8NqbCm6DyNCraVRCPypq8U24oocJt9brfgWAYd6Vw/n2nknEg3Szsqws3ende82UVSRahXJPvuXPBKDmZUvH9/SkLJA2nkhhgjdaRQDg1LQEe6mu+E9SGpQGWfwmotjuNcy9lWFmAU+fivmSJXv3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E6yshhie; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E6yshhie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722396914; x=1753932914;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xmm2c+h85Rd0qTqz2EURxeMQHbcQd9Exbb2WsXJhFNU=;
  b=E6yshhieWvjOoCREWIt6Km30dQD0uNuj8WD+nB8lj59W+HCZIfgocamL
   UAWkeO77G3G6Qv2LoaeUjRZ9C8zH40bqMDqGH9HpcRceg+6hiAxEX1BSb
   u3IPzu8+IXzE/xsecHV+uxBX6GAQN4I+JXBHv6WwebyAhp7sFm0FzSRyJ
   of6Xo9i79MQB9DG97edSLoITF2kwviqxYKgqo/wDnP/gAHvYyKr7YoQQc
   rc2OH8js5zF7+e1JqO+M5e02uQjadIuj3fs44p3rJmg0BKigYeLGrbbws
   t7h2uZ0AK7jh4kMkqPtRSjvFH0L3bpyLRrQxrijxL/c12LwG5chTpi98+
   g==;
X-CSE-ConnectionGUID: jibdr47QRHei1iBxrQ81YQ==
X-CSE-MsgGUID: XogzsDlYSz+fJPJbzuZvBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="24119528"
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="24119528"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 20:35:13 -0700
X-CSE-ConnectionGUID: CjUH80LQRD+5h/tjipXzkQ==
X-CSE-MsgGUID: ckY1KRFpRFeSLhJVDYqIhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,250,1716274800"; 
   d="scan'208";a="54588651"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Jul 2024 20:35:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZ07J-000thc-2x;
	Wed, 31 Jul 2024 03:35:09 +0000
Date: Wed, 31 Jul 2024 11:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.11-rc 26/39]
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1135.27-1300.5: Warning
 (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202407311156.Id7zXoNe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.11-rc
head:   d0b454428b65bf8df63ee618297329981b9658e7
commit: c4096ea06f912ec7a6609a861a45b892b9067bfd [26/39] dts: arm64: mediatek: add MT7988A reference board device tree
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-051-20240731 (https://download.01.org/0day-ci/archive/20240731/202407311156.Id7zXoNe-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ccae7b461be339e717d02f99ac857cf0bc7d17fc)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407311156.Id7zXoNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407311156.Id7zXoNe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1019.23-1040.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1052.23-1074.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1019.23-1040.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1052.23-1074.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1135.27-1300.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: opp_table0: $nodename:0: 'opp_table0' does not match '^opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: opp_table0: Unevaluated properties are not allowed ('opp-shared', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: cci: compatible:0: 'mediatek,mt7988-cci' is not one of ['mediatek,mt8183-cci', 'mediatek,mt8186-cci']
   	from schema $id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: cci: compatible: ['mediatek,mt7988-cci', 'mediatek,mt8183-cci'] is too long
   	from schema $id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: cci: 'proc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/interconnect/mediatek,cci.yaml#
--
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pinctrl@1001f000: reg: [[0, 268562432, 0, 4096], [0, 297861120, 0, 4096], [0, 298844160, 0, 4096], [0, 298975232, 0, 4096], [0, 299892736, 0, 4096], [0, 300941312, 0, 4096], [0, 268480512, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/pinctrl@1001f000: failed to match any schema with compatible: ['mediatek,mt7988-pinctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys0', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7622-sgmiisys', 'mediatek,mt7629-sgmiisys', 'mediatek,mt7981-sgmiisys_0', 'mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_0', 'mediatek,mt7986-sgmiisys_1']
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10060000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/syscon@10060000: failed to match any schema with compatible: ['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys0', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys1', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7622-sgmiisys', 'mediatek,mt7629-sgmiisys', 'mediatek,mt7981-sgmiisys_0', 'mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_0', 'mediatek,mt7986-sgmiisys_1']
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: syscon@10070000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/syscon@10070000: failed to match any schema with compatible: ['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys1', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pcs@10080000: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: pcs@10081000: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi@11001000: clock-names:0: 'nfi_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: spi@11001000: clock-names:1: 'pad_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/ecc@11002000: failed to match any schema with compatible: ['mediatek,mt7686-ecc']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: i2c@11003000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-i2c', 'mediatek,mt7981-i2c'] is too long
--
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1019.23-1040.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1052.23-1074.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dts:25.9-27.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1019.23-1040.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1052.23-1074.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1135.27-1300.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /: memory: False schema does not allow {'reg': [[0, 1073741824, 0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /: memory: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /: failed to match any schema with compatible: ['mediatek,mt7988a-rfb', 'mediatek,mt7988']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /: failed to match any schema with compatible: ['mediatek,mt7988a-rfb', 'mediatek,mt7988']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: opp_table0: $nodename:0: 'opp_table0' does not match '^opp-table(-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/opp/opp-v2.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: opp_table0: Unevaluated properties are not allowed ('opp-shared', 'opp00', 'opp01', 'opp02', 'opp03' were unexpected)
--
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: pinctrl@1001f000: reg: [[0, 268562432, 0, 4096], [0, 297861120, 0, 4096], [0, 298844160, 0, 4096], [0, 298975232, 0, 4096], [0, 299892736, 0, 4096], [0, 300941312, 0, 4096], [0, 268480512, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/pinctrl@1001f000: failed to match any schema with compatible: ['mediatek,mt7988-pinctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10060000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys0', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7622-sgmiisys', 'mediatek,mt7629-sgmiisys', 'mediatek,mt7981-sgmiisys_0', 'mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_0', 'mediatek,mt7986-sgmiisys_1']
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10060000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10060000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/syscon@10060000: failed to match any schema with compatible: ['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys0', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10070000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys1', 'syscon', 'simple-mfd'] is too long
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7622-sgmiisys', 'mediatek,mt7629-sgmiisys', 'mediatek,mt7981-sgmiisys_0', 'mediatek,mt7981-sgmiisys_1', 'mediatek,mt7986-sgmiisys_0', 'mediatek,mt7986-sgmiisys_1']
   	'mediatek,mt7988-sgmiisys' is not one of ['mediatek,mt7988-sgmiisys0', 'mediatek,mt7988-sgmiisys1']
   	'syscon' was expected
   	'simple-mfd' was expected
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10070000: pcs: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: syscon@10070000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,sgmiisys.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/syscon@10070000: failed to match any schema with compatible: ['mediatek,mt7988-sgmiisys', 'mediatek,mt7988-sgmiisys1', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: pcs@10080000: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: pcs@10081000: '#pcs-cells', 'phys' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/pcs/mediatek,usxgmii.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: spi@11001000: clock-names:0: 'nfi_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: spi@11001000: clock-names:1: 'pad_clk' was expected
   	from schema $id: http://devicetree.org/schemas/spi/mediatek,spi-mtk-snfi.yaml#
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: /soc/ecc@11002000: failed to match any schema with compatible: ['mediatek,mt7686-ecc']
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dtb: i2c@11003000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt7988-i2c', 'mediatek,mt7981-i2c'] is too long

vim +1135 arch/arm64/boot/dts/mediatek/mt7988a.dtsi

6c1d134a103f68 Rafał Miłecki 2024-01-08    11  
6c1d134a103f68 Rafał Miłecki 2024-01-08    12  / {
6c1d134a103f68 Rafał Miłecki 2024-01-08    13  	compatible = "mediatek,mt7988a";
6c1d134a103f68 Rafał Miłecki 2024-01-08    14  	interrupt-parent = <&gic>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    15  	#address-cells = <2>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    16  	#size-cells = <2>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    17  
6c1d134a103f68 Rafał Miłecki 2024-01-08    18  	cpus {
6c1d134a103f68 Rafał Miłecki 2024-01-08    19  		#address-cells = <1>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    20  		#size-cells = <0>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    21  
c4096ea06f912e Daniel Golle  2023-02-22    22  		cpu0: cpu@0 {
6c1d134a103f68 Rafał Miłecki 2024-01-08    23  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki 2024-01-08    24  			reg = <0x0>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    25  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki 2024-01-08    26  			enable-method = "psci";
c4096ea06f912e Daniel Golle  2023-02-22    27  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22    28  				 <&topckgen CLK_TOP_XTAL>;
c4096ea06f912e Daniel Golle  2023-02-22    29  			clock-names = "cpu", "intermediate";
c4096ea06f912e Daniel Golle  2023-02-22    30  			operating-points-v2 = <&cluster0_opp>;
c4096ea06f912e Daniel Golle  2023-02-22    31  			mediatek,cci = <&cci>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    32  		};
6c1d134a103f68 Rafał Miłecki 2024-01-08    33  
c4096ea06f912e Daniel Golle  2023-02-22    34  		cpu1: cpu@1 {
6c1d134a103f68 Rafał Miłecki 2024-01-08    35  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki 2024-01-08    36  			reg = <0x1>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    37  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki 2024-01-08    38  			enable-method = "psci";
c4096ea06f912e Daniel Golle  2023-02-22    39  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22    40  				 <&topckgen CLK_TOP_XTAL>;
c4096ea06f912e Daniel Golle  2023-02-22    41  			clock-names = "cpu", "intermediate";
c4096ea06f912e Daniel Golle  2023-02-22    42  			operating-points-v2 = <&cluster0_opp>;
c4096ea06f912e Daniel Golle  2023-02-22    43  			mediatek,cci = <&cci>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    44  		};
6c1d134a103f68 Rafał Miłecki 2024-01-08    45  
c4096ea06f912e Daniel Golle  2023-02-22    46  		cpu2: cpu@2 {
6c1d134a103f68 Rafał Miłecki 2024-01-08    47  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki 2024-01-08    48  			reg = <0x2>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    49  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki 2024-01-08    50  			enable-method = "psci";
c4096ea06f912e Daniel Golle  2023-02-22    51  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22    52  				 <&topckgen CLK_TOP_XTAL>;
c4096ea06f912e Daniel Golle  2023-02-22    53  			clock-names = "cpu", "intermediate";
c4096ea06f912e Daniel Golle  2023-02-22    54  			operating-points-v2 = <&cluster0_opp>;
c4096ea06f912e Daniel Golle  2023-02-22    55  			mediatek,cci = <&cci>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    56  		};
6c1d134a103f68 Rafał Miłecki 2024-01-08    57  
c4096ea06f912e Daniel Golle  2023-02-22    58  		cpu3: cpu@3 {
6c1d134a103f68 Rafał Miłecki 2024-01-08    59  			compatible = "arm,cortex-a73";
6c1d134a103f68 Rafał Miłecki 2024-01-08    60  			reg = <0x3>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    61  			device_type = "cpu";
6c1d134a103f68 Rafał Miłecki 2024-01-08    62  			enable-method = "psci";
c4096ea06f912e Daniel Golle  2023-02-22    63  			clocks = <&mcusys CLK_MCU_ARM_DIV_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22    64  				 <&topckgen CLK_TOP_XTAL>;
c4096ea06f912e Daniel Golle  2023-02-22    65  			clock-names = "cpu", "intermediate";
c4096ea06f912e Daniel Golle  2023-02-22    66  			operating-points-v2 = <&cluster0_opp>;
c4096ea06f912e Daniel Golle  2023-02-22    67  			mediatek,cci = <&cci>;
6c1d134a103f68 Rafał Miłecki 2024-01-08    68  		};
c4096ea06f912e Daniel Golle  2023-02-22    69  
c4096ea06f912e Daniel Golle  2023-02-22    70  		cluster0_opp: opp_table0 {
c4096ea06f912e Daniel Golle  2023-02-22    71  			compatible = "operating-points-v2";
c4096ea06f912e Daniel Golle  2023-02-22    72  			opp-shared;
c4096ea06f912e Daniel Golle  2023-02-22    73  			opp00 {
c4096ea06f912e Daniel Golle  2023-02-22    74  				opp-hz = /bits/ 64 <800000000>;
c4096ea06f912e Daniel Golle  2023-02-22    75  				opp-microvolt = <850000>;
c4096ea06f912e Daniel Golle  2023-02-22    76  			};
c4096ea06f912e Daniel Golle  2023-02-22    77  			opp01 {
c4096ea06f912e Daniel Golle  2023-02-22    78  				opp-hz = /bits/ 64 <1100000000>;
c4096ea06f912e Daniel Golle  2023-02-22    79  				opp-microvolt = <850000>;
c4096ea06f912e Daniel Golle  2023-02-22    80  			};
c4096ea06f912e Daniel Golle  2023-02-22    81  			opp02 {
c4096ea06f912e Daniel Golle  2023-02-22    82  				opp-hz = /bits/ 64 <1500000000>;
c4096ea06f912e Daniel Golle  2023-02-22    83  				opp-microvolt = <850000>;
c4096ea06f912e Daniel Golle  2023-02-22    84  			};
c4096ea06f912e Daniel Golle  2023-02-22    85  			opp03 {
c4096ea06f912e Daniel Golle  2023-02-22    86  				opp-hz = /bits/ 64 <1800000000>;
c4096ea06f912e Daniel Golle  2023-02-22    87  				opp-microvolt = <900000>;
c4096ea06f912e Daniel Golle  2023-02-22    88  			};
c4096ea06f912e Daniel Golle  2023-02-22    89  		};
c4096ea06f912e Daniel Golle  2023-02-22    90  	};
c4096ea06f912e Daniel Golle  2023-02-22    91  
c4096ea06f912e Daniel Golle  2023-02-22    92  	cci: cci {
c4096ea06f912e Daniel Golle  2023-02-22    93  		compatible = "mediatek,mt7988-cci",
c4096ea06f912e Daniel Golle  2023-02-22    94  			     "mediatek,mt8183-cci";
c4096ea06f912e Daniel Golle  2023-02-22    95  		clocks = <&mcusys CLK_MCU_BUS_DIV_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22    96  			 <&topckgen CLK_TOP_XTAL>;
c4096ea06f912e Daniel Golle  2023-02-22    97  		clock-names = "cci", "intermediate";
c4096ea06f912e Daniel Golle  2023-02-22    98  		operating-points-v2 = <&cci_opp>;
c4096ea06f912e Daniel Golle  2023-02-22    99  	};
c4096ea06f912e Daniel Golle  2023-02-22   100  
c4096ea06f912e Daniel Golle  2023-02-22   101  	cci_opp: opp_table_cci {
c4096ea06f912e Daniel Golle  2023-02-22   102  		compatible = "operating-points-v2";
c4096ea06f912e Daniel Golle  2023-02-22   103  		opp-shared;
c4096ea06f912e Daniel Golle  2023-02-22   104  		opp00 {
c4096ea06f912e Daniel Golle  2023-02-22   105  			opp-hz = /bits/ 64 <480000000>;
c4096ea06f912e Daniel Golle  2023-02-22   106  			opp-microvolt = <850000>;
c4096ea06f912e Daniel Golle  2023-02-22   107  		};
c4096ea06f912e Daniel Golle  2023-02-22   108  		opp01 {
c4096ea06f912e Daniel Golle  2023-02-22   109  			opp-hz = /bits/ 64 <660000000>;
c4096ea06f912e Daniel Golle  2023-02-22   110  			opp-microvolt = <850000>;
c4096ea06f912e Daniel Golle  2023-02-22   111  		};
c4096ea06f912e Daniel Golle  2023-02-22   112  		opp02 {
c4096ea06f912e Daniel Golle  2023-02-22   113  			opp-hz = /bits/ 64 <900000000>;
c4096ea06f912e Daniel Golle  2023-02-22   114  			opp-microvolt = <850000>;
c4096ea06f912e Daniel Golle  2023-02-22   115  		};
c4096ea06f912e Daniel Golle  2023-02-22   116  		opp03 {
c4096ea06f912e Daniel Golle  2023-02-22   117  			opp-hz = /bits/ 64 <1080000000>;
c4096ea06f912e Daniel Golle  2023-02-22   118  			opp-microvolt = <900000>;
c4096ea06f912e Daniel Golle  2023-02-22   119  		};
c4096ea06f912e Daniel Golle  2023-02-22   120  	};
c4096ea06f912e Daniel Golle  2023-02-22   121  
c4096ea06f912e Daniel Golle  2023-02-22   122  	fan: pwm-fan {
c4096ea06f912e Daniel Golle  2023-02-22   123  		compatible = "pwm-fan";
c4096ea06f912e Daniel Golle  2023-02-22   124  		/* cooling level (0, 1, 2) : (0% duty, 50% duty, 100% duty) */
c4096ea06f912e Daniel Golle  2023-02-22   125  		cooling-levels = <0 128 255>;
c4096ea06f912e Daniel Golle  2023-02-22   126  		#cooling-cells = <2>;
c4096ea06f912e Daniel Golle  2023-02-22   127  		#thermal-sensor-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   128  		status = "disabled";
6c1d134a103f68 Rafał Miłecki 2024-01-08   129  	};
6c1d134a103f68 Rafał Miłecki 2024-01-08   130  
6c1d134a103f68 Rafał Miłecki 2024-01-08   131  	oscillator-40m {
6c1d134a103f68 Rafał Miłecki 2024-01-08   132  		compatible = "fixed-clock";
6c1d134a103f68 Rafał Miłecki 2024-01-08   133  		clock-frequency = <40000000>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   134  		#clock-cells = <0>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   135  		clock-output-names = "clkxtal";
6c1d134a103f68 Rafał Miłecki 2024-01-08   136  	};
6c1d134a103f68 Rafał Miłecki 2024-01-08   137  
6c1d134a103f68 Rafał Miłecki 2024-01-08   138  	pmu {
6c1d134a103f68 Rafał Miłecki 2024-01-08   139  		compatible = "arm,cortex-a73-pmu";
6c1d134a103f68 Rafał Miłecki 2024-01-08   140  		interrupt-parent = <&gic>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   141  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   142  	};
6c1d134a103f68 Rafał Miłecki 2024-01-08   143  
6c1d134a103f68 Rafał Miłecki 2024-01-08   144  	psci {
6c1d134a103f68 Rafał Miłecki 2024-01-08   145  		compatible = "arm,psci-0.2";
6c1d134a103f68 Rafał Miłecki 2024-01-08   146  		method = "smc";
6c1d134a103f68 Rafał Miłecki 2024-01-08   147  	};
6c1d134a103f68 Rafał Miłecki 2024-01-08   148  
c4096ea06f912e Daniel Golle  2023-02-22   149  	reserved-memory {
c4096ea06f912e Daniel Golle  2023-02-22   150  		#address-cells = <2>;
c4096ea06f912e Daniel Golle  2023-02-22   151  		#size-cells = <2>;
c4096ea06f912e Daniel Golle  2023-02-22   152  		ranges;
c4096ea06f912e Daniel Golle  2023-02-22   153  
c4096ea06f912e Daniel Golle  2023-02-22   154  		/* 320 KiB reserved for ARM Trusted Firmware (BL31 and BL32) */
c4096ea06f912e Daniel Golle  2023-02-22   155  		secmon_reserved: secmon@43000000 {
c4096ea06f912e Daniel Golle  2023-02-22   156  			reg = <0 0x43000000 0 0x50000>;
c4096ea06f912e Daniel Golle  2023-02-22   157  			no-map;
c4096ea06f912e Daniel Golle  2023-02-22   158  		};
c4096ea06f912e Daniel Golle  2023-02-22   159  	};
c4096ea06f912e Daniel Golle  2023-02-22   160  
c4096ea06f912e Daniel Golle  2023-02-22   161  	timer {
c4096ea06f912e Daniel Golle  2023-02-22   162  		compatible = "arm,armv8-timer";
c4096ea06f912e Daniel Golle  2023-02-22   163  		interrupt-parent = <&gic>;
c4096ea06f912e Daniel Golle  2023-02-22   164  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
c4096ea06f912e Daniel Golle  2023-02-22   165  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
c4096ea06f912e Daniel Golle  2023-02-22   166  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
c4096ea06f912e Daniel Golle  2023-02-22   167  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
c4096ea06f912e Daniel Golle  2023-02-22   168  	};
c4096ea06f912e Daniel Golle  2023-02-22   169  
c4096ea06f912e Daniel Golle  2023-02-22   170  	reg_1p8v: regulator-1p8v {
c4096ea06f912e Daniel Golle  2023-02-22   171  		compatible = "regulator-fixed";
c4096ea06f912e Daniel Golle  2023-02-22   172  		regulator-name = "fixed-1.8V";
c4096ea06f912e Daniel Golle  2023-02-22   173  		regulator-min-microvolt = <1800000>;
c4096ea06f912e Daniel Golle  2023-02-22   174  		regulator-max-microvolt = <1800000>;
c4096ea06f912e Daniel Golle  2023-02-22   175  		regulator-boot-on;
c4096ea06f912e Daniel Golle  2023-02-22   176  		regulator-always-on;
c4096ea06f912e Daniel Golle  2023-02-22   177  	};
c4096ea06f912e Daniel Golle  2023-02-22   178  
c4096ea06f912e Daniel Golle  2023-02-22   179  	reg_3p3v: regulator-3p3v {
c4096ea06f912e Daniel Golle  2023-02-22   180  		compatible = "regulator-fixed";
c4096ea06f912e Daniel Golle  2023-02-22   181  		regulator-name = "fixed-3.3V";
c4096ea06f912e Daniel Golle  2023-02-22   182  		regulator-min-microvolt = <3300000>;
c4096ea06f912e Daniel Golle  2023-02-22   183  		regulator-max-microvolt = <3300000>;
c4096ea06f912e Daniel Golle  2023-02-22   184  		regulator-boot-on;
c4096ea06f912e Daniel Golle  2023-02-22   185  		regulator-always-on;
c4096ea06f912e Daniel Golle  2023-02-22   186  	};
c4096ea06f912e Daniel Golle  2023-02-22   187  
c4096ea06f912e Daniel Golle  2023-02-22   188  	thermal-zones {
c4096ea06f912e Daniel Golle  2023-02-22   189  		cpu_thermal: cpu-thermal {
c4096ea06f912e Daniel Golle  2023-02-22   190  			polling-delay-passive = <1000>;
c4096ea06f912e Daniel Golle  2023-02-22   191  			polling-delay = <1000>;
c4096ea06f912e Daniel Golle  2023-02-22   192  			thermal-sensors = <&lvts 0>;
c4096ea06f912e Daniel Golle  2023-02-22   193  			trips {
c4096ea06f912e Daniel Golle  2023-02-22   194  				cpu_trip_crit: crit {
c4096ea06f912e Daniel Golle  2023-02-22   195  					temperature = <125000>;
c4096ea06f912e Daniel Golle  2023-02-22   196  					hysteresis = <2000>;
c4096ea06f912e Daniel Golle  2023-02-22   197  					type = "critical";
c4096ea06f912e Daniel Golle  2023-02-22   198  				};
c4096ea06f912e Daniel Golle  2023-02-22   199  
c4096ea06f912e Daniel Golle  2023-02-22   200  				cpu_trip_hot: hot {
c4096ea06f912e Daniel Golle  2023-02-22   201  					temperature = <120000>;
c4096ea06f912e Daniel Golle  2023-02-22   202  					hysteresis = <2000>;
c4096ea06f912e Daniel Golle  2023-02-22   203  					type = "hot";
c4096ea06f912e Daniel Golle  2023-02-22   204  				};
c4096ea06f912e Daniel Golle  2023-02-22   205  
c4096ea06f912e Daniel Golle  2023-02-22   206  				cpu_trip_active_high: active-high {
c4096ea06f912e Daniel Golle  2023-02-22   207  					temperature = <115000>;
c4096ea06f912e Daniel Golle  2023-02-22   208  					hysteresis = <2000>;
c4096ea06f912e Daniel Golle  2023-02-22   209  					type = "active";
c4096ea06f912e Daniel Golle  2023-02-22   210  				};
c4096ea06f912e Daniel Golle  2023-02-22   211  
c4096ea06f912e Daniel Golle  2023-02-22   212  				cpu_trip_active_med: active-med {
c4096ea06f912e Daniel Golle  2023-02-22   213  					temperature = <85000>;
c4096ea06f912e Daniel Golle  2023-02-22   214  					hysteresis = <2000>;
c4096ea06f912e Daniel Golle  2023-02-22   215  					type = "active";
c4096ea06f912e Daniel Golle  2023-02-22   216  				};
c4096ea06f912e Daniel Golle  2023-02-22   217  
c4096ea06f912e Daniel Golle  2023-02-22   218  				cpu_trip_active_low: active-low {
c4096ea06f912e Daniel Golle  2023-02-22   219  					temperature = <40000>;
c4096ea06f912e Daniel Golle  2023-02-22   220  					hysteresis = <2000>;
c4096ea06f912e Daniel Golle  2023-02-22   221  					type = "active";
c4096ea06f912e Daniel Golle  2023-02-22   222  				};
c4096ea06f912e Daniel Golle  2023-02-22   223  			};
c4096ea06f912e Daniel Golle  2023-02-22   224  
c4096ea06f912e Daniel Golle  2023-02-22   225  			cooling-maps {
c4096ea06f912e Daniel Golle  2023-02-22   226  				cpu-active-high {
c4096ea06f912e Daniel Golle  2023-02-22   227  				/* active: set fan to cooling level 2 */
c4096ea06f912e Daniel Golle  2023-02-22   228  					cooling-device = <&fan 3 3>;
c4096ea06f912e Daniel Golle  2023-02-22   229  					trip = <&cpu_trip_active_high>;
c4096ea06f912e Daniel Golle  2023-02-22   230  				};
c4096ea06f912e Daniel Golle  2023-02-22   231  
c4096ea06f912e Daniel Golle  2023-02-22   232  				cpu-active-low {
c4096ea06f912e Daniel Golle  2023-02-22   233  				/* active: set fan to cooling level 1 */
c4096ea06f912e Daniel Golle  2023-02-22   234  					cooling-device = <&fan 2 2>;
c4096ea06f912e Daniel Golle  2023-02-22   235  					trip = <&cpu_trip_active_med>;
c4096ea06f912e Daniel Golle  2023-02-22   236  				};
c4096ea06f912e Daniel Golle  2023-02-22   237  
c4096ea06f912e Daniel Golle  2023-02-22   238  				cpu-passive {
c4096ea06f912e Daniel Golle  2023-02-22   239  				/* passive: set fan to cooling level 0 */
c4096ea06f912e Daniel Golle  2023-02-22   240  					cooling-device = <&fan 1 1>;
c4096ea06f912e Daniel Golle  2023-02-22   241  					trip = <&cpu_trip_active_low>;
c4096ea06f912e Daniel Golle  2023-02-22   242  				};
c4096ea06f912e Daniel Golle  2023-02-22   243  			};
c4096ea06f912e Daniel Golle  2023-02-22   244  		};
c4096ea06f912e Daniel Golle  2023-02-22   245  	};
c4096ea06f912e Daniel Golle  2023-02-22   246  
6c1d134a103f68 Rafał Miłecki 2024-01-08   247  	soc {
6c1d134a103f68 Rafał Miłecki 2024-01-08   248  		compatible = "simple-bus";
6c1d134a103f68 Rafał Miłecki 2024-01-08   249  		ranges;
6c1d134a103f68 Rafał Miłecki 2024-01-08   250  		#address-cells = <2>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   251  		#size-cells = <2>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   252  
6c1d134a103f68 Rafał Miłecki 2024-01-08   253  		gic: interrupt-controller@c000000 {
6c1d134a103f68 Rafał Miłecki 2024-01-08   254  			compatible = "arm,gic-v3";
6c1d134a103f68 Rafał Miłecki 2024-01-08   255  			reg = <0 0x0c000000 0 0x40000>,  /* GICD */
6c1d134a103f68 Rafał Miłecki 2024-01-08   256  			      <0 0x0c080000 0 0x200000>, /* GICR */
6c1d134a103f68 Rafał Miłecki 2024-01-08   257  			      <0 0x0c400000 0 0x2000>,   /* GICC */
6c1d134a103f68 Rafał Miłecki 2024-01-08   258  			      <0 0x0c410000 0 0x1000>,   /* GICH */
6c1d134a103f68 Rafał Miłecki 2024-01-08   259  			      <0 0x0c420000 0 0x2000>;   /* GICV */
6c1d134a103f68 Rafał Miłecki 2024-01-08   260  			interrupt-parent = <&gic>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   261  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   262  			interrupt-controller;
6c1d134a103f68 Rafał Miłecki 2024-01-08   263  			#interrupt-cells = <3>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   264  		};
6c1d134a103f68 Rafał Miłecki 2024-01-08   265  
c4096ea06f912e Daniel Golle  2023-02-22   266  		phyfw: phy-firmware@f000000 {
c4096ea06f912e Daniel Golle  2023-02-22   267  			compatible = "mediatek,2p5gphy-fw";
c4096ea06f912e Daniel Golle  2023-02-22   268  			reg = <0 0x0f000000 0 0x8000>,
c4096ea06f912e Daniel Golle  2023-02-22   269  			      <0 0x0f100000 0 0x20000>,
c4096ea06f912e Daniel Golle  2023-02-22   270  			      <0 0x0f0f0000 0 0x200>;
c4096ea06f912e Daniel Golle  2023-02-22   271  		};
c4096ea06f912e Daniel Golle  2023-02-22   272  
09346afaba0a89 Rafał Miłecki 2024-02-13   273  		infracfg: clock-controller@10001000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08   274  			compatible = "mediatek,mt7988-infracfg", "syscon";
b616b403cbffc6 Rafał Miłecki 2024-01-08   275  			reg = <0 0x10001000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   276  			#clock-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   277  			#reset-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   278  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08   279  
c4096ea06f912e Daniel Golle  2023-02-22   280  		topckgen: clock-controller@1001b000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08   281  			compatible = "mediatek,mt7988-topckgen", "syscon";
b616b403cbffc6 Rafał Miłecki 2024-01-08   282  			reg = <0 0x1001b000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   283  			#clock-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   284  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08   285  
b616b403cbffc6 Rafał Miłecki 2024-01-08   286  		watchdog: watchdog@1001c000 {
6c1d134a103f68 Rafał Miłecki 2024-01-08   287  			compatible = "mediatek,mt7988-wdt";
6c1d134a103f68 Rafał Miłecki 2024-01-08   288  			reg = <0 0x1001c000 0 0x1000>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   289  			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   290  			#reset-cells = <1>;
6c1d134a103f68 Rafał Miłecki 2024-01-08   291  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08   292  
c4096ea06f912e Daniel Golle  2023-02-22   293  		apmixedsys: clock-controller@1001e000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08   294  			compatible = "mediatek,mt7988-apmixedsys";
b616b403cbffc6 Rafał Miłecki 2024-01-08   295  			reg = <0 0x1001e000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   296  			#clock-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08   297  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08   298  
c4096ea06f912e Daniel Golle  2023-02-22   299  		pio: pinctrl@1001f000 {
c4096ea06f912e Daniel Golle  2023-02-22   300  			compatible = "mediatek,mt7988-pinctrl", "syscon";
c4096ea06f912e Daniel Golle  2023-02-22   301  			reg = <0 0x1001f000 0 0x1000>,
c4096ea06f912e Daniel Golle  2023-02-22   302  			<0 0x11c10000 0 0x1000>,
c4096ea06f912e Daniel Golle  2023-02-22   303  			<0 0x11d00000 0 0x1000>,
c4096ea06f912e Daniel Golle  2023-02-22   304  			<0 0x11d20000 0 0x1000>,
c4096ea06f912e Daniel Golle  2023-02-22   305  			<0 0x11e00000 0 0x1000>,
c4096ea06f912e Daniel Golle  2023-02-22   306  			<0 0x11f00000 0 0x1000>,
c4096ea06f912e Daniel Golle  2023-02-22   307  			<0 0x1000b000 0 0x1000>;
c4096ea06f912e Daniel Golle  2023-02-22   308  			reg-names = "gpio_base", "iocfg_tr_base",
c4096ea06f912e Daniel Golle  2023-02-22   309  				    "iocfg_br_base", "iocfg_rb_base",
c4096ea06f912e Daniel Golle  2023-02-22   310  				    "iocfg_lb_base", "iocfg_tl_base", "eint";
c4096ea06f912e Daniel Golle  2023-02-22   311  			gpio-controller;
c4096ea06f912e Daniel Golle  2023-02-22   312  			#gpio-cells = <2>;
c4096ea06f912e Daniel Golle  2023-02-22   313  			gpio-ranges = <&pio 0 0 84>;
c4096ea06f912e Daniel Golle  2023-02-22   314  			interrupt-controller;
c4096ea06f912e Daniel Golle  2023-02-22   315  			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   316  			interrupt-parent = <&gic>;
c4096ea06f912e Daniel Golle  2023-02-22   317  			#interrupt-cells = <2>;
c4096ea06f912e Daniel Golle  2023-02-22   318  
c4096ea06f912e Daniel Golle  2023-02-22   319  			mdio0_pins: mdio0-pins {
c4096ea06f912e Daniel Golle  2023-02-22   320  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   321  					function = "eth";
c4096ea06f912e Daniel Golle  2023-02-22   322  					groups = "mdc_mdio0";
c4096ea06f912e Daniel Golle  2023-02-22   323  				};
c4096ea06f912e Daniel Golle  2023-02-22   324  
c4096ea06f912e Daniel Golle  2023-02-22   325  				conf {
c4096ea06f912e Daniel Golle  2023-02-22   326  					groups = "mdc_mdio0";
c4096ea06f912e Daniel Golle  2023-02-22   327  					drive-strength = <MTK_DRIVE_8mA>;
c4096ea06f912e Daniel Golle  2023-02-22   328  				};
c4096ea06f912e Daniel Golle  2023-02-22   329  			};
c4096ea06f912e Daniel Golle  2023-02-22   330  
c4096ea06f912e Daniel Golle  2023-02-22   331  			i2c0_pins: i2c0-pins-g0 {
c4096ea06f912e Daniel Golle  2023-02-22   332  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   333  					function = "i2c";
c4096ea06f912e Daniel Golle  2023-02-22   334  					groups = "i2c0_1";
c4096ea06f912e Daniel Golle  2023-02-22   335  				};
c4096ea06f912e Daniel Golle  2023-02-22   336  			};
c4096ea06f912e Daniel Golle  2023-02-22   337  
c4096ea06f912e Daniel Golle  2023-02-22   338  			i2c1_pins: i2c1-pins-g0 {
c4096ea06f912e Daniel Golle  2023-02-22   339  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   340  					function = "i2c";
c4096ea06f912e Daniel Golle  2023-02-22   341  					groups = "i2c1_0";
c4096ea06f912e Daniel Golle  2023-02-22   342  				};
c4096ea06f912e Daniel Golle  2023-02-22   343  			};
c4096ea06f912e Daniel Golle  2023-02-22   344  
c4096ea06f912e Daniel Golle  2023-02-22   345  			i2c1_sfp_pins: i2c1-sfp-pins-g0 {
c4096ea06f912e Daniel Golle  2023-02-22   346  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   347  					function = "i2c";
c4096ea06f912e Daniel Golle  2023-02-22   348  					groups = "i2c1_sfp";
c4096ea06f912e Daniel Golle  2023-02-22   349  				};
c4096ea06f912e Daniel Golle  2023-02-22   350  			};
c4096ea06f912e Daniel Golle  2023-02-22   351  
c4096ea06f912e Daniel Golle  2023-02-22   352  			i2c2_pins: i2c2-pins {
c4096ea06f912e Daniel Golle  2023-02-22   353  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   354  					function = "i2c";
c4096ea06f912e Daniel Golle  2023-02-22   355  					groups = "i2c2";
c4096ea06f912e Daniel Golle  2023-02-22   356  				};
c4096ea06f912e Daniel Golle  2023-02-22   357  			};
c4096ea06f912e Daniel Golle  2023-02-22   358  
c4096ea06f912e Daniel Golle  2023-02-22   359  			i2c2_0_pins: i2c2-pins-g0 {
c4096ea06f912e Daniel Golle  2023-02-22   360  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   361  					function = "i2c";
c4096ea06f912e Daniel Golle  2023-02-22   362  					groups = "i2c2_0";
c4096ea06f912e Daniel Golle  2023-02-22   363  				};
c4096ea06f912e Daniel Golle  2023-02-22   364  			};
c4096ea06f912e Daniel Golle  2023-02-22   365  
c4096ea06f912e Daniel Golle  2023-02-22   366  			i2c2_1_pins: i2c2-pins-g1 {
c4096ea06f912e Daniel Golle  2023-02-22   367  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   368  					function = "i2c";
c4096ea06f912e Daniel Golle  2023-02-22   369  					groups = "i2c2_1";
c4096ea06f912e Daniel Golle  2023-02-22   370  				};
c4096ea06f912e Daniel Golle  2023-02-22   371  			};
c4096ea06f912e Daniel Golle  2023-02-22   372  
c4096ea06f912e Daniel Golle  2023-02-22   373  			gbe0_led0_pins: gbe0-led0-pins {
c4096ea06f912e Daniel Golle  2023-02-22   374  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   375  					function = "led";
c4096ea06f912e Daniel Golle  2023-02-22   376  					groups = "gbe0_led0";
c4096ea06f912e Daniel Golle  2023-02-22   377  				};
c4096ea06f912e Daniel Golle  2023-02-22   378  			};
c4096ea06f912e Daniel Golle  2023-02-22   379  
c4096ea06f912e Daniel Golle  2023-02-22   380  			gbe1_led0_pins: gbe1-led0-pins {
c4096ea06f912e Daniel Golle  2023-02-22   381  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   382  					function = "led";
c4096ea06f912e Daniel Golle  2023-02-22   383  					groups = "gbe1_led0";
c4096ea06f912e Daniel Golle  2023-02-22   384  				};
c4096ea06f912e Daniel Golle  2023-02-22   385  			};
c4096ea06f912e Daniel Golle  2023-02-22   386  
c4096ea06f912e Daniel Golle  2023-02-22   387  			gbe2_led0_pins: gbe2-led0-pins {
c4096ea06f912e Daniel Golle  2023-02-22   388  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   389  					function = "led";
c4096ea06f912e Daniel Golle  2023-02-22   390  					groups = "gbe2_led0";
c4096ea06f912e Daniel Golle  2023-02-22   391  				};
c4096ea06f912e Daniel Golle  2023-02-22   392  			};
c4096ea06f912e Daniel Golle  2023-02-22   393  
c4096ea06f912e Daniel Golle  2023-02-22   394  			gbe3_led0_pins: gbe3-led0-pins {
c4096ea06f912e Daniel Golle  2023-02-22   395  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   396  					function = "led";
c4096ea06f912e Daniel Golle  2023-02-22   397  					groups = "gbe3_led0";
c4096ea06f912e Daniel Golle  2023-02-22   398  				};
c4096ea06f912e Daniel Golle  2023-02-22   399  			};
c4096ea06f912e Daniel Golle  2023-02-22   400  
c4096ea06f912e Daniel Golle  2023-02-22   401  			gbe0_led1_pins: gbe0-led1-pins {
c4096ea06f912e Daniel Golle  2023-02-22   402  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   403  					function = "led";
c4096ea06f912e Daniel Golle  2023-02-22   404  					groups = "gbe0_led1";
c4096ea06f912e Daniel Golle  2023-02-22   405  				};
c4096ea06f912e Daniel Golle  2023-02-22   406  			};
c4096ea06f912e Daniel Golle  2023-02-22   407  
c4096ea06f912e Daniel Golle  2023-02-22   408  			gbe1_led1_pins: gbe1-led1-pins {
c4096ea06f912e Daniel Golle  2023-02-22   409  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   410  					function = "led";
c4096ea06f912e Daniel Golle  2023-02-22   411  					groups = "gbe1_led1";
c4096ea06f912e Daniel Golle  2023-02-22   412  				};
c4096ea06f912e Daniel Golle  2023-02-22   413  			};
c4096ea06f912e Daniel Golle  2023-02-22   414  
c4096ea06f912e Daniel Golle  2023-02-22   415  			gbe2_led1_pins: gbe2-led1-pins {
c4096ea06f912e Daniel Golle  2023-02-22   416  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   417  					function = "led";
c4096ea06f912e Daniel Golle  2023-02-22   418  					groups = "gbe2_led1";
c4096ea06f912e Daniel Golle  2023-02-22   419  				};
c4096ea06f912e Daniel Golle  2023-02-22   420  			};
c4096ea06f912e Daniel Golle  2023-02-22   421  
c4096ea06f912e Daniel Golle  2023-02-22   422  			gbe3_led1_pins: gbe3-led1-pins {
c4096ea06f912e Daniel Golle  2023-02-22   423  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   424  					function = "led";
c4096ea06f912e Daniel Golle  2023-02-22   425  					groups = "gbe3_led1";
c4096ea06f912e Daniel Golle  2023-02-22   426  				};
c4096ea06f912e Daniel Golle  2023-02-22   427  			};
c4096ea06f912e Daniel Golle  2023-02-22   428  
c4096ea06f912e Daniel Golle  2023-02-22   429  			i2p5gbe_led0_pins: 2p5gbe-led0-pins {
c4096ea06f912e Daniel Golle  2023-02-22   430  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   431  					function = "led";
c4096ea06f912e Daniel Golle  2023-02-22   432  					groups = "2p5gbe_led0";
c4096ea06f912e Daniel Golle  2023-02-22   433  				};
c4096ea06f912e Daniel Golle  2023-02-22   434  			};
c4096ea06f912e Daniel Golle  2023-02-22   435  
c4096ea06f912e Daniel Golle  2023-02-22   436  			i2p5gbe_led1_pins: 2p5gbe-led1-pins {
c4096ea06f912e Daniel Golle  2023-02-22   437  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   438  					function = "led";
c4096ea06f912e Daniel Golle  2023-02-22   439  					groups = "2p5gbe_led1";
c4096ea06f912e Daniel Golle  2023-02-22   440  				};
c4096ea06f912e Daniel Golle  2023-02-22   441  			};
c4096ea06f912e Daniel Golle  2023-02-22   442  
c4096ea06f912e Daniel Golle  2023-02-22   443  			mmc0_pins_emmc_45: mmc0-pins-emmc-45 {
c4096ea06f912e Daniel Golle  2023-02-22   444  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   445  					function = "flash";
c4096ea06f912e Daniel Golle  2023-02-22   446  					groups = "emmc_45";
c4096ea06f912e Daniel Golle  2023-02-22   447  				};
c4096ea06f912e Daniel Golle  2023-02-22   448  			};
c4096ea06f912e Daniel Golle  2023-02-22   449  
c4096ea06f912e Daniel Golle  2023-02-22   450  			mmc0_pins_emmc_51: mmc0-pins-emmc-51 {
c4096ea06f912e Daniel Golle  2023-02-22   451  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   452  					function = "flash";
c4096ea06f912e Daniel Golle  2023-02-22   453  					groups = "emmc_51";
c4096ea06f912e Daniel Golle  2023-02-22   454  				};
c4096ea06f912e Daniel Golle  2023-02-22   455  			};
c4096ea06f912e Daniel Golle  2023-02-22   456  
c4096ea06f912e Daniel Golle  2023-02-22   457  			mmc0_pins_sdcard: mmc0-pins-sdcard {
c4096ea06f912e Daniel Golle  2023-02-22   458  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   459  					function = "flash";
c4096ea06f912e Daniel Golle  2023-02-22   460  					groups = "sdcard";
c4096ea06f912e Daniel Golle  2023-02-22   461  				};
c4096ea06f912e Daniel Golle  2023-02-22   462  			};
c4096ea06f912e Daniel Golle  2023-02-22   463  
c4096ea06f912e Daniel Golle  2023-02-22   464  			uart0_pins: uart0-pins {
c4096ea06f912e Daniel Golle  2023-02-22   465  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   466  					function = "uart";
c4096ea06f912e Daniel Golle  2023-02-22   467  					groups =  "uart0";
c4096ea06f912e Daniel Golle  2023-02-22   468  				};
c4096ea06f912e Daniel Golle  2023-02-22   469  			};
c4096ea06f912e Daniel Golle  2023-02-22   470  
c4096ea06f912e Daniel Golle  2023-02-22   471  			snfi_pins: snfi-pins {
c4096ea06f912e Daniel Golle  2023-02-22   472  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   473  					function = "flash";
c4096ea06f912e Daniel Golle  2023-02-22   474  					groups = "snfi";
c4096ea06f912e Daniel Golle  2023-02-22   475  				};
c4096ea06f912e Daniel Golle  2023-02-22   476  			};
c4096ea06f912e Daniel Golle  2023-02-22   477  
c4096ea06f912e Daniel Golle  2023-02-22   478  			spi0_pins: spi0-pins {
c4096ea06f912e Daniel Golle  2023-02-22   479  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   480  					function = "spi";
c4096ea06f912e Daniel Golle  2023-02-22   481  					groups = "spi0";
c4096ea06f912e Daniel Golle  2023-02-22   482  				};
c4096ea06f912e Daniel Golle  2023-02-22   483  			};
c4096ea06f912e Daniel Golle  2023-02-22   484  
c4096ea06f912e Daniel Golle  2023-02-22   485  			spi0_flash_pins: spi0-flash-pins {
c4096ea06f912e Daniel Golle  2023-02-22   486  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   487  					function = "spi";
c4096ea06f912e Daniel Golle  2023-02-22   488  					groups = "spi0", "spi0_wp_hold";
c4096ea06f912e Daniel Golle  2023-02-22   489  				};
c4096ea06f912e Daniel Golle  2023-02-22   490  			};
c4096ea06f912e Daniel Golle  2023-02-22   491  
c4096ea06f912e Daniel Golle  2023-02-22   492  			spi1_pins: spi1-pins {
c4096ea06f912e Daniel Golle  2023-02-22   493  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   494  					function = "spi";
c4096ea06f912e Daniel Golle  2023-02-22   495  					groups = "spi1";
c4096ea06f912e Daniel Golle  2023-02-22   496  				};
c4096ea06f912e Daniel Golle  2023-02-22   497  			};
c4096ea06f912e Daniel Golle  2023-02-22   498  
c4096ea06f912e Daniel Golle  2023-02-22   499  			spi2_pins: spi2-pins {
c4096ea06f912e Daniel Golle  2023-02-22   500  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   501  					function = "spi";
c4096ea06f912e Daniel Golle  2023-02-22   502  					groups = "spi2";
c4096ea06f912e Daniel Golle  2023-02-22   503  				};
c4096ea06f912e Daniel Golle  2023-02-22   504  			};
c4096ea06f912e Daniel Golle  2023-02-22   505  
c4096ea06f912e Daniel Golle  2023-02-22   506  			spi2_flash_pins: spi2-flash-pins {
c4096ea06f912e Daniel Golle  2023-02-22   507  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   508  					function = "spi";
c4096ea06f912e Daniel Golle  2023-02-22   509  					groups = "spi2", "spi2_wp_hold";
c4096ea06f912e Daniel Golle  2023-02-22   510  				};
c4096ea06f912e Daniel Golle  2023-02-22   511  			};
c4096ea06f912e Daniel Golle  2023-02-22   512  
c4096ea06f912e Daniel Golle  2023-02-22   513  			pcie0_pins: pcie0-pins {
c4096ea06f912e Daniel Golle  2023-02-22   514  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   515  					function = "pcie";
c4096ea06f912e Daniel Golle  2023-02-22   516  					groups = "pcie_2l_0_pereset", "pcie_clk_req_n0_0",
c4096ea06f912e Daniel Golle  2023-02-22   517  						 "pcie_wake_n0_0";
c4096ea06f912e Daniel Golle  2023-02-22   518  				};
c4096ea06f912e Daniel Golle  2023-02-22   519  			};
c4096ea06f912e Daniel Golle  2023-02-22   520  
c4096ea06f912e Daniel Golle  2023-02-22   521  			pcie1_pins: pcie1-pins {
c4096ea06f912e Daniel Golle  2023-02-22   522  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   523  					function = "pcie";
c4096ea06f912e Daniel Golle  2023-02-22   524  					groups = "pcie_2l_1_pereset", "pcie_clk_req_n1",
c4096ea06f912e Daniel Golle  2023-02-22   525  						 "pcie_wake_n1_0";
c4096ea06f912e Daniel Golle  2023-02-22   526  				};
c4096ea06f912e Daniel Golle  2023-02-22   527  			};
c4096ea06f912e Daniel Golle  2023-02-22   528  
c4096ea06f912e Daniel Golle  2023-02-22   529  			pcie2_pins: pcie2-pins {
c4096ea06f912e Daniel Golle  2023-02-22   530  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   531  					function = "pcie";
c4096ea06f912e Daniel Golle  2023-02-22   532  					groups = "pcie_1l_0_pereset", "pcie_clk_req_n2_0",
c4096ea06f912e Daniel Golle  2023-02-22   533  						 "pcie_wake_n2_0";
c4096ea06f912e Daniel Golle  2023-02-22   534  				};
c4096ea06f912e Daniel Golle  2023-02-22   535  			};
c4096ea06f912e Daniel Golle  2023-02-22   536  
c4096ea06f912e Daniel Golle  2023-02-22   537  			pcie3_pins: pcie3-pins {
c4096ea06f912e Daniel Golle  2023-02-22   538  				mux {
c4096ea06f912e Daniel Golle  2023-02-22   539  					function = "pcie";
c4096ea06f912e Daniel Golle  2023-02-22   540  					groups = "pcie_1l_1_pereset", "pcie_clk_req_n3",
c4096ea06f912e Daniel Golle  2023-02-22   541  						 "pcie_wake_n3_0";
c4096ea06f912e Daniel Golle  2023-02-22   542  				};
c4096ea06f912e Daniel Golle  2023-02-22   543  			};
c4096ea06f912e Daniel Golle  2023-02-22   544  		};
c4096ea06f912e Daniel Golle  2023-02-22   545  
c4096ea06f912e Daniel Golle  2023-02-22   546  		pwm: pwm@10048000 {
09ff2216a03570 Rafał Miłecki 2024-06-04   547  			compatible = "mediatek,mt7988-pwm";
09ff2216a03570 Rafał Miłecki 2024-06-04   548  			reg = <0 0x10048000 0 0x1000>;
09ff2216a03570 Rafał Miłecki 2024-06-04   549  			clocks = <&infracfg CLK_INFRA_66M_PWM_BCK>,
09ff2216a03570 Rafał Miłecki 2024-06-04   550  				 <&infracfg CLK_INFRA_66M_PWM_HCK>,
09ff2216a03570 Rafał Miłecki 2024-06-04   551  				 <&infracfg CLK_INFRA_66M_PWM_CK1>,
09ff2216a03570 Rafał Miłecki 2024-06-04   552  				 <&infracfg CLK_INFRA_66M_PWM_CK2>,
09ff2216a03570 Rafał Miłecki 2024-06-04   553  				 <&infracfg CLK_INFRA_66M_PWM_CK3>,
09ff2216a03570 Rafał Miłecki 2024-06-04   554  				 <&infracfg CLK_INFRA_66M_PWM_CK4>,
09ff2216a03570 Rafał Miłecki 2024-06-04   555  				 <&infracfg CLK_INFRA_66M_PWM_CK5>,
09ff2216a03570 Rafał Miłecki 2024-06-04   556  				 <&infracfg CLK_INFRA_66M_PWM_CK6>,
09ff2216a03570 Rafał Miłecki 2024-06-04   557  				 <&infracfg CLK_INFRA_66M_PWM_CK7>,
09ff2216a03570 Rafał Miłecki 2024-06-04   558  				 <&infracfg CLK_INFRA_66M_PWM_CK8>;
09ff2216a03570 Rafał Miłecki 2024-06-04   559  			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
09ff2216a03570 Rafał Miłecki 2024-06-04   560  				      "pwm4", "pwm5", "pwm6", "pwm7", "pwm8";
09ff2216a03570 Rafał Miłecki 2024-06-04   561  			#pwm-cells = <2>;
09ff2216a03570 Rafał Miłecki 2024-06-04   562  			status = "disabled";
09ff2216a03570 Rafał Miłecki 2024-06-04   563  		};
09ff2216a03570 Rafał Miłecki 2024-06-04   564  
c4096ea06f912e Daniel Golle  2023-02-22   565  		sgmiisys0: syscon@10060000 {
c4096ea06f912e Daniel Golle  2023-02-22   566  			compatible = "mediatek,mt7988-sgmiisys",
c4096ea06f912e Daniel Golle  2023-02-22   567  				     "mediatek,mt7988-sgmiisys0",
c4096ea06f912e Daniel Golle  2023-02-22   568  				     "syscon",
c4096ea06f912e Daniel Golle  2023-02-22   569  				     "simple-mfd";
c4096ea06f912e Daniel Golle  2023-02-22   570  			reg = <0 0x10060000 0 0x1000>;
c4096ea06f912e Daniel Golle  2023-02-22   571  			resets = <&watchdog 1>;
c4096ea06f912e Daniel Golle  2023-02-22   572  			#clock-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   573  
c4096ea06f912e Daniel Golle  2023-02-22   574  			sgmiipcs0: pcs {
c4096ea06f912e Daniel Golle  2023-02-22   575  				compatible = "mediatek,mt7988-sgmii";
c4096ea06f912e Daniel Golle  2023-02-22   576  				clocks = <&topckgen CLK_TOP_SGM_0_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22   577  					 <&sgmiisys0 CLK_SGM0_TX_EN>,
c4096ea06f912e Daniel Golle  2023-02-22   578  					 <&sgmiisys0 CLK_SGM0_RX_EN>;
c4096ea06f912e Daniel Golle  2023-02-22   579  				clock-names = "sgmii_sel", "sgmii_tx", "sgmii_rx";
c4096ea06f912e Daniel Golle  2023-02-22   580  				phys = <&xfi_tphy0>;
c4096ea06f912e Daniel Golle  2023-02-22   581  				#pcs-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22   582  			};
c4096ea06f912e Daniel Golle  2023-02-22   583  		};
c4096ea06f912e Daniel Golle  2023-02-22   584  
c4096ea06f912e Daniel Golle  2023-02-22   585  		sgmiisys1: syscon@10070000 {
c4096ea06f912e Daniel Golle  2023-02-22   586  			compatible = "mediatek,mt7988-sgmiisys",
c4096ea06f912e Daniel Golle  2023-02-22   587  				     "mediatek,mt7988-sgmiisys1",
c4096ea06f912e Daniel Golle  2023-02-22   588  				     "syscon",
c4096ea06f912e Daniel Golle  2023-02-22   589  				     "simple-mfd";
c4096ea06f912e Daniel Golle  2023-02-22   590  			reg = <0 0x10070000 0 0x1000>;
c4096ea06f912e Daniel Golle  2023-02-22   591  			resets = <&watchdog 2>;
c4096ea06f912e Daniel Golle  2023-02-22   592  			#clock-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   593  
c4096ea06f912e Daniel Golle  2023-02-22   594  			sgmiipcs1: pcs {
c4096ea06f912e Daniel Golle  2023-02-22   595  				compatible = "mediatek,mt7988-sgmii";
c4096ea06f912e Daniel Golle  2023-02-22   596  				clocks = <&topckgen CLK_TOP_SGM_1_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22   597  					 <&sgmiisys1 CLK_SGM1_TX_EN>,
c4096ea06f912e Daniel Golle  2023-02-22   598  					 <&sgmiisys1 CLK_SGM1_RX_EN>;
c4096ea06f912e Daniel Golle  2023-02-22   599  				clock-names = "sgmii_sel", "sgmii_tx", "sgmii_rx";
c4096ea06f912e Daniel Golle  2023-02-22   600  				phys = <&xfi_tphy1>;
c4096ea06f912e Daniel Golle  2023-02-22   601  				#pcs-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22   602  			};
c4096ea06f912e Daniel Golle  2023-02-22   603  		};
c4096ea06f912e Daniel Golle  2023-02-22   604  
c4096ea06f912e Daniel Golle  2023-02-22   605  		usxgmiisys0: pcs@10080000 {
c4096ea06f912e Daniel Golle  2023-02-22   606  			compatible = "mediatek,mt7988-usxgmiisys";
c4096ea06f912e Daniel Golle  2023-02-22   607  			reg = <0 0x10080000 0 0x1000>;
c4096ea06f912e Daniel Golle  2023-02-22   608  			resets = <&watchdog 12>;
c4096ea06f912e Daniel Golle  2023-02-22   609  			clocks = <&topckgen CLK_TOP_USXGMII_SBUS_0_SEL>;
c4096ea06f912e Daniel Golle  2023-02-22   610  			phys = <&xfi_tphy0>;
c4096ea06f912e Daniel Golle  2023-02-22   611  			#pcs-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22   612  		};
c4096ea06f912e Daniel Golle  2023-02-22   613  
c4096ea06f912e Daniel Golle  2023-02-22   614  		usxgmiisys1: pcs@10081000 {
c4096ea06f912e Daniel Golle  2023-02-22   615  			compatible = "mediatek,mt7988-usxgmiisys";
c4096ea06f912e Daniel Golle  2023-02-22   616  			reg = <0 0x10081000 0 0x1000>;
c4096ea06f912e Daniel Golle  2023-02-22   617  			resets = <&watchdog 13>;
c4096ea06f912e Daniel Golle  2023-02-22   618  			clocks = <&topckgen CLK_TOP_USXGMII_SBUS_1_SEL>;
c4096ea06f912e Daniel Golle  2023-02-22   619  			phys = <&xfi_tphy1>;
c4096ea06f912e Daniel Golle  2023-02-22   620  			#pcs-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22   621  		};
c4096ea06f912e Daniel Golle  2023-02-22   622  
c4096ea06f912e Daniel Golle  2023-02-22   623  		mcusys: mcusys@100e0000 {
c4096ea06f912e Daniel Golle  2023-02-22   624  			compatible = "mediatek,mt7988-mcusys", "syscon";
c4096ea06f912e Daniel Golle  2023-02-22   625  			reg = <0 0x100e0000 0 0x1000>;
c4096ea06f912e Daniel Golle  2023-02-22   626  			#clock-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   627  		};
c4096ea06f912e Daniel Golle  2023-02-22   628  
c4096ea06f912e Daniel Golle  2023-02-22   629  		uart0: serial@11000000 {
c4096ea06f912e Daniel Golle  2023-02-22   630  			compatible = "mediatek,mt7986-uart",
c4096ea06f912e Daniel Golle  2023-02-22   631  				     "mediatek,mt6577-uart";
c4096ea06f912e Daniel Golle  2023-02-22   632  			reg = <0 0x11000000 0 0x100>;
c4096ea06f912e Daniel Golle  2023-02-22   633  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   634  			/*
c4096ea06f912e Daniel Golle  2023-02-22   635  			 * 8250-mtk driver don't control "baud" clock since commit
c4096ea06f912e Daniel Golle  2023-02-22   636  			 * e32a83c70cf9 (kernel v5.7), but both "baud" and "bus" clocks
c4096ea06f912e Daniel Golle  2023-02-22   637  			 * still need to be passed to the driver to prevent probe fail
c4096ea06f912e Daniel Golle  2023-02-22   638  			 */
c4096ea06f912e Daniel Golle  2023-02-22   639  			clocks = <&topckgen CLK_TOP_UART_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22   640  				 <&infracfg CLK_INFRA_52M_UART0_CK>;
c4096ea06f912e Daniel Golle  2023-02-22   641  			clock-names = "baud", "bus";
c4096ea06f912e Daniel Golle  2023-02-22   642  			assigned-clocks = <&topckgen CLK_TOP_UART_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22   643  					  <&infracfg CLK_INFRA_MUX_UART0_SEL>;
c4096ea06f912e Daniel Golle  2023-02-22   644  			assigned-clock-parents = <&topckgen CLK_TOP_XTAL>,
c4096ea06f912e Daniel Golle  2023-02-22   645  						 <&topckgen CLK_TOP_UART_SEL>;
c4096ea06f912e Daniel Golle  2023-02-22   646  			pinctrl-names = "default";
c4096ea06f912e Daniel Golle  2023-02-22   647  			pinctrl-0 = <&uart0_pins>;
c4096ea06f912e Daniel Golle  2023-02-22   648  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22   649  		};
c4096ea06f912e Daniel Golle  2023-02-22   650  
c4096ea06f912e Daniel Golle  2023-02-22   651  		snand: spi@11001000 {
c4096ea06f912e Daniel Golle  2023-02-22   652  			compatible = "mediatek,mt7986-snand";
c4096ea06f912e Daniel Golle  2023-02-22   653  			reg = <0 0x11001000 0 0x1000>;
c4096ea06f912e Daniel Golle  2023-02-22   654  			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   655  			clocks = <&infracfg CLK_INFRA_SPINFI>,
c4096ea06f912e Daniel Golle  2023-02-22   656  				 <&infracfg CLK_INFRA_NFI>,
c4096ea06f912e Daniel Golle  2023-02-22   657  				 <&infracfg CLK_INFRA_66M_NFI_HCK>;
c4096ea06f912e Daniel Golle  2023-02-22   658  			clock-names = "pad_clk", "nfi_clk", "nfi_hclk";
c4096ea06f912e Daniel Golle  2023-02-22   659  			nand-ecc-engine = <&bch>;
c4096ea06f912e Daniel Golle  2023-02-22   660  			mediatek,quad-spi;
c4096ea06f912e Daniel Golle  2023-02-22   661  			#address-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   662  			#size-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22   663  			pinctrl-names = "default";
c4096ea06f912e Daniel Golle  2023-02-22   664  			pinctrl-0 = <&snfi_pins>;
c4096ea06f912e Daniel Golle  2023-02-22   665  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22   666  		};
c4096ea06f912e Daniel Golle  2023-02-22   667  
c4096ea06f912e Daniel Golle  2023-02-22   668  		bch: ecc@11002000 {
c4096ea06f912e Daniel Golle  2023-02-22   669  			compatible = "mediatek,mt7686-ecc";
c4096ea06f912e Daniel Golle  2023-02-22   670  			reg = <0 0x11002000 0 0x1000>;
c4096ea06f912e Daniel Golle  2023-02-22   671  			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   672  			clocks = <&infracfg CLK_INFRA_NFI>;
c4096ea06f912e Daniel Golle  2023-02-22   673  			clock-names = "nfiecc_clk";
c4096ea06f912e Daniel Golle  2023-02-22   674  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22   675  		};
c4096ea06f912e Daniel Golle  2023-02-22   676  
c4096ea06f912e Daniel Golle  2023-02-22   677  		i2c0: i2c@11003000 {
c4096ea06f912e Daniel Golle  2023-02-22   678  			compatible = "mediatek,mt7988-i2c",
c4096ea06f912e Daniel Golle  2023-02-22   679  				     "mediatek,mt7981-i2c";
660c230bf30280 Rafał Miłecki 2024-06-04   680  			reg = <0 0x11003000 0 0x1000>,
660c230bf30280 Rafał Miłecki 2024-06-04   681  			      <0 0x10217080 0 0x80>;
660c230bf30280 Rafał Miłecki 2024-06-04   682  			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   683  			clock-div = <1>;
660c230bf30280 Rafał Miłecki 2024-06-04   684  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
660c230bf30280 Rafał Miłecki 2024-06-04   685  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
660c230bf30280 Rafał Miłecki 2024-06-04   686  			clock-names = "main", "dma";
660c230bf30280 Rafał Miłecki 2024-06-04   687  			#address-cells = <1>;
660c230bf30280 Rafał Miłecki 2024-06-04   688  			#size-cells = <0>;
660c230bf30280 Rafał Miłecki 2024-06-04   689  			status = "disabled";
660c230bf30280 Rafał Miłecki 2024-06-04   690  		};
660c230bf30280 Rafał Miłecki 2024-06-04   691  
c4096ea06f912e Daniel Golle  2023-02-22   692  		i2c1: i2c@11004000 {
c4096ea06f912e Daniel Golle  2023-02-22   693  			compatible = "mediatek,mt7988-i2c",
c4096ea06f912e Daniel Golle  2023-02-22   694  				     "mediatek,mt7981-i2c";
660c230bf30280 Rafał Miłecki 2024-06-04   695  			reg = <0 0x11004000 0 0x1000>,
660c230bf30280 Rafał Miłecki 2024-06-04   696  			      <0 0x10217100 0 0x80>;
660c230bf30280 Rafał Miłecki 2024-06-04   697  			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   698  			clock-div = <1>;
660c230bf30280 Rafał Miłecki 2024-06-04   699  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
660c230bf30280 Rafał Miłecki 2024-06-04   700  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
660c230bf30280 Rafał Miłecki 2024-06-04   701  			clock-names = "main", "dma";
660c230bf30280 Rafał Miłecki 2024-06-04   702  			#address-cells = <1>;
660c230bf30280 Rafał Miłecki 2024-06-04   703  			#size-cells = <0>;
660c230bf30280 Rafał Miłecki 2024-06-04   704  			status = "disabled";
660c230bf30280 Rafał Miłecki 2024-06-04   705  		};
660c230bf30280 Rafał Miłecki 2024-06-04   706  
c4096ea06f912e Daniel Golle  2023-02-22   707  		i2c2: i2c@11005000 {
c4096ea06f912e Daniel Golle  2023-02-22   708  			compatible = "mediatek,mt7988-i2c",
c4096ea06f912e Daniel Golle  2023-02-22   709  				"mediatek,mt7981-i2c";
660c230bf30280 Rafał Miłecki 2024-06-04   710  			reg = <0 0x11005000 0 0x1000>,
660c230bf30280 Rafał Miłecki 2024-06-04   711  			      <0 0x10217180 0 0x80>;
660c230bf30280 Rafał Miłecki 2024-06-04   712  			interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   713  			clock-div = <1>;
660c230bf30280 Rafał Miłecki 2024-06-04   714  			clocks = <&infracfg CLK_INFRA_I2C_BCK>,
660c230bf30280 Rafał Miłecki 2024-06-04   715  				 <&infracfg CLK_INFRA_66M_AP_DMA_BCK>;
660c230bf30280 Rafał Miłecki 2024-06-04   716  			clock-names = "main", "dma";
660c230bf30280 Rafał Miłecki 2024-06-04   717  			#address-cells = <1>;
660c230bf30280 Rafał Miłecki 2024-06-04   718  			#size-cells = <0>;
660c230bf30280 Rafał Miłecki 2024-06-04   719  			status = "disabled";
660c230bf30280 Rafał Miłecki 2024-06-04   720  		};
660c230bf30280 Rafał Miłecki 2024-06-04   721  
c4096ea06f912e Daniel Golle  2023-02-22   722  		spi0: spi@11007000 {
c4096ea06f912e Daniel Golle  2023-02-22   723  			compatible = "mediatek,ipm-spi-quad", "mediatek,spi-ipm";
c4096ea06f912e Daniel Golle  2023-02-22   724  			reg = <0 0x11007000 0 0x100>;
c4096ea06f912e Daniel Golle  2023-02-22   725  			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   726  			clocks = <&topckgen CLK_TOP_MPLL_D2>,
c4096ea06f912e Daniel Golle  2023-02-22   727  				 <&topckgen CLK_TOP_SPI_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22   728  				 <&infracfg CLK_INFRA_104M_SPI0>,
c4096ea06f912e Daniel Golle  2023-02-22   729  				 <&infracfg CLK_INFRA_66M_SPI0_HCK>;
c4096ea06f912e Daniel Golle  2023-02-22   730  			clock-names = "parent-clk", "sel-clk", "spi-clk",
c4096ea06f912e Daniel Golle  2023-02-22   731  				      "spi-hclk";
c4096ea06f912e Daniel Golle  2023-02-22   732  			#address-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   733  			#size-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22   734  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22   735  		};
c4096ea06f912e Daniel Golle  2023-02-22   736  
c4096ea06f912e Daniel Golle  2023-02-22   737  		spi1: spi@11008000 {
c4096ea06f912e Daniel Golle  2023-02-22   738  			compatible = "mediatek,ipm-spi-single", "mediatek,spi-ipm";
c4096ea06f912e Daniel Golle  2023-02-22   739  			reg = <0 0x11008000 0 0x100>;
c4096ea06f912e Daniel Golle  2023-02-22   740  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   741  			clocks = <&topckgen CLK_TOP_MPLL_D2>,
c4096ea06f912e Daniel Golle  2023-02-22   742  				 <&topckgen CLK_TOP_SPI_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22   743  				 <&infracfg CLK_INFRA_104M_SPI1>,
c4096ea06f912e Daniel Golle  2023-02-22   744  				 <&infracfg CLK_INFRA_66M_SPI1_HCK>;
c4096ea06f912e Daniel Golle  2023-02-22   745  			clock-names = "parent-clk", "sel-clk", "spi-clk",
c4096ea06f912e Daniel Golle  2023-02-22   746  				      "spi-hclk";
c4096ea06f912e Daniel Golle  2023-02-22   747  			#address-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   748  			#size-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22   749  			pinctrl-names = "default";
c4096ea06f912e Daniel Golle  2023-02-22   750  			pinctrl-0 = <&spi1_pins>;
c4096ea06f912e Daniel Golle  2023-02-22   751  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22   752  		};
c4096ea06f912e Daniel Golle  2023-02-22   753  
c4096ea06f912e Daniel Golle  2023-02-22   754  		spi2: spi@11009000 {
c4096ea06f912e Daniel Golle  2023-02-22   755  			compatible = "mediatek,ipm-spi-quad", "mediatek,spi-ipm";
c4096ea06f912e Daniel Golle  2023-02-22   756  			reg = <0 0x11009000 0 0x100>;
c4096ea06f912e Daniel Golle  2023-02-22   757  			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   758  			clocks = <&topckgen CLK_TOP_MPLL_D2>,
c4096ea06f912e Daniel Golle  2023-02-22   759  				 <&topckgen CLK_TOP_SPI_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22   760  				 <&infracfg CLK_INFRA_104M_SPI2_BCK>,
c4096ea06f912e Daniel Golle  2023-02-22   761  				 <&infracfg CLK_INFRA_66M_SPI2_HCK>;
c4096ea06f912e Daniel Golle  2023-02-22   762  			clock-names = "parent-clk", "sel-clk", "spi-clk",
c4096ea06f912e Daniel Golle  2023-02-22   763  				      "spi-hclk";
c4096ea06f912e Daniel Golle  2023-02-22   764  			#address-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   765  			#size-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22   766  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22   767  		};
c4096ea06f912e Daniel Golle  2023-02-22   768  
c4096ea06f912e Daniel Golle  2023-02-22   769  		lvts: lvts@1100a000 {
c4096ea06f912e Daniel Golle  2023-02-22   770  			compatible = "mediatek,mt7988-lvts-ap";
c4096ea06f912e Daniel Golle  2023-02-22   771  			#thermal-sensor-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   772  			reg = <0 0x1100a000 0 0x1000>;
c4096ea06f912e Daniel Golle  2023-02-22   773  			clocks = <&infracfg CLK_INFRA_26M_THERM_SYSTEM>;
c4096ea06f912e Daniel Golle  2023-02-22   774  			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   775  			resets = <&infracfg MT7988_INFRA_RST1_THERM_CTRL_SWRST>;
c4096ea06f912e Daniel Golle  2023-02-22   776  			nvmem-cells = <&lvts_calibration>;
c4096ea06f912e Daniel Golle  2023-02-22   777  			nvmem-cell-names = "lvts-calib-data-1";
c4096ea06f912e Daniel Golle  2023-02-22   778  		};
c4096ea06f912e Daniel Golle  2023-02-22   779  
c4096ea06f912e Daniel Golle  2023-02-22   780  		ssusb0: usb@11190000 {
09346afaba0a89 Rafał Miłecki 2024-02-13   781  			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
09346afaba0a89 Rafał Miłecki 2024-02-13   782  			reg = <0 0x11190000 0 0x2e00>,
09346afaba0a89 Rafał Miłecki 2024-02-13   783  			      <0 0x11193e00 0 0x0100>;
09346afaba0a89 Rafał Miłecki 2024-02-13   784  			reg-names = "mac", "ippc";
09346afaba0a89 Rafał Miłecki 2024-02-13   785  			interrupts = <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
09346afaba0a89 Rafał Miłecki 2024-02-13   786  			clocks = <&infracfg CLK_INFRA_USB_SYS>,
09346afaba0a89 Rafał Miłecki 2024-02-13   787  				 <&infracfg CLK_INFRA_USB_REF>,
09346afaba0a89 Rafał Miłecki 2024-02-13   788  				 <&infracfg CLK_INFRA_66M_USB_HCK>,
09346afaba0a89 Rafał Miłecki 2024-02-13   789  				 <&infracfg CLK_INFRA_133M_USB_HCK>,
09346afaba0a89 Rafał Miłecki 2024-02-13   790  				 <&infracfg CLK_INFRA_USB_XHCI>;
09346afaba0a89 Rafał Miłecki 2024-02-13   791  			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
09346afaba0a89 Rafał Miłecki 2024-02-13   792  		};
09346afaba0a89 Rafał Miłecki 2024-02-13   793  
c4096ea06f912e Daniel Golle  2023-02-22   794  		ssusb1: usb@11200000 {
09346afaba0a89 Rafał Miłecki 2024-02-13   795  			compatible = "mediatek,mt7988-xhci", "mediatek,mtk-xhci";
09346afaba0a89 Rafał Miłecki 2024-02-13   796  			reg = <0 0x11200000 0 0x2e00>,
09346afaba0a89 Rafał Miłecki 2024-02-13   797  			      <0 0x11203e00 0 0x0100>;
09346afaba0a89 Rafał Miłecki 2024-02-13   798  			reg-names = "mac", "ippc";
09346afaba0a89 Rafał Miłecki 2024-02-13   799  			interrupts = <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>;
09346afaba0a89 Rafał Miłecki 2024-02-13   800  			clocks = <&infracfg CLK_INFRA_USB_SYS_CK_P1>,
09346afaba0a89 Rafał Miłecki 2024-02-13   801  				 <&infracfg CLK_INFRA_USB_CK_P1>,
09346afaba0a89 Rafał Miłecki 2024-02-13   802  				 <&infracfg CLK_INFRA_66M_USB_HCK_CK_P1>,
09346afaba0a89 Rafał Miłecki 2024-02-13   803  				 <&infracfg CLK_INFRA_133M_USB_HCK_CK_P1>,
09346afaba0a89 Rafał Miłecki 2024-02-13   804  				 <&infracfg CLK_INFRA_USB_XHCI_CK_P1>;
09346afaba0a89 Rafał Miłecki 2024-02-13   805  			clock-names = "sys_ck", "ref_ck", "mcu_ck", "dma_ck", "xhci_ck";
09346afaba0a89 Rafał Miłecki 2024-02-13   806  		};
09346afaba0a89 Rafał Miłecki 2024-02-13   807  
c4096ea06f912e Daniel Golle  2023-02-22   808  		afe: audio-controller@11210000 {
c4096ea06f912e Daniel Golle  2023-02-22   809  			compatible = "mediatek,mt79xx-audio";
c4096ea06f912e Daniel Golle  2023-02-22   810  			reg = <0 0x11210000 0 0x9000>;
c4096ea06f912e Daniel Golle  2023-02-22   811  			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   812  			clocks = <&infracfg CLK_INFRA_66M_AUD_SLV_BCK>,
c4096ea06f912e Daniel Golle  2023-02-22   813  				 <&infracfg CLK_INFRA_AUD_26M>,
c4096ea06f912e Daniel Golle  2023-02-22   814  				 <&infracfg CLK_INFRA_AUD_L>,
c4096ea06f912e Daniel Golle  2023-02-22   815  				 <&infracfg CLK_INFRA_AUD_AUD>,
c4096ea06f912e Daniel Golle  2023-02-22   816  				 <&infracfg CLK_INFRA_AUD_EG2>,
c4096ea06f912e Daniel Golle  2023-02-22   817  				 <&topckgen CLK_TOP_AUD_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22   818  				 <&topckgen CLK_TOP_AUD_I2S_M>;
c4096ea06f912e Daniel Golle  2023-02-22   819  			clock-names = "aud_bus_ck",
c4096ea06f912e Daniel Golle  2023-02-22   820  				      "aud_26m_ck",
c4096ea06f912e Daniel Golle  2023-02-22   821  				      "aud_l_ck",
c4096ea06f912e Daniel Golle  2023-02-22   822  				      "aud_aud_ck",
c4096ea06f912e Daniel Golle  2023-02-22   823  				      "aud_eg2_ck",
c4096ea06f912e Daniel Golle  2023-02-22   824  				      "aud_sel",
c4096ea06f912e Daniel Golle  2023-02-22   825  				      "aud_i2s_m";
c4096ea06f912e Daniel Golle  2023-02-22   826  			assigned-clocks = <&topckgen CLK_TOP_AUD_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22   827  					  <&topckgen CLK_TOP_A1SYS_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22   828  					  <&topckgen CLK_TOP_AUD_L_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22   829  					  <&topckgen CLK_TOP_A_TUNER_SEL>;
c4096ea06f912e Daniel Golle  2023-02-22   830  			assigned-clock-parents = <&apmixedsys CLK_APMIXED_APLL2>,
c4096ea06f912e Daniel Golle  2023-02-22   831  						 <&topckgen CLK_TOP_APLL2_D4>,
c4096ea06f912e Daniel Golle  2023-02-22   832  						 <&apmixedsys CLK_APMIXED_APLL2>,
c4096ea06f912e Daniel Golle  2023-02-22   833  						 <&topckgen CLK_TOP_APLL2_D4>;
c4096ea06f912e Daniel Golle  2023-02-22   834  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22   835  		};
c4096ea06f912e Daniel Golle  2023-02-22   836  
c4096ea06f912e Daniel Golle  2023-02-22   837  		mmc0: mmc@11230000 {
c4096ea06f912e Daniel Golle  2023-02-22   838  			compatible = "mediatek,mt7986-mmc",
c4096ea06f912e Daniel Golle  2023-02-22   839  				     "mediatek,mt7981-mmc";
c4096ea06f912e Daniel Golle  2023-02-22   840  			reg = <0 0x11230000 0 0x1000>,
c4096ea06f912e Daniel Golle  2023-02-22   841  			      <0 0x11D60000 0 0x1000>;
c4096ea06f912e Daniel Golle  2023-02-22   842  			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   843  			clocks = <&infracfg CLK_INFRA_MSDC400>,
c4096ea06f912e Daniel Golle  2023-02-22   844  				 <&infracfg CLK_INFRA_MSDC2_HCK>,
c4096ea06f912e Daniel Golle  2023-02-22   845  				 <&infracfg CLK_INFRA_66M_MSDC_0_HCK>,
c4096ea06f912e Daniel Golle  2023-02-22   846  				 <&infracfg CLK_INFRA_133M_MSDC_0_HCK>;
c4096ea06f912e Daniel Golle  2023-02-22   847  			assigned-clocks = <&topckgen CLK_TOP_EMMC_250M_SEL>,
c4096ea06f912e Daniel Golle  2023-02-22   848  					  <&topckgen CLK_TOP_EMMC_400M_SEL>;
c4096ea06f912e Daniel Golle  2023-02-22   849  			assigned-clock-parents = <&topckgen CLK_TOP_NET1PLL_D5_D2>,
c4096ea06f912e Daniel Golle  2023-02-22   850  						 <&apmixedsys CLK_APMIXED_MSDCPLL>;
c4096ea06f912e Daniel Golle  2023-02-22   851  			clock-names = "source",
c4096ea06f912e Daniel Golle  2023-02-22   852  				      "hclk",
c4096ea06f912e Daniel Golle  2023-02-22   853  				      "axi_cg",
c4096ea06f912e Daniel Golle  2023-02-22   854  				      "ahb_cg";
c4096ea06f912e Daniel Golle  2023-02-22   855  			#address-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   856  			#size-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22   857  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22   858  		};
c4096ea06f912e Daniel Golle  2023-02-22   859  
c4096ea06f912e Daniel Golle  2023-02-22   860  		pcie2: pcie@11280000 {
c4096ea06f912e Daniel Golle  2023-02-22   861  			compatible = "mediatek,mt7988-pcie",
c4096ea06f912e Daniel Golle  2023-02-22   862  				     "mediatek,mt7986-pcie",
c4096ea06f912e Daniel Golle  2023-02-22   863  				     "mediatek,mt8192-pcie";
c4096ea06f912e Daniel Golle  2023-02-22   864  			device_type = "pci";
c4096ea06f912e Daniel Golle  2023-02-22   865  			#address-cells = <3>;
c4096ea06f912e Daniel Golle  2023-02-22   866  			#size-cells = <2>;
c4096ea06f912e Daniel Golle  2023-02-22   867  			reg = <0 0x11280000 0 0x2000>;
c4096ea06f912e Daniel Golle  2023-02-22   868  			reg-names = "pcie-mac";
c4096ea06f912e Daniel Golle  2023-02-22   869  			linux,pci-domain = <3>;
c4096ea06f912e Daniel Golle  2023-02-22   870  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   871  			bus-range = <0x00 0xff>;
c4096ea06f912e Daniel Golle  2023-02-22   872  			ranges = <0x81000000 0x00 0x20000000 0x00
c4096ea06f912e Daniel Golle  2023-02-22   873  				  0x20000000 0x00 0x00200000>,
c4096ea06f912e Daniel Golle  2023-02-22   874  				 <0x82000000 0x00 0x20200000 0x00
c4096ea06f912e Daniel Golle  2023-02-22   875  				  0x20200000 0x00 0x07e00000>;
c4096ea06f912e Daniel Golle  2023-02-22   876  			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P2>,
c4096ea06f912e Daniel Golle  2023-02-22   877  				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P2>,
c4096ea06f912e Daniel Golle  2023-02-22   878  				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P2>,
c4096ea06f912e Daniel Golle  2023-02-22   879  				 <&infracfg CLK_INFRA_133M_PCIE_CK_P2>;
c4096ea06f912e Daniel Golle  2023-02-22   880  			clock-names = "pl_250m", "tl_26m", "peri_26m",
c4096ea06f912e Daniel Golle  2023-02-22   881  				      "top_133m";
c4096ea06f912e Daniel Golle  2023-02-22   882  			pinctrl-names = "default";
c4096ea06f912e Daniel Golle  2023-02-22   883  			pinctrl-0 = <&pcie2_pins>;
c4096ea06f912e Daniel Golle  2023-02-22   884  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22   885  
c4096ea06f912e Daniel Golle  2023-02-22   886  			phys = <&xphyu3port0 PHY_TYPE_PCIE>;
c4096ea06f912e Daniel Golle  2023-02-22   887  			phy-names = "pcie-phy";
c4096ea06f912e Daniel Golle  2023-02-22   888  
c4096ea06f912e Daniel Golle  2023-02-22   889  			#interrupt-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   890  			interrupt-map-mask = <0 0 0 0x7>;
c4096ea06f912e Daniel Golle  2023-02-22   891  			interrupt-map = <0 0 0 1 &pcie_intc2 0>,
c4096ea06f912e Daniel Golle  2023-02-22   892  					<0 0 0 2 &pcie_intc2 1>,
c4096ea06f912e Daniel Golle  2023-02-22   893  					<0 0 0 3 &pcie_intc2 2>,
c4096ea06f912e Daniel Golle  2023-02-22   894  					<0 0 0 4 &pcie_intc2 3>;
c4096ea06f912e Daniel Golle  2023-02-22   895  			pcie_intc2: interrupt-controller {
c4096ea06f912e Daniel Golle  2023-02-22   896  				#address-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22   897  				#interrupt-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   898  				interrupt-controller;
c4096ea06f912e Daniel Golle  2023-02-22   899  			};
c4096ea06f912e Daniel Golle  2023-02-22   900  		};
c4096ea06f912e Daniel Golle  2023-02-22   901  
c4096ea06f912e Daniel Golle  2023-02-22   902  		pcie3: pcie@11290000 {
c4096ea06f912e Daniel Golle  2023-02-22   903  			compatible = "mediatek,mt7988-pcie",
c4096ea06f912e Daniel Golle  2023-02-22   904  				     "mediatek,mt7986-pcie",
c4096ea06f912e Daniel Golle  2023-02-22   905  				     "mediatek,mt8192-pcie";
c4096ea06f912e Daniel Golle  2023-02-22   906  			device_type = "pci";
c4096ea06f912e Daniel Golle  2023-02-22   907  			#address-cells = <3>;
c4096ea06f912e Daniel Golle  2023-02-22   908  			#size-cells = <2>;
c4096ea06f912e Daniel Golle  2023-02-22   909  			reg = <0 0x11290000 0 0x2000>;
c4096ea06f912e Daniel Golle  2023-02-22   910  			reg-names = "pcie-mac";
c4096ea06f912e Daniel Golle  2023-02-22   911  			linux,pci-domain = <2>;
c4096ea06f912e Daniel Golle  2023-02-22   912  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   913  			bus-range = <0x00 0xff>;
c4096ea06f912e Daniel Golle  2023-02-22   914  			ranges = <0x81000000 0x00 0x28000000 0x00
c4096ea06f912e Daniel Golle  2023-02-22   915  				  0x28000000 0x00 0x00200000>,
c4096ea06f912e Daniel Golle  2023-02-22   916  				 <0x82000000 0x00 0x28200000 0x00
c4096ea06f912e Daniel Golle  2023-02-22   917  				  0x28200000 0x00 0x07e00000>;
c4096ea06f912e Daniel Golle  2023-02-22   918  			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P3>,
c4096ea06f912e Daniel Golle  2023-02-22   919  				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P3>,
c4096ea06f912e Daniel Golle  2023-02-22   920  				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P3>,
c4096ea06f912e Daniel Golle  2023-02-22   921  				 <&infracfg CLK_INFRA_133M_PCIE_CK_P3>;
c4096ea06f912e Daniel Golle  2023-02-22   922  			clock-names = "pl_250m", "tl_26m", "peri_26m",
c4096ea06f912e Daniel Golle  2023-02-22   923  				      "top_133m";
c4096ea06f912e Daniel Golle  2023-02-22   924  			pinctrl-names = "default";
c4096ea06f912e Daniel Golle  2023-02-22   925  			pinctrl-0 = <&pcie3_pins>;
c4096ea06f912e Daniel Golle  2023-02-22   926  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22   927  
c4096ea06f912e Daniel Golle  2023-02-22   928  			#interrupt-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   929  			interrupt-map-mask = <0 0 0 0x7>;
c4096ea06f912e Daniel Golle  2023-02-22   930  			interrupt-map = <0 0 0 1 &pcie_intc3 0>,
c4096ea06f912e Daniel Golle  2023-02-22   931  					<0 0 0 2 &pcie_intc3 1>,
c4096ea06f912e Daniel Golle  2023-02-22   932  					<0 0 0 3 &pcie_intc3 2>,
c4096ea06f912e Daniel Golle  2023-02-22   933  					<0 0 0 4 &pcie_intc3 3>;
c4096ea06f912e Daniel Golle  2023-02-22   934  			pcie_intc3: interrupt-controller {
c4096ea06f912e Daniel Golle  2023-02-22   935  				#address-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22   936  				#interrupt-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   937  				interrupt-controller;
c4096ea06f912e Daniel Golle  2023-02-22   938  			};
c4096ea06f912e Daniel Golle  2023-02-22   939  		};
c4096ea06f912e Daniel Golle  2023-02-22   940  
c4096ea06f912e Daniel Golle  2023-02-22   941  		pcie0: pcie@11300000 {
c4096ea06f912e Daniel Golle  2023-02-22   942  			compatible = "mediatek,mt7988-pcie",
c4096ea06f912e Daniel Golle  2023-02-22   943  				     "mediatek,mt7986-pcie",
c4096ea06f912e Daniel Golle  2023-02-22   944  				     "mediatek,mt8192-pcie";
c4096ea06f912e Daniel Golle  2023-02-22   945  			device_type = "pci";
c4096ea06f912e Daniel Golle  2023-02-22   946  			#address-cells = <3>;
c4096ea06f912e Daniel Golle  2023-02-22   947  			#size-cells = <2>;
c4096ea06f912e Daniel Golle  2023-02-22   948  			reg = <0 0x11300000 0 0x2000>;
c4096ea06f912e Daniel Golle  2023-02-22   949  			reg-names = "pcie-mac";
c4096ea06f912e Daniel Golle  2023-02-22   950  			linux,pci-domain = <0>;
c4096ea06f912e Daniel Golle  2023-02-22   951  			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   952  			bus-range = <0x00 0xff>;
c4096ea06f912e Daniel Golle  2023-02-22   953  			ranges = <0x81000000 0x00 0x30000000 0x00
c4096ea06f912e Daniel Golle  2023-02-22   954  				  0x30000000 0x00 0x00200000>,
c4096ea06f912e Daniel Golle  2023-02-22   955  				 <0x82000000 0x00 0x30200000 0x00
c4096ea06f912e Daniel Golle  2023-02-22   956  				  0x30200000 0x00 0x07e00000>;
c4096ea06f912e Daniel Golle  2023-02-22   957  			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P0>,
c4096ea06f912e Daniel Golle  2023-02-22   958  				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P0>,
c4096ea06f912e Daniel Golle  2023-02-22   959  				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P0>,
c4096ea06f912e Daniel Golle  2023-02-22   960  				 <&infracfg CLK_INFRA_133M_PCIE_CK_P0>;
c4096ea06f912e Daniel Golle  2023-02-22   961  			clock-names = "pl_250m", "tl_26m", "peri_26m",
c4096ea06f912e Daniel Golle  2023-02-22   962  				      "top_133m";
c4096ea06f912e Daniel Golle  2023-02-22   963  			pinctrl-names = "default";
c4096ea06f912e Daniel Golle  2023-02-22   964  			pinctrl-0 = <&pcie0_pins>;
c4096ea06f912e Daniel Golle  2023-02-22   965  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22   966  
c4096ea06f912e Daniel Golle  2023-02-22   967  			#interrupt-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   968  			interrupt-map-mask = <0 0 0 0x7>;
c4096ea06f912e Daniel Golle  2023-02-22   969  			interrupt-map = <0 0 0 1 &pcie_intc0 0>,
c4096ea06f912e Daniel Golle  2023-02-22   970  					<0 0 0 2 &pcie_intc0 1>,
c4096ea06f912e Daniel Golle  2023-02-22   971  					<0 0 0 3 &pcie_intc0 2>,
c4096ea06f912e Daniel Golle  2023-02-22   972  					<0 0 0 4 &pcie_intc0 3>;
c4096ea06f912e Daniel Golle  2023-02-22   973  			pcie_intc0: interrupt-controller {
c4096ea06f912e Daniel Golle  2023-02-22   974  				#address-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22   975  				#interrupt-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   976  				interrupt-controller;
c4096ea06f912e Daniel Golle  2023-02-22   977  			};
c4096ea06f912e Daniel Golle  2023-02-22   978  		};
c4096ea06f912e Daniel Golle  2023-02-22   979  
c4096ea06f912e Daniel Golle  2023-02-22   980  		pcie1: pcie@11310000 {
c4096ea06f912e Daniel Golle  2023-02-22   981  			compatible = "mediatek,mt7988-pcie",
c4096ea06f912e Daniel Golle  2023-02-22   982  				     "mediatek,mt7986-pcie",
c4096ea06f912e Daniel Golle  2023-02-22   983  				     "mediatek,mt8192-pcie";
c4096ea06f912e Daniel Golle  2023-02-22   984  			device_type = "pci";
c4096ea06f912e Daniel Golle  2023-02-22   985  			#address-cells = <3>;
c4096ea06f912e Daniel Golle  2023-02-22   986  			#size-cells = <2>;
c4096ea06f912e Daniel Golle  2023-02-22   987  			reg = <0 0x11310000 0 0x2000>;
c4096ea06f912e Daniel Golle  2023-02-22   988  			reg-names = "pcie-mac";
c4096ea06f912e Daniel Golle  2023-02-22   989  			linux,pci-domain = <1>;
c4096ea06f912e Daniel Golle  2023-02-22   990  			interrupts = <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>;
c4096ea06f912e Daniel Golle  2023-02-22   991  			bus-range = <0x00 0xff>;
c4096ea06f912e Daniel Golle  2023-02-22   992  			ranges = <0x81000000 0x00 0x38000000 0x00
c4096ea06f912e Daniel Golle  2023-02-22   993  				  0x38000000 0x00 0x00200000>,
c4096ea06f912e Daniel Golle  2023-02-22   994  				 <0x82000000 0x00 0x38200000 0x00
c4096ea06f912e Daniel Golle  2023-02-22   995  				  0x38200000 0x00 0x07e00000>;
c4096ea06f912e Daniel Golle  2023-02-22   996  			clocks = <&infracfg CLK_INFRA_PCIE_PIPE_P1>,
c4096ea06f912e Daniel Golle  2023-02-22   997  				 <&infracfg CLK_INFRA_PCIE_GFMUX_TL_P1>,
c4096ea06f912e Daniel Golle  2023-02-22   998  				 <&infracfg CLK_INFRA_PCIE_PERI_26M_CK_P1>,
c4096ea06f912e Daniel Golle  2023-02-22   999  				 <&infracfg CLK_INFRA_133M_PCIE_CK_P1>;
c4096ea06f912e Daniel Golle  2023-02-22  1000  			clock-names = "pl_250m", "tl_26m", "peri_26m",
c4096ea06f912e Daniel Golle  2023-02-22  1001  				      "top_133m";
c4096ea06f912e Daniel Golle  2023-02-22  1002  			pinctrl-names = "default";
c4096ea06f912e Daniel Golle  2023-02-22  1003  			pinctrl-0 = <&pcie1_pins>;
c4096ea06f912e Daniel Golle  2023-02-22  1004  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22  1005  
c4096ea06f912e Daniel Golle  2023-02-22  1006  			#interrupt-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22  1007  			interrupt-map-mask = <0 0 0 0x7>;
c4096ea06f912e Daniel Golle  2023-02-22  1008  			interrupt-map = <0 0 0 1 &pcie_intc1 0>,
c4096ea06f912e Daniel Golle  2023-02-22  1009  					<0 0 0 2 &pcie_intc1 1>,
c4096ea06f912e Daniel Golle  2023-02-22  1010  					<0 0 0 3 &pcie_intc1 2>,
c4096ea06f912e Daniel Golle  2023-02-22  1011  					<0 0 0 4 &pcie_intc1 3>;
c4096ea06f912e Daniel Golle  2023-02-22  1012  			pcie_intc1: interrupt-controller {
c4096ea06f912e Daniel Golle  2023-02-22  1013  				#address-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22  1014  				#interrupt-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22  1015  				interrupt-controller;
c4096ea06f912e Daniel Golle  2023-02-22  1016  			};
c4096ea06f912e Daniel Golle  2023-02-22  1017  		};
c4096ea06f912e Daniel Golle  2023-02-22  1018  
c4096ea06f912e Daniel Golle  2023-02-22  1019  		tphy: tphy@11c50000 {
c4096ea06f912e Daniel Golle  2023-02-22  1020  			compatible = "mediatek,mt7988",
c4096ea06f912e Daniel Golle  2023-02-22  1021  				     "mediatek,generic-tphy-v2";
c4096ea06f912e Daniel Golle  2023-02-22  1022  			#address-cells = <2>;
c4096ea06f912e Daniel Golle  2023-02-22  1023  			#size-cells = <2>;
c4096ea06f912e Daniel Golle  2023-02-22  1024  			ranges;
c4096ea06f912e Daniel Golle  2023-02-22  1025  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22  1026  			tphyu2port0: usb-phy@11c50000 {
c4096ea06f912e Daniel Golle  2023-02-22  1027  				reg = <0 0x11c50000 0 0x700>;
c4096ea06f912e Daniel Golle  2023-02-22  1028  				clocks = <&infracfg CLK_INFRA_USB_UTMI_CK_P1>;
c4096ea06f912e Daniel Golle  2023-02-22  1029  				clock-names = "ref";
c4096ea06f912e Daniel Golle  2023-02-22  1030  				#phy-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22  1031  			};
c4096ea06f912e Daniel Golle  2023-02-22  1032  			tphyu3port0: usb-phy@11c50700 {
c4096ea06f912e Daniel Golle  2023-02-22  1033  				reg = <0 0x11c50700 0 0x900>;
c4096ea06f912e Daniel Golle  2023-02-22  1034  				clocks = <&infracfg CLK_INFRA_USB_PIPE_CK_P1>;
c4096ea06f912e Daniel Golle  2023-02-22  1035  				clock-names = "ref";
c4096ea06f912e Daniel Golle  2023-02-22  1036  				#phy-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22  1037  				mediatek,usb3-pll-ssc-delta;
c4096ea06f912e Daniel Golle  2023-02-22  1038  				mediatek,usb3-pll-ssc-delta1;
c4096ea06f912e Daniel Golle  2023-02-22  1039  			};
c4096ea06f912e Daniel Golle  2023-02-22  1040  		};
c4096ea06f912e Daniel Golle  2023-02-22  1041  
c4096ea06f912e Daniel Golle  2023-02-22  1042  		topmisc: topmisc@11d10000 {
c4096ea06f912e Daniel Golle  2023-02-22  1043  			compatible = "mediatek,mt7988-topmisc", "syscon",
c4096ea06f912e Daniel Golle  2023-02-22  1044  				     "mediatek,mt7988-power-controller";
c4096ea06f912e Daniel Golle  2023-02-22  1045  			reg = <0 0x11d10000 0 0x10000>;
c4096ea06f912e Daniel Golle  2023-02-22  1046  			#clock-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22  1047  			#power-domain-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22  1048  			#address-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22  1049  			#size-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22  1050  		};
c4096ea06f912e Daniel Golle  2023-02-22  1051  
c4096ea06f912e Daniel Golle  2023-02-22  1052  		xphy: xphy@11e10000 {
c4096ea06f912e Daniel Golle  2023-02-22  1053  			compatible = "mediatek,mt7988",
c4096ea06f912e Daniel Golle  2023-02-22  1054  				     "mediatek,xsphy";
c4096ea06f912e Daniel Golle  2023-02-22  1055  			#address-cells = <2>;
c4096ea06f912e Daniel Golle  2023-02-22  1056  			#size-cells = <2>;
c4096ea06f912e Daniel Golle  2023-02-22  1057  			ranges;
c4096ea06f912e Daniel Golle  2023-02-22  1058  			status = "disabled";
c4096ea06f912e Daniel Golle  2023-02-22  1059  
c4096ea06f912e Daniel Golle  2023-02-22  1060  			xphyu2port0: usb-phy@11e10000 {
c4096ea06f912e Daniel Golle  2023-02-22  1061  				reg = <0 0x11e10000 0 0x400>;
c4096ea06f912e Daniel Golle  2023-02-22  1062  				clocks = <&infracfg CLK_INFRA_USB_UTMI>;
c4096ea06f912e Daniel Golle  2023-02-22  1063  				clock-names = "ref";
c4096ea06f912e Daniel Golle  2023-02-22  1064  				#phy-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22  1065  			};
c4096ea06f912e Daniel Golle  2023-02-22  1066  
c4096ea06f912e Daniel Golle  2023-02-22  1067  			xphyu3port0: usb-phy@11e13000 {
c4096ea06f912e Daniel Golle  2023-02-22  1068  				reg = <0 0x11e13400 0 0x500>;
c4096ea06f912e Daniel Golle  2023-02-22  1069  				clocks = <&infracfg CLK_INFRA_USB_PIPE>;
c4096ea06f912e Daniel Golle  2023-02-22  1070  				clock-names = "ref";
c4096ea06f912e Daniel Golle  2023-02-22  1071  				#phy-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22  1072  				mediatek,syscon-type = <&topmisc 0x218 0>;
c4096ea06f912e Daniel Golle  2023-02-22  1073  			};
c4096ea06f912e Daniel Golle  2023-02-22  1074  		};
c4096ea06f912e Daniel Golle  2023-02-22  1075  
c4096ea06f912e Daniel Golle  2023-02-22  1076  		xfi_tphy0: phy@11f20000 {
c4096ea06f912e Daniel Golle  2023-02-22  1077  			compatible = "mediatek,mt7988-xfi-tphy";
c4096ea06f912e Daniel Golle  2023-02-22  1078  			reg = <0 0x11f20000 0 0x10000>;
c4096ea06f912e Daniel Golle  2023-02-22  1079  			resets = <&watchdog 14>;
c4096ea06f912e Daniel Golle  2023-02-22  1080  			clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>, <&topckgen CLK_TOP_XFI_PHY_0_XTAL_SEL>;
c4096ea06f912e Daniel Golle  2023-02-22  1081  			clock-names = "xfipll", "topxtal";
c4096ea06f912e Daniel Golle  2023-02-22  1082  			mediatek,usxgmii-performance-errata;
c4096ea06f912e Daniel Golle  2023-02-22  1083  			#phy-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22  1084  		};
c4096ea06f912e Daniel Golle  2023-02-22  1085  
c4096ea06f912e Daniel Golle  2023-02-22  1086  		xfi_tphy1: phy@11f30000 {
c4096ea06f912e Daniel Golle  2023-02-22  1087  			compatible = "mediatek,mt7988-xfi-tphy";
c4096ea06f912e Daniel Golle  2023-02-22  1088  			reg = <0 0x11f30000 0 0x10000>;
c4096ea06f912e Daniel Golle  2023-02-22  1089  			resets = <&watchdog 15>;
c4096ea06f912e Daniel Golle  2023-02-22  1090  			clocks = <&xfi_pll CLK_XFIPLL_PLL_EN>, <&topckgen CLK_TOP_XFI_PHY_1_XTAL_SEL>;
c4096ea06f912e Daniel Golle  2023-02-22  1091  			clock-names = "xfipll", "topxtal";
c4096ea06f912e Daniel Golle  2023-02-22  1092  			#phy-cells = <0>;
c4096ea06f912e Daniel Golle  2023-02-22  1093  		};
c4096ea06f912e Daniel Golle  2023-02-22  1094  
c4096ea06f912e Daniel Golle  2023-02-22  1095  		xfi_pll: clock-controller@11f40000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08  1096  			compatible = "mediatek,mt7988-xfi-pll";
b616b403cbffc6 Rafał Miłecki 2024-01-08  1097  			reg = <0 0x11f40000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1098  			resets = <&watchdog 16>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1099  			#clock-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1100  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08  1101  
c4096ea06f912e Daniel Golle  2023-02-22  1102  		efuse: efuse@11f50000 {
c4096ea06f912e Daniel Golle  2023-02-22  1103  			compatible = "mediatek,efuse";
c4096ea06f912e Daniel Golle  2023-02-22  1104  			reg = <0 0x11f50000 0 0x1000>;
c4096ea06f912e Daniel Golle  2023-02-22  1105  			#address-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22  1106  			#size-cells = <1>;
c4096ea06f912e Daniel Golle  2023-02-22  1107  
c4096ea06f912e Daniel Golle  2023-02-22  1108  			cpufreq_calibration: calib@278 {
c4096ea06f912e Daniel Golle  2023-02-22  1109  				reg = <0x278 0x1>;
c4096ea06f912e Daniel Golle  2023-02-22  1110  			};
c4096ea06f912e Daniel Golle  2023-02-22  1111  			lvts_calibration: calib@918 {
c4096ea06f912e Daniel Golle  2023-02-22  1112  				reg = <0x918 0x28>;
c4096ea06f912e Daniel Golle  2023-02-22  1113  			};
c4096ea06f912e Daniel Golle  2023-02-22  1114  			phy_calibration_p0: calib@940 {
c4096ea06f912e Daniel Golle  2023-02-22  1115  				reg = <0x940 0x10>;
c4096ea06f912e Daniel Golle  2023-02-22  1116  			};
c4096ea06f912e Daniel Golle  2023-02-22  1117  			phy_calibration_p1: calib@954 {
c4096ea06f912e Daniel Golle  2023-02-22  1118  				reg = <0x954 0x10>;
c4096ea06f912e Daniel Golle  2023-02-22  1119  			};
c4096ea06f912e Daniel Golle  2023-02-22  1120  			phy_calibration_p2: calib@968 {
c4096ea06f912e Daniel Golle  2023-02-22  1121  				reg = <0x968 0x10>;
c4096ea06f912e Daniel Golle  2023-02-22  1122  			};
c4096ea06f912e Daniel Golle  2023-02-22  1123  			phy_calibration_p3: calib@97c {
c4096ea06f912e Daniel Golle  2023-02-22  1124  				reg = <0x97c 0x10>;
c4096ea06f912e Daniel Golle  2023-02-22  1125  			};
c4096ea06f912e Daniel Golle  2023-02-22  1126  		};
c4096ea06f912e Daniel Golle  2023-02-22  1127  
c4096ea06f912e Daniel Golle  2023-02-22  1128  		ethsys: clock-controller@15000000 {
b616b403cbffc6 Rafał Miłecki 2024-01-08  1129  			compatible = "mediatek,mt7988-ethsys", "syscon";
b616b403cbffc6 Rafał Miłecki 2024-01-08  1130  			reg = <0 0x15000000 0 0x1000>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1131  			#clock-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1132  			#reset-cells = <1>;
b616b403cbffc6 Rafał Miłecki 2024-01-08  1133  		};
b616b403cbffc6 Rafał Miłecki 2024-01-08  1134  
c4096ea06f912e Daniel Golle  2023-02-22 @1135  		switch: switch@15020000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
