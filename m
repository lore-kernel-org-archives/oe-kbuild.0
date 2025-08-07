Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6959942AA5
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 10:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754563030; cv=none; b=DiF3eaMf/pzQCQuGoeE11OhuSWMJ1c39HnTCmYJ/0yUoNdkJO4jxk3H3iWZrLT5hsFyuT2GWun6/M9fe7gKvhh7nlQ+lCyKt1uwTAtgjchHeO0PyU8DmidYdR0JaLv7fZjDqvJ24sKql3czYSGAOVCuf8zX2iqJaoeC9j71Hluo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754563030; c=relaxed/simple;
	bh=W2FpBIpQQgKy78Bt+2d+PvOo7zptManssVFv6hctFyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9iEdovWjSYZGhd4GxgiSfHzyoAtq5F5uwnE+52fjFAiRGxTQCsFlkr9djHH2R1xck43D5kJXEltBFnh1omBtH+MMVc2W1A+zPwBFnMLA1Q4ycfnGyjsydALYr6+XDGDM7qLBRLOFf7nsTsRo1eRSE61AGtIDb4j1G5F1T24PAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ENcAJotm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ENcAJotm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754563029; x=1786099029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W2FpBIpQQgKy78Bt+2d+PvOo7zptManssVFv6hctFyM=;
  b=ENcAJotmrFNOxfdrn0iycS6LMx5jzj9rMHMXl7Uu3wspZ0fh6QZPl/LQ
   aNA3F5Kj0AJjTHG33qnO+ShldUx+SNYsq/6jdI9Jg+u1wE9Y7z19lHzhe
   G18oDoZt6vkgQ1JW4ND3Oma0px1yZOq9THVSwM/1AURttvr69B41S7efR
   CC4v8e8Y/0HS1Q162q5vizTZZ46F0yr5RULWYaozfhGv+dGwEWCqwJS8k
   O8ASJEFopKV/BKaFP8Kty+0/xM61tEl1Q1NCKYDs0NQfSmV7br5uTzsz/
   VJPXdv/0EbvieF4NTuMIH265Emg8wFV8xzBNr9UwayISpefC4oqpTN7zL
   g==;
X-CSE-ConnectionGUID: 5xobOnusTXyD3MrhZQA1Yg==
X-CSE-MsgGUID: A1i6lewURUunvISGItHwIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56810789"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="56810789"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 03:36:40 -0700
X-CSE-ConnectionGUID: gOsJAMbkRlWtYRfLWM5Ayw==
X-CSE-MsgGUID: En1ExvjzQQegMxMGK0ZGPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="164552834"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2025 03:36:39 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujxzB-0002gd-0I;
	Thu, 07 Aug 2025 10:36:37 +0000
Date: Thu, 7 Aug 2025 18:36:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 17/801]
 arch/arm64/boot/dts/cavium/thunder-88xx.dtb: / (cavium,thunder-88xx):
 '#address-cells', '#size-cells', 'aliases', 'cpus', 'interrupt-parent',
 'memory@0', 'model', 'pmu', 'psci', 'refclk50mhz', 'soc', 'timer' do not
 match any of the regexes: '^pinctrl-[0-9...
Message-ID: <202508071837.8oYBuh5s-lkp@intel.com>
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
commit: ef204ea1272eaae1fad7ea9a3e47c54319031bab [17/801] dt-bindings: arm: Convert cavium-thunder-88xx to DT schema
:::::: branch date: 17 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071837.8oYBuh5s-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071837.8oYBuh5s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071837.8oYBuh5s-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/cavium/thunder-88xx.dtb: / (cavium,thunder-88xx): '#address-cells', '#size-cells', 'aliases', 'cpus', 'interrupt-parent', 'memory@0', 'model', 'pmu', 'psci', 'refclk50mhz', 'soc', 'timer' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/cavium-thunder-88xx.yaml#
   arch/arm64/boot/dts/cavium/thunder-88xx.dtb: serial@87e024000000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml#
   arch/arm64/boot/dts/cavium/thunder-88xx.dtb: serial@87e024000000 (arm,pl011): clock-names: ['apb_pclk'] is too short
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml#
   arch/arm64/boot/dts/cavium/thunder-88xx.dtb: serial@87e024000000 (arm,pl011): clocks: [[2]] is too short
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml#
   arch/arm64/boot/dts/cavium/thunder-88xx.dtb: serial@87e025000000 (arm,pl011): clock-names:0: 'uartclk' was expected
   	from schema $id: http://devicetree.org/schemas/serial/pl011.yaml#
   arch/arm64/boot/dts/cavium/thunder-88xx.dtb: serial@87e025000000 (arm,pl011): clock-names: ['apb_pclk'] is too short

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
