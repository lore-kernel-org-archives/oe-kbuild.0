Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FD1379EF0
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 18:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772563707; cv=none; b=BMAITNnHGIwl8Sj5HlzAYTtiolVJnSF7XmbwZAzi0BdOa3eeYU7l5LmJKgL5CZBugmFNUJmgwmcF9V7OImMHOUuWCgGUVr6cuSAD2qlBHBBjvAiMM1W+hEIsR+zavZ8rVwcTRG7VPmTZEnsi5Bjcvv2rI8igtPuv1XAMr+YAaVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772563707; c=relaxed/simple;
	bh=l12oGy0X61hkVqPQ1ye7wQPKx3pWLBQozEB0mWZMpLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s3zbd18ZnGvC3pfxx/ExDo3Vwk3nU0jzw32s6x7HJz4PsLvCkHUHVyAGNcU8ijfQXveJ95WBPuH+x4EYCcrK0JIFMHyrNURT+oFK6BHKw9XVBegB1uKhN3ngh+dQUxBLHxfOePMwz6pGPl4Adkx3Fst+H9rMGG6ViXlrRi+luxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aALENl4P; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aALENl4P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772563702; x=1804099702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l12oGy0X61hkVqPQ1ye7wQPKx3pWLBQozEB0mWZMpLE=;
  b=aALENl4P07FErCvSMOXBM0xtfCKI7BL+EF+QfkWKSWKvJMc3K6qum5+M
   VouH/99sO9JD1gPjAGHYpsVOt5K7CLXx0PKaxztZzzX18ZkLkdIQywpfH
   qGsRnRx9sgturEoSxWuQeLpw5KYMZb6MV6/7jQdaLdcSSbKPjAsRG6WG8
   E1aLmniHmcGh799PM7TBvKlqO723fhoZkzNrlfN380OWPUxRvE1K0DqV5
   veD2cZEgS/G8g/1a9KHZFrhMBc7CYS0xV0vSUEFglHp82kNtpmmDty5MP
   PATqRrGU4+wheTu0cGpArzzmnwSAXwQWLY53pM2MmDjn5IXgzNKxVcNZ2
   w==;
X-CSE-ConnectionGUID: 9dZFHmG8SGq9kBFdG2lBTg==
X-CSE-MsgGUID: nrkf1UGqSuOlXwlRhj9WSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="84957347"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="84957347"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 10:48:21 -0800
X-CSE-ConnectionGUID: 9G0xpW9aSVGPG0CQcnWrzA==
X-CSE-MsgGUID: N6bvTdxzRKevdubvTdXiiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="244889651"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 03 Mar 2026 10:48:20 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxUn4-000000001WX-0XWV;
	Tue, 03 Mar 2026 18:48:18 +0000
Date: Tue, 3 Mar 2026 19:47:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v13 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
Message-ID: <202603031928.CONFvjoJ-lkp@intel.com>
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
In-Reply-To: <20260303092006.263715-2-a0987203069@gmail.com>
References: <20260303092006.263715-2-a0987203069@gmail.com>
TO: Joey Lu <a0987203069@gmail.com>
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: mcoquelin.stm32@gmail.com
TO: richardcochran@gmail.com
CC: alexandre.torgue@foss.st.com
CC: joabreu@synopsys.com
CC: ychuang3@nuvoton.com
CC: schung@nuvoton.com
CC: yclu4@nuvoton.com
CC: peppe.cavallaro@st.com
CC: linux-arm-kernel@lists.infradead.org
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: openbmc@lists.ozlabs.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: Joey Lu <a0987203069@gmail.com>

Hi Joey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-net-nuvoton-Add-schema-for-Nuvoton-MA35-family-GMAC/20260303-172422
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260303092006.263715-2-a0987203069%40gmail.com
patch subject: [PATCH net-next v13 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arc-randconfig-2051-20260303 (https://download.01.org/0day-ci/archive/20260303/202603031928.CONFvjoJ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603031928.CONFvjoJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603031928.CONFvjoJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: soc100 (abilis,tb10x): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: soc100 (abilis,tb10x): clkdiv_cpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: soc100 (abilis,tb10x): $nodename:0: 'soc100' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100: failed to match any schema with compatible: ['abilis,tb10x', 'simple-bus']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/iomux@ff10601c: failed to match any schema with compatible: ['abilis,tb10x-iomux']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: uart@ff100000 (snps,dw-apb-uart): $nodename:0: 'uart@ff100000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): clocks: [[6]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): compatible:1: 'snps,dwmac-3.70a' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arc/boot/dts/abilis_tb100_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000 (snps,dma-spear1340): $nodename:0: 'dma@fe000000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: dma@fe000000 (snps,dma-spear1340): dma-requests: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/spi@fe010000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/spi@fe011000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-tsm@ff316000: failed to match any schema with compatible: ['abilis,tb100-tsm']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-stream-proc: failed to match any schema with compatible: ['abilis,tb100-streamproc']
   arch/arc/boot/dts/abilis_tb100_dvk.dtb: /soc100/tb10x-mdscr@ff300000: failed to match any schema with compatible: ['abilis,tb100-mdscr']
--
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: soc100 (abilis,tb10x): oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: soc100 (abilis,tb10x): interrupt-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: soc100 (abilis,tb10x): $nodename:0: 'soc100' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100: failed to match any schema with compatible: ['abilis,tb10x', 'simple-bus']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/iomux@ff10601c: failed to match any schema with compatible: ['abilis,tb10x-iomux']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: uart@ff100000 (snps,dw-apb-uart): $nodename:0: 'uart@ff100000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/snps-dw-apb-uart.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): clock-names: ['stmmaceth'] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): clocks: [[6]] is too short
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): compatible:1: 'snps,dwmac-3.70a' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/arc/boot/dts/abilis_tb101_dvk.dtb: ethernet@fe100000 (snps,dwmac-3.70a): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: dma@fe000000 (snps,dma-spear1340): $nodename:0: 'dma@fe000000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: dma@fe000000 (snps,dma-spear1340): dma-requests: 0 is less than the minimum of 1
   	from schema $id: http://devicetree.org/schemas/dma/snps,dma-spear1340.yaml
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/spi@fe010000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/spi@fe011000: failed to match any schema with compatible: ['abilis,tb100-spi']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-tsm@ff316000: failed to match any schema with compatible: ['abilis,tb100-tsm']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-stream-proc: failed to match any schema with compatible: ['abilis,tb100-streamproc']
   arch/arc/boot/dts/abilis_tb101_dvk.dtb: /soc100/tb10x-mdscr@ff300000: failed to match any schema with compatible: ['abilis,tb100-mdscr']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
