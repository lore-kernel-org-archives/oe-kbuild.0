Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4BA3D6F
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 18:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746209309; cv=none; b=jkGfNC1FqcJyXb2WVL6sjRolxjOfSUR5td3EixnBXpLGlSYdXka/4JsBx0TAsq/3Oz+DrTKmxRj25G6PpozzZpaggzvtGPCrePVENcazt7ZXv5TMOAqZUumFE3LsoGo6CFitvVd34X7mKmAdGW3DueNKZr/mPAH45qidw/ZcRi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746209309; c=relaxed/simple;
	bh=aFMASSvIirDDjYKhxV2n31gJA/HQfeTlH2UbxAnZluI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gDAFZRqe83omhqplfpZi4kut+sC57MwIyM7CK3ZUBeoRGJAwPKKnD8MvYhBu6wRYDMIKHCDv0W+uF0j7yknl4el0+JptfsMT2GLAAj4K5qPb2xnDtGaQk564g0/LEiqy33SiACCaCOBybvpEP+CmwRG49xpx2IX5X57InT2FPtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZHrbIie; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZHrbIie"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746209307; x=1777745307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aFMASSvIirDDjYKhxV2n31gJA/HQfeTlH2UbxAnZluI=;
  b=gZHrbIiePxHTPq9dmwq5Mr93O5bamEBqI38M+l87zWJ1l/2nHFksthtT
   3Y7QOPmdcKv4vJGCNF3hlg1Tp2lxgIgOterHbBDAo9vcnVpfSWa9h+bY5
   ioHHeCXkv6C5CeYbOeM7mzMny9Vg/0F3SNhK/nOC4lnmnuWv5ZRP4wGi0
   gvr6aBmJIT1IHVlzK+eBF0D+k4LcRkspL3o8xhfYF0vcEqxuM6XKHU7tj
   7lCeWa/xdtiHjjjQ8q+oIzvqU19kn16OG6qvKKYV3qkQqsdyquYx0SuMv
   uTBKysB5mx1xllibWXaHjUv+8jX5uTyWAE0b7y+dsWxB86QkVoQqX6QAk
   w==;
X-CSE-ConnectionGUID: ein/m3gRRPO8AES5Ej5Vuw==
X-CSE-MsgGUID: SJLjdFC0R+OmD+I4MXeqRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="48035658"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="48035658"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2025 11:08:26 -0700
X-CSE-ConnectionGUID: 39kYxYhKRmq+33iekxiPAQ==
X-CSE-MsgGUID: gaKtKEkuRymRyzDY+T0JbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; 
   d="scan'208";a="134447485"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 02 May 2025 11:08:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAuoB-0004wl-0M;
	Fri, 02 May 2025 18:08:23 +0000
Date: Sat, 3 May 2025 02:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert-irq 11/44] arch/xtensa/boot/dts/virt.dtb: pic
 (cdns,xtensa-pic): '#address-cells' does not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202505030241.GSsab6QI-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert-irq
head:   271e22adde83e0cc6fce40f70c5f660bf1a8e2e3
commit: e058e18bc10d8fdda62544065f74d847d0245d8e [11/44] dt-bindings: interrupt-controller: Convert cdns,xtensa-{mx,pic} to DT schema
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: xtensa-randconfig-052-20250502 (https://download.01.org/0day-ci/archive/20250503/202505030241.GSsab6QI-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 13.3.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250503/202505030241.GSsab6QI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505030241.GSsab6QI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/xtensa/boot/dts/virt.dts:48.6-71.4: Warning (unit_address_vs_reg): /pci: node has a reg or ranges property, but no unit name
   arch/xtensa/boot/dts/virt.dtb: /: failed to match any schema with compatible: ['cdns,xtensa-iss']
   arch/xtensa/boot/dts/virt.dtb: / (cdns,xtensa-iss): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/xtensa/boot/dts/virt.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/xtensa/boot/dts/virt.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['cdns,xtensa-cpu']
>> arch/xtensa/boot/dts/virt.dtb: pic (cdns,xtensa-pic): '#address-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/cdns,xtensa-pic.yaml#
   arch/xtensa/boot/dts/virt.dtb: pci (pci-host-ecam-generic): $nodename:0: 'pci' does not match '^pcie?@'
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/xtensa/boot/dts/virt.dtb: pci (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
