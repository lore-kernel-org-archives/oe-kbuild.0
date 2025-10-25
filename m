Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AC5249E5
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 00:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351449; cv=none; b=liY1lXPtOAcGDugZb/Rou6lu/BceoK6cUscPT7tjoGw8XsXhff7bp5V4rurgIWscPn4P9zC9ovIZeqDfzNy7dBa30L8AOKECf9dOh8vfOvx792SxRn0FMsjL9WLG678oNdPr0bph/pLm7vTwHnQjZ2fIwAgtMpUcpq2IsVEiCMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351449; c=relaxed/simple;
	bh=SHxYNeNnAhPaXXhrEot6hRNf49Mp1qiPvBK1t2bwhyw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J+iMFn7YGQPjrKIpPgRjxJizOxP9O9+4gtKucdwLAUu3NLaepY7Yz3Qo5koLfDm9e6f0JL1qDcK2Mc8ZGck1VfXDWDt+qrCKwXxR2uV3WyneCys7w91F31qRD3AUqnETDu7ZWMS7eQfprh/rixUHdKKNwQ82z5MCEEO8IT+gGRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4qF3vNW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4qF3vNW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761351447; x=1792887447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SHxYNeNnAhPaXXhrEot6hRNf49Mp1qiPvBK1t2bwhyw=;
  b=U4qF3vNW5wfIMD1B17xaIn5wDsLEbcfmjJB2dOJ6UXbYPHwn/Do9dMmQ
   Q8gKDqkYuNYijiMk70fr6L6G6ok6ZR4GG5V41XX9njDR0GUFU/yaNkiq/
   xOdzzciRuNCCqYIMWfQB9zVF+PsTOGA0ut+EhxH1k66XlfoGOs+M5WqqP
   xnaSPEOoeSe4CPygdW7QivgwCA9NZGhRu+cLWBfSlf6E+OYLtlytZFbT0
   tQvAzjmEiWh5RGobfmTw1euKs3ZtLh3M9ZeE2ibBgj+VvjyO07Cahn91W
   x6DpLEea6PK3iZfeiL8k1JBil2d1AjKs1P1ZFTwWF36tFMVMMrjAj/b95
   g==;
X-CSE-ConnectionGUID: 7nOXoB9bQyOhEkiVPgYrcg==
X-CSE-MsgGUID: cYPBktCmRaehNZKNHLtZKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63235646"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63235646"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 17:17:26 -0700
X-CSE-ConnectionGUID: rRCCX4rBRCeSOcwW/QblIQ==
X-CSE-MsgGUID: K2SOLXzZQ2C6BXrOJEafjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="189790743"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 24 Oct 2025 17:17:25 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vCRyF-0000000005N-2KYs;
	Sat, 25 Oct 2025 00:17:23 +0000
Date: Sat, 25 Oct 2025 02:16:52 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/xtensa/boot/dts/virt.dtb: pic (cdns,xtensa-pic):
 '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202510250232.fQdykjEp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2818517e3486d11c9bd55aca3e14059e4c69886
commit: 1ee0fd43803bf82b5388db9b406c1b5e1a08cac8 dt-bindings: interrupt-controller: Convert cdns,xtensa-{mx,pic} to DT schema
date:   5 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 months ago
config: xtensa-randconfig-2051-20251024 (https://download.01.org/0day-ci/archive/20251025/202510250232.fQdykjEp-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
dtschema version: 2025.9.dev7+g3b6fdac89
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251025/202510250232.fQdykjEp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510250232.fQdykjEp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/xtensa/boot/dts/virt.dts:48.6-71.4: Warning (unit_address_vs_reg): /pci: node has a reg or ranges property, but no unit name
   arch/xtensa/boot/dts/virt.dtb: /: failed to match any schema with compatible: ['cdns,xtensa-iss']
   arch/xtensa/boot/dts/virt.dtb: / (cdns,xtensa-iss): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/xtensa/boot/dts/virt.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
   arch/xtensa/boot/dts/virt.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['cdns,xtensa-cpu']
>> arch/xtensa/boot/dts/virt.dtb: pic (cdns,xtensa-pic): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/cdns,xtensa-pic.yaml#
   arch/xtensa/boot/dts/virt.dtb: pci (pci-host-ecam-generic): $nodename:0: 'pci' does not match '^pcie?@'
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#
   arch/xtensa/boot/dts/virt.dtb: pci (pci-host-ecam-generic): Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'bus-range', 'device_type', 'interrupt-map', 'interrupt-map-mask' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/host-generic-pci.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
