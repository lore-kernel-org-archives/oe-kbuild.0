Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345AB329361
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 13:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770729080; cv=none; b=QvaQA7Eorpimt7N+gQici385u59h3lNCuJHXk4YHekx8DjeOnHoqDH72tR7yN4kjPARpeNeVoUXxobbRP8b+5mtkhjkp+isVGdYO0x3lOtFcElHpoG049NzG2V+xsgWd7Z3GqQ2zHWp4rPjHCNYRVvK8uTNU7mOGScMWDhKkrxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770729080; c=relaxed/simple;
	bh=3TbFRkZqyMht8ymOSTPjIuJns2e36c75ddWwILRDtaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E6RjAzEE+ENbMevpdXmwwVSVo7zRseLacVvb256sqX5Q7f8/YtojAM4MuPRhqe99C0BjlhsWkGDaf79Lp/PhZMNNmq3Jzu+aJMbo2hro2J988cPx9s8j/KqcELlw/nuXEQ9h8dxPkp39h7YQnf9k8bpEWdXHakWPbIU2slPT1ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCLbRDNJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCLbRDNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770729077; x=1802265077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3TbFRkZqyMht8ymOSTPjIuJns2e36c75ddWwILRDtaQ=;
  b=CCLbRDNJp20nwSpcdbOCjXTlm01VoF1IWpgdOfZdeKxBKVaN9RY7+hyL
   FljkxLCS1tiyESuDwPQlHg5lunQKItC9apv5z5WoaUbBBbUdOdZztWseS
   gI7SFq1VYioA3N5IFSyho3qZW7+wpbcSx2NJj09dIe5lxKVxIvdFodjEA
   45+D1zV1uyVpqrPMC0XXmF1R+7wGRNPOnJnEy5wkji2yHqflyWBSGjqKN
   EFqSpo02l9xVgT3AXwActWOUKYTplfDvDHY15i/qZRdF58/TWhZtotDop
   MlAfKqU5FRHom0b8o3XJYMGzu6ctjI1qXCivCYRnMhzW7x7hQJ4ZsOchD
   w==;
X-CSE-ConnectionGUID: s02hB7aaQjKJlqJ/4iRSPg==
X-CSE-MsgGUID: R/TCbhmhTbigsQx1e6Hndw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71926750"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71926750"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 05:11:16 -0800
X-CSE-ConnectionGUID: qGey/+z5SUWOX4BaY9omBA==
X-CSE-MsgGUID: Vfv8FbN0TN2GNoHv74YT4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="234885454"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Feb 2026 05:11:15 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpnWK-000000000ov-2Tje;
	Tue, 10 Feb 2026 13:11:12 +0000
Date: Tue, 10 Feb 2026 14:10:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v12 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
Message-ID: <202602101438.Tm2CVQYD-lkp@intel.com>
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
In-Reply-To: <20260210052226.3005666-2-a0987203069@gmail.com>
References: <20260210052226.3005666-2-a0987203069@gmail.com>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Joey-Lu/dt-bindings-net-nuvoton-Add-schema-for-Nuvoton-MA35-family-GMAC/20260210-132802
base:   net-next/main
patch link:    https://lore.kernel.org/r/20260210052226.3005666-2-a0987203069%40gmail.com
patch subject: [PATCH net-next v12 1/3] dt-bindings: net: nuvoton: Add schema for Nuvoton MA35 family GMAC
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: riscv-randconfig-2051-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101438.Tm2CVQYD-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101438.Tm2CVQYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602101438.Tm2CVQYD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): compatible:0: 'sophgo,cv1800b-dwmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): phy-mode:0: 'internal' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): compatible:0: 'sophgo,cv1800b-dwmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): phy-mode:0: 'internal' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): compatible:0: 'sophgo,cv1800b-dwmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): phy-mode:0: 'internal' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): clock-names: ['stmmaceth', 'pclk', 'apb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): clocks: [[9, 48], [9, 44], [9, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): compatible:0: 'thead,th1520-gmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): reg: [[255, 3875930112, 0, 8192], [255, 3959439360, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): clock-names: ['stmmaceth', 'pclk', 'apb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): clocks: [[9, 48], [9, 50], [9, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): compatible:0: 'thead,th1520-gmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): reg: [[255, 3875995648, 0, 8192], [255, 3959435264, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000 (thead,th1520-gmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000 (thead,th1520-gmac): clock-names: ['stmmaceth', 'pclk', 'apb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000 (thead,th1520-gmac): clocks: [[9, 48], [9, 44], [9, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000 (thead,th1520-gmac): compatible:0: 'thead,th1520-gmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000 (thead,th1520-gmac): reg: [[255, 3875930112, 0, 8192], [255, 3959439360, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): clock-names: ['stmmaceth', 'pclk', 'apb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): clocks: [[9, 48], [9, 50], [9, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): compatible:0: 'thead,th1520-gmac' is not one of ['nuvoton,ma35d1-dwmac']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): reg: [[255, 3875995648, 0, 8192], [255, 3959435264, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
