Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135E114A09E
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jan 2025 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314045; cv=none; b=Hs2lAdZfPpMh4elNu6iYttTJYweZUgvaSFqCIg+1Dj1xIwkzMEqHNAzqF+7ly2PAuEDpLzakJSxsKvqEflQXU/P77IArbKvZ7yu8AYrfGElyShUHAa/WnqkpjrSDWntL7PymzIJP0AlBToaEOS4fUsbru1sQEDvQSJ15pQhBTQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314045; c=relaxed/simple;
	bh=/EMppJKSN+ItKHi/WbuJMqjQurGjMstA2BHlhAYEbNs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Swdkdv6zE2JDOlITpDNnrxhl8jA9VJvA3CXNy17JEJM0hiLr742H/oIBYPPhB/Zqt4F7nLmi0JpXBFK4Gsknzjme9byBtbPJtF1VF7s1qSU/JGTLP4spDaWiODyVI+6F9iYqMGr/vAdJSeajq6eZwTxYjkTT9qNCK+ORDdqq8ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXH5o30p; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXH5o30p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738314043; x=1769850043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/EMppJKSN+ItKHi/WbuJMqjQurGjMstA2BHlhAYEbNs=;
  b=RXH5o30pxMXhTriHFRoYcYCu8oIcNZQsusWvU7cYiDf1b6+e3puGHlGs
   lXJNDki7inIDll5xMaZwd1cRGjE24B3AOw1HsDeiqzNsZz0d2EI52tukm
   6YvbU6gv6JJjr9J8LSKVXrThVG6TaCTQ6bs1wWVrky9NJz3tkB8W/0aGx
   O7xNmP8fVSS023AHhPP4O8IaKdtuHsIWDnI88nkLyyzFa9/L3wCcpGegb
   JerJbOG4QA+Uiga2NhwUNVVjh012puLjtlq6vftnFLf7scCGKecdzbmoi
   yWBiDFbxJRUELeyjGI6QZZNHN7rMrN5LjtctQK349qRYo2TgVfJpWwaa+
   A==;
X-CSE-ConnectionGUID: hmuzXunpTWa5qYGzhFx8Mg==
X-CSE-MsgGUID: t3ddutPGRWWcqvTYNKK+og==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="42535717"
X-IronPort-AV: E=Sophos;i="6.13,248,1732608000"; 
   d="scan'208";a="42535717"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 01:00:42 -0800
X-CSE-ConnectionGUID: riIqwOSwTzuLWylt5znz3w==
X-CSE-MsgGUID: hAWNBvUJTNmmiMiI0hQEhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132836387"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2025 01:00:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tdmtC-000mD3-3C;
	Fri, 31 Jan 2025 09:00:38 +0000
Date: Fri, 31 Jan 2025 17:00:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-msiof-2025-01-30 2/2]
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: spi@e6e90000: compatible:0:
 'anyOf' conditional failed, one must be fixed:
Message-ID: <202501311602.5J5mpmqI-lkp@intel.com>
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
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux sound-msiof-2025-01-30
head:   d9a82c93cca8d2f5381062d77bbab0736dd6dc5b
commit: d9a82c93cca8d2f5381062d77bbab0736dd6dc5b [2/2] msiof
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-051-20250131 (https://download.01.org/0day-ci/archive/20250131/202501311602.5J5mpmqI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250131/202501311602.5J5mpmqI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501311602.5J5mpmqI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:53.18-59.4: Warning (spi_bus_reg): /soc/spi@e6e90000/port: missing or empty reg property
   arch/arm64/boot/dts/renesas/r8a77960.dtsi:1436.24-1450.5: Warning (avoid_unnecessary_addr_size): /soc/spi@e6e90000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:33.8-42.4: Warning (avoid_unnecessary_addr_size): /dummy: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: spi@e6e90000: compatible:0: 'anyOf' conditional failed, one must be fixed:
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(condor|falcon|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,smp-sram']
--
   	'renesas,msiof_sound-gen3' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-gen3' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-gen3' is not one of ['renesas,smp-sram']
   	'renesas,msiof_sound-gen3' does not match '^(?!renesas,.+-.+).+$'
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
--
   arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:53.18-59.4: Warning (spi_bus_reg): /soc/spi@e6e90000/port: missing or empty reg property
   arch/arm64/boot/dts/renesas/r8a77960.dtsi:1436.24-1450.5: Warning (avoid_unnecessary_addr_size): /soc/spi@e6e90000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts:33.8-42.4: Warning (avoid_unnecessary_addr_size): /dummy: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: spi@e6e90000: compatible:0: 'anyOf' conditional failed, one must be fixed:
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(emev2|r(7s|8a|9a)[a-z0-9]+|rcar|rmobile|rz[a-z0-9]*|sh(7[a-z0-9]+)?|mobile)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(condor|falcon|gr-peach|gray-hawk|salvator|sk-rz|smar(c(2)?)?|spider|white-hawk)(.*)?$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-r8a7796' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-r8a7796' is not one of ['renesas,smp-sram']
--
   	'renesas,msiof_sound-gen3' does not match '^renesas,(can|cpg|dmac|du|(g)?ether(avb)?|gpio|hscif|(r)?i[i2]c|imr|intc|ipmmu|irqc|jpu|mmcif|msiof|mtu2|pci(e)?|pfc|pwm|[rq]spi|rcar_sound|sata|scif[ab]*|sdhi|thermal|tmu|tpu|usb(2|hs)?|vin|xhci)-[a-z0-9-]+$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,(d|s)?bsc(3)?-(r8a73a4|r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,em-(gio|sti|uart)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,fsi2-(r8a7740|sh73a0)$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,hspi-r8a777[89]$'
   	'renesas,msiof_sound-gen3' does not match '^renesas,sysc-(r8a73a4|r8a7740|rmobile|sh73a0)$'
   	'renesas,msiof_sound-gen3' is not one of ['renesas,imr-lx4', 'renesas,mtu2-r7s72100']
   	'renesas,msiof_sound-gen3' is not one of ['renesas,smp-sram']
   	'renesas,msiof_sound-gen3' does not match '^(?!renesas,.+-.+).+$'
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas-soc.yaml#
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']
>> arch/arm64/boot/dts/renesas/r8a77960-ulcb-kf.dtb: /soc/spi@e6e90000: failed to match any schema with compatible: ['renesas,msiof_sound-r8a7796', 'renesas,msiof_sound-gen3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
