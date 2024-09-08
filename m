Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C830326281
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Sep 2024 17:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725816451; cv=none; b=cdDpswA0jJ4qEYDljv48860tBbxIIt8JzNyTWZwepX8AWsr9iMgWlMBwB+TrA6q3/7nDIi3Ijk7+Vxw1eUjRtnSSHGLjfx1oe9wvPAjK7Ju6DiHA6FT+xvNNDaGSWic3319xUJ90BXJHXC/JwwFWBh8XNVCLGWHR39purABebjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725816451; c=relaxed/simple;
	bh=HnArce0IPcY1I+jf0OJtFSX5ZWdfVEZjznTZuhBbPIw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DrCnXuvNjqHvkc7gSHQz1Uaeo9EwpPt6sW12HY52vCgsK1tQhBgm+XKYiAtMSjDrcHWkYC55ZItgat+b/sJF4UNScwesekjGoXgfd09WQcy64aguWXm7/5yYzdYhj2BECn1bx2ZHWTp+vLphTgE/VcJV+3KCh8CG/eG0O5AJngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PfDUg72r; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PfDUg72r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725816449; x=1757352449;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HnArce0IPcY1I+jf0OJtFSX5ZWdfVEZjznTZuhBbPIw=;
  b=PfDUg72rYSYHlP700qJK7nwQ4xfsqlRGcmVESTv/EG1vJP8akevPg0pg
   qUx5UT8tFr8PtGUy0DqtdNUpfUHgG+NqUpeNl/gmMmmPx1ORCf5fj2Dih
   9oBo9C1n6JI2u8pmBoZgyfwKscDYJL27wSXNKpkp3prdECbqXBpdWqNvl
   CYgtk0ZVMQLya2JLrsGqU7xqgVIeVb0rXGmOjTIHH5NBMuUrDV5gEgVX3
   o2o7bMnbcPU4NVHss/Dh/nqAiaEzLvEkijGuwaHtE0fC6PBOyWquIRUyo
   ttZsfAilbzu0/c1HHhqx1F+GB8lHRO5r/mvQNocdI7kz4tHSI4btuer5s
   g==;
X-CSE-ConnectionGUID: CnFUCszFQ4GTTE+RPyFG+Q==
X-CSE-MsgGUID: 20gDQeEDQZitO7GjGOoEYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11189"; a="24056895"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="24056895"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 10:27:28 -0700
X-CSE-ConnectionGUID: NWSF5aiYRseJpWX7Xu43xg==
X-CSE-MsgGUID: UbGgERIsQ0SesEZwBrxhew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66976800"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Sep 2024 10:27:26 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snLh6-000Dlb-29;
	Sun, 08 Sep 2024 17:27:24 +0000
Date: Mon, 9 Sep 2024 01:27:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jcmvbkbc-xtensa:xtensa-6.11-rc6-esp32 46/53]
 arch/xtensa/boot/dts/esp32.dtsi:172.19-178.5: Warning (unit_address_vs_reg):
 /soc/syscon@3ff48000: node has a unit name, but no reg or ranges property
Message-ID: <202409090111.Jx4NqgAz-lkp@intel.com>
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
TO: Max Filippov <jcmvbkbc@gmail.com>

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.11-rc6-esp32
head:   4a9ffb44ce4c24e9dcd4a5f06beeb3dded85319a
commit: 452c3f55f71c8f9e21626fc15af1776317410c6d [46/53] xtensa: esp32: add platform
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: xtensa-allyesconfig (https://download.01.org/0day-ci/archive/20240909/202409090111.Jx4NqgAz-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240909/202409090111.Jx4NqgAz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409090111.Jx4NqgAz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/xtensa/boot/dts/esp32.dtsi:172.19-178.5: Warning (unit_address_vs_reg): /soc/syscon@3ff48000: node has a unit name, but no reg or ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:40.19-44.5: Warning (simple_bus_reg): /clocks/clk80m: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:45.23-49.5: Warning (simple_bus_reg): /clocks/clk8m5: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:50.21-54.5: Warning (simple_bus_reg): /clocks/clk128m: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:56.24-61.5: Warning (simple_bus_reg): /clocks/uart0_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:62.24-67.5: Warning (simple_bus_reg): /clocks/uart1_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:68.24-73.5: Warning (simple_bus_reg): /clocks/uart2_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:74.22-79.5: Warning (simple_bus_reg): /clocks/spi2_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:80.22-85.5: Warning (simple_bus_reg): /clocks/spi3_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:172.19-178.5: Warning (simple_bus_reg): /soc/syscon@3ff48000: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32.dtsi:191.27-198.5: Warning (simple_bus_reg): /soc/pinctrl@3ff49000: simple-bus unit address format error, expected "3ff49004"
>> arch/xtensa/boot/dts/esp32.dtsi:200.26-208.5: Warning (simple_bus_reg): /soc/serial@3ff50000: simple-bus unit address format error, expected "3ff40000"
>> arch/xtensa/boot/dts/esp32.dtsi:210.22-220.5: Warning (simple_bus_reg): /soc/spi@3ff64000: simple-bus unit address format error, expected "60024000"
>> arch/xtensa/boot/dts/esp32.dtsi:222.22-232.5: Warning (simple_bus_reg): /soc/spi@3ff65000: simple-bus unit address format error, expected "60025000"
>> arch/xtensa/boot/dts/esp32.dtsi:234.26-242.5: Warning (simple_bus_reg): /soc/serial@3ff6e000: simple-bus unit address format error, expected "3ff40000"
>> arch/xtensa/boot/dts/esp32.dtsi:35.9-86.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/xtensa/boot/dts/esp32.dtsi:167.21-170.5: Warning (unique_unit_address_if_enabled): /soc/lpm@3ff48000: duplicate unit-address (also used in node /soc/syscon@3ff48000)
--
>> arch/xtensa/boot/dts/esp32s3.dtsi:150.19-156.5: Warning (unit_address_vs_reg): /soc/syscon@60008000: node has a unit name, but no reg or ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:36.24-41.5: Warning (simple_bus_reg): /clocks/uart0_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:42.24-47.5: Warning (simple_bus_reg): /clocks/uart1_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:48.24-53.5: Warning (simple_bus_reg): /clocks/uart2_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:55.22-60.5: Warning (simple_bus_reg): /clocks/spi2_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:61.22-66.5: Warning (simple_bus_reg): /clocks/spi3_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:68.20-73.5: Warning (simple_bus_reg): /clocks/usb_clk: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:150.19-156.5: Warning (simple_bus_reg): /soc/syscon@60008000: missing or empty reg/ranges property
>> arch/xtensa/boot/dts/esp32s3.dtsi:175.27-182.5: Warning (simple_bus_reg): /soc/pinctrl@60009000: simple-bus unit address format error, expected "60009004"
>> arch/xtensa/boot/dts/esp32s3.dtsi:301.23-311.5: Warning (simple_bus_reg): /soc/intc@600c2000: simple-bus unit address format error, expected "600c2800"
>> arch/xtensa/boot/dts/esp32s3.dtsi:31.9-74.4: Warning (avoid_unnecessary_addr_size): /clocks: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/xtensa/boot/dts/esp32s3.dtsi:93.18-105.5: Warning (avoid_unnecessary_addr_size): /soc/flash@42000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/xtensa/boot/dts/esp32s3.dtsi:145.21-148.5: Warning (unique_unit_address_if_enabled): /soc/lpm@60008000: duplicate unit-address (also used in node /soc/syscon@60008000)

vim +172 arch/xtensa/boot/dts/esp32.dtsi

452c3f55f71c8f Max Filippov 2019-12-15    3  
452c3f55f71c8f Max Filippov 2019-12-15    4  / {
452c3f55f71c8f Max Filippov 2019-12-15    5  	compatible = "esp32";
452c3f55f71c8f Max Filippov 2019-12-15    6  	#address-cells = <1>;
452c3f55f71c8f Max Filippov 2019-12-15    7  	#size-cells = <1>;
452c3f55f71c8f Max Filippov 2019-12-15    8  	interrupt-parent = <&pic>;
452c3f55f71c8f Max Filippov 2019-12-15    9  
452c3f55f71c8f Max Filippov 2019-12-15   10  	chosen {
452c3f55f71c8f Max Filippov 2019-12-15   11  		bootargs = "earlycon=esp32uart,mmio32,0x3ff40000,115200n8 console=ttyS0,115200n8 debug rw root=mtd:rootfs no_hash_pointers ";
452c3f55f71c8f Max Filippov 2019-12-15   12  	};
452c3f55f71c8f Max Filippov 2019-12-15   13  
452c3f55f71c8f Max Filippov 2019-12-15   14  	aliases {
452c3f55f71c8f Max Filippov 2019-12-15   15  		serial0 = "/soc/serial@3ff40000";
452c3f55f71c8f Max Filippov 2019-12-15   16  		serial1 = "/soc/serial@3ff50000";
452c3f55f71c8f Max Filippov 2019-12-15   17  		serial2 = "/soc/serial@3ff6e000";
452c3f55f71c8f Max Filippov 2019-12-15   18  	};
452c3f55f71c8f Max Filippov 2019-12-15   19  
452c3f55f71c8f Max Filippov 2019-12-15   20  	memory@0 {
452c3f55f71c8f Max Filippov 2019-12-15   21  		device_type = "memory";
452c3f55f71c8f Max Filippov 2019-12-15   22  		reg = <0x3f800000 0x00400000>;
452c3f55f71c8f Max Filippov 2019-12-15   23  	};
452c3f55f71c8f Max Filippov 2019-12-15   24  
452c3f55f71c8f Max Filippov 2019-12-15   25  	cpus {
452c3f55f71c8f Max Filippov 2019-12-15   26  		#address-cells = <1>;
452c3f55f71c8f Max Filippov 2019-12-15   27  		#size-cells = <0>;
452c3f55f71c8f Max Filippov 2019-12-15   28  		cpu@0 {
452c3f55f71c8f Max Filippov 2019-12-15   29  			compatible = "cdns,xtensa-cpu";
452c3f55f71c8f Max Filippov 2019-12-15   30  			reg = <0>;
452c3f55f71c8f Max Filippov 2019-12-15   31  			clocks = <&clk 0>;
452c3f55f71c8f Max Filippov 2019-12-15   32  		};
452c3f55f71c8f Max Filippov 2019-12-15   33  	};
452c3f55f71c8f Max Filippov 2019-12-15   34  
452c3f55f71c8f Max Filippov 2019-12-15  @35  	clocks {
452c3f55f71c8f Max Filippov 2019-12-15   36  		compatible = "simple-bus";
452c3f55f71c8f Max Filippov 2019-12-15   37  		#address-cells = <1>;
452c3f55f71c8f Max Filippov 2019-12-15   38  		#size-cells = <0>;
452c3f55f71c8f Max Filippov 2019-12-15   39  
452c3f55f71c8f Max Filippov 2019-12-15  @40  		xtl_clk: clk80m {
452c3f55f71c8f Max Filippov 2019-12-15   41  			#clock-cells = <0>;
452c3f55f71c8f Max Filippov 2019-12-15   42  			compatible = "fixed-clock";
452c3f55f71c8f Max Filippov 2019-12-15   43  			clock-frequency = <80000000>;
452c3f55f71c8f Max Filippov 2019-12-15   44  		};
452c3f55f71c8f Max Filippov 2019-12-15  @45  		rc_fast_clk: clk8m5 {
452c3f55f71c8f Max Filippov 2019-12-15   46  			#clock-cells = <0>;
452c3f55f71c8f Max Filippov 2019-12-15   47  			compatible = "fixed-clock";
452c3f55f71c8f Max Filippov 2019-12-15   48  			clock-frequency = <8500000>;
452c3f55f71c8f Max Filippov 2019-12-15   49  		};
452c3f55f71c8f Max Filippov 2019-12-15  @50  		apll_clk: clk128m {
452c3f55f71c8f Max Filippov 2019-12-15   51  			#clock-cells = <0>;
452c3f55f71c8f Max Filippov 2019-12-15   52  			compatible = "fixed-clock";
452c3f55f71c8f Max Filippov 2019-12-15   53  			clock-frequency = <128000000>;
452c3f55f71c8f Max Filippov 2019-12-15   54  		};
452c3f55f71c8f Max Filippov 2019-12-15   55  
452c3f55f71c8f Max Filippov 2019-12-15  @56  		uart0_clk: uart0_clk {
452c3f55f71c8f Max Filippov 2019-12-15   57  			#clock-cells = <0>;
452c3f55f71c8f Max Filippov 2019-12-15   58  			compatible = "gpio-gate-clock";
452c3f55f71c8f Max Filippov 2019-12-15   59  			clocks = <&clk 1>;
452c3f55f71c8f Max Filippov 2019-12-15   60  			enable-gpios = <&clk_gpio0 2 0>;
452c3f55f71c8f Max Filippov 2019-12-15   61  		};
452c3f55f71c8f Max Filippov 2019-12-15  @62  		uart1_clk: uart1_clk {
452c3f55f71c8f Max Filippov 2019-12-15   63  			#clock-cells = <0>;
452c3f55f71c8f Max Filippov 2019-12-15   64  			compatible = "gpio-gate-clock";
452c3f55f71c8f Max Filippov 2019-12-15   65  			clocks = <&clk 1>;
452c3f55f71c8f Max Filippov 2019-12-15   66  			enable-gpios = <&clk_gpio0 5 0>;
452c3f55f71c8f Max Filippov 2019-12-15   67  		};
452c3f55f71c8f Max Filippov 2019-12-15  @68  		uart2_clk: uart2_clk {
452c3f55f71c8f Max Filippov 2019-12-15   69  			#clock-cells = <0>;
452c3f55f71c8f Max Filippov 2019-12-15   70  			compatible = "gpio-gate-clock";
452c3f55f71c8f Max Filippov 2019-12-15   71  			clocks = <&clk 1>;
452c3f55f71c8f Max Filippov 2019-12-15   72  			enable-gpios = <&clk_gpio0 23 0>;
452c3f55f71c8f Max Filippov 2019-12-15   73  		};
452c3f55f71c8f Max Filippov 2019-12-15  @74  		spi2_clk: spi2_clk {
452c3f55f71c8f Max Filippov 2019-12-15   75  			#clock-cells = <0>;
452c3f55f71c8f Max Filippov 2019-12-15   76  			compatible = "gpio-gate-clock";
452c3f55f71c8f Max Filippov 2019-12-15   77  			clocks = <&clk 1>;
452c3f55f71c8f Max Filippov 2019-12-15   78  			enable-gpios = <&clk_gpio0 6 0>;
452c3f55f71c8f Max Filippov 2019-12-15   79  		};
452c3f55f71c8f Max Filippov 2019-12-15  @80  		spi3_clk: spi3_clk {
452c3f55f71c8f Max Filippov 2019-12-15   81  			#clock-cells = <0>;
452c3f55f71c8f Max Filippov 2019-12-15   82  			compatible = "gpio-gate-clock";
452c3f55f71c8f Max Filippov 2019-12-15   83  			clocks = <&clk 1>;
452c3f55f71c8f Max Filippov 2019-12-15   84  			enable-gpios = <&clk_gpio0 16 0>;
452c3f55f71c8f Max Filippov 2019-12-15   85  		};
452c3f55f71c8f Max Filippov 2019-12-15   86  	};
452c3f55f71c8f Max Filippov 2019-12-15   87  
452c3f55f71c8f Max Filippov 2019-12-15   88  	pic: pic {
452c3f55f71c8f Max Filippov 2019-12-15   89  		compatible = "cdns,xtensa-pic";
452c3f55f71c8f Max Filippov 2019-12-15   90  		/* one cell: internal irq number,
452c3f55f71c8f Max Filippov 2019-12-15   91  		 * two cells: second cell == 0: internal irq number
452c3f55f71c8f Max Filippov 2019-12-15   92  		 *            second cell == 1: external irq number
452c3f55f71c8f Max Filippov 2019-12-15   93  		 */
452c3f55f71c8f Max Filippov 2019-12-15   94  		#interrupt-cells = <2>;
452c3f55f71c8f Max Filippov 2019-12-15   95  		interrupt-controller;
452c3f55f71c8f Max Filippov 2019-12-15   96  	};
452c3f55f71c8f Max Filippov 2019-12-15   97  
452c3f55f71c8f Max Filippov 2019-12-15   98  	soc {
452c3f55f71c8f Max Filippov 2019-12-15   99  		#address-cells = <1>;
452c3f55f71c8f Max Filippov 2019-12-15  100  		#size-cells = <1>;
452c3f55f71c8f Max Filippov 2019-12-15  101  		compatible = "simple-bus";
452c3f55f71c8f Max Filippov 2019-12-15  102  		interrupt-parent = <&intc>;
452c3f55f71c8f Max Filippov 2019-12-15  103  		ranges;
452c3f55f71c8f Max Filippov 2019-12-15  104  
452c3f55f71c8f Max Filippov 2019-12-15  105  		clk_gpio0: clk_gpio@3ff000c0 {
452c3f55f71c8f Max Filippov 2019-12-15  106  			#gpio-cells = <2>;
452c3f55f71c8f Max Filippov 2019-12-15  107  			compatible = "esp,esp32-clk-gpio";
452c3f55f71c8f Max Filippov 2019-12-15  108  			reg = <0x3ff000c0 4>;
452c3f55f71c8f Max Filippov 2019-12-15  109  			reg-names = "dat";
452c3f55f71c8f Max Filippov 2019-12-15  110  		};
452c3f55f71c8f Max Filippov 2019-12-15  111  
452c3f55f71c8f Max Filippov 2019-12-15  112  		reset: reset@3ff000c4 {
452c3f55f71c8f Max Filippov 2019-12-15  113  			#reset-cells = <1>;
452c3f55f71c8f Max Filippov 2019-12-15  114  			compatible = "esp,esp32-reset";
452c3f55f71c8f Max Filippov 2019-12-15  115  			reg = <0x3ff000c4 4>;
452c3f55f71c8f Max Filippov 2019-12-15  116  		};
452c3f55f71c8f Max Filippov 2019-12-15  117  
452c3f55f71c8f Max Filippov 2019-12-15  118  		intc: intc@3ff00104 {
452c3f55f71c8f Max Filippov 2019-12-15  119  			compatible = "esp,esp32-intc";
452c3f55f71c8f Max Filippov 2019-12-15  120  			reg = <0x3ff00104 0x114>;
452c3f55f71c8f Max Filippov 2019-12-15  121  			/* first cell: interrupt matrix row
452c3f55f71c8f Max Filippov 2019-12-15  122  			 * second cell: internal xtensa core IRQ number to connect to
452c3f55f71c8f Max Filippov 2019-12-15  123  			 */
452c3f55f71c8f Max Filippov 2019-12-15  124  			#interrupt-cells = <2>;
452c3f55f71c8f Max Filippov 2019-12-15  125  			interrupt-controller;
452c3f55f71c8f Max Filippov 2019-12-15  126  			interrupt-parent = <&pic>;
452c3f55f71c8f Max Filippov 2019-12-15  127  		};
452c3f55f71c8f Max Filippov 2019-12-15  128  
452c3f55f71c8f Max Filippov 2019-12-15  129  		uart0: serial@3ff40000 {
452c3f55f71c8f Max Filippov 2019-12-15  130  			compatible = "esp,esp32-uart";
452c3f55f71c8f Max Filippov 2019-12-15  131  			reg = <0x3ff40000 0x80>;
452c3f55f71c8f Max Filippov 2019-12-15  132  			interrupts = <34 1>; /* UART0, external IRQ1 */
452c3f55f71c8f Max Filippov 2019-12-15  133  			clocks = <&uart0_clk>;
452c3f55f71c8f Max Filippov 2019-12-15  134  			resets = <&reset 2>;
452c3f55f71c8f Max Filippov 2019-12-15  135  			reset-names = "reset";
452c3f55f71c8f Max Filippov 2019-12-15  136  			status = "disabled";
452c3f55f71c8f Max Filippov 2019-12-15  137  		};
452c3f55f71c8f Max Filippov 2019-12-15  138  
452c3f55f71c8f Max Filippov 2019-12-15  139  		gpio0: gpio@3ff44000 {
452c3f55f71c8f Max Filippov 2019-12-15  140  			#gpio-cells = <2>;
452c3f55f71c8f Max Filippov 2019-12-15  141  			compatible = "esp,esp32-gpio";
452c3f55f71c8f Max Filippov 2019-12-15  142  			reg = <0x3ff44000 0x128>;
452c3f55f71c8f Max Filippov 2019-12-15  143  			interrupts = <22 8>; /* GPIO, external IRQ8 */
452c3f55f71c8f Max Filippov 2019-12-15  144  			interrupt-controller;
452c3f55f71c8f Max Filippov 2019-12-15  145  			#interrupt-cells = <2>;
452c3f55f71c8f Max Filippov 2019-12-15  146  			status = "disabled";
452c3f55f71c8f Max Filippov 2019-12-15  147  		};
452c3f55f71c8f Max Filippov 2019-12-15  148  
452c3f55f71c8f Max Filippov 2019-12-15  149  		gpio_in_mux: gpio_in_mux@3ff44130 {
452c3f55f71c8f Max Filippov 2019-12-15  150  			compatible = "pinctrl-single";
452c3f55f71c8f Max Filippov 2019-12-15  151  			reg = <0x3ff44130 0x400>;
452c3f55f71c8f Max Filippov 2019-12-15  152  			#pinctrl-cells = <1>;
452c3f55f71c8f Max Filippov 2019-12-15  153  			pinctrl-single,register-width = <32>;
452c3f55f71c8f Max Filippov 2019-12-15  154  			pinctrl-single,function-mask = <0xff>;
452c3f55f71c8f Max Filippov 2019-12-15  155  			status = "disabled";
452c3f55f71c8f Max Filippov 2019-12-15  156  		};
452c3f55f71c8f Max Filippov 2019-12-15  157  
452c3f55f71c8f Max Filippov 2019-12-15  158  		gpio_out_mux: gpio_out_mux@3ff44530 {
452c3f55f71c8f Max Filippov 2019-12-15  159  			compatible = "pinctrl-single";
452c3f55f71c8f Max Filippov 2019-12-15  160  			reg = <0x3ff44530 0xa0>;
452c3f55f71c8f Max Filippov 2019-12-15  161  			#pinctrl-cells = <1>;
452c3f55f71c8f Max Filippov 2019-12-15  162  			pinctrl-single,register-width = <32>;
452c3f55f71c8f Max Filippov 2019-12-15  163  			pinctrl-single,function-mask = <0xfff>;
452c3f55f71c8f Max Filippov 2019-12-15  164  			status = "disabled";
452c3f55f71c8f Max Filippov 2019-12-15  165  		};
452c3f55f71c8f Max Filippov 2019-12-15  166  
452c3f55f71c8f Max Filippov 2019-12-15 @167  		lpm: lpm@3ff48000 {
452c3f55f71c8f Max Filippov 2019-12-15  168  			compatible = "syscon";
452c3f55f71c8f Max Filippov 2019-12-15  169  			reg = <0x3ff48000 0x1000>;
452c3f55f71c8f Max Filippov 2019-12-15  170  		};
452c3f55f71c8f Max Filippov 2019-12-15  171  
452c3f55f71c8f Max Filippov 2019-12-15 @172  		syscon@3ff48000 {
452c3f55f71c8f Max Filippov 2019-12-15  173  			compatible = "syscon-reboot";
452c3f55f71c8f Max Filippov 2019-12-15  174  			regmap = <&lpm>;
452c3f55f71c8f Max Filippov 2019-12-15  175  			offset = <0>;
452c3f55f71c8f Max Filippov 2019-12-15  176  			value = <0x80000000>;
452c3f55f71c8f Max Filippov 2019-12-15  177  			mask = <0x80000000>;
452c3f55f71c8f Max Filippov 2019-12-15  178  		};
452c3f55f71c8f Max Filippov 2019-12-15  179  
452c3f55f71c8f Max Filippov 2019-12-15  180  		clk: clk@3ff48070 {
452c3f55f71c8f Max Filippov 2019-12-15  181  			compatible = "esp,esp32-core-clock";
452c3f55f71c8f Max Filippov 2019-12-15  182  			reg = <0x3ff48070 4
452c3f55f71c8f Max Filippov 2019-12-15  183  			       0x3ff0003c 4
452c3f55f71c8f Max Filippov 2019-12-15  184  			       0x3ff66000 4>;
452c3f55f71c8f Max Filippov 2019-12-15  185  			clocks = <&xtl_clk>, <&rc_fast_clk>, <&apll_clk>;
452c3f55f71c8f Max Filippov 2019-12-15  186  			clock-names = "xtl", "rc_fast", "apll";
452c3f55f71c8f Max Filippov 2019-12-15  187  			#clock-cells = <1>;
452c3f55f71c8f Max Filippov 2019-12-15  188  			/* clock-output-names = "cpu_clk", "apb_clk"; */
452c3f55f71c8f Max Filippov 2019-12-15  189  		};
452c3f55f71c8f Max Filippov 2019-12-15  190  
452c3f55f71c8f Max Filippov 2019-12-15 @191  		iomux: pinctrl@3ff49000 {
452c3f55f71c8f Max Filippov 2019-12-15  192  			compatible = "pinctrl-single";
452c3f55f71c8f Max Filippov 2019-12-15  193  			reg = <0x3ff49004 0x90>;
452c3f55f71c8f Max Filippov 2019-12-15  194  			#pinctrl-cells = <1>;
452c3f55f71c8f Max Filippov 2019-12-15  195  			pinctrl-single,register-width = <32>;
452c3f55f71c8f Max Filippov 2019-12-15  196  			pinctrl-single,function-mask = <0xffff>;
452c3f55f71c8f Max Filippov 2019-12-15  197  			status = "disabled";
452c3f55f71c8f Max Filippov 2019-12-15  198  		};
452c3f55f71c8f Max Filippov 2019-12-15  199  
452c3f55f71c8f Max Filippov 2019-12-15 @200  		uart1: serial@3ff50000 {
452c3f55f71c8f Max Filippov 2019-12-15  201  			compatible = "esp,esp32-uart";
452c3f55f71c8f Max Filippov 2019-12-15  202  			reg = <0x3ff40000 0x80>;
452c3f55f71c8f Max Filippov 2019-12-15  203  			interrupts = <35 2>; /* UART1, external IRQ2 */
452c3f55f71c8f Max Filippov 2019-12-15  204  			clocks = <&uart1_clk>;
452c3f55f71c8f Max Filippov 2019-12-15  205  			resets = <&reset 5>;
452c3f55f71c8f Max Filippov 2019-12-15  206  			reset-names = "reset";
452c3f55f71c8f Max Filippov 2019-12-15  207  			status = "disabled";
452c3f55f71c8f Max Filippov 2019-12-15  208  		};
452c3f55f71c8f Max Filippov 2019-12-15  209  
452c3f55f71c8f Max Filippov 2019-12-15 @210  		spi2: spi@3ff64000 {
452c3f55f71c8f Max Filippov 2019-12-15  211  			#address-cells = <1>;
452c3f55f71c8f Max Filippov 2019-12-15  212  			#size-cells = <0>;
452c3f55f71c8f Max Filippov 2019-12-15  213  			compatible = "esp,esp32-spi";
452c3f55f71c8f Max Filippov 2019-12-15  214  			reg = <0x60024000 0x100>;
452c3f55f71c8f Max Filippov 2019-12-15  215  			interrupts = <30 4>; /* SPI2, external IRQ4 */
452c3f55f71c8f Max Filippov 2019-12-15  216  			clocks = <&spi2_clk>;
452c3f55f71c8f Max Filippov 2019-12-15  217  			resets = <&reset 6>;
452c3f55f71c8f Max Filippov 2019-12-15  218  			reset-names = "reset";
452c3f55f71c8f Max Filippov 2019-12-15  219  			status = "disabled";
452c3f55f71c8f Max Filippov 2019-12-15  220  		};
452c3f55f71c8f Max Filippov 2019-12-15  221  
452c3f55f71c8f Max Filippov 2019-12-15 @222  		spi3: spi@3ff65000 {
452c3f55f71c8f Max Filippov 2019-12-15  223  			#address-cells = <1>;
452c3f55f71c8f Max Filippov 2019-12-15  224  			#size-cells = <0>;
452c3f55f71c8f Max Filippov 2019-12-15  225  			compatible = "esp,esp32-spi";
452c3f55f71c8f Max Filippov 2019-12-15  226  			reg = <0x60025000 0x100>;
452c3f55f71c8f Max Filippov 2019-12-15  227  			interrupts = <31 5>; /* SPI3, external IRQ5 */
452c3f55f71c8f Max Filippov 2019-12-15  228  			clocks = <&spi3_clk>;
452c3f55f71c8f Max Filippov 2019-12-15  229  			resets = <&reset 16>;
452c3f55f71c8f Max Filippov 2019-12-15  230  			reset-names = "reset";
452c3f55f71c8f Max Filippov 2019-12-15  231  			status = "disabled";
452c3f55f71c8f Max Filippov 2019-12-15  232  		};
452c3f55f71c8f Max Filippov 2019-12-15  233  
452c3f55f71c8f Max Filippov 2019-12-15 @234  		uart2: serial@3ff6e000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
