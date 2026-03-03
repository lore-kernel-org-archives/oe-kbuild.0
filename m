Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83D51E7C12
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 21:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772573545; cv=none; b=qHDZonMovm1SBfYP1WCKD5y9yFMcRxiigP+dDVpez7ichgxVUJs6sUXg/W/aRaUa5PGiP4xVTpTvCeaO+kvaL4Vbar2J6CJ9KtkjpAlOr/7PDX0uJEVTJbAAINqVqaRyJnr3aus2GJ1N0cyZbMD+OyCQUSWaWrg7Lx6z/auf4FQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772573545; c=relaxed/simple;
	bh=OtyPm9vcLkCFz94hB1nGz4sR/Ye2W5Kiy7Fs8CQRelY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VgfZKKb9FJg+sJ/TR6M67oGLQhnoZ8tjIE1endZSt+ZasLnTmrBghpHdxQfGxsHeF4b5MmYRsDWOt6KdwxrtdQWj1KICW+ILejfZg/uU2svbNooIxYBzO0X1yZTBfjxxpmRPZDY0cOJ0yRDcB6wa4zfYZig7FlA6B92N1e6XuE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifHaTzfk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifHaTzfk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772573543; x=1804109543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OtyPm9vcLkCFz94hB1nGz4sR/Ye2W5Kiy7Fs8CQRelY=;
  b=ifHaTzfkCNVQzUVWI3eD7Wk4rE0Nmz3W4clg5/nC62MisGi+phsukUUo
   2i8buk/5o83SgsU+9QMapqyrS7zGXFGww1ZgshdouJGkOpQYNvu344RMg
   AEMfXBJ4QUgdAqx6fGFcbV7XRJcmwJs00FMYk/B4by72cJr5ukWtxaPV0
   N4c7AaJGl5u+w5SZBEC+GxkOO+cFO2LNwwS2y5mNAFUpesNVK1ukGPKwz
   TrStpbPzHJbzugzg+rYB/qrrUVoC7b5C0/6ngaH0sUui82aR8tOssHiMR
   AnaXfKdXWhynTKG0WbBQnP9SdBRgwrdhUWMKVtfYoMG+Lzap1As0SekhH
   Q==;
X-CSE-ConnectionGUID: VvedIjICRI2lQJKrgH3PUQ==
X-CSE-MsgGUID: T4RRMK0dSJGiGOPpu2snrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="99101070"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="99101070"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 13:32:22 -0800
X-CSE-ConnectionGUID: V7sEOtnlRsG2aOZgQEjJfg==
X-CSE-MsgGUID: 50Pj17QuQzevQ9vecJreTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="216467227"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 03 Mar 2026 13:32:21 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxXLn-000000001Y1-1FaO;
	Tue, 03 Mar 2026 21:32:19 +0000
Date: Tue, 3 Mar 2026 22:31:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next v13 1/3] dt-bindings: net: nuvoton: Add schema
 for Nuvoton MA35 family GMAC
Message-ID: <202603032200.O8iHLENY-lkp@intel.com>
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
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-2051-20260303 (https://download.01.org/0day-ci/archive/20260303/202603032200.O8iHLENY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603032200.O8iHLENY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603032200.O8iHLENY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): phy-mode:0: 'internal' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): phy-mode:0: 'internal' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: ethernet@4070000 (sophgo,cv1800b-dwmac): phy-mode:0: 'internal' is not one of ['rmii', 'rgmii', 'rgmii-id', 'rgmii-txid', 'rgmii-rxid']
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
--
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): clock-names: ['stmmaceth', 'pclk', 'apb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): clocks: [[9, 48], [9, 44], [9, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): reg: [[255, 3875930112, 0, 8192], [255, 3959439360, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7060000 (thead,th1520-gmac): Unevaluated properties are not allowed ('reg-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): clock-names: ['stmmaceth', 'pclk', 'apb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): clocks: [[9, 48], [9, 50], [9, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): reg: [[255, 3875995648, 0, 8192], [255, 3959435264, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: ethernet@ffe7070000 (thead,th1520-gmac): Unevaluated properties are not allowed ('reg-names' was unexpected)
--
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000 (thead,th1520-gmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000 (thead,th1520-gmac): clock-names: ['stmmaceth', 'pclk', 'apb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000 (thead,th1520-gmac): clocks: [[9, 48], [9, 44], [9, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000 (thead,th1520-gmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7060000 (thead,th1520-gmac): reg: [[255, 3875930112, 0, 8192], [255, 3959439360, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): clock-names:1: 'ptp_ref' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): clock-names: ['stmmaceth', 'pclk', 'apb'] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): clocks: [[9, 48], [9, 50], [9, 25]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): compatible:0: 'nuvoton,ma35d1-dwmac' was expected
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): reg: [[255, 3875995648, 0, 8192], [255, 3959435264, 0, 4096]] is too long
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'nuvoton,sys' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): 'reset-names' is a required property
   	from schema $id: http://devicetree.org/schemas/net/nuvoton,ma35d1-dwmac.yaml
   arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: ethernet@ffe7070000 (thead,th1520-gmac): Unevaluated properties are not allowed ('reg-names' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
