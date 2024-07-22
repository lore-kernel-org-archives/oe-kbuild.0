Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C57A134B2
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jul 2024 04:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721623152; cv=none; b=a4fPxRLaBn1jxjGUQUO4Uei9Akrui8XVtzj3kNJoJ/w2cznR0a20i15Ts31U1AsLePKl2JsR86KURYrllTQk+x6FNuHQ51D903d0cIMakuIkgsWv3K/i2SEs2VQ4Ah8a8ekWEOuUzqlWCJ+I6d/Q8iSwNmmKcymYUTw9e/CdgVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721623152; c=relaxed/simple;
	bh=VcOJSY0Ah1HPzrXIyae0AC6fS9lbGgz85bGqI+StC9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U8lvOFC22KSrbjxROxcEM1XL8oAJZTka7WbZVgwbJQAlJBCup/xAwuGFulovQu1PkwKmna2f/K5sWq2C41IvU0eLSEljm0kOHa8qHozcdZP+RFHb+BHAp4OQegQcZ8U71OcF70mQiC1LG0qNgdM2eG1EtKxunKgl8CLgl/L6N7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxXhEt0s; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxXhEt0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721623151; x=1753159151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VcOJSY0Ah1HPzrXIyae0AC6fS9lbGgz85bGqI+StC9c=;
  b=WxXhEt0sCW5DU3uZoOQqO6m0chA5hji32BxTWUgkWqSgvlQxV6suhL7o
   en8SrOXXvJ1yT365qMr/m9YYFqpzfk4Gqvh0UHRoZexeJoNMlfWu1uNJl
   AFNTl9Ri43S4cFR1E8ENchCJZIGpg37QEAfqWQodczwlp7ICGXu40iqgp
   QIFUzxWcgLXId2UVNBbGgP148YzQO6CDctPxJJAi/yWaH3gs9ZVaZvSBF
   Q0+UMrg1vn9abks3+VeRwREd4D/hmOB1FfT5RhyFCSBe0p0u6CXYYM1LC
   GTqaSjqAdI5WrlsCbMsZh55AfVg9p6QhFljgQyUKvwLzofAGFR7bwyUpv
   g==;
X-CSE-ConnectionGUID: 1NCqMUuuTqmRRQguxucaOA==
X-CSE-MsgGUID: AzfbmDnEQjaW5LAsjm4YOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="18789349"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="18789349"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 21:39:10 -0700
X-CSE-ConnectionGUID: gwREZxZfRc6LwgTnhqu/3g==
X-CSE-MsgGUID: bNtiK4iFQ6O+MGgocTpbww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="56595916"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 21 Jul 2024 21:39:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVkpG-000ks6-2e;
	Mon, 22 Jul 2024 04:39:06 +0000
Date: Mon, 22 Jul 2024 12:38:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 28/43]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000:
 snps,pbl: [32] is not of type 'integer'
Message-ID: <202407221219.ykg98xYM-lkp@intel.com>
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
TO: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux th1520
head:   350a58164ab57fa986bd3dadd6c975d3f6e39fcf
commit: a9aca05338c63b95eb676983ee677d5cc4590501 [28/43] riscv: dts: thead: Add TH1520 ethernet nodes
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: riscv-randconfig-051-20240722 (https://download.01.org/0day-ci/archive/20240722/202407221219.ykg98xYM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407221219.ykg98xYM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407221219.ykg98xYM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'snps,axi-config', 'snps,fixed-burst', 'snps,multicast-filter-bins', 'snps,pbl', 'snps,perfect-filter-entries' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'snps,axi-config', 'snps,fixed-burst', 'snps,multicast-filter-bins', 'snps,pbl', 'snps,perfect-filter-entries' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/syscon@ffec003000: failed to match any schema with compatible: ['thead,th1520-gmac-apb', 'syscon']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/syscon@ffec004000: failed to match any schema with compatible: ['thead,th1520-gmac-apb', 'syscon']
--
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'snps,axi-config', 'snps,fixed-burst', 'snps,multicast-filter-bins', 'snps,pbl', 'snps,perfect-filter-entries' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/syscon@ffec003000: failed to match any schema with compatible: ['thead,th1520-gmac-apb', 'syscon']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/syscon@ffec004000: failed to match any schema with compatible: ['thead,th1520-gmac-apb', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
