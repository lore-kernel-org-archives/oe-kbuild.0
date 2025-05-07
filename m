Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA5B281525
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 12:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746622471; cv=none; b=W2cc8xaLN9ofNcSCzBGP7HKX34F6JRUjxxjEYl09lenYaUqLTgrttw0rEeX/yjKk0WYv58HzIzJxwgYg1nhXD9GLqGg8Yia+wXcNGxsrmcshPTZoRGvZrtZhasJhY3dMpEUu8bJzR+Ngt9Cd+VsnDwhhM3dcP/wB54E448zG9sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746622471; c=relaxed/simple;
	bh=IcWLmxOC1q34/eB7zzPacQUx94XaCoydIGjcGdENva8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DgQirkUpZvj6BD1Ks6N3XgOAAqkeRvjAaBzbIqNng96fgKchzBWxv4BOWQiWD/dyBNezouwZnFse8PReRgxXEBhpL4k3/nQPxCU5SBY55NPXJo5N+xM3Hh+C6qdh3Qrr4Sdo+53fSRW14bGLApBSkHfOOWxowIe56J5XYXWq8Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvGL87CE; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvGL87CE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746622470; x=1778158470;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IcWLmxOC1q34/eB7zzPacQUx94XaCoydIGjcGdENva8=;
  b=TvGL87CE/NmBGlUJ8nyFBpM6k2+5p9P/lsVZiunbksThdH9eCgWiNbup
   LOyudsxXF0AiwNBKgmKqxMmJ7O/0rq3I1GrrLQPVhjg116LnD3Q8+8m+h
   Dvc2gSc8QUxbOJxWZcwf5YxosjtLZe18LYo7Y227QTbjSE6MrbMrntUX5
   fnPF+X9fLoC/whZjXBpmBYbuXJnyftz8K9kWE+SxmWEipgmvn176q4DGL
   s2dEEE8nN4wJozZq38BVCYdFFoFY09re66eausBu4UFCkHV3C6enzfwHe
   tm12IdjVzhMJWNTFtafAVYN5cxVpaedmvM+PpYymswgATxRWt4cJjJl6o
   A==;
X-CSE-ConnectionGUID: QXCOYSk1TrCod/CyL9tsVQ==
X-CSE-MsgGUID: /aT8fslPQsawGKZxNqr/gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59702939"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59702939"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:54:26 -0700
X-CSE-ConnectionGUID: sGWIWoz+TH2kICwZ+qregw==
X-CSE-MsgGUID: k1h7Jav1RiWSObutS+9StA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="141141766"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 May 2025 05:54:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCeI3-0007oZ-07;
	Wed, 07 May 2025 12:54:23 +0000
Date: Wed, 7 May 2025 20:54:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v9 -next 09/12] arm64: dts: broadcom: Add board DTS for
 Rpi5 which includes RP1 node
Message-ID: <202505072002.5nqSrew4-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <30394042e9ede04621dd1a9422c76711f0e7cd80.1745347417.git.andrea.porta@suse.com>
References: <30394042e9ede04621dd1a9422c76711f0e7cd80.1745347417.git.andrea.porta@suse.com>
TO: Andrea della Porta <andrea.porta@suse.com>
TO: Andrea della Porta <andrea.porta@suse.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Florian Fainelli <florian.fainelli@broadcom.com>
TO: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: Krzysztof Wilczynski <kw@linux.com>
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Bartosz Golaszewski <brgl@bgdev.pl>
TO: Derek Kiernan <derek.kiernan@amd.com>
TO: Dragan Cvetic <dragan.cvetic@amd.com>
TO: Arnd Bergmann <arnd@arndb.de>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Saravana Kannan <saravanak@google.com>
TO: linux-clk@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-kernel@vger.kernel.org
TO: linux-pci@vger.kernel.org
TO: linux-gpio@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
TO: Stefan Wahren <wahrenst@gmx.net>
TO: Herve Codina <herve.codina@bootlin.com>

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20250422]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/dt-bindings-clock-Add-RaspberryPi-RP1-clock-bindings/20250423-025437
base:   next-20250422
patch link:    https://lore.kernel.org/r/30394042e9ede04621dd1a9422c76711f0e7cd80.1745347417.git.andrea.porta%40suse.com
patch subject: [PATCH v9 -next 09/12] arm64: dts: broadcom: Add board DTS for Rpi5 which includes RP1 node
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-003-20250424 (https://download.01.org/0day-ci/archive/20250507/202505072002.5nqSrew4-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505072002.5nqSrew4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505072002.5nqSrew4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:421.11-576.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:74.21-91.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:93.15-97.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:438.12-440.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:421.11-576.4: Warning (unit_address_vs_reg): /axi: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/broadcom/rp1-nexus.dtsi:3.11-14.3: Warning (unit_address_vs_reg): /axi/pcie@1000120000/rp1_nexus: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:74.21-91.4: Warning (simple_bus_reg): /soc@107c000000/firmware: missing or empty reg/ranges property
>> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:93.15-97.4: Warning (simple_bus_reg): /soc@107c000000/power: missing or empty reg/ranges property
   arch/arm64/boot/dts/broadcom/bcm2712.dtsi:438.12-440.5: Warning (simple_bus_reg): /axi/gpu: missing or empty reg/ranges property

vim +74 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts

1ddb573fe014bb Andrea della Porta 2025-04-22  72  
1ddb573fe014bb Andrea della Porta 2025-04-22  73  &soc {
1ddb573fe014bb Andrea della Porta 2025-04-22 @74  	firmware: firmware {
1ddb573fe014bb Andrea della Porta 2025-04-22  75  		compatible = "raspberrypi,bcm2835-firmware", "simple-mfd";
1ddb573fe014bb Andrea della Porta 2025-04-22  76  		#address-cells = <1>;
1ddb573fe014bb Andrea della Porta 2025-04-22  77  		#size-cells = <1>;
1ddb573fe014bb Andrea della Porta 2025-04-22  78  
1ddb573fe014bb Andrea della Porta 2025-04-22  79  		mboxes = <&mailbox>;
1ddb573fe014bb Andrea della Porta 2025-04-22  80  		dma-ranges;
1ddb573fe014bb Andrea della Porta 2025-04-22  81  
1ddb573fe014bb Andrea della Porta 2025-04-22  82  		firmware_clocks: clocks {
1ddb573fe014bb Andrea della Porta 2025-04-22  83  			compatible = "raspberrypi,firmware-clocks";
1ddb573fe014bb Andrea della Porta 2025-04-22  84  			#clock-cells = <1>;
1ddb573fe014bb Andrea della Porta 2025-04-22  85  		};
1ddb573fe014bb Andrea della Porta 2025-04-22  86  
1ddb573fe014bb Andrea della Porta 2025-04-22  87  		reset: reset {
1ddb573fe014bb Andrea della Porta 2025-04-22  88  			compatible = "raspberrypi,firmware-reset";
1ddb573fe014bb Andrea della Porta 2025-04-22  89  			#reset-cells = <1>;
1ddb573fe014bb Andrea della Porta 2025-04-22  90  		};
1ddb573fe014bb Andrea della Porta 2025-04-22  91  	};
1ddb573fe014bb Andrea della Porta 2025-04-22  92  
1ddb573fe014bb Andrea della Porta 2025-04-22 @93  	power: power {
1ddb573fe014bb Andrea della Porta 2025-04-22  94  		compatible = "raspberrypi,bcm2835-power";
1ddb573fe014bb Andrea della Porta 2025-04-22  95  		firmware = <&firmware>;
1ddb573fe014bb Andrea della Porta 2025-04-22  96  		#power-domain-cells = <1>;
1ddb573fe014bb Andrea della Porta 2025-04-22  97  	};
1ddb573fe014bb Andrea della Porta 2025-04-22  98  };
1ddb573fe014bb Andrea della Porta 2025-04-22  99  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
