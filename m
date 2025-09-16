Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EA0296BA7
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 22:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758060967; cv=none; b=cBCqcV2XyrozLVnrap3EimzwFYfFuawlyJrtnWCWGBjIJl4dB8UVk7X+UsjJ4LemTEZpdZm1neWvXf2kZi8LkbpnrpvGp2MxWN8SqnqULYuT7RMxPaygFcNBmKHikRykXRHhoGt2pQMq8hDI/3zSerAATOplznpawfZqrFbuoLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758060967; c=relaxed/simple;
	bh=74DmD8iJ+oU+on4rAWjI+gKfIa2pob6EUdvhZPZCV2c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CpXbwejq+MjPNuEX95m2i8m9eQytM6vjC5UIXbv/1G7RYrRbvr5INolO/50lA48mncT+q/OzKGB0bDXH3xG8eXt0IZJFY+q1XQr3NqE9Dr8YHs538bBl8rbbWdsMzcmwbeahvZ6uwx4n3zn5XPkZUK4GbWokCP7++dLViBUolyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eTCOB4xe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eTCOB4xe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758060965; x=1789596965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=74DmD8iJ+oU+on4rAWjI+gKfIa2pob6EUdvhZPZCV2c=;
  b=eTCOB4xeeWzO1G3f7UrCGZI7wExV5Rn+CHwD/VzsldkMrhSDa/PHSQvh
   LDkFt4rBNXEozP+JRUk4q2z34v9RZjnmSfllKikUk8unbKLWg6Ww1WfoJ
   IEedmFiHE2UJwoJExDUxa32a5DD+BZVC6i/l/TRTnhsDA5Bwu+HoFyLHI
   U/DF/Vh2mFZJ0dgGs/Nubp3c6IoYeIGqs7YCxM8i51l41DgSiRlZ7oWJZ
   UCJowtpkRL7IkNwJq3Ew5Y/+c6146XANeftgu1FocR2Skek3IU5+jhXGR
   ZpraFOPzqyaJkonptfvVEnzTQxWPe9WRMvZzFEN3ugl77b0yiG4pV58V6
   Q==;
X-CSE-ConnectionGUID: ajnnbHpARnCk9b/7btmFYQ==
X-CSE-MsgGUID: F4FF1AMvRrOPEcER0zSg+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60272953"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60272953"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2025 15:16:04 -0700
X-CSE-ConnectionGUID: ToDnZPJRTtmbAoe2bG5D3g==
X-CSE-MsgGUID: 7oIHKiPnRqW+e97PcVg/ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,270,1751266800"; 
   d="scan'208";a="212212121"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Sep 2025 15:16:03 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uydxw-0000n1-38;
	Tue, 16 Sep 2025 22:16:00 +0000
Date: Wed, 17 Sep 2025 06:15:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 6/6] arm64: dts: apple: Add J180d (Mac Pro, M2 Ultra,
 2023) device tree
Message-ID: <202509170618.bkW9eOt7-lkp@intel.com>
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
In-Reply-To: <20250914-dt-apple-t6020-v2-6-1a738a98bb43@jannau.net>
References: <20250914-dt-apple-t6020-v2-6-1a738a98bb43@jannau.net>
TO: Janne Grunau <j@jannau.net>
TO: Sven Peter <sven@kernel.org>
TO: Janne Grunau <j@jannau.net>
TO: Alyssa Rosenzweig <alyssa@rosenzweig.io>
TO: Neal Gompa <neal@gompa.dev>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Hector Martin <marcan@marcan.st>
TO: Marc Zyngier <maz@kernel.org>
CC: asahi@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Janne,

kernel test robot noticed the following build warnings:

[auto build test WARNING on eef7336dc6c11f80c08b55b09b24faf124baeb0d]

url:    https://github.com/intel-lab-lkp/linux/commits/Janne-Grunau/dt-bindings-arm-apple-Add-t6020x-compatibles/20250915-034102
base:   eef7336dc6c11f80c08b55b09b24faf124baeb0d
patch link:    https://lore.kernel.org/r/20250914-dt-apple-t6020-v2-6-1a738a98bb43%40jannau.net
patch subject: [PATCH v2 6/6] arm64: dts: apple: Add J180d (Mac Pro, M2 Ultra, 2023) device tree
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250916 (https://download.01.org/0day-ci/archive/20250917/202509170618.bkW9eOt7-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509170618.bkW9eOt7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509170618.bkW9eOt7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b040000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b040000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/i2c@39b040000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b044000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/i2c@39b044000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b048000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/i2c@39b048000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b04c000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b04c000 (apple,t6020-i2c): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/i2c@39b04c000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b050000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/i2c@39b050000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:0: 'apple,t6020-i2c' is not one of ['apple,s5l8960x-i2c', 'apple,t7000-i2c', 'apple,s8000-i2c', 'apple,t8010-i2c', 'apple,t8015-i2c', 'apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b054000 (apple,t6020-i2c): compatible:1: 'apple,i2c' was expected
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/i2c@39b054000: failed to match any schema with compatible: ['apple,t6020-i2c', 'apple,t8103-i2c']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: spi@39b104000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: spi@39b104000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: spi@39b104000 (apple,t6020-spi): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/spi@39b104000: failed to match any schema with compatible: ['apple,t6020-spi', 'apple,t8103-spi']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: spi@39b108000 (apple,t6020-spi): compatible:0: 'apple,t6020-spi' is not one of ['apple,t8103-spi', 'apple,t8112-spi', 'apple,t6000-spi']
   	from schema $id: http://devicetree.org/schemas/spi/apple,spi.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: spi@39b108000 (apple,t6020-spi): compatible:1: 'apple,spi' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
