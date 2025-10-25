Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB80A2629C
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 14:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761402574; cv=none; b=idLFVvGyLtaYKzpALs6NJtsNqOfOHoM8MRQ6OyU9FccluGSRPBwU8nyUlnxABVJFxf0+djmt9lmnNcHmrXrI890ncz82Hp00yqCts4H1C+PTocke178szKprTseTKaaZgqLjDpoq/66t2kOMNfBxDI6pTPrlTzeeQWFlIiYItpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761402574; c=relaxed/simple;
	bh=w9RZ4yGZ0AgK+6+XvR9+qjeoA0mUHzJidR25UvXQxKw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j4piWyEGS/IbsA+gdZa8DQ9BjorYZDdcJkLqwECCy97OOiBeXBNzSbvsbw41AJQ3dInypzPycjtgTjqIqXRHZHc/zDR/BP6jXeAIXR+GcEk3fcfVF8n4IKNOJhbpasYedMQahn7Td93GR6VXErpgVrIaQVthUWGRlBOUiwUwAQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUY6pGb3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUY6pGb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761402572; x=1792938572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w9RZ4yGZ0AgK+6+XvR9+qjeoA0mUHzJidR25UvXQxKw=;
  b=DUY6pGb3q7qFR83NMKDej9N42N13kC+UFOWq2nrmCHRjPOMPNnl2UJCf
   M5qXMPBQaqqaiDSoMADBwLZCycnB6OnnDm1tfbcyIoai6AcHvfYsfrgKO
   pO5iczWKBarg6b3zxvGWTG3JeKUQLUMcjhJSDXtro/w8bK8slYLI7DRWR
   KPc2d1+ROERvh8a6taQmAy+886g5QSMNyMgYIptkyxLewg3peQ9yfa4TF
   b1AHnoyFweG+HmHO8Up+UXyo58Kosd2uW6po1pB6NV9Zt//LZY1kGQZFA
   MgaouzAqNBipvvlbptXZgAPgV7PS1LpCQ13ch579CStPvw196tZRyI7wa
   w==;
X-CSE-ConnectionGUID: j1zEwXRNRBumIyQk+g5qfw==
X-CSE-MsgGUID: 6xwtJ/jQQty4PGj4QYeX4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63256383"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="63256383"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 07:29:31 -0700
X-CSE-ConnectionGUID: GsR5h4/xShGPqTEhdKyamg==
X-CSE-MsgGUID: LcyrQlSaQHyVb2V/fkpVeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="185417637"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 25 Oct 2025 07:29:30 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vCfGq-0000000009d-0qx6;
	Sat, 25 Oct 2025 14:29:28 +0000
Date: Sat, 25 Oct 2025 16:29:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [omap-audio:peter/linux-next-wip 8/39]
 arch/xtensa/boot/dts/kc705.dtb: /sound: failed to match any schema with
 compatible: ['simple-audio-card']
Message-ID: <202510251640.rxYCQ9LY-lkp@intel.com>
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
TO: Peter Ujfalusi <peter.ujfalusi@ti.com>

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   afaa11afb19194ab185bd6dc6674bb42af42e59f
commit: a00547a3d28f0c0c83cae73c54f82a569898abd2 [8/39] ASoC: simple-card: Support for selecting system clocks by ID
:::::: branch date: 19 hours ago
:::::: commit date: 20 hours ago
config: xtensa-randconfig-2052-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251640.rxYCQ9LY-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251640.rxYCQ9LY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510251640.rxYCQ9LY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/kc705.dtb: /soc/ethoc@0d030000: failed to match any schema with compatible: ['opencores,ethoc']
   arch/xtensa/boot/dts/kc705.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
   arch/xtensa/boot/dts/kc705.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705.dtb: /soc/i2c-master@0d090000/clock-synth@69: failed to match any schema with compatible: ['ti,cdce706']
   arch/xtensa/boot/dts/kc705.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/kc705.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
>> arch/xtensa/boot/dts/kc705.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: /soc/ethoc@0d030000: failed to match any schema with compatible: ['opencores,ethoc']
   arch/xtensa/boot/dts/kc705_nommu.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
   arch/xtensa/boot/dts/kc705_nommu.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: /soc/i2c-master@0d090000/clock-synth@69: failed to match any schema with compatible: ['ti,cdce706']
   arch/xtensa/boot/dts/kc705_nommu.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/kc705_nommu.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
>> arch/xtensa/boot/dts/kc705_nommu.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: /soc/ethoc@0d030000: failed to match any schema with compatible: ['opencores,ethoc']
   arch/xtensa/boot/dts/lx200mx.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
   arch/xtensa/boot/dts/lx200mx.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: /soc/i2c-master@0d090000/clock-synth@69: failed to match any schema with compatible: ['ti,cdce706']
   arch/xtensa/boot/dts/lx200mx.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/lx200mx.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
>> arch/xtensa/boot/dts/lx200mx.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/lx60.dtb: /soc/ethoc@0d030000: failed to match any schema with compatible: ['opencores,ethoc']
   arch/xtensa/boot/dts/lx60.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
   arch/xtensa/boot/dts/lx60.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx60.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx60.dtb: /soc/i2c-master@0d090000/clock-synth@69: failed to match any schema with compatible: ['ti,cdce706']
   arch/xtensa/boot/dts/lx60.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/lx60.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
>> arch/xtensa/boot/dts/lx60.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']
--
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/ml605.dtb: /soc/ethoc@0d030000: failed to match any schema with compatible: ['opencores,ethoc']
   arch/xtensa/boot/dts/ml605.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
   arch/xtensa/boot/dts/ml605.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/ml605.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/ml605.dtb: /soc/i2c-master@0d090000/clock-synth@69: failed to match any schema with compatible: ['ti,cdce706']
   arch/xtensa/boot/dts/ml605.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/ml605.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
>> arch/xtensa/boot/dts/ml605.dtb: /sound: failed to match any schema with compatible: ['simple-audio-card']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
