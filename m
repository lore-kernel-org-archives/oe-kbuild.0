Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6AC19307E
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Jun 2024 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689516; cv=none; b=h3Gb1PueHo0bQ5N01NHnJP8E7fHOrVeamg69szDl7oM3kEz5uctQ0o8dC/gx0irvBMu/Wfs+MuMJTPR6ZJ9oLwRSkGMePVyByIkUxTh9RBkCVNm+oRXpnOZSjqZsI8rht103Bowvu2Ws20Aaq7VZ1cHsvppCzPigH+n5sWys3EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689516; c=relaxed/simple;
	bh=D3siLqYfsb6VMJgtGbykcibNYl3OEst+0F0PeQpQS/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NQ94n7uIKht+M5E7f8DSdYAy/6smNpRwfT1l8DP0UOpUVLprj/ggcYushwlVKY/exdfF3qAEghJDawkXbB14vn7yv2gzzBXQxhuxxxQ65LzHCHs1KErUBeCpEwqaHbSXmml40Nyn6HCtU3DK4IOgo456yIT4wrtlDJUZxTCO9qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiPl3ocX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiPl3ocX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717689514; x=1749225514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D3siLqYfsb6VMJgtGbykcibNYl3OEst+0F0PeQpQS/A=;
  b=UiPl3ocXA9p34oPKxjmcE57aUNSWuMpqfnHric9dWQ1I5s+PJ9jiTZTL
   37rVyxaFWszDddi27/z0all3nY9vhCIKYPvvHbsIoDer7XYlLMn39VCvZ
   MYvq4JocztcFI5G5oS8vlTS2W9L3f4EbOufKXVBG1AopZLLHIZdheKYyd
   xmd/suhnCfBewyEkkNhhfxlUiPo1OKACKd2k5a596afXv8q2/f4yXSo7V
   pfdllBlpTddBQxCSrzTr1RLtFzVxdOJg0dCXbmC+CAF4MNKhXAvLmbKi+
   oGafwu6VnptPo9aReV9OlFq+siKPxPLiyGSBIdb4/MTYCRYeRn88CBijw
   A==;
X-CSE-ConnectionGUID: vzCqjSaMQpeYRFjLcclV3w==
X-CSE-MsgGUID: /aDTMr9TTA2yg0aVdUfDWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14111212"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14111212"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 08:58:34 -0700
X-CSE-ConnectionGUID: 98VMI2P4Qb6gXhUp45chZw==
X-CSE-MsgGUID: +j9QIcQGQfmqlgyX7srxrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="37962551"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 06 Jun 2024 08:58:32 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFFVS-0003JJ-2W;
	Thu, 06 Jun 2024 15:58:27 +0000
Date: Thu, 6 Jun 2024 23:57:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [esmil:th1520 35/35]
 arch/riscv/boot/dts/thead/th1520.dtsi:197.18-204.5: Warning
 (simple_bus_reg): /soc/cpurst: missing or empty reg/ranges property
Message-ID: <202406062315.3z4bjqAq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/riscv/boot/dts/thead/th1520.dtsi:197.18-204.5: Warning (simple_bus_reg): /soc/cpurst: missing or empty reg/ranges property"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Han Gao <gaohan@iscas.ac.cn>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>

tree:   https://github.com/esmil/linux th1520
head:   d384daffa9d042ac6e45388cdedb7b15b48cd567
commit: d384daffa9d042ac6e45388cdedb7b15b48cd567 [35/35] [NOT-FOR-UPSTREAM] riscv: dts: thead: Add TH1520 CPU reset node
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406062315.3z4bjqAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406062315.3z4bjqAq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520.dtsi:197.18-204.5: Warning (simple_bus_reg): /soc/cpurst: missing or empty reg/ranges property

vim +197 arch/riscv/boot/dts/thead/th1520.dtsi

8e396880a864b8 Jisheng Zhang        2023-06-18    8  
8e396880a864b8 Jisheng Zhang        2023-06-18    9  / {
8e396880a864b8 Jisheng Zhang        2023-06-18   10  	compatible = "thead,th1520";
8e396880a864b8 Jisheng Zhang        2023-06-18   11  	#address-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18   12  	#size-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18   13  
8e396880a864b8 Jisheng Zhang        2023-06-18   14  	cpus: cpus {
8e396880a864b8 Jisheng Zhang        2023-06-18   15  		#address-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   16  		#size-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18   17  		timebase-frequency = <3000000>;
8e396880a864b8 Jisheng Zhang        2023-06-18   18  
8e396880a864b8 Jisheng Zhang        2023-06-18   19  		c910_0: cpu@0 {
8e396880a864b8 Jisheng Zhang        2023-06-18   20  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   21  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   22  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   23  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   24  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   25  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   26  			reg = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18   27  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   28  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   29  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   30  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   31  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   32  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   33  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18   34  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18   35  
8e396880a864b8 Jisheng Zhang        2023-06-18   36  			cpu0_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18   37  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18   38  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18   39  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   40  			};
8e396880a864b8 Jisheng Zhang        2023-06-18   41  		};
8e396880a864b8 Jisheng Zhang        2023-06-18   42  
8e396880a864b8 Jisheng Zhang        2023-06-18   43  		c910_1: cpu@1 {
8e396880a864b8 Jisheng Zhang        2023-06-18   44  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   45  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   46  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   47  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   48  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   49  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   50  			reg = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   51  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   52  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   53  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   54  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   55  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   56  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   57  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18   58  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18   59  
8e396880a864b8 Jisheng Zhang        2023-06-18   60  			cpu1_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18   61  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18   62  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18   63  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   64  			};
8e396880a864b8 Jisheng Zhang        2023-06-18   65  		};
8e396880a864b8 Jisheng Zhang        2023-06-18   66  
8e396880a864b8 Jisheng Zhang        2023-06-18   67  		c910_2: cpu@2 {
8e396880a864b8 Jisheng Zhang        2023-06-18   68  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   69  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   70  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   71  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   72  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   73  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   74  			reg = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18   75  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   76  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   77  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   78  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   79  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   80  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   81  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18   82  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18   83  
8e396880a864b8 Jisheng Zhang        2023-06-18   84  			cpu2_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18   85  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18   86  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18   87  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   88  			};
8e396880a864b8 Jisheng Zhang        2023-06-18   89  		};
8e396880a864b8 Jisheng Zhang        2023-06-18   90  
8e396880a864b8 Jisheng Zhang        2023-06-18   91  		c910_3: cpu@3 {
8e396880a864b8 Jisheng Zhang        2023-06-18   92  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   93  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   94  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   95  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   96  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   97  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   98  			reg = <3>;
8e396880a864b8 Jisheng Zhang        2023-06-18   99  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18  100  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18  101  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18  102  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18  103  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18  104  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18  105  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18  106  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18  107  
8e396880a864b8 Jisheng Zhang        2023-06-18  108  			cpu3_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18  109  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18  110  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18  111  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18  112  			};
8e396880a864b8 Jisheng Zhang        2023-06-18  113  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  114  
8e396880a864b8 Jisheng Zhang        2023-06-18  115  		l2_cache: l2-cache {
8e396880a864b8 Jisheng Zhang        2023-06-18  116  			compatible = "cache";
8e396880a864b8 Jisheng Zhang        2023-06-18  117  			cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18  118  			cache-level = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  119  			cache-size = <1048576>;
8e396880a864b8 Jisheng Zhang        2023-06-18  120  			cache-sets = <1024>;
8e396880a864b8 Jisheng Zhang        2023-06-18  121  			cache-unified;
8e396880a864b8 Jisheng Zhang        2023-06-18  122  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  123  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  124  
8e396880a864b8 Jisheng Zhang        2023-06-18  125  	osc: oscillator {
8e396880a864b8 Jisheng Zhang        2023-06-18  126  		compatible = "fixed-clock";
8e396880a864b8 Jisheng Zhang        2023-06-18  127  		clock-output-names = "osc_24m";
8e396880a864b8 Jisheng Zhang        2023-06-18  128  		#clock-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  129  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  130  
8e396880a864b8 Jisheng Zhang        2023-06-18  131  	osc_32k: 32k-oscillator {
8e396880a864b8 Jisheng Zhang        2023-06-18  132  		compatible = "fixed-clock";
8e396880a864b8 Jisheng Zhang        2023-06-18  133  		clock-output-names = "osc_32k";
8e396880a864b8 Jisheng Zhang        2023-06-18  134  		#clock-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  135  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  136  
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  137  	aonsys_clk: clock-73728000 {
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  138  		compatible = "fixed-clock";
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  139  		clock-frequency = <73728000>;
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  140  		clock-output-names = "aonsys_clk";
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  141  		#clock-cells = <0>;
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  142  	};
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  143  
8e396880a864b8 Jisheng Zhang        2023-06-18  144  	apb_clk: apb-clk-clock {
8e396880a864b8 Jisheng Zhang        2023-06-18  145  		compatible = "fixed-clock";
8e396880a864b8 Jisheng Zhang        2023-06-18  146  		clock-output-names = "apb_clk";
8e396880a864b8 Jisheng Zhang        2023-06-18  147  		#clock-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  148  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  149  
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  150  	gmac_axi_clk: gmac-axi-clock {
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  151  		compatible = "fixed-clock";
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  152  		clock-frequency = <100000000>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  153  		clock-output-names = "gmac_axi_clk";
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  154  		#clock-cells = <0>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  155  	};
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  156  
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  157  	gmac_clk: gmac-clock {
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  158  		compatible = "fixed-clock";
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  159  		clock-frequency = <500000000>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  160  		clock-output-names = "gmac_clk";
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  161  		#clock-cells = <0>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  162  	};
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  163  
ce9a935ce82ecc Thomas Bonnefille    2024-05-17  164  	i2c_ic_clk: clock-50000000 {
ce9a935ce82ecc Thomas Bonnefille    2024-05-17  165  		compatible = "fixed-clock";
ce9a935ce82ecc Thomas Bonnefille    2024-05-17  166  		clock-frequency = <50000000>;
ce9a935ce82ecc Thomas Bonnefille    2024-05-17  167  		#clock-cells = <0>;
ce9a935ce82ecc Thomas Bonnefille    2024-05-17  168  	};
ce9a935ce82ecc Thomas Bonnefille    2024-05-17  169  
8e396880a864b8 Jisheng Zhang        2023-06-18  170  	uart_sclk: uart-sclk-clock {
8e396880a864b8 Jisheng Zhang        2023-06-18  171  		compatible = "fixed-clock";
8e396880a864b8 Jisheng Zhang        2023-06-18  172  		clock-output-names = "uart_sclk";
8e396880a864b8 Jisheng Zhang        2023-06-18  173  		#clock-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  174  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  175  
a77f02e8489673 Drew Fustini         2023-12-06  176  	sdhci_clk: sdhci-clock {
a77f02e8489673 Drew Fustini         2023-12-06  177  		compatible = "fixed-clock";
a77f02e8489673 Drew Fustini         2023-12-06  178  		clock-frequency = <198000000>;
a77f02e8489673 Drew Fustini         2023-12-06  179  		clock-output-names = "sdhci_clk";
a77f02e8489673 Drew Fustini         2023-12-06  180  		#clock-cells = <0>;
a77f02e8489673 Drew Fustini         2023-12-06  181  	};
a77f02e8489673 Drew Fustini         2023-12-06  182  
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  183  	stmmac_axi_config: stmmac-axi-config {
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  184  		snps,wr_osr_lmt = <15>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  185  		snps,rd_osr_lmt = <15>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  186  		snps,blen = <0 0 64 32 0 0 0>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  187  	};
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  188  
8e396880a864b8 Jisheng Zhang        2023-06-18  189  	soc {
8e396880a864b8 Jisheng Zhang        2023-06-18  190  		compatible = "simple-bus";
8e396880a864b8 Jisheng Zhang        2023-06-18  191  		interrupt-parent = <&plic>;
8e396880a864b8 Jisheng Zhang        2023-06-18  192  		#address-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  193  		#size-cells = <2>;
759426c758c705 Jisheng Zhang        2023-09-12  194  		dma-noncoherent;
8e396880a864b8 Jisheng Zhang        2023-06-18  195  		ranges;
8e396880a864b8 Jisheng Zhang        2023-06-18  196  
d384daffa9d042 Han Gao              2023-09-21 @197  		cpurst: cpurst {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
