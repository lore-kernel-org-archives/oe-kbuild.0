Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD4BA1E25E3
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 05:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754544808; cv=none; b=IdsuPD977eMDu9WO8Kc0j3Y7ofG8r3m50fvvUUUyuWsZJ/BVzNgoBSKa5A6+axXrwI9NZX3KUlcyZrWn4GkGSM8OtCK8pccTTQpikXv/QbFcmIoQ2OvhmT+MOsquTh9Ugayj0INOSLM1POduw9NyzpvZRQAamsbL07kFAw4mbik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754544808; c=relaxed/simple;
	bh=9kebjQlwqDBtNI6i395r8heCu4tzJgQ5x8MKqz7dFdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jwAvMfIQWHQ+W4uMIjI+vrpPBET0WXKTRS0fR+tuFOpRNArUr6VuQMUrWXDqPuM4Bms+SaE2cz+MrqkA/nqEBwdhG0Kz23YrJvApyoOyTPv666KMxWrUWhPmWeYSMYm19nuz1eoyIfLebPdP55mscaO3GdkOVdGkNehhVvre7/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlI9j72T; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlI9j72T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754544807; x=1786080807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9kebjQlwqDBtNI6i395r8heCu4tzJgQ5x8MKqz7dFdI=;
  b=dlI9j72TzQKdqce4fv++kN7CuQ/ot2UY0iQQEKjZodcm3QPFMtAty5Fl
   auE/l73BO97Y8Ca06qVMOQNNVgNrvDyRDS17eU2NkjCYv9afhebA3cqg0
   QvRbsF4anBtU6Stx/O7NTUKah0vbmvePQq+AGRz/0/0yq21Aw93fgBV2z
   wA5LdaUs9jDhRtqCwQxcjC2Xaq+AUsVMnL8yvKEw0Z/8I8jU3dKyeGa84
   6Edz0sXaUlJuZCXPDDImaaDdKFR7Tog0UMKwys0Ky6vSNa0MkqywZ84vw
   adD57ghyGHuxKu3qFOJUK3c7H9TxQkkzTPCFE1TQWQfQGmR33UUtW7O6e
   g==;
X-CSE-ConnectionGUID: FbpDj7qzQuu91KO9feZh+w==
X-CSE-MsgGUID: +aR0tXuYTWyCVrEMP/OJ7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="74330253"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="74330253"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 22:33:24 -0700
X-CSE-ConnectionGUID: ulLAJyePSe6c7VmYyz3UZw==
X-CSE-MsgGUID: 0fLLUl9sTkaFa8/S/N812g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165330740"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 06 Aug 2025 22:33:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujtFg-0002Pp-24;
	Thu, 07 Aug 2025 05:33:20 +0000
Date: Thu, 7 Aug 2025 13:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 434/801] arch/xtensa/boot/dts/kc705.dtb:
 ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202508071319.xpUggmaO-lkp@intel.com>
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
commit: 1b64876aaf648439cb4ffc39f6e4630db7c79d30 [434/801] dt-bindings: net: Convert opencores,ethoc to DT schema
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: xtensa-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071319.xpUggmaO-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071319.xpUggmaO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071319.xpUggmaO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705.dtb: soc (simple-bus): i2c-master@0d090000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705.dtb: soc (simple-bus): spi@0d0a0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705.dtb: soc (simple-bus): ethoc@0d030000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
   arch/xtensa/boot/dts/kc705.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/xtensa/boot/dts/kc705.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
   arch/xtensa/boot/dts/kc705.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
   arch/xtensa/boot/dts/kc705.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/kc705.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: soc (simple-bus): ethoc@0d030000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: soc (simple-bus): main-oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: soc (simple-bus): flash@00000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
   arch/xtensa/boot/dts/kc705_nommu.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/xtensa/boot/dts/kc705_nommu.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
   arch/xtensa/boot/dts/kc705_nommu.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/kc705_nommu.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/kc705_nommu.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: soc (simple-bus): xtfpga-i2s@0d080000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: soc (simple-bus): ethoc@0d030000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: soc (simple-bus): main-oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
   arch/xtensa/boot/dts/lx200mx.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/xtensa/boot/dts/lx200mx.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
   arch/xtensa/boot/dts/lx200mx.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx200mx.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/lx200mx.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx60.dtb: soc (simple-bus): spi@0d0a0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx60.dtb: soc (simple-bus): serial@0d050020: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx60.dtb: soc (simple-bus): flash@08000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/lx60.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
   arch/xtensa/boot/dts/lx60.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/xtensa/boot/dts/lx60.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
   arch/xtensa/boot/dts/lx60.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
   arch/xtensa/boot/dts/lx60.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx60.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/lx60.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/lx60.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/ml605.dtb: soc (simple-bus): flash@08000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/ml605.dtb: soc (simple-bus): ethoc@0d030000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/ml605.dtb: soc (simple-bus): main-oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/xtensa/boot/dts/ml605.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
   arch/xtensa/boot/dts/ml605.dtb: serial@0d050020 (ns16550a): Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/xtensa/boot/dts/ml605.dtb: ethoc@0d030000 (opencores,ethoc): 'native-endian' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/opencores,ethoc.yaml#
   arch/xtensa/boot/dts/ml605.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
   arch/xtensa/boot/dts/ml605.dtb: i2c-master@0d090000 (opencores,i2c-ocores): $nodename:0: 'i2c-master@0d090000' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/ml605.dtb: i2c-master@0d090000 (opencores,i2c-ocores): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-synth@69', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
   arch/xtensa/boot/dts/ml605.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
   arch/xtensa/boot/dts/ml605.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
