Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C37A148837
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 12:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723466607; cv=none; b=jh5K6mtBqoaFlZNOYSWmQ8/32Sj7veHwIkoe7HBk/rb9GhO85GsC7AHBiAqtcAlDDP+FpnCLOpaSwLc4NE9NSfUVIXWGT//DD+dpCSa8vhwPKEtQuypJQvQUVnbtbwj+9NCRI34zULco1XSoHyV1J8qcC5RyW00Esp0x5L4du1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723466607; c=relaxed/simple;
	bh=ZB+tv/4qPoWykaJ7ZS0c0HFzc5wmv105vNs5kd7VsTE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tdUJ1tpGnFCFKvnzdjFb2x3TAIRPwTKTzsegQuOqJbV6fzVwo8XfPkIkBHYacCP4YRZw5p4KF1vtuypz9CFEq5c8m51b3/n7r68LcPnA6JpFgdrcAK/H3Uh7k3IlaiFbBjpzqS75Ap5LtVvSD+tKPjGPD791Sg2wzLN4kAxaWpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=maeP5aLF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="maeP5aLF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723466605; x=1755002605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZB+tv/4qPoWykaJ7ZS0c0HFzc5wmv105vNs5kd7VsTE=;
  b=maeP5aLF37W43yHTpZf1RKgXHQ1mKpAX+CsWYsysWMresUutlqazRtI2
   PZA0aVKWDgBI2C7a1XaG7R0FjOM584AbtPIvatRgHuqG247m42mtJsiH/
   0bEwZjV3PueDph6ldhC+EbWT82fDr2IIFHuDF0UdSBNUBynBC4rrn1+Os
   Im36pbTNK6WVSboyz60e4hEWsUy14crt6cI4VLufUkzVq/guYJ0YY4UEW
   rB5T5ppA3tO9lPUZIQJrVj+wip2ekBMgJSwonMzDZ6m40ilDbc8dVGqZe
   B07S3cshLUZ1UfYS/IzK8lfDpXTolpG5X0gwk7WhYEX1B9gs1a/ZbGjLq
   g==;
X-CSE-ConnectionGUID: X1K83LGLQlKNI5E3aZ1DlA==
X-CSE-MsgGUID: kDKJrHJTQ/+mJpYWZhvtyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21424946"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="21424946"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 05:43:09 -0700
X-CSE-ConnectionGUID: 8wKGD07GQ0SLUzEVaSd0oQ==
X-CSE-MsgGUID: kBeEjR4pRHiE46WRdM/wsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="63087578"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 12 Aug 2024 05:43:07 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdUO3-000BnH-2a;
	Mon, 12 Aug 2024 12:42:59 +0000
Date: Mon, 12 Aug 2024 20:42:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:for_each_port-2024-08-09 17/17]
 arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:72.10-77.4: Warning
 (unit_address_vs_reg): /soc/i2c@e6510000/codec@10/ports@0: node has a unit
 name, but no reg or ranges property
Message-ID: <202408122055.UreFUwlP-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

tree:   https://github.com/morimoto/linux for_each_port-2024-08-09
head:   b16240a7b8e984a266dec6f4ba52dbbcf760a21a
commit: b16240a7b8e984a266dec6f4ba52dbbcf760a21a [17/17] oge
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240812/202408122055.UreFUwlP-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project f86594788ce93b696675c94f54016d27a6c21d18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240812/202408122055.UreFUwlP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408122055.UreFUwlP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:72.10-77.4: Warning (unit_address_vs_reg): /soc/i2c@e6510000/codec@10/ports@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:73.10-74.67: Warning (unit_address_vs_reg): /soc/i2c@e6510000/codec@10/ports@0/port@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:73.29-58: Warning (unit_address_vs_reg): /soc/i2c@e6510000/codec@10/ports@0/port@0/endpoint@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:74.36-65: Warning (unit_address_vs_reg): /soc/i2c@e6510000/codec@10/ports@0/port@0/endpoint@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:75.10-59: Warning (unit_address_vs_reg): /soc/i2c@e6510000/codec@10/ports@0/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:75.28-57: Warning (unit_address_vs_reg): /soc/i2c@e6510000/codec@10/ports@0/port@1/endpoint@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:76.10-59: Warning (unit_address_vs_reg): /soc/i2c@e6510000/codec@10/ports@0/port@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:76.28-57: Warning (unit_address_vs_reg): /soc/i2c@e6510000/codec@10/ports@0/port@2/endpoint@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:78.10-81.4: Warning (unit_address_vs_reg): /soc/i2c@e6510000/codec@10/ports@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:79.10-80.67: Warning (unit_address_vs_reg): /soc/i2c@e6510000/codec@10/ports@1/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:79.29-58: Warning (unit_address_vs_reg): /soc/i2c@e6510000/codec@10/ports@1/port@1/endpoint@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:80.36-65: Warning (unit_address_vs_reg): /soc/i2c@e6510000/codec@10/ports@1/port@1/endpoint@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:27.11-59: Warning (unit_address_vs_reg): /sound/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:28.11-59: Warning (unit_address_vs_reg): /sound/ports/port@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:29.11-58: Warning (unit_address_vs_reg): /sound/ports/port@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:30.11-58: Warning (unit_address_vs_reg): /sound/ports/port@3: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:31.11-59: Warning (unit_address_vs_reg): /sound/ports/port@4: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi:32.11-59: Warning (unit_address_vs_reg): /sound/ports/port@5: node has a unit name, but no reg or ranges property

vim +72 arch/arm64/boot/dts/renesas/ulcb-simple-audio-card.dtsi

b16240a7b8e984 Kuninori Morimoto 2024-08-09 @27  			port@0 { r0: endpoint { remote-endpoint = <&a000>; };};
b16240a7b8e984 Kuninori Morimoto 2024-08-09  28  			port@1 { r1: endpoint { remote-endpoint = <&a001>; };};
b16240a7b8e984 Kuninori Morimoto 2024-08-09  29  			port@2 { r2: endpoint { remote-endpoint = <&a01>; };};
b16240a7b8e984 Kuninori Morimoto 2024-08-09  30  			port@3 { r3: endpoint { remote-endpoint = <&a10>; };};
b16240a7b8e984 Kuninori Morimoto 2024-08-09  31  			port@4 { r4: endpoint { remote-endpoint = <&a110>; };};
b16240a7b8e984 Kuninori Morimoto 2024-08-09  32  			port@5 { r5: endpoint { remote-endpoint = <&a111>; };};
b16240a7b8e984 Kuninori Morimoto 2024-08-09  33  		};
b16240a7b8e984 Kuninori Morimoto 2024-08-09  34  
62661f3b076e35 Kuninori Morimoto 2023-01-13  35  		/*
62661f3b076e35 Kuninori Morimoto 2023-01-13  36  		 * (A) CPU0 <-> ak4613
62661f3b076e35 Kuninori Morimoto 2023-01-13  37  		 */
62661f3b076e35 Kuninori Morimoto 2023-01-13  38  		simple-audio-card,dai-link@0 {
62661f3b076e35 Kuninori Morimoto 2023-01-13  39  			reg = <0>;
62661f3b076e35 Kuninori Morimoto 2023-01-13  40  			cpu {
62661f3b076e35 Kuninori Morimoto 2023-01-13  41  				bitclock-master;
62661f3b076e35 Kuninori Morimoto 2023-01-13  42  				frame-master;
62661f3b076e35 Kuninori Morimoto 2023-01-13  43  				sound-dai = <&rcar_sound 0>;
62661f3b076e35 Kuninori Morimoto 2023-01-13  44  			};
62661f3b076e35 Kuninori Morimoto 2023-01-13  45  			codec {
62661f3b076e35 Kuninori Morimoto 2023-01-13  46  				sound-dai = <&ak4613>;
62661f3b076e35 Kuninori Morimoto 2023-01-13  47  			};
62661f3b076e35 Kuninori Morimoto 2023-01-13  48  		};
62661f3b076e35 Kuninori Morimoto 2023-01-13  49  		/*
62661f3b076e35 Kuninori Morimoto 2023-01-13  50  		 * (B) CPU1 -> HDMI
62661f3b076e35 Kuninori Morimoto 2023-01-13  51  		 */
62661f3b076e35 Kuninori Morimoto 2023-01-13  52  		simple-audio-card,dai-link@1 {
62661f3b076e35 Kuninori Morimoto 2023-01-13  53  			reg = <1>;
62661f3b076e35 Kuninori Morimoto 2023-01-13  54  			cpu {
62661f3b076e35 Kuninori Morimoto 2023-01-13  55  				bitclock-master;
62661f3b076e35 Kuninori Morimoto 2023-01-13  56  				frame-master;
62661f3b076e35 Kuninori Morimoto 2023-01-13  57  				sound-dai = <&rcar_sound 1>;
62661f3b076e35 Kuninori Morimoto 2023-01-13  58  			};
62661f3b076e35 Kuninori Morimoto 2023-01-13  59  			codec {
62661f3b076e35 Kuninori Morimoto 2023-01-13  60  				sound-dai = <&hdmi0>;
62661f3b076e35 Kuninori Morimoto 2023-01-13  61  			};
62661f3b076e35 Kuninori Morimoto 2023-01-13  62  		};
62661f3b076e35 Kuninori Morimoto 2023-01-13  63  	};
62661f3b076e35 Kuninori Morimoto 2023-01-13  64  };
62661f3b076e35 Kuninori Morimoto 2023-01-13  65  
62661f3b076e35 Kuninori Morimoto 2023-01-13  66  &ak4613 {
62661f3b076e35 Kuninori Morimoto 2023-01-13  67  	/*
62661f3b076e35 Kuninori Morimoto 2023-01-13  68  	 * (A) CPU0 <-> ak4613
62661f3b076e35 Kuninori Morimoto 2023-01-13  69  	 */
62661f3b076e35 Kuninori Morimoto 2023-01-13  70  	#sound-dai-cells = <0>;
b16240a7b8e984 Kuninori Morimoto 2024-08-09  71  
b16240a7b8e984 Kuninori Morimoto 2024-08-09 @72  	ports@0 {
b16240a7b8e984 Kuninori Morimoto 2024-08-09 @73  		port@0 { a000: endpoint@0 { remote-endpoint = <&r0>; };
b16240a7b8e984 Kuninori Morimoto 2024-08-09  74  	                 a001: endpoint@1 { remote-endpoint = <&r1>; };};
b16240a7b8e984 Kuninori Morimoto 2024-08-09 @75  		port@1 { a01:  endpoint@1 { remote-endpoint = <&r2>; };};
b16240a7b8e984 Kuninori Morimoto 2024-08-09  76  		port@2 { a10:  endpoint@0 { remote-endpoint = <&r3>; };};
b16240a7b8e984 Kuninori Morimoto 2024-08-09  77  	};
b16240a7b8e984 Kuninori Morimoto 2024-08-09  78  	ports@1 {
b16240a7b8e984 Kuninori Morimoto 2024-08-09  79  		port@1 { a110: endpoint@0 { remote-endpoint = <&r4>; };
b16240a7b8e984 Kuninori Morimoto 2024-08-09  80  	                 a111: endpoint@1 { remote-endpoint = <&r5>; };};
b16240a7b8e984 Kuninori Morimoto 2024-08-09  81  	};
62661f3b076e35 Kuninori Morimoto 2023-01-13  82  };
62661f3b076e35 Kuninori Morimoto 2023-01-13  83  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
