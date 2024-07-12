Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BB8DF49
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jul 2024 19:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720812921; cv=none; b=kiDbAv4QYJx2hRgSg30yRqYt1e7qzuWL7Xnj0Egz3tR2J3L5jkV6X8bZRw6MDuRatwvjaVCpJeWhdQJFj/F+I0TVHxjK8S7y1EIUGS2czM3pCm7IUM2y6m0qei4+/bBWgoHCbKmOYdq20Rw2o/FrMLDQgalwxU2FUVy3+zi3D2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720812921; c=relaxed/simple;
	bh=84NlRCjz9Ldjf9wu58AMOdoWC17HDO+yE+bo6U3Aqks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DK+vbsscdJ7DgFCgBjLO+g+6/96mWFp8kObSjHv0ASudfR3Q2aWmP4QRgGSLX979malMSgA1rjrMcAKPdZqw+ndRhZ5Q8mEvr1aG6MOtaecHp1+oUFJORrNHM1JoQLRq5SEbhH7OksehZZeABjbub60CXpHRyyRSO8yxqkioXcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7sctQj2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7sctQj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720812914; x=1752348914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=84NlRCjz9Ldjf9wu58AMOdoWC17HDO+yE+bo6U3Aqks=;
  b=D7sctQj25ibLSB8uE8zc9ezHgS1TIUGM/MY+i1N9OvTmi/Zok3AtIPoA
   wioMiaYJSsYXzkEhmcraAmpxpgJP8BsrhhKv1KljBpLwnpbdSaxZXm25X
   L4kOOyTVSoUmyAVxV+H++lhg+qU/EnFS/er81XpWcblhIAdjIfeAWxmKV
   /6QdUgD6jNVph9l89AAv60V18rDC+7iMKa5HEK7cxleEYO8hGHcaXI3O6
   BoOUxL5XuWm2EDu/VqPwGsFv22oiC0beMF3dXHf9yAiApUx9IGkZvvA0o
   FVvulGiEwjztFy0TaE+NKWldjY3bgLKQm7ZUFqtQQfYSDWxQ3soiN3FNp
   g==;
X-CSE-ConnectionGUID: BZdE6eBlTY+Ij5Ip8pT9lA==
X-CSE-MsgGUID: PF1zHWJLRpOyj7TvpF+q5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11131"; a="22031556"
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="22031556"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2024 12:34:46 -0700
X-CSE-ConnectionGUID: fDH471KIRiOcrKoeUOSbUA==
X-CSE-MsgGUID: MVI4D03USHqWXAJ8dRdJXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,203,1716274800"; 
   d="scan'208";a="48958258"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jul 2024 12:34:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sSM2T-000bBe-2r;
	Fri, 12 Jul 2024 19:34:41 +0000
Date: Sat, 13 Jul 2024 03:34:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [usb:usb-testing 9/22] arch/powerpc/boot/dts/fsl/mvme2500.dtb:
 usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202407130352.RFst7yUY-lkp@intel.com>
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
:::::: branch date: 11 hours ago
:::::: commit date: 9 days ago
config: powerpc-randconfig-051-20240712 (https://download.01.org/0day-ci/archive/20240713/202407130352.RFst7yUY-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407130352.RFst7yUY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407130352.RFst7yUY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /: failed to match any schema with compatible: ['artesyn,MVME2500']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p2020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/mvme2500.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: /soc@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/mvme2500.dtb: ethernet-phy@1: compatible: 'oneOf' conditional failed, one must be fixed:
   	['brcm,bcm54616S'] is too short
   	'ethernet-phy-ieee802.3-c22' was expected
   	'ethernet-phy-ieee802.3-c45' was expected
   	'brcm,bcm54616S' does not match '^ethernet-phy-id[a-f0-9]{4}\\.[a-f0-9]{4}$'
   	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#
--
   arch/powerpc/boot/dts/fsl/oca4080.dtb: i2c@119000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: i2c@119100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/oca4080.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/oca4080.dtb: usb@211000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: eeprom@50: compatible: ['st,24c256', 'atmel,24c256'] is too long
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ptp_clock@b0e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: eeprom@50: compatible: ['st,24c256', 'atmel,24c256'] is too long
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ptp_clock@b0e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: eeprom@50: compatible: ['st,24c256', 'atmel,24c256'] is too long
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ptp_clock@b0e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: eeprom@50: compatible: ['st,24c256', 'atmel,24c256'] is too long
   	from schema $id: http://devicetree.org/schemas/trivial-devices.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ptp_clock@b0e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: flash@0: Unevaluated properties are not allowed ('partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@23000: 'phy_type' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: flash@0: Unevaluated properties are not allowed ('partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@23000: 'phy_type' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: flash@0: Unevaluated properties are not allowed ('partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@23000: 'phy_type' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cpld']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: usb@23000: 'phy_type' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/spi@7000/slic@0: failed to match any schema with compatible: ['zarlink,le88266']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/spi@7000/slic@1: failed to match any schema with compatible: ['zarlink,le88266']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ptp_clock@b0e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: usb@23000: 'phy_type' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1020-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: flash@0: Unevaluated properties are not allowed ('partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: flash@0: Unevaluated properties are not allowed ('partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
--
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: flash@0: Unevaluated properties are not allowed ('partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: flash@0: Unevaluated properties are not allowed ('partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ptp_clock@b0e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: flash@0: Unevaluated properties are not allowed ('partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ptp_clock@b0e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
--
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/display@10000: failed to match any schema with compatible: ['fsl,diu', 'fsl,p1022-diu']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/display@10000: failed to match any schema with compatible: ['fsl,diu', 'fsl,p1022-diu']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/sata@18000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/sata@19000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p1022-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
--
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/display@10000: failed to match any schema with compatible: ['fsl,diu', 'fsl,p1022-diu']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/display@10000: failed to match any schema with compatible: ['fsl,diu', 'fsl,p1022-diu']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/sata@18000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/sata@19000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p1022-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p1022-esdhc', 'fsl,esdhc']
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: codec@1a: Unevaluated properties are not allowed ('clock-frequency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/wlf,wm8960.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/i2c@3100/zl6100@21: failed to match any schema with compatible: ['isil,zl6100']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/i2c@3100/zl6100@24: failed to match any schema with compatible: ['isil,zl6100']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/i2c@3100/zl6100@26: failed to match any schema with compatible: ['isil,zl6100']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/i2c@3100/zl6100@29: failed to match any schema with compatible: ['isil,zl6100']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: usb@23000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
--
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /bman-portals@ff200000/bman-portal@4000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /bman-portals@ff200000/bman-portal@8000: failed to match any schema with compatible: ['fsl,bman-portal']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000: failed to match any schema with compatible: ['fsl,p1023-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/p1023rdb.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1023rdb.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/ecm@1000: failed to match any schema with compatible: ['fsl,p1023-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/ecm@1000: failed to match any schema with compatible: ['fsl,p1023-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: /soc@ff600000/memory-controller@2000: failed to match any schema with compatible: ['fsl,p1023-memory-controller']
   arch/powerpc/boot/dts/fsl/p1023rdb.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
--
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
--
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /localbus@fffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p1020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: flash@0: Unevaluated properties are not allowed ('partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: flash@0: Unevaluated properties are not allowed ('partition@jffs-fs', 'partition@kernel', 'partition@u-boot' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
--
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: localbus@ffe05000: display@2,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: localbus@ffe05000: nor@0,0: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /localbus@ffe05000: failed to match any schema with compatible: ['fsl,p1021-elbc', 'fsl,elbc', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /localbus@ffe05000/display@2,0: failed to match any schema with compatible: ['solomon,ssd1289fb']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1021-immr', 'simple-bus']
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/mdio@24000: failed to match any schema with compatible: ['fsl,etsec2-mdio']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/mdio@25000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/mdio@26000: failed to match any schema with compatible: ['fsl,etsec2-tbi']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ptp_clock@b0e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ethernet@b0000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ethernet@b1000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ethernet@b2000: failed to match any schema with compatible: ['fsl,etsec2']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
--
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@c300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@c300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@c300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/gpio-controller@fc00: failed to match any schema with compatible: ['fsl,pq3-gpio']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/l2-cache-controller@20000: failed to match any schema with compatible: ['fsl,p2020-l2-cache-controller']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@21300: failed to match any schema with compatible: ['fsl,eloplus-dma']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@21300/dma-channel@0: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@21300/dma-channel@80: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@21300/dma-channel@100: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/dma@21300/dma-channel@180: failed to match any schema with compatible: ['fsl,eloplus-dma-channel']
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p2020ds.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/ptp_clock@24e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020ds.dtb: /soc@ffe00000/sdhc@2e000: failed to match any schema with compatible: ['fsl,p2020-esdhc', 'fsl,esdhc']
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cpld']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p2020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ptp_clock@24e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_32b.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
--
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /localbus@fffe05000/cpld@3,0: failed to match any schema with compatible: ['cpld']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p2020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ptp_clock@24e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb-pc_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
--
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p2020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p2020rdb.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/mdio@24520: failed to match any schema with compatible: ['fsl,gianfar-mdio']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/mdio@25520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/mdio@26520: failed to match any schema with compatible: ['fsl,gianfar-tbi']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ptp_clock@24e00: failed to match any schema with compatible: ['fsl,etsec-ptp']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ethernet@24000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ethernet@25000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ethernet@26000: failed to match any schema with compatible: ['gianfar']
   arch/powerpc/boot/dts/fsl/p2020rdb.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
--
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: i2c@118000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/i2c@118000/lm75b@48: failed to match any schema with compatible: ['nxp,lm75a']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: i2c@118100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: i2c@118100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: usb@211000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p2041rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/usb@211000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000: failed to match any schema with compatible: ['fsl,fman']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/mdio@e1120: failed to match any schema with compatible: ['fsl,fman-mdio']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/mdio@f1000: failed to match any schema with compatible: ['fsl,fman-xmdio']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/muram@0: failed to match any schema with compatible: ['fsl,fman-muram']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@81000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@82000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
   arch/powerpc/boot/dts/fsl/p2041rdb.dtb: /soc@ffe000000/fman@400000/port@83000: failed to match any schema with compatible: ['fsl,fman-v2-port-oh']
--
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.6', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p3041ds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: usb@211000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p3041ds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
--
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/i2c@118000/zl2006@22: failed to match any schema with compatible: ['zl2006']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/i2c@118000/zl2006@23: failed to match any schema with compatible: ['zl2006']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/i2c@118000/zl2006@24: failed to match any schema with compatible: ['zl2006']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: i2c@119100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: i2c@119100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p4080ds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: usb@211000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p4080ds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
--
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p5020ds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: usb@211000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p5020ds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
--
   	'fsl,ns16550' is not one of ['ralink,mt7620a-uart', 'ralink,rt3052-uart', 'ralink,rt3883-uart']
   	'fsl,ns16550' is not one of ['mediatek,mt7622-btif', 'mediatek,mt7623-btif']
   	'mrvl,mmp-uart' was expected
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/p5040ds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v1.6', 'fsl,mpc85xx-usb2-mph', 'fsl-usb2-mph']
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: usb@211000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl,mpc85xx-usb2-dr', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p5040ds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t1023rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t1023rdb.dtb: crypto@300000: rtic@6000:rtic-a@0:compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t1024qds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t1024qds.dtb: crypto@300000: rtic@6000:rtic-a@0:compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t1024rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t1024rdb.dtb: crypto@300000: rtic@6000:rtic-a@0:compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/display@180000: failed to match any schema with compatible: ['fsl,t1040-diu', 'fsl,diu']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t2080qds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: crypto@300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2', 'fsl,sec-v5.0', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v5.4' was expected
   	'fsl,sec-v5.2' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t2080qds.dtb: crypto@300000: jr@1000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v5.4-job-ring' was expected
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t2080rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: crypto@300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2', 'fsl,sec-v5.0', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v5.4' was expected
   	'fsl,sec-v5.2' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t2080rdb.dtb: crypto@300000: jr@1000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v5.4-job-ring' was expected
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t2081qds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fsl,iommu-parent', 'fsl,liodn-reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: crypto@300000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2', 'fsl,sec-v5.0', 'fsl,sec-v4.0'] is too long
   	'fsl,sec-v5.4' was expected
   	'fsl,sec-v5.2' is not one of ['fsl,imx6ul-caam', 'fsl,sec-v5.0']
   	'fsl,sec-v4.0' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
   arch/powerpc/boot/dts/fsl/t2081qds.dtb: crypto@300000: jr@1000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.2-job-ring', 'fsl,sec-v5.0-job-ring', 'fsl,sec-v4.0-job-ring'] is too long
   	'fsl,sec-v5.4-job-ring' was expected
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t4240qds.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t4240qds.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#
--
   	'fsl,ns16550' is not one of ['nvidia,tegra30-uart', 'nvidia,tegra114-uart', 'nvidia,tegra124-uart', 'nvidia,tegra210-uart', 'nvidia,tegra186-uart', 'nvidia,tegra194-uart', 'nvidia,tegra234-uart']
   	'ralink,rt2880-uart' was expected
   	'mediatek,mtk-btif' was expected
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: serial@11d600: Unevaluated properties are not allowed ('cell-index', 'compatible', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/gpio@130000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/gpio@131000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/gpio@132000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/gpio@133000: failed to match any schema with compatible: ['fsl,qoriq-gpio']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: usb@210000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-mph-v2.5', 'fsl-usb2-mph'] is too long
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-mph-v2.5' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: usb@210000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/usb@210000: failed to match any schema with compatible: ['fsl-usb2-mph-v2.5', 'fsl-usb2-mph']
>> arch/powerpc/boot/dts/fsl/t4240rdb.dtb: usb@211000: Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/sata@220000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: /soc@ffe000000/sata@221000: failed to match any schema with compatible: ['fsl,pq-sata-v2']
   arch/powerpc/boot/dts/fsl/t4240rdb.dtb: crypto@300000: rtic@6000:compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too short
   	['fsl,sec-v5.0-rtic', 'fsl,sec-v4.0-rtic'] is too long
   	'fsl,sec-v5.4-rtic' was expected
   	'fsl,sec-v4.0-rtic' was expected
   	'fsl,sec-v5.0-rtic' was expected
   	from schema $id: http://devicetree.org/schemas/crypto/fsl,sec-v4.0.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
