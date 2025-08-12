Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649F9281376
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Aug 2025 00:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754958768; cv=none; b=tIXNDJE7Xg1j+Pv4C1ojVAnERUInO8xRtqkcBDe+dJiiJxGpWiy283YMqfzNHibsjy9g0jiV6sDgcPt69jNGCkgNcq+544PvLCF6lJHK7agcEpRSTOEa4WiT105fCwiHWejgYdAFRt49h9ptqINh4Z6AtCflgIGrvxIpDGcrDlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754958768; c=relaxed/simple;
	bh=VPI86oJAePj+YuSlmyUJcdp8Xes2c3ZB7lTe4mNmoVk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DzEiHTeQrSKgpNCZr6cN4bm5GG6caU8M8bar8vcc11Mhlo4Rtrk8L9Kyu/zUrvqx1ckjyvMsjfr8D2KGKhOP4xg4sNxQzBh3pt6XPCa4ghE1mD2fpyIRrdSwC8CePrI4TimDC0yBSpylsAtsiyFBlB8kK3eML9Rds73iIOTGhlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fd7Efse/; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fd7Efse/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754958765; x=1786494765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VPI86oJAePj+YuSlmyUJcdp8Xes2c3ZB7lTe4mNmoVk=;
  b=fd7Efse/blFz3HQZVI0pGgzygas6aEnTMFTaX8ha+aMIhkAq8DHwWtNl
   h5x0rpUwy+wxfbIIhDAylaS+NjH/RfMlT8AOo76tHMlKbKVHiHEtwe4Zj
   7GZd8qjsHWhaHVe2zUbPomFzsegaVbASYj+uWRoEm1zF5YN8cVlj1V3f0
   otjUbV//Vak3WnALY0vhM0q04ZZYolGkzUv7wYcYKWHjrUHHI52kWWxuV
   jZNd08apzpMAoCEizTFEas1CqdEgFALC2+CX6FeouFYfYqreNdzW91Hg5
   uvtB0z5dScHrA1MsWpnqm5CKZG6zQkfjCkX8RzoaKiDEBNIywREUdNftO
   Q==;
X-CSE-ConnectionGUID: dLwD/8wrQa+KWrtM284qXw==
X-CSE-MsgGUID: hZRGvaM/Tj2vgqjqYBZ2Hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="56250085"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="56250085"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2025 17:32:43 -0700
X-CSE-ConnectionGUID: pZqM1FMuQj22daXXD7Z4rA==
X-CSE-MsgGUID: EHzF0XkvSda5Mr1r9grsiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="166347490"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 11 Aug 2025 17:32:41 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulcwQ-0006Jq-34;
	Tue, 12 Aug 2025 00:32:38 +0000
Date: Tue, 12 Aug 2025 08:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 2/12]
 arch/loongarch/boot/dts/loongson-2k0500.dtsi:513.5-51: Warning
 (interrupt_map): /bus@10000000/pcie@1a000000/pcie@0,0:interrupt-map: Missing
 property '#address-cells' in node
 /bus@10000000/interrupt-controller@1fe11600, using 0 as fallback
Message-ID: <202508120806.nA0foriX-lkp@intel.com>
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
head:   c2a1a5ede4717e6f12d49fe5177a66d40cbf4847
commit: c072d2b49507420edd57ba3d87690ab81ef5273a [2/12] scripts/dtc: Update to upstream version v1.7.2-35-g52f07dcca47c
:::::: branch date: 7 hours ago
:::::: commit date: 11 hours ago
config: loongarch-randconfig-052-20250812 (https://download.01.org/0day-ci/archive/20250812/202508120806.nA0foriX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250812/202508120806.nA0foriX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508120806.nA0foriX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/loongarch/boot/dts/loongson-2k0500.dtsi:513.5-51: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@0,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11600, using 0 as fallback
   arch/loongarch/boot/dts/loongson-2k0500.dtsi:525.5-51: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@1,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe11600, using 0 as fallback
--
>> arch/loongarch/boot/dts/loongson-2k1000.dtsi:498.5-55: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@9,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe01440, using 0 as fallback
>> arch/loongarch/boot/dts/loongson-2k1000.dtsi:510.5-53: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@a,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe01440, using 0 as fallback
>> arch/loongarch/boot/dts/loongson-2k1000.dtsi:522.5-53: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@b,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe01440, using 0 as fallback
>> arch/loongarch/boot/dts/loongson-2k1000.dtsi:534.5-53: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@c,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe01440, using 0 as fallback
>> arch/loongarch/boot/dts/loongson-2k1000.dtsi:546.5-53: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@d,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe01440, using 0 as fallback
>> arch/loongarch/boot/dts/loongson-2k1000.dtsi:558.5-53: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@e,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@1fe01440, using 0 as fallback
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: i2c-gpio-0 (i2c-gpio): $nodename:0: 'i2c-gpio-0' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k1000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
--
>> arch/loongarch/boot/dts/loongson-2k2000.dtsi:364.5-49: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@9,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/loongarch/boot/dts/loongson-2k2000.dtsi:376.5-49: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@a,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/loongarch/boot/dts/loongson-2k2000.dtsi:388.5-49: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@b,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/loongarch/boot/dts/loongson-2k2000.dtsi:400.5-49: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@c,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/loongarch/boot/dts/loongson-2k2000.dtsi:412.5-49: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@d,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/loongarch/boot/dts/loongson-2k2000.dtsi:424.5-49: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@e,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
>> arch/loongarch/boot/dts/loongson-2k2000.dtsi:436.5-49: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@f,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/loongarch/boot/dts/loongson-2k2000.dtsi:448.5-49: Warning (interrupt_map): /bus@10000000/pcie@1a000000/pcie@10,0:interrupt-map: Missing property '#address-cells' in node /bus@10000000/interrupt-controller@10000000, using 0 as fallback
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0:0: 12 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts:0: [12, 4] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,0:interrupts: [[12, 4], [13, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0:0: 14 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/loongson.yaml#
   arch/loongarch/boot/dts/loongson-2k2000-ref.dtb: pcie@1a000000 (loongson,ls2k-pci): ethernet@3,1:interrupts:0: [14, 4] is too long

vim +513 arch/loongarch/boot/dts/loongson-2k0500.dtsi

0f66569c85948c Binbin Zhou 2024-01-17   10  
0f66569c85948c Binbin Zhou 2024-01-17   11  / {
0f66569c85948c Binbin Zhou 2024-01-17   12  	#address-cells = <2>;
0f66569c85948c Binbin Zhou 2024-01-17   13  	#size-cells = <2>;
0f66569c85948c Binbin Zhou 2024-01-17   14  
0f66569c85948c Binbin Zhou 2024-01-17   15  	cpus {
0f66569c85948c Binbin Zhou 2024-01-17   16  		#address-cells = <1>;
0f66569c85948c Binbin Zhou 2024-01-17   17  		#size-cells = <0>;
0f66569c85948c Binbin Zhou 2024-01-17   18  
0f66569c85948c Binbin Zhou 2024-01-17   19  		cpu0: cpu@0 {
0f66569c85948c Binbin Zhou 2024-01-17   20  			compatible = "loongson,la264";
0f66569c85948c Binbin Zhou 2024-01-17   21  			device_type = "cpu";
0f66569c85948c Binbin Zhou 2024-01-17   22  			reg = <0x0>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   23  			clocks = <&clk LOONGSON2_NODE_CLK>;
0f66569c85948c Binbin Zhou 2024-01-17   24  		};
0f66569c85948c Binbin Zhou 2024-01-17   25  	};
0f66569c85948c Binbin Zhou 2024-01-17   26  
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   27  	ref_100m: clock-ref-100m {
0f66569c85948c Binbin Zhou 2024-01-17   28  		compatible = "fixed-clock";
0f66569c85948c Binbin Zhou 2024-01-17   29  		#clock-cells = <0>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   30  		clock-frequency = <100000000>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   31  		clock-output-names = "ref_100m";
0f66569c85948c Binbin Zhou 2024-01-17   32  	};
0f66569c85948c Binbin Zhou 2024-01-17   33  
0f66569c85948c Binbin Zhou 2024-01-17   34  	cpuintc: interrupt-controller {
0f66569c85948c Binbin Zhou 2024-01-17   35  		compatible = "loongson,cpu-interrupt-controller";
0f66569c85948c Binbin Zhou 2024-01-17   36  		#interrupt-cells = <1>;
0f66569c85948c Binbin Zhou 2024-01-17   37  		interrupt-controller;
0f66569c85948c Binbin Zhou 2024-01-17   38  	};
0f66569c85948c Binbin Zhou 2024-01-17   39  
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   40  	thermal-zones {
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   41  		cpu-thermal {
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   42  			polling-delay-passive = <1000>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   43  			polling-delay = <5000>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   44  			thermal-sensors = <&tsensor 0>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   45  
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   46  			trips {
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   47  				cpu-alert {
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   48  					temperature = <33000>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   49  					hysteresis = <2000>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   50  					type = "active";
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   51  				};
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   52  
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   53  				cpu-crit {
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   54  					temperature = <85000>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   55  					hysteresis = <5000>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   56  					type = "critical";
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   57  				};
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   58  			};
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   59  		};
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   60  	};
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   61  
0f66569c85948c Binbin Zhou 2024-01-17   62  	bus@10000000 {
0f66569c85948c Binbin Zhou 2024-01-17   63  		compatible = "simple-bus";
0f66569c85948c Binbin Zhou 2024-01-17   64  		ranges = <0x0 0x10000000 0x0 0x10000000 0x0 0x10000000>,
0f66569c85948c Binbin Zhou 2024-01-17   65  			 <0x0 0x02000000 0x0 0x02000000 0x0 0x02000000>,
0f66569c85948c Binbin Zhou 2024-01-17   66  			 <0x0 0x20000000 0x0 0x20000000 0x0 0x10000000>,
0f66569c85948c Binbin Zhou 2024-01-17   67  			 <0x0 0x40000000 0x0 0x40000000 0x0 0x40000000>,
0f66569c85948c Binbin Zhou 2024-01-17   68  			 <0xfe 0x0 0xfe 0x0 0x0 0x40000000>;
0f66569c85948c Binbin Zhou 2024-01-17   69  		#address-cells = <2>;
0f66569c85948c Binbin Zhou 2024-01-17   70  		#size-cells = <2>;
0f66569c85948c Binbin Zhou 2024-01-17   71  
0f66569c85948c Binbin Zhou 2024-01-17   72  		isa@16400000 {
0f66569c85948c Binbin Zhou 2024-01-17   73  			compatible = "isa";
0f66569c85948c Binbin Zhou 2024-01-17   74  			#size-cells = <1>;
0f66569c85948c Binbin Zhou 2024-01-17   75  			#address-cells = <2>;
0f66569c85948c Binbin Zhou 2024-01-17   76  			ranges = <1 0x0 0x0 0x16400000 0x4000>;
0f66569c85948c Binbin Zhou 2024-01-17   77  		};
0f66569c85948c Binbin Zhou 2024-01-17   78  
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   79  		clk: clock-controller@1fe10400 {
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   80  			compatible = "loongson,ls2k0500-clk";
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   81  			reg = <0x0 0x1fe10400 0x0 0x2c>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   82  			#clock-cells = <1>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   83  			clocks = <&ref_100m>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   84  			clock-names = "ref_100m";
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   85  		};
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   86  
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   87  		dma-controller@1fe10c00 {
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   88  			compatible = "loongson,ls2k0500-apbdma", "loongson,ls2k1000-apbdma";
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   89  			reg = <0 0x1fe10c00 0 0x8>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   90  			interrupt-parent = <&eiointc>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   91  			interrupts = <67>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   92  			clocks = <&clk LOONGSON2_APB_CLK>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   93  			#dma-cells = <1>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   94  			status = "disabled";
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   95  		};
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   96  
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   97  		dma-controller@1fe10c10 {
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   98  			compatible = "loongson,ls2k0500-apbdma", "loongson,ls2k1000-apbdma";
bd7bc02b0cfe14 Binbin Zhou 2024-05-14   99  			reg = <0 0x1fe10c10 0 0x8>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  100  			interrupt-parent = <&eiointc>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  101  			interrupts = <68>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  102  			clocks = <&clk LOONGSON2_APB_CLK>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  103  			#dma-cells = <1>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  104  			status = "disabled";
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  105  		};
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  106  
06d380c470ef98 Binbin Zhou 2025-08-05  107  		apbdma2: dma-controller@1fe10c20 {
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  108  			compatible = "loongson,ls2k0500-apbdma", "loongson,ls2k1000-apbdma";
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  109  			reg = <0 0x1fe10c20 0 0x8>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  110  			interrupt-parent = <&eiointc>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  111  			interrupts = <69>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  112  			clocks = <&clk LOONGSON2_APB_CLK>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  113  			#dma-cells = <1>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  114  			status = "disabled";
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  115  		};
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  116  
06d380c470ef98 Binbin Zhou 2025-08-05  117  		apbdma3: dma-controller@1fe10c30 {
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  118  			compatible = "loongson,ls2k0500-apbdma", "loongson,ls2k1000-apbdma";
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  119  			reg = <0 0x1fe10c30 0 0x8>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  120  			interrupt-parent = <&eiointc>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  121  			interrupts = <70>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  122  			clocks = <&clk LOONGSON2_APB_CLK>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  123  			#dma-cells = <1>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  124  			status = "disabled";
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  125  		};
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  126  
0f66569c85948c Binbin Zhou 2024-01-17  127  		liointc0: interrupt-controller@1fe11400 {
0f66569c85948c Binbin Zhou 2024-01-17  128  			compatible = "loongson,liointc-2.0";
0f66569c85948c Binbin Zhou 2024-01-17  129  			reg = <0x0 0x1fe11400 0x0 0x40>,
0f66569c85948c Binbin Zhou 2024-01-17  130  			      <0x0 0x1fe11040 0x0 0x8>;
0f66569c85948c Binbin Zhou 2024-01-17  131  			reg-names = "main", "isr0";
0f66569c85948c Binbin Zhou 2024-01-17  132  
0f66569c85948c Binbin Zhou 2024-01-17  133  			interrupt-controller;
0f66569c85948c Binbin Zhou 2024-01-17  134  			#interrupt-cells = <2>;
0f66569c85948c Binbin Zhou 2024-01-17  135  			interrupt-parent = <&cpuintc>;
0f66569c85948c Binbin Zhou 2024-01-17  136  			interrupts = <2>;
0f66569c85948c Binbin Zhou 2024-01-17  137  			interrupt-names = "int0";
0f66569c85948c Binbin Zhou 2024-01-17  138  
0f66569c85948c Binbin Zhou 2024-01-17  139  			loongson,parent_int_map = <0xffffffff>, /* int0 */
0f66569c85948c Binbin Zhou 2024-01-17  140  						  <0x00000000>, /* int1 */
0f66569c85948c Binbin Zhou 2024-01-17  141  						  <0x00000000>, /* int2 */
0f66569c85948c Binbin Zhou 2024-01-17  142  						  <0x00000000>; /* int3 */
0f66569c85948c Binbin Zhou 2024-01-17  143  		};
0f66569c85948c Binbin Zhou 2024-01-17  144  
0f66569c85948c Binbin Zhou 2024-01-17  145  		liointc1: interrupt-controller@1fe11440 {
0f66569c85948c Binbin Zhou 2024-01-17  146  			compatible = "loongson,liointc-2.0";
0f66569c85948c Binbin Zhou 2024-01-17  147  			reg = <0x0 0x1fe11440 0x0 0x40>,
0f66569c85948c Binbin Zhou 2024-01-17  148  			      <0x0 0x1fe11048 0x0 0x8>;
0f66569c85948c Binbin Zhou 2024-01-17  149  			reg-names = "main", "isr0";
0f66569c85948c Binbin Zhou 2024-01-17  150  
0f66569c85948c Binbin Zhou 2024-01-17  151  			interrupt-controller;
0f66569c85948c Binbin Zhou 2024-01-17  152  			#interrupt-cells = <2>;
0f66569c85948c Binbin Zhou 2024-01-17  153  			interrupt-parent = <&cpuintc>;
0f66569c85948c Binbin Zhou 2024-01-17  154  			interrupts = <4>;
0f66569c85948c Binbin Zhou 2024-01-17  155  			interrupt-names = "int2";
0f66569c85948c Binbin Zhou 2024-01-17  156  
0f66569c85948c Binbin Zhou 2024-01-17  157  			loongson,parent_int_map = <0x00000000>, /* int0 */
0f66569c85948c Binbin Zhou 2024-01-17  158  						  <0x00000000>, /* int1 */
0f66569c85948c Binbin Zhou 2024-01-17  159  						  <0xffffffff>, /* int2 */
0f66569c85948c Binbin Zhou 2024-01-17  160  						  <0x00000000>; /* int3 */
0f66569c85948c Binbin Zhou 2024-01-17  161  		};
0f66569c85948c Binbin Zhou 2024-01-17  162  
0f66569c85948c Binbin Zhou 2024-01-17  163  		eiointc: interrupt-controller@1fe11600 {
0f66569c85948c Binbin Zhou 2024-01-17  164  			compatible = "loongson,ls2k0500-eiointc";
0f66569c85948c Binbin Zhou 2024-01-17  165  			reg = <0x0 0x1fe11600 0x0 0xea00>;
0f66569c85948c Binbin Zhou 2024-01-17  166  			interrupt-controller;
0f66569c85948c Binbin Zhou 2024-01-17  167  			#interrupt-cells = <1>;
0f66569c85948c Binbin Zhou 2024-01-17  168  			interrupt-parent = <&cpuintc>;
0f66569c85948c Binbin Zhou 2024-01-17  169  			interrupts = <3>;
0f66569c85948c Binbin Zhou 2024-01-17  170  		};
0f66569c85948c Binbin Zhou 2024-01-17  171  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  172  		pwm@1ff5c000 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  173  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  174  			reg = <0x0 0x1ff5c000 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  175  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  176  			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  177  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  178  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  179  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  180  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  181  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  182  		pwm@1ff5c010 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  183  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  184  			reg = <0x0 0x1ff5c010 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  185  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  186  			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  187  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  188  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  189  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  190  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  191  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  192  		pwm@1ff5c020 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  193  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  194  			reg = <0x0 0x1ff5c020 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  195  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  196  			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  197  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  198  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  199  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  200  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  201  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  202  		pwm@1ff5c030 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  203  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  204  			reg = <0x0 0x1ff5c030 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  205  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  206  			interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  207  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  208  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  209  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  210  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  211  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  212  		pwm@1ff5c040 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  213  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  214  			reg = <0x0 0x1ff5c040 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  215  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  216  			interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  217  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  218  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  219  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  220  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  221  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  222  		pwm@1ff5c050 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  223  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  224  			reg = <0x0 0x1ff5c050 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  225  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  226  			interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  227  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  228  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  229  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  230  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  231  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  232  		pwm@1ff5c060 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  233  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  234  			reg = <0x0 0x1ff5c060 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  235  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  236  			interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  237  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  238  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  239  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  240  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  241  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  242  		pwm@1ff5c070 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  243  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  244  			reg = <0x0 0x1ff5c070 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  245  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  246  			interrupts = <25 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  247  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  248  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  249  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  250  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  251  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  252  		pwm@1ff5c080 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  253  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  254  			reg = <0x0 0x1ff5c080 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  255  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  256  			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  257  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  258  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  259  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  260  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  261  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  262  		pwm@1ff5c090 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  263  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  264  			reg = <0x0 0x1ff5c090 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  265  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  266  			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  267  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  268  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  269  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  270  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  271  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  272  		pwm@1ff5c0a0 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  273  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  274  			reg = <0x0 0x1ff5c0a0 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  275  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  276  			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  277  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  278  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  279  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  280  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  281  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  282  		pwm@1ff5c0b0 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  283  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  284  			reg = <0x0 0x1ff5c0b0 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  285  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  286  			interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  287  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  288  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  289  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  290  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  291  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  292  		pwm@1ff5c0c0 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  293  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  294  			reg = <0x0 0x1ff5c0c0 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  295  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  296  			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  297  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  298  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  299  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  300  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  301  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  302  		pwm@1ff5c0d0 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  303  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  304  			reg = <0x0 0x1ff5c0d0 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  305  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  306  			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  307  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  308  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  309  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  310  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  311  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  312  		pwm@1ff5c0e0 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  313  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  314  			reg = <0x0 0x1ff5c0e0 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  315  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  316  			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  317  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  318  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  319  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  320  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  321  
07aeb50e6c74e5 Binbin Zhou 2025-06-05  322  		pwm@1ff5c0f0 {
07aeb50e6c74e5 Binbin Zhou 2025-06-05  323  			compatible = "loongson,ls2k0500-pwm", "loongson,ls7a-pwm";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  324  			reg = <0x0 0x1ff5c0f0 0x0 0x10>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  325  			interrupt-parent = <&liointc0>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  326  			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  327  			clocks = <&clk LOONGSON2_APB_CLK>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  328  			#pwm-cells = <3>;
07aeb50e6c74e5 Binbin Zhou 2025-06-05  329  			status = "disabled";
07aeb50e6c74e5 Binbin Zhou 2025-06-05  330  		};
07aeb50e6c74e5 Binbin Zhou 2025-06-05  331  
0f66569c85948c Binbin Zhou 2024-01-17  332  		gmac0: ethernet@1f020000 {
0f66569c85948c Binbin Zhou 2024-01-17  333  			compatible = "snps,dwmac-3.70a";
0f66569c85948c Binbin Zhou 2024-01-17  334  			reg = <0x0 0x1f020000 0x0 0x10000>;
0f66569c85948c Binbin Zhou 2024-01-17  335  			interrupt-parent = <&liointc0>;
0f66569c85948c Binbin Zhou 2024-01-17  336  			interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
0f66569c85948c Binbin Zhou 2024-01-17  337  			interrupt-names = "macirq";
0f66569c85948c Binbin Zhou 2024-01-17  338  			status = "disabled";
0f66569c85948c Binbin Zhou 2024-01-17  339  		};
0f66569c85948c Binbin Zhou 2024-01-17  340  
0f66569c85948c Binbin Zhou 2024-01-17  341  		gmac1: ethernet@1f030000 {
0f66569c85948c Binbin Zhou 2024-01-17  342  			compatible = "snps,dwmac-3.70a";
0f66569c85948c Binbin Zhou 2024-01-17  343  			reg = <0x0 0x1f030000 0x0 0x10000>;
0f66569c85948c Binbin Zhou 2024-01-17  344  			interrupt-parent = <&liointc0>;
0f66569c85948c Binbin Zhou 2024-01-17  345  			interrupts = <14 IRQ_TYPE_LEVEL_HIGH>;
0f66569c85948c Binbin Zhou 2024-01-17  346  			interrupt-names = "macirq";
0f66569c85948c Binbin Zhou 2024-01-17  347  			status = "disabled";
0f66569c85948c Binbin Zhou 2024-01-17  348  		};
0f66569c85948c Binbin Zhou 2024-01-17  349  
0f66569c85948c Binbin Zhou 2024-01-17  350  		sata: sata@1f040000 {
0f66569c85948c Binbin Zhou 2024-01-17  351  			compatible = "snps,spear-ahci";
0f66569c85948c Binbin Zhou 2024-01-17  352  			reg = <0x0 0x1f040000 0x0 0x10000>;
0f66569c85948c Binbin Zhou 2024-01-17  353  			interrupt-parent = <&eiointc>;
0f66569c85948c Binbin Zhou 2024-01-17  354  			interrupts = <75>;
0f66569c85948c Binbin Zhou 2024-01-17  355  			status = "disabled";
0f66569c85948c Binbin Zhou 2024-01-17  356  		};
0f66569c85948c Binbin Zhou 2024-01-17  357  
0f66569c85948c Binbin Zhou 2024-01-17  358  		ehci0: usb@1f050000 {
0f66569c85948c Binbin Zhou 2024-01-17  359  			compatible = "generic-ehci";
0f66569c85948c Binbin Zhou 2024-01-17  360  			reg = <0x0 0x1f050000 0x0 0x8000>;
0f66569c85948c Binbin Zhou 2024-01-17  361  			interrupt-parent = <&eiointc>;
0f66569c85948c Binbin Zhou 2024-01-17  362  			interrupts = <71>;
0f66569c85948c Binbin Zhou 2024-01-17  363  			status = "disabled";
0f66569c85948c Binbin Zhou 2024-01-17  364  		};
0f66569c85948c Binbin Zhou 2024-01-17  365  
0f66569c85948c Binbin Zhou 2024-01-17  366  		ohci0: usb@1f058000 {
0f66569c85948c Binbin Zhou 2024-01-17  367  			compatible = "generic-ohci";
0f66569c85948c Binbin Zhou 2024-01-17  368  			reg = <0x0 0x1f058000 0x0 0x8000>;
0f66569c85948c Binbin Zhou 2024-01-17  369  			interrupt-parent = <&eiointc>;
0f66569c85948c Binbin Zhou 2024-01-17  370  			interrupts = <72>;
0f66569c85948c Binbin Zhou 2024-01-17  371  			status = "disabled";
0f66569c85948c Binbin Zhou 2024-01-17  372  		};
0f66569c85948c Binbin Zhou 2024-01-17  373  
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  374  		tsensor: thermal-sensor@1fe11500 {
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  375  			compatible = "loongson,ls2k0500-thermal", "loongson,ls2k1000-thermal";
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  376  			reg = <0x0 0x1fe11500 0x0 0x30>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  377  			interrupt-parent = <&liointc0>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  378  			interrupts = <7 IRQ_TYPE_LEVEL_HIGH>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  379  			#thermal-sensor-cells = <1>;
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  380  		};
bd7bc02b0cfe14 Binbin Zhou 2024-05-14  381  
0f66569c85948c Binbin Zhou 2024-01-17  382  		uart0: serial@1ff40800 {
0f66569c85948c Binbin Zhou 2024-01-17  383  			compatible = "ns16550a";
0f66569c85948c Binbin Zhou 2024-01-17  384  			reg = <0x0 0x1ff40800 0x0 0x10>;
0f66569c85948c Binbin Zhou 2024-01-17  385  			clock-frequency = <100000000>;
0f66569c85948c Binbin Zhou 2024-01-17  386  			interrupt-parent = <&eiointc>;
0f66569c85948c Binbin Zhou 2024-01-17  387  			interrupts = <2>;
0f66569c85948c Binbin Zhou 2024-01-17  388  			no-loopback-test;
0f66569c85948c Binbin Zhou 2024-01-17  389  			status = "disabled";
0f66569c85948c Binbin Zhou 2024-01-17  390  		};
0f66569c85948c Binbin Zhou 2024-01-17  391  
0f66569c85948c Binbin Zhou 2024-01-17  392  		i2c0: i2c@1ff48000 {
0f66569c85948c Binbin Zhou 2024-01-17  393  			compatible = "loongson,ls2k-i2c";
0f66569c85948c Binbin Zhou 2024-01-17  394  			reg = <0x0 0x1ff48000 0x0 0x0800>;
0f66569c85948c Binbin Zhou 2024-01-17  395  			interrupt-parent = <&eiointc>;
0f66569c85948c Binbin Zhou 2024-01-17  396  			interrupts = <14>;
0f66569c85948c Binbin Zhou 2024-01-17  397  			status = "disabled";
0f66569c85948c Binbin Zhou 2024-01-17  398  		};
0f66569c85948c Binbin Zhou 2024-01-17  399  
0f66569c85948c Binbin Zhou 2024-01-17  400  		i2c@1ff48800 {
0f66569c85948c Binbin Zhou 2024-01-17  401  			compatible = "loongson,ls2k-i2c";
0f66569c85948c Binbin Zhou 2024-01-17  402  			reg = <0x0 0x1ff48800 0x0 0x0800>;
0f66569c85948c Binbin Zhou 2024-01-17  403  			interrupt-parent = <&eiointc>;
0f66569c85948c Binbin Zhou 2024-01-17  404  			interrupts = <15>;
0f66569c85948c Binbin Zhou 2024-01-17  405  			status = "disabled";
0f66569c85948c Binbin Zhou 2024-01-17  406  		};
0f66569c85948c Binbin Zhou 2024-01-17  407  
0f66569c85948c Binbin Zhou 2024-01-17  408  		i2c@1ff49000 {
0f66569c85948c Binbin Zhou 2024-01-17  409  			compatible = "loongson,ls2k-i2c";
0f66569c85948c Binbin Zhou 2024-01-17  410  			reg = <0x0 0x1ff49000 0x0 0x0800>;
0f66569c85948c Binbin Zhou 2024-01-17  411  			interrupt-parent = <&eiointc>;
0f66569c85948c Binbin Zhou 2024-01-17  412  			interrupts = <16>;
0f66569c85948c Binbin Zhou 2024-01-17  413  			status = "disabled";
0f66569c85948c Binbin Zhou 2024-01-17  414  		};
0f66569c85948c Binbin Zhou 2024-01-17  415  
0f66569c85948c Binbin Zhou 2024-01-17  416  		i2c@1ff49800 {
0f66569c85948c Binbin Zhou 2024-01-17  417  			compatible = "loongson,ls2k-i2c";
0f66569c85948c Binbin Zhou 2024-01-17  418  			reg = <0x0 0x1ff49800 0x0 0x0800>;
0f66569c85948c Binbin Zhou 2024-01-17  419  			interrupt-parent = <&eiointc>;
0f66569c85948c Binbin Zhou 2024-01-17  420  			interrupts = <17>;
0f66569c85948c Binbin Zhou 2024-01-17  421  			status = "disabled";
0f66569c85948c Binbin Zhou 2024-01-17  422  		};
0f66569c85948c Binbin Zhou 2024-01-17  423  
0f66569c85948c Binbin Zhou 2024-01-17  424  		i2c@1ff4a000 {
0f66569c85948c Binbin Zhou 2024-01-17  425  			compatible = "loongson,ls2k-i2c";
0f66569c85948c Binbin Zhou 2024-01-17  426  			reg = <0x0 0x1ff4a000 0x0 0x0800>;
0f66569c85948c Binbin Zhou 2024-01-17  427  			interrupt-parent = <&eiointc>;
0f66569c85948c Binbin Zhou 2024-01-17  428  			interrupts = <18>;
0f66569c85948c Binbin Zhou 2024-01-17  429  			status = "disabled";
0f66569c85948c Binbin Zhou 2024-01-17  430  		};
0f66569c85948c Binbin Zhou 2024-01-17  431  
0f66569c85948c Binbin Zhou 2024-01-17  432  		i2c@1ff4a800 {
0f66569c85948c Binbin Zhou 2024-01-17  433  			compatible = "loongson,ls2k-i2c";
0f66569c85948c Binbin Zhou 2024-01-17  434  			reg = <0x0 0x1ff4a800 0x0 0x0800>;
0f66569c85948c Binbin Zhou 2024-01-17  435  			interrupt-parent = <&eiointc>;
0f66569c85948c Binbin Zhou 2024-01-17  436  			interrupts = <19>;
0f66569c85948c Binbin Zhou 2024-01-17  437  			status = "disabled";
0f66569c85948c Binbin Zhou 2024-01-17  438  		};
0f66569c85948c Binbin Zhou 2024-01-17  439  
06d380c470ef98 Binbin Zhou 2025-08-05  440  		mmc0: mmc@1ff64000 {
06d380c470ef98 Binbin Zhou 2025-08-05  441  			compatible = "loongson,ls2k0500-mmc";
06d380c470ef98 Binbin Zhou 2025-08-05  442  			reg = <0 0x1ff64000 0 0x2000>,
06d380c470ef98 Binbin Zhou 2025-08-05  443  			      <0 0x1fe10100 0 0x4>;
06d380c470ef98 Binbin Zhou 2025-08-05  444  			interrupt-parent = <&eiointc>;
06d380c470ef98 Binbin Zhou 2025-08-05  445  			interrupts = <57>;
06d380c470ef98 Binbin Zhou 2025-08-05  446  			dmas = <&apbdma3 0>;
06d380c470ef98 Binbin Zhou 2025-08-05  447  			dma-names = "rx-tx";
06d380c470ef98 Binbin Zhou 2025-08-05  448  			clocks = <&clk LOONGSON2_APB_CLK>;
06d380c470ef98 Binbin Zhou 2025-08-05  449  			status = "disabled";
06d380c470ef98 Binbin Zhou 2025-08-05  450  		};
06d380c470ef98 Binbin Zhou 2025-08-05  451  
06d380c470ef98 Binbin Zhou 2025-08-05  452  		mmc@1ff66000 {
06d380c470ef98 Binbin Zhou 2025-08-05  453  			compatible = "loongson,ls2k0500-mmc";
06d380c470ef98 Binbin Zhou 2025-08-05  454  			reg = <0 0x1ff66000 0 0x2000>,
06d380c470ef98 Binbin Zhou 2025-08-05  455  			      <0 0x1fe10100 0 0x4>;
06d380c470ef98 Binbin Zhou 2025-08-05  456  			interrupt-parent = <&eiointc>;
06d380c470ef98 Binbin Zhou 2025-08-05  457  			interrupts = <58>;
06d380c470ef98 Binbin Zhou 2025-08-05  458  			dmas = <&apbdma2 0>;
06d380c470ef98 Binbin Zhou 2025-08-05  459  			dma-names = "rx-tx";
06d380c470ef98 Binbin Zhou 2025-08-05  460  			clocks = <&clk LOONGSON2_APB_CLK>;
06d380c470ef98 Binbin Zhou 2025-08-05  461  			status = "disabled";
06d380c470ef98 Binbin Zhou 2025-08-05  462  		};
06d380c470ef98 Binbin Zhou 2025-08-05  463  
0f66569c85948c Binbin Zhou 2024-01-17  464  		pmc: power-management@1ff6c000 {
0f66569c85948c Binbin Zhou 2024-01-17  465  			compatible = "loongson,ls2k0500-pmc", "syscon";
0f66569c85948c Binbin Zhou 2024-01-17  466  			reg = <0x0 0x1ff6c000 0x0 0x58>;
0f66569c85948c Binbin Zhou 2024-01-17  467  			interrupt-parent = <&eiointc>;
0f66569c85948c Binbin Zhou 2024-01-17  468  			interrupts = <56>;
0f66569c85948c Binbin Zhou 2024-01-17  469  			loongson,suspend-address = <0x0 0x1c000500>;
0f66569c85948c Binbin Zhou 2024-01-17  470  
0f66569c85948c Binbin Zhou 2024-01-17  471  			syscon-reboot {
0f66569c85948c Binbin Zhou 2024-01-17  472  				compatible = "syscon-reboot";
0f66569c85948c Binbin Zhou 2024-01-17  473  				offset = <0x30>;
0f66569c85948c Binbin Zhou 2024-01-17  474  				mask = <0x1>;
0f66569c85948c Binbin Zhou 2024-01-17  475  			};
0f66569c85948c Binbin Zhou 2024-01-17  476  
0f66569c85948c Binbin Zhou 2024-01-17  477  			syscon-poweroff {
0f66569c85948c Binbin Zhou 2024-01-17  478  				compatible = "syscon-poweroff";
0f66569c85948c Binbin Zhou 2024-01-17  479  				regmap = <&pmc>;
0f66569c85948c Binbin Zhou 2024-01-17  480  				offset = <0x14>;
0f66569c85948c Binbin Zhou 2024-01-17  481  				mask = <0x3c00>;
0f66569c85948c Binbin Zhou 2024-01-17  482  				value = <0x3c00>;
0f66569c85948c Binbin Zhou 2024-01-17  483  			};
0f66569c85948c Binbin Zhou 2024-01-17  484  		};
0f66569c85948c Binbin Zhou 2024-01-17  485  
0f66569c85948c Binbin Zhou 2024-01-17  486  		rtc0: rtc@1ff6c100 {
0f66569c85948c Binbin Zhou 2024-01-17  487  			compatible = "loongson,ls2k0500-rtc", "loongson,ls7a-rtc";
0f66569c85948c Binbin Zhou 2024-01-17  488  			reg = <0x0 0x1ff6c100 0x0 0x100>;
0f66569c85948c Binbin Zhou 2024-01-17  489  			interrupt-parent = <&eiointc>;
0f66569c85948c Binbin Zhou 2024-01-17  490  			interrupts = <35>;
0f66569c85948c Binbin Zhou 2024-01-17  491  			status = "disabled";
0f66569c85948c Binbin Zhou 2024-01-17  492  		};
0f66569c85948c Binbin Zhou 2024-01-17  493  
0f66569c85948c Binbin Zhou 2024-01-17  494  		pcie@1a000000 {
0f66569c85948c Binbin Zhou 2024-01-17  495  			compatible = "loongson,ls2k-pci";
0f66569c85948c Binbin Zhou 2024-01-17  496  			reg = <0x0 0x1a000000 0x0 0x02000000>,
0f66569c85948c Binbin Zhou 2024-01-17  497  			      <0xfe 0x0 0x0 0x20000000>;
0f66569c85948c Binbin Zhou 2024-01-17  498  			#address-cells = <3>;
0f66569c85948c Binbin Zhou 2024-01-17  499  			#size-cells = <2>;
0f66569c85948c Binbin Zhou 2024-01-17  500  			device_type = "pci";
0f66569c85948c Binbin Zhou 2024-01-17  501  			bus-range = <0x0 0x5>;
0f66569c85948c Binbin Zhou 2024-01-17  502  			ranges = <0x01000000 0x0 0x00004000 0x0 0x16404000 0x0 0x00004000>,
0f66569c85948c Binbin Zhou 2024-01-17  503  				 <0x02000000 0x0 0x40000000 0x0 0x40000000 0x0 0x40000000>;
0f66569c85948c Binbin Zhou 2024-01-17  504  
0f66569c85948c Binbin Zhou 2024-01-17  505  			pcie@0,0 {
0f66569c85948c Binbin Zhou 2024-01-17  506  				reg = <0x0000 0x0 0x0 0x0 0x0>;
0f66569c85948c Binbin Zhou 2024-01-17  507  				#address-cells = <3>;
0f66569c85948c Binbin Zhou 2024-01-17  508  				#size-cells = <2>;
0f66569c85948c Binbin Zhou 2024-01-17  509  				device_type = "pci";
0f66569c85948c Binbin Zhou 2024-01-17  510  				interrupt-parent = <&eiointc>;
0f66569c85948c Binbin Zhou 2024-01-17  511  				#interrupt-cells = <1>;
0f66569c85948c Binbin Zhou 2024-01-17  512  				interrupt-map-mask = <0x0 0x0 0x0 0x0>;
0f66569c85948c Binbin Zhou 2024-01-17 @513  				interrupt-map = <0x0 0x0 0x0 0x0 &eiointc 81>;

:::::: The code at line 513 was first introduced by commit
:::::: 0f66569c85948c8b3c3edbe3e4ada6f98a4937ea LoongArch: dts: DeviceTree for Loongson-2K0500

:::::: TO: Binbin Zhou <zhoubinbin@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
