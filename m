Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C1F12B82
	for <oe-kbuild@lists.linux.dev>; Sat, 13 Jul 2024 02:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720838585; cv=none; b=AUXkfZyKeMdWGCVDfvUHCcbJhmIh5+QNM7TLriRmOWWvU5g0UJBpAg9vzqin2McYCnn3V9NbQYz0CTv7HwB4vW9kKXO7GSNVNpHp7HTMifs51TCWziSwa3pYSc4KMRAdAEAwwVKqyuH5huZADDD+VQ7MUugrvVHEn3OB0TNYiHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720838585; c=relaxed/simple;
	bh=5Dv2cvxwSGBbTgaMKrl7ZCeAVprfW5anH8HT1pnhOKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KVdXVtbeCBcqVdUtx5qY3IxR4Nr2nmqgeiqKEa0S1gNAwu1h/njDZQlr+oWwWcp/C8pPX0Enq+An+CRIPksA64a9t0aofLL8KxlZI7TzEkCDuIY9l0SA0Ed5D+42mJfrAEvoJp1YcXJYSBpFr6gTUQbGQ8PcUYqf7LQVOPJkArU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7nRlh5O; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7nRlh5O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720838581; x=1752374581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Dv2cvxwSGBbTgaMKrl7ZCeAVprfW5anH8HT1pnhOKU=;
  b=U7nRlh5Or/WAulYxW7al7keh36ICnkaX0GU9GW6nufNvsHvlXFBYKyqO
   apPdyg+QiZ92DcAueVbwJTfU7/BaABa+czMqUwo819qD2CNMGc5dmJvr5
   HM/JXSswskWF2xdjknZnPlh4XHT5yI8J5RmAB54PJF5SQZzVxj1FNKO7L
   LP1X9rgSECusrLW5a5zsbBo33ppAKURfhkcqlRf4K3gPhV256KtKeMpeI
   +XkciKqd3mIDade6kDfwDeredh443OtL8TAhkFE8Q4oAy8JSLGAVyFfDu
   65jteBfCXdGc/EF3Q2+wEEeAXpJsQrFEtVFSkaqxhMqCrhJHFmDu9wHcx
   Q==;
X-CSE-ConnectionGUID: FH/PpJP1RBuZdHYVW4f7iA==
X-CSE-MsgGUID: hbgbh2OHSp6InVQS9HPlog==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="28889377"
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="28889377"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 19:43:00 -0700
X-CSE-ConnectionGUID: 2ORGGNjdR86X3NRnHyJFQA==
X-CSE-MsgGUID: 3qidpduhQw+BlAcd2gXNGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,204,1716274800"; 
   d="scan'208";a="49850805"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Jul 2024 19:42:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSSiu-000ba0-2V;
	Sat, 13 Jul 2024 02:42:56 +0000
Date: Sat, 13 Jul 2024 10:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [usb:usb-testing 9/22] arch/powerpc/boot/dts/asp834x-redboot.dtb:
 usb@22000: Unevaluated properties are not allowed ('#address-cells',
 '#size-cells' were unexpected)
Message-ID: <202407131040.wDV0QM0c-lkp@intel.com>
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
CC: linux-usb@vger.kernel.org
TO: Frank Li <Frank.Li@nxp.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
head:   b727493011123db329e2901e3abf81a8d146b6fe
commit: 89b5a5a60771c60642d34019b3885d1d20934db8 [9/22] dt-bindings: usb: Convert fsl-usb to yaml
:::::: branch date: 18 hours ago
:::::: commit date: 10 days ago
config: powerpc-randconfig-051-20240712 (https://download.01.org/0day-ci/archive/20240713/202407131040.wDV0QM0c-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131040.wDV0QM0c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407131040.wDV0QM0c-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8347-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8347-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8347-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8347-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8347-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8347-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8347-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8347-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8347-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8347-dma-channel', 'fsl,elo-dma-channel']
>> arch/powerpc/boot/dts/asp834x-redboot.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/asp834x-redboot.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: /soc8349@ff000000/ethernet@25000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/asp834x-redboot.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
--
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: fram@50: Unevaluated properties are not allowed ('$nodename' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: i2c@3100: Unevaluated properties are not allowed ('compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/mpc8308_p1m.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: /immr@e0000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: /immr@e0000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: /immr@e0000000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: /immr@e0000000/ethernet@25000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/mpc8308_p1m.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   arch/powerpc/boot/dts/mpc8308rdb.dtb: immr@e0000000: $nodename:0: 'immr@e0000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /immr@e0000000: failed to match any schema with compatible: ['fsl,mpc8308-immr', 'simple-bus']
   arch/powerpc/boot/dts/mpc8308rdb.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/mpc8308rdb.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /immr@e0000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /immr@e0000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /immr@e0000000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8308rdb.dtb: /immr@e0000000/ethernet@25000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/mpc8308rdb.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/sleep-nexus/crypto@30000: failed to match any schema with compatible: ['fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/sleep-nexus/crypto@30000: failed to match any schema with compatible: ['fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/spi@7000: failed to match any schema with compatible: ['fsl,spi']
>> arch/powerpc/boot/dts/mpc8313erdb.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/ptp_clock@24E00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: /soc8313@e0000000/ethernet@25000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/mpc8313erdb.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
--
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8315-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8315-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8315-dma-channel', 'fsl,elo-dma-channel']
>> arch/powerpc/boot/dts/mpc8315erdb.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: /immr@e0000000/ethernet@25000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/mpc8315erdb.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8349-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8349-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
>> arch/powerpc/boot/dts/mpc8349emitx.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8349emitx.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: /soc8349@e0000000/ethernet@25000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/mpc8349emitx.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
--
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /soc8349@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8349-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /soc8349@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8349-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /soc8349@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /soc8349@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /soc8349@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /soc8349@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /soc8349@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /soc8349@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /soc8349@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /soc8349@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8349-dma-channel', 'fsl,elo-dma-channel']
>> arch/powerpc/boot/dts/mpc8349emitxgp.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /soc8349@e0000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: /soc8349@e0000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/mpc8349emitxgp.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
   	'ns16550' was expected
   	'ns16550a' was expected
--
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8377-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8377-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
>> arch/powerpc/boot/dts/mpc8377_rdb.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: /immr@e0000000/ethernet@25000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/mpc8377_rdb.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8377-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8377-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8377-dma-channel', 'fsl,elo-dma-channel']
>> arch/powerpc/boot/dts/mpc8377_wlan.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: /immr@e0000000/ethernet@25000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/mpc8377_wlan.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8378-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8378-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8378-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8378-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8378-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8378-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8378-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8378-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8378-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8378-dma-channel', 'fsl,elo-dma-channel']
>> arch/powerpc/boot/dts/mpc8378_rdb.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: /immr@e0000000/ethernet@25000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/mpc8378_rdb.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8379-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/dma@82a8: failed to match any schema with compatible: ['fsl,mpc8379-dma', 'fsl,elo-dma']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8379-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@0: failed to match any schema with compatible: ['fsl,mpc8379-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8379-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@80: failed to match any schema with compatible: ['fsl,mpc8379-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8379-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@100: failed to match any schema with compatible: ['fsl,mpc8379-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8379-dma-channel', 'fsl,elo-dma-channel']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/dma@82a8/dma-channel@180: failed to match any schema with compatible: ['fsl,mpc8379-dma-channel', 'fsl,elo-dma-channel']
>> arch/powerpc/boot/dts/mpc8379_rdb.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'sleep' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/ethernet@24000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: /immr@e0000000/ethernet@25000/mdio@520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/mpc8379_rdb.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: gpio-controller@18: 'label', 'polarity' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-pca95xx.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: temperature-sensor@4c: interrupts: [[12, 8], [13, 8]] is too long
   	from schema $id: http://devicetree.org/schemas/hwmon/national,lm90.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/i2c@3000/clock-generator@69: failed to match any schema with compatible: ['idt,6v49205b']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/gpio-controller@fc00: failed to match any schema with compatible: ['fsl,pq3-gpio']
>> arch/powerpc/boot/dts/turris1x.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/turris1x.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/turris1x.dtb: switch@10: Unevaluated properties are not allowed ('interrupts' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/qca8k.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/ptp_clock@24e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/turris1x.dtb: /soc@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
--
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/spi@110000/flash@0: failed to match any schema with compatible: ['sst,sst25wf040', 'jedec,spi-nor']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,esdhc']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: i2c@118000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: i2c@118000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v2.4', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v2.4' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v2.4' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/b4420qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.4', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4420qds.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/spi@110000/flash@0: failed to match any schema with compatible: ['sst,sst25wf040', 'jedec,spi-nor']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/sdhc@114000: failed to match any schema with compatible: ['fsl,esdhc']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: i2c@118000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: i2c@118000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v2.4', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v2.4' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v2.4' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/b4860qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-dr-v2.4', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e0000: Unevaluated properties are not allowed ('phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
   	from schema $id: http://devicetree.org/schemas/net/fsl,fman-dtsec.yaml#
   arch/powerpc/boot/dts/fsl/b4860qds.dtb: ethernet@e0000: 'pcs-handle' is a dependency of 'pcs-handle-names'
--
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000: failed to match any schema with compatible: ['fsl,bsc9131-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr', 'fsl-usb2-dr-v2.2'] is too long
   	'fsl-usb2-dr' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/sdhc@2e000: failed to match any schema with compatible: ['fsl,esdhc']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ptp_clock@b0e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ecm@1000: failed to match any schema with compatible: ['fsl,bsc9131-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ecm@1000: failed to match any schema with compatible: ['fsl,bsc9131-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/memory-controller@2000: failed to match any schema with compatible: ['fsl,bsc9131-memory-controller']
--
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/i2c@3000/fpga@66: failed to match any schema with compatible: ['fsl,bsc9132qds-fpga', 'fsl,fpga-qixis-i2c']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/i2c@3000/fpga@66: failed to match any schema with compatible: ['fsl,bsc9132qds-fpga', 'fsl,fpga-qixis-i2c']
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr', 'fsl-usb2-dr-v2.2'] is too long
   	'fsl-usb2-dr' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ptp_clock@b0e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ecm@1000: failed to match any schema with compatible: ['fsl,bsc9132-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ecm@1000: failed to match any schema with compatible: ['fsl,bsc9132-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
--
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: usb@211000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/cyrus_p5020.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
--
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nand@6,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /localbus@fef05000/nand@7,0: failed to match any schema with compatible: ['fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000: failed to match any schema with compatible: ['fsl,p2020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: ethernet-phy@0: interrupts: [[12], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: ethernet-phy@1: interrupts: [[11], [4]] is too long
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/ge_imp3a.dtb: /soc@fef00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
--
   	'fsl,ns16550' is not one of ['exar,xr16l2552', 'exar,xr16l2551', 'exar,xr16l2550']
   	'fsl,ns16550' is not one of ['ns16750', 'cavium,octeon-3860-uart', 'xlnx,xps-uart16550-2.00.b', 'ralink,rt2880-uart']
   	'fsl,ns16550' is not one of ['nuvoton,npcm845-uart']
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/powerpc/boot/dts/fsl/kmcent2.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/kmcent2.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
--
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: i2c@119000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: i2c@119100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/kmcoge4.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/kmcoge4.dtb: usb@211000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
--
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/sata@19000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8536-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/ptp_clock@24e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.2' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.2' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.2' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.2' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: usb@2b000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl,mpc8536-usb2-dr' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl,mpc8536-usb2-dr' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: usb@2b000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/usb@2b000: failed to match any schema with compatible: ['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,mpc8536-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,mpc8536-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
--
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/sata@19000: failed to match any schema with compatible: ['fsl,mpc8536-sata', 'fsl,pq-sata']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,mpc8536-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/ptp_clock@24e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.2' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.2' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.2' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.2' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.2', 'fsl,mpc8536-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: usb@2b000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl,mpc8536-usb2-dr' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl,mpc8536-usb2-dr' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: usb@2b000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/usb@2b000: failed to match any schema with compatible: ['fsl,mpc8536-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,mpc8536-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,mpc8536-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
