Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D0278F4A
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Jun 2025 22:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751321181; cv=none; b=IBpfLdEhH4oiHXTaTLj3nJpR9He69GNijtQ8gkJW1GAqtDVnF74eXUQQx/lf6m26PjFxwqIMwV+A4dLpPgNXHSH7Tsi3D4+jUAmNDpsCzjDxIjq8nUdDmgKOlimKrz5BMQJF5wUIV7Tz4uoJjXxeUhZQkhbPEXdGWRciyjArqss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751321181; c=relaxed/simple;
	bh=vRws1OapWy6WUQ8Rk2gv4OzmdAcOtzk/45Od0SxkNqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O6xhH/d0MUSqFPVcpS4SR6lxvswc61mMOwRnAGbOo9D0D/heBI7wp5T/cL0z+jn3aI84EmDEPzhHeC6L8/NEcEVvbKeo0DWPJ5Xv6PJiZuHkDgp6lGvFiP1ag2F/1t9V648VOldiitCArJ/g71jEM4iptw/TuD/xdXXw4XvkYWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwE0HvDl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwE0HvDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751321179; x=1782857179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vRws1OapWy6WUQ8Rk2gv4OzmdAcOtzk/45Od0SxkNqg=;
  b=KwE0HvDllGz9VvFk7z7Y8NivPA0tXcSkic7fFLFnqYpQt5tVVfnRBGaT
   qA8qGox9lNbNC9zFpEppBx3berDQ+oN8G06gOyjp7BW0PWpFJAC1JP9pp
   L40M9YX6/PuubAPNVAXRqVVpQ/K/c0RgRN0dyLIIDzTG4vNJqxII8ZKod
   ExwOIvllJatwFuR8b52Xfp5xY/Y8S54hgbNX4slTe/zSgIfZZNjJyL1w2
   S3WLawxLrgOPPO7zo6trCukQijuZPp08oZZn0qCfjE+rTLRcE4zO18SXB
   WH52MoEzDe9VazP7tkB43OrYkv76wiMu4Oc0GkkyjsLlM9UXBiayzfDyz
   w==;
X-CSE-ConnectionGUID: lmkqjKtKQZ6TPSefSFBIHg==
X-CSE-MsgGUID: c1qgWeZ4QbyJlFO5uvpyzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="70991279"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="70991279"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 15:06:15 -0700
X-CSE-ConnectionGUID: 6BeKD0hbRQWGczGvitcpdQ==
X-CSE-MsgGUID: WNGF1vulSpmKxcX1yrquNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="157977228"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 30 Jun 2025 15:06:14 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWMdf-000ZPq-26;
	Mon, 30 Jun 2025 22:06:11 +0000
Date: Tue, 1 Jul 2025 06:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tty:tty-testing 47/49]
 arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: serial@1100c000
 (mediatek,mt7623-btif): clock-names: ['main'] is too short
Message-ID: <202507010531.sBO8LHPp-lkp@intel.com>
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
CC: linux-serial@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
head:   acc902de05b2b8229dc27820925b7573b6d2d34e
commit: d2db0d78154442fb89165edf8836bf2644c6c58d [47/49] dt-bindings: serial: 8250: allow clock 'uartclk' and 'reg' for nxp,lpc1850-uart
:::::: branch date: 33 hours ago
:::::: commit date: 34 hours ago
config: arm-randconfig-052-20250629 (https://download.01.org/0day-ci/archive/20250701/202507010531.sBO8LHPp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010531.sBO8LHPp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507010531.sBO8LHPp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7623-spi', 'mediatek,mt2701-spi']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: thermal@1100b000 (mediatek,mt7623-thermal): compatible:0: 'mediatek,mt7623-thermal' is not one of ['mediatek,mt2701-thermal', 'mediatek,mt2712-thermal', 'mediatek,mt7622-thermal', 'mediatek,mt7981-thermal', 'mediatek,mt7986-thermal', 'mediatek,mt8173-thermal', 'mediatek,mt8183-thermal', 'mediatek,mt8365-thermal', 'mediatek,mt8516-thermal']
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: thermal@1100b000 (mediatek,mt7623-thermal): compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal'] is too long
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: thermal@1100b000 (mediatek,mt7623-thermal): Unevaluated properties are not allowed ('compatible', 'reset-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: /thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names:0: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names: ['main'] is too short
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names: 'oneOf' conditional failed, one must be fixed:
   	['main'] is too short
   	'core' was expected
   	'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: nfi@1100d000 (mediatek,mt7623-nfc): $nodename:0: 'nfi@1100d000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible:0: 'mediatek,mt7623-nfc' is not one of ['mediatek,mt2701-nfc', 'mediatek,mt2712-nfc', 'mediatek,mt7622-nfc']
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-emmc.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible: ['mediatek,mt7623-nfc', 'mediatek,mt2701-nfc'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
--
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7623-spi', 'mediatek,mt2701-spi']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: thermal@1100b000 (mediatek,mt7623-thermal): compatible:0: 'mediatek,mt7623-thermal' is not one of ['mediatek,mt2701-thermal', 'mediatek,mt2712-thermal', 'mediatek,mt7622-thermal', 'mediatek,mt7981-thermal', 'mediatek,mt7986-thermal', 'mediatek,mt8173-thermal', 'mediatek,mt8183-thermal', 'mediatek,mt8365-thermal', 'mediatek,mt8516-thermal']
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: thermal@1100b000 (mediatek,mt7623-thermal): compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal'] is too long
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: thermal@1100b000 (mediatek,mt7623-thermal): Unevaluated properties are not allowed ('compatible', 'reset-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: /thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal']
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names:0: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names: ['main'] is too short
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names: 'oneOf' conditional failed, one must be fixed:
   	['main'] is too short
   	'core' was expected
   	'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: nfi@1100d000 (mediatek,mt7623-nfc): $nodename:0: 'nfi@1100d000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: nfi@1100d000 (mediatek,mt7623-nfc): nand@0: Unevaluated properties are not allowed ('spare_per_sector' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
   arch/arm/boot/dts/mediatek/mt7623a-rfb-nand.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible:0: 'mediatek,mt7623-nfc' is not one of ['mediatek,mt2701-nfc', 'mediatek,mt2712-nfc', 'mediatek,mt7622-nfc']
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
--
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7623-spi', 'mediatek,mt2701-spi']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: thermal@1100b000 (mediatek,mt7623-thermal): compatible:0: 'mediatek,mt7623-thermal' is not one of ['mediatek,mt2701-thermal', 'mediatek,mt2712-thermal', 'mediatek,mt7622-thermal', 'mediatek,mt7981-thermal', 'mediatek,mt7986-thermal', 'mediatek,mt8173-thermal', 'mediatek,mt8183-thermal', 'mediatek,mt8365-thermal', 'mediatek,mt8516-thermal']
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: thermal@1100b000 (mediatek,mt7623-thermal): compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal'] is too long
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: thermal@1100b000 (mediatek,mt7623-thermal): Unevaluated properties are not allowed ('compatible', 'reset-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: /thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal']
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names:0: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names: ['main'] is too short
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names: 'oneOf' conditional failed, one must be fixed:
   	['main'] is too short
   	'core' was expected
   	'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: nfi@1100d000 (mediatek,mt7623-nfc): $nodename:0: 'nfi@1100d000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible:0: 'mediatek,mt7623-nfc' is not one of ['mediatek,mt2701-nfc', 'mediatek,mt2712-nfc', 'mediatek,mt7622-nfc']
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-rfb-emmc.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible: ['mediatek,mt7623-nfc', 'mediatek,mt2701-nfc'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
--
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /spi@1100a000: failed to match any schema with compatible: ['mediatek,mt7623-spi', 'mediatek,mt2701-spi']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: thermal@1100b000 (mediatek,mt7623-thermal): compatible:0: 'mediatek,mt7623-thermal' is not one of ['mediatek,mt2701-thermal', 'mediatek,mt2712-thermal', 'mediatek,mt7622-thermal', 'mediatek,mt7981-thermal', 'mediatek,mt7986-thermal', 'mediatek,mt8173-thermal', 'mediatek,mt8183-thermal', 'mediatek,mt8365-thermal', 'mediatek,mt8516-thermal']
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: thermal@1100b000 (mediatek,mt7623-thermal): compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal'] is too long
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: thermal@1100b000 (mediatek,mt7623-thermal): Unevaluated properties are not allowed ('compatible', 'reset-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/thermal/mediatek,thermal.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: /thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt7623-thermal', 'mediatek,mt2701-thermal']
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names:0: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names: ['main'] is too short
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: serial@1100c000 (mediatek,mt7623-btif): clock-names: 'oneOf' conditional failed, one must be fixed:
   	['main'] is too short
   	'core' was expected
   	'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: nfi@1100d000 (mediatek,mt7623-nfc): $nodename:0: 'nfi@1100d000' does not match '^nand-controller(@.*)?'
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible:0: 'mediatek,mt7623-nfc' is not one of ['mediatek,mt2701-nfc', 'mediatek,mt2712-nfc', 'mediatek,mt7622-nfc']
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#
   arch/arm/boot/dts/mediatek/mt7623n-bananapi-bpi-r2.dtb: nfi@1100d000 (mediatek,mt7623-nfc): compatible: ['mediatek,mt7623-nfc', 'mediatek,mt2701-nfc'] is too long
   	from schema $id: http://devicetree.org/schemas/mtd/mediatek,mtk-nfc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
