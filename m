Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0B1610D
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 06:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754546881; cv=none; b=SrW294ZrJod060MIjfFihAa62mWw4YgAoe3Mrovy7+j0x9U+ZPi8SyzEjwVSD1knmps7q+uFcrP0Oom4KG4QFDrPMa9SvXXQinEctsz+rRHM5EY38bvBUuxbpb1dGcCxTRGRU29Ar1Pjo9rD9nwjLBuWyhzKbIjnbPE5gCD+HY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754546881; c=relaxed/simple;
	bh=8+I5p6NI8PBz5vb53lbtnNOiOpTbDR3eFW5gs8jOlzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sCJmTfWKbdzkoTCMkeokoUdkGIZ7aitqyFdDLH1NrLgpCKWcSWM18Z43SjBDxa6vkneQc1Nobsc7GYAHISronnNNgnrGbE1oSHrn+84xA+g6KkBi6qk6O9CIAR/wSpUX6xAnxE+Znpai0VO80n+fhOdAQ1oRMDcv0vrafc/Pd1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mwK81IXx; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mwK81IXx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754546879; x=1786082879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8+I5p6NI8PBz5vb53lbtnNOiOpTbDR3eFW5gs8jOlzQ=;
  b=mwK81IXx7+3orbcyXZwqixwoP0u/KXAWL/IQ/2DA98x7jLQuC29skKAI
   86BP4/UBDQzKLz+uKKJM9oPQ01Tm+JT6r0eTQBWoqzHs5Pq52Yip5WTEa
   1kcrATAfq40WXMlvGbsJI06YaKMPvRmVtEMEE6vNnX9REWvjGlX2RunGR
   fBv41q18+HwlTYVOibcEAmNLOcqYMj5U9X4LvFVoUp8nWk+TSjfnQ515a
   vU4Rdl82bS/lJPkhK7ylRSurTsiYLqqpbZKO4VJP67WsBfitQuVLj6k36
   1a/K7crIQ6m3EtFM8RSj3u1cnHOczEnxdpwUqQUqICKkwpBIfp0Wthse1
   A==;
X-CSE-ConnectionGUID: 6VqLdnxxQWaOagUmi+Zh8A==
X-CSE-MsgGUID: hPJgJoNYR6qsp/P1ZTKQ6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67571297"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67571297"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 23:07:58 -0700
X-CSE-ConnectionGUID: ffht5Q3vQeu9cJACHhs2rg==
X-CSE-MsgGUID: j2xdbYDYSjmE5VaO5eulfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165329392"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Aug 2025 23:07:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujtmz-0002Rm-0j;
	Thu, 07 Aug 2025 06:07:50 +0000
Date: Thu, 7 Aug 2025 14:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 383/801]
 arch/riscv/boot/dts/canaan/k210_generic.dtb: gpio-controller@38001000
 (canaan,k210-gpiohs): #gpio-cells: 2 was expected
Message-ID: <202508071327.e0ZoO4QA-lkp@intel.com>
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
commit: a92832e2ff52e63d0c65935767a13aaa487625e1 [383/801] dt-bindings: mux: Convert adi,adgs1408 to DT schema
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071327.e0ZoO4QA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071327.e0ZoO4QA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508071327.e0ZoO4QA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/canaan/k210_generic.dtb: gpio-controller@38001000 (canaan,k210-gpiohs): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/sifive,gpio.yaml#
>> arch/riscv/boot/dts/canaan/k210_generic.dtb: gpio-controller@38001000 (canaan,k210-gpiohs): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/canaan/k210_generic.dtb: gpio-controller@38001000 (canaan,k210-gpiohs): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/canaan/k210_generic.dtb: gpio@50200000 (snps,dw-apb-gpio): gpio-port@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/canaan/k210_generic.dtb: gpio-port@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/canaan/k210_generic.dtb: gpio-port@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20120000 (microchip,mpfs-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20120000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20120000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20121000 (microchip,mpfs-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20121000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20121000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20122000 (microchip,mpfs-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20122000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@20122000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41100000 (microchip,coregpio-rtl-v3): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41100000 (microchip,coregpio-rtl-v3): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41100000 (microchip,coregpio-rtl-v3): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41200000 (microchip,coregpio-rtl-v3): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41200000 (microchip,coregpio-rtl-v3): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@41200000 (microchip,coregpio-rtl-v3): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@44000000 (microchip,coregpio-rtl-v3): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dtb: gpio@44000000 (microchip,coregpio-rtl-v3): #gpio-cells: [2] is not of type 'integer'
--
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: gpio@20120000 (microchip,mpfs-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: gpio@20120000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: gpio@20120000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: gpio@20121000 (microchip,mpfs-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: gpio@20121000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: gpio@20121000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: gpio@20122000 (microchip,mpfs-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtb: gpio@20122000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: gpio@20120000 (microchip,mpfs-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: gpio@20120000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: gpio@20120000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: gpio@20121000 (microchip,mpfs-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: gpio@20121000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: gpio@20121000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: gpio@20122000 (microchip,mpfs-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: gpio@20122000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: gpio@20120000 (microchip,mpfs-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: gpio@20120000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: gpio@20120000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: gpio@20121000 (microchip,mpfs-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: gpio@20121000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: gpio@20121000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: gpio@20122000 (microchip,mpfs-gpio): #gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/microchip,mpfs-gpio.yaml#
   arch/riscv/boot/dts/microchip/mpfs-sev-kit.dtb: gpio@20122000 (microchip,mpfs-gpio): #gpio-cells: [2] is not of type 'integer'
--
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: gpio@3020000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: gpio@3021000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: gpio@3022000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: gpio@3023000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: gpio@3020000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: gpio@3021000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: gpio@3022000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: gpio@3023000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: gpio@3020000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: gpio@3021000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: gpio@3022000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: gpio@3023000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
--
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: gpio@d4019000 (spacemit,k1-gpio): #gpio-cells: 3 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: gpio@d4019000 (spacemit,k1-gpio): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: gpio@d4019000 (spacemit,k1-gpio): #gpio-cells: [3] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: serial@f0612000 (spacemit,k1-uart): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: serial@f0612000 (spacemit,k1-uart): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
--
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio@ffe7f34000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio@ffe7f38000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio@ffec005000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio@ffec006000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio@fffff41000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio@fffff52000 (snps,dw-apb-gpio): gpio-controller@0:#gpio-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: gpio-controller@0 (snps,dw-apb-gpio-port): #gpio-cells: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
