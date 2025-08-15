Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353D0299AA3
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Aug 2025 02:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755225804; cv=none; b=hGFwvTtX0GSGnW0WaMOC+OZbfh/D0W8OGwnYQktrWckluf8HXbGr+nnBUbuFuwLg2Nmc67sKUiE1CZvlwDJiqwpjdtyhtpu2h15ptCVRaSJY6BWzUePxXLHUD2gy13WIblwSkvUzO5/87/2aEqJnNNDK+mztwxLNXGZTXQhOSvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755225804; c=relaxed/simple;
	bh=PqGIjGJqVIu41CdzpPb7FRTaAxZcdVupJroHe3eTWwU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qaFlXeuM1c3ApKC/hS4YdmIhZQMdB38IGOV7H6ol21trPmxmbSD5r3klQ4pPXlseg86DW2rVdxAGUrs6q+lP0HDtGCatWcBR4IASUj3LbKiDNv+UJs2/5Her/XC3KpFZkXy4dPolsroPC6ETQuh+TrDmxTW3iT8aezyKR+/dMQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iy4NylZG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iy4NylZG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755225801; x=1786761801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PqGIjGJqVIu41CdzpPb7FRTaAxZcdVupJroHe3eTWwU=;
  b=Iy4NylZGeTRnU+MjALAmXE43qkipVWxWZXqTeZN4rK5qgHW49BkOrx/Q
   QcHB6JZ2vzFBAqPgrp13jOh4l4qAnDC2D+Kisb4sDRj/rHmWXBzAZfKQv
   9Oh0UjUKnR8udb85T7a3kgG4S0RxjxxBNIDsOHmifKggZ+zZ0JG4oGYJa
   C5aILjUysEhhRYisO7QOGYXNdGpqutdgkDxhdtk13aLGvfUdiRmGg6JV2
   4RFtz11sZQE9XjusQ+P8X+swsI+NcBDogUWPOT9Rnd/goDe3PmDpelJJx
   sT1V3X+kEKsuxtrnwdYeg4dB+r2i+grUwhhXYdOBrrT+JuRYa60NtV0aA
   A==;
X-CSE-ConnectionGUID: UDudHewUST+lx87/zVRm6Q==
X-CSE-MsgGUID: 7X3p/ChwTc6K0lstYldXHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="61395028"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="61395028"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 19:43:20 -0700
X-CSE-ConnectionGUID: yB2oiJmgT0S4/snECgFKew==
X-CSE-MsgGUID: WK+S+uAwSUqc+qn/ppAJJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="190619479"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2025 19:43:18 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umkPO-000BTC-0k;
	Fri, 15 Aug 2025 02:43:12 +0000
Date: Fri, 15 Aug 2025 10:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 3/4] riscv: dts: thead: th1520: add reserved node for
 C910R mailbox
Message-ID: <202508151011.rzmmuLMB-lkp@intel.com>
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
In-Reply-To: <20250814070757.2267325-4-uwu@icenowy.me>
References: <20250814070757.2267325-4-uwu@icenowy.me>
TO: Icenowy Zheng <uwu@icenowy.me>

Hi Icenowy,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on jassibrar-mailbox/for-next linus/master v6.17-rc1 next-20250814]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Icenowy-Zheng/dt-bindings-mailbox-thead-th1520-mbox-retrofit-for-other-mailboxes/20250814-151312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250814070757.2267325-4-uwu%40icenowy.me
patch subject: [RFC PATCH 3/4] riscv: dts: thead: th1520: add reserved node for C910R mailbox
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: riscv-randconfig-002-20250815 (https://download.01.org/0day-ci/archive/20250815/202508151011.rzmmuLMB-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508151011.rzmmuLMB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508151011.rzmmuLMB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520.dtsi:568.30-582.5: Warning (simple_bus_reg): /soc/mbox@ffefc53000: simple-bus unit address format error, expected "ffefc50000"

vim +/ffefc50000 +568 arch/riscv/boot/dts/thead/th1520.dtsi

8e396880a864b8 Jisheng Zhang        2023-06-18   11  
8e396880a864b8 Jisheng Zhang        2023-06-18   12  / {
8e396880a864b8 Jisheng Zhang        2023-06-18   13  	compatible = "thead,th1520";
8e396880a864b8 Jisheng Zhang        2023-06-18   14  	#address-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18   15  	#size-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18   16  
8e396880a864b8 Jisheng Zhang        2023-06-18   17  	cpus: cpus {
8e396880a864b8 Jisheng Zhang        2023-06-18   18  		#address-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   19  		#size-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18   20  		timebase-frequency = <3000000>;
8e396880a864b8 Jisheng Zhang        2023-06-18   21  
8e396880a864b8 Jisheng Zhang        2023-06-18   22  		c910_0: cpu@0 {
8e396880a864b8 Jisheng Zhang        2023-06-18   23  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   24  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   25  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   26  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   27  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   28  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   29  			reg = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18   30  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   31  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   32  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   33  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   34  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   35  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   36  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18   37  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18   38  
8e396880a864b8 Jisheng Zhang        2023-06-18   39  			cpu0_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18   40  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18   41  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18   42  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   43  			};
8e396880a864b8 Jisheng Zhang        2023-06-18   44  		};
8e396880a864b8 Jisheng Zhang        2023-06-18   45  
8e396880a864b8 Jisheng Zhang        2023-06-18   46  		c910_1: cpu@1 {
8e396880a864b8 Jisheng Zhang        2023-06-18   47  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   48  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   49  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   50  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   51  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   52  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   53  			reg = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   54  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   55  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   56  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   57  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   58  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   59  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   60  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18   61  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18   62  
8e396880a864b8 Jisheng Zhang        2023-06-18   63  			cpu1_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18   64  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18   65  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18   66  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   67  			};
8e396880a864b8 Jisheng Zhang        2023-06-18   68  		};
8e396880a864b8 Jisheng Zhang        2023-06-18   69  
8e396880a864b8 Jisheng Zhang        2023-06-18   70  		c910_2: cpu@2 {
8e396880a864b8 Jisheng Zhang        2023-06-18   71  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   72  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   73  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   74  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   75  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   76  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   77  			reg = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18   78  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   79  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   80  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   81  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   82  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   83  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   84  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18   85  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18   86  
8e396880a864b8 Jisheng Zhang        2023-06-18   87  			cpu2_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18   88  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18   89  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18   90  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   91  			};
8e396880a864b8 Jisheng Zhang        2023-06-18   92  		};
8e396880a864b8 Jisheng Zhang        2023-06-18   93  
8e396880a864b8 Jisheng Zhang        2023-06-18   94  		c910_3: cpu@3 {
8e396880a864b8 Jisheng Zhang        2023-06-18   95  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   96  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   97  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   98  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   99  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22  100  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18  101  			reg = <3>;
8e396880a864b8 Jisheng Zhang        2023-06-18  102  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18  103  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18  104  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18  105  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18  106  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18  107  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18  108  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18  109  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18  110  
8e396880a864b8 Jisheng Zhang        2023-06-18  111  			cpu3_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18  112  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18  113  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18  114  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18  115  			};
8e396880a864b8 Jisheng Zhang        2023-06-18  116  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  117  
8e396880a864b8 Jisheng Zhang        2023-06-18  118  		l2_cache: l2-cache {
8e396880a864b8 Jisheng Zhang        2023-06-18  119  			compatible = "cache";
8e396880a864b8 Jisheng Zhang        2023-06-18  120  			cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18  121  			cache-level = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  122  			cache-size = <1048576>;
8e396880a864b8 Jisheng Zhang        2023-06-18  123  			cache-sets = <1024>;
8e396880a864b8 Jisheng Zhang        2023-06-18  124  			cache-unified;
8e396880a864b8 Jisheng Zhang        2023-06-18  125  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  126  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  127  
c61fea676bcb5f Inochi Amaoto        2024-05-30  128  	pmu {
c61fea676bcb5f Inochi Amaoto        2024-05-30  129  		compatible = "riscv,pmu";
c61fea676bcb5f Inochi Amaoto        2024-05-30  130  		riscv,event-to-mhpmcounters =
c61fea676bcb5f Inochi Amaoto        2024-05-30  131  			<0x00003 0x00003 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  132  			<0x00004 0x00004 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  133  			<0x00005 0x00005 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  134  			<0x00006 0x00006 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  135  			<0x00007 0x00007 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  136  			<0x00008 0x00008 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  137  			<0x00009 0x00009 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  138  			<0x0000a 0x0000a 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  139  			<0x10000 0x10000 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  140  			<0x10001 0x10001 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  141  			<0x10002 0x10002 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  142  			<0x10003 0x10003 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  143  			<0x10010 0x10010 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  144  			<0x10011 0x10011 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  145  			<0x10012 0x10012 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  146  			<0x10013 0x10013 0x0007fff8>;
c61fea676bcb5f Inochi Amaoto        2024-05-30  147  		riscv,event-to-mhpmevent =
c61fea676bcb5f Inochi Amaoto        2024-05-30  148  			<0x00003 0x00000000 0x00000001>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  149  			<0x00004 0x00000000 0x00000002>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  150  			<0x00006 0x00000000 0x00000006>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  151  			<0x00005 0x00000000 0x00000007>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  152  			<0x00007 0x00000000 0x00000008>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  153  			<0x00008 0x00000000 0x00000009>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  154  			<0x00009 0x00000000 0x0000000a>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  155  			<0x0000a 0x00000000 0x0000000b>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  156  			<0x10000 0x00000000 0x0000000c>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  157  			<0x10001 0x00000000 0x0000000d>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  158  			<0x10002 0x00000000 0x0000000e>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  159  			<0x10003 0x00000000 0x0000000f>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  160  			<0x10010 0x00000000 0x00000010>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  161  			<0x10011 0x00000000 0x00000011>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  162  			<0x10012 0x00000000 0x00000012>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  163  			<0x10013 0x00000000 0x00000013>;
c61fea676bcb5f Inochi Amaoto        2024-05-30  164  		riscv,raw-event-to-mhpmcounters =
c61fea676bcb5f Inochi Amaoto        2024-05-30  165  			<0x00000000 0x00000001 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  166  			<0x00000000 0x00000002 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  167  			<0x00000000 0x00000003 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  168  			<0x00000000 0x00000004 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  169  			<0x00000000 0x00000005 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  170  			<0x00000000 0x00000006 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  171  			<0x00000000 0x00000007 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  172  			<0x00000000 0x00000008 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  173  			<0x00000000 0x00000009 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  174  			<0x00000000 0x0000000a 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  175  			<0x00000000 0x0000000b 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  176  			<0x00000000 0x0000000c 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  177  			<0x00000000 0x0000000d 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  178  			<0x00000000 0x0000000e 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  179  			<0x00000000 0x0000000f 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  180  			<0x00000000 0x00000010 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  181  			<0x00000000 0x00000011 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  182  			<0x00000000 0x00000012 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  183  			<0x00000000 0x00000013 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  184  			<0x00000000 0x00000014 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  185  			<0x00000000 0x00000015 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  186  			<0x00000000 0x00000016 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  187  			<0x00000000 0x00000017 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  188  			<0x00000000 0x00000018 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  189  			<0x00000000 0x00000019 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  190  			<0x00000000 0x0000001a 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  191  			<0x00000000 0x0000001b 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  192  			<0x00000000 0x0000001c 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  193  			<0x00000000 0x0000001d 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  194  			<0x00000000 0x0000001e 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  195  			<0x00000000 0x0000001f 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  196  			<0x00000000 0x00000020 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  197  			<0x00000000 0x00000021 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  198  			<0x00000000 0x00000022 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  199  			<0x00000000 0x00000023 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  200  			<0x00000000 0x00000024 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  201  			<0x00000000 0x00000025 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  202  			<0x00000000 0x00000026 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  203  			<0x00000000 0x00000027 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  204  			<0x00000000 0x00000028 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  205  			<0x00000000 0x00000029 0xffffffff 0xffffffff 0x0007fff8>,
c61fea676bcb5f Inochi Amaoto        2024-05-30  206  			<0x00000000 0x0000002a 0xffffffff 0xffffffff 0x0007fff8>;
c61fea676bcb5f Inochi Amaoto        2024-05-30  207  	};
c61fea676bcb5f Inochi Amaoto        2024-05-30  208  
8e396880a864b8 Jisheng Zhang        2023-06-18  209  	osc: oscillator {
8e396880a864b8 Jisheng Zhang        2023-06-18  210  		compatible = "fixed-clock";
8e396880a864b8 Jisheng Zhang        2023-06-18  211  		clock-output-names = "osc_24m";
8e396880a864b8 Jisheng Zhang        2023-06-18  212  		#clock-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  213  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  214  
8e396880a864b8 Jisheng Zhang        2023-06-18  215  	osc_32k: 32k-oscillator {
8e396880a864b8 Jisheng Zhang        2023-06-18  216  		compatible = "fixed-clock";
8e396880a864b8 Jisheng Zhang        2023-06-18  217  		clock-output-names = "osc_32k";
8e396880a864b8 Jisheng Zhang        2023-06-18  218  		#clock-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  219  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  220  
566ab427f827b0 Emil Renner Berthing 2024-10-14  221  	aonsys_clk: clock-73728000 {
566ab427f827b0 Emil Renner Berthing 2024-10-14  222  		compatible = "fixed-clock";
566ab427f827b0 Emil Renner Berthing 2024-10-14  223  		clock-frequency = <73728000>;
566ab427f827b0 Emil Renner Berthing 2024-10-14  224  		clock-output-names = "aonsys_clk";
566ab427f827b0 Emil Renner Berthing 2024-10-14  225  		#clock-cells = <0>;
566ab427f827b0 Emil Renner Berthing 2024-10-14  226  	};
566ab427f827b0 Emil Renner Berthing 2024-10-14  227  
7e756671a664b7 Emil Renner Berthing 2024-10-20  228  	stmmac_axi_config: stmmac-axi-config {
7e756671a664b7 Emil Renner Berthing 2024-10-20  229  		snps,wr_osr_lmt = <15>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  230  		snps,rd_osr_lmt = <15>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  231  		snps,blen = <0 0 64 32 0 0 0>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  232  	};
7e756671a664b7 Emil Renner Berthing 2024-10-20  233  
2bae46e3de2a64 Michal Wilczynski    2025-02-19  234  	aon: aon {
2bae46e3de2a64 Michal Wilczynski    2025-02-19  235  		compatible = "thead,th1520-aon";
2bae46e3de2a64 Michal Wilczynski    2025-02-19  236  		mboxes = <&mbox_910t 1>;
2bae46e3de2a64 Michal Wilczynski    2025-02-19  237  		mbox-names = "aon";
cf5e81da0ed7f5 Michal Wilczynski    2025-06-26  238  		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
cf5e81da0ed7f5 Michal Wilczynski    2025-06-26  239  		reset-names = "gpu-clkgen";
2bae46e3de2a64 Michal Wilczynski    2025-02-19  240  		#power-domain-cells = <1>;
2bae46e3de2a64 Michal Wilczynski    2025-02-19  241  	};
2bae46e3de2a64 Michal Wilczynski    2025-02-19  242  
8e396880a864b8 Jisheng Zhang        2023-06-18  243  	soc {
8e396880a864b8 Jisheng Zhang        2023-06-18  244  		compatible = "simple-bus";
8e396880a864b8 Jisheng Zhang        2023-06-18  245  		interrupt-parent = <&plic>;
8e396880a864b8 Jisheng Zhang        2023-06-18  246  		#address-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  247  		#size-cells = <2>;
759426c758c705 Jisheng Zhang        2023-09-12  248  		dma-noncoherent;
8e396880a864b8 Jisheng Zhang        2023-06-18  249  		ranges;
8e396880a864b8 Jisheng Zhang        2023-06-18  250  
8e396880a864b8 Jisheng Zhang        2023-06-18  251  		plic: interrupt-controller@ffd8000000 {
8e396880a864b8 Jisheng Zhang        2023-06-18  252  			compatible = "thead,th1520-plic", "thead,c900-plic";
8e396880a864b8 Jisheng Zhang        2023-06-18  253  			reg = <0xff 0xd8000000 0x0 0x01000000>;
8e396880a864b8 Jisheng Zhang        2023-06-18  254  			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>,
8e396880a864b8 Jisheng Zhang        2023-06-18  255  					      <&cpu1_intc 11>, <&cpu1_intc 9>,
8e396880a864b8 Jisheng Zhang        2023-06-18  256  					      <&cpu2_intc 11>, <&cpu2_intc 9>,
8e396880a864b8 Jisheng Zhang        2023-06-18  257  					      <&cpu3_intc 11>, <&cpu3_intc 9>;
8e396880a864b8 Jisheng Zhang        2023-06-18  258  			interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18  259  			#address-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  260  			#interrupt-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  261  			riscv,ndev = <240>;
8e396880a864b8 Jisheng Zhang        2023-06-18  262  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  263  
8e396880a864b8 Jisheng Zhang        2023-06-18  264  		clint: timer@ffdc000000 {
8e396880a864b8 Jisheng Zhang        2023-06-18  265  			compatible = "thead,th1520-clint", "thead,c900-clint";
8e396880a864b8 Jisheng Zhang        2023-06-18  266  			reg = <0xff 0xdc000000 0x0 0x00010000>;
8e396880a864b8 Jisheng Zhang        2023-06-18  267  			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>,
8e396880a864b8 Jisheng Zhang        2023-06-18  268  					      <&cpu1_intc 3>, <&cpu1_intc 7>,
8e396880a864b8 Jisheng Zhang        2023-06-18  269  					      <&cpu2_intc 3>, <&cpu2_intc 7>,
8e396880a864b8 Jisheng Zhang        2023-06-18  270  					      <&cpu3_intc 3>, <&cpu3_intc 7>;
8e396880a864b8 Jisheng Zhang        2023-06-18  271  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  272  
32121e158449f0 Kanak Shilledar      2024-07-05  273  		spi0: spi@ffe700c000 {
32121e158449f0 Kanak Shilledar      2024-07-05  274  			compatible = "thead,th1520-spi", "snps,dw-apb-ssi";
32121e158449f0 Kanak Shilledar      2024-07-05  275  			reg = <0xff 0xe700c000 0x0 0x1000>;
32121e158449f0 Kanak Shilledar      2024-07-05  276  			interrupts = <54 IRQ_TYPE_LEVEL_HIGH>;
2d98fea7491a00 Drew Fustini         2024-08-01  277  			clocks = <&clk CLK_SPI>;
32121e158449f0 Kanak Shilledar      2024-07-05  278  			#address-cells = <1>;
32121e158449f0 Kanak Shilledar      2024-07-05  279  			#size-cells = <0>;
32121e158449f0 Kanak Shilledar      2024-07-05  280  			status = "disabled";
32121e158449f0 Kanak Shilledar      2024-07-05  281  		};
32121e158449f0 Kanak Shilledar      2024-07-05  282  
8e396880a864b8 Jisheng Zhang        2023-06-18  283  		uart0: serial@ffe7014000 {
8e396880a864b8 Jisheng Zhang        2023-06-18  284  			compatible = "snps,dw-apb-uart";
8e396880a864b8 Jisheng Zhang        2023-06-18  285  			reg = <0xff 0xe7014000 0x0 0x100>;
8e396880a864b8 Jisheng Zhang        2023-06-18  286  			interrupts = <36 IRQ_TYPE_LEVEL_HIGH>;
c101b4a028e21c Drew Fustini         2024-08-01  287  			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART0_PCLK>;
c101b4a028e21c Drew Fustini         2024-08-01  288  			clock-names = "baudclk", "apb_pclk";
8e396880a864b8 Jisheng Zhang        2023-06-18  289  			reg-shift = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  290  			reg-io-width = <4>;
8e396880a864b8 Jisheng Zhang        2023-06-18  291  			status = "disabled";
8e396880a864b8 Jisheng Zhang        2023-06-18  292  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  293  
7e756671a664b7 Emil Renner Berthing 2024-10-20  294  		gmac1: ethernet@ffe7060000 {
7e756671a664b7 Emil Renner Berthing 2024-10-20  295  			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
7e756671a664b7 Emil Renner Berthing 2024-10-20  296  			reg = <0xff 0xe7060000 0x0 0x2000>, <0xff 0xec004000 0x0 0x1000>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  297  			reg-names = "dwmac", "apb";
7e756671a664b7 Emil Renner Berthing 2024-10-20  298  			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  299  			interrupt-names = "macirq";
7e756671a664b7 Emil Renner Berthing 2024-10-20  300  			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC1>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  301  			clock-names = "stmmaceth", "pclk";
7e756671a664b7 Emil Renner Berthing 2024-10-20  302  			snps,pbl = <32>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  303  			snps,fixed-burst;
7e756671a664b7 Emil Renner Berthing 2024-10-20  304  			snps,multicast-filter-bins = <64>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  305  			snps,perfect-filter-entries = <32>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  306  			snps,axi-config = <&stmmac_axi_config>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  307  			status = "disabled";
7e756671a664b7 Emil Renner Berthing 2024-10-20  308  
7e756671a664b7 Emil Renner Berthing 2024-10-20  309  			mdio1: mdio {
7e756671a664b7 Emil Renner Berthing 2024-10-20  310  				compatible = "snps,dwmac-mdio";
7e756671a664b7 Emil Renner Berthing 2024-10-20  311  				#address-cells = <1>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  312  				#size-cells = <0>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  313  			};
7e756671a664b7 Emil Renner Berthing 2024-10-20  314  		};
7e756671a664b7 Emil Renner Berthing 2024-10-20  315  
7e756671a664b7 Emil Renner Berthing 2024-10-20  316  		gmac0: ethernet@ffe7070000 {
7e756671a664b7 Emil Renner Berthing 2024-10-20  317  			compatible = "thead,th1520-gmac", "snps,dwmac-3.70a";
7e756671a664b7 Emil Renner Berthing 2024-10-20  318  			reg = <0xff 0xe7070000 0x0 0x2000>, <0xff 0xec003000 0x0 0x1000>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  319  			reg-names = "dwmac", "apb";
7e756671a664b7 Emil Renner Berthing 2024-10-20  320  			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  321  			interrupt-names = "macirq";
7e756671a664b7 Emil Renner Berthing 2024-10-20  322  			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC0>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  323  			clock-names = "stmmaceth", "pclk";
7e756671a664b7 Emil Renner Berthing 2024-10-20  324  			snps,pbl = <32>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  325  			snps,fixed-burst;
7e756671a664b7 Emil Renner Berthing 2024-10-20  326  			snps,multicast-filter-bins = <64>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  327  			snps,perfect-filter-entries = <32>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  328  			snps,axi-config = <&stmmac_axi_config>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  329  			status = "disabled";
7e756671a664b7 Emil Renner Berthing 2024-10-20  330  
7e756671a664b7 Emil Renner Berthing 2024-10-20  331  			mdio0: mdio {
7e756671a664b7 Emil Renner Berthing 2024-10-20  332  				compatible = "snps,dwmac-mdio";
7e756671a664b7 Emil Renner Berthing 2024-10-20  333  				#address-cells = <1>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  334  				#size-cells = <0>;
7e756671a664b7 Emil Renner Berthing 2024-10-20  335  			};
7e756671a664b7 Emil Renner Berthing 2024-10-20  336  		};
7e756671a664b7 Emil Renner Berthing 2024-10-20  337  
9abd613a85af72 Thomas Bonnefille    2024-04-25  338  		emmc: mmc@ffe7080000 {
9abd613a85af72 Thomas Bonnefille    2024-04-25  339  			compatible = "thead,th1520-dwcmshc";
9abd613a85af72 Thomas Bonnefille    2024-04-25  340  			reg = <0xff 0xe7080000 0x0 0x10000>;
9abd613a85af72 Thomas Bonnefille    2024-04-25  341  			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
03a20182e1e0f4 Drew Fustini         2024-08-01  342  			clocks = <&clk CLK_EMMC_SDIO>;
9abd613a85af72 Thomas Bonnefille    2024-04-25  343  			clock-names = "core";
9abd613a85af72 Thomas Bonnefille    2024-04-25  344  			status = "disabled";
9abd613a85af72 Thomas Bonnefille    2024-04-25  345  		};
9abd613a85af72 Thomas Bonnefille    2024-04-25  346  
9abd613a85af72 Thomas Bonnefille    2024-04-25  347  		sdio0: mmc@ffe7090000 {
9abd613a85af72 Thomas Bonnefille    2024-04-25  348  			compatible = "thead,th1520-dwcmshc";
9abd613a85af72 Thomas Bonnefille    2024-04-25  349  			reg = <0xff 0xe7090000 0x0 0x10000>;
9abd613a85af72 Thomas Bonnefille    2024-04-25  350  			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
03a20182e1e0f4 Drew Fustini         2024-08-01  351  			clocks = <&clk CLK_EMMC_SDIO>;
9abd613a85af72 Thomas Bonnefille    2024-04-25  352  			clock-names = "core";
9abd613a85af72 Thomas Bonnefille    2024-04-25  353  			status = "disabled";
9abd613a85af72 Thomas Bonnefille    2024-04-25  354  		};
9abd613a85af72 Thomas Bonnefille    2024-04-25  355  
9abd613a85af72 Thomas Bonnefille    2024-04-25  356  		sdio1: mmc@ffe70a0000 {
9abd613a85af72 Thomas Bonnefille    2024-04-25  357  			compatible = "thead,th1520-dwcmshc";
9abd613a85af72 Thomas Bonnefille    2024-04-25  358  			reg = <0xff 0xe70a0000 0x0 0x10000>;
9abd613a85af72 Thomas Bonnefille    2024-04-25  359  			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
03a20182e1e0f4 Drew Fustini         2024-08-01  360  			clocks = <&clk CLK_EMMC_SDIO>;
9abd613a85af72 Thomas Bonnefille    2024-04-25  361  			clock-names = "core";
9abd613a85af72 Thomas Bonnefille    2024-04-25  362  			status = "disabled";
9abd613a85af72 Thomas Bonnefille    2024-04-25  363  		};
9abd613a85af72 Thomas Bonnefille    2024-04-25  364  
8e396880a864b8 Jisheng Zhang        2023-06-18  365  		uart1: serial@ffe7f00000 {
8e396880a864b8 Jisheng Zhang        2023-06-18  366  			compatible = "snps,dw-apb-uart";
8e396880a864b8 Jisheng Zhang        2023-06-18  367  			reg = <0xff 0xe7f00000 0x0 0x100>;
8e396880a864b8 Jisheng Zhang        2023-06-18  368  			interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
c101b4a028e21c Drew Fustini         2024-08-01  369  			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART1_PCLK>;
c101b4a028e21c Drew Fustini         2024-08-01  370  			clock-names = "baudclk", "apb_pclk";
8e396880a864b8 Jisheng Zhang        2023-06-18  371  			reg-shift = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  372  			reg-io-width = <4>;
8e396880a864b8 Jisheng Zhang        2023-06-18  373  			status = "disabled";
8e396880a864b8 Jisheng Zhang        2023-06-18  374  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  375  
8e396880a864b8 Jisheng Zhang        2023-06-18  376  		uart3: serial@ffe7f04000 {
8e396880a864b8 Jisheng Zhang        2023-06-18  377  			compatible = "snps,dw-apb-uart";
8e396880a864b8 Jisheng Zhang        2023-06-18  378  			reg = <0xff 0xe7f04000 0x0 0x100>;
8e396880a864b8 Jisheng Zhang        2023-06-18  379  			interrupts = <39 IRQ_TYPE_LEVEL_HIGH>;
c101b4a028e21c Drew Fustini         2024-08-01  380  			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART3_PCLK>;
c101b4a028e21c Drew Fustini         2024-08-01  381  			clock-names = "baudclk", "apb_pclk";
8e396880a864b8 Jisheng Zhang        2023-06-18  382  			reg-shift = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  383  			reg-io-width = <4>;
8e396880a864b8 Jisheng Zhang        2023-06-18  384  			status = "disabled";
8e396880a864b8 Jisheng Zhang        2023-06-18  385  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  386  
33d3a63f9ab381 Emil Renner Berthing 2024-10-14  387  		gpio@ffe7f34000 {
8e396880a864b8 Jisheng Zhang        2023-06-18  388  			compatible = "snps,dw-apb-gpio";
8e396880a864b8 Jisheng Zhang        2023-06-18  389  			reg = <0xff 0xe7f34000 0x0 0x1000>;
8e396880a864b8 Jisheng Zhang        2023-06-18  390  			#address-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18  391  			#size-cells = <0>;
7f5b28218cec55 Drew Fustini         2024-08-01  392  			clocks = <&clk CLK_GPIO2>;
bcec43a092d080 Emil Renner Berthing 2024-10-14  393  			clock-names = "bus";
8e396880a864b8 Jisheng Zhang        2023-06-18  394  
33d3a63f9ab381 Emil Renner Berthing 2024-10-14  395  			gpio2: gpio-controller@0 {
8e396880a864b8 Jisheng Zhang        2023-06-18  396  				compatible = "snps,dw-apb-gpio-port";
8e396880a864b8 Jisheng Zhang        2023-06-18  397  				gpio-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18  398  				#gpio-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  399  				ngpios = <32>;
5ec423d1df089d Emil Renner Berthing 2024-10-14  400  				gpio-ranges = <&padctrl0_apsys 0 0 32>;
8e396880a864b8 Jisheng Zhang        2023-06-18  401  				reg = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  402  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18  403  				#interrupt-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  404  				interrupts = <58 IRQ_TYPE_LEVEL_HIGH>;
8e396880a864b8 Jisheng Zhang        2023-06-18  405  			};
8e396880a864b8 Jisheng Zhang        2023-06-18  406  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  407  
33d3a63f9ab381 Emil Renner Berthing 2024-10-14  408  		gpio@ffe7f38000 {
8e396880a864b8 Jisheng Zhang        2023-06-18  409  			compatible = "snps,dw-apb-gpio";
8e396880a864b8 Jisheng Zhang        2023-06-18  410  			reg = <0xff 0xe7f38000 0x0 0x1000>;
8e396880a864b8 Jisheng Zhang        2023-06-18  411  			#address-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18  412  			#size-cells = <0>;
7f5b28218cec55 Drew Fustini         2024-08-01  413  			clocks = <&clk CLK_GPIO3>;
bcec43a092d080 Emil Renner Berthing 2024-10-14  414  			clock-names = "bus";
8e396880a864b8 Jisheng Zhang        2023-06-18  415  
33d3a63f9ab381 Emil Renner Berthing 2024-10-14  416  			gpio3: gpio-controller@0 {
8e396880a864b8 Jisheng Zhang        2023-06-18  417  				compatible = "snps,dw-apb-gpio-port";
8e396880a864b8 Jisheng Zhang        2023-06-18  418  				gpio-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18  419  				#gpio-cells = <2>;
5ec423d1df089d Emil Renner Berthing 2024-10-14  420  				ngpios = <23>;
5ec423d1df089d Emil Renner Berthing 2024-10-14  421  				gpio-ranges = <&padctrl0_apsys 0 32 23>;
8e396880a864b8 Jisheng Zhang        2023-06-18  422  				reg = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  423  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18  424  				#interrupt-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  425  				interrupts = <59 IRQ_TYPE_LEVEL_HIGH>;
8e396880a864b8 Jisheng Zhang        2023-06-18  426  			};
8e396880a864b8 Jisheng Zhang        2023-06-18  427  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  428  
566ab427f827b0 Emil Renner Berthing 2024-10-14  429  		padctrl1_apsys: pinctrl@ffe7f3c000 {
566ab427f827b0 Emil Renner Berthing 2024-10-14  430  			compatible = "thead,th1520-pinctrl";
566ab427f827b0 Emil Renner Berthing 2024-10-14  431  			reg = <0xff 0xe7f3c000 0x0 0x1000>;
566ab427f827b0 Emil Renner Berthing 2024-10-14  432  			clocks = <&clk CLK_PADCTRL1>;
566ab427f827b0 Emil Renner Berthing 2024-10-14  433  			thead,pad-group = <2>;
566ab427f827b0 Emil Renner Berthing 2024-10-14  434  		};
566ab427f827b0 Emil Renner Berthing 2024-10-14  435  
33d3a63f9ab381 Emil Renner Berthing 2024-10-14  436  		gpio@ffec005000 {
8e396880a864b8 Jisheng Zhang        2023-06-18  437  			compatible = "snps,dw-apb-gpio";
8e396880a864b8 Jisheng Zhang        2023-06-18  438  			reg = <0xff 0xec005000 0x0 0x1000>;
8e396880a864b8 Jisheng Zhang        2023-06-18  439  			#address-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18  440  			#size-cells = <0>;
7f5b28218cec55 Drew Fustini         2024-08-01  441  			clocks = <&clk CLK_GPIO0>;
bcec43a092d080 Emil Renner Berthing 2024-10-14  442  			clock-names = "bus";
8e396880a864b8 Jisheng Zhang        2023-06-18  443  
33d3a63f9ab381 Emil Renner Berthing 2024-10-14  444  			gpio0: gpio-controller@0 {
8e396880a864b8 Jisheng Zhang        2023-06-18  445  				compatible = "snps,dw-apb-gpio-port";
8e396880a864b8 Jisheng Zhang        2023-06-18  446  				gpio-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18  447  				#gpio-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  448  				ngpios = <32>;
5ec423d1df089d Emil Renner Berthing 2024-10-14  449  				gpio-ranges = <&padctrl1_apsys 0 0 32>;
8e396880a864b8 Jisheng Zhang        2023-06-18  450  				reg = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  451  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18  452  				#interrupt-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  453  				interrupts = <56 IRQ_TYPE_LEVEL_HIGH>;
8e396880a864b8 Jisheng Zhang        2023-06-18  454  			};
8e396880a864b8 Jisheng Zhang        2023-06-18  455  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  456  
33d3a63f9ab381 Emil Renner Berthing 2024-10-14  457  		gpio@ffec006000 {
8e396880a864b8 Jisheng Zhang        2023-06-18  458  			compatible = "snps,dw-apb-gpio";
8e396880a864b8 Jisheng Zhang        2023-06-18  459  			reg = <0xff 0xec006000 0x0 0x1000>;
8e396880a864b8 Jisheng Zhang        2023-06-18  460  			#address-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18  461  			#size-cells = <0>;
7f5b28218cec55 Drew Fustini         2024-08-01  462  			clocks = <&clk CLK_GPIO1>;
bcec43a092d080 Emil Renner Berthing 2024-10-14  463  			clock-names = "bus";
8e396880a864b8 Jisheng Zhang        2023-06-18  464  
33d3a63f9ab381 Emil Renner Berthing 2024-10-14  465  			gpio1: gpio-controller@0 {
8e396880a864b8 Jisheng Zhang        2023-06-18  466  				compatible = "snps,dw-apb-gpio-port";
8e396880a864b8 Jisheng Zhang        2023-06-18  467  				gpio-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18  468  				#gpio-cells = <2>;
5ec423d1df089d Emil Renner Berthing 2024-10-14  469  				ngpios = <31>;
5ec423d1df089d Emil Renner Berthing 2024-10-14  470  				gpio-ranges = <&padctrl1_apsys 0 32 31>;
8e396880a864b8 Jisheng Zhang        2023-06-18  471  				reg = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  472  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18  473  				#interrupt-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  474  				interrupts = <57 IRQ_TYPE_LEVEL_HIGH>;
8e396880a864b8 Jisheng Zhang        2023-06-18  475  			};
8e396880a864b8 Jisheng Zhang        2023-06-18  476  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  477  
566ab427f827b0 Emil Renner Berthing 2024-10-14  478  		padctrl0_apsys: pinctrl@ffec007000 {
566ab427f827b0 Emil Renner Berthing 2024-10-14  479  			compatible = "thead,th1520-pinctrl";
566ab427f827b0 Emil Renner Berthing 2024-10-14  480  			reg = <0xff 0xec007000 0x0 0x1000>;
566ab427f827b0 Emil Renner Berthing 2024-10-14  481  			clocks = <&clk CLK_PADCTRL0>;
566ab427f827b0 Emil Renner Berthing 2024-10-14  482  			thead,pad-group = <3>;
566ab427f827b0 Emil Renner Berthing 2024-10-14  483  		};
566ab427f827b0 Emil Renner Berthing 2024-10-14  484  
8e396880a864b8 Jisheng Zhang        2023-06-18  485  		uart2: serial@ffec010000 {
8e396880a864b8 Jisheng Zhang        2023-06-18  486  			compatible = "snps,dw-apb-uart";
8e396880a864b8 Jisheng Zhang        2023-06-18  487  			reg = <0xff 0xec010000 0x0 0x4000>;
8e396880a864b8 Jisheng Zhang        2023-06-18  488  			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
c101b4a028e21c Drew Fustini         2024-08-01  489  			clocks = <&clk CLK_UART_SCLK>, <&clk CLK_UART2_PCLK>;
c101b4a028e21c Drew Fustini         2024-08-01  490  			clock-names = "baudclk", "apb_pclk";
8e396880a864b8 Jisheng Zhang        2023-06-18  491  			reg-shift = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  492  			reg-io-width = <4>;
8e396880a864b8 Jisheng Zhang        2023-06-18  493  			status = "disabled";
8e396880a864b8 Jisheng Zhang        2023-06-18  494  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  495  
e919fe036a97f6 Drew Fustini         2024-08-01  496  		clk: clock-controller@ffef010000 {
e919fe036a97f6 Drew Fustini         2024-08-01  497  			compatible = "thead,th1520-clk-ap";
e919fe036a97f6 Drew Fustini         2024-08-01  498  			reg = <0xff 0xef010000 0x0 0x1000>;
e919fe036a97f6 Drew Fustini         2024-08-01  499  			clocks = <&osc>;
e919fe036a97f6 Drew Fustini         2024-08-01  500  			#clock-cells = <1>;
e919fe036a97f6 Drew Fustini         2024-08-01  501  		};
e919fe036a97f6 Drew Fustini         2024-08-01  502  
1b136de08b5fec Michal Wilczynski    2025-04-25  503  		rst: reset-controller@ffef528000 {
1b136de08b5fec Michal Wilczynski    2025-04-25  504  			compatible = "thead,th1520-reset";
1b136de08b5fec Michal Wilczynski    2025-04-25  505  			reg = <0xff 0xef528000 0x0 0x4f>;
1b136de08b5fec Michal Wilczynski    2025-04-25  506  			#reset-cells = <1>;
1b136de08b5fec Michal Wilczynski    2025-04-25  507  		};
1b136de08b5fec Michal Wilczynski    2025-04-25  508  
a4c95b924d5137 Michal Wilczynski    2025-04-03  509  		clk_vo: clock-controller@ffef528050 {
a4c95b924d5137 Michal Wilczynski    2025-04-03  510  			compatible = "thead,th1520-clk-vo";
a4c95b924d5137 Michal Wilczynski    2025-04-03  511  			reg = <0xff 0xef528050 0x0 0xfb0>;
a4c95b924d5137 Michal Wilczynski    2025-04-03  512  			clocks = <&clk CLK_VIDEO_PLL>;
a4c95b924d5137 Michal Wilczynski    2025-04-03  513  			#clock-cells = <1>;
a4c95b924d5137 Michal Wilczynski    2025-04-03  514  		};
a4c95b924d5137 Michal Wilczynski    2025-04-03  515  
8e396880a864b8 Jisheng Zhang        2023-06-18  516  		dmac0: dma-controller@ffefc00000 {
8e396880a864b8 Jisheng Zhang        2023-06-18  517  			compatible = "snps,axi-dma-1.01a";
8e396880a864b8 Jisheng Zhang        2023-06-18  518  			reg = <0xff 0xefc00000 0x0 0x1000>;
8e396880a864b8 Jisheng Zhang        2023-06-18  519  			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
89d58327fd7451 Drew Fustini         2024-08-01  520  			clocks = <&clk CLK_PERI_APB_PCLK>, <&clk CLK_PERI_APB_PCLK>;
8e396880a864b8 Jisheng Zhang        2023-06-18  521  			clock-names = "core-clk", "cfgr-clk";
8e396880a864b8 Jisheng Zhang        2023-06-18  522  			#dma-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18  523  			dma-channels = <4>;
8e396880a864b8 Jisheng Zhang        2023-06-18  524  			snps,block-size = <65536 65536 65536 65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18  525  			snps,priority = <0 1 2 3>;
8e396880a864b8 Jisheng Zhang        2023-06-18  526  			snps,dma-masters = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18  527  			snps,data-width = <4>;
8e396880a864b8 Jisheng Zhang        2023-06-18  528  			snps,axi-max-burst-len = <16>;
8e396880a864b8 Jisheng Zhang        2023-06-18  529  			status = "disabled";
8e396880a864b8 Jisheng Zhang        2023-06-18  530  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  531  
8e396880a864b8 Jisheng Zhang        2023-06-18  532  		timer0: timer@ffefc32000 {
8e396880a864b8 Jisheng Zhang        2023-06-18  533  			compatible = "snps,dw-apb-timer";
8e396880a864b8 Jisheng Zhang        2023-06-18  534  			reg = <0xff 0xefc32000 0x0 0x14>;
89d58327fd7451 Drew Fustini         2024-08-01  535  			clocks = <&clk CLK_PERI_APB_PCLK>;
8e396880a864b8 Jisheng Zhang        2023-06-18  536  			clock-names = "timer";
8e396880a864b8 Jisheng Zhang        2023-06-18  537  			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
8e396880a864b8 Jisheng Zhang        2023-06-18  538  			status = "disabled";
8e396880a864b8 Jisheng Zhang        2023-06-18  539  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  540  
8e396880a864b8 Jisheng Zhang        2023-06-18  541  		timer1: timer@ffefc32014 {
8e396880a864b8 Jisheng Zhang        2023-06-18  542  			compatible = "snps,dw-apb-timer";
8e396880a864b8 Jisheng Zhang        2023-06-18  543  			reg = <0xff 0xefc32014 0x0 0x14>;
89d58327fd7451 Drew Fustini         2024-08-01  544  			clocks = <&clk CLK_PERI_APB_PCLK>;
8e396880a864b8 Jisheng Zhang        2023-06-18  545  			clock-names = "timer";
8e396880a864b8 Jisheng Zhang        2023-06-18  546  			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
8e396880a864b8 Jisheng Zhang        2023-06-18  547  			status = "disabled";
8e396880a864b8 Jisheng Zhang        2023-06-18  548  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  549  
8e396880a864b8 Jisheng Zhang        2023-06-18  550  		timer2: timer@ffefc32028 {
8e396880a864b8 Jisheng Zhang        2023-06-18  551  			compatible = "snps,dw-apb-timer";
8e396880a864b8 Jisheng Zhang        2023-06-18  552  			reg = <0xff 0xefc32028 0x0 0x14>;
89d58327fd7451 Drew Fustini         2024-08-01  553  			clocks = <&clk CLK_PERI_APB_PCLK>;
8e396880a864b8 Jisheng Zhang        2023-06-18  554  			clock-names = "timer";
8e396880a864b8 Jisheng Zhang        2023-06-18  555  			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
8e396880a864b8 Jisheng Zhang        2023-06-18  556  			status = "disabled";
8e396880a864b8 Jisheng Zhang        2023-06-18  557  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  558  
8e396880a864b8 Jisheng Zhang        2023-06-18  559  		timer3: timer@ffefc3203c {
8e396880a864b8 Jisheng Zhang        2023-06-18  560  			compatible = "snps,dw-apb-timer";
8e396880a864b8 Jisheng Zhang        2023-06-18  561  			reg = <0xff 0xefc3203c 0x0 0x14>;
89d58327fd7451 Drew Fustini         2024-08-01  562  			clocks = <&clk CLK_PERI_APB_PCLK>;
8e396880a864b8 Jisheng Zhang        2023-06-18  563  			clock-names = "timer";
8e396880a864b8 Jisheng Zhang        2023-06-18  564  			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
8e396880a864b8 Jisheng Zhang        2023-06-18  565  			status = "disabled";
8e396880a864b8 Jisheng Zhang        2023-06-18  566  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  567  
6cb6cc6d112a16 Icenowy Zheng        2025-08-14 @568  		mbox_910r: mbox@ffefc53000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
