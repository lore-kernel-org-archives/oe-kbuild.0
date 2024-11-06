Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF11A2E400
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 09:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730886983; cv=none; b=E+OqUkI6ugpqe8cpXmzyjXcAGfrKYjOF4fi8YLv/wVPp3Y+xC1ffuvcqF1LxxnY5VxbNXRpSBaAgb5hH7LPNBX0okmxQ2dNaAreuMxuy5wt6NI+gZ6rc46VcnPilLlLyaK5xWuWdJMQVvnzCaSNcnWA9Pq/v8NlwvRsxdEwRaCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730886983; c=relaxed/simple;
	bh=ftWxDdQAM0DZorHh5JyOSI3rVxtnVsLCcT8bUqMnyE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KZXEuF4rx0k4UECkGM2wXDigtN5FVMu/iHV3d+WZUbFX3M48zUGGKRfK9VSjXIL+ZuNqfLGmVGpnhoOehkfe/ONExqjIAi13HmpFTOPrULFy7TJPM6Zy8zGC7gSPnYye7wFq+qWfEXaFPhstDzkX2H77K4WLWNIaj5emPKymXpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FdVdwe1U; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FdVdwe1U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730886982; x=1762422982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ftWxDdQAM0DZorHh5JyOSI3rVxtnVsLCcT8bUqMnyE4=;
  b=FdVdwe1UPnbf1YI6bVuTMg3u7dyZc3ZvCJY9DaYi7UmCoGTs71wRwzlE
   /Cuxiq0aVnUO0fP/2hk3p265VsoCfp4PnPLt/8bbQA3KdEy3hnEGQz8Xb
   zyiPmXmVmcIIBQefCMPPu4mFh9Y46RSIEHxh7J2UDdzZBhbKe5fjmFFEm
   gm9kuxWTSIwjB/1F+2w02+RVDKrZQQLxSMEtJv5jUF9POlGgulIAeOUj3
   R3kjqJ3/CDBixphiJW9em2NUYQspNl33uUWMkrw8c9aIvJ+7G68frSoFA
   2eo5Rh2LQGVvYfZWMn57EEthn5kMhWtaKuIx8N//3LrxvC31WQtiP2y4Q
   Q==;
X-CSE-ConnectionGUID: OJMuDL1BSca47Kvsac/hcg==
X-CSE-MsgGUID: vPz/dc/vQ3y+q2mf3Cfuaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30445215"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30445215"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 01:56:22 -0800
X-CSE-ConnectionGUID: sHsOZvBMQZGo+8JZaejtog==
X-CSE-MsgGUID: hmVnZUEsSOiiV+hjUYmgCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="89268175"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 06 Nov 2024 01:56:20 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8clu-000nAQ-0G;
	Wed, 06 Nov 2024 09:56:18 +0000
Date: Wed, 6 Nov 2024 17:55:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning
 (pci_device_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format
 error, expected "0,0"
Message-ID: <202411061703.3M6HO4lT-lkp@intel.com>
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
TO: Paul Cercueil <paul@crapouillou.net>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2e1b3cc9d7f790145a80cb705b168f05dab65df2
commit: c434b9f80b0923e6460031b0fd964f8b0bf3c6a6 MIPS: Kconfig: add MIPS_GENERIC_KERNEL symbol
date:   4 years, 2 months ago
:::::: branch date: 33 hours ago
:::::: commit date: 4 years, 2 months ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20241106/202411061703.3M6HO4lT-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061703.3M6HO4lT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411061703.3M6HO4lT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/img/boston.dts:62.35-66.5: Warning (pci_device_reg): /pci@10000000/interrupt-controller: missing PCI reg property
   arch/mips/boot/dts/img/boston.dts:92.35-96.5: Warning (pci_device_reg): /pci@12000000/interrupt-controller: missing PCI reg property
   arch/mips/boot/dts/img/boston.dts:122.35-126.5: Warning (pci_device_reg): /pci@14000000/interrupt-controller: missing PCI reg property
>> arch/mips/boot/dts/img/boston.dts:128.19-178.5: Warning (pci_device_reg): /pci@14000000/pci2_root@0,0,0: PCI unit address format error, expected "0,0"

vim +128 arch/mips/boot/dts/img/boston.dts

6e62a888029b4a Paul Burton   2017-06-17    8  
6e62a888029b4a Paul Burton   2017-06-17    9  / {
6e62a888029b4a Paul Burton   2017-06-17   10  	#address-cells = <1>;
6e62a888029b4a Paul Burton   2017-06-17   11  	#size-cells = <1>;
6e62a888029b4a Paul Burton   2017-06-17   12  	compatible = "img,boston";
6e62a888029b4a Paul Burton   2017-06-17   13  
6e62a888029b4a Paul Burton   2017-06-17   14  	chosen {
6e62a888029b4a Paul Burton   2017-06-17   15  		stdout-path = "uart0:115200";
6e62a888029b4a Paul Burton   2017-06-17   16  	};
6e62a888029b4a Paul Burton   2017-06-17   17  
6e62a888029b4a Paul Burton   2017-06-17   18  	aliases {
6e62a888029b4a Paul Burton   2017-06-17   19  		uart0 = &uart0;
6e62a888029b4a Paul Burton   2017-06-17   20  	};
6e62a888029b4a Paul Burton   2017-06-17   21  
6e62a888029b4a Paul Burton   2017-06-17   22  	cpus {
6e62a888029b4a Paul Burton   2017-06-17   23  		#address-cells = <1>;
6e62a888029b4a Paul Burton   2017-06-17   24  		#size-cells = <0>;
6e62a888029b4a Paul Burton   2017-06-17   25  
6e62a888029b4a Paul Burton   2017-06-17   26  		cpu@0 {
6e62a888029b4a Paul Burton   2017-06-17   27  			device_type = "cpu";
6e62a888029b4a Paul Burton   2017-06-17   28  			compatible = "img,mips";
6e62a888029b4a Paul Burton   2017-06-17   29  			reg = <0>;
6e62a888029b4a Paul Burton   2017-06-17   30  			clocks = <&clk_boston BOSTON_CLK_CPU>;
6e62a888029b4a Paul Burton   2017-06-17   31  		};
6e62a888029b4a Paul Burton   2017-06-17   32  	};
6e62a888029b4a Paul Burton   2017-06-17   33  
6e62a888029b4a Paul Burton   2017-06-17   34  	memory@0 {
6e62a888029b4a Paul Burton   2017-06-17   35  		device_type = "memory";
6e62a888029b4a Paul Burton   2017-06-17   36  		reg = <0x00000000 0x10000000>;
6e62a888029b4a Paul Burton   2017-06-17   37  	};
6e62a888029b4a Paul Burton   2017-06-17   38  
6e62a888029b4a Paul Burton   2017-06-17   39  	pci0: pci@10000000 {
6e62a888029b4a Paul Burton   2017-06-17   40  		compatible = "xlnx,axi-pcie-host-1.00.a";
6e62a888029b4a Paul Burton   2017-06-17   41  		device_type = "pci";
6e62a888029b4a Paul Burton   2017-06-17   42  		reg = <0x10000000 0x2000000>;
6e62a888029b4a Paul Burton   2017-06-17   43  
6e62a888029b4a Paul Burton   2017-06-17   44  		#address-cells = <3>;
6e62a888029b4a Paul Burton   2017-06-17   45  		#size-cells = <2>;
6e62a888029b4a Paul Burton   2017-06-17   46  		#interrupt-cells = <1>;
6e62a888029b4a Paul Burton   2017-06-17   47  
6e62a888029b4a Paul Burton   2017-06-17   48  		interrupt-parent = <&gic>;
6e62a888029b4a Paul Burton   2017-06-17   49  		interrupts = <GIC_SHARED 2 IRQ_TYPE_LEVEL_HIGH>;
6e62a888029b4a Paul Burton   2017-06-17   50  
6e62a888029b4a Paul Burton   2017-06-17   51  		ranges = <0x02000000 0 0x40000000
6e62a888029b4a Paul Burton   2017-06-17   52  			  0x40000000 0 0x40000000>;
6e62a888029b4a Paul Burton   2017-06-17   53  
2c2bf522ed8cbf Matt Redfearn 2018-04-13   54  		bus-range = <0x00 0xff>;
2c2bf522ed8cbf Matt Redfearn 2018-04-13   55  
6e62a888029b4a Paul Burton   2017-06-17   56  		interrupt-map-mask = <0 0 0 7>;
6e62a888029b4a Paul Burton   2017-06-17   57  		interrupt-map = <0 0 0 1 &pci0_intc 1>,
6e62a888029b4a Paul Burton   2017-06-17   58  				<0 0 0 2 &pci0_intc 2>,
6e62a888029b4a Paul Burton   2017-06-17   59  				<0 0 0 3 &pci0_intc 3>,
6e62a888029b4a Paul Burton   2017-06-17   60  				<0 0 0 4 &pci0_intc 4>;
6e62a888029b4a Paul Burton   2017-06-17   61  
6e62a888029b4a Paul Burton   2017-06-17   62  		pci0_intc: interrupt-controller {
6e62a888029b4a Paul Burton   2017-06-17   63  			interrupt-controller;
6e62a888029b4a Paul Burton   2017-06-17   64  			#address-cells = <0>;
6e62a888029b4a Paul Burton   2017-06-17   65  			#interrupt-cells = <1>;
6e62a888029b4a Paul Burton   2017-06-17   66  		};
6e62a888029b4a Paul Burton   2017-06-17   67  	};
6e62a888029b4a Paul Burton   2017-06-17   68  
6e62a888029b4a Paul Burton   2017-06-17   69  	pci1: pci@12000000 {
6e62a888029b4a Paul Burton   2017-06-17   70  		compatible = "xlnx,axi-pcie-host-1.00.a";
6e62a888029b4a Paul Burton   2017-06-17   71  		device_type = "pci";
6e62a888029b4a Paul Burton   2017-06-17   72  		reg = <0x12000000 0x2000000>;
6e62a888029b4a Paul Burton   2017-06-17   73  
6e62a888029b4a Paul Burton   2017-06-17   74  		#address-cells = <3>;
6e62a888029b4a Paul Burton   2017-06-17   75  		#size-cells = <2>;
6e62a888029b4a Paul Burton   2017-06-17   76  		#interrupt-cells = <1>;
6e62a888029b4a Paul Burton   2017-06-17   77  
6e62a888029b4a Paul Burton   2017-06-17   78  		interrupt-parent = <&gic>;
6e62a888029b4a Paul Burton   2017-06-17   79  		interrupts = <GIC_SHARED 1 IRQ_TYPE_LEVEL_HIGH>;
6e62a888029b4a Paul Burton   2017-06-17   80  
6e62a888029b4a Paul Burton   2017-06-17   81  		ranges = <0x02000000 0 0x20000000
6e62a888029b4a Paul Burton   2017-06-17   82  			  0x20000000 0 0x20000000>;
6e62a888029b4a Paul Burton   2017-06-17   83  
2c2bf522ed8cbf Matt Redfearn 2018-04-13   84  		bus-range = <0x00 0xff>;
2c2bf522ed8cbf Matt Redfearn 2018-04-13   85  
6e62a888029b4a Paul Burton   2017-06-17   86  		interrupt-map-mask = <0 0 0 7>;
6e62a888029b4a Paul Burton   2017-06-17   87  		interrupt-map = <0 0 0 1 &pci1_intc 1>,
6e62a888029b4a Paul Burton   2017-06-17   88  				<0 0 0 2 &pci1_intc 2>,
6e62a888029b4a Paul Burton   2017-06-17   89  				<0 0 0 3 &pci1_intc 3>,
6e62a888029b4a Paul Burton   2017-06-17   90  				<0 0 0 4 &pci1_intc 4>;
6e62a888029b4a Paul Burton   2017-06-17   91  
6e62a888029b4a Paul Burton   2017-06-17   92  		pci1_intc: interrupt-controller {
6e62a888029b4a Paul Burton   2017-06-17   93  			interrupt-controller;
6e62a888029b4a Paul Burton   2017-06-17   94  			#address-cells = <0>;
6e62a888029b4a Paul Burton   2017-06-17   95  			#interrupt-cells = <1>;
6e62a888029b4a Paul Burton   2017-06-17   96  		};
6e62a888029b4a Paul Burton   2017-06-17   97  	};
6e62a888029b4a Paul Burton   2017-06-17   98  
6e62a888029b4a Paul Burton   2017-06-17   99  	pci2: pci@14000000 {
6e62a888029b4a Paul Burton   2017-06-17  100  		compatible = "xlnx,axi-pcie-host-1.00.a";
6e62a888029b4a Paul Burton   2017-06-17  101  		device_type = "pci";
6e62a888029b4a Paul Burton   2017-06-17  102  		reg = <0x14000000 0x2000000>;
6e62a888029b4a Paul Burton   2017-06-17  103  
6e62a888029b4a Paul Burton   2017-06-17  104  		#address-cells = <3>;
6e62a888029b4a Paul Burton   2017-06-17  105  		#size-cells = <2>;
6e62a888029b4a Paul Burton   2017-06-17  106  		#interrupt-cells = <1>;
6e62a888029b4a Paul Burton   2017-06-17  107  
6e62a888029b4a Paul Burton   2017-06-17  108  		interrupt-parent = <&gic>;
6e62a888029b4a Paul Burton   2017-06-17  109  		interrupts = <GIC_SHARED 0 IRQ_TYPE_LEVEL_HIGH>;
6e62a888029b4a Paul Burton   2017-06-17  110  
6e62a888029b4a Paul Burton   2017-06-17  111  		ranges = <0x02000000 0 0x16000000
6e62a888029b4a Paul Burton   2017-06-17  112  			  0x16000000 0 0x100000>;
6e62a888029b4a Paul Burton   2017-06-17  113  
2c2bf522ed8cbf Matt Redfearn 2018-04-13  114  		bus-range = <0x00 0xff>;
2c2bf522ed8cbf Matt Redfearn 2018-04-13  115  
6e62a888029b4a Paul Burton   2017-06-17  116  		interrupt-map-mask = <0 0 0 7>;
6e62a888029b4a Paul Burton   2017-06-17  117  		interrupt-map = <0 0 0 1 &pci2_intc 1>,
6e62a888029b4a Paul Burton   2017-06-17  118  				<0 0 0 2 &pci2_intc 2>,
6e62a888029b4a Paul Burton   2017-06-17  119  				<0 0 0 3 &pci2_intc 3>,
6e62a888029b4a Paul Burton   2017-06-17  120  				<0 0 0 4 &pci2_intc 4>;
6e62a888029b4a Paul Burton   2017-06-17  121  
6e62a888029b4a Paul Burton   2017-06-17  122  		pci2_intc: interrupt-controller {
6e62a888029b4a Paul Burton   2017-06-17  123  			interrupt-controller;
6e62a888029b4a Paul Burton   2017-06-17  124  			#address-cells = <0>;
6e62a888029b4a Paul Burton   2017-06-17  125  			#interrupt-cells = <1>;
6e62a888029b4a Paul Burton   2017-06-17  126  		};
6e62a888029b4a Paul Burton   2017-06-17  127  
6e62a888029b4a Paul Burton   2017-06-17 @128  		pci2_root@0,0,0 {

:::::: The code at line 128 was first introduced by commit
:::::: 6e62a888029b4adbbc55894eaa8b929221113948 MIPS: generic: Support MIPS Boston development boards

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
