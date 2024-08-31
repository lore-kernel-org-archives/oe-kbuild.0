Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29AD12E4A
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Aug 2024 13:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725111431; cv=none; b=UmV4qwmJtYR7qV7mcdXvxkV1AuSFu+MA25V/2LtwZqYjMvCCAEFGerFN4HVknREgKrLx1gdiG4xZDIqEJPcxGEhwR8oHGCY6D3gRVw0HfF0InfBE3+r/o9jqVwUl8hIRrUMJEa2jv/rn4+IUcon2VzqFh1n0W5M1q2q4Dp1psrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725111431; c=relaxed/simple;
	bh=fRzkNkx4MmI9CLzdmrkzkozjFiFUQjgxGpoM/kkompI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZxCMv+akzdt9qJCZpGKBBt+zZMGcKjEtA24GQTbpJnsBoBIkeg+QRKFqdjN3ujZFGwHUbRmLJbUEY6ojxThhO/Me3LhP4eFrVBPSsNZVkHJ/dDPp2uLiETnnKra4U7ZRy0C1RohoShjwXW+8cQnOPsRKrQ/0gp7wsTTEnppZGGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q9896+KN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q9896+KN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725111429; x=1756647429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fRzkNkx4MmI9CLzdmrkzkozjFiFUQjgxGpoM/kkompI=;
  b=Q9896+KN9PwRXfNxnuUjSVk21Uu3J2QIVZknnfF8zLDiMSTpEAZ51hih
   kMKG55xQHJRzDO0agB/lDIFZu2gPbQ1wHGFBeRgDTbU3Tj78ZLHUUvX9i
   5Zt9m5AUbMyXsB5P9kDvSvTac6aQl/vUJShE2iAuIlw7onu4XLO9r6Z6X
   kEXbNONwfQhiRcrnBgMd/HyL3mk27OJkB4KE2CfVQxuA6ZwS9Db10mS0M
   qpFJNm9MMLPwairmmH24J2QkD7LXQI4mSXb+xQ3Y28x73FhxErpk/sSMG
   0EEgoolNrFWB+mL6dlrbunasvOJZDSTlDmmCS/MMVWjtdpuR67/xUQveo
   w==;
X-CSE-ConnectionGUID: t4BZTf7iSuadwZXa+JT9Vg==
X-CSE-MsgGUID: 2fLjwaumQraslbVxCdIYwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23880259"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23880259"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 06:37:08 -0700
X-CSE-ConnectionGUID: 0m8x+4hbRXaDvf28I2kQfA==
X-CSE-MsgGUID: 7h13p963QrqUNSo8rqfIwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="68996328"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Aug 2024 06:37:07 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skOHp-0002n5-0q;
	Sat, 31 Aug 2024 13:37:05 +0000
Date: Sat, 31 Aug 2024 21:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 4/4] arm64: dts: rockchip: Add Radxa e20c board
Message-ID: <202408312137.2Ls5Iosa-lkp@intel.com>
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
In-Reply-To: <20240829092705.6241-5-ziyao@disroot.org>
References: <20240829092705.6241-5-ziyao@disroot.org>
TO: Yao Zi <ziyao@disroot.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Heiko Stuebner <heiko@sntech.de>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
TO: Chris Morgan <macromorgan@hotmail.com>
TO: Jonas Karlman <jonas@kwiboo.se>
TO: Tim Lunn <tim@feathertop.org>
TO: Andy Yan <andyshrk@163.com>
TO: Muhammed Efe Cetin <efectn@protonmail.com>
TO: Jagan Teki <jagan@edgeble.ai>
TO: Dragan Simic <dsimic@manjaro.org>
TO: Ondrej Jirman <megi@xff.cz>
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-rockchip@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: linux-serial@vger.kernel.org
CC: Celeste Liu <CoelacanthusHex@gmail.com>
CC: Yao Zi <ziyao@disroot.org>

Hi Yao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on rockchip/for-next tty/tty-testing tty/tty-next tty/tty-linus krzk/for-next krzk-dt/for-next krzk-mem-ctrl/for-next linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yao-Zi/dt-bindings-serial-snps-dw-apb-uart-Document-Rockchip-RK3528/20240829-173708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240829092705.6241-5-ziyao%40disroot.org
patch subject: [PATCH v4 4/4] arm64: dts: rockchip: Add Radxa e20c board
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240831/202408312137.2Ls5Iosa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408312137.2Ls5Iosa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408312137.2Ls5Iosa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3528.dtsi:98.6-188.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name

vim +98 arch/arm64/boot/dts/rockchip/rk3528.dtsi

b8c7119c6c04b1 Yao Zi 2024-08-29   9  
b8c7119c6c04b1 Yao Zi 2024-08-29  10  / {
b8c7119c6c04b1 Yao Zi 2024-08-29  11  	compatible = "rockchip,rk3528";
b8c7119c6c04b1 Yao Zi 2024-08-29  12  
b8c7119c6c04b1 Yao Zi 2024-08-29  13  	interrupt-parent = <&gic>;
b8c7119c6c04b1 Yao Zi 2024-08-29  14  	#address-cells = <2>;
b8c7119c6c04b1 Yao Zi 2024-08-29  15  	#size-cells = <2>;
b8c7119c6c04b1 Yao Zi 2024-08-29  16  
b8c7119c6c04b1 Yao Zi 2024-08-29  17  	aliases {
b8c7119c6c04b1 Yao Zi 2024-08-29  18  		serial0 = &uart0;
b8c7119c6c04b1 Yao Zi 2024-08-29  19  		serial1 = &uart1;
b8c7119c6c04b1 Yao Zi 2024-08-29  20  		serial2 = &uart2;
b8c7119c6c04b1 Yao Zi 2024-08-29  21  		serial3 = &uart3;
b8c7119c6c04b1 Yao Zi 2024-08-29  22  		serial4 = &uart4;
b8c7119c6c04b1 Yao Zi 2024-08-29  23  		serial5 = &uart5;
b8c7119c6c04b1 Yao Zi 2024-08-29  24  		serial6 = &uart6;
b8c7119c6c04b1 Yao Zi 2024-08-29  25  		serial7 = &uart7;
b8c7119c6c04b1 Yao Zi 2024-08-29  26  	};
b8c7119c6c04b1 Yao Zi 2024-08-29  27  
b8c7119c6c04b1 Yao Zi 2024-08-29  28  	cpus {
b8c7119c6c04b1 Yao Zi 2024-08-29  29  		#address-cells = <1>;
b8c7119c6c04b1 Yao Zi 2024-08-29  30  		#size-cells = <0>;
b8c7119c6c04b1 Yao Zi 2024-08-29  31  
b8c7119c6c04b1 Yao Zi 2024-08-29  32  		cpu-map {
b8c7119c6c04b1 Yao Zi 2024-08-29  33  			cluster0 {
b8c7119c6c04b1 Yao Zi 2024-08-29  34  				core0 {
b8c7119c6c04b1 Yao Zi 2024-08-29  35  					cpu = <&cpu0>;
b8c7119c6c04b1 Yao Zi 2024-08-29  36  				};
b8c7119c6c04b1 Yao Zi 2024-08-29  37  				core1 {
b8c7119c6c04b1 Yao Zi 2024-08-29  38  					cpu = <&cpu1>;
b8c7119c6c04b1 Yao Zi 2024-08-29  39  				};
b8c7119c6c04b1 Yao Zi 2024-08-29  40  				core2 {
b8c7119c6c04b1 Yao Zi 2024-08-29  41  					cpu = <&cpu2>;
b8c7119c6c04b1 Yao Zi 2024-08-29  42  				};
b8c7119c6c04b1 Yao Zi 2024-08-29  43  				core3 {
b8c7119c6c04b1 Yao Zi 2024-08-29  44  					cpu = <&cpu3>;
b8c7119c6c04b1 Yao Zi 2024-08-29  45  				};
b8c7119c6c04b1 Yao Zi 2024-08-29  46  			};
b8c7119c6c04b1 Yao Zi 2024-08-29  47  		};
b8c7119c6c04b1 Yao Zi 2024-08-29  48  
b8c7119c6c04b1 Yao Zi 2024-08-29  49  		cpu0: cpu@0 {
b8c7119c6c04b1 Yao Zi 2024-08-29  50  			compatible = "arm,cortex-a53";
b8c7119c6c04b1 Yao Zi 2024-08-29  51  			reg = <0x0>;
b8c7119c6c04b1 Yao Zi 2024-08-29  52  			device_type = "cpu";
b8c7119c6c04b1 Yao Zi 2024-08-29  53  			enable-method = "psci";
b8c7119c6c04b1 Yao Zi 2024-08-29  54  		};
b8c7119c6c04b1 Yao Zi 2024-08-29  55  
b8c7119c6c04b1 Yao Zi 2024-08-29  56  		cpu1: cpu@1 {
b8c7119c6c04b1 Yao Zi 2024-08-29  57  			compatible = "arm,cortex-a53";
b8c7119c6c04b1 Yao Zi 2024-08-29  58  			reg = <0x1>;
b8c7119c6c04b1 Yao Zi 2024-08-29  59  			device_type = "cpu";
b8c7119c6c04b1 Yao Zi 2024-08-29  60  			enable-method = "psci";
b8c7119c6c04b1 Yao Zi 2024-08-29  61  		};
b8c7119c6c04b1 Yao Zi 2024-08-29  62  
b8c7119c6c04b1 Yao Zi 2024-08-29  63  		cpu2: cpu@2 {
b8c7119c6c04b1 Yao Zi 2024-08-29  64  			compatible = "arm,cortex-a53";
b8c7119c6c04b1 Yao Zi 2024-08-29  65  			reg = <0x2>;
b8c7119c6c04b1 Yao Zi 2024-08-29  66  			device_type = "cpu";
b8c7119c6c04b1 Yao Zi 2024-08-29  67  			enable-method = "psci";
b8c7119c6c04b1 Yao Zi 2024-08-29  68  		};
b8c7119c6c04b1 Yao Zi 2024-08-29  69  
b8c7119c6c04b1 Yao Zi 2024-08-29  70  		cpu3: cpu@3 {
b8c7119c6c04b1 Yao Zi 2024-08-29  71  			compatible = "arm,cortex-a53";
b8c7119c6c04b1 Yao Zi 2024-08-29  72  			reg = <0x3>;
b8c7119c6c04b1 Yao Zi 2024-08-29  73  			device_type = "cpu";
b8c7119c6c04b1 Yao Zi 2024-08-29  74  			enable-method = "psci";
b8c7119c6c04b1 Yao Zi 2024-08-29  75  		};
b8c7119c6c04b1 Yao Zi 2024-08-29  76  	};
b8c7119c6c04b1 Yao Zi 2024-08-29  77  
b8c7119c6c04b1 Yao Zi 2024-08-29  78  	psci {
b8c7119c6c04b1 Yao Zi 2024-08-29  79  		compatible = "arm,psci-1.0", "arm,psci-0.2";
b8c7119c6c04b1 Yao Zi 2024-08-29  80  		method = "smc";
b8c7119c6c04b1 Yao Zi 2024-08-29  81  	};
b8c7119c6c04b1 Yao Zi 2024-08-29  82  
b8c7119c6c04b1 Yao Zi 2024-08-29  83  	timer {
b8c7119c6c04b1 Yao Zi 2024-08-29  84  		compatible = "arm,armv8-timer";
b8c7119c6c04b1 Yao Zi 2024-08-29  85  		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
b8c7119c6c04b1 Yao Zi 2024-08-29  86  			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
b8c7119c6c04b1 Yao Zi 2024-08-29  87  			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
b8c7119c6c04b1 Yao Zi 2024-08-29  88  			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
b8c7119c6c04b1 Yao Zi 2024-08-29  89  	};
b8c7119c6c04b1 Yao Zi 2024-08-29  90  
b8c7119c6c04b1 Yao Zi 2024-08-29  91  	xin24m: clock-xin24m {
b8c7119c6c04b1 Yao Zi 2024-08-29  92  		compatible = "fixed-clock";
b8c7119c6c04b1 Yao Zi 2024-08-29  93  		clock-frequency = <24000000>;
b8c7119c6c04b1 Yao Zi 2024-08-29  94  		clock-output-names = "xin24m";
b8c7119c6c04b1 Yao Zi 2024-08-29  95  		#clock-cells = <0>;
b8c7119c6c04b1 Yao Zi 2024-08-29  96  	};
b8c7119c6c04b1 Yao Zi 2024-08-29  97  
b8c7119c6c04b1 Yao Zi 2024-08-29 @98  	soc {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
