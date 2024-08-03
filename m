Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E11F4C74
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Aug 2024 00:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722646172; cv=none; b=VDzVSoiLn+x5WZ4ZTRy20F55AwVjzLr/GyujiwGYlvJb3k0AFCQvAQhECd+HvKtpn4DMHWh9GKsU6fCx+rQdqnAJfeYFpjAl2XkZ8T2fTYsskzXHcoVpMvuFloOfCQ2HUI7+GQjKBqQB2xMJZfU/SXvrHEtKE82lIxBpU7w3/+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722646172; c=relaxed/simple;
	bh=eh/Ajuig5uobTvaRfDvq+w7Gs4UeQxcea2jaHiSEHQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u5xhxkpP1Fg5q01tuN8Xl0ns7yiUgdrvAzTyckfDJANHz5D6oQh3BFTqw1mBV4lGp+OMKQYhRA6O3OWUrl8NTmztpW2hed3XzUDs7i/7LY6vKqq6acyOMbZk4jklIX6ZG0ta2PBkju+TSQ4glXae1ITwLlFK9/sRqDjGi2r4VpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILmz85Pm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILmz85Pm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722646162; x=1754182162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eh/Ajuig5uobTvaRfDvq+w7Gs4UeQxcea2jaHiSEHQE=;
  b=ILmz85Pm3F/Ix+B2dQVYXkaRY3R/xS1lRnQIH7x6Ey1/e+EtWgEYaf2x
   XzXV9IEuAqXvmu6FyF8K3xJplA8P0ztdmqwXgbascawGwBnvxRd+X1TeD
   WEJnNeaQucorIRpjI8GbWYmBs6w5dIvDdSzeZqRjgP4Oe8E0eZmSMxVK8
   IpUuNYQnMc16xmTWeXE7rQZZqfpatZdjtJQ20YeSYpzdNCDMoBfQv+s67
   b5IGd+BOnUvWnrbN4Y560nRHb74DI5SD95LQ/uTuzAUD0HY2rUELJJ8Z9
   9SHfF7bIdzpFDd/eN755OpMU1aoB7x/oS/PJbsSBZ+CBuQ8j8RenpsANq
   g==;
X-CSE-ConnectionGUID: qVyvQaIRQpqcdin2NLaeJg==
X-CSE-MsgGUID: QqPixUmcTHaDetJLRQBkWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11152"; a="24551960"
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="24551960"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2024 17:49:21 -0700
X-CSE-ConnectionGUID: K83R0Nt/TVS8gyIfbU5e9w==
X-CSE-MsgGUID: Gtu87OurRsO9b/zLJodS6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,259,1716274800"; 
   d="scan'208";a="55453605"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 02 Aug 2024 17:49:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sa2xQ-000xdE-0a;
	Sat, 03 Aug 2024 00:49:16 +0000
Date: Sat, 3 Aug 2024 08:48:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 3/7]
 arch/arm64/boot/dts/mediatek/mt8188.dtsi:2319.42-2323.5: Warning
 (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges
 property
Message-ID: <202408030843.RVplzjY1-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   714b7640b7e49da5d8d3b9b3a36c0d776accbe6d
commit: 0d093046fe4ae1338351c160b38339ea5bd858c2 [3/7] CHROMIUM: arm64: dts: mt8188: Refactor DT and update node names
:::::: branch date: 16 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-001-20240803 (https://download.01.org/0day-ci/archive/20240803/202408030843.RVplzjY1-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 423aec6573df4424f90555468128e17073ddc69e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240803/202408030843.RVplzjY1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408030843.RVplzjY1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1374.29-1398.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1480.35-1485.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1487.35-1492.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1942.26-1956.5: Warning (simple_bus_reg): /soc/t-phy@11e30000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1958.26-1981.5: Warning (simple_bus_reg): /soc/t-phy@11e40000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (simple_bus_reg): /soc/t-phy@11e80000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2319.42-2323.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (simple_bus_reg): /soc/hcp@0: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2363.11-2387.5: Warning (simple_bus_reg): /soc/hcp-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3300.14-3325.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3327.15-3362.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3364.15-3399.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4049.49-4056.5: Warning (simple_bus_reg): /soc/apusys-hw-logger@0x19024000: simple-bus unit address format error, expected "19024000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4355.38-4361.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4363.38-4369.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1374.29-1398.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1480.35-1485.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1487.35-1492.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1942.26-1956.5: Warning (simple_bus_reg): /soc/t-phy@11e30000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1958.26-1981.5: Warning (simple_bus_reg): /soc/t-phy@11e40000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (simple_bus_reg): /soc/t-phy@11e80000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2319.42-2323.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (simple_bus_reg): /soc/hcp@0: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2363.11-2387.5: Warning (simple_bus_reg): /soc/hcp-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3300.14-3325.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3327.15-3362.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3364.15-3399.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4049.49-4056.5: Warning (simple_bus_reg): /soc/apusys-hw-logger@0x19024000: simple-bus unit address format error, expected "19024000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4355.38-4361.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4363.38-4369.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1374.29-1398.5: Warning (simple_bus_reg): /soc/scp@10500000: simple-bus unit address format error, expected "10720000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1480.35-1485.5: Warning (simple_bus_reg): /soc/mailbox@10b86000: simple-bus unit address format error, expected "10b86100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1487.35-1492.5: Warning (simple_bus_reg): /soc/mailbox@10b87000: simple-bus unit address format error, expected "10b87100"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1942.26-1956.5: Warning (simple_bus_reg): /soc/t-phy@11e30000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1958.26-1981.5: Warning (simple_bus_reg): /soc/t-phy@11e40000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:1983.26-1997.5: Warning (simple_bus_reg): /soc/t-phy@11e80000: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8188.dtsi:2319.42-2323.5: Warning (simple_bus_reg): /soc/regulator-dvfs-vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2325.14-2361.5: Warning (simple_bus_reg): /soc/hcp@0: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:2363.11-2387.5: Warning (simple_bus_reg): /soc/hcp-l15: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3300.14-3325.5: Warning (simple_bus_reg): /soc/imgsys-l10: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3327.15-3362.5: Warning (simple_bus_reg): /soc/imgsys-l11A: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:3364.15-3399.5: Warning (simple_bus_reg): /soc/imgsys-l11C: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4049.49-4056.5: Warning (simple_bus_reg): /soc/apusys-hw-logger@0x19024000: simple-bus unit address format error, expected "19024000"
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4355.38-4361.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-code: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8188.dtsi:4363.38-4369.5: Warning (simple_bus_reg): /soc/mtk-apu-mem-data: missing or empty reg/ranges property

vim +2319 arch/arm64/boot/dts/mediatek/mt8188.dtsi

800ef7029f37c5 jason-ch chen    2023-10-23    18  
800ef7029f37c5 jason-ch chen    2023-10-23    19  / {
800ef7029f37c5 jason-ch chen    2023-10-23    20  	compatible = "mediatek,mt8188";
800ef7029f37c5 jason-ch chen    2023-10-23    21  	interrupt-parent = <&gic>;
800ef7029f37c5 jason-ch chen    2023-10-23    22  	#address-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23    23  	#size-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23    24  
9de20b7422ddeb Johnson Wang     2023-01-10    25  	aliases {
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    26  		dp-intf1 = &dp_intf1;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    27  		ethdr0 = &ethdr0;
9de20b7422ddeb Johnson Wang     2023-01-10    28  		gce0 = &gce0;
9de20b7422ddeb Johnson Wang     2023-01-10    29  		gce1 = &gce1;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    30  		merge1 = &merge1;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    31  		merge2 = &merge2;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    32  		merge3 = &merge3;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    33  		merge4 = &merge4;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    34  		merge5 = &merge5;
0d093046fe4ae1 Fei Shao         2024-07-22    35  		mutex0 = &mutex0;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    36  		mutex1 = &mutex1;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    37  		padding0 = &padding0;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    38  		padding1 = &padding1;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    39  		padding2 = &padding2;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    40  		padding3 = &padding3;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    41  		padding4 = &padding4;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    42  		padding5 = &padding5;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    43  		padding6 = &padding6;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    44  		padding7 = &padding7;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    45  		vdo1-rdma0 = &vdo1_rdma0;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    46  		vdo1-rdma1 = &vdo1_rdma1;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    47  		vdo1-rdma2 = &vdo1_rdma2;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    48  		vdo1-rdma3 = &vdo1_rdma3;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    49  		vdo1-rdma4 = &vdo1_rdma4;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    50  		vdo1-rdma5 = &vdo1_rdma5;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    51  		vdo1-rdma6 = &vdo1_rdma6;
8a9e63c7f424ce Hsiao Chien Sung 2023-06-13    52  		vdo1-rdma7 = &vdo1_rdma7;
9de20b7422ddeb Johnson Wang     2023-01-10    53  	};
9de20b7422ddeb Johnson Wang     2023-01-10    54  
800ef7029f37c5 jason-ch chen    2023-10-23    55  	cpus {
800ef7029f37c5 jason-ch chen    2023-10-23    56  		#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23    57  		#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23    58  
800ef7029f37c5 jason-ch chen    2023-10-23    59  		cpu0: cpu@0 {
800ef7029f37c5 jason-ch chen    2023-10-23    60  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23    61  			compatible = "arm,cortex-a55";
800ef7029f37c5 jason-ch chen    2023-10-23    62  			reg = <0x000>;
800ef7029f37c5 jason-ch chen    2023-10-23    63  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10    64  			performance-domains = <&performance 0>;
800ef7029f37c5 jason-ch chen    2023-10-23    65  			clock-frequency = <2000000000>;
800ef7029f37c5 jason-ch chen    2023-10-23    66  			capacity-dmips-mhz = <282>;
800ef7029f37c5 jason-ch chen    2023-10-23    67  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
800ef7029f37c5 jason-ch chen    2023-10-23    68  			i-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23    69  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23    70  			i-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23    71  			d-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23    72  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23    73  			d-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23    74  			next-level-cache = <&l2_0>;
800ef7029f37c5 jason-ch chen    2023-10-23    75  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23    76  		};
800ef7029f37c5 jason-ch chen    2023-10-23    77  
800ef7029f37c5 jason-ch chen    2023-10-23    78  		cpu1: cpu@100 {
800ef7029f37c5 jason-ch chen    2023-10-23    79  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23    80  			compatible = "arm,cortex-a55";
800ef7029f37c5 jason-ch chen    2023-10-23    81  			reg = <0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23    82  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10    83  			performance-domains = <&performance 0>;
800ef7029f37c5 jason-ch chen    2023-10-23    84  			clock-frequency = <2000000000>;
800ef7029f37c5 jason-ch chen    2023-10-23    85  			capacity-dmips-mhz = <282>;
800ef7029f37c5 jason-ch chen    2023-10-23    86  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
800ef7029f37c5 jason-ch chen    2023-10-23    87  			i-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23    88  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23    89  			i-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23    90  			d-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23    91  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23    92  			d-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23    93  			next-level-cache = <&l2_0>;
800ef7029f37c5 jason-ch chen    2023-10-23    94  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23    95  		};
800ef7029f37c5 jason-ch chen    2023-10-23    96  
800ef7029f37c5 jason-ch chen    2023-10-23    97  		cpu2: cpu@200 {
800ef7029f37c5 jason-ch chen    2023-10-23    98  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23    99  			compatible = "arm,cortex-a55";
800ef7029f37c5 jason-ch chen    2023-10-23   100  			reg = <0x200>;
800ef7029f37c5 jason-ch chen    2023-10-23   101  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10   102  			performance-domains = <&performance 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   103  			clock-frequency = <2000000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   104  			capacity-dmips-mhz = <282>;
800ef7029f37c5 jason-ch chen    2023-10-23   105  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
800ef7029f37c5 jason-ch chen    2023-10-23   106  			i-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   107  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   108  			i-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   109  			d-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   110  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   111  			d-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   112  			next-level-cache = <&l2_0>;
800ef7029f37c5 jason-ch chen    2023-10-23   113  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   114  		};
800ef7029f37c5 jason-ch chen    2023-10-23   115  
800ef7029f37c5 jason-ch chen    2023-10-23   116  		cpu3: cpu@300 {
800ef7029f37c5 jason-ch chen    2023-10-23   117  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23   118  			compatible = "arm,cortex-a55";
800ef7029f37c5 jason-ch chen    2023-10-23   119  			reg = <0x300>;
800ef7029f37c5 jason-ch chen    2023-10-23   120  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10   121  			performance-domains = <&performance 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   122  			clock-frequency = <2000000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   123  			capacity-dmips-mhz = <282>;
800ef7029f37c5 jason-ch chen    2023-10-23   124  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
800ef7029f37c5 jason-ch chen    2023-10-23   125  			i-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   126  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   127  			i-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   128  			d-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   129  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   130  			d-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   131  			next-level-cache = <&l2_0>;
800ef7029f37c5 jason-ch chen    2023-10-23   132  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   133  		};
800ef7029f37c5 jason-ch chen    2023-10-23   134  
800ef7029f37c5 jason-ch chen    2023-10-23   135  		cpu4: cpu@400 {
800ef7029f37c5 jason-ch chen    2023-10-23   136  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23   137  			compatible = "arm,cortex-a55";
800ef7029f37c5 jason-ch chen    2023-10-23   138  			reg = <0x400>;
800ef7029f37c5 jason-ch chen    2023-10-23   139  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10   140  			performance-domains = <&performance 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   141  			clock-frequency = <2000000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   142  			capacity-dmips-mhz = <282>;
800ef7029f37c5 jason-ch chen    2023-10-23   143  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
800ef7029f37c5 jason-ch chen    2023-10-23   144  			i-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   145  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   146  			i-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   147  			d-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   148  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   149  			d-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   150  			next-level-cache = <&l2_0>;
800ef7029f37c5 jason-ch chen    2023-10-23   151  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   152  		};
800ef7029f37c5 jason-ch chen    2023-10-23   153  
800ef7029f37c5 jason-ch chen    2023-10-23   154  		cpu5: cpu@500 {
800ef7029f37c5 jason-ch chen    2023-10-23   155  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23   156  			compatible = "arm,cortex-a55";
800ef7029f37c5 jason-ch chen    2023-10-23   157  			reg = <0x500>;
800ef7029f37c5 jason-ch chen    2023-10-23   158  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10   159  			performance-domains = <&performance 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   160  			clock-frequency = <2000000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   161  			capacity-dmips-mhz = <282>;
800ef7029f37c5 jason-ch chen    2023-10-23   162  			cpu-idle-states = <&cpu_off_l &cluster_off_l>;
800ef7029f37c5 jason-ch chen    2023-10-23   163  			i-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   164  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   165  			i-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   166  			d-cache-size = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   167  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   168  			d-cache-sets = <128>;
800ef7029f37c5 jason-ch chen    2023-10-23   169  			next-level-cache = <&l2_0>;
800ef7029f37c5 jason-ch chen    2023-10-23   170  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   171  		};
800ef7029f37c5 jason-ch chen    2023-10-23   172  
800ef7029f37c5 jason-ch chen    2023-10-23   173  		cpu6: cpu@600 {
800ef7029f37c5 jason-ch chen    2023-10-23   174  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23   175  			compatible = "arm,cortex-a78";
800ef7029f37c5 jason-ch chen    2023-10-23   176  			reg = <0x600>;
800ef7029f37c5 jason-ch chen    2023-10-23   177  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10   178  			performance-domains = <&performance 1>;
800ef7029f37c5 jason-ch chen    2023-10-23   179  			clock-frequency = <2600000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   180  			capacity-dmips-mhz = <1024>;
800ef7029f37c5 jason-ch chen    2023-10-23   181  			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
800ef7029f37c5 jason-ch chen    2023-10-23   182  			i-cache-size = <65536>;
800ef7029f37c5 jason-ch chen    2023-10-23   183  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   184  			i-cache-sets = <256>;
800ef7029f37c5 jason-ch chen    2023-10-23   185  			d-cache-size = <65536>;
800ef7029f37c5 jason-ch chen    2023-10-23   186  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   187  			d-cache-sets = <256>;
800ef7029f37c5 jason-ch chen    2023-10-23   188  			next-level-cache = <&l2_1>;
800ef7029f37c5 jason-ch chen    2023-10-23   189  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   190  		};
800ef7029f37c5 jason-ch chen    2023-10-23   191  
800ef7029f37c5 jason-ch chen    2023-10-23   192  		cpu7: cpu@700 {
800ef7029f37c5 jason-ch chen    2023-10-23   193  			device_type = "cpu";
800ef7029f37c5 jason-ch chen    2023-10-23   194  			compatible = "arm,cortex-a78";
800ef7029f37c5 jason-ch chen    2023-10-23   195  			reg = <0x700>;
800ef7029f37c5 jason-ch chen    2023-10-23   196  			enable-method = "psci";
277f9534dc71a9 Johnson Wang     2023-03-10   197  			performance-domains = <&performance 1>;
800ef7029f37c5 jason-ch chen    2023-10-23   198  			clock-frequency = <2600000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   199  			capacity-dmips-mhz = <1024>;
800ef7029f37c5 jason-ch chen    2023-10-23   200  			cpu-idle-states = <&cpu_off_b &cluster_off_b>;
800ef7029f37c5 jason-ch chen    2023-10-23   201  			i-cache-size = <65536>;
800ef7029f37c5 jason-ch chen    2023-10-23   202  			i-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   203  			i-cache-sets = <256>;
800ef7029f37c5 jason-ch chen    2023-10-23   204  			d-cache-size = <65536>;
800ef7029f37c5 jason-ch chen    2023-10-23   205  			d-cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   206  			d-cache-sets = <256>;
800ef7029f37c5 jason-ch chen    2023-10-23   207  			next-level-cache = <&l2_1>;
800ef7029f37c5 jason-ch chen    2023-10-23   208  			#cooling-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   209  		};
800ef7029f37c5 jason-ch chen    2023-10-23   210  
800ef7029f37c5 jason-ch chen    2023-10-23   211  		cpu-map {
800ef7029f37c5 jason-ch chen    2023-10-23   212  			cluster0 {
800ef7029f37c5 jason-ch chen    2023-10-23   213  				core0 {
800ef7029f37c5 jason-ch chen    2023-10-23   214  					cpu = <&cpu0>;
800ef7029f37c5 jason-ch chen    2023-10-23   215  				};
800ef7029f37c5 jason-ch chen    2023-10-23   216  
800ef7029f37c5 jason-ch chen    2023-10-23   217  				core1 {
800ef7029f37c5 jason-ch chen    2023-10-23   218  					cpu = <&cpu1>;
800ef7029f37c5 jason-ch chen    2023-10-23   219  				};
800ef7029f37c5 jason-ch chen    2023-10-23   220  
800ef7029f37c5 jason-ch chen    2023-10-23   221  				core2 {
800ef7029f37c5 jason-ch chen    2023-10-23   222  					cpu = <&cpu2>;
800ef7029f37c5 jason-ch chen    2023-10-23   223  				};
800ef7029f37c5 jason-ch chen    2023-10-23   224  
800ef7029f37c5 jason-ch chen    2023-10-23   225  				core3 {
800ef7029f37c5 jason-ch chen    2023-10-23   226  					cpu = <&cpu3>;
800ef7029f37c5 jason-ch chen    2023-10-23   227  				};
800ef7029f37c5 jason-ch chen    2023-10-23   228  
800ef7029f37c5 jason-ch chen    2023-10-23   229  				core4 {
800ef7029f37c5 jason-ch chen    2023-10-23   230  					cpu = <&cpu4>;
800ef7029f37c5 jason-ch chen    2023-10-23   231  				};
800ef7029f37c5 jason-ch chen    2023-10-23   232  
800ef7029f37c5 jason-ch chen    2023-10-23   233  				core5 {
800ef7029f37c5 jason-ch chen    2023-10-23   234  					cpu = <&cpu5>;
800ef7029f37c5 jason-ch chen    2023-10-23   235  				};
6af14ba53ac522 Johnson Wang     2022-07-25   236  			};
800ef7029f37c5 jason-ch chen    2023-10-23   237  
6af14ba53ac522 Johnson Wang     2022-07-25   238  			cluster1 {
6af14ba53ac522 Johnson Wang     2022-07-25   239  				core0 {
800ef7029f37c5 jason-ch chen    2023-10-23   240  					cpu = <&cpu6>;
800ef7029f37c5 jason-ch chen    2023-10-23   241  				};
800ef7029f37c5 jason-ch chen    2023-10-23   242  
6af14ba53ac522 Johnson Wang     2022-07-25   243  				core1 {
800ef7029f37c5 jason-ch chen    2023-10-23   244  					cpu = <&cpu7>;
800ef7029f37c5 jason-ch chen    2023-10-23   245  				};
800ef7029f37c5 jason-ch chen    2023-10-23   246  			};
800ef7029f37c5 jason-ch chen    2023-10-23   247  		};
800ef7029f37c5 jason-ch chen    2023-10-23   248  
800ef7029f37c5 jason-ch chen    2023-10-23   249  		idle-states {
800ef7029f37c5 jason-ch chen    2023-10-23   250  			entry-method = "psci";
800ef7029f37c5 jason-ch chen    2023-10-23   251  
800ef7029f37c5 jason-ch chen    2023-10-23   252  			cpu_off_l: cpu-off-l {
800ef7029f37c5 jason-ch chen    2023-10-23   253  				compatible = "arm,idle-state";
800ef7029f37c5 jason-ch chen    2023-10-23   254  				arm,psci-suspend-param = <0x00010000>;
800ef7029f37c5 jason-ch chen    2023-10-23   255  				local-timer-stop;
800ef7029f37c5 jason-ch chen    2023-10-23   256  				entry-latency-us = <50>;
800ef7029f37c5 jason-ch chen    2023-10-23   257  				exit-latency-us = <95>;
800ef7029f37c5 jason-ch chen    2023-10-23   258  				min-residency-us = <580>;
800ef7029f37c5 jason-ch chen    2023-10-23   259  			};
800ef7029f37c5 jason-ch chen    2023-10-23   260  
800ef7029f37c5 jason-ch chen    2023-10-23   261  			cpu_off_b: cpu-off-b {
800ef7029f37c5 jason-ch chen    2023-10-23   262  				compatible = "arm,idle-state";
800ef7029f37c5 jason-ch chen    2023-10-23   263  				arm,psci-suspend-param = <0x00010000>;
800ef7029f37c5 jason-ch chen    2023-10-23   264  				local-timer-stop;
800ef7029f37c5 jason-ch chen    2023-10-23   265  				entry-latency-us = <45>;
800ef7029f37c5 jason-ch chen    2023-10-23   266  				exit-latency-us = <140>;
800ef7029f37c5 jason-ch chen    2023-10-23   267  				min-residency-us = <740>;
800ef7029f37c5 jason-ch chen    2023-10-23   268  			};
800ef7029f37c5 jason-ch chen    2023-10-23   269  
800ef7029f37c5 jason-ch chen    2023-10-23   270  			cluster_off_l: cluster-off-l {
800ef7029f37c5 jason-ch chen    2023-10-23   271  				compatible = "arm,idle-state";
800ef7029f37c5 jason-ch chen    2023-10-23   272  				arm,psci-suspend-param = <0x01010010>;
800ef7029f37c5 jason-ch chen    2023-10-23   273  				local-timer-stop;
800ef7029f37c5 jason-ch chen    2023-10-23   274  				entry-latency-us = <55>;
800ef7029f37c5 jason-ch chen    2023-10-23   275  				exit-latency-us = <155>;
800ef7029f37c5 jason-ch chen    2023-10-23   276  				min-residency-us = <840>;
800ef7029f37c5 jason-ch chen    2023-10-23   277  			};
800ef7029f37c5 jason-ch chen    2023-10-23   278  
800ef7029f37c5 jason-ch chen    2023-10-23   279  			cluster_off_b: cluster-off-b {
800ef7029f37c5 jason-ch chen    2023-10-23   280  				compatible = "arm,idle-state";
800ef7029f37c5 jason-ch chen    2023-10-23   281  				arm,psci-suspend-param = <0x01010010>;
800ef7029f37c5 jason-ch chen    2023-10-23   282  				local-timer-stop;
800ef7029f37c5 jason-ch chen    2023-10-23   283  				entry-latency-us = <50>;
800ef7029f37c5 jason-ch chen    2023-10-23   284  				exit-latency-us = <200>;
800ef7029f37c5 jason-ch chen    2023-10-23   285  				min-residency-us = <1000>;
800ef7029f37c5 jason-ch chen    2023-10-23   286  			};
6af14ba53ac522 Johnson Wang     2022-07-25   287  
cbb0f8b948cfda Fei Shao         2024-06-14   288  			mcusys_off: mcusys-off {
6af14ba53ac522 Johnson Wang     2022-07-25   289  				compatible = "arm,idle-state";
6af14ba53ac522 Johnson Wang     2022-07-25   290  				arm,psci-suspend-param = <0x01010024>;
6af14ba53ac522 Johnson Wang     2022-07-25   291  				local-timer-stop;
6af14ba53ac522 Johnson Wang     2022-07-25   292  				entry-latency-us = <640>;
6af14ba53ac522 Johnson Wang     2022-07-25   293  				exit-latency-us = <1400>;
6af14ba53ac522 Johnson Wang     2022-07-25   294  				min-residency-us = <13200>;
6af14ba53ac522 Johnson Wang     2022-07-25   295  			};
6af14ba53ac522 Johnson Wang     2022-07-25   296  
cbb0f8b948cfda Fei Shao         2024-06-14   297  			system_mem: system-mem {
6af14ba53ac522 Johnson Wang     2022-07-25   298  				compatible = "arm,idle-state";
6af14ba53ac522 Johnson Wang     2022-07-25   299  				arm,psci-suspend-param = <0x01010030>;
6af14ba53ac522 Johnson Wang     2022-07-25   300  				local-timer-stop;
6af14ba53ac522 Johnson Wang     2022-07-25   301  				entry-latency-us = <640>;
6af14ba53ac522 Johnson Wang     2022-07-25   302  				exit-latency-us = <1800>;
6af14ba53ac522 Johnson Wang     2022-07-25   303  				min-residency-us = <13200>;
6af14ba53ac522 Johnson Wang     2022-07-25   304  			};
6af14ba53ac522 Johnson Wang     2022-07-25   305  
cbb0f8b948cfda Fei Shao         2024-06-14   306  			system_pll: system-pll {
6af14ba53ac522 Johnson Wang     2022-07-25   307  				compatible = "arm,idle-state";
6af14ba53ac522 Johnson Wang     2022-07-25   308  				arm,psci-suspend-param = <0x01010040>;
6af14ba53ac522 Johnson Wang     2022-07-25   309  				local-timer-stop;
6af14ba53ac522 Johnson Wang     2022-07-25   310  				entry-latency-us = <640>;
6af14ba53ac522 Johnson Wang     2022-07-25   311  				exit-latency-us = <1850>;
6af14ba53ac522 Johnson Wang     2022-07-25   312  				min-residency-us = <13200>;
6af14ba53ac522 Johnson Wang     2022-07-25   313  			};
6af14ba53ac522 Johnson Wang     2022-07-25   314  
cbb0f8b948cfda Fei Shao         2024-06-14   315  			system_bus: system-bus {
6af14ba53ac522 Johnson Wang     2022-07-25   316  				compatible = "arm,idle-state";
6af14ba53ac522 Johnson Wang     2022-07-25   317  				arm,psci-suspend-param = <0x01010050>;
6af14ba53ac522 Johnson Wang     2022-07-25   318  				local-timer-stop;
6af14ba53ac522 Johnson Wang     2022-07-25   319  				entry-latency-us = <640>;
6af14ba53ac522 Johnson Wang     2022-07-25   320  				exit-latency-us = <2800>;
6af14ba53ac522 Johnson Wang     2022-07-25   321  				min-residency-us = <13200>;
6af14ba53ac522 Johnson Wang     2022-07-25   322  			};
6af14ba53ac522 Johnson Wang     2022-07-25   323  
6af14ba53ac522 Johnson Wang     2022-07-25   324  			s2idle: s2idle {
6af14ba53ac522 Johnson Wang     2022-07-25   325  				compatible = "arm,idle-state";
6af14ba53ac522 Johnson Wang     2022-07-25   326  				arm,psci-suspend-param = <0x01011f01>;
6af14ba53ac522 Johnson Wang     2022-07-25   327  				local-timer-stop;
6af14ba53ac522 Johnson Wang     2022-07-25   328  				entry-latency-us = <10000>;
6af14ba53ac522 Johnson Wang     2022-07-25   329  				exit-latency-us = <10000>;
6af14ba53ac522 Johnson Wang     2022-07-25   330  				min-residency-us = <4294967295>;
6af14ba53ac522 Johnson Wang     2022-07-25   331  			};
800ef7029f37c5 jason-ch chen    2023-10-23   332  		};
800ef7029f37c5 jason-ch chen    2023-10-23   333  
800ef7029f37c5 jason-ch chen    2023-10-23   334  		l2_0: l2-cache0 {
800ef7029f37c5 jason-ch chen    2023-10-23   335  			compatible = "cache";
800ef7029f37c5 jason-ch chen    2023-10-23   336  			cache-level = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   337  			cache-size = <131072>;
800ef7029f37c5 jason-ch chen    2023-10-23   338  			cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   339  			cache-sets = <512>;
800ef7029f37c5 jason-ch chen    2023-10-23   340  			next-level-cache = <&l3_0>;
800ef7029f37c5 jason-ch chen    2023-10-23   341  			cache-unified;
800ef7029f37c5 jason-ch chen    2023-10-23   342  		};
800ef7029f37c5 jason-ch chen    2023-10-23   343  
800ef7029f37c5 jason-ch chen    2023-10-23   344  		l2_1: l2-cache1 {
800ef7029f37c5 jason-ch chen    2023-10-23   345  			compatible = "cache";
800ef7029f37c5 jason-ch chen    2023-10-23   346  			cache-level = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   347  			cache-size = <262144>;
800ef7029f37c5 jason-ch chen    2023-10-23   348  			cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   349  			cache-sets = <512>;
800ef7029f37c5 jason-ch chen    2023-10-23   350  			next-level-cache = <&l3_0>;
800ef7029f37c5 jason-ch chen    2023-10-23   351  			cache-unified;
800ef7029f37c5 jason-ch chen    2023-10-23   352  		};
800ef7029f37c5 jason-ch chen    2023-10-23   353  
800ef7029f37c5 jason-ch chen    2023-10-23   354  		l3_0: l3-cache {
800ef7029f37c5 jason-ch chen    2023-10-23   355  			compatible = "cache";
800ef7029f37c5 jason-ch chen    2023-10-23   356  			cache-level = <3>;
800ef7029f37c5 jason-ch chen    2023-10-23   357  			cache-size = <2097152>;
800ef7029f37c5 jason-ch chen    2023-10-23   358  			cache-line-size = <64>;
800ef7029f37c5 jason-ch chen    2023-10-23   359  			cache-sets = <2048>;
800ef7029f37c5 jason-ch chen    2023-10-23   360  			cache-unified;
800ef7029f37c5 jason-ch chen    2023-10-23   361  		};
800ef7029f37c5 jason-ch chen    2023-10-23   362  	};
800ef7029f37c5 jason-ch chen    2023-10-23   363  
800ef7029f37c5 jason-ch chen    2023-10-23   364  	clk13m: oscillator-13m {
800ef7029f37c5 jason-ch chen    2023-10-23   365  		compatible = "fixed-clock";
800ef7029f37c5 jason-ch chen    2023-10-23   366  		#clock-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23   367  		clock-frequency = <13000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   368  		clock-output-names = "clk13m";
800ef7029f37c5 jason-ch chen    2023-10-23   369  	};
800ef7029f37c5 jason-ch chen    2023-10-23   370  
800ef7029f37c5 jason-ch chen    2023-10-23   371  	clk26m: oscillator-26m {
800ef7029f37c5 jason-ch chen    2023-10-23   372  		compatible = "fixed-clock";
800ef7029f37c5 jason-ch chen    2023-10-23   373  		#clock-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23   374  		clock-frequency = <26000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   375  		clock-output-names = "clk26m";
800ef7029f37c5 jason-ch chen    2023-10-23   376  	};
800ef7029f37c5 jason-ch chen    2023-10-23   377  
800ef7029f37c5 jason-ch chen    2023-10-23   378  	clk32k: oscillator-32k {
800ef7029f37c5 jason-ch chen    2023-10-23   379  		compatible = "fixed-clock";
800ef7029f37c5 jason-ch chen    2023-10-23   380  		#clock-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23   381  		clock-frequency = <32768>;
800ef7029f37c5 jason-ch chen    2023-10-23   382  		clock-output-names = "clk32k";
800ef7029f37c5 jason-ch chen    2023-10-23   383  	};
800ef7029f37c5 jason-ch chen    2023-10-23   384  
0d093046fe4ae1 Fei Shao         2024-07-22   385  	gpu_opp_table: opp-table-gpu {
fc3eef90bc9933 Johnson Wang     2023-02-14   386  		compatible = "operating-points-v2", "operating-points-v2-mali";
fc3eef90bc9933 Johnson Wang     2023-02-14   387  		opp-shared;
fc3eef90bc9933 Johnson Wang     2023-02-14   388  
fc3eef90bc9933 Johnson Wang     2023-02-14   389  		opp-390000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   390  			opp-hz = /bits/ 64 <390000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   391  			opp-hz-real = /bits/ 64 <390000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   392  				      /bits/ 64 <390000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   393  			opp-microvolt = <575000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   394  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   395  
fc3eef90bc9933 Johnson Wang     2023-02-14   396  		opp-431000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   397  			opp-hz = /bits/ 64 <431000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   398  			opp-hz-real = /bits/ 64 <431000000>,
56b1f4ea7f5d39 Fei Shao         2024-07-22   399  				      /bits/ 64 <431000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   400  			opp-microvolt = <587500>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   401  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   402  
fc3eef90bc9933 Johnson Wang     2023-02-14   403  		opp-473000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   404  			opp-hz = /bits/ 64 <473000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   405  			opp-hz-real = /bits/ 64 <473000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   406  				      /bits/ 64 <473000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   407  			opp-microvolt = <600000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   408  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   409  
fc3eef90bc9933 Johnson Wang     2023-02-14   410  		opp-515000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   411  			opp-hz = /bits/ 64 <515000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   412  			opp-hz-real = /bits/ 64 <515000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   413  				      /bits/ 64 <515000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   414  			opp-microvolt = <612500>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   415  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   416  
fc3eef90bc9933 Johnson Wang     2023-02-14   417  		opp-556000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   418  			opp-hz = /bits/ 64 <556000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   419  			opp-hz-real = /bits/ 64 <556000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   420  				      /bits/ 64 <556000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   421  			opp-microvolt = <625000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   422  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   423  
fc3eef90bc9933 Johnson Wang     2023-02-14   424  		opp-598000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   425  			opp-hz = /bits/ 64 <598000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   426  			opp-hz-real = /bits/ 64 <598000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   427  				      /bits/ 64 <598000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   428  			opp-microvolt = <637500>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   429  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   430  
fc3eef90bc9933 Johnson Wang     2023-02-14   431  		opp-640000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   432  			opp-hz = /bits/ 64 <640000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   433  			opp-hz-real = /bits/ 64 <640000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   434  				      /bits/ 64 <640000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   435  			opp-microvolt = <650000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   436  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   437  
fc3eef90bc9933 Johnson Wang     2023-02-14   438  		opp-670000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   439  			opp-hz = /bits/ 64 <670000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   440  			opp-hz-real = /bits/ 64 <670000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   441  				      /bits/ 64 <670000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   442  			opp-microvolt = <662500>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   443  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   444  
fc3eef90bc9933 Johnson Wang     2023-02-14   445  		opp-700000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   446  			opp-hz = /bits/ 64 <700000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   447  			opp-hz-real = /bits/ 64 <700000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   448  				      /bits/ 64 <700000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   449  			opp-microvolt = <675000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   450  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   451  
fc3eef90bc9933 Johnson Wang     2023-02-14   452  		opp-730000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   453  			opp-hz = /bits/ 64 <730000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   454  			opp-hz-real = /bits/ 64 <730000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   455  				      /bits/ 64 <730000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   456  			opp-microvolt = <687500>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   457  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   458  
fc3eef90bc9933 Johnson Wang     2023-02-14   459  		opp-760000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   460  			opp-hz = /bits/ 64 <760000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   461  			opp-hz-real = /bits/ 64 <760000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   462  				      /bits/ 64 <760000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   463  			opp-microvolt = <700000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   464  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   465  
fc3eef90bc9933 Johnson Wang     2023-02-14   466  		opp-790000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   467  			opp-hz = /bits/ 64 <790000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   468  			opp-hz-real = /bits/ 64 <790000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   469  				      /bits/ 64 <790000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   470  			opp-microvolt = <712500>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   471  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   472  
fc3eef90bc9933 Johnson Wang     2023-02-14   473  		opp-835000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   474  			opp-hz = /bits/ 64 <835000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   475  			opp-hz-real = /bits/ 64 <835000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   476  				      /bits/ 64 <835000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   477  			opp-microvolt = <731250>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   478  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   479  
fc3eef90bc9933 Johnson Wang     2023-02-14   480  		opp-880000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   481  			opp-hz = /bits/ 64 <880000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   482  			opp-hz-real = /bits/ 64 <880000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   483  				      /bits/ 64 <880000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   484  			opp-microvolt = <750000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   485  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   486  
fc3eef90bc9933 Johnson Wang     2023-02-14   487  		opp-915000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   488  			opp-hz = /bits/ 64 <915000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   489  			opp-hz-real = /bits/ 64 <915000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   490  				      /bits/ 64 <915000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   491  			opp-microvolt = <775000>, <775000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   492  			opp-microvolt-bin5 = <762500>, <762500>;
fc3eef90bc9933 Johnson Wang     2023-02-14   493  			opp-microvolt-bin6 = <750000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   494  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   495  
fc3eef90bc9933 Johnson Wang     2023-02-14   496  		opp-950000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14   497  			opp-hz = /bits/ 64 <950000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   498  			opp-hz-real = /bits/ 64 <950000000>,
fc3eef90bc9933 Johnson Wang     2023-02-14   499  				      /bits/ 64 <950000000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   500  			opp-microvolt = <800000>, <800000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   501  			opp-microvolt-bin5 = <775000>, <775000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   502  			opp-microvolt-bin6 = <750000>, <750000>;
fc3eef90bc9933 Johnson Wang     2023-02-14   503  		};
fc3eef90bc9933 Johnson Wang     2023-02-14   504  	};
fc3eef90bc9933 Johnson Wang     2023-02-14   505  
0d093046fe4ae1 Fei Shao         2024-07-22   506  	img_opp_table: opp-table-img {
0d093046fe4ae1 Fei Shao         2024-07-22   507  		compatible = "operating-points-v2";
0d093046fe4ae1 Fei Shao         2024-07-22   508  		opp-273000000 {
0d093046fe4ae1 Fei Shao         2024-07-22   509  			opp-hz = /bits/ 64 <273000000>;
0d093046fe4ae1 Fei Shao         2024-07-22   510  			opp-microvolt = <550000>;
0d093046fe4ae1 Fei Shao         2024-07-22   511  		};
0d093046fe4ae1 Fei Shao         2024-07-22   512  		opp-364000000 {
0d093046fe4ae1 Fei Shao         2024-07-22   513  			opp-hz = /bits/ 64 <364000000>;
0d093046fe4ae1 Fei Shao         2024-07-22   514  			opp-microvolt = <600000>;
0d093046fe4ae1 Fei Shao         2024-07-22   515  		};
0d093046fe4ae1 Fei Shao         2024-07-22   516  		opp-546000000 {
0d093046fe4ae1 Fei Shao         2024-07-22   517  			opp-hz = /bits/ 64 <546000000>;
0d093046fe4ae1 Fei Shao         2024-07-22   518  			opp-microvolt = <650000>;
0d093046fe4ae1 Fei Shao         2024-07-22   519  		};
0d093046fe4ae1 Fei Shao         2024-07-22   520  		opp-660000000 {
0d093046fe4ae1 Fei Shao         2024-07-22   521  			opp-hz = /bits/ 64 <660000000>;
0d093046fe4ae1 Fei Shao         2024-07-22   522  			opp-microvolt = <725000>;
0d093046fe4ae1 Fei Shao         2024-07-22   523  		};
0d093046fe4ae1 Fei Shao         2024-07-22   524  	};
0d093046fe4ae1 Fei Shao         2024-07-22   525  
0d093046fe4ae1 Fei Shao         2024-07-22   526  	ipe_opp_table: opp-table-ipe {
0d093046fe4ae1 Fei Shao         2024-07-22   527  		compatible = "operating-points-v2";
0d093046fe4ae1 Fei Shao         2024-07-22   528  		opp-273000000 {
0d093046fe4ae1 Fei Shao         2024-07-22   529  			opp-hz = /bits/ 64 <273000000>;
0d093046fe4ae1 Fei Shao         2024-07-22   530  			opp-microvolt = <550000>;
0d093046fe4ae1 Fei Shao         2024-07-22   531  		};
0d093046fe4ae1 Fei Shao         2024-07-22   532  		opp-364000000 {
0d093046fe4ae1 Fei Shao         2024-07-22   533  			opp-hz = /bits/ 64 <364000000>;
0d093046fe4ae1 Fei Shao         2024-07-22   534  			opp-microvolt = <600000>;
0d093046fe4ae1 Fei Shao         2024-07-22   535  		};
0d093046fe4ae1 Fei Shao         2024-07-22   536  		opp-458000000 {
0d093046fe4ae1 Fei Shao         2024-07-22   537  			opp-hz = /bits/ 64 <458000000>;
0d093046fe4ae1 Fei Shao         2024-07-22   538  			opp-microvolt = <650000>;
0d093046fe4ae1 Fei Shao         2024-07-22   539  		};
0d093046fe4ae1 Fei Shao         2024-07-22   540  		opp-546000000 {
0d093046fe4ae1 Fei Shao         2024-07-22   541  			opp-hz = /bits/ 64 <546000000>;
0d093046fe4ae1 Fei Shao         2024-07-22   542  			opp-microvolt = <725000>;
0d093046fe4ae1 Fei Shao         2024-07-22   543  		};
0d093046fe4ae1 Fei Shao         2024-07-22   544  	};
0d093046fe4ae1 Fei Shao         2024-07-22   545  
800ef7029f37c5 jason-ch chen    2023-10-23   546  	pmu-a55 {
800ef7029f37c5 jason-ch chen    2023-10-23   547  		compatible = "arm,cortex-a55-pmu";
800ef7029f37c5 jason-ch chen    2023-10-23   548  		interrupt-parent = <&gic>;
800ef7029f37c5 jason-ch chen    2023-10-23   549  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster0>;
800ef7029f37c5 jason-ch chen    2023-10-23   550  	};
800ef7029f37c5 jason-ch chen    2023-10-23   551  
800ef7029f37c5 jason-ch chen    2023-10-23   552  	pmu-a78 {
800ef7029f37c5 jason-ch chen    2023-10-23   553  		compatible = "arm,cortex-a78-pmu";
800ef7029f37c5 jason-ch chen    2023-10-23   554  		interrupt-parent = <&gic>;
800ef7029f37c5 jason-ch chen    2023-10-23   555  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH &ppi_cluster1>;
800ef7029f37c5 jason-ch chen    2023-10-23   556  	};
800ef7029f37c5 jason-ch chen    2023-10-23   557  
800ef7029f37c5 jason-ch chen    2023-10-23   558  	psci {
800ef7029f37c5 jason-ch chen    2023-10-23   559  		compatible = "arm,psci-1.0";
800ef7029f37c5 jason-ch chen    2023-10-23   560  		method = "smc";
800ef7029f37c5 jason-ch chen    2023-10-23   561  	};
800ef7029f37c5 jason-ch chen    2023-10-23   562  
1420601ea128b8 Trevor Wu        2023-03-20   563  	sound: sound {
1420601ea128b8 Trevor Wu        2023-03-20   564  		mediatek,platform = <&afe>;
1420601ea128b8 Trevor Wu        2023-03-20   565  		status = "disabled";
1420601ea128b8 Trevor Wu        2023-03-20   566  	};
1420601ea128b8 Trevor Wu        2023-03-20   567  
028639398cd6a9 Johnson Wang     2023-03-16   568  	vtemp: vtemp {
028639398cd6a9 Johnson Wang     2023-03-16   569  		compatible = "mediatek,virtual-temp";
028639398cd6a9 Johnson Wang     2023-03-16   570  		#thermal-sensor-cells = <1>;
028639398cd6a9 Johnson Wang     2023-03-16   571  	};
028639398cd6a9 Johnson Wang     2023-03-16   572  
cf583e82282568 Johnson Wang     2023-03-15   573  	thermal_zones: thermal-zones {
cf583e82282568 Johnson Wang     2023-03-15   574  		cpu_little1 {
cf583e82282568 Johnson Wang     2023-03-15   575  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   576  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   577  			thermal-sensors = <&lvtsmcu 0>;
cf583e82282568 Johnson Wang     2023-03-15   578  
cf583e82282568 Johnson Wang     2023-03-15   579  			trips {
cf583e82282568 Johnson Wang     2023-03-15   580  				cpu_little1_crit: cpu-little1-crit {
cf583e82282568 Johnson Wang     2023-03-15   581  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   582  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   583  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   584  				};
cf583e82282568 Johnson Wang     2023-03-15   585  			};
cf583e82282568 Johnson Wang     2023-03-15   586  		};
cf583e82282568 Johnson Wang     2023-03-15   587  
cf583e82282568 Johnson Wang     2023-03-15   588  		cpu_little2 {
cf583e82282568 Johnson Wang     2023-03-15   589  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   590  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   591  			thermal-sensors = <&lvtsmcu 1>;
cf583e82282568 Johnson Wang     2023-03-15   592  
cf583e82282568 Johnson Wang     2023-03-15   593  			trips {
cf583e82282568 Johnson Wang     2023-03-15   594  				cpu_little2_crit: cpu-little2-crit {
cf583e82282568 Johnson Wang     2023-03-15   595  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   596  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   597  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   598  				};
cf583e82282568 Johnson Wang     2023-03-15   599  			};
cf583e82282568 Johnson Wang     2023-03-15   600  		};
cf583e82282568 Johnson Wang     2023-03-15   601  
cf583e82282568 Johnson Wang     2023-03-15   602  		cpu_little3 {
cf583e82282568 Johnson Wang     2023-03-15   603  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   604  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   605  			thermal-sensors = <&lvtsmcu 2>;
cf583e82282568 Johnson Wang     2023-03-15   606  
cf583e82282568 Johnson Wang     2023-03-15   607  			trips {
cf583e82282568 Johnson Wang     2023-03-15   608  				cpu_little3_crit: cpu-little3-crit {
cf583e82282568 Johnson Wang     2023-03-15   609  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   610  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   611  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   612  				};
cf583e82282568 Johnson Wang     2023-03-15   613  			};
cf583e82282568 Johnson Wang     2023-03-15   614  		};
cf583e82282568 Johnson Wang     2023-03-15   615  
cf583e82282568 Johnson Wang     2023-03-15   616  		cpu_little4 {
cf583e82282568 Johnson Wang     2023-03-15   617  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   618  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   619  			thermal-sensors = <&lvtsmcu 3>;
cf583e82282568 Johnson Wang     2023-03-15   620  
cf583e82282568 Johnson Wang     2023-03-15   621  			trips {
cf583e82282568 Johnson Wang     2023-03-15   622  				cpu_little4_crit: cpu-little4-crit {
cf583e82282568 Johnson Wang     2023-03-15   623  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   624  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   625  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   626  				};
cf583e82282568 Johnson Wang     2023-03-15   627  			};
cf583e82282568 Johnson Wang     2023-03-15   628  		};
cf583e82282568 Johnson Wang     2023-03-15   629  
cf583e82282568 Johnson Wang     2023-03-15   630  		cpu_big0 {
cf583e82282568 Johnson Wang     2023-03-15   631  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   632  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   633  			thermal-sensors = <&lvtsmcu 4>;
cf583e82282568 Johnson Wang     2023-03-15   634  
cf583e82282568 Johnson Wang     2023-03-15   635  			trips {
cf583e82282568 Johnson Wang     2023-03-15   636  				cpu_big0_crit: cpu-big0-crit {
cf583e82282568 Johnson Wang     2023-03-15   637  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   638  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   639  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   640  				};
cf583e82282568 Johnson Wang     2023-03-15   641  			};
cf583e82282568 Johnson Wang     2023-03-15   642  		};
cf583e82282568 Johnson Wang     2023-03-15   643  
cf583e82282568 Johnson Wang     2023-03-15   644  		cpu_big1 {
cf583e82282568 Johnson Wang     2023-03-15   645  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   646  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   647  			thermal-sensors = <&lvtsmcu 5>;
cf583e82282568 Johnson Wang     2023-03-15   648  
cf583e82282568 Johnson Wang     2023-03-15   649  			trips {
cf583e82282568 Johnson Wang     2023-03-15   650  				cpu_big1_crit: cpu-big1-crit {
cf583e82282568 Johnson Wang     2023-03-15   651  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   652  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   653  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   654  				};
cf583e82282568 Johnson Wang     2023-03-15   655  			};
cf583e82282568 Johnson Wang     2023-03-15   656  		};
cf583e82282568 Johnson Wang     2023-03-15   657  
cf583e82282568 Johnson Wang     2023-03-15   658  		apu {
cf583e82282568 Johnson Wang     2023-03-15   659  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   660  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   661  			thermal-sensors = <&lvtsap 0>;
cf583e82282568 Johnson Wang     2023-03-15   662  
cf583e82282568 Johnson Wang     2023-03-15   663  			trips {
cf583e82282568 Johnson Wang     2023-03-15   664  				apu_crit: apu-crit {
cf583e82282568 Johnson Wang     2023-03-15   665  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   666  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   667  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   668  				};
cf583e82282568 Johnson Wang     2023-03-15   669  			};
cf583e82282568 Johnson Wang     2023-03-15   670  		};
cf583e82282568 Johnson Wang     2023-03-15   671  
cf583e82282568 Johnson Wang     2023-03-15   672  		gpu1 {
cf583e82282568 Johnson Wang     2023-03-15   673  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   674  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   675  			thermal-sensors = <&lvtsap 1>;
cf583e82282568 Johnson Wang     2023-03-15   676  
cf583e82282568 Johnson Wang     2023-03-15   677  			trips {
cf583e82282568 Johnson Wang     2023-03-15   678  				gpu1_crit: gpu1-crit {
cf583e82282568 Johnson Wang     2023-03-15   679  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   680  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   681  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   682  				};
cf583e82282568 Johnson Wang     2023-03-15   683  			};
cf583e82282568 Johnson Wang     2023-03-15   684  		};
cf583e82282568 Johnson Wang     2023-03-15   685  
cf583e82282568 Johnson Wang     2023-03-15   686  		gpu2 {
cf583e82282568 Johnson Wang     2023-03-15   687  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   688  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   689  			thermal-sensors = <&lvtsap 2>;
cf583e82282568 Johnson Wang     2023-03-15   690  
cf583e82282568 Johnson Wang     2023-03-15   691  			trips {
cf583e82282568 Johnson Wang     2023-03-15   692  				gpu2_crit: gpu2-crit {
cf583e82282568 Johnson Wang     2023-03-15   693  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   694  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   695  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   696  				};
cf583e82282568 Johnson Wang     2023-03-15   697  			};
cf583e82282568 Johnson Wang     2023-03-15   698  		};
cf583e82282568 Johnson Wang     2023-03-15   699  
cf583e82282568 Johnson Wang     2023-03-15   700  		soc1 {
cf583e82282568 Johnson Wang     2023-03-15   701  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   702  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   703  			thermal-sensors = <&lvtsap 3>;
cf583e82282568 Johnson Wang     2023-03-15   704  
cf583e82282568 Johnson Wang     2023-03-15   705  			trips {
cf583e82282568 Johnson Wang     2023-03-15   706  				soc1_crit: soc1-crit {
cf583e82282568 Johnson Wang     2023-03-15   707  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   708  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   709  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   710  				};
cf583e82282568 Johnson Wang     2023-03-15   711  			};
cf583e82282568 Johnson Wang     2023-03-15   712  		};
cf583e82282568 Johnson Wang     2023-03-15   713  
cf583e82282568 Johnson Wang     2023-03-15   714  		soc2 {
cf583e82282568 Johnson Wang     2023-03-15   715  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   716  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   717  			thermal-sensors = <&lvtsap 4>;
cf583e82282568 Johnson Wang     2023-03-15   718  
cf583e82282568 Johnson Wang     2023-03-15   719  			trips {
cf583e82282568 Johnson Wang     2023-03-15   720  				soc2_crit: soc2-crit {
cf583e82282568 Johnson Wang     2023-03-15   721  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   722  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   723  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   724  				};
cf583e82282568 Johnson Wang     2023-03-15   725  			};
cf583e82282568 Johnson Wang     2023-03-15   726  		};
cf583e82282568 Johnson Wang     2023-03-15   727  
cf583e82282568 Johnson Wang     2023-03-15   728  		soc3 {
cf583e82282568 Johnson Wang     2023-03-15   729  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   730  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   731  			thermal-sensors = <&lvtsap 5>;
cf583e82282568 Johnson Wang     2023-03-15   732  
cf583e82282568 Johnson Wang     2023-03-15   733  			trips {
cf583e82282568 Johnson Wang     2023-03-15   734  				soc3_crit: soc3-crit {
cf583e82282568 Johnson Wang     2023-03-15   735  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   736  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   737  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   738  				};
cf583e82282568 Johnson Wang     2023-03-15   739  			};
cf583e82282568 Johnson Wang     2023-03-15   740  		};
cf583e82282568 Johnson Wang     2023-03-15   741  
cf583e82282568 Johnson Wang     2023-03-15   742  		cam1 {
cf583e82282568 Johnson Wang     2023-03-15   743  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   744  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   745  			thermal-sensors = <&lvtsap 6>;
cf583e82282568 Johnson Wang     2023-03-15   746  
cf583e82282568 Johnson Wang     2023-03-15   747  			trips {
cf583e82282568 Johnson Wang     2023-03-15   748  				cam1_crit: cam1-crit {
cf583e82282568 Johnson Wang     2023-03-15   749  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   750  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   751  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   752  				};
cf583e82282568 Johnson Wang     2023-03-15   753  			};
cf583e82282568 Johnson Wang     2023-03-15   754  		};
cf583e82282568 Johnson Wang     2023-03-15   755  
cf583e82282568 Johnson Wang     2023-03-15   756  		cam2 {
cf583e82282568 Johnson Wang     2023-03-15   757  			polling-delay = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   758  			polling-delay-passive = <0>; /* milliseconds */
cf583e82282568 Johnson Wang     2023-03-15   759  			thermal-sensors = <&lvtsap 7>;
cf583e82282568 Johnson Wang     2023-03-15   760  
cf583e82282568 Johnson Wang     2023-03-15   761  			trips {
cf583e82282568 Johnson Wang     2023-03-15   762  				cam2_crit: cam2-crit {
cf583e82282568 Johnson Wang     2023-03-15   763  					temperature = <119000>;
cf583e82282568 Johnson Wang     2023-03-15   764  					hysteresis = <2000>;
cf583e82282568 Johnson Wang     2023-03-15   765  					type = "critical";
cf583e82282568 Johnson Wang     2023-03-15   766  				};
cf583e82282568 Johnson Wang     2023-03-15   767  			};
cf583e82282568 Johnson Wang     2023-03-15   768  		};
028639398cd6a9 Johnson Wang     2023-03-16   769  
028639398cd6a9 Johnson Wang     2023-03-16   770  		soc_max {
028639398cd6a9 Johnson Wang     2023-03-16   771  			polling-delay = <1000>; /* milliseconds */
028639398cd6a9 Johnson Wang     2023-03-16   772  			polling-delay-passive = <100>; /* milliseconds */
028639398cd6a9 Johnson Wang     2023-03-16   773  			thermal-sensors = <&vtemp 0>;
028639398cd6a9 Johnson Wang     2023-03-16   774  			sustainable-power = <1500>;
028639398cd6a9 Johnson Wang     2023-03-16   775  
028639398cd6a9 Johnson Wang     2023-03-16   776  			trips {
028639398cd6a9 Johnson Wang     2023-03-16   777  				threshold: trip-point@0 {
028639398cd6a9 Johnson Wang     2023-03-16   778  					temperature = <68000>;
028639398cd6a9 Johnson Wang     2023-03-16   779  					hysteresis = <2000>;
028639398cd6a9 Johnson Wang     2023-03-16   780  					type = "passive";
028639398cd6a9 Johnson Wang     2023-03-16   781  				};
028639398cd6a9 Johnson Wang     2023-03-16   782  
028639398cd6a9 Johnson Wang     2023-03-16   783  				target: target@1 {
028639398cd6a9 Johnson Wang     2023-03-16   784  					temperature = <85000>;
028639398cd6a9 Johnson Wang     2023-03-16   785  					hysteresis = <2000>;
028639398cd6a9 Johnson Wang     2023-03-16   786  					type = "passive";
028639398cd6a9 Johnson Wang     2023-03-16   787  				};
028639398cd6a9 Johnson Wang     2023-03-16   788  
cbb0f8b948cfda Fei Shao         2024-06-14   789  				soc_max_crit: soc-max-crit@0 {
028639398cd6a9 Johnson Wang     2023-03-16   790  					temperature = <115000>;
028639398cd6a9 Johnson Wang     2023-03-16   791  					hysteresis = <2000>;
028639398cd6a9 Johnson Wang     2023-03-16   792  					type = "critical";
028639398cd6a9 Johnson Wang     2023-03-16   793  				};
028639398cd6a9 Johnson Wang     2023-03-16   794  			};
028639398cd6a9 Johnson Wang     2023-03-16   795  
028639398cd6a9 Johnson Wang     2023-03-16   796  			cooling_map: cooling-maps {
028639398cd6a9 Johnson Wang     2023-03-16   797  				map0 {
028639398cd6a9 Johnson Wang     2023-03-16   798  					trip = <&target>;
028639398cd6a9 Johnson Wang     2023-03-16   799  					cooling-device = <&cpu0
028639398cd6a9 Johnson Wang     2023-03-16   800  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   801  						THERMAL_NO_LIMIT>,
028639398cd6a9 Johnson Wang     2023-03-16   802  							<&cpu1
028639398cd6a9 Johnson Wang     2023-03-16   803  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   804  						THERMAL_NO_LIMIT>,
028639398cd6a9 Johnson Wang     2023-03-16   805  							<&cpu2
028639398cd6a9 Johnson Wang     2023-03-16   806  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   807  						THERMAL_NO_LIMIT>,
028639398cd6a9 Johnson Wang     2023-03-16   808  							<&cpu3
028639398cd6a9 Johnson Wang     2023-03-16   809  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   810  						THERMAL_NO_LIMIT>,
028639398cd6a9 Johnson Wang     2023-03-16   811  							<&cpu4
028639398cd6a9 Johnson Wang     2023-03-16   812  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   813  						THERMAL_NO_LIMIT>,
028639398cd6a9 Johnson Wang     2023-03-16   814  							<&cpu5
028639398cd6a9 Johnson Wang     2023-03-16   815  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   816  						THERMAL_NO_LIMIT>;
028639398cd6a9 Johnson Wang     2023-03-16   817  					contribution = <2345>;
028639398cd6a9 Johnson Wang     2023-03-16   818  				};
028639398cd6a9 Johnson Wang     2023-03-16   819  
028639398cd6a9 Johnson Wang     2023-03-16   820  				map1 {
028639398cd6a9 Johnson Wang     2023-03-16   821  					trip = <&target>;
028639398cd6a9 Johnson Wang     2023-03-16   822  					cooling-device = <&cpu6
028639398cd6a9 Johnson Wang     2023-03-16   823  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   824  						THERMAL_NO_LIMIT>,
028639398cd6a9 Johnson Wang     2023-03-16   825  							<&cpu7
028639398cd6a9 Johnson Wang     2023-03-16   826  						THERMAL_NO_LIMIT
028639398cd6a9 Johnson Wang     2023-03-16   827  						THERMAL_NO_LIMIT>;
028639398cd6a9 Johnson Wang     2023-03-16   828  					contribution = <1024>;
028639398cd6a9 Johnson Wang     2023-03-16   829  				};
028639398cd6a9 Johnson Wang     2023-03-16   830  			};
028639398cd6a9 Johnson Wang     2023-03-16   831  		};
cf583e82282568 Johnson Wang     2023-03-15   832  	};
cf583e82282568 Johnson Wang     2023-03-15   833  
800ef7029f37c5 jason-ch chen    2023-10-23   834  	timer: timer {
800ef7029f37c5 jason-ch chen    2023-10-23   835  		compatible = "arm,armv8-timer";
800ef7029f37c5 jason-ch chen    2023-10-23   836  		interrupt-parent = <&gic>;
800ef7029f37c5 jason-ch chen    2023-10-23   837  		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
800ef7029f37c5 jason-ch chen    2023-10-23   838  			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
800ef7029f37c5 jason-ch chen    2023-10-23   839  			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
800ef7029f37c5 jason-ch chen    2023-10-23   840  			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   841  		clock-frequency = <13000000>;
800ef7029f37c5 jason-ch chen    2023-10-23   842  	};
800ef7029f37c5 jason-ch chen    2023-10-23   843  
800ef7029f37c5 jason-ch chen    2023-10-23   844  	soc {
800ef7029f37c5 jason-ch chen    2023-10-23   845  		#address-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   846  		#size-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   847  		compatible = "simple-bus";
62f31509bdccce Chengci Xu       2023-05-19   848  		dma-ranges = <0x0 0x0 0x0 0x0 0x4 0x0>;
800ef7029f37c5 jason-ch chen    2023-10-23   849  		ranges;
800ef7029f37c5 jason-ch chen    2023-10-23   850  
277f9534dc71a9 Johnson Wang     2023-03-10   851  		performance: performance-controller@11bc10 {
277f9534dc71a9 Johnson Wang     2023-03-10   852  			compatible = "mediatek,cpufreq-hw";
277f9534dc71a9 Johnson Wang     2023-03-10   853  			reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
277f9534dc71a9 Johnson Wang     2023-03-10   854  			#performance-domain-cells = <1>;
277f9534dc71a9 Johnson Wang     2023-03-10   855  		};
277f9534dc71a9 Johnson Wang     2023-03-10   856  
800ef7029f37c5 jason-ch chen    2023-10-23   857  		gic: interrupt-controller@c000000 {
800ef7029f37c5 jason-ch chen    2023-10-23   858  			compatible = "arm,gic-v3";
800ef7029f37c5 jason-ch chen    2023-10-23   859  			#interrupt-cells = <4>;
6af14ba53ac522 Johnson Wang     2022-07-25   860  			#address-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25   861  			#size-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   862  			#redistributor-regions = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23   863  			interrupt-parent = <&gic>;
800ef7029f37c5 jason-ch chen    2023-10-23   864  			interrupt-controller;
800ef7029f37c5 jason-ch chen    2023-10-23   865  			reg = <0 0x0c000000 0 0x40000>,
800ef7029f37c5 jason-ch chen    2023-10-23   866  			      <0 0x0c040000 0 0x200000>;
800ef7029f37c5 jason-ch chen    2023-10-23   867  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   868  
800ef7029f37c5 jason-ch chen    2023-10-23   869  			ppi-partitions {
800ef7029f37c5 jason-ch chen    2023-10-23   870  				ppi_cluster0: interrupt-partition-0 {
800ef7029f37c5 jason-ch chen    2023-10-23   871  					affinity = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5>;
800ef7029f37c5 jason-ch chen    2023-10-23   872  				};
800ef7029f37c5 jason-ch chen    2023-10-23   873  
800ef7029f37c5 jason-ch chen    2023-10-23   874  				ppi_cluster1: interrupt-partition-1 {
800ef7029f37c5 jason-ch chen    2023-10-23   875  					affinity = <&cpu6 &cpu7>;
800ef7029f37c5 jason-ch chen    2023-10-23   876  				};
800ef7029f37c5 jason-ch chen    2023-10-23   877  			};
800ef7029f37c5 jason-ch chen    2023-10-23   878  		};
800ef7029f37c5 jason-ch chen    2023-10-23   879  
800ef7029f37c5 jason-ch chen    2023-10-23   880  		topckgen: syscon@10000000 {
800ef7029f37c5 jason-ch chen    2023-10-23   881  			compatible = "mediatek,mt8188-topckgen", "syscon";
800ef7029f37c5 jason-ch chen    2023-10-23   882  			reg = <0 0x10000000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23   883  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23   884  		};
800ef7029f37c5 jason-ch chen    2023-10-23   885  
800ef7029f37c5 jason-ch chen    2023-10-23   886  		infracfg_ao: syscon@10001000 {
800ef7029f37c5 jason-ch chen    2023-10-23   887  			compatible = "mediatek,mt8188-infracfg-ao", "syscon";
800ef7029f37c5 jason-ch chen    2023-10-23   888  			reg = <0 0x10001000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23   889  			#clock-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   890  			#reset-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23   891  		};
800ef7029f37c5 jason-ch chen    2023-10-23   892  
800ef7029f37c5 jason-ch chen    2023-10-23   893  		pericfg: syscon@10003000 {
800ef7029f37c5 jason-ch chen    2023-10-23   894  			compatible = "mediatek,mt8188-pericfg", "syscon";
800ef7029f37c5 jason-ch chen    2023-10-23   895  			reg = <0 0x10003000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23   896  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23   897  		};
800ef7029f37c5 jason-ch chen    2023-10-23   898  
800ef7029f37c5 jason-ch chen    2023-10-23   899  		pio: pinctrl@10005000 {
800ef7029f37c5 jason-ch chen    2023-10-23   900  			compatible = "mediatek,mt8188-pinctrl";
800ef7029f37c5 jason-ch chen    2023-10-23   901  			reg = <0 0x10005000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23   902  			      <0 0x11c00000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23   903  			      <0 0x11e10000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23   904  			      <0 0x11e20000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23   905  			      <0 0x11ea0000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23   906  			      <0 0x1000b000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23   907  			reg-names = "iocfg0", "iocfg_rm", "iocfg_lt",
800ef7029f37c5 jason-ch chen    2023-10-23   908  				    "iocfg_lm", "iocfg_rt", "eint";
800ef7029f37c5 jason-ch chen    2023-10-23   909  			gpio-controller;
800ef7029f37c5 jason-ch chen    2023-10-23   910  			#gpio-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   911  			gpio-ranges = <&pio 0 0 176>;
800ef7029f37c5 jason-ch chen    2023-10-23   912  			interrupt-controller;
800ef7029f37c5 jason-ch chen    2023-10-23   913  			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23   914  			#interrupt-cells = <2>;
800ef7029f37c5 jason-ch chen    2023-10-23   915  		};
800ef7029f37c5 jason-ch chen    2023-10-23   916  
6af14ba53ac522 Johnson Wang     2022-07-25   917  		scpsys: syscon@10006000 {
6af14ba53ac522 Johnson Wang     2022-07-25   918  			compatible = "syscon", "simple-mfd";
6af14ba53ac522 Johnson Wang     2022-07-25   919  			reg = <0 0x10006000 0 0x1000>;
6af14ba53ac522 Johnson Wang     2022-07-25   920  			#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   921  
6af14ba53ac522 Johnson Wang     2022-07-25   922  			/* System Power Manager */
6af14ba53ac522 Johnson Wang     2022-07-25   923  			spm: power-controller {
6af14ba53ac522 Johnson Wang     2022-07-25   924  				compatible = "mediatek,mt8188-power-controller";
6af14ba53ac522 Johnson Wang     2022-07-25   925  				#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   926  				#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   927  				#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   928  
6af14ba53ac522 Johnson Wang     2022-07-25   929  				/* power domain of the SoC */
0d093046fe4ae1 Fei Shao         2024-07-22   930  				mfg0: power-domain@MT8188_POWER_DOMAIN_MFG0 {
6af14ba53ac522 Johnson Wang     2022-07-25   931  					reg = <MT8188_POWER_DOMAIN_MFG0>;
6af14ba53ac522 Johnson Wang     2022-07-25   932  					#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   933  					#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   934  					#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   935  
0d093046fe4ae1 Fei Shao         2024-07-22   936  					power-domain@MT8188_POWER_DOMAIN_MFG1 {
6af14ba53ac522 Johnson Wang     2022-07-25   937  						reg = <MT8188_POWER_DOMAIN_MFG1>;
6af14ba53ac522 Johnson Wang     2022-07-25   938  						clocks = <&topckgen CLK_TOP_MFG_CK_FAST_REF>,
6af14ba53ac522 Johnson Wang     2022-07-25   939  							 <&topckgen CLK_TOP_MFG_CORE_TMP>;
6af14ba53ac522 Johnson Wang     2022-07-25   940  						clock-names= "mfg10", "mfg11";
6af14ba53ac522 Johnson Wang     2022-07-25   941  						mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25   942  						#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   943  						#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   944  						#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25   945  
0d093046fe4ae1 Fei Shao         2024-07-22   946  						power-domain@MT8188_POWER_DOMAIN_MFG2 {
6af14ba53ac522 Johnson Wang     2022-07-25   947  							reg = <MT8188_POWER_DOMAIN_MFG2>;
6af14ba53ac522 Johnson Wang     2022-07-25   948  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   949  						};
6af14ba53ac522 Johnson Wang     2022-07-25   950  
0d093046fe4ae1 Fei Shao         2024-07-22   951  						power-domain@MT8188_POWER_DOMAIN_MFG3 {
6af14ba53ac522 Johnson Wang     2022-07-25   952  							reg = <MT8188_POWER_DOMAIN_MFG3>;
6af14ba53ac522 Johnson Wang     2022-07-25   953  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   954  						};
6af14ba53ac522 Johnson Wang     2022-07-25   955  
0d093046fe4ae1 Fei Shao         2024-07-22   956  						power-domain@MT8188_POWER_DOMAIN_MFG4 {
6af14ba53ac522 Johnson Wang     2022-07-25   957  							reg = <MT8188_POWER_DOMAIN_MFG4>;
6af14ba53ac522 Johnson Wang     2022-07-25   958  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25   959  						};
6af14ba53ac522 Johnson Wang     2022-07-25   960  					};
6af14ba53ac522 Johnson Wang     2022-07-25   961  				};
6af14ba53ac522 Johnson Wang     2022-07-25   962  
0d093046fe4ae1 Fei Shao         2024-07-22   963  				power-domain@MT8188_POWER_DOMAIN_VPPSYS0 {
6af14ba53ac522 Johnson Wang     2022-07-25   964  					reg = <MT8188_POWER_DOMAIN_VPPSYS0>;
6af14ba53ac522 Johnson Wang     2022-07-25   965  					clocks = <&topckgen CLK_TOP_VPP>,
6af14ba53ac522 Johnson Wang     2022-07-25   966  						 <&topckgen CLK_TOP_CAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   967  						 <&topckgen CLK_TOP_CCU>,
6af14ba53ac522 Johnson Wang     2022-07-25   968  						 <&topckgen CLK_TOP_IMG>,
6af14ba53ac522 Johnson Wang     2022-07-25   969  						 <&topckgen CLK_TOP_VENC>,
6af14ba53ac522 Johnson Wang     2022-07-25   970  						 <&topckgen CLK_TOP_VDEC>,
6af14ba53ac522 Johnson Wang     2022-07-25   971  						 <&topckgen CLK_TOP_WPE_VPP>,
6af14ba53ac522 Johnson Wang     2022-07-25   972  						 <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VPP0>,
6af14ba53ac522 Johnson Wang     2022-07-25   973  						 <&topckgen CLK_TOP_CFGREG_F26M_VPP0>,
6af14ba53ac522 Johnson Wang     2022-07-25   974  						 <&vppsys0 CLK_VPP0_SMI_COMMON_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   975  						 <&vppsys0 CLK_VPP0_GALS_VDO0_LARB0_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   976  						 <&vppsys0 CLK_VPP0_GALS_VDO0_LARB1_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   977  						 <&vppsys0 CLK_VPP0_GALS_VENCSYS_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   978  						 <&vppsys0 CLK_VPP0_GALS_VENCSYS_CORE1_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   979  						 <&vppsys0 CLK_VPP0_GALS_INFRA_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   980  						 <&vppsys0 CLK_VPP0_GALS_CAMSYS_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   981  						 <&vppsys0 CLK_VPP0_GALS_VPP1_LARB5_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   982  						 <&vppsys0 CLK_VPP0_GALS_VPP1_LARB6_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   983  						 <&vppsys0 CLK_VPP0_SMI_REORDER_MMSRAM>,
6af14ba53ac522 Johnson Wang     2022-07-25   984  						 <&vppsys0 CLK_VPP0_SMI_IOMMU>,
6af14ba53ac522 Johnson Wang     2022-07-25   985  						 <&vppsys0 CLK_VPP0_GALS_IMGSYS_CAMSYS>,
6af14ba53ac522 Johnson Wang     2022-07-25   986  						 <&vppsys0 CLK_VPP0_GALS_EMI0_EMI1>,
6af14ba53ac522 Johnson Wang     2022-07-25   987  						 <&vppsys0 CLK_VPP0_SMI_SUB_COMMON_REORDER>,
6af14ba53ac522 Johnson Wang     2022-07-25   988  						 <&vppsys0 CLK_VPP0_SMI_RSI>,
6af14ba53ac522 Johnson Wang     2022-07-25   989  						 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
6af14ba53ac522 Johnson Wang     2022-07-25   990  						 <&vppsys0 CLK_VPP0_GALS_VDEC_VDEC_CORE1>,
6af14ba53ac522 Johnson Wang     2022-07-25   991  						 <&vppsys0 CLK_VPP0_GALS_VPP1_WPESYS>,
6af14ba53ac522 Johnson Wang     2022-07-25   992  						 <&vppsys0 CLK_VPP0_GALS_VDO0_VDO1_VENCSYS_CORE1>;
6af14ba53ac522 Johnson Wang     2022-07-25   993  					clock-names = "vppsys00", "vppsys01", "vppsys02", "vppsys03",
6af14ba53ac522 Johnson Wang     2022-07-25   994  						      "vppsys04", "vppsys05", "vppsys06", "vppsys07",
6af14ba53ac522 Johnson Wang     2022-07-25   995  						      "vppsys08", "vppsys0-0", "vppsys0-1", "vppsys0-2",
6af14ba53ac522 Johnson Wang     2022-07-25   996  						      "vppsys0-3", "vppsys0-4", "vppsys0-5", "vppsys0-6",
6af14ba53ac522 Johnson Wang     2022-07-25   997  						      "vppsys0-7", "vppsys0-8", "vppsys0-9", "vppsys0-10",
6af14ba53ac522 Johnson Wang     2022-07-25   998  						      "vppsys0-11", "vppsys0-12", "vppsys0-13", "vppsys0-14",
6af14ba53ac522 Johnson Wang     2022-07-25   999  						      "vppsys0-15", "vppsys0-16", "vppsys0-17", "vppsys0-18";
6af14ba53ac522 Johnson Wang     2022-07-25  1000  					mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1001  					#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1002  					#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1003  					#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1004  
0d093046fe4ae1 Fei Shao         2024-07-22  1005  					power-domain@MT8188_POWER_DOMAIN_VDOSYS0 {
6af14ba53ac522 Johnson Wang     2022-07-25  1006  						reg = <MT8188_POWER_DOMAIN_VDOSYS0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1007  						clocks = <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VDO0>,
6af14ba53ac522 Johnson Wang     2022-07-25  1008  							 <&topckgen CLK_TOP_CFGREG_F26M_VDO0>,
6af14ba53ac522 Johnson Wang     2022-07-25  1009  							 <&vdosys0 CLK_VDO0_SMI_GALS>,
6af14ba53ac522 Johnson Wang     2022-07-25  1010  							 <&vdosys0 CLK_VDO0_SMI_COMMON>,
6af14ba53ac522 Johnson Wang     2022-07-25  1011  							 <&vdosys0 CLK_VDO0_SMI_EMI>,
6af14ba53ac522 Johnson Wang     2022-07-25  1012  							 <&vdosys0 CLK_VDO0_SMI_IOMMU>,
6af14ba53ac522 Johnson Wang     2022-07-25  1013  							 <&vdosys0 CLK_VDO0_SMI_LARB>,
6af14ba53ac522 Johnson Wang     2022-07-25  1014  							 <&vdosys0 CLK_VDO0_SMI_RSI>,
6af14ba53ac522 Johnson Wang     2022-07-25  1015  							 <&vdosys0 CLK_VDO0_APB_BUS>;
6af14ba53ac522 Johnson Wang     2022-07-25  1016  						clock-names = "vdosys00", "vdosys01", "vdosys0-0",
6af14ba53ac522 Johnson Wang     2022-07-25  1017  							      "vdosys0-1", "vdosys0-2", "vdosys0-3",
6af14ba53ac522 Johnson Wang     2022-07-25  1018  							      "vdosys0-4", "vdosys0-5", "vdosys0-6";
6af14ba53ac522 Johnson Wang     2022-07-25  1019  						mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1020  						#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1021  						#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1022  						#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1023  
0d093046fe4ae1 Fei Shao         2024-07-22  1024  						power-domain@MT8188_POWER_DOMAIN_VPPSYS1 {
6af14ba53ac522 Johnson Wang     2022-07-25  1025  							reg = <MT8188_POWER_DOMAIN_VPPSYS1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1026  							clocks = <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VPP1>,
6af14ba53ac522 Johnson Wang     2022-07-25  1027  								 <&topckgen CLK_TOP_CFGREG_F26M_VPP1>,
6af14ba53ac522 Johnson Wang     2022-07-25  1028  								 <&vppsys1 CLK_VPP1_GALS5>,
6af14ba53ac522 Johnson Wang     2022-07-25  1029  								 <&vppsys1 CLK_VPP1_GALS6>,
6af14ba53ac522 Johnson Wang     2022-07-25  1030  								 <&vppsys1 CLK_VPP1_LARB5>,
6af14ba53ac522 Johnson Wang     2022-07-25  1031  								 <&vppsys1 CLK_VPP1_LARB6>;
6af14ba53ac522 Johnson Wang     2022-07-25  1032  							clock-names = "vppsys10", "vppsys11", "vppsys1-0",
6af14ba53ac522 Johnson Wang     2022-07-25  1033  								      "vppsys1-1", "vppsys1-2", "vppsys1-3";
6af14ba53ac522 Johnson Wang     2022-07-25  1034  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1035  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1036  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1037  
0d093046fe4ae1 Fei Shao         2024-07-22  1038  						power-domain@MT8188_POWER_DOMAIN_VDEC0 {
ea8f723f4179f0 Jason Chen       2023-09-05  1039  							reg = <MT8188_POWER_DOMAIN_VDEC0>;
ea8f723f4179f0 Jason Chen       2023-09-05  1040  							clocks = <&vdecsys_soc CLK_VDEC1_SOC_LARB1>;
ea8f723f4179f0 Jason Chen       2023-09-05  1041  							clock-names = "vdec0-0";
ea8f723f4179f0 Jason Chen       2023-09-05  1042  							mediatek,infracfg = <&infracfg_ao>;
ea8f723f4179f0 Jason Chen       2023-09-05  1043  							#address-cells = <1>;
ea8f723f4179f0 Jason Chen       2023-09-05  1044  							#size-cells = <0>;
ea8f723f4179f0 Jason Chen       2023-09-05  1045  							#power-domain-cells = <1>;
ea8f723f4179f0 Jason Chen       2023-09-05  1046  
0d093046fe4ae1 Fei Shao         2024-07-22  1047  							power-domain@MT8188_POWER_DOMAIN_VDEC1 {
6af14ba53ac522 Johnson Wang     2022-07-25  1048  								reg = <MT8188_POWER_DOMAIN_VDEC1>;
b3a334ebd6e058 Johnson Wang     2023-03-27  1049  								clocks = <&vdecsys CLK_VDEC2_LARB1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1050  								clock-names = "vdec1-0";
6af14ba53ac522 Johnson Wang     2022-07-25  1051  								mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1052  								#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1053  							};
6af14ba53ac522 Johnson Wang     2022-07-25  1054  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1055  
0d093046fe4ae1 Fei Shao         2024-07-22  1056  						cam_vcore: power-domain@MT8188_POWER_DOMAIN_CAM_VCORE {
6af14ba53ac522 Johnson Wang     2022-07-25  1057  							reg = <MT8188_POWER_DOMAIN_CAM_VCORE>;
6af14ba53ac522 Johnson Wang     2022-07-25  1058  							clocks = <&topckgen CLK_TOP_CAM>,
6af14ba53ac522 Johnson Wang     2022-07-25  1059  								 <&topckgen CLK_TOP_CCU>,
6af14ba53ac522 Johnson Wang     2022-07-25  1060  								 <&topckgen CLK_TOP_CCU_AHB>,
6af14ba53ac522 Johnson Wang     2022-07-25  1061  								 <&topckgen CLK_TOP_CFGREG_CLOCK_ISP_AXI_GALS>;
6af14ba53ac522 Johnson Wang     2022-07-25  1062  							clock-names = "cam_vcore0", "cam_vcore1",
6af14ba53ac522 Johnson Wang     2022-07-25  1063  								      "cam_vcore2", "cam_vcore3";
6af14ba53ac522 Johnson Wang     2022-07-25  1064  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1065  							#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1066  							#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1067  							#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1068  
0d093046fe4ae1 Fei Shao         2024-07-22  1069  							power-domain@MT8188_POWER_DOMAIN_CAM_MAIN {
6af14ba53ac522 Johnson Wang     2022-07-25  1070  								reg = <MT8188_POWER_DOMAIN_CAM_MAIN>;
6af14ba53ac522 Johnson Wang     2022-07-25  1071  								clocks = <&camsys CLK_CAM_MAIN_LARB13>,
6af14ba53ac522 Johnson Wang     2022-07-25  1072  									 <&camsys CLK_CAM_MAIN_LARB14>,
6af14ba53ac522 Johnson Wang     2022-07-25  1073  									 <&camsys CLK_CAM_MAIN_CAM2MM0_GALS>,
6af14ba53ac522 Johnson Wang     2022-07-25  1074  									 <&camsys CLK_CAM_MAIN_CAM2MM1_GALS>,
6af14ba53ac522 Johnson Wang     2022-07-25  1075  									 <&camsys CLK_CAM_MAIN_CAM2SYS_GALS>;
6af14ba53ac522 Johnson Wang     2022-07-25  1076  								clock-names= "cam_main-0", "cam_main-1",
6af14ba53ac522 Johnson Wang     2022-07-25  1077  									     "cam_main-2", "cam_main-3",
6af14ba53ac522 Johnson Wang     2022-07-25  1078  									     "cam_main-4";
6af14ba53ac522 Johnson Wang     2022-07-25  1079  								mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1080  								#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1081  								#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1082  								#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1083  
0d093046fe4ae1 Fei Shao         2024-07-22  1084  								power-domain@MT8188_POWER_DOMAIN_CAM_SUBB {
6af14ba53ac522 Johnson Wang     2022-07-25  1085  									reg =<MT8188_POWER_DOMAIN_CAM_SUBB>;
6af14ba53ac522 Johnson Wang     2022-07-25  1086  									clocks = <&camsys CLK_CAM_MAIN_CAM_SUBB>,
6af14ba53ac522 Johnson Wang     2022-07-25  1087  										 <&camsys_rawb CLK_CAM_RAWB_LARBX>,
6af14ba53ac522 Johnson Wang     2022-07-25  1088  										 <&camsys_yuvb CLK_CAM_YUVB_LARBX>;
6af14ba53ac522 Johnson Wang     2022-07-25  1089  									clock-names = "cam_subb-0", "cam_subb-1", "cam_subb-2";
6af14ba53ac522 Johnson Wang     2022-07-25  1090  									mediatek,smi = <&smi_cam0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1091  									mediatek,larb = <&camsys_rawb &camsys_yuvb>;
6af14ba53ac522 Johnson Wang     2022-07-25  1092  									#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1093  								};
6af14ba53ac522 Johnson Wang     2022-07-25  1094  
0d093046fe4ae1 Fei Shao         2024-07-22  1095  								power-domain@MT8188_POWER_DOMAIN_CAM_SUBA {
6af14ba53ac522 Johnson Wang     2022-07-25  1096  									reg =<MT8188_POWER_DOMAIN_CAM_SUBA>;
6af14ba53ac522 Johnson Wang     2022-07-25  1097  									clocks = <&camsys CLK_CAM_MAIN_CAM_SUBA>,
6af14ba53ac522 Johnson Wang     2022-07-25  1098  										 <&camsys_rawa CLK_CAM_RAWA_LARBX>,
6af14ba53ac522 Johnson Wang     2022-07-25  1099  										 <&camsys_yuva CLK_CAM_YUVA_LARBX>;
6af14ba53ac522 Johnson Wang     2022-07-25  1100  									clock-names = "cam_suba-0", "cam_suba-1", "cam_suba-2";
6af14ba53ac522 Johnson Wang     2022-07-25  1101  									mediatek,smi = <&smi_cam1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1102  									mediatek,larb = <&camsys_rawa &camsys_yuva>;
6af14ba53ac522 Johnson Wang     2022-07-25  1103  									#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1104  								};
6af14ba53ac522 Johnson Wang     2022-07-25  1105  							};
6af14ba53ac522 Johnson Wang     2022-07-25  1106  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1107  
0d093046fe4ae1 Fei Shao         2024-07-22  1108  						power-domain@MT8188_POWER_DOMAIN_VDOSYS1 {
6af14ba53ac522 Johnson Wang     2022-07-25  1109  							reg = <MT8188_POWER_DOMAIN_VDOSYS1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1110  							clocks = <&topckgen CLK_TOP_CFGREG_CLOCK_EN_VDO1>,
6af14ba53ac522 Johnson Wang     2022-07-25  1111  								 <&topckgen CLK_TOP_CFGREG_F26M_VDO1>,
6af14ba53ac522 Johnson Wang     2022-07-25  1112  								 <&vdosys1 CLK_VDO1_SMI_LARB2>,
6af14ba53ac522 Johnson Wang     2022-07-25  1113  								 <&vdosys1 CLK_VDO1_SMI_LARB3>,
6af14ba53ac522 Johnson Wang     2022-07-25  1114  								 <&vdosys1 CLK_VDO1_GALS>;
6af14ba53ac522 Johnson Wang     2022-07-25  1115  							clock-names = "vdosys10", "vdosys11", "vdosys1-0",
6af14ba53ac522 Johnson Wang     2022-07-25  1116  								      "vdosys1-1", "vdosys1-2";
6af14ba53ac522 Johnson Wang     2022-07-25  1117  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1118  							#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1119  							#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1120  							#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1121  
0d093046fe4ae1 Fei Shao         2024-07-22  1122  							power-domain@MT8188_POWER_DOMAIN_HDMI_TX {
6af14ba53ac522 Johnson Wang     2022-07-25  1123  								reg = <MT8188_POWER_DOMAIN_HDMI_TX>;
6af14ba53ac522 Johnson Wang     2022-07-25  1124  								clocks = <&topckgen CLK_TOP_HDMI_APB>,
6af14ba53ac522 Johnson Wang     2022-07-25  1125  									 <&topckgen CLK_TOP_HDCP_24M>;
6af14ba53ac522 Johnson Wang     2022-07-25  1126  								clock-names = "hdmi_tx0", "hdmi_tx1";
6af14ba53ac522 Johnson Wang     2022-07-25  1127  								mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1128  								#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1129  							};
6af14ba53ac522 Johnson Wang     2022-07-25  1130  
0d093046fe4ae1 Fei Shao         2024-07-22  1131  							power-domain@MT8188_POWER_DOMAIN_DP_TX {
6af14ba53ac522 Johnson Wang     2022-07-25  1132  								reg = <MT8188_POWER_DOMAIN_DP_TX>;
6af14ba53ac522 Johnson Wang     2022-07-25  1133  								mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1134  								#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1135  							};
6af14ba53ac522 Johnson Wang     2022-07-25  1136  
0d093046fe4ae1 Fei Shao         2024-07-22  1137  							power-domain@MT8188_POWER_DOMAIN_EDP_TX {
6af14ba53ac522 Johnson Wang     2022-07-25  1138  								reg = <MT8188_POWER_DOMAIN_EDP_TX>;
6af14ba53ac522 Johnson Wang     2022-07-25  1139  								mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1140  								#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1141  							};
6af14ba53ac522 Johnson Wang     2022-07-25  1142  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1143  
0d093046fe4ae1 Fei Shao         2024-07-22  1144  						power-domain@MT8188_POWER_DOMAIN_VENC {
6af14ba53ac522 Johnson Wang     2022-07-25  1145  							reg = <MT8188_POWER_DOMAIN_VENC>;
b3a334ebd6e058 Johnson Wang     2023-03-27  1146  							clocks = <&vencsys CLK_VENC1_LARB>,
b3a334ebd6e058 Johnson Wang     2023-03-27  1147  								 <&vencsys CLK_VENC1_VENC>,
b3a334ebd6e058 Johnson Wang     2023-03-27  1148  								 <&vencsys CLK_VENC1_GALS>,
b3a334ebd6e058 Johnson Wang     2023-03-27  1149  								 <&vencsys CLK_VENC1_GALS_SRAM>;
6af14ba53ac522 Johnson Wang     2022-07-25  1150  							clock-names = "venc-0", "venc-1", "venc-2", "venc-3";
6af14ba53ac522 Johnson Wang     2022-07-25  1151  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1152  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1153  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1154  
0d093046fe4ae1 Fei Shao         2024-07-22  1155  						power-domain@MT8188_POWER_DOMAIN_WPE {
6af14ba53ac522 Johnson Wang     2022-07-25  1156  							reg = <MT8188_POWER_DOMAIN_WPE>;
6af14ba53ac522 Johnson Wang     2022-07-25  1157  							clocks = <&wpesys CLK_WPE_TOP_SMI_LARB7>,
6af14ba53ac522 Johnson Wang     2022-07-25  1158  								 <&wpesys CLK_WPE_TOP_SMI_LARB7_PCLK_EN>;
6af14ba53ac522 Johnson Wang     2022-07-25  1159  							clock-names = "wpe-0", "wpe-1";
6af14ba53ac522 Johnson Wang     2022-07-25  1160  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1161  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1162  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1163  
0d093046fe4ae1 Fei Shao         2024-07-22  1164  						img_vcore: power-domain@MT8188_POWER_DOMAIN_IMG_VCORE {
6af14ba53ac522 Johnson Wang     2022-07-25  1165  							reg = <MT8188_POWER_DOMAIN_IMG_VCORE>;
6af14ba53ac522 Johnson Wang     2022-07-25  1166  							clocks = <&topckgen CLK_TOP_IMG>,
6af14ba53ac522 Johnson Wang     2022-07-25  1167  								 <&topckgen CLK_TOP_CFGREG_CLOCK_ISP_AXI_GALS>;
6af14ba53ac522 Johnson Wang     2022-07-25  1168  							clock-names = "img_vcore0", "img_vcore1";
6af14ba53ac522 Johnson Wang     2022-07-25  1169  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1170  							#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1171  							#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1172  							#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1173  
0d093046fe4ae1 Fei Shao         2024-07-22  1174  							power-domain@MT8188_POWER_DOMAIN_IMG_MAIN {
6af14ba53ac522 Johnson Wang     2022-07-25  1175  								reg = <MT8188_POWER_DOMAIN_IMG_MAIN>;
6af14ba53ac522 Johnson Wang     2022-07-25  1176  								clocks = <&imgsys CLK_IMGSYS_MAIN_LARB9>,
6af14ba53ac522 Johnson Wang     2022-07-25  1177  									 <&imgsys CLK_IMGSYS_MAIN_VCORE_GALS>,
6af14ba53ac522 Johnson Wang     2022-07-25  1178  									 <&imgsys CLK_IMGSYS_MAIN_DIP0>,
6af14ba53ac522 Johnson Wang     2022-07-25  1179  									 <&imgsys CLK_IMGSYS_MAIN_GALS>;
6af14ba53ac522 Johnson Wang     2022-07-25  1180  								clock-names = "img_main-0", "img_main-1",
6af14ba53ac522 Johnson Wang     2022-07-25  1181  									      "img_main-2", "img_main-3";
6af14ba53ac522 Johnson Wang     2022-07-25  1182  								mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1183  								#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1184  								#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1185  								#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1186  
0d093046fe4ae1 Fei Shao         2024-07-22  1187  								power-domain@MT8188_POWER_DOMAIN_DIP {
6af14ba53ac522 Johnson Wang     2022-07-25  1188  									reg = <MT8188_POWER_DOMAIN_DIP>;
6af14ba53ac522 Johnson Wang     2022-07-25  1189  									clocks = <&imgsys CLK_IMGSYS_MAIN_WPE0>,
6af14ba53ac522 Johnson Wang     2022-07-25  1190  										 <&imgsys CLK_IMGSYS_MAIN_IPE>,
6af14ba53ac522 Johnson Wang     2022-07-25  1191  										 <&imgsys CLK_IMGSYS_MAIN_WPE1>,
6af14ba53ac522 Johnson Wang     2022-07-25  1192  										 <&imgsys CLK_IMGSYS_MAIN_WPE2>,
6af14ba53ac522 Johnson Wang     2022-07-25  1193  										 <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_LARB10>,
6af14ba53ac522 Johnson Wang     2022-07-25  1194  										 <&imgsys_wpe1 CLK_IMGSYS_WPE1_LARB11>,
6af14ba53ac522 Johnson Wang     2022-07-25  1195  										 <&imgsys_wpe2 CLK_IMGSYS_WPE2_LARB11>,
6af14ba53ac522 Johnson Wang     2022-07-25  1196  										 <&imgsys_wpe3 CLK_IMGSYS_WPE3_LARB11>,
6af14ba53ac522 Johnson Wang     2022-07-25  1197  										 <&imgsys1_dip_nr CLK_IMGSYS1_DIP_NR_LARB15>;
6af14ba53ac522 Johnson Wang     2022-07-25  1198  									clock-names = "dip-0", "dip-1", "dip-2",
6af14ba53ac522 Johnson Wang     2022-07-25  1199  										      "dip-3", "dip-4", "dip-5",
6af14ba53ac522 Johnson Wang     2022-07-25  1200  										      "dip-6", "dip-7", "dip-8";
6af14ba53ac522 Johnson Wang     2022-07-25  1201  									mediatek,smi = <&smi_img0 &smi_img1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1202  									mediatek,larb = <&imgsys1_dip_top &imgsys_wpe1
6af14ba53ac522 Johnson Wang     2022-07-25  1203  											 &imgsys_wpe3 &imgsys_wpe2
6af14ba53ac522 Johnson Wang     2022-07-25  1204  											 &imgsys1_dip_nr>;
6af14ba53ac522 Johnson Wang     2022-07-25  1205  									#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1206  								};
6af14ba53ac522 Johnson Wang     2022-07-25  1207  
0d093046fe4ae1 Fei Shao         2024-07-22  1208  								power-domain@MT8188_POWER_DOMAIN_IPE {
6af14ba53ac522 Johnson Wang     2022-07-25  1209  									reg = <MT8188_POWER_DOMAIN_IPE>;
6af14ba53ac522 Johnson Wang     2022-07-25  1210  									clocks = <&topckgen CLK_TOP_IPE>,
6af14ba53ac522 Johnson Wang     2022-07-25  1211  										 <&imgsys CLK_IMGSYS_MAIN_IPE>,
6af14ba53ac522 Johnson Wang     2022-07-25  1212  										 <&ipesys CLK_IPE_SMI_LARB12>;
6af14ba53ac522 Johnson Wang     2022-07-25  1213  									clock-names= "ipe0", "ipe-0", "ipe-1";
6af14ba53ac522 Johnson Wang     2022-07-25  1214  									mediatek,smi = <&smi_img1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1215  									mediatek,larb = <&ipesys>;
6af14ba53ac522 Johnson Wang     2022-07-25  1216  									#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1217  								};
6af14ba53ac522 Johnson Wang     2022-07-25  1218  							};
6af14ba53ac522 Johnson Wang     2022-07-25  1219  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1220  					};
6af14ba53ac522 Johnson Wang     2022-07-25  1221  				};
6af14ba53ac522 Johnson Wang     2022-07-25  1222  
0d093046fe4ae1 Fei Shao         2024-07-22  1223  				power-domain@MT8188_POWER_DOMAIN_PEXTP_MAC_P0 {
6af14ba53ac522 Johnson Wang     2022-07-25  1224  					reg = <MT8188_POWER_DOMAIN_PEXTP_MAC_P0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1225  					mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1226  					clocks = <&pericfg_ao CLK_PERI_AO_PCIE_P0_FMEM>;
6af14ba53ac522 Johnson Wang     2022-07-25  1227  					clock-names = "pextp_mac_p0-0";
6af14ba53ac522 Johnson Wang     2022-07-25  1228  					#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1229  				};
6af14ba53ac522 Johnson Wang     2022-07-25  1230  
0d093046fe4ae1 Fei Shao         2024-07-22  1231  				power-domain@MT8188_POWER_DOMAIN_CSIRX_TOP {
6af14ba53ac522 Johnson Wang     2022-07-25  1232  					reg = <MT8188_POWER_DOMAIN_CSIRX_TOP>;
6af14ba53ac522 Johnson Wang     2022-07-25  1233  					clocks = <&topckgen CLK_TOP_SENINF>,
6af14ba53ac522 Johnson Wang     2022-07-25  1234  						 <&topckgen CLK_TOP_SENINF1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1235  					clock-names = "csirx_top0", "csirx_top1";
6af14ba53ac522 Johnson Wang     2022-07-25  1236  					#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1237  				};
6af14ba53ac522 Johnson Wang     2022-07-25  1238  
0d093046fe4ae1 Fei Shao         2024-07-22  1239  				power-domain@MT8188_POWER_DOMAIN_PEXTP_PHY_TOP {
6af14ba53ac522 Johnson Wang     2022-07-25  1240  					reg = <MT8188_POWER_DOMAIN_PEXTP_PHY_TOP>;
6af14ba53ac522 Johnson Wang     2022-07-25  1241  					#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1242  				};
6af14ba53ac522 Johnson Wang     2022-07-25  1243  
0d093046fe4ae1 Fei Shao         2024-07-22  1244  				power-domain@MT8188_POWER_DOMAIN_ADSP_AO {
6af14ba53ac522 Johnson Wang     2022-07-25  1245  					reg = <MT8188_POWER_DOMAIN_ADSP_AO>;
6af14ba53ac522 Johnson Wang     2022-07-25  1246  					mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1247  					#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1248  					#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1249  					#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1250  
0d093046fe4ae1 Fei Shao         2024-07-22  1251  					power-domain@MT8188_POWER_DOMAIN_ADSP_INFRA {
6af14ba53ac522 Johnson Wang     2022-07-25  1252  						reg = <MT8188_POWER_DOMAIN_ADSP_INFRA>;
a1311f18494340 Trevor Wu        2023-04-07  1253  						clocks = <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
a1311f18494340 Trevor Wu        2023-04-07  1254  							 <&topckgen CLK_TOP_ADSP>;
a1311f18494340 Trevor Wu        2023-04-07  1255  						clock-names = "adsp_infra0", "adsp_infra1";
6af14ba53ac522 Johnson Wang     2022-07-25  1256  						mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1257  						#address-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1258  						#size-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1259  						#power-domain-cells = <1>;
6af14ba53ac522 Johnson Wang     2022-07-25  1260  
0d093046fe4ae1 Fei Shao         2024-07-22  1261  						power-domain@MT8188_POWER_DOMAIN_AUDIO_ASRC {
6af14ba53ac522 Johnson Wang     2022-07-25  1262  							reg = <MT8188_POWER_DOMAIN_AUDIO_ASRC>;
6af14ba53ac522 Johnson Wang     2022-07-25  1263  							clocks = <&topckgen CLK_TOP_ASM_H>;
6af14ba53ac522 Johnson Wang     2022-07-25  1264  							clock-names = "audio_asrc0";
6af14ba53ac522 Johnson Wang     2022-07-25  1265  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1266  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1267  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1268  
0d093046fe4ae1 Fei Shao         2024-07-22  1269  						power-domain@MT8188_POWER_DOMAIN_AUDIO {
6af14ba53ac522 Johnson Wang     2022-07-25  1270  							reg = <MT8188_POWER_DOMAIN_AUDIO>;
6af14ba53ac522 Johnson Wang     2022-07-25  1271  							clocks = <&topckgen CLK_TOP_A1SYS_HP>,
6af14ba53ac522 Johnson Wang     2022-07-25  1272  								 <&topckgen CLK_TOP_AUD_INTBUS>,
6af14ba53ac522 Johnson Wang     2022-07-25  1273  								 <&adsp_audio26m CLK_AUDIODSP_AUDIO26M>;
6af14ba53ac522 Johnson Wang     2022-07-25  1274  							clock-names = "audio0", "audio1", "audio2";
6af14ba53ac522 Johnson Wang     2022-07-25  1275  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1276  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1277  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1278  
0d093046fe4ae1 Fei Shao         2024-07-22  1279  						power-domain@MT8188_POWER_DOMAIN_ADSP {
6af14ba53ac522 Johnson Wang     2022-07-25  1280  							reg = <MT8188_POWER_DOMAIN_ADSP>;
a1311f18494340 Trevor Wu        2023-04-07  1281  							clocks = <&apmixedsys CLK_APMIXED_ADSPPLL>;
a1311f18494340 Trevor Wu        2023-04-07  1282  							clock-names = "clk_apmixed_adsppll";
6af14ba53ac522 Johnson Wang     2022-07-25  1283  							mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1284  							#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1285  						};
6af14ba53ac522 Johnson Wang     2022-07-25  1286  					};
6af14ba53ac522 Johnson Wang     2022-07-25  1287  				};
6af14ba53ac522 Johnson Wang     2022-07-25  1288  
0d093046fe4ae1 Fei Shao         2024-07-22  1289  				power-domain@MT8188_POWER_DOMAIN_ETHER {
6af14ba53ac522 Johnson Wang     2022-07-25  1290  					reg = <MT8188_POWER_DOMAIN_ETHER>;
6af14ba53ac522 Johnson Wang     2022-07-25  1291  					clocks = <&pericfg_ao CLK_PERI_AO_ETHERNET_MAC>;
6af14ba53ac522 Johnson Wang     2022-07-25  1292  					clock-names = "ether0";
6af14ba53ac522 Johnson Wang     2022-07-25  1293  					mediatek,infracfg = <&infracfg_ao>;
6af14ba53ac522 Johnson Wang     2022-07-25  1294  					#power-domain-cells = <0>;
6af14ba53ac522 Johnson Wang     2022-07-25  1295  				};
6af14ba53ac522 Johnson Wang     2022-07-25  1296  			};
6af14ba53ac522 Johnson Wang     2022-07-25  1297  		};
6af14ba53ac522 Johnson Wang     2022-07-25  1298  
800ef7029f37c5 jason-ch chen    2023-10-23  1299  		watchdog: watchdog@10007000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1300  			compatible = "mediatek,mt8188-wdt";
800ef7029f37c5 jason-ch chen    2023-10-23  1301  			reg = <0 0x10007000 0 0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1302  			mediatek,disable-extrst;
800ef7029f37c5 jason-ch chen    2023-10-23  1303  			#reset-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1304  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1305  
800ef7029f37c5 jason-ch chen    2023-10-23  1306  		apmixedsys: syscon@1000c000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1307  			compatible = "mediatek,mt8188-apmixedsys", "syscon";
800ef7029f37c5 jason-ch chen    2023-10-23  1308  			reg = <0 0x1000c000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1309  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1310  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1311  
800ef7029f37c5 jason-ch chen    2023-10-23  1312  		systimer: timer@10017000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1313  			compatible = "mediatek,mt8188-timer", "mediatek,mt6765-timer";
800ef7029f37c5 jason-ch chen    2023-10-23  1314  			reg = <0 0x10017000 0 0x1000>;
6af14ba53ac522 Johnson Wang     2022-07-25  1315  			reg-names = "sys_timer_base";
800ef7029f37c5 jason-ch chen    2023-10-23  1316  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1317  			clocks = <&clk13m>;
800ef7029f37c5 jason-ch chen    2023-10-23  1318  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1319  
0d093046fe4ae1 Fei Shao         2024-07-22  1320  		pwrap: syscon@10024000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1321  			compatible = "mediatek,mt8188-pwrap", "mediatek,mt8195-pwrap", "syscon";
800ef7029f37c5 jason-ch chen    2023-10-23  1322  			reg = <0 0x10024000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1323  			reg-names = "pwrap";
800ef7029f37c5 jason-ch chen    2023-10-23  1324  			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1325  			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
800ef7029f37c5 jason-ch chen    2023-10-23  1326  				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>;
800ef7029f37c5 jason-ch chen    2023-10-23  1327  			clock-names = "spi", "wrap";
800ef7029f37c5 jason-ch chen    2023-10-23  1328  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1329  
5a47375e523aa6 Johnson Wang     2023-02-14  1330  		spmi: spmi@10027000 {
5a47375e523aa6 Johnson Wang     2023-02-14  1331  			compatible = "mediatek,mt8188-spmi",
5a47375e523aa6 Johnson Wang     2023-02-14  1332  				     "mediatek,mt8195-spmi";
5a47375e523aa6 Johnson Wang     2023-02-14  1333  			reg = <0 0x10027000 0 0x000e00>,
5a47375e523aa6 Johnson Wang     2023-02-14  1334  			      <0 0x10029000 0 0x000100>;
5a47375e523aa6 Johnson Wang     2023-02-14  1335  			reg-names = "pmif", "spmimst";
5a47375e523aa6 Johnson Wang     2023-02-14  1336  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH 0>,
5a47375e523aa6 Johnson Wang     2023-02-14  1337  				     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH 0>;
5a47375e523aa6 Johnson Wang     2023-02-14  1338  			irq_event_en = <0x18000000 0x0001c000 0x0 0x0 0x0>;
5a47375e523aa6 Johnson Wang     2023-02-14  1339  			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
5a47375e523aa6 Johnson Wang     2023-02-14  1340  				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>,
5a47375e523aa6 Johnson Wang     2023-02-14  1341  				 <&topckgen CLK_TOP_SPMI_M_MST>;
5a47375e523aa6 Johnson Wang     2023-02-14  1342  			clock-names = "pmif_sys_ck",
5a47375e523aa6 Johnson Wang     2023-02-14  1343  				      "pmif_tmr_ck",
5a47375e523aa6 Johnson Wang     2023-02-14  1344  				      "spmimst_clk_mux";
5a47375e523aa6 Johnson Wang     2023-02-14  1345  			assigned-clocks = <&topckgen CLK_TOP_SPMI_M_MST>;
d65e64b7975b94 Sen Chu          2023-12-18  1346  			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
5a47375e523aa6 Johnson Wang     2023-02-14  1347  		};
5a47375e523aa6 Johnson Wang     2023-02-14  1348  
80d45ddb7686b1 Johnson Wang     2023-01-10  1349  		infra_iommu: iommu@10315000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  1350  			compatible = "mediatek,mt8188-iommu-infra";
80d45ddb7686b1 Johnson Wang     2023-01-10  1351  			reg = <0 0x10315000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  1352  			interrupts = <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH 0>;
80d45ddb7686b1 Johnson Wang     2023-01-10  1353  			#iommu-cells = <1>;
80d45ddb7686b1 Johnson Wang     2023-01-10  1354  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  1355  
9de20b7422ddeb Johnson Wang     2023-01-10  1356  		gce0: mailbox@10320000 {
4e45b362c08d16 Elvis Wang       2023-05-17  1357  			compatible = "mediatek,mt8188-gce";
9de20b7422ddeb Johnson Wang     2023-01-10  1358  			reg = <0 0x10320000 0 0x4000>;
9de20b7422ddeb Johnson Wang     2023-01-10  1359  			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
9de20b7422ddeb Johnson Wang     2023-01-10  1360  			#mbox-cells = <2>;
9de20b7422ddeb Johnson Wang     2023-01-10  1361  			clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
f111d8cc72fc83 Elvis Wang       2023-08-04  1362  			mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;
f111d8cc72fc83 Elvis Wang       2023-08-04  1363  			mediatek,gce-events = <CMDQ_SYNC_TOKEN_SECURE_THR_EOF>;
9de20b7422ddeb Johnson Wang     2023-01-10  1364  		};
9de20b7422ddeb Johnson Wang     2023-01-10  1365  
9de20b7422ddeb Johnson Wang     2023-01-10  1366  		gce1: mailbox@10330000 {
4e45b362c08d16 Elvis Wang       2023-05-17  1367  			compatible = "mediatek,mt8188-gce";
9de20b7422ddeb Johnson Wang     2023-01-10  1368  			reg = <0 0x10330000 0 0x4000>;
9de20b7422ddeb Johnson Wang     2023-01-10  1369  			interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH 0>;
9de20b7422ddeb Johnson Wang     2023-01-10  1370  			#mbox-cells = <2>;
9de20b7422ddeb Johnson Wang     2023-01-10  1371  			clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
9de20b7422ddeb Johnson Wang     2023-01-10  1372  		};
9de20b7422ddeb Johnson Wang     2023-01-10  1373  
cb75f24663df84 Jason Chen       2024-03-15  1374  		scp_cluster: scp@10500000 {
cb75f24663df84 Jason Chen       2024-03-15  1375  			compatible = "mediatek,mt8188-scp-dual";
cb75f24663df84 Jason Chen       2024-03-15  1376  			reg = <0 0x10720000 0 0xe0000>;
cb75f24663df84 Jason Chen       2024-03-15  1377  			reg-names = "cfg";
cb75f24663df84 Jason Chen       2024-03-15  1378  			#address-cells = <1>;
cb75f24663df84 Jason Chen       2024-03-15  1379  			#size-cells = <1>;
cb75f24663df84 Jason Chen       2024-03-15  1380  			ranges = <0 0 0x10500000 0x100000>;
cb75f24663df84 Jason Chen       2024-03-15  1381  			status = "disabled";
cb75f24663df84 Jason Chen       2024-03-15  1382  
cb75f24663df84 Jason Chen       2024-03-15  1383  			scp_c0: scp@0 {
cb75f24663df84 Jason Chen       2024-03-15  1384  				compatible = "mediatek,scp-core";
cb75f24663df84 Jason Chen       2024-03-15  1385  				reg = <0x0 0xd0000>;
cb75f24663df84 Jason Chen       2024-03-15  1386  				reg-names = "sram";
800ef7029f37c5 jason-ch chen    2023-10-23  1387  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
cb75f24663df84 Jason Chen       2024-03-15  1388  				status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1389  			};
800ef7029f37c5 jason-ch chen    2023-10-23  1390  
cb75f24663df84 Jason Chen       2024-03-15  1391  			scp_c1: scp@d0000 {
cb75f24663df84 Jason Chen       2024-03-15  1392  				compatible = "mediatek,scp-core";
cb75f24663df84 Jason Chen       2024-03-15  1393  				reg = <0xd0000 0x2f000>;
cb75f24663df84 Jason Chen       2024-03-15  1394  				reg-names = "sram";
77165a14b8b2c6 Tinghan Shen     2022-08-17  1395  				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
77165a14b8b2c6 Tinghan Shen     2022-08-17  1396  				status = "disabled";
77165a14b8b2c6 Tinghan Shen     2022-08-17  1397  			};
cb75f24663df84 Jason Chen       2024-03-15  1398  		};
77165a14b8b2c6 Tinghan Shen     2022-08-17  1399  
0d093046fe4ae1 Fei Shao         2024-07-22  1400  		afe: audio-controller@10b10000 {
1420601ea128b8 Trevor Wu        2023-03-20  1401  			compatible = "mediatek,mt8188-afe";
1420601ea128b8 Trevor Wu        2023-03-20  1402  			mediatek,topckgen = <&topckgen>;
1420601ea128b8 Trevor Wu        2023-03-20  1403  			mediatek,infracfg = <&infracfg_ao>;
1420601ea128b8 Trevor Wu        2023-03-20  1404  			power-domains = <&spm MT8188_POWER_DOMAIN_AUDIO>;
1420601ea128b8 Trevor Wu        2023-03-20  1405  			interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH 0>;
1420601ea128b8 Trevor Wu        2023-03-20  1406  			resets = <&watchdog 14>;
1420601ea128b8 Trevor Wu        2023-03-20  1407  			reset-names = "audiosys";
1420601ea128b8 Trevor Wu        2023-03-20  1408  			reg = <0 0x10b10000 0 0x10000>;
1420601ea128b8 Trevor Wu        2023-03-20  1409  			clocks = <&clk26m>,
1420601ea128b8 Trevor Wu        2023-03-20  1410  				 <&apmixedsys CLK_APMIXED_APLL1>,
1420601ea128b8 Trevor Wu        2023-03-20  1411  				 <&apmixedsys CLK_APMIXED_APLL2>,
1420601ea128b8 Trevor Wu        2023-03-20  1412  				 <&topckgen CLK_TOP_APLL12_CK_DIV0>,
1420601ea128b8 Trevor Wu        2023-03-20  1413  				 <&topckgen CLK_TOP_APLL12_CK_DIV1>,
1420601ea128b8 Trevor Wu        2023-03-20  1414  				 <&topckgen CLK_TOP_APLL12_CK_DIV2>,
1420601ea128b8 Trevor Wu        2023-03-20  1415  				 <&topckgen CLK_TOP_APLL12_CK_DIV3>,
1420601ea128b8 Trevor Wu        2023-03-20  1416  				 <&topckgen CLK_TOP_APLL12_CK_DIV9>,
1420601ea128b8 Trevor Wu        2023-03-20  1417  				 <&topckgen CLK_TOP_A1SYS_HP>,
1420601ea128b8 Trevor Wu        2023-03-20  1418  				 <&topckgen CLK_TOP_AUD_INTBUS>,
1420601ea128b8 Trevor Wu        2023-03-20  1419  				 <&topckgen CLK_TOP_AUDIO_H>,
1420601ea128b8 Trevor Wu        2023-03-20  1420  				 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>,
1420601ea128b8 Trevor Wu        2023-03-20  1421  				 <&topckgen CLK_TOP_DPTX>,
1420601ea128b8 Trevor Wu        2023-03-20  1422  				 <&topckgen CLK_TOP_I2SO1>,
1420601ea128b8 Trevor Wu        2023-03-20  1423  				 <&topckgen CLK_TOP_I2SO2>,
1420601ea128b8 Trevor Wu        2023-03-20  1424  				 <&topckgen CLK_TOP_I2SI1>,
1420601ea128b8 Trevor Wu        2023-03-20  1425  				 <&topckgen CLK_TOP_I2SI2>,
1420601ea128b8 Trevor Wu        2023-03-20  1426  				 <&adsp_audio26m CLK_AUDIODSP_AUDIO26M>,
1420601ea128b8 Trevor Wu        2023-03-20  1427  				 <&topckgen CLK_TOP_APLL1_D4>,
1420601ea128b8 Trevor Wu        2023-03-20  1428  				 <&topckgen CLK_TOP_APLL2_D4>,
1420601ea128b8 Trevor Wu        2023-03-20  1429  				 <&topckgen CLK_TOP_APLL12_CK_DIV4>,
1420601ea128b8 Trevor Wu        2023-03-20  1430  				 <&topckgen CLK_TOP_A2SYS>,
1420601ea128b8 Trevor Wu        2023-03-20  1431  				 <&topckgen CLK_TOP_AUD_IEC>;
1420601ea128b8 Trevor Wu        2023-03-20  1432  			clock-names = "clk26m",
1420601ea128b8 Trevor Wu        2023-03-20  1433  				      "apll1",
1420601ea128b8 Trevor Wu        2023-03-20  1434  				      "apll2",
1420601ea128b8 Trevor Wu        2023-03-20  1435  				      "apll12_div0",
1420601ea128b8 Trevor Wu        2023-03-20  1436  				      "apll12_div1",
1420601ea128b8 Trevor Wu        2023-03-20  1437  				      "apll12_div2",
1420601ea128b8 Trevor Wu        2023-03-20  1438  				      "apll12_div3",
1420601ea128b8 Trevor Wu        2023-03-20  1439  				      "apll12_div9",
1420601ea128b8 Trevor Wu        2023-03-20  1440  				      "top_a1sys_hp",
1420601ea128b8 Trevor Wu        2023-03-20  1441  				      "top_aud_intbus",
1420601ea128b8 Trevor Wu        2023-03-20  1442  				      "top_audio_h",
1420601ea128b8 Trevor Wu        2023-03-20  1443  				      "top_audio_local_bus",
1420601ea128b8 Trevor Wu        2023-03-20  1444  				      "top_dptx",
1420601ea128b8 Trevor Wu        2023-03-20  1445  				      "top_i2so1",
1420601ea128b8 Trevor Wu        2023-03-20  1446  				      "top_i2so2",
1420601ea128b8 Trevor Wu        2023-03-20  1447  				      "top_i2si1",
1420601ea128b8 Trevor Wu        2023-03-20  1448  				      "top_i2si2",
1420601ea128b8 Trevor Wu        2023-03-20  1449  				      "adsp_audio_26m",
1420601ea128b8 Trevor Wu        2023-03-20  1450  				      "apll1_d4",
1420601ea128b8 Trevor Wu        2023-03-20  1451  				      "apll2_d4",
1420601ea128b8 Trevor Wu        2023-03-20  1452  				      "apll12_div4",
1420601ea128b8 Trevor Wu        2023-03-20  1453  				      "top_a2sys",
1420601ea128b8 Trevor Wu        2023-03-20  1454  				      "top_aud_iec";
1420601ea128b8 Trevor Wu        2023-03-20  1455  			assigned-clocks = <&topckgen CLK_TOP_A1SYS_HP>;
1420601ea128b8 Trevor Wu        2023-03-20  1456  			assigned-clock-parents =  <&clk26m>;
1420601ea128b8 Trevor Wu        2023-03-20  1457  			status = "disabled";
1420601ea128b8 Trevor Wu        2023-03-20  1458  		};
1420601ea128b8 Trevor Wu        2023-03-20  1459  
a1311f18494340 Trevor Wu        2023-04-07  1460  		adsp: adsp@10b80000 {
a1311f18494340 Trevor Wu        2023-04-07  1461  			compatible = "mediatek,mt8188-dsp";
a1311f18494340 Trevor Wu        2023-04-07  1462  			reg = <0 0x10b80000 0 0x2000>,
a1311f18494340 Trevor Wu        2023-04-07  1463  			      <0 0x10d00000 0 0x80000>,
a1311f18494340 Trevor Wu        2023-04-07  1464  			      <0 0x10b8b000 0 0x100>,
a1311f18494340 Trevor Wu        2023-04-07  1465  			      <0 0x10b8f000 0 0x1000>;
a1311f18494340 Trevor Wu        2023-04-07  1466  			reg-names = "cfg", "sram", "sec", "bus";
a1311f18494340 Trevor Wu        2023-04-07  1467  			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH 0>;
a1311f18494340 Trevor Wu        2023-04-07  1468  			interrupt-names = "wdt";
a1311f18494340 Trevor Wu        2023-04-07  1469  			clocks = <&topckgen CLK_TOP_ADSP>,
a1311f18494340 Trevor Wu        2023-04-07  1470  				 <&topckgen CLK_TOP_AUDIO_LOCAL_BUS>;
a1311f18494340 Trevor Wu        2023-04-07  1471  			clock-names = "audiodsp",
a1311f18494340 Trevor Wu        2023-04-07  1472  				      "adsp_bus";
a1311f18494340 Trevor Wu        2023-04-07  1473  			assigned-clocks = <&topckgen CLK_TOP_ADSP>;
a1311f18494340 Trevor Wu        2023-04-07  1474  			power-domains = <&spm MT8188_POWER_DOMAIN_ADSP>;
a1311f18494340 Trevor Wu        2023-04-07  1475  			mbox-names = "rx", "tx";
a1311f18494340 Trevor Wu        2023-04-07  1476  			mboxes = <&adsp_mailbox0>, <&adsp_mailbox1>;
a1311f18494340 Trevor Wu        2023-04-07  1477  			status = "disabled";
a1311f18494340 Trevor Wu        2023-04-07  1478  		};
a1311f18494340 Trevor Wu        2023-04-07  1479  
a1311f18494340 Trevor Wu        2023-04-07  1480  		adsp_mailbox0: mailbox@10b86000 {
a1311f18494340 Trevor Wu        2023-04-07  1481  			compatible = "mediatek,mt8186-adsp-mbox";
a1311f18494340 Trevor Wu        2023-04-07  1482  			#mbox-cells = <0>;
a1311f18494340 Trevor Wu        2023-04-07  1483  			reg = <0 0x10b86100 0 0x1000>;
a1311f18494340 Trevor Wu        2023-04-07  1484  			interrupts = <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH 0>;
a1311f18494340 Trevor Wu        2023-04-07  1485  		};
a1311f18494340 Trevor Wu        2023-04-07  1486  
a1311f18494340 Trevor Wu        2023-04-07  1487  		adsp_mailbox1: mailbox@10b87000 {
a1311f18494340 Trevor Wu        2023-04-07  1488  			compatible = "mediatek,mt8186-adsp-mbox";
a1311f18494340 Trevor Wu        2023-04-07  1489  			#mbox-cells = <0>;
a1311f18494340 Trevor Wu        2023-04-07  1490  			reg = <0 0x10b87100 0 0x1000>;
a1311f18494340 Trevor Wu        2023-04-07  1491  			interrupts = <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH 0>;
a1311f18494340 Trevor Wu        2023-04-07  1492  		};
a1311f18494340 Trevor Wu        2023-04-07  1493  
800ef7029f37c5 jason-ch chen    2023-10-23  1494  		adsp_audio26m: clock-controller@10b91100 {
800ef7029f37c5 jason-ch chen    2023-10-23  1495  			compatible = "mediatek,mt8188-adsp-audio26m";
800ef7029f37c5 jason-ch chen    2023-10-23  1496  			reg = <0 0x10b91100 0 0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1497  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1498  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1499  
800ef7029f37c5 jason-ch chen    2023-10-23  1500  		uart0: serial@11001100 {
800ef7029f37c5 jason-ch chen    2023-10-23  1501  			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
800ef7029f37c5 jason-ch chen    2023-10-23  1502  			reg = <0 0x11001100 0 0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1503  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1504  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1505  			clock-names = "baud", "bus";
800ef7029f37c5 jason-ch chen    2023-10-23  1506  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1507  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1508  
800ef7029f37c5 jason-ch chen    2023-10-23  1509  		uart1: serial@11001200 {
800ef7029f37c5 jason-ch chen    2023-10-23  1510  			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
800ef7029f37c5 jason-ch chen    2023-10-23  1511  			reg = <0 0x11001200 0 0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1512  			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1513  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1514  			clock-names = "baud", "bus";
800ef7029f37c5 jason-ch chen    2023-10-23  1515  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1516  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1517  
800ef7029f37c5 jason-ch chen    2023-10-23  1518  		uart2: serial@11001300 {
800ef7029f37c5 jason-ch chen    2023-10-23  1519  			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
800ef7029f37c5 jason-ch chen    2023-10-23  1520  			reg = <0 0x11001300 0 0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1521  			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1522  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1523  			clock-names = "baud", "bus";
800ef7029f37c5 jason-ch chen    2023-10-23  1524  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1525  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1526  
800ef7029f37c5 jason-ch chen    2023-10-23  1527  		uart3: serial@11001400 {
800ef7029f37c5 jason-ch chen    2023-10-23  1528  			compatible = "mediatek,mt8188-uart", "mediatek,mt6577-uart";
800ef7029f37c5 jason-ch chen    2023-10-23  1529  			reg = <0 0x11001400 0 0x100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1530  			interrupts = <GIC_SPI 723 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1531  			clocks = <&clk26m>, <&infracfg_ao CLK_INFRA_AO_UART3>;
800ef7029f37c5 jason-ch chen    2023-10-23  1532  			clock-names = "baud", "bus";
800ef7029f37c5 jason-ch chen    2023-10-23  1533  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1534  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1535  
800ef7029f37c5 jason-ch chen    2023-10-23  1536  		auxadc: adc@11002000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1537  			compatible = "mediatek,mt8188-auxadc", "mediatek,mt8173-auxadc";
800ef7029f37c5 jason-ch chen    2023-10-23  1538  			reg = <0 0x11002000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1539  			clocks = <&infracfg_ao CLK_INFRA_AO_AUXADC>;
800ef7029f37c5 jason-ch chen    2023-10-23  1540  			clock-names = "main";
800ef7029f37c5 jason-ch chen    2023-10-23  1541  			#io-channel-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1542  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1543  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1544  
800ef7029f37c5 jason-ch chen    2023-10-23  1545  		pericfg_ao: syscon@11003000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1546  			compatible = "mediatek,mt8188-pericfg-ao", "syscon";
800ef7029f37c5 jason-ch chen    2023-10-23  1547  			reg = <0 0x11003000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1548  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1549  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1550  
800ef7029f37c5 jason-ch chen    2023-10-23  1551  		spi0: spi@1100a000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1552  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
800ef7029f37c5 jason-ch chen    2023-10-23  1553  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1554  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1555  			reg = <0 0x1100a000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1556  			interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1557  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1558  				 <&topckgen CLK_TOP_SPI>,
800ef7029f37c5 jason-ch chen    2023-10-23  1559  				 <&infracfg_ao CLK_INFRA_AO_SPI0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1560  			clock-names = "parent-clk", "sel-clk", "spi-clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1561  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1562  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1563  
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1564  		svs: svs@1100b000 {
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1565  			compatible = "mediatek,mt8188-svs";
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1566  			reg = <0 0x1100b000 0 0x1000>;
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1567  			interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH 0>;
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1568  			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1569  			clock-names = "main";
0d093046fe4ae1 Fei Shao         2024-07-22  1570  			nvmem-cells = <&efuse_svs_calib>,
0d093046fe4ae1 Fei Shao         2024-07-22  1571  				      <&efuse_lvts_calib>;
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1572  			nvmem-cell-names = "svs-calibration-data",
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1573  					   "t-calibration-data";
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1574  			resets = <&infracfg_ao MT8188_INFRA_RST3_PTP_CTRL_RST>;
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1575  			reset-names = "svs_rst";
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1576  		};
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1577  
fc25cec8273046 Chun-Jen Tseng   2023-10-02  1578  		lvtsap: lvts@1100b000 {
cf583e82282568 Johnson Wang     2023-03-15  1579  			compatible = "mediatek,mt8188-lvts-ap";
cf583e82282568 Johnson Wang     2023-03-15  1580  			#thermal-sensor-cells = <1>;
cf583e82282568 Johnson Wang     2023-03-15  1581  			reg = <0 0x1100b000 0 0x1000>;
cf583e82282568 Johnson Wang     2023-03-15  1582  			interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH 0>;
cf583e82282568 Johnson Wang     2023-03-15  1583  			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
cf583e82282568 Johnson Wang     2023-03-15  1584  			resets = <&infracfg_ao MT8188_INFRA_RST1_THERMAL_CTRL_RST>;
0d093046fe4ae1 Fei Shao         2024-07-22  1585  			nvmem-cells = <&efuse_lvts_calib>;
cf583e82282568 Johnson Wang     2023-03-15  1586  			nvmem-cell-names = "lvts_calib_data1";
cf583e82282568 Johnson Wang     2023-03-15  1587  		};
cf583e82282568 Johnson Wang     2023-03-15  1588  
0d093046fe4ae1 Fei Shao         2024-07-22  1589  		disp_pwm0: pwm@1100e000 {
2dc54d6c98a726 Johnson Wang     2023-02-07  1590  			compatible = "mediatek,mt8188-disp-pwm",
2dc54d6c98a726 Johnson Wang     2023-02-07  1591  				     "mediatek,mt8183-disp-pwm";
2dc54d6c98a726 Johnson Wang     2023-02-07  1592  			reg = <0 0x1100e000 0 0x1000>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1593  			interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH 0>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1594  			#pwm-cells = <2>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1595  			clocks = <&topckgen CLK_TOP_DISP_PWM0>,
2dc54d6c98a726 Johnson Wang     2023-02-07  1596  				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM>,
2dc54d6c98a726 Johnson Wang     2023-02-07  1597  				 <&topckgen CLK_TOP_ULPOSC1_D4>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1598  			clock-names = "main", "mm", "pwm_src";
2dc54d6c98a726 Johnson Wang     2023-02-07  1599  			status = "disabled";
2dc54d6c98a726 Johnson Wang     2023-02-07  1600  		};
2dc54d6c98a726 Johnson Wang     2023-02-07  1601  
0d093046fe4ae1 Fei Shao         2024-07-22  1602  		disp_pwm1: pwm@1100f000 {
2dc54d6c98a726 Johnson Wang     2023-02-07  1603  			compatible = "mediatek,mt8188-disp-pwm",
2dc54d6c98a726 Johnson Wang     2023-02-07  1604  				     "mediatek,mt8183-disp-pwm";
2dc54d6c98a726 Johnson Wang     2023-02-07  1605  			reg = <0 0x1100f000 0 0x1000>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1606  			interrupts = <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH 0>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1607  			#pwm-cells = <2>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1608  			clocks = <&topckgen CLK_TOP_DISP_PWM1>,
2dc54d6c98a726 Johnson Wang     2023-02-07  1609  				 <&infracfg_ao CLK_INFRA_AO_DISP_PWM1>,
2dc54d6c98a726 Johnson Wang     2023-02-07  1610  				 <&topckgen CLK_TOP_ULPOSC1_D4>;
2dc54d6c98a726 Johnson Wang     2023-02-07  1611  			clock-names = "main", "mm", "pwm_src";
2dc54d6c98a726 Johnson Wang     2023-02-07  1612  			status = "disabled";
2dc54d6c98a726 Johnson Wang     2023-02-07  1613  		};
2dc54d6c98a726 Johnson Wang     2023-02-07  1614  
800ef7029f37c5 jason-ch chen    2023-10-23  1615  		spi1: spi@11010000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1616  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
800ef7029f37c5 jason-ch chen    2023-10-23  1617  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1618  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1619  			reg = <0 0x11010000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1620  			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1621  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1622  				 <&topckgen CLK_TOP_SPI>,
800ef7029f37c5 jason-ch chen    2023-10-23  1623  				 <&infracfg_ao CLK_INFRA_AO_SPI1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1624  			clock-names = "parent-clk", "sel-clk", "spi-clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1625  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1626  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1627  
800ef7029f37c5 jason-ch chen    2023-10-23  1628  		spi2: spi@11012000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1629  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
800ef7029f37c5 jason-ch chen    2023-10-23  1630  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1631  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1632  			reg = <0 0x11012000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1633  			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1634  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1635  				 <&topckgen CLK_TOP_SPI>,
800ef7029f37c5 jason-ch chen    2023-10-23  1636  				 <&infracfg_ao CLK_INFRA_AO_SPI2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1637  			clock-names = "parent-clk", "sel-clk", "spi-clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1638  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1639  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1640  
800ef7029f37c5 jason-ch chen    2023-10-23  1641  		spi3: spi@11013000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1642  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
800ef7029f37c5 jason-ch chen    2023-10-23  1643  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1644  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1645  			reg = <0 0x11013000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1646  			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1647  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1648  				 <&topckgen CLK_TOP_SPI>,
800ef7029f37c5 jason-ch chen    2023-10-23  1649  				 <&infracfg_ao CLK_INFRA_AO_SPI3>;
800ef7029f37c5 jason-ch chen    2023-10-23  1650  			clock-names = "parent-clk", "sel-clk", "spi-clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1651  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1652  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1653  
800ef7029f37c5 jason-ch chen    2023-10-23  1654  		spi4: spi@11018000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1655  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
800ef7029f37c5 jason-ch chen    2023-10-23  1656  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1657  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1658  			reg = <0 0x11018000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1659  			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1660  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1661  				 <&topckgen CLK_TOP_SPI>,
800ef7029f37c5 jason-ch chen    2023-10-23  1662  				 <&infracfg_ao CLK_INFRA_AO_SPI4>;
800ef7029f37c5 jason-ch chen    2023-10-23  1663  			clock-names = "parent-clk", "sel-clk", "spi-clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1664  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1665  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1666  
800ef7029f37c5 jason-ch chen    2023-10-23  1667  		spi5: spi@11019000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1668  			compatible = "mediatek,mt8188-spi-ipm", "mediatek,spi-ipm";
800ef7029f37c5 jason-ch chen    2023-10-23  1669  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1670  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1671  			reg = <0 0x11019000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1672  			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1673  			clocks = <&topckgen CLK_TOP_UNIVPLL_D6_D2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1674  				 <&topckgen CLK_TOP_SPI>,
800ef7029f37c5 jason-ch chen    2023-10-23  1675  				 <&infracfg_ao CLK_INFRA_AO_SPI5>;
800ef7029f37c5 jason-ch chen    2023-10-23  1676  			clock-names = "parent-clk", "sel-clk", "spi-clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1677  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1678  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1679  
800ef7029f37c5 jason-ch chen    2023-10-23  1680  		xhci1: usb@11200000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1681  			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
800ef7029f37c5 jason-ch chen    2023-10-23  1682  			reg = <0 0x11200000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1683  			      <0 0x11203e00 0 0x0100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1684  			reg-names = "mac", "ippc";
800ef7029f37c5 jason-ch chen    2023-10-23  1685  			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1686  			phys = <&u2port1 PHY_TYPE_USB2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1687  			       <&u3port1 PHY_TYPE_USB3>;
800ef7029f37c5 jason-ch chen    2023-10-23  1688  			assigned-clocks = <&topckgen CLK_TOP_USB_TOP>,
800ef7029f37c5 jason-ch chen    2023-10-23  1689  					  <&topckgen CLK_TOP_SSUSB_XHCI>;
800ef7029f37c5 jason-ch chen    2023-10-23  1690  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
800ef7029f37c5 jason-ch chen    2023-10-23  1691  						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
800ef7029f37c5 jason-ch chen    2023-10-23  1692  			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_BUS>,
800ef7029f37c5 jason-ch chen    2023-10-23  1693  				 <&topckgen CLK_TOP_SSUSB_TOP_REF>,
800ef7029f37c5 jason-ch chen    2023-10-23  1694  				 <&pericfg_ao CLK_PERI_AO_SSUSB_XHCI>;
800ef7029f37c5 jason-ch chen    2023-10-23  1695  			clock-names = "sys_ck", "ref_ck", "mcu_ck";
800ef7029f37c5 jason-ch chen    2023-10-23  1696  			mediatek,syscon-wakeup = <&pericfg 0x468 2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1697  			wakeup-source;
800ef7029f37c5 jason-ch chen    2023-10-23  1698  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1699  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1700  
800ef7029f37c5 jason-ch chen    2023-10-23  1701  		mmc0: mmc@11230000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1702  			compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
800ef7029f37c5 jason-ch chen    2023-10-23  1703  			reg = <0 0x11230000 0 0x10000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1704  			      <0 0x11f50000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1705  			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1706  			clocks = <&topckgen CLK_TOP_MSDC50_0>,
800ef7029f37c5 jason-ch chen    2023-10-23  1707  				 <&infracfg_ao CLK_INFRA_AO_MSDC0>,
800ef7029f37c5 jason-ch chen    2023-10-23  1708  				 <&infracfg_ao CLK_INFRA_AO_MSDC0_SRC>,
800ef7029f37c5 jason-ch chen    2023-10-23  1709  				 <&infracfg_ao CLK_INFRA_AO_RG_AES_MSDCFDE_CK_0P>;
800ef7029f37c5 jason-ch chen    2023-10-23  1710  			clock-names = "source", "hclk", "source_cg", "crypto_clk";
800ef7029f37c5 jason-ch chen    2023-10-23  1711  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1712  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1713  
800ef7029f37c5 jason-ch chen    2023-10-23  1714  		mmc1: mmc@11240000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1715  			compatible = "mediatek,mt8188-mmc", "mediatek,mt8183-mmc";
800ef7029f37c5 jason-ch chen    2023-10-23  1716  			reg = <0 0x11240000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1717  			      <0 0x11eb0000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1718  			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1719  			clocks = <&topckgen CLK_TOP_MSDC30_1>,
800ef7029f37c5 jason-ch chen    2023-10-23  1720  				 <&infracfg_ao CLK_INFRA_AO_MSDC1>,
800ef7029f37c5 jason-ch chen    2023-10-23  1721  				 <&infracfg_ao CLK_INFRA_AO_MSDC1_SRC>;
800ef7029f37c5 jason-ch chen    2023-10-23  1722  			clock-names = "source", "hclk", "source_cg";
800ef7029f37c5 jason-ch chen    2023-10-23  1723  			assigned-clocks = <&topckgen CLK_TOP_MSDC30_1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1724  			assigned-clock-parents = <&topckgen CLK_TOP_MSDCPLL_D2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1725  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1726  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1727  
cf583e82282568 Johnson Wang     2023-03-15  1728  		lvtsmcu: thermal-sensor@11278000 {
cf583e82282568 Johnson Wang     2023-03-15  1729  			compatible = "mediatek,mt8188-lvts-mcu";
cf583e82282568 Johnson Wang     2023-03-15  1730  			#thermal-sensor-cells = <1>;
cf583e82282568 Johnson Wang     2023-03-15  1731  			reg = <0 0x11278000 0 0x1000>;
cf583e82282568 Johnson Wang     2023-03-15  1732  			interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH 0>;
cf583e82282568 Johnson Wang     2023-03-15  1733  			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
cf583e82282568 Johnson Wang     2023-03-15  1734  			resets = <&infracfg_ao MT8188_INFRA_RST1_THERMAL_MCU_RST>;
0d093046fe4ae1 Fei Shao         2024-07-22  1735  			nvmem-cells = <&efuse_lvts_calib>;
cf583e82282568 Johnson Wang     2023-03-15  1736  			nvmem-cell-names = "lvts_calib_data1";
cf583e82282568 Johnson Wang     2023-03-15  1737  		};
cf583e82282568 Johnson Wang     2023-03-15  1738  
800ef7029f37c5 jason-ch chen    2023-10-23  1739  		i2c0: i2c@11280000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1740  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  1741  			reg = <0 0x11280000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1742  			      <0 0x10220080 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  1743  			interrupts = <GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1744  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1745  			clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C0>,
800ef7029f37c5 jason-ch chen    2023-10-23  1746  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  1747  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  1748  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1749  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1750  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1751  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1752  
800ef7029f37c5 jason-ch chen    2023-10-23  1753  		i2c2: i2c@11281000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1754  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  1755  			reg = <0 0x11281000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1756  			      <0 0x10220180 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  1757  			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1758  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1759  			clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C2>,
800ef7029f37c5 jason-ch chen    2023-10-23  1760  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  1761  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  1762  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1763  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1764  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1765  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1766  
800ef7029f37c5 jason-ch chen    2023-10-23  1767  		i2c3: i2c@11282000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1768  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  1769  			reg = <0 0x11282000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1770  			      <0 0x10220280 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  1771  			interrupts = <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1772  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1773  			clocks = <&imp_iic_wrap_c CLK_IMP_IIC_WRAP_C_AP_CLOCK_I2C3>,
800ef7029f37c5 jason-ch chen    2023-10-23  1774  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  1775  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  1776  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1777  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1778  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1779  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1780  
800ef7029f37c5 jason-ch chen    2023-10-23  1781  		imp_iic_wrap_c: clock-controller@11283000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1782  			compatible = "mediatek,mt8188-imp-iic-wrap-c";
800ef7029f37c5 jason-ch chen    2023-10-23  1783  			reg = <0 0x11283000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1784  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1785  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1786  
800ef7029f37c5 jason-ch chen    2023-10-23  1787  		xhci2: usb@112a0000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1788  			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
800ef7029f37c5 jason-ch chen    2023-10-23  1789  			reg = <0 0x112a0000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1790  			      <0 0x112a3e00 0 0x0100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1791  			reg-names = "mac", "ippc";
800ef7029f37c5 jason-ch chen    2023-10-23  1792  			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1793  			phys = <&u2port2 PHY_TYPE_USB2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1794  			assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_3P>,
800ef7029f37c5 jason-ch chen    2023-10-23  1795  					  <&topckgen CLK_TOP_USB_TOP_3P>;
800ef7029f37c5 jason-ch chen    2023-10-23  1796  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
800ef7029f37c5 jason-ch chen    2023-10-23  1797  						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
800ef7029f37c5 jason-ch chen    2023-10-23  1798  			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_3P_BUS>,
800ef7029f37c5 jason-ch chen    2023-10-23  1799  				 <&topckgen CLK_TOP_SSUSB_TOP_P3_REF>,
800ef7029f37c5 jason-ch chen    2023-10-23  1800  				 <&pericfg_ao CLK_PERI_AO_SSUSB_3P_XHCI>;
800ef7029f37c5 jason-ch chen    2023-10-23  1801  			clock-names = "sys_ck", "ref_ck", "mcu_ck";
8c4fb322b7e512 Shaocheng Wang   2023-06-05  1802  			mediatek,syscon-wakeup = <&pericfg 0x470 2>;
8c4fb322b7e512 Shaocheng Wang   2023-06-05  1803  			wakeup-source;
800ef7029f37c5 jason-ch chen    2023-10-23  1804  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1805  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1806  
800ef7029f37c5 jason-ch chen    2023-10-23  1807  		xhci0: usb@112b0000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1808  			compatible = "mediatek,mt8188-xhci", "mediatek,mtk-xhci";
800ef7029f37c5 jason-ch chen    2023-10-23  1809  			reg = <0 0x112b0000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1810  			      <0 0x112b3e00 0 0x0100>;
800ef7029f37c5 jason-ch chen    2023-10-23  1811  			reg-names = "mac", "ippc";
800ef7029f37c5 jason-ch chen    2023-10-23  1812  			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1813  			phys = <&u2port0 PHY_TYPE_USB2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1814  			assigned-clocks = <&topckgen CLK_TOP_SSUSB_XHCI_2P>,
800ef7029f37c5 jason-ch chen    2023-10-23  1815  					  <&topckgen CLK_TOP_USB_TOP_2P>;
800ef7029f37c5 jason-ch chen    2023-10-23  1816  			assigned-clock-parents = <&topckgen CLK_TOP_UNIVPLL_D5_D4>,
800ef7029f37c5 jason-ch chen    2023-10-23  1817  						 <&topckgen CLK_TOP_UNIVPLL_D5_D4>;
800ef7029f37c5 jason-ch chen    2023-10-23  1818  			clocks = <&pericfg_ao CLK_PERI_AO_SSUSB_2P_BUS>,
800ef7029f37c5 jason-ch chen    2023-10-23  1819  				 <&topckgen CLK_TOP_SSUSB_TOP_P2_REF>,
800ef7029f37c5 jason-ch chen    2023-10-23  1820  				 <&pericfg_ao CLK_PERI_AO_SSUSB_2P_XHCI>;
800ef7029f37c5 jason-ch chen    2023-10-23  1821  			clock-names = "sys_ck", "ref_ck", "mcu_ck";
800ef7029f37c5 jason-ch chen    2023-10-23  1822  			mediatek,syscon-wakeup = <&pericfg 0x460 2>;
800ef7029f37c5 jason-ch chen    2023-10-23  1823  			wakeup-source;
800ef7029f37c5 jason-ch chen    2023-10-23  1824  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1825  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1826  
1cd445dc9d3c36 Johnson Wang     2023-02-14  1827  		pcie: pcie@112f0000 {
1cd445dc9d3c36 Johnson Wang     2023-02-14  1828  			device_type = "pci";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1829  			compatible = "mediatek,mt8188-pcie",
1cd445dc9d3c36 Johnson Wang     2023-02-14  1830  				     "mediatek,mt8192-pcie";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1831  			reg = <0 0x112f0000 0 0x2000>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1832  			reg-names = "pcie-mac";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1833  			linux,pci-domain = <0>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1834  			#address-cells = <3>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1835  			#size-cells = <2>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1836  			interrupts = <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH 0>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1837  			bus-range = <0x00 0xff>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1838  			ranges = <0x82000000 0 0x20000000
1cd445dc9d3c36 Johnson Wang     2023-02-14  1839  				  0x0 0x20000000 0 0x04000000>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1840  			iommu-map = <0x0000 &infra_iommu IFR_IOMMU_PORT_PCIE_0
1cd445dc9d3c36 Johnson Wang     2023-02-14  1841  				     0xFFFF>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1842  			iommu-map-mask = <0x0>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1843  			status = "disabled";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1844  			clocks = <&infracfg_ao CLK_INFRA_AO_PCIE_TL_26M>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1845  				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_96M>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1846  				 <&infracfg_ao CLK_INFRA_AO_PCIE_TL_32K>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1847  				 <&infracfg_ao CLK_INFRA_AO_PCIE_PERI_26M>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1848  				 <&pericfg_ao CLK_PERI_AO_PCIE_P0_FMEM>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1849  				 <&infracfg_ao CLK_INFRA_AO_PCIE_PL_P_250M_P0>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1850  			phys = <&pcieport PHY_TYPE_PCIE>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1851  			phy-names = "pcie-phy";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1852  			power-domains = <&spm MT8188_POWER_DOMAIN_PEXTP_MAC_P0>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1853  			#interrupt-cells = <1>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1854  			interrupt-map-mask = <0 0 0 7>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1855  			interrupt-map = <0 0 0 1 &pcie_intc 0>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1856  					<0 0 0 2 &pcie_intc 1>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1857  					<0 0 0 3 &pcie_intc 2>,
1cd445dc9d3c36 Johnson Wang     2023-02-14  1858  					<0 0 0 4 &pcie_intc 3>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1859  
1cd445dc9d3c36 Johnson Wang     2023-02-14  1860  			pcie_intc: interrupt-controller {
1cd445dc9d3c36 Johnson Wang     2023-02-14  1861  				interrupt-controller;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1862  				#address-cells = <0>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1863  				#interrupt-cells = <1>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1864  			};
1cd445dc9d3c36 Johnson Wang     2023-02-14  1865  		};
1cd445dc9d3c36 Johnson Wang     2023-02-14  1866  
800ef7029f37c5 jason-ch chen    2023-10-23  1867  		nor_flash: spi@1132c000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1868  			compatible = "mediatek,mt8188-nor", "mediatek,mt8186-nor";
800ef7029f37c5 jason-ch chen    2023-10-23  1869  			reg = <0 0x1132c000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1870  			clocks = <&topckgen CLK_TOP_SPINOR>,
800ef7029f37c5 jason-ch chen    2023-10-23  1871  				 <&pericfg_ao CLK_PERI_AO_FLASHIFLASHCK>,
800ef7029f37c5 jason-ch chen    2023-10-23  1872  				 <&pericfg_ao CLK_PERI_AO_FLASHIF_BUS>;
800ef7029f37c5 jason-ch chen    2023-10-23  1873  			clock-names = "spi", "sf", "axi";
800ef7029f37c5 jason-ch chen    2023-10-23  1874  			assigned-clocks = <&topckgen CLK_TOP_SPINOR>;
800ef7029f37c5 jason-ch chen    2023-10-23  1875  			interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH 0>;
6a40a0576320ca Fei Shao         2024-03-28  1876  			#address-cells = <1>;
6a40a0576320ca Fei Shao         2024-03-28  1877  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1878  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1879  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1880  
1cd445dc9d3c36 Johnson Wang     2023-02-14  1881  		pciephy: t-phy@11c20700 {
1cd445dc9d3c36 Johnson Wang     2023-02-14  1882  			compatible = "mediatek,generic-tphy-v2";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1883  			#address-cells = <1>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1884  			#size-cells = <1>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1885  			ranges = <0x0 0x0 0x11c20700 0x700>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1886  			power-domains = <&spm MT8188_POWER_DOMAIN_PEXTP_PHY_TOP>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1887  			status = "disabled";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1888  
1cd445dc9d3c36 Johnson Wang     2023-02-14  1889  			pcieport: pcie-phy@0 {
1cd445dc9d3c36 Johnson Wang     2023-02-14  1890  				reg = <0 0x700>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1891  				clocks = <&topckgen CLK_TOP_CFGREG_F_PCIE_PHY_REF>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1892  				clock-names = "ref";
1cd445dc9d3c36 Johnson Wang     2023-02-14  1893  				#phy-cells = <1>;
1cd445dc9d3c36 Johnson Wang     2023-02-14  1894  			};
1cd445dc9d3c36 Johnson Wang     2023-02-14  1895  		};
1cd445dc9d3c36 Johnson Wang     2023-02-14  1896  
0d093046fe4ae1 Fei Shao         2024-07-22  1897  		mipi_tx_config0: phy@11c80000 {
15d7ef162af666 Johnson Wang     2023-02-07  1898  			compatible = "mediatek,mt8188-mipi-tx",
15d7ef162af666 Johnson Wang     2023-02-07  1899  				     "mediatek,mt8183-mipi-tx";
15d7ef162af666 Johnson Wang     2023-02-07  1900  			reg = <0 0x11c80000 0 0x1000>;
15d7ef162af666 Johnson Wang     2023-02-07  1901  			clocks = <&clk26m>;
15d7ef162af666 Johnson Wang     2023-02-07  1902  			clock-output-names = "mipi_tx0_pll";
15d7ef162af666 Johnson Wang     2023-02-07  1903  			status = "disabled";
15d7ef162af666 Johnson Wang     2023-02-07  1904  			#clock-cells = <0>;
15d7ef162af666 Johnson Wang     2023-02-07  1905  			#phy-cells = <0>;
15d7ef162af666 Johnson Wang     2023-02-07  1906  		};
15d7ef162af666 Johnson Wang     2023-02-07  1907  
800ef7029f37c5 jason-ch chen    2023-10-23  1908  		i2c1: i2c@11e00000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1909  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  1910  			reg = <0 0x11e00000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1911  			      <0 0x10220100 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  1912  			interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1913  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1914  			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C1>,
800ef7029f37c5 jason-ch chen    2023-10-23  1915  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  1916  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  1917  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1918  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1919  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1920  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1921  
800ef7029f37c5 jason-ch chen    2023-10-23  1922  		i2c4: i2c@11e01000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1923  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  1924  			reg = <0 0x11e01000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  1925  			      <0 0x10220380 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  1926  			interrupts = <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1927  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1928  			clocks = <&imp_iic_wrap_w CLK_IMP_IIC_WRAP_W_AP_CLOCK_I2C4>,
800ef7029f37c5 jason-ch chen    2023-10-23  1929  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  1930  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  1931  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1932  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  1933  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1934  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1935  
800ef7029f37c5 jason-ch chen    2023-10-23  1936  		imp_iic_wrap_w: clock-controller@11e02000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1937  			compatible = "mediatek,mt8188-imp-iic-wrap-w";
800ef7029f37c5 jason-ch chen    2023-10-23  1938  			reg = <0 0x11e02000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  1939  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1940  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1941  
800ef7029f37c5 jason-ch chen    2023-10-23  1942  		u3phy0: t-phy@11e30000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1943  			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
6af14ba53ac522 Johnson Wang     2022-07-25  1944  			#address-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25  1945  			#size-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25  1946  			ranges;
800ef7029f37c5 jason-ch chen    2023-10-23  1947  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1948  
6af14ba53ac522 Johnson Wang     2022-07-25  1949  			u2port0: usb-phy@11e30000 {
6af14ba53ac522 Johnson Wang     2022-07-25  1950  				reg = <0 0x11e30000 0 0x700>;
800ef7029f37c5 jason-ch chen    2023-10-23  1951  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P2_REF>,
800ef7029f37c5 jason-ch chen    2023-10-23  1952  					 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
800ef7029f37c5 jason-ch chen    2023-10-23  1953  				clock-names = "ref", "da_ref";
800ef7029f37c5 jason-ch chen    2023-10-23  1954  				#phy-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1955  			};
800ef7029f37c5 jason-ch chen    2023-10-23  1956  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1957  
800ef7029f37c5 jason-ch chen    2023-10-23  1958  		u3phy1: t-phy@11e40000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1959  			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
6af14ba53ac522 Johnson Wang     2022-07-25  1960  			#address-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25  1961  			#size-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25  1962  			ranges;
800ef7029f37c5 jason-ch chen    2023-10-23  1963  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1964  
6af14ba53ac522 Johnson Wang     2022-07-25  1965  			u2port1: usb-phy@11e40000 {
6af14ba53ac522 Johnson Wang     2022-07-25  1966  				reg = <0 0x11e40000 0 0x700>;
800ef7029f37c5 jason-ch chen    2023-10-23  1967  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_REF>,
800ef7029f37c5 jason-ch chen    2023-10-23  1968  					 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
800ef7029f37c5 jason-ch chen    2023-10-23  1969  				clock-names = "ref", "da_ref";
800ef7029f37c5 jason-ch chen    2023-10-23  1970  				#phy-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1971  			};
800ef7029f37c5 jason-ch chen    2023-10-23  1972  
6af14ba53ac522 Johnson Wang     2022-07-25  1973  			u3port1: usb-phy@11e40700 {
6af14ba53ac522 Johnson Wang     2022-07-25  1974  				reg = <0 0x11e40700 0 0x700>;
800ef7029f37c5 jason-ch chen    2023-10-23  1975  				clocks = <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>,
800ef7029f37c5 jason-ch chen    2023-10-23  1976  					 <&clk26m>;
800ef7029f37c5 jason-ch chen    2023-10-23  1977  				clock-names = "ref", "da_ref";
800ef7029f37c5 jason-ch chen    2023-10-23  1978  				#phy-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1979  				status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1980  			};
800ef7029f37c5 jason-ch chen    2023-10-23  1981  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1982  
800ef7029f37c5 jason-ch chen    2023-10-23  1983  		u3phy2: t-phy@11e80000 {
800ef7029f37c5 jason-ch chen    2023-10-23  1984  			compatible = "mediatek,mt8188-tphy", "mediatek,generic-tphy-v3";
6af14ba53ac522 Johnson Wang     2022-07-25  1985  			#address-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25  1986  			#size-cells = <2>;
6af14ba53ac522 Johnson Wang     2022-07-25  1987  			ranges;
800ef7029f37c5 jason-ch chen    2023-10-23  1988  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  1989  
6af14ba53ac522 Johnson Wang     2022-07-25  1990  			u2port2: usb-phy@11e80000 {
6af14ba53ac522 Johnson Wang     2022-07-25  1991  				reg = <0 0x11e80000 0 0x700>;
800ef7029f37c5 jason-ch chen    2023-10-23  1992  				clocks = <&topckgen CLK_TOP_SSUSB_PHY_P3_REF>,
800ef7029f37c5 jason-ch chen    2023-10-23  1993  					 <&apmixedsys CLK_APMIXED_PLL_SSUSB26M_EN>;
800ef7029f37c5 jason-ch chen    2023-10-23  1994  				clock-names = "ref", "da_ref";
800ef7029f37c5 jason-ch chen    2023-10-23  1995  				#phy-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  1996  			};
800ef7029f37c5 jason-ch chen    2023-10-23  1997  		};
800ef7029f37c5 jason-ch chen    2023-10-23  1998  
800ef7029f37c5 jason-ch chen    2023-10-23  1999  		i2c5: i2c@11ec0000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2000  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  2001  			reg = <0 0x11ec0000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  2002  			      <0 0x10220480 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  2003  			interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  2004  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2005  			clocks = <&imp_iic_wrap_en CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C5>,
800ef7029f37c5 jason-ch chen    2023-10-23  2006  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  2007  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  2008  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2009  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  2010  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  2011  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2012  
800ef7029f37c5 jason-ch chen    2023-10-23  2013  		i2c6: i2c@11ec1000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2014  			compatible = "mediatek,mt8188-i2c";
800ef7029f37c5 jason-ch chen    2023-10-23  2015  			reg = <0 0x11ec1000 0 0x1000>,
800ef7029f37c5 jason-ch chen    2023-10-23  2016  			      <0 0x10220600 0 0x80>;
800ef7029f37c5 jason-ch chen    2023-10-23  2017  			interrupts = <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH 0>;
800ef7029f37c5 jason-ch chen    2023-10-23  2018  			clock-div = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2019  			clocks = <&imp_iic_wrap_en CLK_IMP_IIC_WRAP_EN_AP_CLOCK_I2C6>,
800ef7029f37c5 jason-ch chen    2023-10-23  2020  				 <&infracfg_ao CLK_INFRA_AO_APDMA_BCLK>;
800ef7029f37c5 jason-ch chen    2023-10-23  2021  			clock-names = "main", "dma";
800ef7029f37c5 jason-ch chen    2023-10-23  2022  			#address-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2023  			#size-cells = <0>;
800ef7029f37c5 jason-ch chen    2023-10-23  2024  			status = "disabled";
800ef7029f37c5 jason-ch chen    2023-10-23  2025  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2026  
800ef7029f37c5 jason-ch chen    2023-10-23  2027  		imp_iic_wrap_en: clock-controller@11ec2000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2028  			compatible = "mediatek,mt8188-imp-iic-wrap-en";
800ef7029f37c5 jason-ch chen    2023-10-23  2029  			reg = <0 0x11ec2000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2030  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2031  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2032  
9078d0c8584194 Johnson Wang     2023-01-11  2033  		efuse: efuse@11f20000 {
9078d0c8584194 Johnson Wang     2023-01-11  2034  			compatible = "mediatek,mt8188-efuse",
9078d0c8584194 Johnson Wang     2023-01-11  2035  				     "mediatek,efuse";
9078d0c8584194 Johnson Wang     2023-01-11  2036  			reg = <0 0x11f20000 0 0x1000>;
9078d0c8584194 Johnson Wang     2023-01-11  2037  			#address-cells = <1>;
9078d0c8584194 Johnson Wang     2023-01-11  2038  			#size-cells = <1>;
9078d0c8584194 Johnson Wang     2023-01-11  2039  
0d093046fe4ae1 Fei Shao         2024-07-22  2040  			efuse_gpu_tbl0: efuse@40 {
0d093046fe4ae1 Fei Shao         2024-07-22  2041  				reg = <0x40 0x4>;
9078d0c8584194 Johnson Wang     2023-01-11  2042  			};
9078d0c8584194 Johnson Wang     2023-01-11  2043  
0d093046fe4ae1 Fei Shao         2024-07-22  2044  			efuse_gpu_tbl1: efuse@4c {
0d093046fe4ae1 Fei Shao         2024-07-22  2045  				reg = <0x4c 0x4>;
9078d0c8584194 Johnson Wang     2023-01-11  2046  			};
9078d0c8584194 Johnson Wang     2023-01-11  2047  
0d093046fe4ae1 Fei Shao         2024-07-22  2048  			efuse_hdmi_rx: efuse@50 {
9078d0c8584194 Johnson Wang     2023-01-11  2049  				reg = <0x50 0xc>;
9078d0c8584194 Johnson Wang     2023-01-11  2050  			};
9078d0c8584194 Johnson Wang     2023-01-11  2051  
0d093046fe4ae1 Fei Shao         2024-07-22  2052  			efuse_hdmi_tx: efuse@184 {
9078d0c8584194 Johnson Wang     2023-01-11  2053  				reg = <0x184 0x4>;
9078d0c8584194 Johnson Wang     2023-01-11  2054  			};
9078d0c8584194 Johnson Wang     2023-01-11  2055  
0d093046fe4ae1 Fei Shao         2024-07-22  2056  			efuse_csi0: efuse@18c {
9078d0c8584194 Johnson Wang     2023-01-11  2057  				reg = <0x18c 0x4>;
9078d0c8584194 Johnson Wang     2023-01-11  2058  			};
9078d0c8584194 Johnson Wang     2023-01-11  2059  
0d093046fe4ae1 Fei Shao         2024-07-22  2060  			efuse_csi1: efuse@190 {
9078d0c8584194 Johnson Wang     2023-01-11  2061  				reg = <0x190 0x4>;
9078d0c8584194 Johnson Wang     2023-01-11  2062  			};
9078d0c8584194 Johnson Wang     2023-01-11  2063  
0d093046fe4ae1 Fei Shao         2024-07-22  2064  			efuse_dp_calib: efuse@1a0 {
0d093046fe4ae1 Fei Shao         2024-07-22  2065  				reg = <0x1a0 0x10>;
9078d0c8584194 Johnson Wang     2023-01-11  2066  			};
9078d0c8584194 Johnson Wang     2023-01-11  2067  
0d093046fe4ae1 Fei Shao         2024-07-22  2068  			efuse_lvts_calib: efuse@1ac {
0d093046fe4ae1 Fei Shao         2024-07-22  2069  				reg = <0x1ac 0x40>;
9078d0c8584194 Johnson Wang     2023-01-11  2070  			};
9078d0c8584194 Johnson Wang     2023-01-11  2071  
0d093046fe4ae1 Fei Shao         2024-07-22  2072  			efuse_svs_calib: efuse@534 {
0d093046fe4ae1 Fei Shao         2024-07-22  2073  				reg = <0x534 0x68>;
9078d0c8584194 Johnson Wang     2023-01-11  2074  			};
9078d0c8584194 Johnson Wang     2023-01-11  2075  
0d093046fe4ae1 Fei Shao         2024-07-22  2076  			efuse_gpu_volt_bin: efuse@581 {
9078d0c8584194 Johnson Wang     2023-01-11  2077  				reg = <0x581 0x1>;
9078d0c8584194 Johnson Wang     2023-01-11  2078  				bits = <0 3>;
9078d0c8584194 Johnson Wang     2023-01-11  2079  			};
21938b10dbd710 William-tw Lin   2023-06-05  2080  
21938b10dbd710 William-tw Lin   2023-06-05  2081  			socinfo-data1@7a0 {
21938b10dbd710 William-tw Lin   2023-06-05  2082  				reg = <0x7a0 0x4>;
21938b10dbd710 William-tw Lin   2023-06-05  2083  			};
21938b10dbd710 William-tw Lin   2023-06-05  2084  
21938b10dbd710 William-tw Lin   2023-06-05  2085  			socinfo-data2@7e0 {
21938b10dbd710 William-tw Lin   2023-06-05  2086  				reg = <0x7e0 0x4>;
21938b10dbd710 William-tw Lin   2023-06-05  2087  			};
9078d0c8584194 Johnson Wang     2023-01-11  2088  		};
9078d0c8584194 Johnson Wang     2023-01-11  2089  
fc3eef90bc9933 Johnson Wang     2023-02-14  2090  		gpu: gpu@13000000 {
fc3eef90bc9933 Johnson Wang     2023-02-14  2091  			compatible = "mediatek,mt8188-mali", "arm,mali-valhall";
fc3eef90bc9933 Johnson Wang     2023-02-14  2092  			reg = <0 0x13000000 0 0x4000>;
fc3eef90bc9933 Johnson Wang     2023-02-14  2093  			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH 0>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2094  				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH 0>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2095  				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH 0>;
fc3eef90bc9933 Johnson Wang     2023-02-14  2096  			interrupt-names = "JOB", "MMU", "GPU";
fc3eef90bc9933 Johnson Wang     2023-02-14  2097  			clocks = <&topckgen CLK_TOP_MFG_CK_FAST_REF>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2098  				 <&apmixedsys CLK_APMIXED_MFGPLL>,
b3a334ebd6e058 Johnson Wang     2023-03-27  2099  				 <&apmixedsys CLK_APMIXED_MFGPLL>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2100  				 <&topckgen CLK_TOP_MFG_CORE_TMP>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2101  				 <&mfgcfg CLK_MFGCFG_BG3D>;
fc3eef90bc9933 Johnson Wang     2023-02-14  2102  			clock-names = "clk_mux",
fc3eef90bc9933 Johnson Wang     2023-02-14  2103  				      "clk_pll_src",
fc3eef90bc9933 Johnson Wang     2023-02-14  2104  				      "clk_main_parent",
fc3eef90bc9933 Johnson Wang     2023-02-14  2105  				      "clk_sub_parent",
fc3eef90bc9933 Johnson Wang     2023-02-14  2106  				      "subsys_bg3d";
fc3eef90bc9933 Johnson Wang     2023-02-14  2107  			power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2108  					<&spm MT8188_POWER_DOMAIN_MFG3>,
fc3eef90bc9933 Johnson Wang     2023-02-14  2109  					<&spm MT8188_POWER_DOMAIN_MFG4>;
fc3eef90bc9933 Johnson Wang     2023-02-14  2110  			power-domain-names = "core0", "core1", "core2";
0d093046fe4ae1 Fei Shao         2024-07-22  2111  			nvmem-cells = <&efuse_gpu_volt_bin>;
fc3eef90bc9933 Johnson Wang     2023-02-14  2112  			nvmem-cell-names = "volt-bin";
fc3eef90bc9933 Johnson Wang     2023-02-14  2113  			#cooling-cells = <2>;
fc3eef90bc9933 Johnson Wang     2023-02-14  2114  		};
fc3eef90bc9933 Johnson Wang     2023-02-14  2115  
800ef7029f37c5 jason-ch chen    2023-10-23  2116  		mfgcfg: clock-controller@13fbf000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2117  			compatible = "mediatek,mt8188-mfgcfg";
800ef7029f37c5 jason-ch chen    2023-10-23  2118  			reg = <0 0x13fbf000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2119  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2120  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2121  
800ef7029f37c5 jason-ch chen    2023-10-23  2122  		vppsys0: clock-controller@14000000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2123  			compatible = "mediatek,mt8188-vppsys0";
800ef7029f37c5 jason-ch chen    2023-10-23  2124  			reg = <0 0x14000000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2125  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2126  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2127  
80d45ddb7686b1 Johnson Wang     2023-01-10  2128  		vpp_smi_common: smi@14012000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2129  			compatible = "mediatek,mt8188-smi-common-vpp";
80d45ddb7686b1 Johnson Wang     2023-01-10  2130  			reg = <0 0x14012000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2131  			clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2132  				 <&vppsys0 CLK_VPP0_SMI_SUB_COMMON_REORDER>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2133  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2134  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2135  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2136  
0d093046fe4ae1 Fei Shao         2024-07-22  2137  		larb4: smi@14013000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2138  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2139  			reg = <0 0x14013000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2140  			mediatek,larb-id = <SMI_L4_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2141  			mediatek,smi = <&vpp_smi_common>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2142  			clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2143  				 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2144  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2145  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2146  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2147  
80d45ddb7686b1 Johnson Wang     2023-01-10  2148  		vpp_iommu: iommu@14018000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2149  			compatible = "mediatek,mt8188-iommu-vpp";
80d45ddb7686b1 Johnson Wang     2023-01-10  2150  			reg = <0 0x14018000 0 0x5000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2151  			mediatek,larbs = <&larb1 &larb3 &larb4 &larb6 &larb7
80d45ddb7686b1 Johnson Wang     2023-01-10  2152  					  &larb11b &larb12 &larb14 &larb15
80d45ddb7686b1 Johnson Wang     2023-01-10  2153  					  &larb16a &larb17a &larb23 &larb27>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2154  			interrupts = <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH 0>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2155  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH 0>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2156  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH 0>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2157  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH 0>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2158  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH 0>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2159  			clocks = <&vppsys0 CLK_VPP0_SMI_IOMMU>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2160  			clock-names = "bclk";
80d45ddb7686b1 Johnson Wang     2023-01-10  2161  			#iommu-cells = <1>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2162  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS0>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2163  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2164  
800ef7029f37c5 jason-ch chen    2023-10-23  2165  		wpesys: clock-controller@14e00000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2166  			compatible = "mediatek,mt8188-wpesys";
800ef7029f37c5 jason-ch chen    2023-10-23  2167  			reg = <0 0x14e00000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2168  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2169  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2170  
800ef7029f37c5 jason-ch chen    2023-10-23  2171  		wpesys_vpp0: clock-controller@14e02000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2172  			compatible = "mediatek,mt8188-wpesys-vpp0";
800ef7029f37c5 jason-ch chen    2023-10-23  2173  			reg = <0 0x14e02000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2174  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2175  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2176  
0d093046fe4ae1 Fei Shao         2024-07-22  2177  		larb7: smi@14e04000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2178  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2179  			reg = <0 0x14e04000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2180  			mediatek,larb-id = <SMI_L7_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2181  			mediatek,smi = <&vpp_smi_common>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2182  			clocks = <&wpesys CLK_WPE_TOP_SMI_LARB7>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2183  				 <&wpesys CLK_WPE_TOP_SMI_LARB7>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2184  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2185  			power-domains = <&spm MT8188_POWER_DOMAIN_WPE>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2186  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2187  
800ef7029f37c5 jason-ch chen    2023-10-23  2188  		vppsys1: clock-controller@14f00000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2189  			compatible = "mediatek,mt8188-vppsys1";
800ef7029f37c5 jason-ch chen    2023-10-23  2190  			reg = <0 0x14f00000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2191  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2192  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2193  
0d093046fe4ae1 Fei Shao         2024-07-22  2194  		larb5: smi@14f02000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2195  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2196  			reg = <0 0x14f02000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2197  			mediatek,larb-id = <SMI_L5_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2198  			mediatek,smi = <&vdo_smi_common>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2199  			clocks = <&vppsys1 CLK_VPP1_GALS5>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2200  				 <&vppsys1 CLK_VPP1_LARB5>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2201  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2202  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2203  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2204  
0d093046fe4ae1 Fei Shao         2024-07-22  2205  		larb6: smi@14f03000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2206  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2207  			reg = <0 0x14f03000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2208  			mediatek,larb-id = <SMI_L6_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2209  			mediatek,smi = <&vpp_smi_common>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2210  			clocks = <&vppsys1 CLK_VPP1_GALS6>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2211  				 <&vppsys1 CLK_VPP1_LARB6>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2212  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2213  			power-domains = <&spm MT8188_POWER_DOMAIN_VPPSYS1>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2214  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2215  
800ef7029f37c5 jason-ch chen    2023-10-23  2216  		imgsys: clock-controller@15000000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2217  			compatible = "mediatek,mt8188-imgsys";
800ef7029f37c5 jason-ch chen    2023-10-23  2218  			reg = <0 0x15000000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2219  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2220  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2221  
0d093046fe4ae1 Fei Shao         2024-07-22  2222  		larb9: smi@15001000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2223  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2224  			reg = <0 0x15001000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2225  			mediatek,larb-id = <SMI_L9_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2226  			mediatek,smi = <&vdo_smi_common>;
7c3927c3af7353 Chengci Xu       2023-11-29  2227  			mediatek,smi-sub-comm = <&smi_img0>;
7c3927c3af7353 Chengci Xu       2023-11-29  2228  			mediatek,smi-sub-comm-inport = <0>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2229  			clocks = <&imgsys CLK_IMGSYS_MAIN_LARB9>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2230  				 <&imgsys CLK_IMGSYS_MAIN_LARB9>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2231  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2232  			power-domains = <&spm MT8188_POWER_DOMAIN_IMG_MAIN>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2233  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2234  
6af14ba53ac522 Johnson Wang     2022-07-25  2235  		smi_img0: syscon@15002000 {
797147d8a9d5e9 Friday Yang      2024-06-06  2236  			compatible = "mediatek,mt8188-smi-img0",
797147d8a9d5e9 Friday Yang      2024-06-06  2237  				     "mediatek,mt8188-smi-sub-common", "syscon";
797147d8a9d5e9 Friday Yang      2024-06-06  2238  			mediatek,common-id = <3>;
797147d8a9d5e9 Friday Yang      2024-06-06  2239  			mediatek,smi = <&vdo_smi_common>;
6af14ba53ac522 Johnson Wang     2022-07-25  2240  			reg = <0 0x15002000 0 0x1000>;
797147d8a9d5e9 Friday Yang      2024-06-06  2241  			clocks = <&vdosys0 CLK_VDO0_SMI_COMMON>,
797147d8a9d5e9 Friday Yang      2024-06-06  2242  				 <&vdosys0 CLK_VDO0_SMI_GALS>;
797147d8a9d5e9 Friday Yang      2024-06-06  2243  			clock-names = "apb", "smi";
797147d8a9d5e9 Friday Yang      2024-06-06  2244  			power-domains = <&spm MT8188_POWER_DOMAIN_IMG_MAIN>;
6af14ba53ac522 Johnson Wang     2022-07-25  2245  		};
6af14ba53ac522 Johnson Wang     2022-07-25  2246  
6af14ba53ac522 Johnson Wang     2022-07-25  2247  		smi_img1: syscon@15003000 {
797147d8a9d5e9 Friday Yang      2024-06-06  2248  			compatible = "mediatek,mt8188-smi-img1",
797147d8a9d5e9 Friday Yang      2024-06-06  2249  				     "mediatek,mt8188-smi-sub-common", "syscon";
797147d8a9d5e9 Friday Yang      2024-06-06  2250  			mediatek,common-id = <4>;
797147d8a9d5e9 Friday Yang      2024-06-06  2251  			mediatek,smi = <&vpp_smi_common>;
6af14ba53ac522 Johnson Wang     2022-07-25  2252  			reg = <0 0x15003000 0 0x1000>;
797147d8a9d5e9 Friday Yang      2024-06-06  2253  			clocks = <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>,
797147d8a9d5e9 Friday Yang      2024-06-06  2254  				 <&vppsys0 CLK_VPP0_SMI_COMMON_LARB4>;
797147d8a9d5e9 Friday Yang      2024-06-06  2255  			clock-names = "apb", "smi";
797147d8a9d5e9 Friday Yang      2024-06-06  2256  			power-domains = <&spm MT8188_POWER_DOMAIN_DIP>;
6af14ba53ac522 Johnson Wang     2022-07-25  2257  		};
6af14ba53ac522 Johnson Wang     2022-07-25  2258  
800ef7029f37c5 jason-ch chen    2023-10-23  2259  		imgsys1_dip_top: clock-controller@15110000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2260  			compatible = "mediatek,mt8188-imgsys1-dip-top";
800ef7029f37c5 jason-ch chen    2023-10-23  2261  			reg = <0 0x15110000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2262  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2263  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2264  
0d093046fe4ae1 Fei Shao         2024-07-22  2265  		larb10: smi@15120000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2266  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2267  			reg = <0 0x15120000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2268  			mediatek,larb-id = <SMI_L10_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2269  			mediatek,smi = <&vdo_smi_common>;
7c3927c3af7353 Chengci Xu       2023-11-29  2270  			mediatek,smi-sub-comm = <&smi_img0>;
7c3927c3af7353 Chengci Xu       2023-11-29  2271  			mediatek,smi-sub-comm-inport = <1>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2272  			clocks = <&imgsys CLK_IMGSYS_MAIN_DIP0>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2273  				 <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_LARB10>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2274  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2275  			power-domains = <&spm MT8188_POWER_DOMAIN_DIP>;
797147d8a9d5e9 Friday Yang      2024-06-06  2276  			mediatek,smi-reset = <&imgsys1_dip_top MT8188_SMI_RST_LARB10>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2277  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2278  
800ef7029f37c5 jason-ch chen    2023-10-23  2279  		imgsys1_dip_nr: clock-controller@15130000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2280  			compatible = "mediatek,mt8188-imgsys1-dip-nr";
800ef7029f37c5 jason-ch chen    2023-10-23  2281  			reg = <0 0x15130000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2282  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2283  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2284  
0d093046fe4ae1 Fei Shao         2024-07-22  2285  		larb15: smi@15140000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2286  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2287  			reg = <0 0x15140000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2288  			mediatek,larb-id = <SMI_L15_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2289  			mediatek,smi = <&vpp_smi_common>;
7c3927c3af7353 Chengci Xu       2023-11-29  2290  			mediatek,smi-sub-comm = <&smi_img1>;
7c3927c3af7353 Chengci Xu       2023-11-29  2291  			mediatek,smi-sub-comm-inport = <1>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2292  			clocks = <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_LARB10>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2293  				 <&imgsys1_dip_nr CLK_IMGSYS1_DIP_NR_LARB15>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2294  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2295  			power-domains = <&spm MT8188_POWER_DOMAIN_DIP>;
797147d8a9d5e9 Friday Yang      2024-06-06  2296  			mediatek,smi-reset = <&imgsys1_dip_nr MT8188_SMI_RST_LARB15>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2297  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2298  
800ef7029f37c5 jason-ch chen    2023-10-23  2299  		imgsys_wpe1: clock-controller@15220000 {
800ef7029f37c5 jason-ch chen    2023-10-23  2300  			compatible = "mediatek,mt8188-imgsys-wpe1";
800ef7029f37c5 jason-ch chen    2023-10-23  2301  			reg = <0 0x15220000 0 0x1000>;
800ef7029f37c5 jason-ch chen    2023-10-23  2302  			#clock-cells = <1>;
800ef7029f37c5 jason-ch chen    2023-10-23  2303  		};
800ef7029f37c5 jason-ch chen    2023-10-23  2304  
0d093046fe4ae1 Fei Shao         2024-07-22  2305  		larb11a: smi@15230000 {
80d45ddb7686b1 Johnson Wang     2023-01-10  2306  			compatible = "mediatek,mt8188-smi-larb";
80d45ddb7686b1 Johnson Wang     2023-01-10  2307  			reg = <0 0x15230000 0 0x1000>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2308  			mediatek,larb-id = <SMI_L11A_ID>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2309  			mediatek,smi = <&vdo_smi_common>;
7c3927c3af7353 Chengci Xu       2023-11-29  2310  			mediatek,smi-sub-comm = <&smi_img0>;
7c3927c3af7353 Chengci Xu       2023-11-29  2311  			mediatek,smi-sub-comm-inport = <2>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2312  			clocks = <&imgsys CLK_IMGSYS_MAIN_WPE0>,
80d45ddb7686b1 Johnson Wang     2023-01-10  2313  				 <&imgsys_wpe1 CLK_IMGSYS_WPE1_LARB11>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2314  			clock-names = "apb", "smi";
80d45ddb7686b1 Johnson Wang     2023-01-10  2315  			power-domains = <&spm MT8188_POWER_DOMAIN_DIP>;
797147d8a9d5e9 Friday Yang      2024-06-06  2316  			mediatek,smi-reset = <&imgsys_wpe1 MT8188_SMI_RST_LARB11A>;
80d45ddb7686b1 Johnson Wang     2023-01-10  2317  		};
80d45ddb7686b1 Johnson Wang     2023-01-10  2318  
0d093046fe4ae1 Fei Shao         2024-07-22 @2319  		regulator_dvfs_vmm: regulator-dvfs-vmm {
a171784472954b Fred-LW Lu       2023-01-14  2320  			regulator-name = "dvfs-vmm";
a171784472954b Fred-LW Lu       2023-01-14  2321  			regulator-min-microvolt = <550000>;
a171784472954b Fred-LW Lu       2023-01-14  2322  			regulator-max-microvolt = <725000>;
a171784472954b Fred-LW Lu       2023-01-14  2323  		};
a171784472954b Fred-LW Lu       2023-01-14  2324  
a171784472954b Fred-LW Lu       2023-01-14  2325  		hcp: hcp@0 {
a171784472954b Fred-LW Lu       2023-01-14  2326  			compatible = "mediatek,hcp";
a171784472954b Fred-LW Lu       2023-01-14  2327  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  2328  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  2329  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
cb75f24663df84 Jason Chen       2024-03-15  2330  			mediatek,scp = <&scp_c1>;
a171784472954b Fred-LW Lu       2023-01-14  2331  			iommus = <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_0>,
a171784472954b Fred-LW Lu       2023-01-14  2332  				 <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_1>,
a171784472954b Fred-LW Lu       2023-01-14  2333  				 <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_4P_0>,
a171784472954b Fred-LW Lu       2023-01-14  2334  				 <&vpp_iommu M4U_PORT_L11B_WPE_RDMA_4P_1>,
a171784472954b Fred-LW Lu       2023-01-14  2335  				 <&vpp_iommu M4U_PORT_L11B_WPE_CQ0>,
a171784472954b Fred-LW Lu       2023-01-14  2336  				 <&vpp_iommu M4U_PORT_L11B_WPE_CQ1>,
a171784472954b Fred-LW Lu       2023-01-14  2337  				 <&vpp_iommu M4U_PORT_L11B_PIMGI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  2338  				 <&vpp_iommu M4U_PORT_L11B_PIMGBI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  2339  				 <&vpp_iommu M4U_PORT_L11B_PIMGCI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  2340  				 <&vpp_iommu M4U_PORT_L11B_IMGI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2341  				 <&vpp_iommu M4U_PORT_L11B_IMGBI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2342  				 <&vpp_iommu M4U_PORT_L11B_IMGCI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2343  				 <&vpp_iommu M4U_PORT_L11B_SMTI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2344  				 <&vpp_iommu M4U_PORT_L11B_SMTI_T4_C>,
a171784472954b Fred-LW Lu       2023-01-14  2345  				 <&vpp_iommu M4U_PORT_L11B_SMTI_T6_C>,
a171784472954b Fred-LW Lu       2023-01-14  2346  				 <&vpp_iommu M4U_PORT_L11B_YUVO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2347  				 <&vpp_iommu M4U_PORT_L11B_YUVBO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2348  				 <&vpp_iommu M4U_PORT_L11B_YUVCO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2349  				 <&vpp_iommu M4U_PORT_L11B_WPE_WDMA_0>,
a171784472954b Fred-LW Lu       2023-01-14  2350  				 <&vpp_iommu M4U_PORT_L11B_WPE_WDMA_4P_0>,
a171784472954b Fred-LW Lu       2023-01-14  2351  				 <&vpp_iommu M4U_PORT_L11B_WROT_P1>,
a171784472954b Fred-LW Lu       2023-01-14  2352  				 <&vpp_iommu M4U_PORT_L11B_TCCSO_P1>,
a171784472954b Fred-LW Lu       2023-01-14  2353  				 <&vpp_iommu M4U_PORT_L11B_TCCSI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  2354  				 <&vpp_iommu M4U_PORT_L11B_TIMGO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2355  				 <&vpp_iommu M4U_PORT_L11B_YUVO_T2_C>,
a171784472954b Fred-LW Lu       2023-01-14  2356  				 <&vpp_iommu M4U_PORT_L11B_YUVO_T5_C>,
a171784472954b Fred-LW Lu       2023-01-14  2357  				 <&vpp_iommu M4U_PORT_L11B_SMTO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  2358  				 <&vpp_iommu M4U_PORT_L11B_SMTO_T4_C>,
a171784472954b Fred-LW Lu       2023-01-14  2359  				 <&vpp_iommu M4U_PORT_L11B_SMTO_T6_C>,
a171784472954b Fred-LW Lu       2023-01-14  2360  				 <&vpp_iommu M4U_PORT_L11B_DBGO_T1_C>;
a171784472954b Fred-LW Lu       2023-01-14  2361  		};
a171784472954b Fred-LW Lu       2023-01-14  2362  
cbb0f8b948cfda Fei Shao         2024-06-14  2363  		hcp-l15 {
a171784472954b Fred-LW Lu       2023-01-14  2364  			compatible = "mediatek,imgsys-larb";
a171784472954b Fred-LW Lu       2023-01-14  2365  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  2366  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  2367  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
a171784472954b Fred-LW Lu       2023-01-14  2368  			iommus = <&vpp_iommu M4U_PORT_L15_VIPI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2369  				 <&vpp_iommu M4U_PORT_L15_VIPBI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2370  				 <&vpp_iommu M4U_PORT_L15_SMTI_D6>,
a171784472954b Fred-LW Lu       2023-01-14  2371  				 <&vpp_iommu M4U_PORT_L15_TNCSTI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2372  				 <&vpp_iommu M4U_PORT_L15_TNCSTI_D4>,
a171784472954b Fred-LW Lu       2023-01-14  2373  				 <&vpp_iommu M4U_PORT_L15_SMTI_D4>,
a171784472954b Fred-LW Lu       2023-01-14  2374  				 <&vpp_iommu M4U_PORT_L15_IMG3O_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2375  				 <&vpp_iommu M4U_PORT_L15_IMG3BO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2376  				 <&vpp_iommu M4U_PORT_L15_IMG3CO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2377  				 <&vpp_iommu M4U_PORT_L15_IMG2O_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2378  				 <&vpp_iommu M4U_PORT_L15_SMTI_D9>,
a171784472954b Fred-LW Lu       2023-01-14  2379  				 <&vpp_iommu M4U_PORT_L15_SMTO_D4>,
a171784472954b Fred-LW Lu       2023-01-14  2380  				 <&vpp_iommu M4U_PORT_L15_FEO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2381  				 <&vpp_iommu M4U_PORT_L15_TNCSO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2382  				 <&vpp_iommu M4U_PORT_L15_TNCSTO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2383  				 <&vpp_iommu M4U_PORT_L15_SMTO_D6>,
a171784472954b Fred-LW Lu       2023-01-14  2384  				 <&vpp_iommu M4U_PORT_L15_SMTO_D9>,
a171784472954b Fred-LW Lu       2023-01-14  2385  				 <&vpp_iommu M4U_PORT_L15_TNCO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  2386  				 <&vpp_iommu M4U_PORT_L15_TNCO_D1_N>;
a171784472954b Fred-LW Lu       2023-01-14  2387  		};
a171784472954b Fred-LW Lu       2023-01-14  2388  
cbb0f8b948cfda Fei Shao         2024-06-14  2389  		imgsys_fw: imgsys-fw@15000000 {
a171784472954b Fred-LW Lu       2023-01-14  2390  			compatible = "mediatek,imgsys";
a171784472954b Fred-LW Lu       2023-01-14  2391  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  2392  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  2393  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
a171784472954b Fred-LW Lu       2023-01-14  2394  			reg = <0 0x15000000 0 0x4000>,	/* 0 IMGSYS_TOP */
a171784472954b Fred-LW Lu       2023-01-14  2395  			      <0 0x15020000 0 0x10000>,	/* 1 IMGSYS_TRAW */
a171784472954b Fred-LW Lu       2023-01-14  2396  			      <0 0x15040000 0 0x10000>,	/* 2 IMGSYS_LTRAW */
a171784472954b Fred-LW Lu       2023-01-14  2397  			      <0 0x15640000 0 0x10000>,	/* 3 IMGSYS_XTRAW */
a171784472954b Fred-LW Lu       2023-01-14  2398  			      <0 0x15100000 0 0x10000>,	/* 4 IMGSYS_DIP */
a171784472954b Fred-LW Lu       2023-01-14  2399  			      <0 0x15150000 0 0x10000>,	/* 4 IMGSYS_DIP_NR */
a171784472954b Fred-LW Lu       2023-01-14  2400  			      <0 0x15210000 0 0x10000>,	/* 5 IMGSYS_PQDIP_A */
a171784472954b Fred-LW Lu       2023-01-14  2401  			      <0 0x15510000 0 0x10000>,	/* 6 IMGSYS_PQDIP_B */
a171784472954b Fred-LW Lu       2023-01-14  2402  			      <0 0x15200000 0 0x10000>,	/* 7 IMGSYS_WPE_EIS */
a171784472954b Fred-LW Lu       2023-01-14  2403  			      <0 0x15500000 0 0x10000>,	/* 8 IMGSYS_WPE_TNR */
a171784472954b Fred-LW Lu       2023-01-14  2404  			      <0 0x15600000 0 0x10000>,	/* 9 IMGSYS_WPE_LITE */
a171784472954b Fred-LW Lu       2023-01-14  2405  			      <0 0x15220000 0 0x00100>,	/* 10 IMGSYS_WPE1_DIP1 */
a171784472954b Fred-LW Lu       2023-01-14  2406  			      <0 0x15320000 0 0x10000>,	/* 11 IMGSYS_ME */
a171784472954b Fred-LW Lu       2023-01-14  2407  			      <0 0x00000000 0 0x01000>,	/* 12 IMGSYS_ADL_A */
a171784472954b Fred-LW Lu       2023-01-14  2408  			      <0 0x00000000 0 0x01000>,	/* 13 IMGSYS_ADL_B */
a171784472954b Fred-LW Lu       2023-01-14  2409  			      <0 0x15520000 0 0x00100>,	/* 14 IMGSYS_WPE2_DIP1 */
a171784472954b Fred-LW Lu       2023-01-14  2410  			      <0 0x15620000 0 0x00100>,	/* 15 IMGSYS_WPE3_DIP1 */
a171784472954b Fred-LW Lu       2023-01-14  2411  			      <0 0x15110000 0 0x00100>,	/* 16 IMGSYS_DIP_TOP */
a171784472954b Fred-LW Lu       2023-01-14  2412  			      <0 0x15130000 0 0x00100>;	/* 17 IMGSYS_DIP_TOP_NR */
cb75f24663df84 Jason Chen       2024-03-15  2413  			mediatek,scp = <&scp_c1>;
a171784472954b Fred-LW Lu       2023-01-14  2414  			mediatek,hcp = <&hcp>;
a171784472954b Fred-LW Lu       2023-01-14  2415  			mediatek,larbs = <&larb9>,
a171784472954b Fred-LW Lu       2023-01-14  2416  					 <&larb10>,
a171784472954b Fred-LW Lu       2023-01-14  2417  					 <&larb11a>,
a171784472954b Fred-LW Lu       2023-01-14  2418  					 <&larb11b>,
a171784472954b Fred-LW Lu       2023-01-14  2419  					 <&larb11c>,
a171784472954b Fred-LW Lu       2023-01-14  2420  					 <&larb15>;
a171784472954b Fred-LW Lu       2023-01-14  2421  			iommus = <&vdo_iommu M4U_PORT_L9_IMGI_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2422  				 <&vdo_iommu M4U_PORT_L9_UFDI_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2423  				 <&vdo_iommu M4U_PORT_L9_IMGBI_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2424  				 <&vdo_iommu M4U_PORT_L9_IMGCI_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2425  				 <&vdo_iommu M4U_PORT_L9_SMTI_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2426  				 <&vdo_iommu M4U_PORT_L9_SMTI_T4_A>,
a171784472954b Fred-LW Lu       2023-01-14  2427  				 <&vdo_iommu M4U_PORT_L9_TNCSTI_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2428  				 <&vdo_iommu M4U_PORT_L9_TNCSTI_T4_A>,
a171784472954b Fred-LW Lu       2023-01-14  2429  				 <&vdo_iommu M4U_PORT_L9_YUVO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2430  				 <&vdo_iommu M4U_PORT_L9_YUVBO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2431  				 <&vdo_iommu M4U_PORT_L9_YUVCO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2432  				 <&vdo_iommu M4U_PORT_L9_TIMGO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2433  				 <&vdo_iommu M4U_PORT_L9_YUVO_T2_A>,
a171784472954b Fred-LW Lu       2023-01-14  2434  				 <&vdo_iommu M4U_PORT_L9_YUVO_T5_A>,
a171784472954b Fred-LW Lu       2023-01-14  2435  				 <&vdo_iommu M4U_PORT_L9_IMGI_T1_B>,
a171784472954b Fred-LW Lu       2023-01-14  2436  				 <&vdo_iommu M4U_PORT_L9_IMGBI_T1_B>,
a171784472954b Fred-LW Lu       2023-01-14  2437  				 <&vdo_iommu M4U_PORT_L9_IMGCI_T1_B>,
a171784472954b Fred-LW Lu       2023-01-14  2438  				 <&vdo_iommu M4U_PORT_L9_SMTI_T4_B>,
a171784472954b Fred-LW Lu       2023-01-14  2439  				 <&vdo_iommu M4U_PORT_L9_TNCSO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2440  				 <&vdo_iommu M4U_PORT_L9_SMTO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2441  				 <&vdo_iommu M4U_PORT_L9_SMTO_T4_A>,
a171784472954b Fred-LW Lu       2023-01-14  2442  				 <&vdo_iommu M4U_PORT_L9_TNCSTO_T1_A>,
a171784472954b Fred-LW Lu       2023-01-14  2443  				 <&vdo_iommu M4U_PORT_L9_YUVO_T2_B>,
a171784472954b Fred-LW Lu       2023-01-14  2444  				 <&vdo_iommu M4U_PORT_L9_YUVO_T5_B>,
a171784472954b Fred-LW Lu       2023-01-14  2445  				 <&vdo_iommu M4U_PORT_L9_SMTO_T4_B>;
a171784472954b Fred-LW Lu       2023-01-14  2446  			mboxes = <&gce1 13 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2447  				 <&gce1 14 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2448  				 <&gce1 19 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2449  				 <&gce1 20 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2450  				 <&gce1 21 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2451  				 <&gce1 24 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2452  				 <&gce1 25 CMDQ_THR_PRIO_2>,
a171784472954b Fred-LW Lu       2023-01-14  2453  				 <&gce1 26 CMDQ_THR_PRIO_1>,
a171784472954b Fred-LW Lu       2023-01-14  2454  				 <&gce1 27 CMDQ_THR_PRIO_1>,
a171784472954b Fred-LW Lu       2023-01-14  2455  				 <&gce1 28 CMDQ_THR_PRIO_1>;
a171784472954b Fred-LW Lu       2023-01-14  2456  			traw_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2457  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2458  			traw_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2459  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2460  			traw_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2461  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2462  			traw_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2463  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2464  			traw_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2465  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2466  			traw_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2467  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2468  			traw_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2469  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2470  			traw_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2471  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2472  			traw_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2473  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2474  			traw_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2475  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW0_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2476  			ltraw_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2477  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2478  			ltraw_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2479  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2480  			ltraw_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2481  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2482  			ltraw_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2483  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2484  			ltraw_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2485  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2486  			ltraw_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2487  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2488  			ltraw_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2489  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2490  			ltraw_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2491  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2492  			ltraw_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2493  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2494  			ltraw_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2495  				/bits/ 16 <CMDQ_EVENT_IMG_TRAW1_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2496  			xtraw_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2497  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2498  			xtraw_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2499  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2500  			xtraw_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2501  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2502  			xtraw_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2503  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2504  			xtraw_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2505  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2506  			xtraw_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2507  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2508  			xtraw_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2509  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2510  			xtraw_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2511  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2512  			xtraw_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2513  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2514  			xtraw_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2515  				/bits/ 16 <CMDQ_EVENT_IMG_XTRAW_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2516  			dip_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2517  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2518  			dip_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2519  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2520  			dip_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2521  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2522  			dip_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2523  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2524  			dip_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2525  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2526  			dip_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2527  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2528  			dip_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2529  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2530  			dip_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2531  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2532  			dip_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2533  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2534  			dip_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2535  				/bits/ 16 <CMDQ_EVENT_IMG_DIP_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2536  			pqa_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2537  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2538  			pqa_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2539  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2540  			pqa_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2541  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2542  			pqa_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2543  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2544  			pqa_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2545  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2546  			pqa_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2547  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2548  			pqa_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2549  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2550  			pqa_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2551  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2552  			pqa_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2553  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2554  			pqa_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2555  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_A_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2556  			pqb_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2557  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2558  			pqb_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2559  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2560  			pqb_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2561  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2562  			pqb_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2563  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2564  			pqb_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2565  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2566  			pqb_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2567  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2568  			pqb_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2569  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2570  			pqb_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2571  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2572  			pqb_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2573  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2574  			pqb_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2575  				/bits/ 16 <CMDQ_EVENT_IMG_PQDIP_B_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2576  			wpe_eis_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2577  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2578  			wpe_eis_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2579  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2580  			wpe_eis_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2581  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2582  			wpe_eis_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2583  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2584  			wpe_eis_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2585  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2586  			wpe_eis_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2587  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2588  			wpe_eis_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2589  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2590  			wpe_eis_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2591  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2592  			wpe_eis_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2593  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2594  			wpe_eis_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2595  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_EIS_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2596  			wpe_tnr_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2597  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2598  			wpe_tnr_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2599  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2600  			wpe_tnr_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2601  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2602  			wpe_tnr_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2603  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2604  			wpe_tnr_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2605  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2606  			wpe_tnr_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2607  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2608  			wpe_tnr_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2609  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2610  			wpe_tnr_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2611  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2612  			wpe_tnr_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2613  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2614  			wpe_tnr_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2615  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_TNR_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2616  			wpe_lite_cq_thread0_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2617  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_0>;
a171784472954b Fred-LW Lu       2023-01-14  2618  			wpe_lite_cq_thread1_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2619  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_1>;
a171784472954b Fred-LW Lu       2023-01-14  2620  			wpe_lite_cq_thread2_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2621  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_2>;
a171784472954b Fred-LW Lu       2023-01-14  2622  			wpe_lite_cq_thread3_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2623  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_3>;
a171784472954b Fred-LW Lu       2023-01-14  2624  			wpe_lite_cq_thread4_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2625  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_4>;
a171784472954b Fred-LW Lu       2023-01-14  2626  			wpe_lite_cq_thread5_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2627  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_5>;
a171784472954b Fred-LW Lu       2023-01-14  2628  			wpe_lite_cq_thread6_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2629  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_6>;
a171784472954b Fred-LW Lu       2023-01-14  2630  			wpe_lite_cq_thread7_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2631  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_7>;
a171784472954b Fred-LW Lu       2023-01-14  2632  			wpe_lite_cq_thread8_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2633  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_8>;
a171784472954b Fred-LW Lu       2023-01-14  2634  			wpe_lite_cq_thread9_frame_done =
a171784472954b Fred-LW Lu       2023-01-14  2635  				/bits/ 16 <CMDQ_EVENT_IMG_WPE_LITE_CQ_THR_DONE_9>;
a171784472954b Fred-LW Lu       2023-01-14  2636  			me_done =
a171784472954b Fred-LW Lu       2023-01-14  2637  				/bits/ 16 <CMDQ_EVENT_IMG_IMGSYS_IPE_ME_DONE>;
a171784472954b Fred-LW Lu       2023-01-14  2638  			adl_tile_done =
a171784472954b Fred-LW Lu       2023-01-14  2639  				/bits/ 16 <CMDQ_EVENT_IMG_ADL_RESERVED>;
a171784472954b Fred-LW Lu       2023-01-14  2640  			wpe_eis_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2641  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_WPE_EIS>;
a171784472954b Fred-LW Lu       2023-01-14  2642  			wpe_tnr_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2643  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_WPE_TNR>;
a171784472954b Fred-LW Lu       2023-01-14  2644  			wpe_lite_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2645  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_WPE_LITE>;
a171784472954b Fred-LW Lu       2023-01-14  2646  			traw_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2647  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_TRAW>;
a171784472954b Fred-LW Lu       2023-01-14  2648  			ltraw_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2649  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_LTRAW>;
a171784472954b Fred-LW Lu       2023-01-14  2650  			xtraw_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2651  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_XTRAW>;
a171784472954b Fred-LW Lu       2023-01-14  2652  			dip_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2653  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_DIP>;
a171784472954b Fred-LW Lu       2023-01-14  2654  			pqdip_a_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2655  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_PQDIP_A>;
a171784472954b Fred-LW Lu       2023-01-14  2656  			pqdip_b_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2657  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_PQDIP_B>;
a171784472954b Fred-LW Lu       2023-01-14  2658  			me_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2659  				/bits/ 16 <CMDQ_SYNC_TOKEN_IPESYS_ME>;
a171784472954b Fred-LW Lu       2023-01-14  2660  			vss_traw_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2661  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_VSS_TRAW>;
a171784472954b Fred-LW Lu       2023-01-14  2662  			vss_ltraw_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2663  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_VSS_LTRAW>;
a171784472954b Fred-LW Lu       2023-01-14  2664  			vss_xtraw_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2665  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_VSS_XTRAW>;
a171784472954b Fred-LW Lu       2023-01-14  2666  			vss_dip_sync_token =
a171784472954b Fred-LW Lu       2023-01-14  2667  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_VSS_DIP>;
a171784472954b Fred-LW Lu       2023-01-14  2668  			sw_sync_token_pool_1 =
a171784472954b Fred-LW Lu       2023-01-14  2669  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_1>;
a171784472954b Fred-LW Lu       2023-01-14  2670  			sw_sync_token_pool_2 =
a171784472954b Fred-LW Lu       2023-01-14  2671  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_2>;
a171784472954b Fred-LW Lu       2023-01-14  2672  			sw_sync_token_pool_3 =
a171784472954b Fred-LW Lu       2023-01-14  2673  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_3>;
a171784472954b Fred-LW Lu       2023-01-14  2674  			sw_sync_token_pool_4 =
a171784472954b Fred-LW Lu       2023-01-14  2675  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_4>;
a171784472954b Fred-LW Lu       2023-01-14  2676  			sw_sync_token_pool_5 =
a171784472954b Fred-LW Lu       2023-01-14  2677  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_5>;
a171784472954b Fred-LW Lu       2023-01-14  2678  			sw_sync_token_pool_6 =
a171784472954b Fred-LW Lu       2023-01-14  2679  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_6>;
a171784472954b Fred-LW Lu       2023-01-14  2680  			sw_sync_token_pool_7 =
a171784472954b Fred-LW Lu       2023-01-14  2681  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_7>;
a171784472954b Fred-LW Lu       2023-01-14  2682  			sw_sync_token_pool_8 =
a171784472954b Fred-LW Lu       2023-01-14  2683  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_8>;
a171784472954b Fred-LW Lu       2023-01-14  2684  			sw_sync_token_pool_9 =
a171784472954b Fred-LW Lu       2023-01-14  2685  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_9>;
a171784472954b Fred-LW Lu       2023-01-14  2686  			sw_sync_token_pool_10 =
a171784472954b Fred-LW Lu       2023-01-14  2687  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_10>;
a171784472954b Fred-LW Lu       2023-01-14  2688  			sw_sync_token_pool_11 =
a171784472954b Fred-LW Lu       2023-01-14  2689  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_11>;
a171784472954b Fred-LW Lu       2023-01-14  2690  			sw_sync_token_pool_12 =
a171784472954b Fred-LW Lu       2023-01-14  2691  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_12>;
a171784472954b Fred-LW Lu       2023-01-14  2692  			sw_sync_token_pool_13 =
a171784472954b Fred-LW Lu       2023-01-14  2693  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_13>;
a171784472954b Fred-LW Lu       2023-01-14  2694  			sw_sync_token_pool_14 =
a171784472954b Fred-LW Lu       2023-01-14  2695  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_14>;
a171784472954b Fred-LW Lu       2023-01-14  2696  			sw_sync_token_pool_15 =
a171784472954b Fred-LW Lu       2023-01-14  2697  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_15>;
a171784472954b Fred-LW Lu       2023-01-14  2698  			sw_sync_token_pool_16 =
a171784472954b Fred-LW Lu       2023-01-14  2699  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_16>;
a171784472954b Fred-LW Lu       2023-01-14  2700  			sw_sync_token_pool_17 =
a171784472954b Fred-LW Lu       2023-01-14  2701  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_17>;
a171784472954b Fred-LW Lu       2023-01-14  2702  			sw_sync_token_pool_18 =
a171784472954b Fred-LW Lu       2023-01-14  2703  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_18>;
a171784472954b Fred-LW Lu       2023-01-14  2704  			sw_sync_token_pool_19 =
a171784472954b Fred-LW Lu       2023-01-14  2705  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_19>;
a171784472954b Fred-LW Lu       2023-01-14  2706  			sw_sync_token_pool_20 =
a171784472954b Fred-LW Lu       2023-01-14  2707  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_20>;
a171784472954b Fred-LW Lu       2023-01-14  2708  			sw_sync_token_pool_21 =
a171784472954b Fred-LW Lu       2023-01-14  2709  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_21>;
a171784472954b Fred-LW Lu       2023-01-14  2710  			sw_sync_token_pool_22 =
a171784472954b Fred-LW Lu       2023-01-14  2711  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_22>;
a171784472954b Fred-LW Lu       2023-01-14  2712  			sw_sync_token_pool_23 =
a171784472954b Fred-LW Lu       2023-01-14  2713  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_23>;
a171784472954b Fred-LW Lu       2023-01-14  2714  			sw_sync_token_pool_24 =
a171784472954b Fred-LW Lu       2023-01-14  2715  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_24>;
a171784472954b Fred-LW Lu       2023-01-14  2716  			sw_sync_token_pool_25 =
a171784472954b Fred-LW Lu       2023-01-14  2717  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_25>;
a171784472954b Fred-LW Lu       2023-01-14  2718  			sw_sync_token_pool_26 =
a171784472954b Fred-LW Lu       2023-01-14  2719  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_26>;
a171784472954b Fred-LW Lu       2023-01-14  2720  			sw_sync_token_pool_27 =
a171784472954b Fred-LW Lu       2023-01-14  2721  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_27>;
a171784472954b Fred-LW Lu       2023-01-14  2722  			sw_sync_token_pool_28 =
a171784472954b Fred-LW Lu       2023-01-14  2723  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_28>;
a171784472954b Fred-LW Lu       2023-01-14  2724  			sw_sync_token_pool_29 =
a171784472954b Fred-LW Lu       2023-01-14  2725  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_29>;
a171784472954b Fred-LW Lu       2023-01-14  2726  			sw_sync_token_pool_30 =
a171784472954b Fred-LW Lu       2023-01-14  2727  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_30>;
a171784472954b Fred-LW Lu       2023-01-14  2728  			sw_sync_token_pool_31 =
a171784472954b Fred-LW Lu       2023-01-14  2729  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_31>;
a171784472954b Fred-LW Lu       2023-01-14  2730  			sw_sync_token_pool_32 =
a171784472954b Fred-LW Lu       2023-01-14  2731  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_32>;
a171784472954b Fred-LW Lu       2023-01-14  2732  			sw_sync_token_pool_33 =
a171784472954b Fred-LW Lu       2023-01-14  2733  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_33>;
a171784472954b Fred-LW Lu       2023-01-14  2734  			sw_sync_token_pool_34 =
a171784472954b Fred-LW Lu       2023-01-14  2735  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_34>;
a171784472954b Fred-LW Lu       2023-01-14  2736  			sw_sync_token_pool_35 =
a171784472954b Fred-LW Lu       2023-01-14  2737  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_35>;
a171784472954b Fred-LW Lu       2023-01-14  2738  			sw_sync_token_pool_36 =
a171784472954b Fred-LW Lu       2023-01-14  2739  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_36>;
a171784472954b Fred-LW Lu       2023-01-14  2740  			sw_sync_token_pool_37 =
a171784472954b Fred-LW Lu       2023-01-14  2741  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_37>;
a171784472954b Fred-LW Lu       2023-01-14  2742  			sw_sync_token_pool_38 =
a171784472954b Fred-LW Lu       2023-01-14  2743  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_38>;
a171784472954b Fred-LW Lu       2023-01-14  2744  			sw_sync_token_pool_39 =
a171784472954b Fred-LW Lu       2023-01-14  2745  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_39>;
a171784472954b Fred-LW Lu       2023-01-14  2746  			sw_sync_token_pool_40 =
a171784472954b Fred-LW Lu       2023-01-14  2747  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_40>;
a171784472954b Fred-LW Lu       2023-01-14  2748  			sw_sync_token_pool_41 =
a171784472954b Fred-LW Lu       2023-01-14  2749  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_41>;
a171784472954b Fred-LW Lu       2023-01-14  2750  			sw_sync_token_pool_42 =
a171784472954b Fred-LW Lu       2023-01-14  2751  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_42>;
a171784472954b Fred-LW Lu       2023-01-14  2752  			sw_sync_token_pool_43 =
a171784472954b Fred-LW Lu       2023-01-14  2753  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_43>;
a171784472954b Fred-LW Lu       2023-01-14  2754  			sw_sync_token_pool_44 =
a171784472954b Fred-LW Lu       2023-01-14  2755  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_44>;
a171784472954b Fred-LW Lu       2023-01-14  2756  			sw_sync_token_pool_45 =
a171784472954b Fred-LW Lu       2023-01-14  2757  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_45>;
a171784472954b Fred-LW Lu       2023-01-14  2758  			sw_sync_token_pool_46 =
a171784472954b Fred-LW Lu       2023-01-14  2759  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_46>;
a171784472954b Fred-LW Lu       2023-01-14  2760  			sw_sync_token_pool_47 =
a171784472954b Fred-LW Lu       2023-01-14  2761  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_47>;
a171784472954b Fred-LW Lu       2023-01-14  2762  			sw_sync_token_pool_48 =
a171784472954b Fred-LW Lu       2023-01-14  2763  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_48>;
a171784472954b Fred-LW Lu       2023-01-14  2764  			sw_sync_token_pool_49 =
a171784472954b Fred-LW Lu       2023-01-14  2765  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_49>;
a171784472954b Fred-LW Lu       2023-01-14  2766  			sw_sync_token_pool_50 =
a171784472954b Fred-LW Lu       2023-01-14  2767  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_50>;
a171784472954b Fred-LW Lu       2023-01-14  2768  			sw_sync_token_pool_51 =
a171784472954b Fred-LW Lu       2023-01-14  2769  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_51>;
a171784472954b Fred-LW Lu       2023-01-14  2770  			sw_sync_token_pool_52 =
a171784472954b Fred-LW Lu       2023-01-14  2771  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_52>;
a171784472954b Fred-LW Lu       2023-01-14  2772  			sw_sync_token_pool_53 =
a171784472954b Fred-LW Lu       2023-01-14  2773  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_53>;
a171784472954b Fred-LW Lu       2023-01-14  2774  			sw_sync_token_pool_54 =
a171784472954b Fred-LW Lu       2023-01-14  2775  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_54>;
a171784472954b Fred-LW Lu       2023-01-14  2776  			sw_sync_token_pool_55 =
a171784472954b Fred-LW Lu       2023-01-14  2777  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_55>;
a171784472954b Fred-LW Lu       2023-01-14  2778  			sw_sync_token_pool_56 =
a171784472954b Fred-LW Lu       2023-01-14  2779  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_56>;
a171784472954b Fred-LW Lu       2023-01-14  2780  			sw_sync_token_pool_57 =
a171784472954b Fred-LW Lu       2023-01-14  2781  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_57>;
a171784472954b Fred-LW Lu       2023-01-14  2782  			sw_sync_token_pool_58 =
a171784472954b Fred-LW Lu       2023-01-14  2783  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_58>;
a171784472954b Fred-LW Lu       2023-01-14  2784  			sw_sync_token_pool_59 =
a171784472954b Fred-LW Lu       2023-01-14  2785  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_59>;
a171784472954b Fred-LW Lu       2023-01-14  2786  			sw_sync_token_pool_60 =
a171784472954b Fred-LW Lu       2023-01-14  2787  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_60>;
a171784472954b Fred-LW Lu       2023-01-14  2788  			sw_sync_token_tzmp_isp_wait =
a171784472954b Fred-LW Lu       2023-01-14  2789  				/bits/ 16 <CMDQ_SYNC_TOKEN_TZMP_ISP_WAIT>;
a171784472954b Fred-LW Lu       2023-01-14  2790  			sw_sync_token_tzmp_isp_set =
a171784472954b Fred-LW Lu       2023-01-14  2791  				/bits/ 16 <CMDQ_SYNC_TOKEN_TZMP_ISP_SET>;
a171784472954b Fred-LW Lu       2023-01-14  2792  #if 0
a171784472954b Fred-LW Lu       2023-01-14  2793  			sw_sync_token_pool_61 =
a171784472954b Fred-LW Lu       2023-01-14  2794  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_61>;
a171784472954b Fred-LW Lu       2023-01-14  2795  			sw_sync_token_pool_62 =
a171784472954b Fred-LW Lu       2023-01-14  2796  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_62>;
a171784472954b Fred-LW Lu       2023-01-14  2797  			sw_sync_token_pool_63 =
a171784472954b Fred-LW Lu       2023-01-14  2798  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_63>;
a171784472954b Fred-LW Lu       2023-01-14  2799  			sw_sync_token_pool_64 =
a171784472954b Fred-LW Lu       2023-01-14  2800  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_64>;
a171784472954b Fred-LW Lu       2023-01-14  2801  			sw_sync_token_pool_65 =
a171784472954b Fred-LW Lu       2023-01-14  2802  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_65>;
a171784472954b Fred-LW Lu       2023-01-14  2803  			sw_sync_token_pool_66 =
a171784472954b Fred-LW Lu       2023-01-14  2804  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_66>;
a171784472954b Fred-LW Lu       2023-01-14  2805  			sw_sync_token_pool_67 =
a171784472954b Fred-LW Lu       2023-01-14  2806  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_67>;
a171784472954b Fred-LW Lu       2023-01-14  2807  			sw_sync_token_pool_68 =
a171784472954b Fred-LW Lu       2023-01-14  2808  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_68>;
a171784472954b Fred-LW Lu       2023-01-14  2809  			sw_sync_token_pool_69 =
a171784472954b Fred-LW Lu       2023-01-14  2810  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_69>;
a171784472954b Fred-LW Lu       2023-01-14  2811  			sw_sync_token_pool_70 =
a171784472954b Fred-LW Lu       2023-01-14  2812  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_70>;
a171784472954b Fred-LW Lu       2023-01-14  2813  			sw_sync_token_pool_71 =
a171784472954b Fred-LW Lu       2023-01-14  2814  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_71>;
a171784472954b Fred-LW Lu       2023-01-14  2815  			sw_sync_token_pool_72 =
a171784472954b Fred-LW Lu       2023-01-14  2816  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_72>;
a171784472954b Fred-LW Lu       2023-01-14  2817  			sw_sync_token_pool_73 =
a171784472954b Fred-LW Lu       2023-01-14  2818  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_73>;
a171784472954b Fred-LW Lu       2023-01-14  2819  			sw_sync_token_pool_74 =
a171784472954b Fred-LW Lu       2023-01-14  2820  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_74>;
a171784472954b Fred-LW Lu       2023-01-14  2821  			sw_sync_token_pool_75 =
a171784472954b Fred-LW Lu       2023-01-14  2822  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_75>;
a171784472954b Fred-LW Lu       2023-01-14  2823  			sw_sync_token_pool_76 =
a171784472954b Fred-LW Lu       2023-01-14  2824  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_76>;
a171784472954b Fred-LW Lu       2023-01-14  2825  			sw_sync_token_pool_77 =
a171784472954b Fred-LW Lu       2023-01-14  2826  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_77>;
a171784472954b Fred-LW Lu       2023-01-14  2827  			sw_sync_token_pool_78 =
a171784472954b Fred-LW Lu       2023-01-14  2828  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_78>;
a171784472954b Fred-LW Lu       2023-01-14  2829  			sw_sync_token_pool_79 =
a171784472954b Fred-LW Lu       2023-01-14  2830  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_79>;
a171784472954b Fred-LW Lu       2023-01-14  2831  			sw_sync_token_pool_80 =
a171784472954b Fred-LW Lu       2023-01-14  2832  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_80>;
a171784472954b Fred-LW Lu       2023-01-14  2833  			sw_sync_token_pool_81 =
a171784472954b Fred-LW Lu       2023-01-14  2834  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_81>;
a171784472954b Fred-LW Lu       2023-01-14  2835  			sw_sync_token_pool_82 =
a171784472954b Fred-LW Lu       2023-01-14  2836  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_82>;
a171784472954b Fred-LW Lu       2023-01-14  2837  			sw_sync_token_pool_83 =
a171784472954b Fred-LW Lu       2023-01-14  2838  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_83>;
a171784472954b Fred-LW Lu       2023-01-14  2839  			sw_sync_token_pool_84 =
a171784472954b Fred-LW Lu       2023-01-14  2840  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_84>;
a171784472954b Fred-LW Lu       2023-01-14  2841  			sw_sync_token_pool_85 =
a171784472954b Fred-LW Lu       2023-01-14  2842  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_85>;
a171784472954b Fred-LW Lu       2023-01-14  2843  			sw_sync_token_pool_86 =
a171784472954b Fred-LW Lu       2023-01-14  2844  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_86>;
a171784472954b Fred-LW Lu       2023-01-14  2845  			sw_sync_token_pool_87 =
a171784472954b Fred-LW Lu       2023-01-14  2846  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_87>;
a171784472954b Fred-LW Lu       2023-01-14  2847  			sw_sync_token_pool_88 =
a171784472954b Fred-LW Lu       2023-01-14  2848  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_88>;
a171784472954b Fred-LW Lu       2023-01-14  2849  			sw_sync_token_pool_89 =
a171784472954b Fred-LW Lu       2023-01-14  2850  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_89>;
a171784472954b Fred-LW Lu       2023-01-14  2851  			sw_sync_token_pool_90 =
a171784472954b Fred-LW Lu       2023-01-14  2852  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_90>;
a171784472954b Fred-LW Lu       2023-01-14  2853  			sw_sync_token_pool_91 =
a171784472954b Fred-LW Lu       2023-01-14  2854  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_91>;
a171784472954b Fred-LW Lu       2023-01-14  2855  			sw_sync_token_pool_92 =
a171784472954b Fred-LW Lu       2023-01-14  2856  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_92>;
a171784472954b Fred-LW Lu       2023-01-14  2857  			sw_sync_token_pool_93 =
a171784472954b Fred-LW Lu       2023-01-14  2858  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_93>;
a171784472954b Fred-LW Lu       2023-01-14  2859  			sw_sync_token_pool_94 =
a171784472954b Fred-LW Lu       2023-01-14  2860  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_94>;
a171784472954b Fred-LW Lu       2023-01-14  2861  			sw_sync_token_pool_95 =
a171784472954b Fred-LW Lu       2023-01-14  2862  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_95>;
a171784472954b Fred-LW Lu       2023-01-14  2863  			sw_sync_token_pool_96 =
a171784472954b Fred-LW Lu       2023-01-14  2864  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_96>;
a171784472954b Fred-LW Lu       2023-01-14  2865  			sw_sync_token_pool_97 =
a171784472954b Fred-LW Lu       2023-01-14  2866  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_97>;
a171784472954b Fred-LW Lu       2023-01-14  2867  			sw_sync_token_pool_98 =
a171784472954b Fred-LW Lu       2023-01-14  2868  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_98>;
a171784472954b Fred-LW Lu       2023-01-14  2869  			sw_sync_token_pool_99 =
a171784472954b Fred-LW Lu       2023-01-14  2870  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_99>;
a171784472954b Fred-LW Lu       2023-01-14  2871  			sw_sync_token_pool_100 =
a171784472954b Fred-LW Lu       2023-01-14  2872  				/bits/ 16 <CMDQ_SYNC_TOKEN_IMGSYS_POOL_100>;
a171784472954b Fred-LW Lu       2023-01-14  2873  #endif
a171784472954b Fred-LW Lu       2023-01-14  2874  			sw_sync_token_camsys_pool_1 =
a171784472954b Fred-LW Lu       2023-01-14  2875  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_1>;
a171784472954b Fred-LW Lu       2023-01-14  2876  			sw_sync_token_camsys_pool_2 =
a171784472954b Fred-LW Lu       2023-01-14  2877  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_2>;
a171784472954b Fred-LW Lu       2023-01-14  2878  			sw_sync_token_camsys_pool_3 =
a171784472954b Fred-LW Lu       2023-01-14  2879  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_3>;
a171784472954b Fred-LW Lu       2023-01-14  2880  			sw_sync_token_camsys_pool_4 =
a171784472954b Fred-LW Lu       2023-01-14  2881  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_4>;
a171784472954b Fred-LW Lu       2023-01-14  2882  			sw_sync_token_camsys_pool_5 =
a171784472954b Fred-LW Lu       2023-01-14  2883  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_5>;
a171784472954b Fred-LW Lu       2023-01-14  2884  			sw_sync_token_camsys_pool_6 =
a171784472954b Fred-LW Lu       2023-01-14  2885  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_6>;
a171784472954b Fred-LW Lu       2023-01-14  2886  			sw_sync_token_camsys_pool_7 =
a171784472954b Fred-LW Lu       2023-01-14  2887  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_7>;
a171784472954b Fred-LW Lu       2023-01-14  2888  			sw_sync_token_camsys_pool_8 =
a171784472954b Fred-LW Lu       2023-01-14  2889  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_8>;
a171784472954b Fred-LW Lu       2023-01-14  2890  			sw_sync_token_camsys_pool_9 =
a171784472954b Fred-LW Lu       2023-01-14  2891  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_9>;
a171784472954b Fred-LW Lu       2023-01-14  2892  			sw_sync_token_camsys_pool_10 =
a171784472954b Fred-LW Lu       2023-01-14  2893  				/bits/ 16 <CMDQ_SYNC_TOKEN_CAMSYS_POOL_10>;
a171784472954b Fred-LW Lu       2023-01-14  2894  			clocks = <&imgsys CLK_IMGSYS_MAIN_TRAW0>,
a171784472954b Fred-LW Lu       2023-01-14  2895  				 <&imgsys CLK_IMGSYS_MAIN_TRAW1>,
a171784472954b Fred-LW Lu       2023-01-14  2896  				 <&imgsys CLK_IMGSYS_MAIN_VCORE_GALS>,
a171784472954b Fred-LW Lu       2023-01-14  2897  				 <&imgsys CLK_IMGSYS_MAIN_DIP0>,
a171784472954b Fred-LW Lu       2023-01-14  2898  				 <&imgsys CLK_IMGSYS_MAIN_WPE0>,
a171784472954b Fred-LW Lu       2023-01-14  2899  				 <&imgsys CLK_IMGSYS_MAIN_WPE1>,
a171784472954b Fred-LW Lu       2023-01-14  2900  				 <&imgsys CLK_IMGSYS_MAIN_WPE2>,
a171784472954b Fred-LW Lu       2023-01-14  2901  				 <&imgsys CLK_IMGSYS_MAIN_WPE0>,
a171784472954b Fred-LW Lu       2023-01-14  2902  				 <&imgsys CLK_IMGSYS_MAIN_WPE1>,
a171784472954b Fred-LW Lu       2023-01-14  2903  				 <&imgsys CLK_IMGSYS_MAIN_WPE2>,
a171784472954b Fred-LW Lu       2023-01-14  2904  				 <&imgsys CLK_IMGSYS_MAIN_GALS>,
a171784472954b Fred-LW Lu       2023-01-14  2905  				 <&imgsys1_dip_top CLK_IMGSYS1_DIP_TOP_DIP_TOP>,
a171784472954b Fred-LW Lu       2023-01-14  2906  				 <&imgsys1_dip_nr CLK_IMGSYS1_DIP_NR_DIP_NR>,
a171784472954b Fred-LW Lu       2023-01-14  2907  				 <&imgsys_wpe1 CLK_IMGSYS_WPE1>,
a171784472954b Fred-LW Lu       2023-01-14  2908  				 <&imgsys_wpe2 CLK_IMGSYS_WPE2>,
a171784472954b Fred-LW Lu       2023-01-14  2909  				 <&imgsys_wpe3 CLK_IMGSYS_WPE3>,
a171784472954b Fred-LW Lu       2023-01-14  2910  				 <&imgsys CLK_IMGSYS_MAIN_IPE>;
a171784472954b Fred-LW Lu       2023-01-14  2911  
a171784472954b Fred-LW Lu       2023-01-14  2912  			clock-names = "IMGSYS_CG_IMG_TRAW0",
a171784472954b Fred-LW Lu       2023-01-14  2913  				      "IMGSYS_CG_IMG_TRAW1",
a171784472954b Fred-LW Lu       2023-01-14  2914  				      "IMGSYS_CG_IMG_VCORE_GALS",
a171784472954b Fred-LW Lu       2023-01-14  2915  				      "IMGSYS_CG_IMG_DIP0",
a171784472954b Fred-LW Lu       2023-01-14  2916  				      "IMGSYS_CG_IMG_WPE0",
a171784472954b Fred-LW Lu       2023-01-14  2917  				      "IMGSYS_CG_IMG_WPE1",
a171784472954b Fred-LW Lu       2023-01-14  2918  				      "IMGSYS_CG_IMG_WPE2",
a171784472954b Fred-LW Lu       2023-01-14  2919  				      "IMGSYS_CG_IMG_ADL_LARB",
a171784472954b Fred-LW Lu       2023-01-14  2920  				      "IMGSYS_CG_IMG_ADL_TOP0",
a171784472954b Fred-LW Lu       2023-01-14  2921  				      "IMGSYS_CG_IMG_ADL_TOP1",
a171784472954b Fred-LW Lu       2023-01-14  2922  				      "IMGSYS_CG_IMG_GALS",
a171784472954b Fred-LW Lu       2023-01-14  2923  				      "DIP_TOP_DIP_TOP",
a171784472954b Fred-LW Lu       2023-01-14  2924  				      "DIP_NR_DIP_NR",
a171784472954b Fred-LW Lu       2023-01-14  2925  				      "WPE1_CG_DIP1_WPE",
a171784472954b Fred-LW Lu       2023-01-14  2926  				      "WPE2_CG_DIP1_WPE",
a171784472954b Fred-LW Lu       2023-01-14  2927  				      "WPE3_CG_DIP1_WPE",
a171784472954b Fred-LW Lu       2023-01-14  2928  				      "ME_CG_IPE";
a171784472954b Fred-LW Lu       2023-01-14  2929  
0d093046fe4ae1 Fei Shao         2024-07-22  2930  			operating-points-v2 = <&img_opp_table>, <&ipe_opp_table>;
0d093046fe4ae1 Fei Shao         2024-07-22  2931  			dvfsrc-vmm-supply = <&regulator_dvfs_vmm>;
782ebf1a9aeb1d Bruce Cheng      2023-06-14  2932  			assigned-clocks = <&topckgen CLK_TOP_IMG>;
782ebf1a9aeb1d Bruce Cheng      2023-06-14  2933  			assigned-clock-parents = <&apmixedsys CLK_APMIXED_IMGPLL>;
a171784472954b Fred-LW Lu       2023-01-14  2934  #if 0
a171784472954b Fred-LW Lu       2023-01-14  2935  			interconnects =
a171784472954b Fred-LW Lu       2023-01-14  2936  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_IMGI_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2937  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2938  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_UFDI_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2939  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2940  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_IMGBI_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2941  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2942  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_IMGCI_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2943  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2944  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_SMTI_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2945  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2946  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_SMTI_T4_A)
a171784472954b Fred-LW Lu       2023-01-14  2947  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2948  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_TNCSTI_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2949  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2950  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_TNCSTI_T4_A)
a171784472954b Fred-LW Lu       2023-01-14  2951  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2952  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2953  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2954  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVBO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2955  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2956  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVCO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2957  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2958  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_TIMGO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2959  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2960  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVO_T2_A)
a171784472954b Fred-LW Lu       2023-01-14  2961  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2962  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVO_T5_A)
a171784472954b Fred-LW Lu       2023-01-14  2963  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2964  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_IMGI_T1_B)
a171784472954b Fred-LW Lu       2023-01-14  2965  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2966  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_IMGBI_T1_B)
a171784472954b Fred-LW Lu       2023-01-14  2967  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2968  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_IMGCI_T1_B)
a171784472954b Fred-LW Lu       2023-01-14  2969  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2970  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_SMTI_T4_B)
a171784472954b Fred-LW Lu       2023-01-14  2971  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2972  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_TNCSO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2973  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2974  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_SMTO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2975  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2976  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_SMTO_T4_A)
a171784472954b Fred-LW Lu       2023-01-14  2977  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2978  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_TNCSTO_T1_A)
a171784472954b Fred-LW Lu       2023-01-14  2979  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2980  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVO_T2_B)
a171784472954b Fred-LW Lu       2023-01-14  2981  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2982  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_YUVO_T5_B)
a171784472954b Fred-LW Lu       2023-01-14  2983  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2984  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L9_SMTO_T4_B)
a171784472954b Fred-LW Lu       2023-01-14  2985  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2986  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_IMGI_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  2987  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2988  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_IMGBI_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  2989  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2990  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_IMGCI_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  2991  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2992  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_SMTI_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  2993  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2994  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_SMTI_T4_C)
a171784472954b Fred-LW Lu       2023-01-14  2995  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2996  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_SMTI_T6_C)
a171784472954b Fred-LW Lu       2023-01-14  2997  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  2998  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_YUVO_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  2999  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3000  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_YUVBO_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  3001  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3002  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_YUVCO_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  3003  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3004  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_TIMGO_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  3005  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3006  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_YUVO_T2_C)
a171784472954b Fred-LW Lu       2023-01-14  3007  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3008  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_YUVO_T5_C)
a171784472954b Fred-LW Lu       2023-01-14  3009  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3010  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_SMTO_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  3011  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3012  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_SMTO_T4_C)
a171784472954b Fred-LW Lu       2023-01-14  3013  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3014  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_SMTO_T6_C)
a171784472954b Fred-LW Lu       2023-01-14  3015  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3016  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_DBGO_T1_C)
a171784472954b Fred-LW Lu       2023-01-14  3017  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3018  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_IMGI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3019  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3020  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_IMGBI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3021  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3022  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_IMGCI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3023  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3024  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_IMGDI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3025  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3026  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_DEPI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3027  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3028  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_DMGI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3029  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3030  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_SMTI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3031  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3032  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_RECI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3033  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3034  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_RECI_D1_N)
a171784472954b Fred-LW Lu       2023-01-14  3035  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3036  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_TNRWI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3037  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3038  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_TNRCI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3039  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3040  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_TNRCI_D1_N)
a171784472954b Fred-LW Lu       2023-01-14  3041  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3042  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_IMG4O_D1)
a171784472954b Fred-LW Lu       2023-01-14  3043  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3044  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_IMG4BO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3045  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3046  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_SMTI_D8)
a171784472954b Fred-LW Lu       2023-01-14  3047  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3048  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_SMTO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3049  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3050  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_TNRMO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3051  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3052  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_TNRMO_D1_N)
a171784472954b Fred-LW Lu       2023-01-14  3053  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3054  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_SMTO_D8)
a171784472954b Fred-LW Lu       2023-01-14  3055  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3056  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L10_DBGO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3057  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3058  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_VIPI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3059  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3060  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_VIPBI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3061  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3062  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_SMTI_D6)
a171784472954b Fred-LW Lu       2023-01-14  3063  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3064  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_TNCSTI_D1)
a171784472954b Fred-LW Lu       2023-01-14  3065  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3066  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_TNCSTI_D4)
a171784472954b Fred-LW Lu       2023-01-14  3067  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3068  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_SMTI_D4)
a171784472954b Fred-LW Lu       2023-01-14  3069  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3070  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_IMG3O_D1)
a171784472954b Fred-LW Lu       2023-01-14  3071  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3072  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_IMG3BO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3073  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3074  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_IMG3CO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3075  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3076  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_IMG2O_D1)
a171784472954b Fred-LW Lu       2023-01-14  3077  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3078  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_SMTI_D9)
a171784472954b Fred-LW Lu       2023-01-14  3079  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3080  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_SMTO_D4)
a171784472954b Fred-LW Lu       2023-01-14  3081  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3082  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_FEO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3083  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3084  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_TNCSO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3085  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3086  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_TNCSTO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3087  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3088  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_SMTO_D6)
a171784472954b Fred-LW Lu       2023-01-14  3089  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3090  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_SMTO_D9)
a171784472954b Fred-LW Lu       2023-01-14  3091  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3092  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_TNCO_D1)
a171784472954b Fred-LW Lu       2023-01-14  3093  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3094  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L15_TNCO_D1_N)
a171784472954b Fred-LW Lu       2023-01-14  3095  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3096  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_PIMGI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3097  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3098  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_PIMGBI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3099  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3100  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_PIMGCI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3101  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3102  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WROT_P1)
a171784472954b Fred-LW Lu       2023-01-14  3103  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3104  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_TCCSO_P1)
a171784472954b Fred-LW Lu       2023-01-14  3105  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3106  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_TCCSI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3107  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3108  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_PIMGI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3109  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3110  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_PIMGBI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3111  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3112  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_PIMGCI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3113  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3114  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WROT_P1)
a171784472954b Fred-LW Lu       2023-01-14  3115  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3116  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_TCCSO_P1)
a171784472954b Fred-LW Lu       2023-01-14  3117  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3118  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_TCCSI_P1)
a171784472954b Fred-LW Lu       2023-01-14  3119  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3120  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_RDMA_0)
a171784472954b Fred-LW Lu       2023-01-14  3121  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3122  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_RDMA_1)
a171784472954b Fred-LW Lu       2023-01-14  3123  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3124  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_RDMA_4P_0)
a171784472954b Fred-LW Lu       2023-01-14  3125  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3126  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_RDMA_4P_1)
a171784472954b Fred-LW Lu       2023-01-14  3127  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3128  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_CQ0)
a171784472954b Fred-LW Lu       2023-01-14  3129  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3130  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_CQ1)
a171784472954b Fred-LW Lu       2023-01-14  3131  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3132  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_WDMA_0)
a171784472954b Fred-LW Lu       2023-01-14  3133  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3134  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11A_WPE_WDMA_4P_0)
a171784472954b Fred-LW Lu       2023-01-14  3135  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3136  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_RDMA_0)
a171784472954b Fred-LW Lu       2023-01-14  3137  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3138  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_RDMA_1)
a171784472954b Fred-LW Lu       2023-01-14  3139  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3140  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_RDMA_4P_0)
a171784472954b Fred-LW Lu       2023-01-14  3141  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3142  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_RDMA_4P_1)
a171784472954b Fred-LW Lu       2023-01-14  3143  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3144  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_CQ0)
a171784472954b Fred-LW Lu       2023-01-14  3145  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3146  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_CQ1)
a171784472954b Fred-LW Lu       2023-01-14  3147  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3148  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_WDMA_0)
a171784472954b Fred-LW Lu       2023-01-14  3149  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3150  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11B_WPE_WDMA_4P_0)
a171784472954b Fred-LW Lu       2023-01-14  3151  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3152  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_RDMA_0)
a171784472954b Fred-LW Lu       2023-01-14  3153  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3154  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_RDMA_1)
a171784472954b Fred-LW Lu       2023-01-14  3155  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3156  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_RDMA_4P_0)
a171784472954b Fred-LW Lu       2023-01-14  3157  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3158  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_RDMA_4P_1)
a171784472954b Fred-LW Lu       2023-01-14  3159  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3160  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_CQ0)
a171784472954b Fred-LW Lu       2023-01-14  3161  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3162  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_CQ1)
a171784472954b Fred-LW Lu       2023-01-14  3163  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3164  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_WDMA_0)
a171784472954b Fred-LW Lu       2023-01-14  3165  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3166  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L11C_WPE_WDMA_4P_0)
a171784472954b Fred-LW Lu       2023-01-14  3167  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3168  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L12_ME_RDMA)
a171784472954b Fred-LW Lu       2023-01-14  3169  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3170  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L12_ME_WDMA)
a171784472954b Fred-LW Lu       2023-01-14  3171  					&mmqos SLAVE_COMMON(1)>,
a171784472954b Fred-LW Lu       2023-01-14  3172  				<&mmqos SLAVE_LARB(SMI_L9_ID)
a171784472954b Fred-LW Lu       2023-01-14  3173  					&mmqos SLAVE_COMMON(0)>,
a171784472954b Fred-LW Lu       2023-01-14  3174  				<&mmqos SLAVE_LARB(SMI_L12_ID)
a171784472954b Fred-LW Lu       2023-01-14  3175  					&mmqos SLAVE_COMMON(1)>;
a171784472954b Fred-LW Lu       2023-01-14  3176  #endif
a171784472954b Fred-LW Lu       2023-01-14  3177  			interconnect-names =
a171784472954b Fred-LW Lu       2023-01-14  3178  				"l9_imgi_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3179  				"l9_ufdi_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3180  				"l9_imgbi_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3181  				"l9_imgci_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3182  				"l9_smti_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3183  				"l9_smti_t4_a",
a171784472954b Fred-LW Lu       2023-01-14  3184  				"l9_tncsti_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3185  				"l9_tncsti_t4_a",
a171784472954b Fred-LW Lu       2023-01-14  3186  				"l9_yuvo_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3187  				"l9_yuvbo_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3188  				"l9_yuvco_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3189  				"l9_timgo_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3190  				"l9_yuvo_t2_a",
a171784472954b Fred-LW Lu       2023-01-14  3191  				"l9_yuvo_t5_a",
a171784472954b Fred-LW Lu       2023-01-14  3192  				"l9_tncso_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3193  				"l9_smto_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3194  				"l9_smto_t4_a",
a171784472954b Fred-LW Lu       2023-01-14  3195  				"l9_tncsto_t1_a",
a171784472954b Fred-LW Lu       2023-01-14  3196  				"l9_imgi_t1_b",
a171784472954b Fred-LW Lu       2023-01-14  3197  				"l9_imgbi_t1_b",
a171784472954b Fred-LW Lu       2023-01-14  3198  				"l9_imgci_t1_b",
a171784472954b Fred-LW Lu       2023-01-14  3199  				"l9_smti_t4_b",
a171784472954b Fred-LW Lu       2023-01-14  3200  				"l9_yuvo_t2_b",
a171784472954b Fred-LW Lu       2023-01-14  3201  				"l9_yuvo_t5_b",
a171784472954b Fred-LW Lu       2023-01-14  3202  				"l9_smto_t4_b",
a171784472954b Fred-LW Lu       2023-01-14  3203  				"l11a_imgi_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3204  				"l11a_imgbi_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3205  				"l11a_imgci_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3206  				"l11a_smti_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3207  				"l11a_smti_t4_c",
a171784472954b Fred-LW Lu       2023-01-14  3208  				"l11a_smti_t6_c",
a171784472954b Fred-LW Lu       2023-01-14  3209  				"l11a_yuvo_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3210  				"l11a_yuvbo_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3211  				"l11a_yuvco_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3212  				"l11a_timgo_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3213  				"l11a_yuvo_t2_c",
a171784472954b Fred-LW Lu       2023-01-14  3214  				"l11a_yuvo_t5_c",
a171784472954b Fred-LW Lu       2023-01-14  3215  				"l11a_smto_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3216  				"l11a_smto_t4_c",
a171784472954b Fred-LW Lu       2023-01-14  3217  				"l11a_smto_t6_c",
a171784472954b Fred-LW Lu       2023-01-14  3218  				"l11a_dbgo_t1_c",
a171784472954b Fred-LW Lu       2023-01-14  3219  				"l10_imgi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3220  				"l10_imgbi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3221  				"l10_imgci_d1",
a171784472954b Fred-LW Lu       2023-01-14  3222  				"l10_imgdi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3223  				"l10_depi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3224  				"l10_dmgi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3225  				"l10_smti_d1",
a171784472954b Fred-LW Lu       2023-01-14  3226  				"l10_reci_d1",
a171784472954b Fred-LW Lu       2023-01-14  3227  				"l10_reci_d1_n",
a171784472954b Fred-LW Lu       2023-01-14  3228  				"l10_tnrwi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3229  				"l10_tnrci_d1",
a171784472954b Fred-LW Lu       2023-01-14  3230  				"l10_tnrci_d1_n",
a171784472954b Fred-LW Lu       2023-01-14  3231  				"l10_img4o_d1",
a171784472954b Fred-LW Lu       2023-01-14  3232  				"l10_img4bo_d1",
a171784472954b Fred-LW Lu       2023-01-14  3233  				"l10_smti_d8",
a171784472954b Fred-LW Lu       2023-01-14  3234  				"l10_smto_d1",
a171784472954b Fred-LW Lu       2023-01-14  3235  				"l10_tnrmo_d1",
a171784472954b Fred-LW Lu       2023-01-14  3236  				"l10_tnrmo_d1_n",
a171784472954b Fred-LW Lu       2023-01-14  3237  				"l10_smto_d8",
a171784472954b Fred-LW Lu       2023-01-14  3238  				"l10_dbgo_d1",
a171784472954b Fred-LW Lu       2023-01-14  3239  				"l15_vipi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3240  				"l15_vipbi_d1",
a171784472954b Fred-LW Lu       2023-01-14  3241  				"l15_smti_d6",
a171784472954b Fred-LW Lu       2023-01-14  3242  				"l15_tncsti_d1",
a171784472954b Fred-LW Lu       2023-01-14  3243  				"l15_tncsti_d4",
a171784472954b Fred-LW Lu       2023-01-14  3244  				"l15_smti_d4",
a171784472954b Fred-LW Lu       2023-01-14  3245  				"l15_img3o_d1",
a171784472954b Fred-LW Lu       2023-01-14  3246  				"l15_img3bo_d1",
a171784472954b Fred-LW Lu       2023-01-14  3247  				"l15_img3co_d1",
a171784472954b Fred-LW Lu       2023-01-14  3248  				"l15_img2o_d1",
a171784472954b Fred-LW Lu       2023-01-14  3249  				"l15_smti_d9",
a171784472954b Fred-LW Lu       2023-01-14  3250  				"l15_smto_d4",
a171784472954b Fred-LW Lu       2023-01-14  3251  				"l15_feo_d1",
a171784472954b Fred-LW Lu       2023-01-14  3252  				"l15_tncso_d1",
a171784472954b Fred-LW Lu       2023-01-14  3253  				"l15_tncsto_d1",
a171784472954b Fred-LW Lu       2023-01-14  3254  				"l15_smto_d6",
a171784472954b Fred-LW Lu       2023-01-14  3255  				"l15_smto_d9",
a171784472954b Fred-LW Lu       2023-01-14  3256  				"l15_tnco_d1",
a171784472954b Fred-LW Lu       2023-01-14  3257  				"l15_tnco_d1_n",
a171784472954b Fred-LW Lu       2023-01-14  3258  				"l11a_pimgi_p1",
a171784472954b Fred-LW Lu       2023-01-14  3259  				"l11a_pimgbi_p1",
a171784472954b Fred-LW Lu       2023-01-14  3260  				"l11a_pimgci_p1",
a171784472954b Fred-LW Lu       2023-01-14  3261  				"l11a_wrot_p1",
a171784472954b Fred-LW Lu       2023-01-14  3262  				"l11a_tccso_p1",
a171784472954b Fred-LW Lu       2023-01-14  3263  				"l11a_tccsi_p1",
a171784472954b Fred-LW Lu       2023-01-14  3264  				"l11b_pimgi_p1",
a171784472954b Fred-LW Lu       2023-01-14  3265  				"l11b_pimgbi_p1",
a171784472954b Fred-LW Lu       2023-01-14  3266  				"l11b_pimgci_p1",
a171784472954b Fred-LW Lu       2023-01-14  3267  				"l11b_wrot_p1",
a171784472954b Fred-LW Lu       2023-01-14  3268  				"l11b_tccso_p1",
a171784472954b Fred-LW Lu       2023-01-14  3269  				"l11b_tccsi_p1",
a171784472954b Fred-LW Lu       2023-01-14  3270  				"l11a_wpe_rdma0",
a171784472954b Fred-LW Lu       2023-01-14  3271  				"l11a_wpe_rdma1",
a171784472954b Fred-LW Lu       2023-01-14  3272  				"l11a_wpe_rdma_4p0",
a171784472954b Fred-LW Lu       2023-01-14  3273  				"l11a_wpe_rdma_4p1",
a171784472954b Fred-LW Lu       2023-01-14  3274  				"l11a_wpe_cq0",
a171784472954b Fred-LW Lu       2023-01-14  3275  				"l11a_wpe_cq1",
a171784472954b Fred-LW Lu       2023-01-14  3276  				"l11a_wpe_wdma0",
a171784472954b Fred-LW Lu       2023-01-14  3277  				"l11a_wpe_wdma_4p0",
a171784472954b Fred-LW Lu       2023-01-14  3278  				"l11b_wpe_rdma0",
a171784472954b Fred-LW Lu       2023-01-14  3279  				"l11b_wpe_rdma1",
a171784472954b Fred-LW Lu       2023-01-14  3280  				"l11b_wpe_rdma_4p0",
a171784472954b Fred-LW Lu       2023-01-14  3281  				"l11b_wpe_rdma_4p1",
a171784472954b Fred-LW Lu       2023-01-14  3282  				"l11b_wpe_cq0",
a171784472954b Fred-LW Lu       2023-01-14  3283  				"l11b_wpe_cq1",
a171784472954b Fred-LW Lu       2023-01-14  3284  				"l11b_wpe_wdma0",
a171784472954b Fred-LW Lu       2023-01-14  3285  				"l11b_wpe_wdma_4p0",
a171784472954b Fred-LW Lu       2023-01-14  3286  				"l11c_wpe_rdma0",
a171784472954b Fred-LW Lu       2023-01-14  3287  				"l11c_wpe_rdma1",
a171784472954b Fred-LW Lu       2023-01-14  3288  				"l11c_wpe_rdma_4p0",
a171784472954b Fred-LW Lu       2023-01-14  3289  				"l11c_wpe_rdma_4p1",
a171784472954b Fred-LW Lu       2023-01-14  3290  				"l11c_wpe_cq0",
a171784472954b Fred-LW Lu       2023-01-14  3291  				"l11c_wpe_cq1",
a171784472954b Fred-LW Lu       2023-01-14  3292  				"l11c_wpe_wdma0",
a171784472954b Fred-LW Lu       2023-01-14  3293  				"l11c_wpe_wdma_4p0",
a171784472954b Fred-LW Lu       2023-01-14  3294  				"l12_me_rdma",
a171784472954b Fred-LW Lu       2023-01-14  3295  				"l12_me_wdma",
a171784472954b Fred-LW Lu       2023-01-14  3296  				"l9_common_0",
a171784472954b Fred-LW Lu       2023-01-14  3297  				"l12_common_1";
a171784472954b Fred-LW Lu       2023-01-14  3298  		};
a171784472954b Fred-LW Lu       2023-01-14  3299  
cbb0f8b948cfda Fei Shao         2024-06-14  3300  		imgsys-l10 {
a171784472954b Fred-LW Lu       2023-01-14  3301  			compatible = "mediatek,imgsys-larb";
a171784472954b Fred-LW Lu       2023-01-14  3302  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3303  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3304  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
a171784472954b Fred-LW Lu       2023-01-14  3305  			iommus = <&vdo_iommu M4U_PORT_L10_IMGI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3306  				 <&vdo_iommu M4U_PORT_L10_IMGBI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3307  				 <&vdo_iommu M4U_PORT_L10_IMGCI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3308  				 <&vdo_iommu M4U_PORT_L10_IMGDI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3309  				 <&vdo_iommu M4U_PORT_L10_DEPI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3310  				 <&vdo_iommu M4U_PORT_L10_DMGI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3311  				 <&vdo_iommu M4U_PORT_L10_SMTI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3312  				 <&vdo_iommu M4U_PORT_L10_RECI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3313  				 <&vdo_iommu M4U_PORT_L10_RECI_D1_N>,
a171784472954b Fred-LW Lu       2023-01-14  3314  				 <&vdo_iommu M4U_PORT_L10_TNRWI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3315  				 <&vdo_iommu M4U_PORT_L10_TNRCI_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3316  				 <&vdo_iommu M4U_PORT_L10_TNRCI_D1_N>,
a171784472954b Fred-LW Lu       2023-01-14  3317  				 <&vdo_iommu M4U_PORT_L10_IMG4O_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3318  				 <&vdo_iommu M4U_PORT_L10_IMG4BO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3319  				 <&vdo_iommu M4U_PORT_L10_SMTI_D8>,
a171784472954b Fred-LW Lu       2023-01-14  3320  				 <&vdo_iommu M4U_PORT_L10_SMTO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3321  				 <&vdo_iommu M4U_PORT_L10_TNRMO_D1>,
a171784472954b Fred-LW Lu       2023-01-14  3322  				 <&vdo_iommu M4U_PORT_L10_TNRMO_D1_N>,
a171784472954b Fred-LW Lu       2023-01-14  3323  				 <&vdo_iommu M4U_PORT_L10_SMTO_D8>,
a171784472954b Fred-LW Lu       2023-01-14  3324  				 <&vdo_iommu M4U_PORT_L10_DBGO_D1>;
a171784472954b Fred-LW Lu       2023-01-14  3325  		};
a171784472954b Fred-LW Lu       2023-01-14  3326  
cbb0f8b948cfda Fei Shao         2024-06-14  3327  		imgsys-l11A {
a171784472954b Fred-LW Lu       2023-01-14  3328  			compatible = "mediatek,imgsys-larb";
a171784472954b Fred-LW Lu       2023-01-14  3329  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3330  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3331  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
a171784472954b Fred-LW Lu       2023-01-14  3332  			iommus = <&vdo_iommu M4U_PORT_L11A_WPE_RDMA_0>,
a171784472954b Fred-LW Lu       2023-01-14  3333  				 <&vdo_iommu M4U_PORT_L11A_WPE_RDMA_1>,
a171784472954b Fred-LW Lu       2023-01-14  3334  				 <&vdo_iommu M4U_PORT_L11A_WPE_RDMA_4P_0>,
a171784472954b Fred-LW Lu       2023-01-14  3335  				 <&vdo_iommu M4U_PORT_L11A_WPE_RDMA_4P_1>,
a171784472954b Fred-LW Lu       2023-01-14  3336  				 <&vdo_iommu M4U_PORT_L11A_WPE_CQ0>,
a171784472954b Fred-LW Lu       2023-01-14  3337  				 <&vdo_iommu M4U_PORT_L11A_WPE_CQ1>,
a171784472954b Fred-LW Lu       2023-01-14  3338  				 <&vdo_iommu M4U_PORT_L11A_PIMGI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3339  				 <&vdo_iommu M4U_PORT_L11A_PIMGBI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3340  				 <&vdo_iommu M4U_PORT_L11A_PIMGCI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3341  				 <&vdo_iommu M4U_PORT_L11A_IMGI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3342  				 <&vdo_iommu M4U_PORT_L11A_IMGBI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3343  				 <&vdo_iommu M4U_PORT_L11A_IMGCI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3344  				 <&vdo_iommu M4U_PORT_L11A_SMTI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3345  				 <&vdo_iommu M4U_PORT_L11A_SMTI_T4_C>,
a171784472954b Fred-LW Lu       2023-01-14  3346  				 <&vdo_iommu M4U_PORT_L11A_SMTI_T6_C>,
a171784472954b Fred-LW Lu       2023-01-14  3347  				 <&vdo_iommu M4U_PORT_L11A_YUVO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3348  				 <&vdo_iommu M4U_PORT_L11A_YUVBO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3349  				 <&vdo_iommu M4U_PORT_L11A_YUVCO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3350  				 <&vdo_iommu M4U_PORT_L11A_WPE_WDMA_0>,
a171784472954b Fred-LW Lu       2023-01-14  3351  				 <&vdo_iommu M4U_PORT_L11A_WPE_WDMA_4P_0>,
a171784472954b Fred-LW Lu       2023-01-14  3352  				 <&vdo_iommu M4U_PORT_L11A_WROT_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3353  				 <&vdo_iommu M4U_PORT_L11A_TCCSO_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3354  				 <&vdo_iommu M4U_PORT_L11A_TCCSI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3355  				 <&vdo_iommu M4U_PORT_L11A_TIMGO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3356  				 <&vdo_iommu M4U_PORT_L11A_YUVO_T2_C>,
a171784472954b Fred-LW Lu       2023-01-14  3357  				 <&vdo_iommu M4U_PORT_L11A_YUVO_T5_C>,
a171784472954b Fred-LW Lu       2023-01-14  3358  				 <&vdo_iommu M4U_PORT_L11A_SMTO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3359  				 <&vdo_iommu M4U_PORT_L11A_SMTO_T4_C>,
a171784472954b Fred-LW Lu       2023-01-14  3360  				 <&vdo_iommu M4U_PORT_L11A_SMTO_T6_C>,
a171784472954b Fred-LW Lu       2023-01-14  3361  				 <&vdo_iommu M4U_PORT_L11A_DBGO_T1_C>;
a171784472954b Fred-LW Lu       2023-01-14  3362  		};
a171784472954b Fred-LW Lu       2023-01-14  3363  
cbb0f8b948cfda Fei Shao         2024-06-14  3364  		imgsys-l11C {
a171784472954b Fred-LW Lu       2023-01-14  3365  			compatible = "mediatek,imgsys-larb";
a171784472954b Fred-LW Lu       2023-01-14  3366  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3367  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3368  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
a171784472954b Fred-LW Lu       2023-01-14  3369  			iommus = <&vdo_iommu M4U_PORT_L11C_WPE_RDMA_0>,
a171784472954b Fred-LW Lu       2023-01-14  3370  				 <&vdo_iommu M4U_PORT_L11C_WPE_RDMA_1>,
a171784472954b Fred-LW Lu       2023-01-14  3371  				 <&vdo_iommu M4U_PORT_L11C_WPE_RDMA_4P_0>,
a171784472954b Fred-LW Lu       2023-01-14  3372  				 <&vdo_iommu M4U_PORT_L11C_WPE_RDMA_4P_1>,
a171784472954b Fred-LW Lu       2023-01-14  3373  				 <&vdo_iommu M4U_PORT_L11C_WPE_CQ0>,
a171784472954b Fred-LW Lu       2023-01-14  3374  				 <&vdo_iommu M4U_PORT_L11C_WPE_CQ1>,
a171784472954b Fred-LW Lu       2023-01-14  3375  				 <&vdo_iommu M4U_PORT_L11C_PIMGI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3376  				 <&vdo_iommu M4U_PORT_L11C_PIMGBI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3377  				 <&vdo_iommu M4U_PORT_L11C_PIMGCI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3378  				 <&vdo_iommu M4U_PORT_L11C_IMGI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3379  				 <&vdo_iommu M4U_PORT_L11C_IMGBI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3380  				 <&vdo_iommu M4U_PORT_L11C_IMGCI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3381  				 <&vdo_iommu M4U_PORT_L11C_SMTI_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3382  				 <&vdo_iommu M4U_PORT_L11C_SMTI_T4_C>,
a171784472954b Fred-LW Lu       2023-01-14  3383  				 <&vdo_iommu M4U_PORT_L11C_SMTI_T6_C>,
a171784472954b Fred-LW Lu       2023-01-14  3384  				 <&vdo_iommu M4U_PORT_L11C_YUVO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3385  				 <&vdo_iommu M4U_PORT_L11C_YUVBO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3386  				 <&vdo_iommu M4U_PORT_L11C_YUVCO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3387  				 <&vdo_iommu M4U_PORT_L11C_WPE_WDMA_0>,
a171784472954b Fred-LW Lu       2023-01-14  3388  				 <&vdo_iommu M4U_PORT_L11C_WPE_WDMA_4P_0>,
a171784472954b Fred-LW Lu       2023-01-14  3389  				 <&vdo_iommu M4U_PORT_L11C_WROT_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3390  				 <&vdo_iommu M4U_PORT_L11C_TCCSO_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3391  				 <&vdo_iommu M4U_PORT_L11C_TCCSI_P1>,
a171784472954b Fred-LW Lu       2023-01-14  3392  				 <&vdo_iommu M4U_PORT_L11C_TIMGO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3393  				 <&vdo_iommu M4U_PORT_L11C_YUVO_T2_C>,
a171784472954b Fred-LW Lu       2023-01-14  3394  				 <&vdo_iommu M4U_PORT_L11C_YUVO_T5_C>,
a171784472954b Fred-LW Lu       2023-01-14  3395  				 <&vdo_iommu M4U_PORT_L11C_SMTO_T1_C>,
a171784472954b Fred-LW Lu       2023-01-14  3396  				 <&vdo_iommu M4U_PORT_L11C_SMTO_T4_C>,
a171784472954b Fred-LW Lu       2023-01-14  3397  				 <&vdo_iommu M4U_PORT_L11C_SMTO_T6_C>,
a171784472954b Fred-LW Lu       2023-01-14  3398  				 <&vdo_iommu M4U_PORT_L11C_DBGO_T1_C>;
a171784472954b Fred-LW Lu       2023-01-14  3399  		};
a171784472954b Fred-LW Lu       2023-01-14  3400  
cbb0f8b948cfda Fei Shao         2024-06-14  3401  		ipesys_me: ipesys-me@15320000 {
a171784472954b Fred-LW Lu       2023-01-14  3402  			compatible = "mediatek,ipesys-me";
a171784472954b Fred-LW Lu       2023-01-14  3403  			reg = <0 0x15320000 0 0x10000>;	/* IPESYS_ME */
a171784472954b Fred-LW Lu       2023-01-14  3404  			mediatek,larb = <&larb12>;
a171784472954b Fred-LW Lu       2023-01-14  3405  			#address-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3406  			#size-cells = <2>;
a171784472954b Fred-LW Lu       2023-01-14  3407  			dma-ranges = <0x2 0x0 0x0 0x40000000 0x1 0x0>;
a171784472954b Fred-LW Lu       2023-01-14  3408  			iommus = <&vpp_iommu M4U_PORT_L12_ME_RDMA>,
a171784472954b Fred-LW Lu       2023-01-14  3409  				 <&vpp_iommu M4U_PORT_L12_ME_WDMA>;
a171784472954b Fred-LW Lu       2023-01-14  3410  			clocks =
a171784472954b Fred-LW Lu       2023-01-14  3411  				<&imgsys CLK_IMGSYS_MAIN_IPE>,
a171784472954b Fred-LW Lu       2023-01-14  3412  				<&ipesys CLK_IPESYS_TOP>,
a171784472954b Fred-LW Lu       2023-01-14  3413  				<&ipesys CLK_IPE_ME>,
a171784472954b Fred-LW Lu       2023-01-14  3414  				<&ipesys CLK_IPE_SMI_LARB12>;
a171784472954b Fred-LW Lu       2023-01-14  3415  			clock-names =
a171784472954b Fred-LW Lu       2023-01-14  3416  				"ME_CG_IPE",
a171784472954b Fred-LW Lu       2023-01-14  3417  				"ME_CG_IPE_TOP",
a171784472954b Fred-LW Lu       2023-01-14  3418  				"ME_CG",
a171784472954b Fred-LW Lu       2023-01-14  3419  				"ME_CG_LARB12";
a171784472954b Fred-LW Lu       2023-01-14  3420  		};
a171784472954b Fred-LW Lu       2023-01-14  3421  
5ec8716355c62e Copy Chou        2023-06-09  3422  		aie: aie@15310000 {
5ec8716355c62e Copy Chou        2023-06-09  3423  			compatible = "mediatek,mt8188-aie", "mediatek,aie-hw3.1";
5ec8716355c62e Copy Chou        2023-06-09  3424  			reg = <0 0x15310000 0 0x1000>;
5ec8716355c62e Copy Chou        2023-06-09  3425  			interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH 0>;
5ec8716355c62e Copy Chou        2023-06-09  3426  			mediatek,larb = <&larb12>;
5ec8716355c62e Copy Chou        2023-06-09  3427  			iommus = <&vpp_iommu M4U_PORT_L12_FDVT_RDA_0>,
5ec8716355c62e Copy Chou        2023-06-09  3428  				 <&vpp_iommu M4U_PORT_L12_FDVT_RDB_0>,
5ec8716355c62e Copy Chou        2023-06-09  3429  				 <&vpp_iommu M4U_PORT_L12_FDVT_WRA_0>,
5ec8716355c62e Copy Chou        2023-06-09  3430  				 <&vpp_iommu M4U_PORT_L12_FDVT_WRB_0>;
5ec8716355c62e Copy Chou        2023-06-09  3431  			power-domains = <&spm MT8188_POWER_DOMAIN_IPE>;
5ec8716355c62e Copy Chou        2023-06-09  3432  			clocks = <&imgsys CLK_IMGSYS_MAIN_IPE>,
5ec8716355c62e Copy Chou        2023-06-09  3433  				 <&ipesys CLK_IPE_FDVT>,
5ec8716355c62e Copy Chou        2023-06-09  3434  				 <&ipesys CLK_IPE_SMI_LARB12>,
5ec8716355c62e Copy Chou        2023-06-09  3435  				 <&ipesys CLK_IPESYS_TOP>;
5ec8716355c62e Copy Chou        2023-06-09  3436  			clock-names = "IMG_IPE",
5ec8716355c62e Copy Chou        2023-06-09  3437  				      "IPE_FDVT",
5ec8716355c62e Copy Chou        2023-06-09  3438  				      "IPE_SMI_LARB12",
5ec8716355c62e Copy Chou        2023-06-09  3439  				      "IPE_TOP";
0d093046fe4ae1 Fei Shao         2024-07-22  3440  			operating-points-v2 = <&ipe_opp_table>;
0d093046fe4ae1 Fei Shao         2024-07-22  3441  			dvfsrc-vcore-supply = <&regulator_dvfs_vmm>;
5ec8716355c62e Copy Chou        2023-06-09  3442  #if 0
5ec8716355c62e Copy Chou        2023-06-09  3443  			interconnects =
5ec8716355c62e Copy Chou        2023-06-09  3444  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L12_FDVT_RDA_0)
5ec8716355c62e Copy Chou        2023-06-09  3445  				 &mmqos SLAVE_COMMON(1)>,
5ec8716355c62e Copy Chou        2023-06-09  3446  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L12_FDVT_RDB_0)
5ec8716355c62e Copy Chou        2023-06-09  3447  				 &mmqos SLAVE_COMMON(1)>,
5ec8716355c62e Copy Chou        2023-06-09  3448  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L12_FDVT_WRA_0)
5ec8716355c62e Copy Chou        2023-06-09  3449  				 &mmqos SLAVE_COMMON(1)>,
5ec8716355c62e Copy Chou        2023-06-09  3450  				<&mmqos MASTER_LARB_PORT(M4U_PORT_L12_FDVT_WRB_0)
5ec8716355c62e Copy Chou        2023-06-09  3451  				 &mmqos SLAVE_COMMON(1)>;
5ec8716355c62e Copy Chou        2023-06-09  3452  			interconnect-names = "l12_fdvt_rda",
5ec8716355c62e Copy Chou        2023-06-09  3453  					     "l12_fdvt_rdb",
5ec8716355c62e Copy Chou        2023-06-09  3454  					     "l12_fdvt_wra",
5ec8716355c62e Copy Chou        2023-06-09  3455  					     "l12_fdvt_wrb";
5ec8716355c62e Copy Chou        2023-06-09  3456  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
