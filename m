Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322232F0C74
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 10:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761388011; cv=none; b=Fyi4pk9ScnvfOcb0vNgnkyirKpgv7dia212WhhAh4tqQeZh6lxV658QSFGhtbyQ00sZy0ZPYn79vPqok6ug1sJxfC+uEeWgeXSJg0GeTZ3KlL2GDQmLoWkwe80Gb7EC5zrM70p6l64/XH+m/s6P7NLfhLvuGBYJIT6At33M8qNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761388011; c=relaxed/simple;
	bh=qBq5miCw17PQ4hilgsm9iC7PVogpxUpMPP5PQ26x0QM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fR+frKTSEBgeCZyhTEf27A2IBmFd/sWYCgVQ49y+pyTRWkW6968NxH4u/3qFx8uTsSmssoRh2vowRiAlAMbdWlb2LeXEVeHBRJ7Xje8iQjeUkttcWXBaDPkBl6aJ+000V+aN380nkVE1U+MBh69PoPgXY357lEa1Au5f3w5OpPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEwMsOta; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEwMsOta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761388009; x=1792924009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qBq5miCw17PQ4hilgsm9iC7PVogpxUpMPP5PQ26x0QM=;
  b=SEwMsOtawO4WrMdSHtn1SkEpLv/D+xExrtojHm49GrPyMT0dJr1GIA4y
   C4+h24SeIcDFKn83hrcTt8C0rLngdjqwHIPzXPRR2rhghoG4HpLjv4kUH
   O4FP14X2aMNcFEqmhrqz2UnAZSvsY6K3vr1CnS3jXlHUERY1qDklYC/63
   5EEKVSxTr/bqHr7y8RSHJLvfoEIOEJJVtZZMjLOP6KSaw5yq3yTJ3JEvf
   S8g6PBWXiIK4haECej6jaBCkkSjFQ6hiC+LR9nJv0T0g1s/HBXAGsxqOr
   z3ThVpr7LAbv5P3oLu4zu5R+vPs5S1X43DPhd0bZwOyMgahJA3o9nlMQo
   A==;
X-CSE-ConnectionGUID: fjmyZdYBS6SVbMlDCqjmog==
X-CSE-MsgGUID: 94DimNjLRBab+SmOCi2S4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67413195"
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="67413195"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 03:26:46 -0700
X-CSE-ConnectionGUID: 09Uo1q9RTdKjidi19KeYVg==
X-CSE-MsgGUID: ZIMrH+tAQzewyy3QtVr5uA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,254,1754982000"; 
   d="scan'208";a="185107439"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 25 Oct 2025 03:26:45 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCbTv-000FFl-17;
	Sat, 25 Oct 2025 10:26:43 +0000
Date: Sat, 25 Oct 2025 18:25:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [omap-audio:peter/linux-next-wip 8/39]
 arch/xtensa/boot/dts/kc705.dtb: /sound: failed to match any schema with
 compatible: ['simple-audio-card']
Message-ID: <202510251813.5xoytSTw-lkp@intel.com>
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
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: xtensa-randconfig-051-20251025 (https://download.01.org/0day-ci/archive/20251025/202510251813.5xoytSTw-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510251813.5xoytSTw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510251813.5xoytSTw-lkp@intel.com/

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
