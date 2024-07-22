Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DBED53F
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jul 2024 07:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721632582; cv=none; b=NZU+LU3Y3PIY/UoARx7YTx7r7l2T+fOoe0FlUUi6UcpEZjP+pwpUz5kL9vYb66IG1FWtFk0y2Czln5btT1IWP0yTaGhI0Z2Sqbb3esioxmUUs5rIv3y047/6NgP6hYA6wgGiXBdxK686bbiGhd4YK1gFIC5gRF+S/Z5GAgQqONY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721632582; c=relaxed/simple;
	bh=df4ElZxXRjd7ezC4iTtkYHNIY0C9XvCnMrQY9uoPnUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gOv0m7rpvQ+5/POvc4SNAC02MsMqCZEOqXLgaWDQMhswBNJwdRYw+9Jlo/GLldS0/JsgIR6P1oK8zCfpJXJzZIjdqQeE/e5d7fdD6N+yZMFamjhqGrBV0SW5TRyA0ux2uB0tESIixrjkI9qTU322c+G8qpGNbfgUqK30POQwb3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CODt5Rx/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CODt5Rx/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721632579; x=1753168579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=df4ElZxXRjd7ezC4iTtkYHNIY0C9XvCnMrQY9uoPnUo=;
  b=CODt5Rx/OG/MXMPyVhS54TlwKEKaUcgDI5FJEdVKspLSWrptJ2It2VKj
   2R8YtM4UeinL+H7YIN75+9msFoJV4GpRfbC734lAfx1eDgDz4ebhs/KRz
   Cg5rBS6Jf6IugRDK7CK0Aq8Pmh7ZNgm25yhHpZh42AaqarC9o3kAw77SS
   LGJ37X2jqjsAyIggt10mclkXKk0BEc63GOgVHmDatno4n/Trx5XYBn6kw
   +DXlf314Sx2qN3irkl1NgeQFQQp3wEspK9WbdNmfruPEObOLGDcSboZKk
   xetG1aTbRFh8emxioUIiX1q1uNZcpehtbEYt4973ZiwGgDWph3xOTlIEQ
   Q==;
X-CSE-ConnectionGUID: H8jsbnLKTsmA6kkzIfy0VQ==
X-CSE-MsgGUID: 0zY8S1X+QZecTpAPtFeGHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="19333572"
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="19333572"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 00:16:19 -0700
X-CSE-ConnectionGUID: 2BYkz4xmTD2wn35kZknOiw==
X-CSE-MsgGUID: dTM8f/RrTj+yaN9MlboslQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,227,1716274800"; 
   d="scan'208";a="75008530"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Jul 2024 00:16:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVnHM-000kyq-0F;
	Mon, 22 Jul 2024 07:16:16 +0000
Date: Mon, 22 Jul 2024 15:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 43/43]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: soc: cpurst: 'ranges' is
 a required property
Message-ID: <202407221520.aJBnOHDB-lkp@intel.com>
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
TO: Han Gao <gaohan@iscas.ac.cn>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux th1520
head:   350a58164ab57fa986bd3dadd6c975d3f6e39fcf
commit: 350a58164ab57fa986bd3dadd6c975d3f6e39fcf [43/43] [NOT-FOR-UPSTREAM] riscv: dts: thead: Add TH1520 CPU reset node
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: riscv-randconfig-051-20240722 (https://download.01.org/0day-ci/archive/20240722/202407221520.aJBnOHDB-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407221520.aJBnOHDB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407221520.aJBnOHDB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/thead/th1520.dtsi:240.18-247.5: Warning (simple_bus_reg): /soc/cpurst: missing or empty reg/ranges property
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: soc: cpurst: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/cpurst: failed to match any schema with compatible: ['thead,reset-sample']
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000: Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupt-names', 'interrupts', 'mdio', 'phy-handle', 'phy-mode', 'snps,axi-config', 'snps,fixed-burst', 'snps,multicast-filter-bins', 'snps,pbl', 'snps,perfect-filter-entries' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
--
   arch/riscv/boot/dts/thead/th1520.dtsi:240.18-247.5: Warning (simple_bus_reg): /soc/cpurst: missing or empty reg/ranges property
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: soc: cpurst: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/cpurst: failed to match any schema with compatible: ['thead,reset-sample']
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000: snps,pbl: [32] is not one of [1, 2, 4, 8, 16, 32]
   	from schema $id: http://devicetree.org/schemas/net/snps,dwmac.yaml#
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000: snps,pbl: [32] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/thead,dwmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
