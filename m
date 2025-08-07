Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44BE610D
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 06:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754546885; cv=none; b=DosGKejmvgIgpjkhIfF6REwWkyHdz4z0l/9NnK6kyZjHEolEkH8YP9R2MybcsoiYvFoz8jA19vb95LLOcxCxAVxuPG/DQFarOfb+l9BMUWRZAQDuLg14U4mkQ/ujoZLXib/FFnUpstRJElt2JWvbuRMxv/NwLq9F80CVcWy2x+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754546885; c=relaxed/simple;
	bh=AwTnklY/1oOeGHre9J1Cp9p1DfbXXRlbNdIsv2agADg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VVCZXpp6VNd5RQ72XhdqO49RuUusIi8PMybGRZPouWMqH4R9dH8LZirOLYcPt/AOLjyVNo7FQBZ1AxADekdAvun0KxbOgtWNWYrRNjPk0w7P98bYr5OE03ELaW65sc1fVwKXqCUFFYaf5s/PutvE5D4M8OkQDw74Lfod7dukmIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ud2hKJcP; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ud2hKJcP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754546884; x=1786082884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AwTnklY/1oOeGHre9J1Cp9p1DfbXXRlbNdIsv2agADg=;
  b=Ud2hKJcPpWLBRUFhlrGRqtMQO6DBEQfw1ltOpY0L8spKdWtRl57m/6fh
   IZOFqNsXzZeQWHNdBuwO6QsYaYwqAn3DxlUlqoLZFNmWNqzUAfKxKWf3E
   DCStJ1a7h/0+SkmoxQ/2ENQSExnpjtGKjPDdglO+i5gcGBLPO0UejbA3E
   F3zhF78g0L4XRAVQIu19prw/MOsY7m+DQZXcpg5/ow0wNwntUjYUjpIZX
   MRJ0JZdM1hcDKBAE+63yKlT1Ytt8SCO7TE8w3fQSOlTPCr/orRiFmxfD5
   27S9DsLicAtDdGkmV3BsBqd2B/E8r619ZZV3pcq7Dx341hhWmxX9zlluY
   Q==;
X-CSE-ConnectionGUID: K5VvpSbsTDCcoEp9USpvkA==
X-CSE-MsgGUID: J7eoA2ojT4W8PBagTALmRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60504961"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="60504961"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 23:08:03 -0700
X-CSE-ConnectionGUID: 0a35hAYxT66AYdGivSUvVg==
X-CSE-MsgGUID: 8mwiTVekSfOq5dQD2Sk6Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164981141"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Aug 2025 23:08:02 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujtn7-0002Rp-35;
	Thu, 07 Aug 2025 06:07:55 +0000
Date: Thu, 7 Aug 2025 14:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 653/801] arch/xtensa/boot/dts/kc705.dtb:
 xtfpga-i2s@0d080000 (cdns,xtfpga-i2s): reg: [[218628096, 64]] is too short
Message-ID: <202508071416.MSn2xWPw-lkp@intel.com>
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
commit: 4103e441602e6550a4cb673b3d6a015d7a2a4348 [653/801] dt-bindings: sound: Convert cdns,xtfpga-i2s to DT schema
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: xtensa-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071416.MSn2xWPw-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071416.MSn2xWPw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071416.MSn2xWPw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705.dtb: soc (simple-bus): serial@0d050020: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705.dtb: soc (simple-bus): main-oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
   arch/xtensa/boot/dts/kc705.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/kc705.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
>> arch/xtensa/boot/dts/kc705.dtb: xtfpga-i2s@0d080000 (cdns,xtfpga-i2s): reg: [[218628096, 64]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
   arch/xtensa/boot/dts/kc705.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/kc705.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: soc (simple-bus): i2c-master@0d090000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: soc (simple-bus): flash@00000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
   arch/xtensa/boot/dts/kc705_nommu.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
>> arch/xtensa/boot/dts/kc705_nommu.dtb: xtfpga-i2s@0d080000 (cdns,xtfpga-i2s): reg: [[218628096, 64]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/kc705_nommu.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: soc (simple-bus): flash@08000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: soc (simple-bus): main-oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
   arch/xtensa/boot/dts/lx200mx.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
>> arch/xtensa/boot/dts/lx200mx.dtb: xtfpga-i2s@0d080000 (cdns,xtfpga-i2s): reg: [[218628096, 64]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/lx200mx.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx60.dtb: soc (simple-bus): i2c-master@0d090000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx60.dtb: soc (simple-bus): spi@0d0a0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx60.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
   arch/xtensa/boot/dts/lx60.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/lx60.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
>> arch/xtensa/boot/dts/lx60.dtb: xtfpga-i2s@0d080000 (cdns,xtfpga-i2s): reg: [[218628096, 64]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
   arch/xtensa/boot/dts/lx60.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx60.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx60.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/lx60.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/ml605.dtb: soc (simple-bus): serial@0d050020: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/ml605.dtb: soc (simple-bus): ethoc@0d030000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/ml605.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
   arch/xtensa/boot/dts/ml605.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/xtensa/boot/dts/ml605.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
>> arch/xtensa/boot/dts/ml605.dtb: xtfpga-i2s@0d080000 (cdns,xtfpga-i2s): reg: [[218628096, 64]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/cdns,xtfpga-i2s.yaml#
   arch/xtensa/boot/dts/ml605.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/ml605.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/ml605.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/ml605.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
