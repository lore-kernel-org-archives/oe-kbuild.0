Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DD031158A
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761580434; cv=none; b=M+lNf5IEJlWwVImK0e9dIXfdSzT9pvc/w/fX6i2E7KD7ijppaGAylwrwmzDgFPf2gYNBJPNgc2/LUzy3M22fwXNwvhTICjMpSDbDVQ3GLkqqkHfS9hu9etk1T/pyIKbdOZp9wrGVHyYDJSfd8bAgQ8PFPA2o0K/VvtmTR3SnTfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761580434; c=relaxed/simple;
	bh=PeQOQJk/TcWhb1++G1KbuXWnD6S9iVMm5o8qoqDHnpM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aMYNI8SbrkUwcjDx/wiQi8VXYgA504KjUL+xf11oymSZ1Cu2tMtLIs0j6jGG9rT2tQafkWtSKFbyKfLspxPtDxpAXK6f6/yLd3HsJysMW+Eg9XiibkqSw9IjNl/zIbcgN92G5uD0fsw0ySeB3hmzXy4XANwnZBqC7heYVJGzEEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cB8BpPUG; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cB8BpPUG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761580433; x=1793116433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PeQOQJk/TcWhb1++G1KbuXWnD6S9iVMm5o8qoqDHnpM=;
  b=cB8BpPUGofjMdzgRm6f48i9U7WwSaXuvGTj3c1BvdGtLa8XLmgoZJFkN
   faaMLFMS2O1JKkWwyuNDsM/NpvTmAve6ENZafU0Myo7qFn2amwwO2gcdT
   wxc71bhTd06gDRmNcTzSZ1g+diiClkBhKy29Zke7tGw+/5ZS/kl9pWCKi
   oVy9BG1i+7NBPa4TZkW/aihgwmP19Db7oeK+s5OASw1wTeS92KPvEFKBw
   PiBGxbSySILXtKf9sUjVAV+gHGg0RdgSUAyGmPOnbD4POHBGk4b+wq4ux
   hcGLhyV/+CqgHcZdqb5f4WLPE6SMRurgqhcUxtGE4qSzHIlirQo1KvYzq
   A==;
X-CSE-ConnectionGUID: 9uSA22qKTfGZcqc5UaxzDA==
X-CSE-MsgGUID: Cv6WszwLQLusdZCqM+ATuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63365657"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="63365657"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 08:53:52 -0700
X-CSE-ConnectionGUID: o0yKAmYmQV2p/jbmzap/ag==
X-CSE-MsgGUID: WhWsNA7cTI2Wpgrto//YJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="185546764"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 Oct 2025 08:53:51 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDPXY-000Gx3-1t;
	Mon, 27 Oct 2025 15:53:48 +0000
Date: Mon, 27 Oct 2025 23:52:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/ixp4xx-netgear-wgr826v 4/8]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dtb: /
 (linksys,wrt300v2): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202510272322.GM8UEnbX-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/ixp4xx-netgear-wgr826v
head:   82097c6ad45f556e517b1b4199582fd6d24c03e4
commit: 6e99260a22efd06abec7366c62731abeb95d9b6a [4/8] ARM: dts: Add Linksys WRT300N v2 Device Tree
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-052-20251024 (https://download.01.org/0day-ci/archive/20251027/202510272322.GM8UEnbX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510272322.GM8UEnbX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510272322.GM8UEnbX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dts:95.14-147.6: Warning (avoid_unnecessary_addr_size): /soc/bus@c4000000/flash@0,0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dts:155.4-165.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dts:155.4-165.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dts:155.4-165.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dts:155.4-165.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dts:155.4-165.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dts:155.4-165.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dts:155.4-165.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dts:155.4-165.30: Warning (interrupt_map): /soc/pci@c0000000:interrupt-map: Missing property '#address-cells' in node /soc/gpio@c8004000, using 0 as fallback
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dtb: / (linksys,wrt300v2): compatible: 'oneOf' conditional failed, one must be fixed:
   	'linksys,wrt300v2' is not one of ['actiontec,mi424wr-ac', 'actiontec,mi424wr-d', 'adieng,coyote', 'arcom,vulcan', 'dlink,dsm-g600-a', 'freecom,fsg-3', 'gateway,7001', 'gateworks,gw2348', 'goramo,multilink-router', 'intel,ixdp425', 'intel,ixdpg425', 'iom,nas-100d', 'linksys,nslu2', 'linksys,wrt300nv2', 'linksys,wrv54g', 'netgear,wg302v1', 'netgear,wg302v2', 'netgear,wgr826v', 'usr,8200', 'welltech,epbx100', 'gemtek,gtwx5715']
   	'linksys,wrt300v2' is not one of ['gateworks,gw2358', 'intel,kixrp435']
   	'intel,ixp43x' was expected
   	from schema $id: http://devicetree.org/schemas/arm/intel-ixp4xx.yaml
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dtb: /: failed to match any schema with compatible: ['linksys,wrt300v2', 'intel,ixp42x']
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dtb: ethernet@c8009000 (intel,ixp4xx-ethernet): 'nvmem-cell-names', 'nvmem-cells' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/intel,ixp4xx-ethernet.yaml
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-linksys-wrt300nv2.dtb: ethernet@c800a000 (intel,ixp4xx-ethernet): 'nvmem-cell-names', 'nvmem-cells', 'nvmem-mac-minor-offset' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/intel,ixp4xx-ethernet.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
