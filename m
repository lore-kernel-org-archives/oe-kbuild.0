Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB06D1A9B5D
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 01:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889581; cv=none; b=EOWZMTp2vc+Ma5KC2zTUeNkbapxJTwOKf7qZAc0mvV8x2t9wk4uBideTJY1vZziyiQbfedD6ejQ2urpRVb6CeOSzML3aoirvW8xjs82AXOsikFZza9S08cA9k4z/Uih75XmzNh3U/I6wZSdxRsKgBff/WBFxT8wCEIHTHnG2+JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889581; c=relaxed/simple;
	bh=9s5zdg5pyzS7Q2s6Kls/wgzRypxKOVmYs1WnnGi6mB4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TUnnvegjeij0ErmkF/DFXNg25oLu1S/5WBaqvr0F0jSVAWU7mwa3zQ+lArGn4pqko0tk2/628g0D8pCk1CJ2s7FHiQMdpakL3JRFp4u1DBD/JFUSxIVi8RiovWgX2q8bVaJ1jIwGb32f1zZRUTq9jcMn8hZoVLAbR+7FynpwWe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JUgkpOq4; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JUgkpOq4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889579; x=1777425579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9s5zdg5pyzS7Q2s6Kls/wgzRypxKOVmYs1WnnGi6mB4=;
  b=JUgkpOq4a+e2Kx61exNeSbFwF6HrXGOBaqukAfP6utvbocZuIuFgdbpV
   baig2xR/PVhcWuve5s3GVa8VJSxl/LeapuNZs7Irb7O0g6xoiojgQtJ/U
   eveqzhThBljwdfC67JMf3bSMInE9vXDIyagmldCtBEsrv4wEp3uZDPw9o
   xGvLJlcxvit/wJvgfIbhR8ijx/NgkfSmedjkEiQ9ZGnAuZuubkncxAPFt
   v3JuWa6eBkGksMwPiNXDmwluUXMtIN2fvuORvcKVS0lYePhn9lfl0ITbr
   x5vsgrlZGtFx5V1KeCFhdwG+yUD5Ah7VaXGC79eMUBaEwA5IDxXFcSSv4
   g==;
X-CSE-ConnectionGUID: EcHDVqSFQDiSgUnuq/Mjmg==
X-CSE-MsgGUID: 42RUUsAITIuDI/Vx2WKs6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51313344"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51313344"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:39 -0700
X-CSE-ConnectionGUID: MOorTxrLQvWInKrF/IHZJw==
X-CSE-MsgGUID: QAv8rjqnRYWNHPvAxVQ/eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164637883"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Apr 2025 18:19:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdI-0000Lh-07;
	Tue, 29 Apr 2025 01:19:36 +0000
Date: Tue, 29 Apr 2025 02:13:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000
 (snps,dma-spear1340): Unevaluated properties are not allowed ('dma-requests'
 was unexpected)
Message-ID: <202504290257.inzVvTju-lkp@intel.com>
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
TO: Rob Herring <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>
CC: Serge Semin <fancer.lancer@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b4432656b36e5cc1d50a1f2dc15357543add530e
commit: 7eccb5a5b224be42431c8087c9c9e016636ff3b5 dt-bindings: dma: snps,dma-spear1340: Fix data{-,_}width schema
date:   1 year, 1 month ago
:::::: branch date: 20 hours ago
:::::: commit date: 1 year, 1 month ago
config: arc-randconfig-052-20250428 (https://download.01.org/0day-ci/archive/20250429/202504290257.inzVvTju-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290257.inzVvTju-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504290257.inzVvTju-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100: failed to match any schema with compatible: ['abilis,tb10x', 'simple-bus']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/iomux@ff10601c: failed to match any schema with compatible: ['abilis,tb10x-iomux']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/interrupt-controller: failed to match any schema with compatible: ['snps,arc700-intc']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/pic@fe002000: failed to match any schema with compatible: ['abilis,tb10x-ictl']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: uart@ff100000 (snps,dw-apb-uart): $nodename:0: 'uart@ff100000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000 (snps,dma-spear1340): $nodename:0: 'dma@fe000000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000 (snps,dma-spear1340): dma-requests: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000 (snps,dma-spear1340): Unevaluated properties are not allowed ('dma-requests' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/spi@fe010000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/spi@fe011000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-tsm@ff316000: failed to match any schema with compatible: ['abilis,tb100-tsm']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-stream-proc: failed to match any schema with compatible: ['abilis,tb100-streamproc']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-mdscr@ff300000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-mdscr@ff307000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-mdscr@ff30e000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-mdscr@ff312000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-wfb@ff319000: failed to match any schema with compatible: ['abilis,tb100-wfb']
--
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100: failed to match any schema with compatible: ['abilis,tb10x', 'simple-bus']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/iomux@ff10601c: failed to match any schema with compatible: ['abilis,tb10x-iomux']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/interrupt-controller: failed to match any schema with compatible: ['snps,arc700-intc']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/pic@fe002000: failed to match any schema with compatible: ['abilis,tb10x-ictl']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: uart@ff100000 (snps,dw-apb-uart): $nodename:0: 'uart@ff100000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml#
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: dma@fe000000 (snps,dma-spear1340): $nodename:0: 'dma@fe000000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: dma@fe000000 (snps,dma-spear1340): dma-requests: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: dma@fe000000 (snps,dma-spear1340): Unevaluated properties are not allowed ('dma-requests' was unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml#
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/spi@fe010000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/spi@fe011000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-tsm@ff316000: failed to match any schema with compatible: ['abilis,tb100-tsm']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-stream-proc: failed to match any schema with compatible: ['abilis,tb100-streamproc']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-mdscr@ff300000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-mdscr@ff307000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-mdscr@ff30e000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-mdscr@ff312000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-wfb@ff319000: failed to match any schema with compatible: ['abilis,tb100-wfb']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
