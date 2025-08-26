Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B63233D7C
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Aug 2025 01:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756171436; cv=none; b=agyOf9xTkBiDylB8TrYxNyjOhMdY5Nt6DcBo9LTbp9H2uQqMv3MZDFkvsfHSfyKDc5bCcAp2s7SWIVgxSLr/T8OtosW93c1MSnafVJInJxg3Pi9nsD+fmX7qR7jHzQpmdfjU1G7HJGeRYo1XDgw6oLLDOtHUgXi3X3UgAHuxo3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756171436; c=relaxed/simple;
	bh=kEnAhxzwKcJUuPidu0R9m4X30e/bJPvNcxf5W/AONWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j9uPg1a1b0Ai6p7AHa51uqEkuTZ3IpzmQ7b1dneWjQ9FfCo1jDK5woLooReUUYfRDnsmdXT71nCsUw9hmw1G0FsSNdTAO6yhHhxniPltxxs+f+Vqal+2x+z6Lq6eN08Nmiu6OT/y+79E06OpB1ZSgsbDngvNDk5qHuIggMuED6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D+PgybsL; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D+PgybsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756171433; x=1787707433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kEnAhxzwKcJUuPidu0R9m4X30e/bJPvNcxf5W/AONWM=;
  b=D+PgybsLL8EpgWIPs0xidqI6bnMPVqS1IHBrjvI9JoH3pZE9D5cSweK7
   pLyGTT9q3xskVB9d6GJwL6B857Ny+uKwe91r+OpcZ0zB6QmV+TYUmWGGC
   XhB2ki04fyqkXvtfah1N4EvAcLH2HgO+8+uYRV0m8hQwZYrZfWYI0NkkB
   vQLudpHfM1nj9GSf/SdzNqiuZYzvRQwDaLYsYge1x2WEbmy/yW7XAACOm
   GjyIkyMmon4EJBffkqzF7Kw6UsBaZxWezpSktezBMYC70gVIK5Xi+zqze
   6LapjlVLThiVK8HVrG2o6vbW6MGDrm5KdmIHBoC+J2gSXvxjaf22tijLF
   A==;
X-CSE-ConnectionGUID: OnpdES/QQCqyZIU0wPpoBA==
X-CSE-MsgGUID: MPtWEJwIS/eg3eLj9hnb6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69829944"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="69829944"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 18:23:52 -0700
X-CSE-ConnectionGUID: X6C8SZ42TJ6ldcOUo1emkg==
X-CSE-MsgGUID: ilz3C4/eTQG71r5i+jssAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; 
   d="scan'208";a="200389630"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 25 Aug 2025 18:23:51 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqiPc-000O8x-0q;
	Tue, 26 Aug 2025 01:23:48 +0000
Date: Tue, 26 Aug 2025 09:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 2/24]
 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:221.5-45: Warning
 (interrupt_map): /bus@10000000/pci@1a000000/pcie@9,0:interrupt-map: Missing
 property '#address-cells' in node
 /bus@10000000/interrupt-controller@1fe11440, using 0 as fallback
Message-ID: <202508260922.8q6O2gI7-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
head:   3cbdbca6e8dc63792ddabbbb20fa0c7a54d1207c
commit: c072d2b49507420edd57ba3d87690ab81ef5273a [2/24] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
config: mips-randconfig-r054-20250825 (https://download.01.org/0day-ci/archive/20250826/202508260922.8q6O2gI7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508260922.8q6O2gI7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:221.5-45: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@9,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11440, using 0 as fallback
>> arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:240.5-45: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@a,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11440, using 0 as fallback
>> arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:259.5-45: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@b,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11440, using 0 as fallback
>> arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:278.5-45: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@c,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11440, using 0 as fallback
>> arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:297.5-45: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@d,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11440, using 0 as fallback
>> arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi:316.5-45: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@e,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11440, using 0 as fallback
--
>> arch/mips/boot/dts/loongson/ls7a-pch.dtsi:251.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@9,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/mips/boot/dts/loongson/ls7a-pch.dtsi:270.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@a,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/mips/boot/dts/loongson/ls7a-pch.dtsi:289.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@b,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/mips/boot/dts/loongson/ls7a-pch.dtsi:308.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@c,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/mips/boot/dts/loongson/ls7a-pch.dtsi:327.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@d,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/mips/boot/dts/loongson/ls7a-pch.dtsi:346.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@e,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/mips/boot/dts/loongson/ls7a-pch.dtsi:365.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@f,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:384.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@10,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:403.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@11,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:422.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@12,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:441.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@13,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/mips/boot/dts/loongson/ls7a-pch.dtsi:460.5-41: Warning (interrupt_map): /bus@10000000/pci@1a000000/pcie@14,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
--
>> arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts:81.4-86.7: Warning (interrupt_map): /bus@10000000/pci@1a000000:interrupt-map: Missing property '#address-cells' in node /bus@1fe00000/interrupt-controller@3ff01400, using 0 as fallback
>> arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts:81.4-86.7: Warning (interrupt_map): /bus@10000000/pci@1a000000:interrupt-map: Missing property '#address-cells' in node /bus@1fe00000/interrupt-controller@3ff01400, using 0 as fallback
>> arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts:81.4-86.7: Warning (interrupt_map): /bus@10000000/pci@1a000000:interrupt-map: Missing property '#address-cells' in node /bus@1fe00000/interrupt-controller@3ff01400, using 0 as fallback
>> arch/mips/boot/dts/loongson/loongson64v_4core_virtio.dts:81.4-86.7: Warning (interrupt_map): /bus@10000000/pci@1a000000:interrupt-map: Missing property '#address-cells' in node /bus@1fe00000/interrupt-controller@3ff01400, using 0 as fallback

vim +221 arch/mips/boot/dts/loongson/loongson64-2k1000.dtsi

b1a792601f264df Qing Zhang          2021-03-15    6  
b1a792601f264df Qing Zhang          2021-03-15    7  / {
b1a792601f264df Qing Zhang          2021-03-15    8  	compatible = "loongson,loongson2k1000";
b1a792601f264df Qing Zhang          2021-03-15    9  
b1a792601f264df Qing Zhang          2021-03-15   10  	#address-cells = <2>;
b1a792601f264df Qing Zhang          2021-03-15   11  	#size-cells = <2>;
b1a792601f264df Qing Zhang          2021-03-15   12  
b1a792601f264df Qing Zhang          2021-03-15   13  	cpus {
b1a792601f264df Qing Zhang          2021-03-15   14  		#address-cells = <1>;
b1a792601f264df Qing Zhang          2021-03-15   15  		#size-cells = <0>;
b1a792601f264df Qing Zhang          2021-03-15   16  
b1a792601f264df Qing Zhang          2021-03-15   17  		cpu0: cpu@0 {
b1a792601f264df Qing Zhang          2021-03-15   18  			device_type = "cpu";
b1a792601f264df Qing Zhang          2021-03-15   19  			compatible = "loongson,gs264";
b1a792601f264df Qing Zhang          2021-03-15   20  			reg = <0x0>;
b1a792601f264df Qing Zhang          2021-03-15   21  			#clock-cells = <1>;
b1a792601f264df Qing Zhang          2021-03-15   22  			clocks = <&cpu_clk>;
b1a792601f264df Qing Zhang          2021-03-15   23  		};
b1a792601f264df Qing Zhang          2021-03-15   24  	};
b1a792601f264df Qing Zhang          2021-03-15   25  
b1a792601f264df Qing Zhang          2021-03-15   26  	cpu_clk: cpu_clk {
b1a792601f264df Qing Zhang          2021-03-15   27  		#clock-cells = <0>;
b1a792601f264df Qing Zhang          2021-03-15   28  		compatible = "fixed-clock";
b1a792601f264df Qing Zhang          2021-03-15   29  		clock-frequency = <800000000>;
b1a792601f264df Qing Zhang          2021-03-15   30  	};
b1a792601f264df Qing Zhang          2021-03-15   31  
b1a792601f264df Qing Zhang          2021-03-15   32  	cpuintc: interrupt-controller {
b1a792601f264df Qing Zhang          2021-03-15   33  		#address-cells = <0>;
b1a792601f264df Qing Zhang          2021-03-15   34  		#interrupt-cells = <1>;
b1a792601f264df Qing Zhang          2021-03-15   35  		interrupt-controller;
b1a792601f264df Qing Zhang          2021-03-15   36  		compatible = "mti,cpu-interrupt-controller";
b1a792601f264df Qing Zhang          2021-03-15   37  	};
b1a792601f264df Qing Zhang          2021-03-15   38  
b1a792601f264df Qing Zhang          2021-03-15   39  	package0: bus@10000000 {
b1a792601f264df Qing Zhang          2021-03-15   40  		compatible = "simple-bus";
b1a792601f264df Qing Zhang          2021-03-15   41  		#address-cells = <2>;
b1a792601f264df Qing Zhang          2021-03-15   42  		#size-cells = <2>;
b1a792601f264df Qing Zhang          2021-03-15   43  		ranges = <0 0x10000000 0 0x10000000 0 0x10000000 /* ioports */
b1a792601f264df Qing Zhang          2021-03-15   44  			0 0x40000000 0 0x40000000 0 0x40000000
b1a792601f264df Qing Zhang          2021-03-15   45  			0xfe 0x00000000 0xfe 0x00000000 0 0x40000000>;
b1a792601f264df Qing Zhang          2021-03-15   46  
da3f62466e5afc7 Jiaxun Yang         2024-06-14   47  		isa@18000000 {
da3f62466e5afc7 Jiaxun Yang         2024-06-14   48  			compatible = "isa";
da3f62466e5afc7 Jiaxun Yang         2024-06-14   49  			#size-cells = <1>;
da3f62466e5afc7 Jiaxun Yang         2024-06-14   50  			#address-cells = <2>;
da3f62466e5afc7 Jiaxun Yang         2024-06-14   51  			ranges = <1 0x0 0x0 0x18000000 0x4000>;
da3f62466e5afc7 Jiaxun Yang         2024-06-14   52  		};
da3f62466e5afc7 Jiaxun Yang         2024-06-14   53  
a8f4fcdd8ba7d19 Qing Zhang          2021-11-26   54  		pm: reset-controller@1fe07000 {
a8f4fcdd8ba7d19 Qing Zhang          2021-11-26   55  			compatible = "loongson,ls2k-pm";
a8f4fcdd8ba7d19 Qing Zhang          2021-11-26   56  			reg = <0 0x1fe07000 0 0x422>;
a8f4fcdd8ba7d19 Qing Zhang          2021-11-26   57  		};
a8f4fcdd8ba7d19 Qing Zhang          2021-11-26   58  
b1a792601f264df Qing Zhang          2021-03-15   59  		liointc0: interrupt-controller@1fe11400 {
b1a792601f264df Qing Zhang          2021-03-15   60  			compatible = "loongson,liointc-2.0";
b1a792601f264df Qing Zhang          2021-03-15   61  			reg = <0 0x1fe11400 0 0x40>,
b1a792601f264df Qing Zhang          2021-03-15   62  				<0 0x1fe11040 0 0x8>,
b1a792601f264df Qing Zhang          2021-03-15   63  				<0 0x1fe11140 0 0x8>;
b1a792601f264df Qing Zhang          2021-03-15   64  			reg-names = "main", "isr0", "isr1";
b1a792601f264df Qing Zhang          2021-03-15   65  
b1a792601f264df Qing Zhang          2021-03-15   66  			interrupt-controller;
b1a792601f264df Qing Zhang          2021-03-15   67  			#interrupt-cells = <2>;
b1a792601f264df Qing Zhang          2021-03-15   68  
b1a792601f264df Qing Zhang          2021-03-15   69  			interrupt-parent = <&cpuintc>;
b1a792601f264df Qing Zhang          2021-03-15   70  			interrupts = <2>;
b1a792601f264df Qing Zhang          2021-03-15   71  			interrupt-names = "int0";
b1a792601f264df Qing Zhang          2021-03-15   72  
b1a792601f264df Qing Zhang          2021-03-15   73  			loongson,parent_int_map = <0xffffffff>, /* int0 */
b1a792601f264df Qing Zhang          2021-03-15   74  						<0x00000000>, /* int1 */
b1a792601f264df Qing Zhang          2021-03-15   75  						<0x00000000>, /* int2 */
b1a792601f264df Qing Zhang          2021-03-15   76  						<0x00000000>; /* int3 */
b1a792601f264df Qing Zhang          2021-03-15   77  		};
b1a792601f264df Qing Zhang          2021-03-15   78  
b1a792601f264df Qing Zhang          2021-03-15   79  		liointc1: interrupt-controller@1fe11440 {
b1a792601f264df Qing Zhang          2021-03-15   80  			compatible = "loongson,liointc-2.0";
b1a792601f264df Qing Zhang          2021-03-15   81  			reg = <0 0x1fe11440 0 0x40>,
b1a792601f264df Qing Zhang          2021-03-15   82  				<0 0x1fe11048 0 0x8>,
b1a792601f264df Qing Zhang          2021-03-15   83  				<0 0x1fe11148 0 0x8>;
b1a792601f264df Qing Zhang          2021-03-15   84  			reg-names = "main", "isr0", "isr1";
b1a792601f264df Qing Zhang          2021-03-15   85  
b1a792601f264df Qing Zhang          2021-03-15   86  			interrupt-controller;
b1a792601f264df Qing Zhang          2021-03-15   87  			#interrupt-cells = <2>;
b1a792601f264df Qing Zhang          2021-03-15   88  
b1a792601f264df Qing Zhang          2021-03-15   89  			interrupt-parent = <&cpuintc>;
b1a792601f264df Qing Zhang          2021-03-15   90  			interrupts = <3>;
b1a792601f264df Qing Zhang          2021-03-15   91  			interrupt-names = "int1";
b1a792601f264df Qing Zhang          2021-03-15   92  
b1a792601f264df Qing Zhang          2021-03-15   93  			loongson,parent_int_map = <0x00000000>, /* int0 */
b1a792601f264df Qing Zhang          2021-03-15   94  						<0xffffffff>, /* int1 */
b1a792601f264df Qing Zhang          2021-03-15   95  						<0x00000000>, /* int2 */
b1a792601f264df Qing Zhang          2021-03-15   96  						<0x00000000>; /* int3 */
b1a792601f264df Qing Zhang          2021-03-15   97  		};
b1a792601f264df Qing Zhang          2021-03-15   98  
e47084e116fccaa Binbin Zhou         2023-06-02   99  		rtc0: rtc@1fe07800 {
e47084e116fccaa Binbin Zhou         2023-06-02  100  			compatible = "loongson,ls2k1000-rtc";
e47084e116fccaa Binbin Zhou         2023-06-02  101  			reg = <0 0x1fe07800 0 0x78>;
f70fd92df7529e7 Jiaxun Yang         2024-06-14  102  			interrupt-parent = <&liointc1>;
f70fd92df7529e7 Jiaxun Yang         2024-06-14  103  			interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
e47084e116fccaa Binbin Zhou         2023-06-02  104  		};
e47084e116fccaa Binbin Zhou         2023-06-02  105  
b1a792601f264df Qing Zhang          2021-03-15  106  		uart0: serial@1fe00000 {
b1a792601f264df Qing Zhang          2021-03-15  107  			compatible = "ns16550a";
b1a792601f264df Qing Zhang          2021-03-15  108  			reg = <0 0x1fe00000 0 0x8>;
b1a792601f264df Qing Zhang          2021-03-15  109  			clock-frequency = <125000000>;
b1a792601f264df Qing Zhang          2021-03-15  110  			interrupt-parent = <&liointc0>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14  111  			interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
b1a792601f264df Qing Zhang          2021-03-15  112  			no-loopback-test;
b1a792601f264df Qing Zhang          2021-03-15  113  		};
b1a792601f264df Qing Zhang          2021-03-15  114  
b1a792601f264df Qing Zhang          2021-03-15  115  		pci@1a000000 {
b1a792601f264df Qing Zhang          2021-03-15  116  			compatible = "loongson,ls2k-pci";
b1a792601f264df Qing Zhang          2021-03-15  117  			device_type = "pci";
b1a792601f264df Qing Zhang          2021-03-15  118  			#address-cells = <3>;
b1a792601f264df Qing Zhang          2021-03-15  119  			#size-cells = <2>;
b1a792601f264df Qing Zhang          2021-03-15  120  
b1a792601f264df Qing Zhang          2021-03-15  121  			reg = <0 0x1a000000 0 0x02000000>,
b1a792601f264df Qing Zhang          2021-03-15  122  				<0xfe 0x00000000 0 0x20000000>;
b1a792601f264df Qing Zhang          2021-03-15  123  
b1a792601f264df Qing Zhang          2021-03-15  124  			ranges = <0x01000000 0x0 0x00000000 0x0 0x18000000  0x0 0x00010000>,
b1a792601f264df Qing Zhang          2021-03-15  125  				 <0x02000000 0x0 0x40000000 0x0 0x40000000  0x0 0x40000000>;
b1a792601f264df Qing Zhang          2021-03-15  126  
f8a11425075ff11 Qing Zhang          2021-06-18  127  			gmac@3,0 {
f8a11425075ff11 Qing Zhang          2021-06-18  128  				compatible = "pci0014,7a03.0",
f8a11425075ff11 Qing Zhang          2021-06-18  129  						   "pci0014,7a03",
f8a11425075ff11 Qing Zhang          2021-06-18  130  						   "pciclass0c0320",
4907a3f54b12b82 Krzysztof Kozlowski 2023-12-11  131  						   "pciclass0c03";
f8a11425075ff11 Qing Zhang          2021-06-18  132  
f8a11425075ff11 Qing Zhang          2021-06-18  133  				reg = <0x1800 0x0 0x0 0x0 0x0>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14  134  				interrupts = <12 IRQ_TYPE_LEVEL_HIGH>,
dbb69b9d6234aad Jiaxun Yang         2024-06-14  135  					     <13 IRQ_TYPE_LEVEL_HIGH>;
f8a11425075ff11 Qing Zhang          2021-06-18  136  				interrupt-names = "macirq", "eth_lpi";
f8a11425075ff11 Qing Zhang          2021-06-18  137  				interrupt-parent = <&liointc0>;
813c18d1ca1987a Jiaxun Yang         2024-06-14  138  				phy-mode = "rgmii-id";
813c18d1ca1987a Jiaxun Yang         2024-06-14  139  				phy-handle = <&phy1>;
f8a11425075ff11 Qing Zhang          2021-06-18  140  				mdio {
f8a11425075ff11 Qing Zhang          2021-06-18  141  					#address-cells = <1>;
f8a11425075ff11 Qing Zhang          2021-06-18  142  					#size-cells = <0>;
f8a11425075ff11 Qing Zhang          2021-06-18  143  					compatible = "snps,dwmac-mdio";
f8a11425075ff11 Qing Zhang          2021-06-18  144  					phy0: ethernet-phy@0 {
f8a11425075ff11 Qing Zhang          2021-06-18  145  						reg = <0>;
f8a11425075ff11 Qing Zhang          2021-06-18  146  					};
f8a11425075ff11 Qing Zhang          2021-06-18  147  				};
f8a11425075ff11 Qing Zhang          2021-06-18  148  			};
f8a11425075ff11 Qing Zhang          2021-06-18  149  
f8a11425075ff11 Qing Zhang          2021-06-18  150  			gmac@3,1 {
f8a11425075ff11 Qing Zhang          2021-06-18  151  				compatible = "pci0014,7a03.0",
f8a11425075ff11 Qing Zhang          2021-06-18  152  						   "pci0014,7a03",
f8a11425075ff11 Qing Zhang          2021-06-18  153  						   "pciclass0c0320",
f8a11425075ff11 Qing Zhang          2021-06-18  154  						   "pciclass0c03",
f8a11425075ff11 Qing Zhang          2021-06-18  155  						   "loongson, pci-gmac";
f8a11425075ff11 Qing Zhang          2021-06-18  156  
f8a11425075ff11 Qing Zhang          2021-06-18  157  				reg = <0x1900 0x0 0x0 0x0 0x0>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14  158  				interrupts = <14 IRQ_TYPE_LEVEL_HIGH>,
dbb69b9d6234aad Jiaxun Yang         2024-06-14  159  					     <15 IRQ_TYPE_LEVEL_HIGH>;
f8a11425075ff11 Qing Zhang          2021-06-18  160  				interrupt-names = "macirq", "eth_lpi";
f8a11425075ff11 Qing Zhang          2021-06-18  161  				interrupt-parent = <&liointc0>;
813c18d1ca1987a Jiaxun Yang         2024-06-14  162  				phy-mode = "rgmii-id";
813c18d1ca1987a Jiaxun Yang         2024-06-14  163  				phy-handle = <&phy1>;
f8a11425075ff11 Qing Zhang          2021-06-18  164  				mdio {
f8a11425075ff11 Qing Zhang          2021-06-18  165  					#address-cells = <1>;
f8a11425075ff11 Qing Zhang          2021-06-18  166  					#size-cells = <0>;
f8a11425075ff11 Qing Zhang          2021-06-18  167  					compatible = "snps,dwmac-mdio";
f8a11425075ff11 Qing Zhang          2021-06-18  168  					phy1: ethernet-phy@1 {
f8a11425075ff11 Qing Zhang          2021-06-18  169  						reg = <0>;
f8a11425075ff11 Qing Zhang          2021-06-18  170  					};
f8a11425075ff11 Qing Zhang          2021-06-18  171  				};
f8a11425075ff11 Qing Zhang          2021-06-18  172  			};
f8a11425075ff11 Qing Zhang          2021-06-18  173  
b1a792601f264df Qing Zhang          2021-03-15  174  			ehci@4,1 {
b1a792601f264df Qing Zhang          2021-03-15  175  				compatible = "pci0014,7a14.0",
b1a792601f264df Qing Zhang          2021-03-15  176  						   "pci0014,7a14",
b1a792601f264df Qing Zhang          2021-03-15  177  						   "pciclass0c0320",
b1a792601f264df Qing Zhang          2021-03-15  178  						   "pciclass0c03";
b1a792601f264df Qing Zhang          2021-03-15  179  
b1a792601f264df Qing Zhang          2021-03-15  180  				reg = <0x2100 0x0 0x0 0x0 0x0>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14  181  				interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
b1a792601f264df Qing Zhang          2021-03-15  182  				interrupt-parent = <&liointc1>;
b1a792601f264df Qing Zhang          2021-03-15  183  			};
b1a792601f264df Qing Zhang          2021-03-15  184  
fe3083770c8d98e xiaochuan mao       2021-04-23  185  			ohci@4,2 {
b1a792601f264df Qing Zhang          2021-03-15  186  				compatible = "pci0014,7a24.0",
b1a792601f264df Qing Zhang          2021-03-15  187  						   "pci0014,7a24",
b1a792601f264df Qing Zhang          2021-03-15  188  						   "pciclass0c0310",
b1a792601f264df Qing Zhang          2021-03-15  189  						   "pciclass0c03";
b1a792601f264df Qing Zhang          2021-03-15  190  
b1a792601f264df Qing Zhang          2021-03-15  191  				reg = <0x2200 0x0 0x0 0x0 0x0>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14  192  				interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
b1a792601f264df Qing Zhang          2021-03-15  193  				interrupt-parent = <&liointc1>;
b1a792601f264df Qing Zhang          2021-03-15  194  			};
b1a792601f264df Qing Zhang          2021-03-15  195  
b1a792601f264df Qing Zhang          2021-03-15  196  			sata@8,0 {
b1a792601f264df Qing Zhang          2021-03-15  197  				compatible = "pci0014,7a08.0",
b1a792601f264df Qing Zhang          2021-03-15  198  						   "pci0014,7a08",
b1a792601f264df Qing Zhang          2021-03-15  199  						   "pciclass010601",
b1a792601f264df Qing Zhang          2021-03-15  200  						   "pciclass0106";
b1a792601f264df Qing Zhang          2021-03-15  201  
b1a792601f264df Qing Zhang          2021-03-15  202  				reg = <0x4000 0x0 0x0 0x0 0x0>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14  203  				interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
b1a792601f264df Qing Zhang          2021-03-15  204  				interrupt-parent = <&liointc0>;
b1a792601f264df Qing Zhang          2021-03-15  205  			};
b1a792601f264df Qing Zhang          2021-03-15  206  
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  207  			pcie@9,0 {
b1a792601f264df Qing Zhang          2021-03-15  208  				compatible = "pci0014,7a19.0",
b1a792601f264df Qing Zhang          2021-03-15  209  						   "pci0014,7a19",
b1a792601f264df Qing Zhang          2021-03-15  210  						   "pciclass060400",
b1a792601f264df Qing Zhang          2021-03-15  211  						   "pciclass0604";
b1a792601f264df Qing Zhang          2021-03-15  212  
b1a792601f264df Qing Zhang          2021-03-15  213  				reg = <0x4800 0x0 0x0 0x0 0x0>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  214  				#address-cells = <3>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  215  				#size-cells = <2>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  216  				device_type = "pci";
b1a792601f264df Qing Zhang          2021-03-15  217  				#interrupt-cells = <1>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14  218  				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
b1a792601f264df Qing Zhang          2021-03-15  219  				interrupt-parent = <&liointc1>;
b1a792601f264df Qing Zhang          2021-03-15  220  				interrupt-map-mask = <0 0 0 0>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14 @221  				interrupt-map = <0 0 0 0 &liointc1 0 IRQ_TYPE_LEVEL_HIGH>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  222  				ranges;
b1a792601f264df Qing Zhang          2021-03-15  223  				external-facing;
b1a792601f264df Qing Zhang          2021-03-15  224  			};
b1a792601f264df Qing Zhang          2021-03-15  225  
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  226  			pcie@a,0 {
9fa996c5f003bea Xiaochuan Mao       2021-04-28  227  				compatible = "pci0014,7a09.0",
9fa996c5f003bea Xiaochuan Mao       2021-04-28  228  						   "pci0014,7a09",
b1a792601f264df Qing Zhang          2021-03-15  229  						   "pciclass060400",
b1a792601f264df Qing Zhang          2021-03-15  230  						   "pciclass0604";
b1a792601f264df Qing Zhang          2021-03-15  231  
b1a792601f264df Qing Zhang          2021-03-15  232  				reg = <0x5000 0x0 0x0 0x0 0x0>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  233  				#address-cells = <3>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  234  				#size-cells = <2>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  235  				device_type = "pci";
b1a792601f264df Qing Zhang          2021-03-15  236  				#interrupt-cells = <1>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14  237  				interrupts = <1 IRQ_TYPE_LEVEL_HIGH>;
b1a792601f264df Qing Zhang          2021-03-15  238  				interrupt-parent = <&liointc1>;
b1a792601f264df Qing Zhang          2021-03-15  239  				interrupt-map-mask = <0 0 0 0>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14 @240  				interrupt-map = <0 0 0 0 &liointc1 1 IRQ_TYPE_LEVEL_HIGH>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  241  				ranges;
b1a792601f264df Qing Zhang          2021-03-15  242  				external-facing;
b1a792601f264df Qing Zhang          2021-03-15  243  			};
b1a792601f264df Qing Zhang          2021-03-15  244  
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  245  			pcie@b,0 {
9fa996c5f003bea Xiaochuan Mao       2021-04-28  246  				compatible = "pci0014,7a09.0",
9fa996c5f003bea Xiaochuan Mao       2021-04-28  247  						   "pci0014,7a09",
b1a792601f264df Qing Zhang          2021-03-15  248  						   "pciclass060400",
b1a792601f264df Qing Zhang          2021-03-15  249  						   "pciclass0604";
b1a792601f264df Qing Zhang          2021-03-15  250  
b1a792601f264df Qing Zhang          2021-03-15  251  				reg = <0x5800 0x0 0x0 0x0 0x0>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  252  				#address-cells = <3>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  253  				#size-cells = <2>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  254  				device_type = "pci";
b1a792601f264df Qing Zhang          2021-03-15  255  				#interrupt-cells = <1>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14  256  				interrupts = <2 IRQ_TYPE_LEVEL_HIGH>;
b1a792601f264df Qing Zhang          2021-03-15  257  				interrupt-parent = <&liointc1>;
b1a792601f264df Qing Zhang          2021-03-15  258  				interrupt-map-mask = <0 0 0 0>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14 @259  				interrupt-map = <0 0 0 0 &liointc1 2 IRQ_TYPE_LEVEL_HIGH>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  260  				ranges;
b1a792601f264df Qing Zhang          2021-03-15  261  				external-facing;
b1a792601f264df Qing Zhang          2021-03-15  262  			};
b1a792601f264df Qing Zhang          2021-03-15  263  
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  264  			pcie@c,0 {
9fa996c5f003bea Xiaochuan Mao       2021-04-28  265  				compatible = "pci0014,7a09.0",
9fa996c5f003bea Xiaochuan Mao       2021-04-28  266  						   "pci0014,7a09",
b1a792601f264df Qing Zhang          2021-03-15  267  						   "pciclass060400",
b1a792601f264df Qing Zhang          2021-03-15  268  						   "pciclass0604";
b1a792601f264df Qing Zhang          2021-03-15  269  
b1a792601f264df Qing Zhang          2021-03-15  270  				reg = <0x6000 0x0 0x0 0x0 0x0>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  271  				#address-cells = <3>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  272  				#size-cells = <2>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  273  				device_type = "pci";
b1a792601f264df Qing Zhang          2021-03-15  274  				#interrupt-cells = <1>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14  275  				interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
b1a792601f264df Qing Zhang          2021-03-15  276  				interrupt-parent = <&liointc1>;
b1a792601f264df Qing Zhang          2021-03-15  277  				interrupt-map-mask = <0 0 0 0>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14 @278  				interrupt-map = <0 0 0 0 &liointc1 3 IRQ_TYPE_LEVEL_HIGH>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  279  				ranges;
b1a792601f264df Qing Zhang          2021-03-15  280  				external-facing;
b1a792601f264df Qing Zhang          2021-03-15  281  			};
b1a792601f264df Qing Zhang          2021-03-15  282  
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  283  			pcie@d,0 {
b1a792601f264df Qing Zhang          2021-03-15  284  				compatible = "pci0014,7a19.0",
b1a792601f264df Qing Zhang          2021-03-15  285  						   "pci0014,7a19",
b1a792601f264df Qing Zhang          2021-03-15  286  						   "pciclass060400",
b1a792601f264df Qing Zhang          2021-03-15  287  						   "pciclass0604";
b1a792601f264df Qing Zhang          2021-03-15  288  
b1a792601f264df Qing Zhang          2021-03-15  289  				reg = <0x6800 0x0 0x0 0x0 0x0>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  290  				#address-cells = <3>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  291  				#size-cells = <2>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  292  				device_type = "pci";
b1a792601f264df Qing Zhang          2021-03-15  293  				#interrupt-cells = <1>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14  294  				interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
b1a792601f264df Qing Zhang          2021-03-15  295  				interrupt-parent = <&liointc1>;
b1a792601f264df Qing Zhang          2021-03-15  296  				interrupt-map-mask = <0 0 0 0>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14 @297  				interrupt-map = <0 0 0 0 &liointc1 4 IRQ_TYPE_LEVEL_HIGH>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  298  				ranges;
b1a792601f264df Qing Zhang          2021-03-15  299  				external-facing;
b1a792601f264df Qing Zhang          2021-03-15  300  			};
b1a792601f264df Qing Zhang          2021-03-15  301  
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  302  			pcie@e,0 {
9fa996c5f003bea Xiaochuan Mao       2021-04-28  303  				compatible = "pci0014,7a09.0",
9fa996c5f003bea Xiaochuan Mao       2021-04-28  304  						   "pci0014,7a09",
b1a792601f264df Qing Zhang          2021-03-15  305  						   "pciclass060400",
b1a792601f264df Qing Zhang          2021-03-15  306  						   "pciclass0604";
b1a792601f264df Qing Zhang          2021-03-15  307  
b1a792601f264df Qing Zhang          2021-03-15  308  				reg = <0x7000 0x0 0x0 0x0 0x0>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  309  				#address-cells = <3>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  310  				#size-cells = <2>;
d89a415ff8d5e0a Jiaxun Yang         2024-05-07  311  				device_type = "pci";
b1a792601f264df Qing Zhang          2021-03-15  312  				#interrupt-cells = <1>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14  313  				interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
b1a792601f264df Qing Zhang          2021-03-15  314  				interrupt-parent = <&liointc1>;
b1a792601f264df Qing Zhang          2021-03-15  315  				interrupt-map-mask = <0 0 0 0>;
dbb69b9d6234aad Jiaxun Yang         2024-06-14 @316  				interrupt-map = <0 0 0 0 &liointc1 5 IRQ_TYPE_LEVEL_HIGH>;

:::::: The code at line 221 was first introduced by commit
:::::: dbb69b9d6234aad23b3ecd33e5bc8a8ae1485b7d MIPS: dts: loongson: Fix liointc IRQ polarity

:::::: TO: Jiaxun Yang <jiaxun.yang@flygoat.com>
:::::: CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
