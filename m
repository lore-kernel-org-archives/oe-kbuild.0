Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FE28129E93
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Aug 2024 21:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723843279; cv=none; b=hQV/l243/MPudsYjhPqUniJfvgr8om/LJ8d/dtKy7Oj584uw+Z1skOYhTyJrk6uXLr++VPxf4g0t9Qyo2alvUPaez2F0SDjAScIeqsW31vN7LVJ8yfPlLw1tdCSTK+Ps26Hj1ePvLUnuFq6ZvBomGxVvGAxEzkSjVOTqgtmsBAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723843279; c=relaxed/simple;
	bh=C251JPLvqm75f9DsorMA1EjvbrzinLg4AtraCF+zqz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7fEPt5EdOpuZg7RuNLeWPx2SyR5YtXQfailY9d0PazTBy9rlZjXUSq/HRctuqmHZN4/+gVymubFHDy/tLw/YUtvMxe2nmCnTCRRTmh3DiRTjkanA9A4HDpuXXVO2NGJ84ZCppcgaAxvetXMf3ZJ3tKBteXuNc+IzjX41CtFLO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AscyxfhG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AscyxfhG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723843277; x=1755379277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C251JPLvqm75f9DsorMA1EjvbrzinLg4AtraCF+zqz0=;
  b=AscyxfhGs7WOEJqE/P+QW7R3ahUVl+RKoS6wypefeJ1MfxZk6rRPCwt9
   DK9OsbjRaXbBgd2/zu0VDUxKx/u+bz/+u5cXh1w3TJFThe51r5Hij/Qla
   mEWNPgA2VsoHIpqTMtDUgIw/IL/9evG582zG5rKrvWBgbLbx2SlJc34O9
   Or6kae3t7sU0Dgc3ISPrCz0naf1z8Cb3VV9dakXe0TtOvaff3iefNp4EA
   uWwHk+u8Kim++vw07zPoWa+Io88Rb3IpHno4dwFtR/dDVfobI+5rRryWl
   ufEUioORLDOQaVaJBb3rIqP8UmSLRbwpN5yVF7j84HCKboH3Y5bJF7cBG
   g==;
X-CSE-ConnectionGUID: lx4BkYrhRuahTUiBtI8H8w==
X-CSE-MsgGUID: TC2P49N9QgK1K7R748Lhtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="32822705"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="32822705"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 14:21:16 -0700
X-CSE-ConnectionGUID: XyvrysZkR42B958di2wxpA==
X-CSE-MsgGUID: kTQtDXOgQ1CAe2mIkHD+SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="64617670"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Aug 2024 14:21:16 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf4Nl-0006w2-16;
	Fri, 16 Aug 2024 21:21:13 +0000
Date: Sat, 17 Aug 2024 05:21:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: switch@10: Unevaluated
 properties are not allowed ('#address-cells', '#size-cells' were unexpected)
Message-ID: <202408170519.NzG0FABh-lkp@intel.com>
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
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Oleksij Rempel <o.rempel@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   296c871d2904cff2b4742702ef94512ab467a8e3
commit: 4a78f0173be2673cbdadf91023085982888474a6 dt-bindings: net: qca,ar9331: convert to DT schema
date:   6 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 6 months ago
config: mips-randconfig-051-20240817 (https://download.01.org/0day-ci/archive/20240817/202408170519.NzG0FABh-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170519.NzG0FABh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408170519.NzG0FABh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /: failed to match any schema with compatible: ['dptechnics,dpt-module']
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /interrupt-controller: failed to match any schema with compatible: ['qca,ar7100-cpu-intc']
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /ahb/apb/gpio@18040000: failed to match any schema with compatible: ['qca,ar7100-gpio']
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /ahb/apb/pll-controller@18050000: failed to match any schema with compatible: ['qca,ar9330-pll']
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /ahb/apb/interrupt-controller@18060010: failed to match any schema with compatible: ['qca,ar7240-misc-intc']
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: reset-controller@1806001c: compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: reset-controller@1806001c: compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
>> arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: switch@10: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/qca,ar9331.yaml#
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: w25q128@0: $nodename:0: 'w25q128@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: w25q128@0: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/mips/boot/dts/qca/ar9331_dpt_module.dtb: /usb-phy: failed to match any schema with compatible: ['qca,ar7100-usb-phy']
--
   arch/mips/boot/dts/qca/ar9331.dtsi:158.25-259.7: Warning (avoid_unnecessary_addr_size): /ahb/ethernet@1a000000/mdio/switch@10: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /: failed to match any schema with compatible: ['openembed,som9331']
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /interrupt-controller: failed to match any schema with compatible: ['qca,ar7100-cpu-intc']
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /ahb/apb/gpio@18040000: failed to match any schema with compatible: ['qca,ar7100-gpio']
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /ahb/apb/pll-controller@18050000: failed to match any schema with compatible: ['qca,ar9330-pll']
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /ahb/apb/interrupt-controller@18060010: failed to match any schema with compatible: ['qca,ar7240-misc-intc']
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: reset-controller@1806001c: compatible:0: 'qca,ar7100-reset' is not one of ['qca,ar9132-reset', 'qca,ar9331-reset']
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: reset-controller@1806001c: compatible: ['qca,ar7100-reset'] is too short
   	from schema $id: http://devicetree.org/schemas/reset/qca,ar7100-reset.yaml#
>> arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: switch@10: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/qca,ar9331.yaml#
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar7100-spi']
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: w25q64@0: $nodename:0: 'w25q64@0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: w25q64@0: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/mips/boot/dts/qca/ar9331_openembed_som9331_board.dtb: /usb-phy: failed to match any schema with compatible: ['qca,ar7100-usb-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
