Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32A7218629A
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Jun 2024 11:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717758597; cv=none; b=hKtu9tYuhUwGqcwUZ+aIcHOvpA6URHXcMprTHPVvn7k/FSQZo1X3foXWbFQKaPAWVSUxKwLhsJemCou5QDDXzxCPyKjDdtOTWC6IpknEXiY1uv6O4e3PwuqiDT4/fVDOuGI5+nVder0CcpUeFmCm60M8QH0FPw7/ezEztbASey0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717758597; c=relaxed/simple;
	bh=OzydFJpN2eboyatmlT5zYPYbZxhp/Af0NpbheENP/2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R+kXX6Mi/l4pvlvaKcf+gukfelGqq6stqS/BEMncwV9kznsGWB3c9BVCCr/V0b+fSMqQ8oBajSLhOUywqFUaju0OwEem5f4/iYYGnO51Q6WJILapVHt5sf8Ib+5PvURxVWfpElDfsvVIpRUMvwAAh9PrkcfeRSQhAPfGrVhL6SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYduNEoZ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYduNEoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717758595; x=1749294595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OzydFJpN2eboyatmlT5zYPYbZxhp/Af0NpbheENP/2g=;
  b=TYduNEoZQXLgD1MyNi/1y6cOWTmH224d9bkEIDHWdSbhAxFYqRM5p/6y
   +o9NPYsyi0Da7/rtyPqTk3hsr4yNJhvAJbm7iqYmDAhiq0duMfVl5G0sD
   5itYDYsRvOjWve+OPOBiacicwHNOoVPi3kcvGkpiiZpeb29/Kgu7qvzv1
   /j2aGfhqV7mUxSWwAt3kKRxoCud3JgLhVGar29XbAtEOC7kx7+90W9PDy
   2pD3HcTG/sYDBM3zl0PRpSv9+SMnS04XArJR/3zZlLdF73TE4DXDRvaJa
   G4KIhWqLZHeBUnBzldPynKP13niu1pnPteVAJoqRXEUa5W9XcoQvFBClb
   Q==;
X-CSE-ConnectionGUID: 2V4P71lERr6QTGTvuLBWkQ==
X-CSE-MsgGUID: lxHjZpCfS9uqNY/LDN3sUg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="25128973"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="25128973"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 04:09:54 -0700
X-CSE-ConnectionGUID: nmplLGumTL6uqMgQIwxrFA==
X-CSE-MsgGUID: pDsGGLaXQACbPTqUi3Oz1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; 
   d="scan'208";a="42709311"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 07 Jun 2024 04:09:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFXTj-0004fi-1W;
	Fri, 07 Jun 2024 11:09:51 +0000
Date: Fri, 7 Jun 2024 19:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:116.16-297.5:
 Warning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells'
 found, but node is not an interrupt provider
Message-ID: <202406071912.qEHHqytL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/Makefile.* file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a92980606e3585d72d510a03b59906e96755b8a
commit: a8528f7f31abf792f188d3f397b15aae7ed8564c dtc: Enable dtc interrupt_provider check
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
compiler: mips64el-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406071912.qEHHqytL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406071912.qEHHqytL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:116.16-297.5: Warning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/mips/boot/dts/loongson/loongson64_2core_2k1000.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
>> arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dts:28.31-36.4: Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#interrupt-cells' in interrupt provider
>> arch/mips/boot/dts/loongson/loongson64c_4core_ls7a.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
>> arch/mips/boot/dts/loongson/ls7a-pch.dtsi:68.16-416.5: Warning (interrupt_provider): /bus@10000000/pci@1a000000: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dts:32.31-40.4: Warning (interrupt_provider): /bus@10000000/msi-controller@2ff00000: Missing '#interrupt-cells' in interrupt provider
>> arch/mips/boot/dts/loongson/loongson64g_4core_ls7a.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

vim +116 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi

b1a792601f264d Qing Zhang  2021-03-15    6  
b1a792601f264d Qing Zhang  2021-03-15    7  / {
b1a792601f264d Qing Zhang  2021-03-15    8  	compatible = "loongson,loongson2k1000";
b1a792601f264d Qing Zhang  2021-03-15    9  
b1a792601f264d Qing Zhang  2021-03-15   10  	#address-cells = <2>;
b1a792601f264d Qing Zhang  2021-03-15   11  	#size-cells = <2>;
b1a792601f264d Qing Zhang  2021-03-15   12  
b1a792601f264d Qing Zhang  2021-03-15   13  	cpus {
b1a792601f264d Qing Zhang  2021-03-15   14  		#address-cells = <1>;
b1a792601f264d Qing Zhang  2021-03-15   15  		#size-cells = <0>;
b1a792601f264d Qing Zhang  2021-03-15   16  
b1a792601f264d Qing Zhang  2021-03-15   17  		cpu0: cpu@0 {
b1a792601f264d Qing Zhang  2021-03-15   18  			device_type = "cpu";
b1a792601f264d Qing Zhang  2021-03-15   19  			compatible = "loongson,gs264";
b1a792601f264d Qing Zhang  2021-03-15   20  			reg = <0x0>;
b1a792601f264d Qing Zhang  2021-03-15   21  			#clock-cells = <1>;
b1a792601f264d Qing Zhang  2021-03-15   22  			clocks = <&cpu_clk>;
b1a792601f264d Qing Zhang  2021-03-15   23  		};
b1a792601f264d Qing Zhang  2021-03-15   24  	};
b1a792601f264d Qing Zhang  2021-03-15   25  
01153887beb551 zhaoxiao    2021-05-21   26  	memory@200000 {
b1a792601f264d Qing Zhang  2021-03-15   27  		compatible = "memory";
b1a792601f264d Qing Zhang  2021-03-15   28  		device_type = "memory";
b1a792601f264d Qing Zhang  2021-03-15   29  		reg = <0x00000000 0x00200000 0x00000000 0x0ee00000>, /* 238 MB at 2 MB */
b1a792601f264d Qing Zhang  2021-03-15   30  			<0x00000000 0x20000000 0x00000000 0x1f000000>, /* 496 MB at 512 MB */
b1a792601f264d Qing Zhang  2021-03-15   31  			<0x00000001 0x10000000 0x00000001 0xb0000000>; /* 6912 MB at 4352MB */
b1a792601f264d Qing Zhang  2021-03-15   32  	};
b1a792601f264d Qing Zhang  2021-03-15   33  
b1a792601f264d Qing Zhang  2021-03-15   34  	cpu_clk: cpu_clk {
b1a792601f264d Qing Zhang  2021-03-15   35  		#clock-cells = <0>;
b1a792601f264d Qing Zhang  2021-03-15   36  		compatible = "fixed-clock";
b1a792601f264d Qing Zhang  2021-03-15   37  		clock-frequency = <800000000>;
b1a792601f264d Qing Zhang  2021-03-15   38  	};
b1a792601f264d Qing Zhang  2021-03-15   39  
b1a792601f264d Qing Zhang  2021-03-15   40  	cpuintc: interrupt-controller {
b1a792601f264d Qing Zhang  2021-03-15   41  		#address-cells = <0>;
b1a792601f264d Qing Zhang  2021-03-15   42  		#interrupt-cells = <1>;
b1a792601f264d Qing Zhang  2021-03-15   43  		interrupt-controller;
b1a792601f264d Qing Zhang  2021-03-15   44  		compatible = "mti,cpu-interrupt-controller";
b1a792601f264d Qing Zhang  2021-03-15   45  	};
b1a792601f264d Qing Zhang  2021-03-15   46  
b1a792601f264d Qing Zhang  2021-03-15   47  	package0: bus@10000000 {
b1a792601f264d Qing Zhang  2021-03-15   48  		compatible = "simple-bus";
b1a792601f264d Qing Zhang  2021-03-15   49  		#address-cells = <2>;
b1a792601f264d Qing Zhang  2021-03-15   50  		#size-cells = <2>;
b1a792601f264d Qing Zhang  2021-03-15   51  		ranges = <0 0x10000000 0 0x10000000 0 0x10000000 /* ioports */
b1a792601f264d Qing Zhang  2021-03-15   52  			0 0x40000000 0 0x40000000 0 0x40000000
b1a792601f264d Qing Zhang  2021-03-15   53  			0xfe 0x00000000 0xfe 0x00000000 0 0x40000000>;
b1a792601f264d Qing Zhang  2021-03-15   54  
a8f4fcdd8ba7d1 Qing Zhang  2021-11-26   55  		pm: reset-controller@1fe07000 {
a8f4fcdd8ba7d1 Qing Zhang  2021-11-26   56  			compatible = "loongson,ls2k-pm";
a8f4fcdd8ba7d1 Qing Zhang  2021-11-26   57  			reg = <0 0x1fe07000 0 0x422>;
a8f4fcdd8ba7d1 Qing Zhang  2021-11-26   58  		};
a8f4fcdd8ba7d1 Qing Zhang  2021-11-26   59  
b1a792601f264d Qing Zhang  2021-03-15   60  		liointc0: interrupt-controller@1fe11400 {
b1a792601f264d Qing Zhang  2021-03-15   61  			compatible = "loongson,liointc-2.0";
b1a792601f264d Qing Zhang  2021-03-15   62  			reg = <0 0x1fe11400 0 0x40>,
b1a792601f264d Qing Zhang  2021-03-15   63  				<0 0x1fe11040 0 0x8>,
b1a792601f264d Qing Zhang  2021-03-15   64  				<0 0x1fe11140 0 0x8>;
b1a792601f264d Qing Zhang  2021-03-15   65  			reg-names = "main", "isr0", "isr1";
b1a792601f264d Qing Zhang  2021-03-15   66  
b1a792601f264d Qing Zhang  2021-03-15   67  			interrupt-controller;
b1a792601f264d Qing Zhang  2021-03-15   68  			#interrupt-cells = <2>;
b1a792601f264d Qing Zhang  2021-03-15   69  
b1a792601f264d Qing Zhang  2021-03-15   70  			interrupt-parent = <&cpuintc>;
b1a792601f264d Qing Zhang  2021-03-15   71  			interrupts = <2>;
b1a792601f264d Qing Zhang  2021-03-15   72  			interrupt-names = "int0";
b1a792601f264d Qing Zhang  2021-03-15   73  
b1a792601f264d Qing Zhang  2021-03-15   74  			loongson,parent_int_map = <0xffffffff>, /* int0 */
b1a792601f264d Qing Zhang  2021-03-15   75  						<0x00000000>, /* int1 */
b1a792601f264d Qing Zhang  2021-03-15   76  						<0x00000000>, /* int2 */
b1a792601f264d Qing Zhang  2021-03-15   77  						<0x00000000>; /* int3 */
b1a792601f264d Qing Zhang  2021-03-15   78  		};
b1a792601f264d Qing Zhang  2021-03-15   79  
b1a792601f264d Qing Zhang  2021-03-15   80  		liointc1: interrupt-controller@1fe11440 {
b1a792601f264d Qing Zhang  2021-03-15   81  			compatible = "loongson,liointc-2.0";
b1a792601f264d Qing Zhang  2021-03-15   82  			reg = <0 0x1fe11440 0 0x40>,
b1a792601f264d Qing Zhang  2021-03-15   83  				<0 0x1fe11048 0 0x8>,
b1a792601f264d Qing Zhang  2021-03-15   84  				<0 0x1fe11148 0 0x8>;
b1a792601f264d Qing Zhang  2021-03-15   85  			reg-names = "main", "isr0", "isr1";
b1a792601f264d Qing Zhang  2021-03-15   86  
b1a792601f264d Qing Zhang  2021-03-15   87  			interrupt-controller;
b1a792601f264d Qing Zhang  2021-03-15   88  			#interrupt-cells = <2>;
b1a792601f264d Qing Zhang  2021-03-15   89  
b1a792601f264d Qing Zhang  2021-03-15   90  			interrupt-parent = <&cpuintc>;
b1a792601f264d Qing Zhang  2021-03-15   91  			interrupts = <3>;
b1a792601f264d Qing Zhang  2021-03-15   92  			interrupt-names = "int1";
b1a792601f264d Qing Zhang  2021-03-15   93  
b1a792601f264d Qing Zhang  2021-03-15   94  			loongson,parent_int_map = <0x00000000>, /* int0 */
b1a792601f264d Qing Zhang  2021-03-15   95  						<0xffffffff>, /* int1 */
b1a792601f264d Qing Zhang  2021-03-15   96  						<0x00000000>, /* int2 */
b1a792601f264d Qing Zhang  2021-03-15   97  						<0x00000000>; /* int3 */
b1a792601f264d Qing Zhang  2021-03-15   98  		};
b1a792601f264d Qing Zhang  2021-03-15   99  
e47084e116fcca Binbin Zhou 2023-06-02  100  		rtc0: rtc@1fe07800 {
e47084e116fcca Binbin Zhou 2023-06-02  101  			compatible = "loongson,ls2k1000-rtc";
e47084e116fcca Binbin Zhou 2023-06-02  102  			reg = <0 0x1fe07800 0 0x78>;
e47084e116fcca Binbin Zhou 2023-06-02  103  			interrupt-parent = <&liointc0>;
e47084e116fcca Binbin Zhou 2023-06-02  104  			interrupts = <60 IRQ_TYPE_LEVEL_LOW>;
e47084e116fcca Binbin Zhou 2023-06-02  105  		};
e47084e116fcca Binbin Zhou 2023-06-02  106  
b1a792601f264d Qing Zhang  2021-03-15  107  		uart0: serial@1fe00000 {
b1a792601f264d Qing Zhang  2021-03-15  108  			compatible = "ns16550a";
b1a792601f264d Qing Zhang  2021-03-15  109  			reg = <0 0x1fe00000 0 0x8>;
b1a792601f264d Qing Zhang  2021-03-15  110  			clock-frequency = <125000000>;
b1a792601f264d Qing Zhang  2021-03-15  111  			interrupt-parent = <&liointc0>;
b1a792601f264d Qing Zhang  2021-03-15  112  			interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
b1a792601f264d Qing Zhang  2021-03-15  113  			no-loopback-test;
b1a792601f264d Qing Zhang  2021-03-15  114  		};
b1a792601f264d Qing Zhang  2021-03-15  115  
b1a792601f264d Qing Zhang  2021-03-15 @116  		pci@1a000000 {

:::::: The code at line 116 was first introduced by commit
:::::: b1a792601f264df7172a728f1a83a05b6b399dfb MIPS: Loongson64: DeviceTree for Loongson-2K1000

:::::: TO: Qing Zhang <zhangqing@loongson.cn>
:::::: CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
