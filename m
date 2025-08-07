Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3043D4AEE2
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 06:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754548927; cv=none; b=VXNT5tLvwzWMn+/6tupcJkqTbXrheFXpBblRa/jxblbe5qd5Hiqm0pyad8bax3O80ByQFSSBmUJZysVhecev0rU5a7dEWRI6h4yaBbNl6W6EAglVyyFtpB+PDy/w6/qy8yKPoentz3XrEUIT1JkhDAVGyqpuSHK/z81PckLK91A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754548927; c=relaxed/simple;
	bh=belqQ8q451yYOjGCBryNmlrlAcyHkwp7Y5p9K5aXIFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aKsBVaahgBKv+tQTJlkM1Yuxp7EHVCrdDyHsvw3rJCtvljaIddPwHW4AgecTJCyW5EurVJkkQONMYJEgReDGdEPjj7PpniDRi/BbFIKZ1zEcImL71Jugu4WvvTeBTm/RBAUlmqTxOFIGqCa43bAuJjBvofoRwjeCd65Fso0S2TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aSC/XHDG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aSC/XHDG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754548925; x=1786084925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=belqQ8q451yYOjGCBryNmlrlAcyHkwp7Y5p9K5aXIFA=;
  b=aSC/XHDGhPfxCUZsdRZMFmGpkv9IL4Iqa8Q5hQUdKHOdXQFdwf+XPXYs
   cpEU3moUCYBuO3zJ/fCNAhTyW5PAlBAV4vXM9JqwtvjF0ZUl0X29zoyaQ
   P8OuhxZp0byMzTzC1R8f5RPiP4PzAfcIRqvsZJewMAqqHDo2SETJyV+gK
   vZBGEOQRJx785x+zAfvN+pCfxbiUe8hCtvmTpRm2plnB/cnw2SDJyMJcC
   YpJ7kmVAPQTlMqX4insuls+FtCetE2E4iYoDQGVKDSxIyDLa3vrONTKCi
   uSKfrOy12BO8HdtYnOUrlbAuQ4nJdQ6CZsq3L7unRdC2S5r0Jso1mPBmK
   A==;
X-CSE-ConnectionGUID: ayvfDPzmSmS0WYQOFOrEDQ==
X-CSE-MsgGUID: iJNNyOCgSNuFn10OqzChTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57017134"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="57017134"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 23:42:04 -0700
X-CSE-ConnectionGUID: zr8GVn4SSkSSrWravNBaKg==
X-CSE-MsgGUID: PMcT1AbQSp6annIofudu7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164986191"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Aug 2025 23:42:03 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujuJP-0002TO-1b;
	Thu, 07 Aug 2025 06:41:21 +0000
Date: Thu, 7 Aug 2025 14:40:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 754/801] arch/xtensa/boot/dts/kc705.dtb:
 spi@0d0a0000 (cdns,xtfpga-spi): '#address-cells', '#size-cells',
 'sound-codec@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202508071438.R90WmygP-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: f9e76acb7b0c7d652ea84cad8f044a10e9367167 [754/801] dt-bindings: spi: Convert cdns,xtfpga-spi to DT schema
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: xtensa-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071438.R90WmygP-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071438.R90WmygP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071438.R90WmygP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/xtensa/boot/dts/kc705.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/kc705.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
   arch/xtensa/boot/dts/kc705.dtb: xtfpga-i2s@0d080000 (cdns,xtfpga-i2s): reg: [[218628096, 64]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
   arch/xtensa/boot/dts/kc705.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
>> arch/xtensa/boot/dts/kc705.dtb: spi@0d0a0000 (cdns,xtfpga-spi): '#address-cells', '#size-cells', 'sound-codec@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/spi/cdns,xtfpga-spi.yaml#
>> arch/xtensa/boot/dts/kc705.dtb: spi@0d0a0000 (cdns,xtfpga-spi): reg: [[218759168, 12]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,xtfpga-spi.yaml#
   arch/xtensa/boot/dts/kc705.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   arch/xtensa/boot/dts/kc705_nommu.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: xtfpga-i2s@0d080000 (cdns,xtfpga-i2s): reg: [[218628096, 64]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
>> arch/xtensa/boot/dts/kc705_nommu.dtb: spi@0d0a0000 (cdns,xtfpga-spi): '#address-cells', '#size-cells', 'sound-codec@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/spi/cdns,xtfpga-spi.yaml#
>> arch/xtensa/boot/dts/kc705_nommu.dtb: spi@0d0a0000 (cdns,xtfpga-spi): reg: [[218759168, 12]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,xtfpga-spi.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   arch/xtensa/boot/dts/lx200mx.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: xtfpga-i2s@0d080000 (cdns,xtfpga-i2s): reg: [[218628096, 64]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
>> arch/xtensa/boot/dts/lx200mx.dtb: spi@0d0a0000 (cdns,xtfpga-spi): '#address-cells', '#size-cells', 'sound-codec@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/spi/cdns,xtfpga-spi.yaml#
>> arch/xtensa/boot/dts/lx200mx.dtb: spi@0d0a0000 (cdns,xtfpga-spi): reg: [[218759168, 12]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,xtfpga-spi.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   arch/xtensa/boot/dts/lx60.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/lx60.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
   arch/xtensa/boot/dts/lx60.dtb: xtfpga-i2s@0d080000 (cdns,xtfpga-i2s): reg: [[218628096, 64]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
   arch/xtensa/boot/dts/lx60.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx60.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
>> arch/xtensa/boot/dts/lx60.dtb: spi@0d0a0000 (cdns,xtfpga-spi): '#address-cells', '#size-cells', 'sound-codec@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/spi/cdns,xtfpga-spi.yaml#
>> arch/xtensa/boot/dts/lx60.dtb: spi@0d0a0000 (cdns,xtfpga-spi): reg: [[218759168, 12]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,xtfpga-spi.yaml#
   arch/xtensa/boot/dts/lx60.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   arch/xtensa/boot/dts/ml605.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/ml605.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
   arch/xtensa/boot/dts/ml605.dtb: xtfpga-i2s@0d080000 (cdns,xtfpga-i2s): reg: [[218628096, 64]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
   arch/xtensa/boot/dts/ml605.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/ml605.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
>> arch/xtensa/boot/dts/ml605.dtb: spi@0d0a0000 (cdns,xtfpga-spi): '#address-cells', '#size-cells', 'sound-codec@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/spi/cdns,xtfpga-spi.yaml#
>> arch/xtensa/boot/dts/ml605.dtb: spi@0d0a0000 (cdns,xtfpga-spi): reg: [[218759168, 12]] is too short
   	from schema $id: http://devicetree.org/schemas/spi/cdns,xtfpga-spi.yaml#
   arch/xtensa/boot/dts/ml605.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
