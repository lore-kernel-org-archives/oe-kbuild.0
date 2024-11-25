Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B53F1373
	for <oe-kbuild@lists.linux.dev>; Mon, 25 Nov 2024 00:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732494576; cv=none; b=OuNfXpMQE5ggB+qp7d09K4FExqlzSUtAuUMbFEX97v2tYhZrMtN95ZSpMcfcmTA3RXpLjp765IU6q0u6O/XmLhefTrSlLoOV5FX4PmyynN72hxX/QnjxjBK22NzhEbsbxVoS4XX6noqKz28mRGqkjea6Ur98/Y604OQAwa8tG3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732494576; c=relaxed/simple;
	bh=IPtCCRMZhO6eYPc+GP25xpMfUyfWBgoA4Hztu3tqrRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iHAutM+FcH/d1txumWxfC6MDy5BaC/Nr2BF6cRKDIgMniN+1PEf/loJ4ODoxazvDUdsz3tHdGBg9x1EXD7KeqB3hLFfS5A/Q+DNcC0Qp+UxxnUgJcyWhGkU+AfcPTX83zYBJ3IO0uarUTKDtbZmcDDW+UW7q1OOBSf+4NubyB4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nFpOy0Yb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nFpOy0Yb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732494573; x=1764030573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IPtCCRMZhO6eYPc+GP25xpMfUyfWBgoA4Hztu3tqrRU=;
  b=nFpOy0Yb3XPqmgkRfydMLYpgbwBuueuYoPFfidPthEzBnZQcQ7Taw6X4
   AfSXVojNif1mip2HaDoOlNERcIMG1MLdvDgKBfnGZZ+cLt0cjCbS6N/Mo
   H83BodjHdfUyBB1jd0VNELdiT8zYBFSKEcJ76iRtde3Bu1eK2rv90aPoq
   uqCQALAG/tYw5xYfA7gwjVblM9RcWZMl11ko4FC3FY2GDw2Aze0PrKZ3N
   5OLY5cx4SeAIV8Fupigs9TnghDzZbO7hq/7nmhcbywRvjCFR+IyfNtd+P
   gXn5eT146MB+eGJVJ5CDf+FqwIATVWqIGfHeAWdIr8t4Ttj5qKNQ7IakN
   w==;
X-CSE-ConnectionGUID: zgWwFduKTpmarJUpkHcjvg==
X-CSE-MsgGUID: Sy3ABJCpR++ah8J0oi5f1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="43194288"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="43194288"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2024 16:29:32 -0800
X-CSE-ConnectionGUID: xR+Q4NxrR4CXVrXsYXmAfg==
X-CSE-MsgGUID: zSGc8QPVTDGcRme/RA1jxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91008562"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 Nov 2024 16:29:31 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFMyn-0005Jd-0M;
	Mon, 25 Nov 2024 00:29:29 +0000
Date: Mon, 25 Nov 2024 08:29:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broadcom-stblinux:devicetree-arm64/next 2/8]
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi:414.11-434.4: Warning
 (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit
 name
Message-ID: <202411250840.ELYlFiDz-lkp@intel.com>
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
TO: Dave Stevenson <dave.stevenson@raspberrypi.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>

tree:   https://github.com/Broadcom/stblinux devicetree-arm64/next
head:   7f2f7b2248110a77a330a6ac9cbc527794b45f30
commit: f66b382affd8fdecc8731832f722ffe1b68c822c [2/8] arm64: dts: broadcom: Add display pipeline support to BCM2712
:::::: branch date: 6 hours ago
:::::: commit date: 7 hours ago
config: arm64-randconfig-001-20241125 (https://download.01.org/0day-ci/archive/20241125/202411250840.ELYlFiDz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411250840.ELYlFiDz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411250840.ELYlFiDz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/broadcom/bcm2712.dtsi:414.11-434.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/broadcom/bcm2712.dtsi:355.24-382.5: Warning (simple_bus_reg): /soc@107c000000/hdmi@7ef00700: simple-bus unit address format error, expected "7c701400"
>> arch/arm64/boot/dts/broadcom/bcm2712.dtsi:384.24-411.5: Warning (simple_bus_reg): /soc@107c000000/hdmi@7ef05700: simple-bus unit address format error, expected "7c706400"
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:67.21-84.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts:86.15-90.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
>> arch/arm64/boot/dts/broadcom/bcm2712.dtsi:431.12-433.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property

vim +414 arch/arm64/boot/dts/broadcom/bcm2712.dtsi

faa3381267d01a Andrea della Porta 2024-05-30    3  
faa3381267d01a Andrea della Porta 2024-05-30    4  / {
faa3381267d01a Andrea della Porta 2024-05-30    5  	compatible = "brcm,bcm2712";
faa3381267d01a Andrea della Porta 2024-05-30    6  
faa3381267d01a Andrea della Porta 2024-05-30    7  	#address-cells = <2>;
faa3381267d01a Andrea della Porta 2024-05-30    8  	#size-cells = <2>;
faa3381267d01a Andrea della Porta 2024-05-30    9  
faa3381267d01a Andrea della Porta 2024-05-30   10  	interrupt-parent = <&gicv2>;
faa3381267d01a Andrea della Porta 2024-05-30   11  
faa3381267d01a Andrea della Porta 2024-05-30   12  	clocks {
faa3381267d01a Andrea della Porta 2024-05-30   13  		/* The oscillator is the root of the clock tree. */
faa3381267d01a Andrea della Porta 2024-05-30   14  		clk_osc: clk-osc {
faa3381267d01a Andrea della Porta 2024-05-30   15  			compatible = "fixed-clock";
faa3381267d01a Andrea della Porta 2024-05-30   16  			#clock-cells = <0>;
faa3381267d01a Andrea della Porta 2024-05-30   17  			clock-output-names = "osc";
faa3381267d01a Andrea della Porta 2024-05-30   18  			clock-frequency = <54000000>;
faa3381267d01a Andrea della Porta 2024-05-30   19  		};
faa3381267d01a Andrea della Porta 2024-05-30   20  
faa3381267d01a Andrea della Porta 2024-05-30   21  		clk_vpu: clk-vpu {
faa3381267d01a Andrea della Porta 2024-05-30   22  			compatible = "fixed-clock";
faa3381267d01a Andrea della Porta 2024-05-30   23  			#clock-cells = <0>;
faa3381267d01a Andrea della Porta 2024-05-30   24  			clock-frequency = <750000000>;
faa3381267d01a Andrea della Porta 2024-05-30   25  			clock-output-names = "vpu-clock";
faa3381267d01a Andrea della Porta 2024-05-30   26  		};
faa3381267d01a Andrea della Porta 2024-05-30   27  
faa3381267d01a Andrea della Porta 2024-05-30   28  		clk_uart: clk-uart {
faa3381267d01a Andrea della Porta 2024-05-30   29  			compatible = "fixed-clock";
faa3381267d01a Andrea della Porta 2024-05-30   30  			#clock-cells = <0>;
faa3381267d01a Andrea della Porta 2024-05-30   31  			clock-frequency = <9216000>;
faa3381267d01a Andrea della Porta 2024-05-30   32  			clock-output-names = "uart-clock";
faa3381267d01a Andrea della Porta 2024-05-30   33  		};
faa3381267d01a Andrea della Porta 2024-05-30   34  
faa3381267d01a Andrea della Porta 2024-05-30   35  		clk_emmc2: clk-emmc2 {
faa3381267d01a Andrea della Porta 2024-05-30   36  			compatible = "fixed-clock";
faa3381267d01a Andrea della Porta 2024-05-30   37  			#clock-cells = <0>;
faa3381267d01a Andrea della Porta 2024-05-30   38  			clock-frequency = <200000000>;
faa3381267d01a Andrea della Porta 2024-05-30   39  			clock-output-names = "emmc2-clock";
faa3381267d01a Andrea della Porta 2024-05-30   40  		};
faa3381267d01a Andrea della Porta 2024-05-30   41  	};
faa3381267d01a Andrea della Porta 2024-05-30   42  
faa3381267d01a Andrea della Porta 2024-05-30   43  	cpus: cpus {
faa3381267d01a Andrea della Porta 2024-05-30   44  		#address-cells = <1>;
faa3381267d01a Andrea della Porta 2024-05-30   45  		#size-cells = <0>;
faa3381267d01a Andrea della Porta 2024-05-30   46  
faa3381267d01a Andrea della Porta 2024-05-30   47  		/* Source for L1 d/i cache-line-size, cache-sets, cache-size
faa3381267d01a Andrea della Porta 2024-05-30   48  		 * https://developer.arm.com/documentation/100798/0401/L1-memory-system/About-the-L1-memory-system?lang=en
faa3381267d01a Andrea della Porta 2024-05-30   49  		 * Source for L2 cache-line-size and cache-sets:
faa3381267d01a Andrea della Porta 2024-05-30   50  		 * https://developer.arm.com/documentation/100798/0401/L2-memory-system/About-the-L2-memory-system?lang=en
faa3381267d01a Andrea della Porta 2024-05-30   51  		 * and for cache-size:
faa3381267d01a Andrea della Porta 2024-05-30   52  		 * https://www.raspberrypi.com/documentation/computers/processors.html#bcm2712
faa3381267d01a Andrea della Porta 2024-05-30   53  		 */
faa3381267d01a Andrea della Porta 2024-05-30   54  		cpu0: cpu@0 {
faa3381267d01a Andrea della Porta 2024-05-30   55  			device_type = "cpu";
faa3381267d01a Andrea della Porta 2024-05-30   56  			compatible = "arm,cortex-a76";
faa3381267d01a Andrea della Porta 2024-05-30   57  			reg = <0x000>;
faa3381267d01a Andrea della Porta 2024-05-30   58  			enable-method = "psci";
faa3381267d01a Andrea della Porta 2024-05-30   59  			d-cache-size = <0x10000>;
faa3381267d01a Andrea della Porta 2024-05-30   60  			d-cache-line-size = <64>;
faa3381267d01a Andrea della Porta 2024-05-30   61  			d-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
faa3381267d01a Andrea della Porta 2024-05-30   62  			i-cache-size = <0x10000>;
faa3381267d01a Andrea della Porta 2024-05-30   63  			i-cache-line-size = <64>;
faa3381267d01a Andrea della Porta 2024-05-30   64  			i-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
faa3381267d01a Andrea della Porta 2024-05-30   65  			next-level-cache = <&l2_cache_l0>;
faa3381267d01a Andrea della Porta 2024-05-30   66  
faa3381267d01a Andrea della Porta 2024-05-30   67  			l2_cache_l0: l2-cache-l0 {
faa3381267d01a Andrea della Porta 2024-05-30   68  				compatible = "cache";
faa3381267d01a Andrea della Porta 2024-05-30   69  				cache-size = <0x80000>;
faa3381267d01a Andrea della Porta 2024-05-30   70  				cache-line-size = <128>;
faa3381267d01a Andrea della Porta 2024-05-30   71  				cache-sets = <1024>; //512KiB(size)/64(line-size)=8192ways/8-way set
faa3381267d01a Andrea della Porta 2024-05-30   72  				cache-level = <2>;
faa3381267d01a Andrea della Porta 2024-05-30   73  				cache-unified;
faa3381267d01a Andrea della Porta 2024-05-30   74  				next-level-cache = <&l3_cache>;
faa3381267d01a Andrea della Porta 2024-05-30   75  			};
faa3381267d01a Andrea della Porta 2024-05-30   76  		};
faa3381267d01a Andrea della Porta 2024-05-30   77  
faa3381267d01a Andrea della Porta 2024-05-30   78  		cpu1: cpu@1 {
faa3381267d01a Andrea della Porta 2024-05-30   79  			device_type = "cpu";
faa3381267d01a Andrea della Porta 2024-05-30   80  			compatible = "arm,cortex-a76";
faa3381267d01a Andrea della Porta 2024-05-30   81  			reg = <0x100>;
faa3381267d01a Andrea della Porta 2024-05-30   82  			enable-method = "psci";
faa3381267d01a Andrea della Porta 2024-05-30   83  			d-cache-size = <0x10000>;
faa3381267d01a Andrea della Porta 2024-05-30   84  			d-cache-line-size = <64>;
faa3381267d01a Andrea della Porta 2024-05-30   85  			d-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
faa3381267d01a Andrea della Porta 2024-05-30   86  			i-cache-size = <0x10000>;
faa3381267d01a Andrea della Porta 2024-05-30   87  			i-cache-line-size = <64>;
faa3381267d01a Andrea della Porta 2024-05-30   88  			i-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
faa3381267d01a Andrea della Porta 2024-05-30   89  			next-level-cache = <&l2_cache_l1>;
faa3381267d01a Andrea della Porta 2024-05-30   90  
faa3381267d01a Andrea della Porta 2024-05-30   91  			l2_cache_l1: l2-cache-l1 {
faa3381267d01a Andrea della Porta 2024-05-30   92  				compatible = "cache";
faa3381267d01a Andrea della Porta 2024-05-30   93  				cache-size = <0x80000>;
faa3381267d01a Andrea della Porta 2024-05-30   94  				cache-line-size = <128>;
faa3381267d01a Andrea della Porta 2024-05-30   95  				cache-sets = <1024>; //512KiB(size)/64(line-size)=8192ways/8-way set
faa3381267d01a Andrea della Porta 2024-05-30   96  				cache-level = <2>;
faa3381267d01a Andrea della Porta 2024-05-30   97  				cache-unified;
faa3381267d01a Andrea della Porta 2024-05-30   98  				next-level-cache = <&l3_cache>;
faa3381267d01a Andrea della Porta 2024-05-30   99  			};
faa3381267d01a Andrea della Porta 2024-05-30  100  		};
faa3381267d01a Andrea della Porta 2024-05-30  101  
faa3381267d01a Andrea della Porta 2024-05-30  102  		cpu2: cpu@2 {
faa3381267d01a Andrea della Porta 2024-05-30  103  			device_type = "cpu";
faa3381267d01a Andrea della Porta 2024-05-30  104  			compatible = "arm,cortex-a76";
faa3381267d01a Andrea della Porta 2024-05-30  105  			reg = <0x200>;
faa3381267d01a Andrea della Porta 2024-05-30  106  			enable-method = "psci";
faa3381267d01a Andrea della Porta 2024-05-30  107  			d-cache-size = <0x10000>;
faa3381267d01a Andrea della Porta 2024-05-30  108  			d-cache-line-size = <64>;
faa3381267d01a Andrea della Porta 2024-05-30  109  			d-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
faa3381267d01a Andrea della Porta 2024-05-30  110  			i-cache-size = <0x10000>;
faa3381267d01a Andrea della Porta 2024-05-30  111  			i-cache-line-size = <64>;
faa3381267d01a Andrea della Porta 2024-05-30  112  			i-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
faa3381267d01a Andrea della Porta 2024-05-30  113  			next-level-cache = <&l2_cache_l2>;
faa3381267d01a Andrea della Porta 2024-05-30  114  
faa3381267d01a Andrea della Porta 2024-05-30  115  			l2_cache_l2: l2-cache-l2 {
faa3381267d01a Andrea della Porta 2024-05-30  116  				compatible = "cache";
faa3381267d01a Andrea della Porta 2024-05-30  117  				cache-size = <0x80000>;
faa3381267d01a Andrea della Porta 2024-05-30  118  				cache-line-size = <128>;
faa3381267d01a Andrea della Porta 2024-05-30  119  				cache-sets = <1024>; //512KiB(size)/64(line-size)=8192ways/8-way set
faa3381267d01a Andrea della Porta 2024-05-30  120  				cache-level = <2>;
faa3381267d01a Andrea della Porta 2024-05-30  121  				cache-unified;
faa3381267d01a Andrea della Porta 2024-05-30  122  				next-level-cache = <&l3_cache>;
faa3381267d01a Andrea della Porta 2024-05-30  123  			};
faa3381267d01a Andrea della Porta 2024-05-30  124  		};
faa3381267d01a Andrea della Porta 2024-05-30  125  
faa3381267d01a Andrea della Porta 2024-05-30  126  		cpu3: cpu@3 {
faa3381267d01a Andrea della Porta 2024-05-30  127  			device_type = "cpu";
faa3381267d01a Andrea della Porta 2024-05-30  128  			compatible = "arm,cortex-a76";
faa3381267d01a Andrea della Porta 2024-05-30  129  			reg = <0x300>;
faa3381267d01a Andrea della Porta 2024-05-30  130  			enable-method = "psci";
faa3381267d01a Andrea della Porta 2024-05-30  131  			d-cache-size = <0x10000>;
faa3381267d01a Andrea della Porta 2024-05-30  132  			d-cache-line-size = <64>;
faa3381267d01a Andrea della Porta 2024-05-30  133  			d-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
faa3381267d01a Andrea della Porta 2024-05-30  134  			i-cache-size = <0x10000>;
faa3381267d01a Andrea della Porta 2024-05-30  135  			i-cache-line-size = <64>;
faa3381267d01a Andrea della Porta 2024-05-30  136  			i-cache-sets = <256>; // 64KiB(size)/64(line-size)=1024ways/4-way set
faa3381267d01a Andrea della Porta 2024-05-30  137  			next-level-cache = <&l2_cache_l3>;
faa3381267d01a Andrea della Porta 2024-05-30  138  
faa3381267d01a Andrea della Porta 2024-05-30  139  			l2_cache_l3: l2-cache-l3 {
faa3381267d01a Andrea della Porta 2024-05-30  140  				compatible = "cache";
faa3381267d01a Andrea della Porta 2024-05-30  141  				cache-size = <0x80000>;
faa3381267d01a Andrea della Porta 2024-05-30  142  				cache-line-size = <128>;
faa3381267d01a Andrea della Porta 2024-05-30  143  				cache-sets = <1024>; //512KiB(size)/64(line-size)=8192ways/8-way set
faa3381267d01a Andrea della Porta 2024-05-30  144  				cache-level = <2>;
faa3381267d01a Andrea della Porta 2024-05-30  145  				cache-unified;
faa3381267d01a Andrea della Porta 2024-05-30  146  				next-level-cache = <&l3_cache>;
faa3381267d01a Andrea della Porta 2024-05-30  147  			};
faa3381267d01a Andrea della Porta 2024-05-30  148  		};
faa3381267d01a Andrea della Porta 2024-05-30  149  
faa3381267d01a Andrea della Porta 2024-05-30  150  		/* Source for cache-line-size and cache-sets:
faa3381267d01a Andrea della Porta 2024-05-30  151  		 * https://developer.arm.com/documentation/100453/0401/L3-cache?lang=en
faa3381267d01a Andrea della Porta 2024-05-30  152  		 * Source for cache-size:
faa3381267d01a Andrea della Porta 2024-05-30  153  		 * https://www.raspberrypi.com/documentation/computers/processors.html#bcm2712
faa3381267d01a Andrea della Porta 2024-05-30  154  		 */
faa3381267d01a Andrea della Porta 2024-05-30  155  		l3_cache: l3-cache {
faa3381267d01a Andrea della Porta 2024-05-30  156  			compatible = "cache";
faa3381267d01a Andrea della Porta 2024-05-30  157  			cache-size = <0x200000>;
faa3381267d01a Andrea della Porta 2024-05-30  158  			cache-line-size = <64>;
faa3381267d01a Andrea della Porta 2024-05-30  159  			cache-sets = <2048>; // 2MiB(size)/64(line-size)=32768ways/16-way set
faa3381267d01a Andrea della Porta 2024-05-30  160  			cache-level = <3>;
faa3381267d01a Andrea della Porta 2024-05-30  161  			cache-unified;
faa3381267d01a Andrea della Porta 2024-05-30  162  		};
faa3381267d01a Andrea della Porta 2024-05-30  163  	};
faa3381267d01a Andrea della Porta 2024-05-30  164  
faa3381267d01a Andrea della Porta 2024-05-30  165  	psci {
faa3381267d01a Andrea della Porta 2024-05-30  166  		method = "smc";
faa3381267d01a Andrea della Porta 2024-05-30  167  		compatible = "arm,psci-1.0", "arm,psci-0.2";
faa3381267d01a Andrea della Porta 2024-05-30  168  	};
faa3381267d01a Andrea della Porta 2024-05-30  169  
faa3381267d01a Andrea della Porta 2024-05-30  170  	rmem: reserved-memory {
faa3381267d01a Andrea della Porta 2024-05-30  171  		ranges;
faa3381267d01a Andrea della Porta 2024-05-30  172  		#address-cells = <2>;
faa3381267d01a Andrea della Porta 2024-05-30  173  		#size-cells = <2>;
faa3381267d01a Andrea della Porta 2024-05-30  174  
faa3381267d01a Andrea della Porta 2024-05-30  175  		atf@0 {
faa3381267d01a Andrea della Porta 2024-05-30  176  			reg = <0x0 0x0 0x0 0x80000>;
faa3381267d01a Andrea della Porta 2024-05-30  177  			no-map;
faa3381267d01a Andrea della Porta 2024-05-30  178  		};
faa3381267d01a Andrea della Porta 2024-05-30  179  
faa3381267d01a Andrea della Porta 2024-05-30  180  		cma: linux,cma {
faa3381267d01a Andrea della Porta 2024-05-30  181  			compatible = "shared-dma-pool";
faa3381267d01a Andrea della Porta 2024-05-30  182  			size = <0x0 0x4000000>; /* 64MB */
faa3381267d01a Andrea della Porta 2024-05-30  183  			reusable;
faa3381267d01a Andrea della Porta 2024-05-30  184  			linux,cma-default;
faa3381267d01a Andrea della Porta 2024-05-30  185  			alloc-ranges = <0x0 0x00000000 0x0 0x40000000>;
faa3381267d01a Andrea della Porta 2024-05-30  186  		};
faa3381267d01a Andrea della Porta 2024-05-30  187  	};
faa3381267d01a Andrea della Porta 2024-05-30  188  
faa3381267d01a Andrea della Porta 2024-05-30  189  	soc: soc@107c000000 {
faa3381267d01a Andrea della Porta 2024-05-30  190  		compatible = "simple-bus";
faa3381267d01a Andrea della Porta 2024-05-30  191  		ranges = <0x00000000  0x10 0x00000000  0x80000000>;
faa3381267d01a Andrea della Porta 2024-05-30  192  		#address-cells = <1>;
faa3381267d01a Andrea della Porta 2024-05-30  193  		#size-cells = <1>;
faa3381267d01a Andrea della Porta 2024-05-30  194  
faa3381267d01a Andrea della Porta 2024-05-30  195  		sdio1: mmc@fff000 {
faa3381267d01a Andrea della Porta 2024-05-30  196  			compatible = "brcm,bcm2712-sdhci",
faa3381267d01a Andrea della Porta 2024-05-30  197  				     "brcm,sdhci-brcmstb";
faa3381267d01a Andrea della Porta 2024-05-30  198  			reg = <0x00fff000 0x260>,
faa3381267d01a Andrea della Porta 2024-05-30  199  			      <0x00fff400 0x200>;
faa3381267d01a Andrea della Porta 2024-05-30  200  			reg-names = "host", "cfg";
faa3381267d01a Andrea della Porta 2024-05-30  201  			interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>;
faa3381267d01a Andrea della Porta 2024-05-30  202  			clocks = <&clk_emmc2>;
faa3381267d01a Andrea della Porta 2024-05-30  203  			clock-names = "sw_sdio";
faa3381267d01a Andrea della Porta 2024-05-30  204  			mmc-ddr-3_3v;
faa3381267d01a Andrea della Porta 2024-05-30  205  		};
faa3381267d01a Andrea della Porta 2024-05-30  206  
faa3381267d01a Andrea della Porta 2024-05-30  207  		system_timer: timer@7c003000 {
faa3381267d01a Andrea della Porta 2024-05-30  208  			compatible = "brcm,bcm2835-system-timer";
faa3381267d01a Andrea della Porta 2024-05-30  209  			reg = <0x7c003000 0x1000>;
faa3381267d01a Andrea della Porta 2024-05-30  210  			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
faa3381267d01a Andrea della Porta 2024-05-30  211  				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
faa3381267d01a Andrea della Porta 2024-05-30  212  				     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
faa3381267d01a Andrea della Porta 2024-05-30  213  				     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
faa3381267d01a Andrea della Porta 2024-05-30  214  			clock-frequency = <1000000>;
faa3381267d01a Andrea della Porta 2024-05-30  215  		};
faa3381267d01a Andrea della Porta 2024-05-30  216  
faa3381267d01a Andrea della Porta 2024-05-30  217  		mailbox: mailbox@7c013880 {
faa3381267d01a Andrea della Porta 2024-05-30  218  			compatible = "brcm,bcm2835-mbox";
faa3381267d01a Andrea della Porta 2024-05-30  219  			reg = <0x7c013880 0x40>;
faa3381267d01a Andrea della Porta 2024-05-30  220  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
faa3381267d01a Andrea della Porta 2024-05-30  221  			#mbox-cells = <0>;
faa3381267d01a Andrea della Porta 2024-05-30  222  		};
faa3381267d01a Andrea della Porta 2024-05-30  223  
eb81f43c901ff7 Stefan Wahren      2024-08-12  224  		local_intc: interrupt-controller@7cd00000 {
faa3381267d01a Andrea della Porta 2024-05-30  225  			compatible = "brcm,bcm2836-l1-intc";
faa3381267d01a Andrea della Porta 2024-05-30  226  			reg = <0x7cd00000 0x100>;
faa3381267d01a Andrea della Porta 2024-05-30  227  		};
faa3381267d01a Andrea della Porta 2024-05-30  228  
faa3381267d01a Andrea della Porta 2024-05-30  229  		uart10: serial@7d001000 {
faa3381267d01a Andrea della Porta 2024-05-30  230  			compatible = "arm,pl011", "arm,primecell";
faa3381267d01a Andrea della Porta 2024-05-30  231  			reg = <0x7d001000 0x200>;
faa3381267d01a Andrea della Porta 2024-05-30  232  			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
faa3381267d01a Andrea della Porta 2024-05-30  233  			clocks = <&clk_uart>, <&clk_vpu>;
faa3381267d01a Andrea della Porta 2024-05-30  234  			clock-names = "uartclk", "apb_pclk";
faa3381267d01a Andrea della Porta 2024-05-30  235  			arm,primecell-periphid = <0x00241011>;
faa3381267d01a Andrea della Porta 2024-05-30  236  			status = "disabled";
faa3381267d01a Andrea della Porta 2024-05-30  237  		};
faa3381267d01a Andrea della Porta 2024-05-30  238  
faa3381267d01a Andrea della Porta 2024-05-30  239  		interrupt-controller@7d517000 {
faa3381267d01a Andrea della Porta 2024-05-30  240  			compatible = "brcm,bcm7271-l2-intc";
faa3381267d01a Andrea della Porta 2024-05-30  241  			reg = <0x7d517000 0x10>;
faa3381267d01a Andrea della Porta 2024-05-30  242  			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
faa3381267d01a Andrea della Porta 2024-05-30  243  			interrupt-controller;
faa3381267d01a Andrea della Porta 2024-05-30  244  			#interrupt-cells = <1>;
faa3381267d01a Andrea della Porta 2024-05-30  245  		};
faa3381267d01a Andrea della Porta 2024-05-30  246  
faa3381267d01a Andrea della Porta 2024-05-30  247  		gio_aon: gpio@7d517c00 {
faa3381267d01a Andrea della Porta 2024-05-30  248  			compatible = "brcm,bcm7445-gpio", "brcm,brcmstb-gpio";
faa3381267d01a Andrea della Porta 2024-05-30  249  			reg = <0x7d517c00 0x40>;
faa3381267d01a Andrea della Porta 2024-05-30  250  			gpio-controller;
faa3381267d01a Andrea della Porta 2024-05-30  251  			#gpio-cells = <2>;
faa3381267d01a Andrea della Porta 2024-05-30  252  			brcm,gpio-bank-widths = <17 6>;
faa3381267d01a Andrea della Porta 2024-05-30  253  			/* The lack of 'interrupt-controller' property here is intended:
faa3381267d01a Andrea della Porta 2024-05-30  254  			 * don't use GIO_AON as an interrupt controller because it will
faa3381267d01a Andrea della Porta 2024-05-30  255  			 * clash with the firmware monitoring the PMIC interrupt via the VPU.
faa3381267d01a Andrea della Porta 2024-05-30  256  			 */
faa3381267d01a Andrea della Porta 2024-05-30  257  		};
faa3381267d01a Andrea della Porta 2024-05-30  258  
faa3381267d01a Andrea della Porta 2024-05-30  259  		gicv2: interrupt-controller@7fff9000 {
faa3381267d01a Andrea della Porta 2024-05-30  260  			compatible = "arm,gic-400";
faa3381267d01a Andrea della Porta 2024-05-30  261  			reg = <0x7fff9000 0x1000>,
faa3381267d01a Andrea della Porta 2024-05-30  262  			      <0x7fffa000 0x2000>,
faa3381267d01a Andrea della Porta 2024-05-30  263  			      <0x7fffc000 0x2000>,
faa3381267d01a Andrea della Porta 2024-05-30  264  			      <0x7fffe000 0x2000>;
faa3381267d01a Andrea della Porta 2024-05-30  265  			interrupt-controller;
faa3381267d01a Andrea della Porta 2024-05-30  266  			#interrupt-cells = <3>;
faa3381267d01a Andrea della Porta 2024-05-30  267  		};
f66b382affd8fd Dave Stevenson     2024-10-25  268  
f66b382affd8fd Dave Stevenson     2024-10-25  269  		aon_intr: interrupt-controller@7d510600 {
f66b382affd8fd Dave Stevenson     2024-10-25  270  			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
f66b382affd8fd Dave Stevenson     2024-10-25  271  			reg = <0x7d510600 0x30>;
f66b382affd8fd Dave Stevenson     2024-10-25  272  			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
f66b382affd8fd Dave Stevenson     2024-10-25  273  			interrupt-controller;
f66b382affd8fd Dave Stevenson     2024-10-25  274  			#interrupt-cells = <1>;
f66b382affd8fd Dave Stevenson     2024-10-25  275  		};
f66b382affd8fd Dave Stevenson     2024-10-25  276  
f66b382affd8fd Dave Stevenson     2024-10-25  277  		pixelvalve0: pixelvalve@7c410000 {
f66b382affd8fd Dave Stevenson     2024-10-25  278  			compatible = "brcm,bcm2712-pixelvalve0";
f66b382affd8fd Dave Stevenson     2024-10-25  279  			reg = <0x7c410000 0x100>;
f66b382affd8fd Dave Stevenson     2024-10-25  280  			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
f66b382affd8fd Dave Stevenson     2024-10-25  281  		};
f66b382affd8fd Dave Stevenson     2024-10-25  282  
f66b382affd8fd Dave Stevenson     2024-10-25  283  		pixelvalve1: pixelvalve@7c411000 {
f66b382affd8fd Dave Stevenson     2024-10-25  284  			compatible = "brcm,bcm2712-pixelvalve1";
f66b382affd8fd Dave Stevenson     2024-10-25  285  			reg = <0x7c411000 0x100>;
f66b382affd8fd Dave Stevenson     2024-10-25  286  			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
f66b382affd8fd Dave Stevenson     2024-10-25  287  		};
f66b382affd8fd Dave Stevenson     2024-10-25  288  
f66b382affd8fd Dave Stevenson     2024-10-25  289  		mop: mop@7c500000 {
f66b382affd8fd Dave Stevenson     2024-10-25  290  			compatible = "brcm,bcm2712-mop";
f66b382affd8fd Dave Stevenson     2024-10-25  291  			reg = <0x7c500000 0x28>;
f66b382affd8fd Dave Stevenson     2024-10-25  292  			interrupt-parent = <&disp_intr>;
f66b382affd8fd Dave Stevenson     2024-10-25  293  			interrupts = <1>;
f66b382affd8fd Dave Stevenson     2024-10-25  294  		};
f66b382affd8fd Dave Stevenson     2024-10-25  295  
f66b382affd8fd Dave Stevenson     2024-10-25  296  		moplet: moplet@7c501000 {
f66b382affd8fd Dave Stevenson     2024-10-25  297  			compatible = "brcm,bcm2712-moplet";
f66b382affd8fd Dave Stevenson     2024-10-25  298  			reg = <0x7c501000 0x20>;
f66b382affd8fd Dave Stevenson     2024-10-25  299  			interrupt-parent = <&disp_intr>;
f66b382affd8fd Dave Stevenson     2024-10-25  300  			interrupts = <0>;
f66b382affd8fd Dave Stevenson     2024-10-25  301  		};
f66b382affd8fd Dave Stevenson     2024-10-25  302  
f66b382affd8fd Dave Stevenson     2024-10-25  303  		disp_intr: interrupt-controller@7c502000 {
f66b382affd8fd Dave Stevenson     2024-10-25  304  			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
f66b382affd8fd Dave Stevenson     2024-10-25  305  			reg = <0x7c502000 0x30>;
f66b382affd8fd Dave Stevenson     2024-10-25  306  			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
f66b382affd8fd Dave Stevenson     2024-10-25  307  			interrupt-controller;
f66b382affd8fd Dave Stevenson     2024-10-25  308  			#interrupt-cells = <1>;
f66b382affd8fd Dave Stevenson     2024-10-25  309  		};
f66b382affd8fd Dave Stevenson     2024-10-25  310  
f66b382affd8fd Dave Stevenson     2024-10-25  311  		dvp: clock@7c700000 {
f66b382affd8fd Dave Stevenson     2024-10-25  312  			compatible = "brcm,brcm2711-dvp";
f66b382affd8fd Dave Stevenson     2024-10-25  313  			reg = <0x7c700000 0x10>;
f66b382affd8fd Dave Stevenson     2024-10-25  314  			clocks = <&clk_108MHz>;
f66b382affd8fd Dave Stevenson     2024-10-25  315  			#clock-cells = <1>;
f66b382affd8fd Dave Stevenson     2024-10-25  316  			#reset-cells = <1>;
f66b382affd8fd Dave Stevenson     2024-10-25  317  		};
f66b382affd8fd Dave Stevenson     2024-10-25  318  
f66b382affd8fd Dave Stevenson     2024-10-25  319  		ddc0: i2c@7d508200 {
f66b382affd8fd Dave Stevenson     2024-10-25  320  			compatible = "brcm,brcmstb-i2c";
f66b382affd8fd Dave Stevenson     2024-10-25  321  			reg = <0x7d508200 0x58>;
f66b382affd8fd Dave Stevenson     2024-10-25  322  			interrupt-parent = <&bsc_irq>;
f66b382affd8fd Dave Stevenson     2024-10-25  323  			interrupts = <1>;
f66b382affd8fd Dave Stevenson     2024-10-25  324  			clock-frequency = <97500>;
f66b382affd8fd Dave Stevenson     2024-10-25  325  			#address-cells = <1>;
f66b382affd8fd Dave Stevenson     2024-10-25  326  			#size-cells = <0>;
f66b382affd8fd Dave Stevenson     2024-10-25  327  		};
f66b382affd8fd Dave Stevenson     2024-10-25  328  
f66b382affd8fd Dave Stevenson     2024-10-25  329  		ddc1: i2c@7d508280 {
f66b382affd8fd Dave Stevenson     2024-10-25  330  			compatible = "brcm,brcmstb-i2c";
f66b382affd8fd Dave Stevenson     2024-10-25  331  			reg = <0x7d508280 0x58>;
f66b382affd8fd Dave Stevenson     2024-10-25  332  			interrupt-parent = <&bsc_irq>;
f66b382affd8fd Dave Stevenson     2024-10-25  333  			interrupts = <2>;
f66b382affd8fd Dave Stevenson     2024-10-25  334  			clock-frequency = <97500>;
f66b382affd8fd Dave Stevenson     2024-10-25  335  			#address-cells = <1>;
f66b382affd8fd Dave Stevenson     2024-10-25  336  			#size-cells = <0>;
f66b382affd8fd Dave Stevenson     2024-10-25  337  		};
f66b382affd8fd Dave Stevenson     2024-10-25  338  
f66b382affd8fd Dave Stevenson     2024-10-25  339  		bsc_irq: intc@7d508380 {
f66b382affd8fd Dave Stevenson     2024-10-25  340  			compatible = "brcm,bcm7271-l2-intc";
f66b382affd8fd Dave Stevenson     2024-10-25  341  			reg = <0x7d508380 0x10>;
f66b382affd8fd Dave Stevenson     2024-10-25  342  			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
f66b382affd8fd Dave Stevenson     2024-10-25  343  			interrupt-controller;
f66b382affd8fd Dave Stevenson     2024-10-25  344  			#interrupt-cells = <1>;
f66b382affd8fd Dave Stevenson     2024-10-25  345  		};
f66b382affd8fd Dave Stevenson     2024-10-25  346  
f66b382affd8fd Dave Stevenson     2024-10-25  347  		main_irq: intc@7d508400 {
f66b382affd8fd Dave Stevenson     2024-10-25  348  			compatible = "brcm,bcm7271-l2-intc";
f66b382affd8fd Dave Stevenson     2024-10-25  349  			reg = <0x7d508400 0x10>;
f66b382affd8fd Dave Stevenson     2024-10-25  350  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
f66b382affd8fd Dave Stevenson     2024-10-25  351  			interrupt-controller;
f66b382affd8fd Dave Stevenson     2024-10-25  352  			#interrupt-cells = <1>;
f66b382affd8fd Dave Stevenson     2024-10-25  353  		};
f66b382affd8fd Dave Stevenson     2024-10-25  354  
f66b382affd8fd Dave Stevenson     2024-10-25 @355  		hdmi0: hdmi@7ef00700 {
f66b382affd8fd Dave Stevenson     2024-10-25  356  			compatible = "brcm,bcm2712-hdmi0";
f66b382affd8fd Dave Stevenson     2024-10-25  357  			reg = <0x7c701400 0x300>,
f66b382affd8fd Dave Stevenson     2024-10-25  358  			      <0x7c701000 0x200>,
f66b382affd8fd Dave Stevenson     2024-10-25  359  			      <0x7c701d00 0x300>,
f66b382affd8fd Dave Stevenson     2024-10-25  360  			      <0x7c702000 0x80>,
f66b382affd8fd Dave Stevenson     2024-10-25  361  			      <0x7c703800 0x200>,
f66b382affd8fd Dave Stevenson     2024-10-25  362  			      <0x7c704000 0x800>,
f66b382affd8fd Dave Stevenson     2024-10-25  363  			      <0x7c700100 0x80>,
f66b382affd8fd Dave Stevenson     2024-10-25  364  			      <0x7d510800 0x100>,
f66b382affd8fd Dave Stevenson     2024-10-25  365  			      <0x7c720000 0x100>;
f66b382affd8fd Dave Stevenson     2024-10-25  366  			reg-names = "hdmi",
f66b382affd8fd Dave Stevenson     2024-10-25  367  				    "dvp",
f66b382affd8fd Dave Stevenson     2024-10-25  368  				    "phy",
f66b382affd8fd Dave Stevenson     2024-10-25  369  				    "rm",
f66b382affd8fd Dave Stevenson     2024-10-25  370  				    "packet",
f66b382affd8fd Dave Stevenson     2024-10-25  371  				    "metadata",
f66b382affd8fd Dave Stevenson     2024-10-25  372  				    "csc",
f66b382affd8fd Dave Stevenson     2024-10-25  373  				    "cec",
f66b382affd8fd Dave Stevenson     2024-10-25  374  				    "hd";
f66b382affd8fd Dave Stevenson     2024-10-25  375  			resets = <&dvp 1>;
f66b382affd8fd Dave Stevenson     2024-10-25  376  			interrupt-parent = <&aon_intr>;
f66b382affd8fd Dave Stevenson     2024-10-25  377  			interrupts = <1>, <2>, <3>,
f66b382affd8fd Dave Stevenson     2024-10-25  378  				     <7>, <8>;
f66b382affd8fd Dave Stevenson     2024-10-25  379  			interrupt-names = "cec-tx", "cec-rx", "cec-low",
f66b382affd8fd Dave Stevenson     2024-10-25  380  					  "hpd-connected", "hpd-removed";
f66b382affd8fd Dave Stevenson     2024-10-25  381  			ddc = <&ddc0>;
f66b382affd8fd Dave Stevenson     2024-10-25  382  		};
f66b382affd8fd Dave Stevenson     2024-10-25  383  
f66b382affd8fd Dave Stevenson     2024-10-25 @384  		hdmi1: hdmi@7ef05700 {
f66b382affd8fd Dave Stevenson     2024-10-25  385  			compatible = "brcm,bcm2712-hdmi1";
f66b382affd8fd Dave Stevenson     2024-10-25  386  			reg = <0x7c706400 0x300>,
f66b382affd8fd Dave Stevenson     2024-10-25  387  			      <0x7c706000 0x200>,
f66b382affd8fd Dave Stevenson     2024-10-25  388  			      <0x7c706d00 0x300>,
f66b382affd8fd Dave Stevenson     2024-10-25  389  			      <0x7c707000 0x80>,
f66b382affd8fd Dave Stevenson     2024-10-25  390  			      <0x7c708800 0x200>,
f66b382affd8fd Dave Stevenson     2024-10-25  391  			      <0x7c709000 0x800>,
f66b382affd8fd Dave Stevenson     2024-10-25  392  			      <0x7c700180 0x80>,
f66b382affd8fd Dave Stevenson     2024-10-25  393  			      <0x7d511000 0x100>,
f66b382affd8fd Dave Stevenson     2024-10-25  394  			      <0x7c720000 0x100>;
f66b382affd8fd Dave Stevenson     2024-10-25  395  			reg-names = "hdmi",
f66b382affd8fd Dave Stevenson     2024-10-25  396  				    "dvp",
f66b382affd8fd Dave Stevenson     2024-10-25  397  				    "phy",
f66b382affd8fd Dave Stevenson     2024-10-25  398  				    "rm",
f66b382affd8fd Dave Stevenson     2024-10-25  399  				    "packet",
f66b382affd8fd Dave Stevenson     2024-10-25  400  				    "metadata",
f66b382affd8fd Dave Stevenson     2024-10-25  401  				    "csc",
f66b382affd8fd Dave Stevenson     2024-10-25  402  				    "cec",
f66b382affd8fd Dave Stevenson     2024-10-25  403  				    "hd";
f66b382affd8fd Dave Stevenson     2024-10-25  404  			resets = <&dvp 2>;
f66b382affd8fd Dave Stevenson     2024-10-25  405  			interrupt-parent = <&aon_intr>;
f66b382affd8fd Dave Stevenson     2024-10-25  406  			interrupts = <11>, <12>, <13>,
f66b382affd8fd Dave Stevenson     2024-10-25  407  				     <14>, <15>;
f66b382affd8fd Dave Stevenson     2024-10-25  408  			interrupt-names = "cec-tx", "cec-rx", "cec-low",
f66b382affd8fd Dave Stevenson     2024-10-25  409  					  "hpd-connected", "hpd-removed";
f66b382affd8fd Dave Stevenson     2024-10-25  410  			ddc = <&ddc1>;
f66b382affd8fd Dave Stevenson     2024-10-25  411  		};
f66b382affd8fd Dave Stevenson     2024-10-25  412  	};
f66b382affd8fd Dave Stevenson     2024-10-25  413  
f66b382affd8fd Dave Stevenson     2024-10-25 @414  	axi: axi {
f66b382affd8fd Dave Stevenson     2024-10-25  415  		compatible = "simple-bus";
f66b382affd8fd Dave Stevenson     2024-10-25  416  		#address-cells = <2>;
f66b382affd8fd Dave Stevenson     2024-10-25  417  		#size-cells = <2>;
f66b382affd8fd Dave Stevenson     2024-10-25  418  
f66b382affd8fd Dave Stevenson     2024-10-25  419  		ranges = <0x00 0x00000000  0x00 0x00000000  0x10 0x00000000>,
f66b382affd8fd Dave Stevenson     2024-10-25  420  			 <0x10 0x00000000  0x10 0x00000000  0x01 0x00000000>,
f66b382affd8fd Dave Stevenson     2024-10-25  421  			 <0x14 0x00000000  0x14 0x00000000  0x04 0x00000000>,
f66b382affd8fd Dave Stevenson     2024-10-25  422  			 <0x18 0x00000000  0x18 0x00000000  0x04 0x00000000>,
f66b382affd8fd Dave Stevenson     2024-10-25  423  			 <0x1c 0x00000000  0x1c 0x00000000  0x04 0x00000000>;
f66b382affd8fd Dave Stevenson     2024-10-25  424  
f66b382affd8fd Dave Stevenson     2024-10-25  425  		dma-ranges = <0x00 0x00000000  0x00 0x00000000  0x10 0x00000000>,
f66b382affd8fd Dave Stevenson     2024-10-25  426  			     <0x10 0x00000000  0x10 0x00000000  0x01 0x00000000>,
f66b382affd8fd Dave Stevenson     2024-10-25  427  			     <0x14 0x00000000  0x14 0x00000000  0x04 0x00000000>,
f66b382affd8fd Dave Stevenson     2024-10-25  428  			     <0x18 0x00000000  0x18 0x00000000  0x04 0x00000000>,
f66b382affd8fd Dave Stevenson     2024-10-25  429  			     <0x1c 0x00000000  0x1c 0x00000000  0x04 0x00000000>;
f66b382affd8fd Dave Stevenson     2024-10-25  430  
f66b382affd8fd Dave Stevenson     2024-10-25 @431  		vc4: gpu {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
