Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D904D4C7B
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Jul 2024 01:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721095163; cv=none; b=L9rEu3JT66esrw0WKCiAXc38Bhx28yrPH8EXxoNjMghY/lbvfjXKG7+jiZA8TWpG+7e7SYyIHBtXfRVDLaS7qx1VIdPXYsifkdbF2fwmSpXypuSbsqw/JYt7AKtD2Cz/C8r2yvSAZjf5RpibkMyC9EhFGLFrYImeEB8lHjSuQZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721095163; c=relaxed/simple;
	bh=OQwSb5Qb/wwxo6dPlZURaHK/jJU/5xRSe73n02hfA3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jfN6IMg8uvmeF2+NSYP5kCq7XIjFW/sINMtLyDmT2M/CjTgD801+wrZfhuc5lf+Ajcyivz5W0gfRc8674cZVqz3oFmJee9O/d8TSGTMJw2amltk8PI8ntVQzoGLfVRqUXzjsU0qIzvWWd4/mawRCd2JiTQHJmvxBvyA39zRkCZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xo+m5OQm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xo+m5OQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721095161; x=1752631161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OQwSb5Qb/wwxo6dPlZURaHK/jJU/5xRSe73n02hfA3k=;
  b=Xo+m5OQm7tGCnHAUFfeO8kKc+0OOoQwJIWN9SlQn0n9vPXaoc4r3d53m
   B6F2cOk+80c5TvMT67Q7t9+W9G6sg1WoN+pUB8oiK2lEE2G8Lk55F+owk
   OYlH7AbtX8RqBpL0mTTpY1ow0AJNGurJbfJVLDf8CkZJMr3J9S2NQSP+H
   b66GtB00o6zn7+AZ0LRwX56C4A4yxw7a8PExIz83EivN2YoVPNNGjtT6H
   wNuJ9GEozH+cL4WN56/WEob84GDQeulJ4nCjtM04C2TR19YOrNfkEFXPH
   xQ0D+RXk8Sh3BeC4tkeHpFwMVRc6A8A8YLzYMxBFx/hoL6HYVaTdPr1Z0
   g==;
X-CSE-ConnectionGUID: 33bPhmUsSg2PJPSASpXkhw==
X-CSE-MsgGUID: PFQGB3nDR7eJj7dk8N/Acg==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18640906"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18640906"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:59:21 -0700
X-CSE-ConnectionGUID: BzJaw8N6SGy0Jv9b05rxdw==
X-CSE-MsgGUID: 9MyoJAibQa6P6B0EyI5goQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="49890043"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Jul 2024 18:59:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTXTI-000el6-0r;
	Tue, 16 Jul 2024 01:59:16 +0000
Date: Tue, 16 Jul 2024 09:58:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [atishp04:b4/counter_delegation 13/29]
 arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: cpu@0: False
 schema does not allow {'compatible': ['thead,c906', 'riscv'], 'device_type':
 ['cpu'], 'reg': [[0]], 'clocks': [[4, 132]], 'd-cache-block-size': 64,
 'd-cache-sets': 256, 'd-cache-...
Message-ID: <202407160913.nS5lsm03-lkp@intel.com>
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
CC: Atish Patra <Atish.Patra@wdc.com>
TO: Atish Patra <atishp@rivosinc.com>

tree:   https://github.com/atishp04/linux b4/counter_delegation
head:   71d75026a6a4bb8210c242fbb49f5b8da1861f69
commit: 1de23b947a4f1f461b3d058cda634a268833b03e [13/29] dt-bindings: riscv: add Sxcsrind ISA extension description
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: riscv-randconfig-051-20240716 (https://download.01.org/0day-ci/archive/20240716/202407160913.nS5lsm03-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407160913.nS5lsm03-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407160913.nS5lsm03-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: cpu@0: False schema does not allow {'compatible': ['thead,c906', 'riscv'], 'device_type': ['cpu'], 'reg': [[0]], 'clocks': [[4, 132]], 'd-cache-block-size': 64, 'd-cache-sets': 256, 'd-cache-size': 32768, 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 32768, 'mmu-type': ['riscv,sv39'], 'operating-points-v2': [[40]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], '#cooling-cells': 2, 'cpu-supply': [[41]], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 39}, '$nodename': ['cpu@0']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb: cpu@0: False schema does not allow {'compatible': ['thead,c906', 'riscv'], 'device_type': ['cpu'], 'reg': [[0]], 'clocks': [[4, 132]], 'd-cache-block-size': 64, 'd-cache-sets': 256, 'd-cache-size': 32768, 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 32768, 'mmu-type': ['riscv,sv39'], 'operating-points-v2': [[47]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], '#cooling-cells': 2, 'cpu-supply': [[48]], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 46}, '$nodename': ['cpu@0']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: cpu@0: False schema does not allow {'compatible': ['thead,c906', 'riscv'], 'device_type': ['cpu'], 'reg': [[0]], 'clocks': [[4, 132]], 'd-cache-block-size': 64, 'd-cache-sets': 256, 'd-cache-size': 32768, 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 32768, 'mmu-type': ['riscv,sv39'], 'operating-points-v2': [[46]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], '#cooling-cells': 2, 'cpu-supply': [[47]], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 45}, '$nodename': ['cpu@0']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb: cpu@0: False schema does not allow {'compatible': ['thead,c906', 'riscv'], 'device_type': ['cpu'], 'reg': [[0]], 'clocks': [[4, 132]], 'd-cache-block-size': 64, 'd-cache-sets': 256, 'd-cache-size': 32768, 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 32768, 'mmu-type': ['riscv,sv39'], 'operating-points-v2': [[44]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], '#cooling-cells': 2, 'cpu-supply': [[45]], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 43}, '$nodename': ['cpu@0']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb: cpu@0: False schema does not allow {'compatible': ['thead,c906', 'riscv'], 'device_type': ['cpu'], 'reg': [[0]], 'clocks': [[4, 132]], 'd-cache-block-size': 64, 'd-cache-sets': 256, 'd-cache-size': 32768, 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 32768, 'mmu-type': ['riscv,sv39'], 'operating-points-v2': [[38]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], '#cooling-cells': 2, 'cpu-supply': [[39]], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 37}, '$nodename': ['cpu@0']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb: cpu@0: False schema does not allow {'compatible': ['thead,c906', 'riscv'], 'device_type': ['cpu'], 'reg': [[0]], 'clocks': [[4, 132]], 'd-cache-block-size': 64, 'd-cache-sets': 256, 'd-cache-size': 32768, 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 32768, 'mmu-type': ['riscv,sv39'], 'operating-points-v2': [[43]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], '#cooling-cells': 2, 'cpu-supply': [[44]], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 42}, '$nodename': ['cpu@0']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: cpu@0: False schema does not allow {'compatible': ['thead,c906', 'riscv'], 'device_type': ['cpu'], 'reg': [[0]], 'clocks': [[4, 132]], 'd-cache-block-size': 64, 'd-cache-sets': 256, 'd-cache-size': 32768, 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 32768, 'mmu-type': ['riscv,sv39'], 'operating-points-v2': [[46]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], '#cooling-cells': 2, 'cpu-supply': [[47]], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 45}, '$nodename': ['cpu@0']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: cpu@0: False schema does not allow {'compatible': ['thead,c906', 'riscv'], 'device_type': ['cpu'], 'reg': [[0]], 'clocks': [[4, 132]], 'd-cache-block-size': 64, 'd-cache-sets': 256, 'd-cache-size': 32768, 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 32768, 'mmu-type': ['riscv,sv39'], 'operating-points-v2': [[41]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], '#cooling-cells': 2, 'cpu-supply': [[42]], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 40}, '$nodename': ['cpu@0']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
--
>> arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb: cpu@0: False schema does not allow {'compatible': ['sifive,e51', 'sifive,rocket0', 'riscv'], 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 16384, 'reg': [[0]], 'riscv,isa': ['rv64imac'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627415296, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'status': ['disabled'], 'phandle': 2, 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, 'phandle': 7}, '$nodename': ['cpu@0']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb: cpu@1: False schema does not allow {'compatible': ['sifive,u54-mc', 'sifive,rocket0', 'riscv'], 'd-cache-block-size': 64, 'd-cache-sets': 64, 'd-cache-size': 32768, 'd-tlb-sets': 1, 'd-tlb-size': 32, 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 64, 'i-cache-size': 32768, 'i-tlb-sets': 1, 'i-tlb-size': 32, 'mmu-type': ['riscv,sv39'], 'reg': [[1]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'tlb-split': True, 'next-level-cache': [[1]], 'phandle': 3, 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, 'phandle': 8}, '$nodename': ['cpu@1']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb: cpu@1: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb: cpu@2: False schema does not allow {'compatible': ['sifive,u54-mc', 'sifive,rocket0', 'riscv'], 'd-cache-block-size': 64, 'd-cache-sets': 64, 'd-cache-size': 32768, 'd-tlb-sets': 1, 'd-tlb-size': 32, 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 64, 'i-cache-size': 32768, 'i-tlb-sets': 1, 'i-tlb-size': 32, 'mmu-type': ['riscv,sv39'], 'reg': [[2]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'tlb-split': True, 'next-level-cache': [[1]], 'phandle': 4, 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, 'phandle': 9}, '$nodename': ['cpu@2']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb: cpu@2: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb: cpu@3: False schema does not allow {'compatible': ['sifive,u54-mc', 'sifive,rocket0', 'riscv'], 'd-cache-block-size': 64, 'd-cache-sets': 64, 'd-cache-size': 32768, 'd-tlb-sets': 1, 'd-tlb-size': 32, 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 64, 'i-cache-size': 32768, 'i-tlb-sets': 1, 'i-tlb-size': 32, 'mmu-type': ['riscv,sv39'], 'reg': [[3]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'tlb-split': True, 'next-level-cache': [[1]], 'phandle': 5, 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, 'phandle': 10}, '$nodename': ['cpu@3']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb: cpu@3: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dtb: cpu@4: False schema does not allow {'compatible': ['sifive,u54-mc', 'sifive,rocket0', 'riscv'], 'd-cache-block-size': 64, 'd-cache-sets': 64, 'd-cache-size': 32768, 'd-tlb-sets': 1, 'd-tlb-size': 32, 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 64, 'i-cache-size': 32768, 'i-tlb-sets': 1, 'i-tlb-size': 32, 'mmu-type': ['riscv,sv39'], 'reg': [[4]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'tlb-split': True, 'next-level-cache': [[1]], 'phandle': 6, 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, 'phandle': 11}, '$nodename': ['cpu@4']}
--
>> arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: cpu@0: False schema does not allow {'compatible': ['sifive,bullet0', 'riscv'], 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 16384, 'next-level-cache': [[1]], 'reg': [[0]], 'riscv,isa': ['rv64imac'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627415296, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'status': ['disabled'], 'phandle': 2, 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, 'phandle': 7}, '$nodename': ['cpu@0']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: cpu@1: False schema does not allow {'compatible': ['sifive,bullet0', 'riscv'], 'd-cache-block-size': 64, 'd-cache-sets': 64, 'd-cache-size': 32768, 'd-tlb-sets': 1, 'd-tlb-size': 40, 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 32768, 'i-tlb-sets': 1, 'i-tlb-size': 40, 'mmu-type': ['riscv,sv39'], 'next-level-cache': [[1]], 'reg': [[1]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'tlb-split': True, 'phandle': 3, 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, 'phandle': 8}, '$nodename': ['cpu@1']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: cpu@1: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: cpu@2: False schema does not allow {'compatible': ['sifive,bullet0', 'riscv'], 'd-cache-block-size': 64, 'd-cache-sets': 64, 'd-cache-size': 32768, 'd-tlb-sets': 1, 'd-tlb-size': 40, 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 32768, 'i-tlb-sets': 1, 'i-tlb-size': 40, 'mmu-type': ['riscv,sv39'], 'next-level-cache': [[1]], 'reg': [[2]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'tlb-split': True, 'phandle': 4, 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, 'phandle': 9}, '$nodename': ['cpu@2']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: cpu@2: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: cpu@3: False schema does not allow {'compatible': ['sifive,bullet0', 'riscv'], 'd-cache-block-size': 64, 'd-cache-sets': 64, 'd-cache-size': 32768, 'd-tlb-sets': 1, 'd-tlb-size': 40, 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 32768, 'i-tlb-sets': 1, 'i-tlb-size': 40, 'mmu-type': ['riscv,sv39'], 'next-level-cache': [[1]], 'reg': [[3]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'tlb-split': True, 'phandle': 5, 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, 'phandle': 10}, '$nodename': ['cpu@3']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: cpu@3: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dtb: cpu@4: False schema does not allow {'compatible': ['sifive,bullet0', 'riscv'], 'd-cache-block-size': 64, 'd-cache-sets': 64, 'd-cache-size': 32768, 'd-tlb-sets': 1, 'd-tlb-size': 40, 'device_type': ['cpu'], 'i-cache-block-size': 64, 'i-cache-sets': 128, 'i-cache-size': 32768, 'i-tlb-sets': 1, 'i-tlb-size': 40, 'mmu-type': ['riscv,sv39'], 'next-level-cache': [[1]], 'reg': [[4]], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'tlb-split': True, 'phandle': 6, 'interrupt-controller': {'#interrupt-cells': 1, 'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, 'phandle': 11}, '$nodename': ['cpu@4']}
--
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: cpu@0: False schema does not allow {'compatible': ['thead,c910', 'riscv'], 'device_type': ['cpu'], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'reg': [[0]], 'i-cache-block-size': 64, 'i-cache-size': 65536, 'i-cache-sets': 512, 'd-cache-block-size': 64, 'd-cache-size': 65536, 'd-cache-sets': 512, 'next-level-cache': [[1]], 'mmu-type': ['riscv,sv39'], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 3}, '$nodename': ['cpu@0']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: cpu@1: False schema does not allow {'compatible': ['thead,c910', 'riscv'], 'device_type': ['cpu'], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'reg': [[1]], 'i-cache-block-size': 64, 'i-cache-size': 65536, 'i-cache-sets': 512, 'd-cache-block-size': 64, 'd-cache-size': 65536, 'd-cache-sets': 512, 'next-level-cache': [[1]], 'mmu-type': ['riscv,sv39'], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 4}, '$nodename': ['cpu@1']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: cpu@1: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: cpu@2: False schema does not allow {'compatible': ['thead,c910', 'riscv'], 'device_type': ['cpu'], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'reg': [[2]], 'i-cache-block-size': 64, 'i-cache-size': 65536, 'i-cache-sets': 512, 'd-cache-block-size': 64, 'd-cache-size': 65536, 'd-cache-sets': 512, 'next-level-cache': [[1]], 'mmu-type': ['riscv,sv39'], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 5}, '$nodename': ['cpu@2']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: cpu@2: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: cpu@3: False schema does not allow {'compatible': ['thead,c910', 'riscv'], 'device_type': ['cpu'], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'reg': [[3]], 'i-cache-block-size': 64, 'i-cache-size': 65536, 'i-cache-sets': 512, 'd-cache-block-size': 64, 'd-cache-size': 65536, 'd-cache-sets': 512, 'next-level-cache': [[1]], 'mmu-type': ['riscv,sv39'], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 6}, '$nodename': ['cpu@3']}
--
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: cpu@0: False schema does not allow {'compatible': ['thead,c910', 'riscv'], 'device_type': ['cpu'], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'reg': [[0]], 'i-cache-block-size': 64, 'i-cache-size': 65536, 'i-cache-sets': 512, 'd-cache-block-size': 64, 'd-cache-size': 65536, 'd-cache-sets': 512, 'next-level-cache': [[1]], 'mmu-type': ['riscv,sv39'], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 3}, '$nodename': ['cpu@0']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: cpu@0: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: cpu@1: False schema does not allow {'compatible': ['thead,c910', 'riscv'], 'device_type': ['cpu'], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'reg': [[1]], 'i-cache-block-size': 64, 'i-cache-size': 65536, 'i-cache-sets': 512, 'd-cache-block-size': 64, 'd-cache-size': 65536, 'd-cache-sets': 512, 'next-level-cache': [[1]], 'mmu-type': ['riscv,sv39'], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 4}, '$nodename': ['cpu@1']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: cpu@1: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: cpu@2: False schema does not allow {'compatible': ['thead,c910', 'riscv'], 'device_type': ['cpu'], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'reg': [[2]], 'i-cache-block-size': 64, 'i-cache-size': 65536, 'i-cache-sets': 512, 'd-cache-block-size': 64, 'd-cache-size': 65536, 'd-cache-sets': 512, 'next-level-cache': [[1]], 'mmu-type': ['riscv,sv39'], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 5}, '$nodename': ['cpu@2']}
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: cpu@2: Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: cpu@3: False schema does not allow {'compatible': ['thead,c910', 'riscv'], 'device_type': ['cpu'], 'riscv,isa': ['rv64imafdc'], 'riscv,isa-base': ['rv64i'], 'riscv,isa-extensions': [1761635584, 1627416064, 1677746944, 2053727086, 1953628282, 1768125298, 8022374, 1701733221, 1761639017, 1752198400], 'reg': [[3]], 'i-cache-block-size': 64, 'i-cache-size': 65536, 'i-cache-sets': 512, 'd-cache-block-size': 64, 'd-cache-size': 65536, 'd-cache-sets': 512, 'next-level-cache': [[1]], 'mmu-type': ['riscv,sv39'], 'interrupt-controller': {'compatible': ['riscv,cpu-intc'], 'interrupt-controller': True, '#interrupt-cells': 1, 'phandle': 6}, '$nodename': ['cpu@3']}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
