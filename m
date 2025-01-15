Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893971D63D4
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Jan 2025 19:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736967761; cv=none; b=MhRK4gcbPyCKeUVZOV/Ev6gu9nz0uYrTSJOJm+qeCpEaRkb6ShclMnk2j5uMgIS2XhzRYCMg7bAcT7sGtu/yIvJOdTpjOfqQ5iKp9f+TWI9+IpbOP9zopjIXJekgriSadLYgC8S652aTMHZ/x3SxXudxGTIbT8yjSgT/9tRxaAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736967761; c=relaxed/simple;
	bh=qyFXM9YhURicuXjJIWUAxdqGDKNeIGvG1Hgu7JhuXj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ImaKuNMdEOSYUnnc88qZZw1UcNe22YHfzQhrjzIUoeyPunyNBvjvaFY27t79rfKyAskWWi2OJiKDnDhWYnFn3E5RXT4vW0XC/H/NZQH3jCx1vhr964HLe390h7gJy2gncsy5PIZqAerodwTYhvM0Uef5Ea69eZc2jmXBPGyYW/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nA+ZkB3x; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nA+ZkB3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736967760; x=1768503760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qyFXM9YhURicuXjJIWUAxdqGDKNeIGvG1Hgu7JhuXj0=;
  b=nA+ZkB3xpg3IT7l5/O7YNWdfcdHMOHLNUbzwHwH7WBEo9ftQwvGg+gUa
   SLTpQD0tRl3nj2QCkbjvG1KJ4h6URD+1+VNtARIEZJMTTvq/eWvkFkpiA
   67jFnEZ6RZEaEPX0GXUPlzYspqvE/FmVjww5NMdzHz0MTDRl1O3uFLfY/
   1++xQSujW71mAkZ+uoFaR+XtS672CRh4uaxK7EaEVlH/BlCB+yGOlgWvQ
   xMQn36X98ROc6AKJomkxPi1jlu0SLeOpxPeL5NGTsxCdZpD1/xcBy43Em
   JgExR/ThU5kMozNQWzhf4qW+a5CBs60bZMsHeKTNNJmOpPtt/QexaHLoK
   g==;
X-CSE-ConnectionGUID: ncJMvItVQvqRwwIoIneSxQ==
X-CSE-MsgGUID: jcvVTJZLRjyAM9MvrBQeTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37203939"
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="37203939"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2025 11:02:40 -0800
X-CSE-ConnectionGUID: g4EzA4dyRb6S0f5AbFZWvg==
X-CSE-MsgGUID: DlA7jKrkQeSwIpXYWjmUmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,207,1732608000"; 
   d="scan'208";a="136079060"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2025 11:02:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tY8ex-000QiZ-2q;
	Wed, 15 Jan 2025 19:02:35 +0000
Date: Thu, 16 Jan 2025 03:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [conor:qwip 4/4]
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: mmc-slot@1:
 $nodename:0: 'mmc-slot@1' does not match '^mmc(@.*)?$'
Message-ID: <202501160348.s8fqmyfT-lkp@intel.com>
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
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git qwip
head:   265419287bb97a97141b13f83553d2238b6e66b8
commit: 265419287bb97a97141b13f83553d2238b6e66b8 [4/4] riscv: dts: microchip: enable qspi adc/mmc-spi-slot on BeagleV Fire
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: riscv-randconfig-052-20250116 (https://download.01.org/0day-ci/archive/20250116/202501160348.s8fqmyfT-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f5cd181ffbb7cb61d582fe130d46580d5969d47a)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250116/202501160348.s8fqmyfT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501160348.s8fqmyfT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: mmc-slot@1: $nodename:0: 'mmc-slot@1' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: mmc-slot@1: Unevaluated properties are not allowed ('disable-wp' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20120000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20121000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20122000: 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
