Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEC42E54B6
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Jul 2026 08:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979978; cv=none; b=Id2wL/ScRcldKyrHTtFxCrKGe2rN2GTJ+P8VLh9p3w9uGMbcQbdUd/O6t+VqW9e6Col3QOMuxHZFFsgFZyd62TSVxm1GEQl+RpzFTUA5G4Sqv41x3lPlp/ripPPT6Ci8AKVTGgxybd5vYO4DhnUVt2nFaQ/vEHP0XXc1s6cBVdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979978; c=relaxed/simple;
	bh=XtNrnV4JTsv9WN0yk/KJmX2rumyGNpY0S4ELOBSb2zk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ktsVTO6XJcGyQ2fMU/b/LC/l3zUegAhHGsYo/N27mPRHL3mKMtLGE1oBHbPfeZv26GMjgsv4fs+wxlEAj6XeW/mg1BRky3hzyLTk685tp1Q9Gpv8PsvIkqUMQTU5/KVICGTHw35tm1LG0j+s6u0UDfZ1sJw/X8/qHXm9g96oQpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKam+s9i; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKam+s9i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782979976; x=1814515976;
  h=date:from:to:cc:subject:message-id;
  bh=XtNrnV4JTsv9WN0yk/KJmX2rumyGNpY0S4ELOBSb2zk=;
  b=SKam+s9i4QOOMcg+5K7C+19HhnHXxL1c+bLgKV29dzSM10OBc0Q2N8+p
   2VnFoW6OQVGQgjP0EJTfRNFtZIhu44jXT9e/Gs0IYkZgDZtYJb5Zkx9d0
   ideP1uEfcczKOv4/DWFWqsvx/wC0HaBTEt+EG7GoemL7Sa8F8gbaZ/hq6
   pV7pNNddB+u376evz7/0OHV8HVvF/q2oShKBAEXSeDRRSeCZiwr3GIJXG
   K+c5XlkZfCDA+MdpBd6vzIQ/698N1rRAFCeJCjwh7Fe4pqAA7AUl4rCqa
   XHSCuI/FSB/h17OSyxjQO03bejV9n5RKKDGilFsa1EaG6FAo0pLY3kxLX
   A==;
X-CSE-ConnectionGUID: 9qQt5gfUTiuFa8IXtcjWJg==
X-CSE-MsgGUID: zTniW2DaRKO1OiPvcWCIQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="87557172"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="87557172"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 01:12:56 -0700
X-CSE-ConnectionGUID: u4BpY+q1QYK6jwC3LRr5+w==
X-CSE-MsgGUID: YKamvPHYTzqLxxncxjzvsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="257692244"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 02 Jul 2026 01:12:55 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfCXU-000000001Av-3Ddk;
	Thu, 02 Jul 2026 08:12:52 +0000
Date: Thu, 02 Jul 2026 10:12:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/boot/dts/canaan/canaan_kd233.dtb: cpu@0
 (canaan,k210): 'riscv,cbom-block-size' is a required property
Message-ID: <202607021024.k3sbflDh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Guodong Xu <docular.xu@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Guodong-Xu/dt-bindings-riscv-sort-multi-letter-Z-extensions-alphanumerically/20260701-211251
head:   d74b10733d708a044cfb069784c7f266f1d88d42
commit: 9a7f4baeaec1080905ef82c565eb14c772479f69 dt-bindings: riscv: Require block-size for Zicbom, Zicbop, and Zicboz
date:   19 hours ago
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: riscv-randconfig-2051-20260702 (https://download.01.org/0day-ci/archive/20260702/202607021024.k3sbflDh-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021024.k3sbflDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607021024.k3sbflDh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/canaan/canaan_kd233.dtb: cpu@0 (canaan,k210): 'riscv,cbom-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/canaan_kd233.dtb: cpu@0 (canaan,k210): 'riscv,cbop-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/canaan_kd233.dtb: cpu@0 (canaan,k210): 'riscv,cboz-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/canaan_kd233.dtb: cpu@0 (canaan,k210): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/canaan_kd233.dtb: cpu@1 (canaan,k210): 'riscv,cbom-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/canaan_kd233.dtb: cpu@1 (canaan,k210): 'riscv,cbop-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/canaan_kd233.dtb: cpu@1 (canaan,k210): 'riscv,cboz-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/canaan_kd233.dtb: cpu@1 (canaan,k210): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
--
>> arch/riscv/boot/dts/canaan/k210_generic.dtb: cpu@0 (canaan,k210): 'riscv,cbom-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/k210_generic.dtb: cpu@0 (canaan,k210): 'riscv,cbop-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/k210_generic.dtb: cpu@0 (canaan,k210): 'riscv,cboz-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/k210_generic.dtb: cpu@0 (canaan,k210): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/k210_generic.dtb: cpu@1 (canaan,k210): 'riscv,cbom-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/k210_generic.dtb: cpu@1 (canaan,k210): 'riscv,cbop-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/k210_generic.dtb: cpu@1 (canaan,k210): 'riscv,cboz-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/k210_generic.dtb: cpu@1 (canaan,k210): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
--
>> arch/riscv/boot/dts/canaan/sipeed_maix_bit.dtb: cpu@0 (canaan,k210): 'riscv,cbom-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/sipeed_maix_bit.dtb: cpu@0 (canaan,k210): 'riscv,cbop-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/sipeed_maix_bit.dtb: cpu@0 (canaan,k210): 'riscv,cboz-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/sipeed_maix_bit.dtb: cpu@0 (canaan,k210): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_bit.dtb: cpu@1 (canaan,k210): 'riscv,cbom-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_bit.dtb: cpu@1 (canaan,k210): 'riscv,cbop-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_bit.dtb: cpu@1 (canaan,k210): 'riscv,cboz-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_bit.dtb: cpu@1 (canaan,k210): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
--
>> arch/riscv/boot/dts/canaan/sipeed_maix_dock.dtb: cpu@0 (canaan,k210): 'riscv,cbom-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/sipeed_maix_dock.dtb: cpu@0 (canaan,k210): 'riscv,cbop-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/sipeed_maix_dock.dtb: cpu@0 (canaan,k210): 'riscv,cboz-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/sipeed_maix_dock.dtb: cpu@0 (canaan,k210): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_dock.dtb: cpu@1 (canaan,k210): 'riscv,cbom-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_dock.dtb: cpu@1 (canaan,k210): 'riscv,cbop-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_dock.dtb: cpu@1 (canaan,k210): 'riscv,cboz-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_dock.dtb: cpu@1 (canaan,k210): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
--
>> arch/riscv/boot/dts/canaan/sipeed_maix_go.dtb: cpu@0 (canaan,k210): 'riscv,cbom-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/sipeed_maix_go.dtb: cpu@0 (canaan,k210): 'riscv,cbop-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/sipeed_maix_go.dtb: cpu@0 (canaan,k210): 'riscv,cboz-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/sipeed_maix_go.dtb: cpu@0 (canaan,k210): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_go.dtb: cpu@1 (canaan,k210): 'riscv,cbom-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_go.dtb: cpu@1 (canaan,k210): 'riscv,cbop-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_go.dtb: cpu@1 (canaan,k210): 'riscv,cboz-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maix_go.dtb: cpu@1 (canaan,k210): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
--
>> arch/riscv/boot/dts/canaan/sipeed_maixduino.dtb: cpu@0 (canaan,k210): 'riscv,cbom-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/sipeed_maixduino.dtb: cpu@0 (canaan,k210): 'riscv,cbop-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/sipeed_maixduino.dtb: cpu@0 (canaan,k210): 'riscv,cboz-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/canaan/sipeed_maixduino.dtb: cpu@0 (canaan,k210): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maixduino.dtb: cpu@1 (canaan,k210): 'riscv,cbom-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maixduino.dtb: cpu@1 (canaan,k210): 'riscv,cbop-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maixduino.dtb: cpu@1 (canaan,k210): 'riscv,cboz-block-size' is a required property
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/canaan/sipeed_maixduino.dtb: cpu@1 (canaan,k210): Unevaluated properties are not allowed ('riscv,isa' was unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
