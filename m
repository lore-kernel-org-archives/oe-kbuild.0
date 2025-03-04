Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7F61FBEB3
	for <oe-kbuild@lists.linux.dev>; Tue,  4 Mar 2025 09:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741081223; cv=none; b=hnXDXbb9NCk8P4ntZdmmQCxEytoPFD/ZcmfbRPo2Esse+ymLvqlLtQUUGz2n3OqgM6d9Pxoq31TkIU0+OTa5dXYHqncuKz6GrrAIlvAGlhuCnCx4sOssWzk3JfWUv7PyvIHSLXTX/sKvCi/fJX8kdC32RwVruKUFgp8WkWS7sDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741081223; c=relaxed/simple;
	bh=ei9vNlBNdigVS4B6qe2Rt0K7ks2nvPeOPHpTx21f5bk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gCxux4pmYuNhZKIfJEpfc221cc+hwfd5olVB19Ph+vD1HPsa88NzVOghqwq6Zz55HH08DRlhnUOskF0KIvlFPyfYKd2nPB1x+cNIhe773bshYTCXeS+vLz1W7GCLtrB9Qm3CAwKdfCiSoWxGcDiGI8B99l0dcFHr6cDFO7Dtbbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OeQ/7H2o; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OeQ/7H2o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741081218; x=1772617218;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ei9vNlBNdigVS4B6qe2Rt0K7ks2nvPeOPHpTx21f5bk=;
  b=OeQ/7H2oFh32Ps5TP2UMVKWyQ/Aehs5KvgYl7Vt3lU+Ga7pqL9q1Ccx9
   DDR80zx37M+M9h71CvdvoX1wtc9BsIhaFS5V0rH565VX4GXNFrFEHX3hI
   NqyWK0sMyq50zeQqCdr/D+nE4jQDbe9WouYGcF0y/YzLmtMFpZ/XkOo7D
   XZe9iQbpVWrTBUlu2q1f1dGPtXmY1u/6YumhwmHYvkUDEAw4Rc/L+f1BR
   Xk7RLbEqRJYyD3/FbHmn0GWJjQpo53wGQ1oZ2V8R3xo/DK0utiLHT9KVf
   bCh+X+udpuq5M5QkyaEZvaELrirMUr4hXtRBZQgzq/DBmY1JUB9vHxaQc
   g==;
X-CSE-ConnectionGUID: 1Q+nQTyKQLCE2/0mnB33Uw==
X-CSE-MsgGUID: Lo6hfnMwQJqEdPzoDNoUAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="52972073"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="52972073"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 01:40:17 -0800
X-CSE-ConnectionGUID: iXc4Hn+CRcOm8Fa/TchPjw==
X-CSE-MsgGUID: cOL6HQTqTUGJtAB/zjHIsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="149254079"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Mar 2025 01:40:15 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpOl2-000JYg-2e;
	Tue, 04 Mar 2025 09:40:12 +0000
Date: Tue, 4 Mar 2025 17:39:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] dt-bindings: net: Convert fsl,gianfar to YAML
Message-ID: <202503041718.huZAp3lD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250228-gianfar-yaml-v2-3-6beeefbd4818@posteo.net>
References: <20250228-gianfar-yaml-v2-3-6beeefbd4818@posteo.net>
TO: "J. Neuschäfer via B4 Relay" <devnull+j.ne.posteo.net@kernel.org>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Claudiu Manoil <claudiu.manoil@nxp.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "J. Neuschäfer" <j.ne@posteo.net>

Hi Neuschäfer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/J-Neusch-fer-via-B4-Relay/dt-bindings-net-Convert-fsl-gianfar-mdio-tbi-to-YAML/20250301-013611
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250228-gianfar-yaml-v2-3-6beeefbd4818%40posteo.net
patch subject: [PATCH v2 3/3] dt-bindings: net: Convert fsl,gianfar to YAML
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc-randconfig-052-20250302 (https://download.01.org/0day-ci/archive/20250304/202503041718.huZAp3lD-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503041718.huZAp3lD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503041718.huZAp3lD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: sdhc@2e000: compatible:0: 'fsl,esdhc' is not one of ['fsl,mpc8536-esdhc', 'fsl,mpc8378-esdhc', 'fsl,p2020-esdhc', 'fsl,p4080-esdhc', 'fsl,t1040-esdhc', 'fsl,t4240-esdhc', 'fsl,ls1012a-esdhc', 'fsl,ls1028a-esdhc', 'fsl,ls1088a-esdhc', 'fsl,ls1043a-esdhc', 'fsl,ls1046a-esdhc', 'fsl,ls2080a-esdhc']
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: sdhc@2e000: compatible: ['fsl,esdhc'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: sdhc@2e000: $nodename:0: 'sdhc@2e000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/fsl,esdhc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: ethernet@b0000: Unevaluated properties are not allowed ('queue-group@b0000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: ethernet@b1000: Unevaluated properties are not allowed ('queue-group@b1000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ecm@1000: failed to match any schema with compatible: ['fsl,bsc9131-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/ecm@1000: failed to match any schema with compatible: ['fsl,bsc9131-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: /soc@ff700000/memory-controller@2000: failed to match any schema with compatible: ['fsl,bsc9131-memory-controller']
   arch/powerpc/boot/dts/fsl/bsc9131rdb.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr', 'fsl-usb2-dr-v2.2'] is too long
   	'fsl-usb2-dr' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	'fsl-usb2-dr' was expected
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: ethernet@b0000: Unevaluated properties are not allowed ('queue-group@b0000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: ethernet@b1000: Unevaluated properties are not allowed ('queue-group@b1000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ecm@1000: failed to match any schema with compatible: ['fsl,bsc9132-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: /soc@ff700000/ecm@1000: failed to match any schema with compatible: ['fsl,bsc9132-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/bsc9132qds.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /memory-controller@fffe1e000/cpld@2,0: failed to match any schema with compatible: ['fsl,c293pcie-cpld']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: ethernet@b0000: Unevaluated properties are not allowed ('queue-group@b0000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/c293pcie.dtb: ethernet@b1000: Unevaluated properties are not allowed ('queue-group@b1000' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,c293-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,c293-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: /soc@fffe00000/memory-controller@2000: failed to match any schema with compatible: ['fsl,c293-memory-controller']
   arch/powerpc/boot/dts/fsl/c293pcie.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: /soc@ffe00000/memory-controller@2000: failed to match any schema with compatible: ['fsl,p1010-memory-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: /soc@fffe00000/memory-controller@2000: failed to match any schema with compatible: ['fsl,p1010-memory-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pa_36b.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: /soc@ffe00000/memory-controller@2000: failed to match any schema with compatible: ['fsl,p1010-memory-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1010-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: /soc@fffe00000/memory-controller@2000: failed to match any schema with compatible: ['fsl,p1010-memory-controller']
   arch/powerpc/boot/dts/fsl/p1010rdb-pb_36b.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,ns16550', 'ns16550'] is too long
   	['fsl,ns16550', 'ns16550'] is too short
   	'ns8250' was expected
   	'ns16450' was expected
--
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /localbus@ffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /localbus@fffe05000/L2switch@2,0: failed to match any schema with compatible: ['vitesse-7385']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_32b.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_36b.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core0.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pc_camp_core1.dtb: serial@4500: compatible: 'oneOf' conditional failed, one must be fixed:
--
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/spi@7000: failed to match any schema with compatible: ['fsl,mpc8536-espi']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/spi@7000/slic@0: failed to match any schema with compatible: ['zarlink,le88266']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/spi@7000/slic@1: failed to match any schema with compatible: ['zarlink,le88266']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020rdb-pd.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
--
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
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
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
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020rdb_36b.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000: failed to match any schema with compatible: ['fsl,p1020-immr', 'simple-bus']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
--
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021mds.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021mds.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1022-guts']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: /soc@ffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_32b.dtb: pcie@ffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/crypto@30000: failed to match any schema with compatible: ['fsl,sec3.3', 'fsl,sec3.1', 'fsl,sec3.0', 'fsl,sec2.4', 'fsl,sec2.2', 'fsl,sec2.1', 'fsl,sec2.0']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/pic@40000: failed to match any schema with compatible: ['fsl,mpic']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@41100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/message@41400: failed to match any schema with compatible: ['fsl,mpic-v3.1-msgr']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/msi@41600: failed to match any schema with compatible: ['fsl,mpic-msi']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/timer@42100: failed to match any schema with compatible: ['fsl,mpic-global-timer']
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/global-utilities@e0000: failed to match any schema with compatible: ['fsl,p1022-guts']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: /soc@fffe00000/power@e0070: failed to match any schema with compatible: ['fsl,p1022-pmc', 'fsl,mpc8536-pmc', 'fsl,mpc8548-pmc']
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0:0: 16 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/fsl/p1022ds_36b.dtb: pcie@fffe09000: pcie@0:interrupts:0: [16, 2, 0, 0] is too long
--
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
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1022rdk.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1022-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1022-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: /soc@ffe00000/memory-controller@2000: failed to match any schema with compatible: ['fsl,p1022-memory-controller']
   arch/powerpc/boot/dts/fsl/p1022rdk.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_32b.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: usb@23000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/usb@23000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1020-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1024rdb_36b.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_32b.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: flash@0: 'partition@dtb', 'partition@fs', 'partition@jffs-fs', 'partition@kernel', 'partition@u-boot' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b1000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b1000', 'queue-group@b5000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: /soc@fffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: i2c@3100: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1025rdb_36b.dtb: i2c@3100: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)
--
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: usb@22000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-usb2-dr-v1.6', 'fsl-usb2-dr'] is too long
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-mph', 'fsl-usb2-dr']
   	'fsl-usb2-dr-v1.6' is not one of ['fsl-usb2-dr-v2.2', 'fsl-usb2-dr-v2.5']
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: usb@22000: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/fsl,usb2.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/usb@22000: failed to match any schema with compatible: ['fsl-usb2-dr-v1.6', 'fsl-usb2-dr']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: ptp_clock@b0e00: interrupts: [[68, 2, 0, 0], [69, 2, 0, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/ptp/fsl,ptp.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b0000: queue-group@b0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b0000: queue-group@b4000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b0000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b0000', 'queue-group@b4000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b1000: queue-group@b1000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b1000: queue-group@b5000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b2000: queue-group@b2000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b2000: queue-group@b6000: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
>> arch/powerpc/boot/dts/fsl/p1025twr.dtb: ethernet@b2000: Unevaluated properties are not allowed ('fsl,pmc-handle', 'queue-group@b2000', 'queue-group@b6000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/fsl,gianfar.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ecm-law@0: failed to match any schema with compatible: ['fsl,ecm-law']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: /soc@ffe00000/ecm@1000: failed to match any schema with compatible: ['fsl,p1021-ecm', 'fsl,ecm']
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: i2c@3000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl-i2c'] is too short
   	'fsl-i2c' is not one of ['mpc5200-i2c', 'fsl,mpc5200-i2c', 'fsl,mpc5121-i2c', 'fsl,mpc8313-i2c', 'fsl,mpc8543-i2c', 'fsl,mpc8544-i2c']
   	'fsl,mpc5200b-i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mpc.yaml#
   arch/powerpc/boot/dts/fsl/p1025twr.dtb: i2c@3000: Unevaluated properties are not allowed ('cell-index', 'compatible', 'dfsrr' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
