Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3208A2ECD24
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Aug 2025 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754996412; cv=none; b=iFe8iHtpJGl4pecvXGKYlkRoUJUg5dbMfSaAHl05pEw1yMInr54fkYzhP38pAx1ah/z/oC/CPZfXI3B90J97g8SWkBqfKCTvv17iTrg4v2mTRqFdF3wLrZIbWywE1uutkw/Q2Q7AEMuCOZ/PGAdQlrA3GsrwthQvhnyMXaK8sgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754996412; c=relaxed/simple;
	bh=QWTcpuhWvLGYXKqKI/Bk/q6JgKS8sGl07ZSuOpeNLUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PTw44Ezqi0TfUC6vujiMeynj/hATuKu3NX9L6BbB55A/EH3SFp2zQRZ+oYdw8KZdAmK2IqcV4rtg5rKj3/w2o54hvxAMtTXgO8ZcARPSZINk49lw7alCveZqdnNaadWoaT8Z19YYK43oH5i7nQZG8mMCyHn0BtsY+tyiRF7H+uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXQAHg6q; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXQAHg6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754996409; x=1786532409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QWTcpuhWvLGYXKqKI/Bk/q6JgKS8sGl07ZSuOpeNLUs=;
  b=MXQAHg6qoXsyQyIDI9QkzM57OAId3QDHLyBdiuMCgDDfbHgoPHkqN6Vc
   BxF0rHKprPWfdcDaLgwm7TY8YU0YXWgFwel1RfxRk2eShk5Z02Wbjz4Jr
   AP2lCnPiGEupXqqivZBZGiR1dRaquzn7IocksPa3LP7mtcSroee+yIwra
   QlU2kaXkGIh5NyV5hrBN08MilcH8GgwjO5/BouAji3ZGaWc311B9RphjH
   xs848WSWcPw5fqiDr3/FJ1HxuxNYm+xydzDkXwI90UtSfNYwOVTxVCCfD
   HFFF7MeVzarOywicnkgp6aDZQZponGm/ZyrYEgs4HVgn/QMitFEkQ1Esq
   w==;
X-CSE-ConnectionGUID: RVdearJIRaaavqktj8qYlw==
X-CSE-MsgGUID: vxsHIg7nS1mbOi76yK27yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11518"; a="57390461"
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="57390461"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 04:00:08 -0700
X-CSE-ConnectionGUID: sRpWwPxBS5O87+VI2AT2GQ==
X-CSE-MsgGUID: jk9L4l71QY6pu8czxrp8eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,284,1747724400"; 
   d="scan'208";a="165352761"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 12 Aug 2025 04:00:06 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ulmin-0006iO-2W;
	Tue, 12 Aug 2025 10:59:38 +0000
Date: Tue, 12 Aug 2025 18:58:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:for-next 2/12]
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi:457.4-460.31: Warning
 (interrupt_map): /axi/pcie@1000100000:interrupt-map: Missing property
 '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000,
 using 0 as fallback
Message-ID: <202508121835.D0Lt5a4H-lkp@intel.com>
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
:::::: branch date: 17 hours ago
:::::: commit date: 22 hours ago
config: arm64-randconfig-r071-20250812 (https://download.01.org/0day-ci/archive/20250812/202508121835.D0Lt5a4H-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 3769ce013be2879bf0b329c14a16f5cb766f26ce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508121835.D0Lt5a4H-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:421.11-576.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi:3.11-14.3: Warning (unit_address_vs_reg): /axi/pcie@1000120000/rp1_nexus: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:74.21-91.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:93.15-97.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:438.12-440.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property
>> arch/arm64/boot/dts/broadcom/bcm2712.dtsi:457.4-460.31: Warning (interrupt_map): /axi/pcie@1000100000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
>> arch/arm64/boot/dts/broadcom/bcm2712.dtsi:457.4-460.31: Warning (interrupt_map): /axi/pcie@1000100000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
>> arch/arm64/boot/dts/broadcom/bcm2712.dtsi:457.4-460.31: Warning (interrupt_map): /axi/pcie@1000100000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
>> arch/arm64/boot/dts/broadcom/bcm2712.dtsi:457.4-460.31: Warning (interrupt_map): /axi/pcie@1000100000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:494.4-497.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:494.4-497.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:494.4-497.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:494.4-497.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:533.4-536.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:533.4-536.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:533.4-536.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:533.4-536.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
--
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:421.11-576.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:74.21-91.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:93.15-97.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:438.12-440.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property
>> arch/arm64/boot/dts/broadcom/bcm2712.dtsi:457.4-460.31: Warning (interrupt_map): /axi/pcie@1000100000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
>> arch/arm64/boot/dts/broadcom/bcm2712.dtsi:457.4-460.31: Warning (interrupt_map): /axi/pcie@1000100000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
>> arch/arm64/boot/dts/broadcom/bcm2712.dtsi:457.4-460.31: Warning (interrupt_map): /axi/pcie@1000100000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
>> arch/arm64/boot/dts/broadcom/bcm2712.dtsi:457.4-460.31: Warning (interrupt_map): /axi/pcie@1000100000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:494.4-497.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:494.4-497.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:494.4-497.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:494.4-497.31: Warning (interrupt_map): /axi/pcie@1000110000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:533.4-536.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:533.4-536.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:533.4-536.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:533.4-536.31: Warning (interrupt_map): /axi/pcie@1000120000:interrupt-map: Missing property '#address-cells' in node /soc@107c000000/interrupt-controller@7fff9000, using 0 as fallback

vim +457 arch/arm64/boot/dts/broadcom/bcm2712.dtsi

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
c9e81198a75087 Rob Herring (Arm   2025-04-10   67) 			l2_cache_l0: l2-cache {
faa3381267d01a Andrea della Porta 2024-05-30   68  				compatible = "cache";
faa3381267d01a Andrea della Porta 2024-05-30   69  				cache-size = <0x80000>;
058387d9c6b70e Willow Cunningham  2024-10-07   70  				cache-line-size = <64>;
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
c9e81198a75087 Rob Herring (Arm   2025-04-10   91) 			l2_cache_l1: l2-cache {
faa3381267d01a Andrea della Porta 2024-05-30   92  				compatible = "cache";
faa3381267d01a Andrea della Porta 2024-05-30   93  				cache-size = <0x80000>;
058387d9c6b70e Willow Cunningham  2024-10-07   94  				cache-line-size = <64>;
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
c9e81198a75087 Rob Herring (Arm   2025-04-10  115) 			l2_cache_l2: l2-cache {
faa3381267d01a Andrea della Porta 2024-05-30  116  				compatible = "cache";
faa3381267d01a Andrea della Porta 2024-05-30  117  				cache-size = <0x80000>;
058387d9c6b70e Willow Cunningham  2024-10-07  118  				cache-line-size = <64>;
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
c9e81198a75087 Rob Herring (Arm   2025-04-10  139) 			l2_cache_l3: l2-cache {
faa3381267d01a Andrea della Porta 2024-05-30  140  				compatible = "cache";
faa3381267d01a Andrea della Porta 2024-05-30  141  				cache-size = <0x80000>;
058387d9c6b70e Willow Cunningham  2024-10-07  142  				cache-line-size = <64>;
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
5050168029e946 Stanimir Varbanov  2025-01-20  195  		pcie_rescal: reset-controller@119500 {
5050168029e946 Stanimir Varbanov  2025-01-20  196  			compatible = "brcm,bcm7216-pcie-sata-rescal";
5050168029e946 Stanimir Varbanov  2025-01-20  197  			reg = <0x00119500 0x10>;
5050168029e946 Stanimir Varbanov  2025-01-20  198  			#reset-cells = <0>;
5050168029e946 Stanimir Varbanov  2025-01-20  199  		};
5050168029e946 Stanimir Varbanov  2025-01-20  200  
faa3381267d01a Andrea della Porta 2024-05-30  201  		sdio1: mmc@fff000 {
faa3381267d01a Andrea della Porta 2024-05-30  202  			compatible = "brcm,bcm2712-sdhci",
faa3381267d01a Andrea della Porta 2024-05-30  203  				     "brcm,sdhci-brcmstb";
faa3381267d01a Andrea della Porta 2024-05-30  204  			reg = <0x00fff000 0x260>,
faa3381267d01a Andrea della Porta 2024-05-30  205  			      <0x00fff400 0x200>;
faa3381267d01a Andrea della Porta 2024-05-30  206  			reg-names = "host", "cfg";
faa3381267d01a Andrea della Porta 2024-05-30  207  			interrupts = <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>;
faa3381267d01a Andrea della Porta 2024-05-30  208  			clocks = <&clk_emmc2>;
faa3381267d01a Andrea della Porta 2024-05-30  209  			clock-names = "sw_sdio";
faa3381267d01a Andrea della Porta 2024-05-30  210  			mmc-ddr-3_3v;
faa3381267d01a Andrea della Porta 2024-05-30  211  		};
faa3381267d01a Andrea della Porta 2024-05-30  212  
5050168029e946 Stanimir Varbanov  2025-01-20  213  		bcm_reset: reset-controller@1504318 {
5050168029e946 Stanimir Varbanov  2025-01-20  214  			compatible = "brcm,brcmstb-reset";
5050168029e946 Stanimir Varbanov  2025-01-20  215  			reg = <0x01504318 0x30>;
5050168029e946 Stanimir Varbanov  2025-01-20  216  			#reset-cells = <1>;
5050168029e946 Stanimir Varbanov  2025-01-20  217  		};
5050168029e946 Stanimir Varbanov  2025-01-20  218  
faa3381267d01a Andrea della Porta 2024-05-30  219  		system_timer: timer@7c003000 {
faa3381267d01a Andrea della Porta 2024-05-30  220  			compatible = "brcm,bcm2835-system-timer";
faa3381267d01a Andrea della Porta 2024-05-30  221  			reg = <0x7c003000 0x1000>;
faa3381267d01a Andrea della Porta 2024-05-30  222  			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
faa3381267d01a Andrea della Porta 2024-05-30  223  				     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
faa3381267d01a Andrea della Porta 2024-05-30  224  				     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
faa3381267d01a Andrea della Porta 2024-05-30  225  				     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
faa3381267d01a Andrea della Porta 2024-05-30  226  			clock-frequency = <1000000>;
faa3381267d01a Andrea della Porta 2024-05-30  227  		};
faa3381267d01a Andrea della Porta 2024-05-30  228  
faa3381267d01a Andrea della Porta 2024-05-30  229  		mailbox: mailbox@7c013880 {
faa3381267d01a Andrea della Porta 2024-05-30  230  			compatible = "brcm,bcm2835-mbox";
faa3381267d01a Andrea della Porta 2024-05-30  231  			reg = <0x7c013880 0x40>;
faa3381267d01a Andrea della Porta 2024-05-30  232  			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
faa3381267d01a Andrea della Porta 2024-05-30  233  			#mbox-cells = <0>;
faa3381267d01a Andrea della Porta 2024-05-30  234  		};
faa3381267d01a Andrea della Porta 2024-05-30  235  
faa3381267d01a Andrea della Porta 2024-05-30  236  		uart10: serial@7d001000 {
faa3381267d01a Andrea della Porta 2024-05-30  237  			compatible = "arm,pl011", "arm,primecell";
faa3381267d01a Andrea della Porta 2024-05-30  238  			reg = <0x7d001000 0x200>;
faa3381267d01a Andrea della Porta 2024-05-30  239  			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
faa3381267d01a Andrea della Porta 2024-05-30  240  			clocks = <&clk_uart>, <&clk_vpu>;
faa3381267d01a Andrea della Porta 2024-05-30  241  			clock-names = "uartclk", "apb_pclk";
768953614c1c13 Phil Elwell        2025-02-23  242  			arm,primecell-periphid = <0x00341011>;
faa3381267d01a Andrea della Porta 2024-05-30  243  			status = "disabled";
faa3381267d01a Andrea della Porta 2024-05-30  244  		};
faa3381267d01a Andrea della Porta 2024-05-30  245  
faa3381267d01a Andrea della Porta 2024-05-30  246  		interrupt-controller@7d517000 {
faa3381267d01a Andrea della Porta 2024-05-30  247  			compatible = "brcm,bcm7271-l2-intc";
faa3381267d01a Andrea della Porta 2024-05-30  248  			reg = <0x7d517000 0x10>;
faa3381267d01a Andrea della Porta 2024-05-30  249  			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
faa3381267d01a Andrea della Porta 2024-05-30  250  			interrupt-controller;
faa3381267d01a Andrea della Porta 2024-05-30  251  			#interrupt-cells = <1>;
faa3381267d01a Andrea della Porta 2024-05-30  252  		};
faa3381267d01a Andrea della Porta 2024-05-30  253  
faa3381267d01a Andrea della Porta 2024-05-30  254  		gio_aon: gpio@7d517c00 {
faa3381267d01a Andrea della Porta 2024-05-30  255  			compatible = "brcm,bcm7445-gpio", "brcm,brcmstb-gpio";
faa3381267d01a Andrea della Porta 2024-05-30  256  			reg = <0x7d517c00 0x40>;
faa3381267d01a Andrea della Porta 2024-05-30  257  			gpio-controller;
faa3381267d01a Andrea della Porta 2024-05-30  258  			#gpio-cells = <2>;
faa3381267d01a Andrea della Porta 2024-05-30  259  			brcm,gpio-bank-widths = <17 6>;
faa3381267d01a Andrea della Porta 2024-05-30  260  			/* The lack of 'interrupt-controller' property here is intended:
faa3381267d01a Andrea della Porta 2024-05-30  261  			 * don't use GIO_AON as an interrupt controller because it will
faa3381267d01a Andrea della Porta 2024-05-30  262  			 * clash with the firmware monitoring the PMIC interrupt via the VPU.
faa3381267d01a Andrea della Porta 2024-05-30  263  			 */
faa3381267d01a Andrea della Porta 2024-05-30  264  		};
faa3381267d01a Andrea della Porta 2024-05-30  265  
faa3381267d01a Andrea della Porta 2024-05-30  266  		gicv2: interrupt-controller@7fff9000 {
faa3381267d01a Andrea della Porta 2024-05-30  267  			compatible = "arm,gic-400";
faa3381267d01a Andrea della Porta 2024-05-30  268  			reg = <0x7fff9000 0x1000>,
faa3381267d01a Andrea della Porta 2024-05-30  269  			      <0x7fffa000 0x2000>,
faa3381267d01a Andrea della Porta 2024-05-30  270  			      <0x7fffc000 0x2000>,
faa3381267d01a Andrea della Porta 2024-05-30  271  			      <0x7fffe000 0x2000>;
faa3381267d01a Andrea della Porta 2024-05-30  272  			interrupt-controller;
faa3381267d01a Andrea della Porta 2024-05-30  273  			#interrupt-cells = <3>;
faa3381267d01a Andrea della Porta 2024-05-30  274  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  275  
25d77bdd7df26c Dave Stevenson     2024-10-25  276  		aon_intr: interrupt-controller@7d510600 {
25d77bdd7df26c Dave Stevenson     2024-10-25  277  			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
25d77bdd7df26c Dave Stevenson     2024-10-25  278  			reg = <0x7d510600 0x30>;
25d77bdd7df26c Dave Stevenson     2024-10-25  279  			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
25d77bdd7df26c Dave Stevenson     2024-10-25  280  			interrupt-controller;
25d77bdd7df26c Dave Stevenson     2024-10-25  281  			#interrupt-cells = <1>;
25d77bdd7df26c Dave Stevenson     2024-10-25  282  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  283  
25d77bdd7df26c Dave Stevenson     2024-10-25  284  		pixelvalve0: pixelvalve@7c410000 {
25d77bdd7df26c Dave Stevenson     2024-10-25  285  			compatible = "brcm,bcm2712-pixelvalve0";
25d77bdd7df26c Dave Stevenson     2024-10-25  286  			reg = <0x7c410000 0x100>;
25d77bdd7df26c Dave Stevenson     2024-10-25  287  			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
25d77bdd7df26c Dave Stevenson     2024-10-25  288  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  289  
25d77bdd7df26c Dave Stevenson     2024-10-25  290  		pixelvalve1: pixelvalve@7c411000 {
25d77bdd7df26c Dave Stevenson     2024-10-25  291  			compatible = "brcm,bcm2712-pixelvalve1";
25d77bdd7df26c Dave Stevenson     2024-10-25  292  			reg = <0x7c411000 0x100>;
25d77bdd7df26c Dave Stevenson     2024-10-25  293  			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
25d77bdd7df26c Dave Stevenson     2024-10-25  294  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  295  
25d77bdd7df26c Dave Stevenson     2024-10-25  296  		mop: mop@7c500000 {
25d77bdd7df26c Dave Stevenson     2024-10-25  297  			compatible = "brcm,bcm2712-mop";
25d77bdd7df26c Dave Stevenson     2024-10-25  298  			reg = <0x7c500000 0x28>;
25d77bdd7df26c Dave Stevenson     2024-10-25  299  			interrupt-parent = <&disp_intr>;
25d77bdd7df26c Dave Stevenson     2024-10-25  300  			interrupts = <1>;
25d77bdd7df26c Dave Stevenson     2024-10-25  301  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  302  
25d77bdd7df26c Dave Stevenson     2024-10-25  303  		moplet: moplet@7c501000 {
25d77bdd7df26c Dave Stevenson     2024-10-25  304  			compatible = "brcm,bcm2712-moplet";
25d77bdd7df26c Dave Stevenson     2024-10-25  305  			reg = <0x7c501000 0x20>;
25d77bdd7df26c Dave Stevenson     2024-10-25  306  			interrupt-parent = <&disp_intr>;
25d77bdd7df26c Dave Stevenson     2024-10-25  307  			interrupts = <0>;
25d77bdd7df26c Dave Stevenson     2024-10-25  308  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  309  
25d77bdd7df26c Dave Stevenson     2024-10-25  310  		disp_intr: interrupt-controller@7c502000 {
25d77bdd7df26c Dave Stevenson     2024-10-25  311  			compatible = "brcm,bcm2711-l2-intc", "brcm,l2-intc";
25d77bdd7df26c Dave Stevenson     2024-10-25  312  			reg = <0x7c502000 0x30>;
25d77bdd7df26c Dave Stevenson     2024-10-25  313  			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
25d77bdd7df26c Dave Stevenson     2024-10-25  314  			interrupt-controller;
25d77bdd7df26c Dave Stevenson     2024-10-25  315  			#interrupt-cells = <1>;
25d77bdd7df26c Dave Stevenson     2024-10-25  316  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  317  
25d77bdd7df26c Dave Stevenson     2024-10-25  318  		dvp: clock@7c700000 {
25d77bdd7df26c Dave Stevenson     2024-10-25  319  			compatible = "brcm,brcm2711-dvp";
25d77bdd7df26c Dave Stevenson     2024-10-25  320  			reg = <0x7c700000 0x10>;
25d77bdd7df26c Dave Stevenson     2024-10-25  321  			clocks = <&clk_108MHz>;
25d77bdd7df26c Dave Stevenson     2024-10-25  322  			#clock-cells = <1>;
25d77bdd7df26c Dave Stevenson     2024-10-25  323  			#reset-cells = <1>;
25d77bdd7df26c Dave Stevenson     2024-10-25  324  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  325  
25d77bdd7df26c Dave Stevenson     2024-10-25  326  		ddc0: i2c@7d508200 {
25d77bdd7df26c Dave Stevenson     2024-10-25  327  			compatible = "brcm,brcmstb-i2c";
25d77bdd7df26c Dave Stevenson     2024-10-25  328  			reg = <0x7d508200 0x58>;
25d77bdd7df26c Dave Stevenson     2024-10-25  329  			interrupt-parent = <&bsc_irq>;
25d77bdd7df26c Dave Stevenson     2024-10-25  330  			interrupts = <1>;
25d77bdd7df26c Dave Stevenson     2024-10-25  331  			clock-frequency = <97500>;
25d77bdd7df26c Dave Stevenson     2024-10-25  332  			#address-cells = <1>;
25d77bdd7df26c Dave Stevenson     2024-10-25  333  			#size-cells = <0>;
25d77bdd7df26c Dave Stevenson     2024-10-25  334  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  335  
25d77bdd7df26c Dave Stevenson     2024-10-25  336  		ddc1: i2c@7d508280 {
25d77bdd7df26c Dave Stevenson     2024-10-25  337  			compatible = "brcm,brcmstb-i2c";
25d77bdd7df26c Dave Stevenson     2024-10-25  338  			reg = <0x7d508280 0x58>;
25d77bdd7df26c Dave Stevenson     2024-10-25  339  			interrupt-parent = <&bsc_irq>;
25d77bdd7df26c Dave Stevenson     2024-10-25  340  			interrupts = <2>;
25d77bdd7df26c Dave Stevenson     2024-10-25  341  			clock-frequency = <97500>;
25d77bdd7df26c Dave Stevenson     2024-10-25  342  			#address-cells = <1>;
25d77bdd7df26c Dave Stevenson     2024-10-25  343  			#size-cells = <0>;
25d77bdd7df26c Dave Stevenson     2024-10-25  344  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  345  
25d77bdd7df26c Dave Stevenson     2024-10-25  346  		bsc_irq: interrupt-controller@7d508380 {
25d77bdd7df26c Dave Stevenson     2024-10-25  347  			compatible = "brcm,bcm7271-l2-intc";
25d77bdd7df26c Dave Stevenson     2024-10-25  348  			reg = <0x7d508380 0x10>;
25d77bdd7df26c Dave Stevenson     2024-10-25  349  			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
25d77bdd7df26c Dave Stevenson     2024-10-25  350  			interrupt-controller;
25d77bdd7df26c Dave Stevenson     2024-10-25  351  			#interrupt-cells = <1>;
25d77bdd7df26c Dave Stevenson     2024-10-25  352  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  353  
25d77bdd7df26c Dave Stevenson     2024-10-25  354  		main_irq: interrupt-controller@7d508400 {
25d77bdd7df26c Dave Stevenson     2024-10-25  355  			compatible = "brcm,bcm7271-l2-intc";
25d77bdd7df26c Dave Stevenson     2024-10-25  356  			reg = <0x7d508400 0x10>;
25d77bdd7df26c Dave Stevenson     2024-10-25  357  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
25d77bdd7df26c Dave Stevenson     2024-10-25  358  			interrupt-controller;
25d77bdd7df26c Dave Stevenson     2024-10-25  359  			#interrupt-cells = <1>;
25d77bdd7df26c Dave Stevenson     2024-10-25  360  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  361  
25d77bdd7df26c Dave Stevenson     2024-10-25  362  		hdmi0: hdmi@7c701400 {
25d77bdd7df26c Dave Stevenson     2024-10-25  363  			compatible = "brcm,bcm2712-hdmi0";
25d77bdd7df26c Dave Stevenson     2024-10-25  364  			reg = <0x7c701400 0x300>,
25d77bdd7df26c Dave Stevenson     2024-10-25  365  			      <0x7c701000 0x200>,
25d77bdd7df26c Dave Stevenson     2024-10-25  366  			      <0x7c701d00 0x300>,
25d77bdd7df26c Dave Stevenson     2024-10-25  367  			      <0x7c702000 0x80>,
25d77bdd7df26c Dave Stevenson     2024-10-25  368  			      <0x7c703800 0x200>,
25d77bdd7df26c Dave Stevenson     2024-10-25  369  			      <0x7c704000 0x800>,
25d77bdd7df26c Dave Stevenson     2024-10-25  370  			      <0x7c700100 0x80>,
25d77bdd7df26c Dave Stevenson     2024-10-25  371  			      <0x7d510800 0x100>,
25d77bdd7df26c Dave Stevenson     2024-10-25  372  			      <0x7c720000 0x100>;
25d77bdd7df26c Dave Stevenson     2024-10-25  373  			reg-names = "hdmi",
25d77bdd7df26c Dave Stevenson     2024-10-25  374  				    "dvp",
25d77bdd7df26c Dave Stevenson     2024-10-25  375  				    "phy",
25d77bdd7df26c Dave Stevenson     2024-10-25  376  				    "rm",
25d77bdd7df26c Dave Stevenson     2024-10-25  377  				    "packet",
25d77bdd7df26c Dave Stevenson     2024-10-25  378  				    "metadata",
25d77bdd7df26c Dave Stevenson     2024-10-25  379  				    "csc",
25d77bdd7df26c Dave Stevenson     2024-10-25  380  				    "cec",
25d77bdd7df26c Dave Stevenson     2024-10-25  381  				    "hd";
25d77bdd7df26c Dave Stevenson     2024-10-25  382  			resets = <&dvp 1>;
25d77bdd7df26c Dave Stevenson     2024-10-25  383  			interrupt-parent = <&aon_intr>;
25d77bdd7df26c Dave Stevenson     2024-10-25  384  			interrupts = <1>, <2>, <3>,
25d77bdd7df26c Dave Stevenson     2024-10-25  385  				     <7>, <8>;
25d77bdd7df26c Dave Stevenson     2024-10-25  386  			interrupt-names = "cec-tx", "cec-rx", "cec-low",
25d77bdd7df26c Dave Stevenson     2024-10-25  387  					  "hpd-connected", "hpd-removed";
25d77bdd7df26c Dave Stevenson     2024-10-25  388  			ddc = <&ddc0>;
25d77bdd7df26c Dave Stevenson     2024-10-25  389  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  390  
25d77bdd7df26c Dave Stevenson     2024-10-25  391  		hdmi1: hdmi@7c706400 {
25d77bdd7df26c Dave Stevenson     2024-10-25  392  			compatible = "brcm,bcm2712-hdmi1";
25d77bdd7df26c Dave Stevenson     2024-10-25  393  			reg = <0x7c706400 0x300>,
25d77bdd7df26c Dave Stevenson     2024-10-25  394  			      <0x7c706000 0x200>,
25d77bdd7df26c Dave Stevenson     2024-10-25  395  			      <0x7c706d00 0x300>,
25d77bdd7df26c Dave Stevenson     2024-10-25  396  			      <0x7c707000 0x80>,
25d77bdd7df26c Dave Stevenson     2024-10-25  397  			      <0x7c708800 0x200>,
25d77bdd7df26c Dave Stevenson     2024-10-25  398  			      <0x7c709000 0x800>,
25d77bdd7df26c Dave Stevenson     2024-10-25  399  			      <0x7c700180 0x80>,
25d77bdd7df26c Dave Stevenson     2024-10-25  400  			      <0x7d511000 0x100>,
25d77bdd7df26c Dave Stevenson     2024-10-25  401  			      <0x7c720000 0x100>;
25d77bdd7df26c Dave Stevenson     2024-10-25  402  			reg-names = "hdmi",
25d77bdd7df26c Dave Stevenson     2024-10-25  403  				    "dvp",
25d77bdd7df26c Dave Stevenson     2024-10-25  404  				    "phy",
25d77bdd7df26c Dave Stevenson     2024-10-25  405  				    "rm",
25d77bdd7df26c Dave Stevenson     2024-10-25  406  				    "packet",
25d77bdd7df26c Dave Stevenson     2024-10-25  407  				    "metadata",
25d77bdd7df26c Dave Stevenson     2024-10-25  408  				    "csc",
25d77bdd7df26c Dave Stevenson     2024-10-25  409  				    "cec",
25d77bdd7df26c Dave Stevenson     2024-10-25  410  				    "hd";
25d77bdd7df26c Dave Stevenson     2024-10-25  411  			resets = <&dvp 2>;
25d77bdd7df26c Dave Stevenson     2024-10-25  412  			interrupt-parent = <&aon_intr>;
25d77bdd7df26c Dave Stevenson     2024-10-25  413  			interrupts = <11>, <12>, <13>,
25d77bdd7df26c Dave Stevenson     2024-10-25  414  				     <14>, <15>;
25d77bdd7df26c Dave Stevenson     2024-10-25  415  			interrupt-names = "cec-tx", "cec-rx", "cec-low",
25d77bdd7df26c Dave Stevenson     2024-10-25  416  					  "hpd-connected", "hpd-removed";
25d77bdd7df26c Dave Stevenson     2024-10-25  417  			ddc = <&ddc1>;
25d77bdd7df26c Dave Stevenson     2024-10-25  418  		};
25d77bdd7df26c Dave Stevenson     2024-10-25  419  	};
25d77bdd7df26c Dave Stevenson     2024-10-25  420  
25d77bdd7df26c Dave Stevenson     2024-10-25  421  	axi: axi {
25d77bdd7df26c Dave Stevenson     2024-10-25  422  		compatible = "simple-bus";
25d77bdd7df26c Dave Stevenson     2024-10-25  423  		#address-cells = <2>;
25d77bdd7df26c Dave Stevenson     2024-10-25  424  		#size-cells = <2>;
25d77bdd7df26c Dave Stevenson     2024-10-25  425  
25d77bdd7df26c Dave Stevenson     2024-10-25  426  		ranges = <0x00 0x00000000  0x00 0x00000000  0x10 0x00000000>,
25d77bdd7df26c Dave Stevenson     2024-10-25  427  			 <0x10 0x00000000  0x10 0x00000000  0x01 0x00000000>,
25d77bdd7df26c Dave Stevenson     2024-10-25  428  			 <0x14 0x00000000  0x14 0x00000000  0x04 0x00000000>,
25d77bdd7df26c Dave Stevenson     2024-10-25  429  			 <0x18 0x00000000  0x18 0x00000000  0x04 0x00000000>,
25d77bdd7df26c Dave Stevenson     2024-10-25  430  			 <0x1c 0x00000000  0x1c 0x00000000  0x04 0x00000000>;
25d77bdd7df26c Dave Stevenson     2024-10-25  431  
25d77bdd7df26c Dave Stevenson     2024-10-25  432  		dma-ranges = <0x00 0x00000000  0x00 0x00000000  0x10 0x00000000>,
25d77bdd7df26c Dave Stevenson     2024-10-25  433  			     <0x10 0x00000000  0x10 0x00000000  0x01 0x00000000>,
25d77bdd7df26c Dave Stevenson     2024-10-25  434  			     <0x14 0x00000000  0x14 0x00000000  0x04 0x00000000>,
25d77bdd7df26c Dave Stevenson     2024-10-25  435  			     <0x18 0x00000000  0x18 0x00000000  0x04 0x00000000>,
25d77bdd7df26c Dave Stevenson     2024-10-25  436  			     <0x1c 0x00000000  0x1c 0x00000000  0x04 0x00000000>;
25d77bdd7df26c Dave Stevenson     2024-10-25  437  
25d77bdd7df26c Dave Stevenson     2024-10-25  438  		vc4: gpu {
25d77bdd7df26c Dave Stevenson     2024-10-25  439  			compatible = "brcm,bcm2712-vc6";
25d77bdd7df26c Dave Stevenson     2024-10-25  440  		};
5050168029e946 Stanimir Varbanov  2025-01-20  441  
5050168029e946 Stanimir Varbanov  2025-01-20  442  		pcie0: pcie@1000100000 {
5050168029e946 Stanimir Varbanov  2025-01-20  443  			compatible = "brcm,bcm2712-pcie";
5050168029e946 Stanimir Varbanov  2025-01-20  444  			reg = <0x10 0x00100000 0x00 0x9310>;
5050168029e946 Stanimir Varbanov  2025-01-20  445  			device_type = "pci";
5050168029e946 Stanimir Varbanov  2025-01-20  446  			linux,pci-domain = <0>;
5050168029e946 Stanimir Varbanov  2025-01-20  447  			max-link-speed = <2>;
5050168029e946 Stanimir Varbanov  2025-01-20  448  			num-lanes = <1>;
5050168029e946 Stanimir Varbanov  2025-01-20  449  			#address-cells = <3>;
5050168029e946 Stanimir Varbanov  2025-01-20  450  			#interrupt-cells = <1>;
5050168029e946 Stanimir Varbanov  2025-01-20  451  			#size-cells = <2>;
5050168029e946 Stanimir Varbanov  2025-01-20  452  			interrupt-parent = <&gicv2>;
5050168029e946 Stanimir Varbanov  2025-01-20  453  			interrupts = <GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>,
5050168029e946 Stanimir Varbanov  2025-01-20  454  				     <GIC_SPI 214 IRQ_TYPE_LEVEL_HIGH>;
5050168029e946 Stanimir Varbanov  2025-01-20  455  			interrupt-names = "pcie", "msi";
5050168029e946 Stanimir Varbanov  2025-01-20  456  			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
5050168029e946 Stanimir Varbanov  2025-01-20 @457  			interrupt-map = <0 0 0 1 &gicv2 GIC_SPI 209 IRQ_TYPE_LEVEL_HIGH>,

:::::: The code at line 457 was first introduced by commit
:::::: 5050168029e9465953da812e42ba7c7a6d5ae68e arm64: dts: broadcom: bcm2712: Add PCIe DT nodes

:::::: TO: Stanimir Varbanov <svarbanov@suse.de>
:::::: CC: Florian Fainelli <florian.fainelli@broadcom.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
