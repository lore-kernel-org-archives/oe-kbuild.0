Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1671B1DE896
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Nov 2024 22:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731104608; cv=none; b=R7sQ0cNoF1QPCoMKG1wBRJHH7DkX8IEa9OaOd/TUx4Gf3Sfl5G5zatKNRLchAk5zxbSc9KiUcoyjmu0NFhADYTZeqNN5IJt5WBwXSh3/BHoIvbHraUDkOJmoYoD3yLVkQbfAFNCSx/AzW0cZfoDPqyoCkjTU6kXpFNBg/HpNBl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731104608; c=relaxed/simple;
	bh=1KfWMpfXkY13840tTCqKfJvQs8MP3H2ZemHWdcLNQrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jJuO4LAXdhizFWP+tfufg/C3vXbw+OyyblQq8WJwYLWYr+FypBXSOm4uIyUarHjXt7hbhJp98VooR0HZ700100s6U5dhEfGzvb8yJioKf6BTOOVEKPk1fcu/8MyNjKvMeib8rDx7vZ1ygaEoiC+G/jsVXgb2zb+vALCxHq9gzTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WjVlA5bC; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjVlA5bC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731104604; x=1762640604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1KfWMpfXkY13840tTCqKfJvQs8MP3H2ZemHWdcLNQrY=;
  b=WjVlA5bCuXMa++QIVco4ZcYac/eEny2QP1E+nw9VsedreqGp92P4PpXB
   wc6B+P4T/PrW1ylCin1U2To7fi6u7ismWyg8l7XpLhOsDjCF8kFA4qCii
   +6xc0idf2pIBFfNS22Z4jzdmd3l9PCMbx6DC6ZOc6ruAam7uIkHnb4q5x
   ObU54B1ex31utsL4KxXcBXX095yP7QeLIwtACuM1Z2KzG7fUPhWY67wWS
   +zDh4ofe3jovduKnJEZyhhap/O8Xgt6oib3T8kG+kBu+OC+VM1XnPLemj
   R/EWZy/4pnucdw2ief5z4R0bwGayCcpf21COaLZBRGYDzFQOS36Cy2ORK
   A==;
X-CSE-ConnectionGUID: o8F8vs6IRD+CQ/PLkhwxZw==
X-CSE-MsgGUID: h8IQHq4IRO6m3KnyntCPsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="18627357"
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="18627357"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 14:23:23 -0800
X-CSE-ConnectionGUID: ghKlw5OPTNOaTnOcHY/hVw==
X-CSE-MsgGUID: xWAb2iEtSaOC27x6e7tXyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,139,1728975600"; 
   d="scan'208";a="86551244"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Nov 2024 14:23:22 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9XNu-000rqI-31;
	Fri, 08 Nov 2024 22:23:18 +0000
Date: Sat, 9 Nov 2024 06:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v10 19/22] arm64: dts: amlogic: a1: add crypto node
Message-ID: <202411090619.fQTDHg7w-lkp@intel.com>
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
In-Reply-To: <20241108102907.1788584-20-avromanov@salutedevices.com>
References: <20241108102907.1788584-20-avromanov@salutedevices.com>
TO: Alexey Romanov <avromanov@salutedevices.com>
TO: neil.armstrong@linaro.org
TO: clabbe@baylibre.com
TO: herbert@gondor.apana.org.au
TO: davem@davemloft.net
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: khilman@baylibre.com
TO: jbrunet@baylibre.com
TO: martin.blumenstingl@googlemail.com
TO: vadim.fedorenko@linux.dev
CC: linux-crypto@vger.kernel.org
CC: linux-amlogic@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: kernel@salutedevices.com
CC: Alexey Romanov <avromanov@salutedevices.com>

Hi Alexey,

kernel test robot noticed the following build warnings:

[auto build test WARNING on herbert-cryptodev-2.6/master]
[also build test WARNING on next-20241108]
[cannot apply to herbert-crypto-2.6/master robh/for-next linus/master v6.12-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Romanov/crypto-amlogic-Don-t-hardcode-IRQ-count/20241108-183503
base:   https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git master
patch link:    https://lore.kernel.org/r/20241108102907.1788584-20-avromanov%40salutedevices.com
patch subject: [PATCH v10 19/22] arm64: dts: amlogic: a1: add crypto node
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-003-20241109 (https://download.01.org/0day-ci/archive/20241109/202411090619.fQTDHg7w-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411090619.fQTDHg7w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411090619.fQTDHg7w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:122.33-291.6: Warning (unit_address_vs_reg): /soc/bus@fe000000/pinctrl@400: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/amlogic/meson-a1.dtsi:103.16-107.5: Warning (simple_bus_reg): /soc/clk81: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-a1.dtsi:122.33-291.6: Warning (simple_bus_reg): /soc/bus@fe000000/pinctrl@400: missing or empty reg/ranges property

vim +103 arch/arm64/boot/dts/amlogic/meson-a1.dtsi

b255e1268b0b3d Jianxin Pan         2019-09-12   13  
b255e1268b0b3d Jianxin Pan         2019-09-12   14  / {
b255e1268b0b3d Jianxin Pan         2019-09-12   15  	compatible = "amlogic,a1";
b255e1268b0b3d Jianxin Pan         2019-09-12   16  
b255e1268b0b3d Jianxin Pan         2019-09-12   17  	interrupt-parent = <&gic>;
b255e1268b0b3d Jianxin Pan         2019-09-12   18  	#address-cells = <2>;
b255e1268b0b3d Jianxin Pan         2019-09-12   19  	#size-cells = <2>;
b255e1268b0b3d Jianxin Pan         2019-09-12   20  
b255e1268b0b3d Jianxin Pan         2019-09-12   21  	cpus {
b255e1268b0b3d Jianxin Pan         2019-09-12   22  		#address-cells = <2>;
b255e1268b0b3d Jianxin Pan         2019-09-12   23  		#size-cells = <0>;
b255e1268b0b3d Jianxin Pan         2019-09-12   24  
b255e1268b0b3d Jianxin Pan         2019-09-12   25  		cpu0: cpu@0 {
b255e1268b0b3d Jianxin Pan         2019-09-12   26  			device_type = "cpu";
b255e1268b0b3d Jianxin Pan         2019-09-12   27  			compatible = "arm,cortex-a35";
b255e1268b0b3d Jianxin Pan         2019-09-12   28  			reg = <0x0 0x0>;
b255e1268b0b3d Jianxin Pan         2019-09-12   29  			enable-method = "psci";
b255e1268b0b3d Jianxin Pan         2019-09-12   30  			next-level-cache = <&l2>;
947bde9069c824 Dmitry Rokosov      2024-03-28   31  			#cooling-cells = <2>;
b255e1268b0b3d Jianxin Pan         2019-09-12   32  		};
b255e1268b0b3d Jianxin Pan         2019-09-12   33  
b255e1268b0b3d Jianxin Pan         2019-09-12   34  		cpu1: cpu@1 {
b255e1268b0b3d Jianxin Pan         2019-09-12   35  			device_type = "cpu";
b255e1268b0b3d Jianxin Pan         2019-09-12   36  			compatible = "arm,cortex-a35";
b255e1268b0b3d Jianxin Pan         2019-09-12   37  			reg = <0x0 0x1>;
b255e1268b0b3d Jianxin Pan         2019-09-12   38  			enable-method = "psci";
b255e1268b0b3d Jianxin Pan         2019-09-12   39  			next-level-cache = <&l2>;
947bde9069c824 Dmitry Rokosov      2024-03-28   40  			#cooling-cells = <2>;
b255e1268b0b3d Jianxin Pan         2019-09-12   41  		};
b255e1268b0b3d Jianxin Pan         2019-09-12   42  
b255e1268b0b3d Jianxin Pan         2019-09-12   43  		l2: l2-cache0 {
b255e1268b0b3d Jianxin Pan         2019-09-12   44  			compatible = "cache";
49f65e2eaaf96d Pierre Gondois      2022-11-07   45  			cache-level = <2>;
c2258a94fae556 Krzysztof Kozlowski 2023-04-22   46  			cache-unified;
b255e1268b0b3d Jianxin Pan         2019-09-12   47  		};
b255e1268b0b3d Jianxin Pan         2019-09-12   48  	};
b255e1268b0b3d Jianxin Pan         2019-09-12   49  
28b2f803401b75 Alexey Romanov      2023-08-24   50  	efuse: efuse {
28b2f803401b75 Alexey Romanov      2023-08-24   51  		compatible = "amlogic,meson-gxbb-efuse";
28b2f803401b75 Alexey Romanov      2023-08-24   52  		clocks = <&clkc_periphs CLKID_OTP>;
28b2f803401b75 Alexey Romanov      2023-08-24   53  		#address-cells = <1>;
28b2f803401b75 Alexey Romanov      2023-08-24   54  		#size-cells = <1>;
28b2f803401b75 Alexey Romanov      2023-08-24   55  		secure-monitor = <&sm>;
28b2f803401b75 Alexey Romanov      2023-08-24   56  		power-domains = <&pwrc PWRC_OTP_ID>;
28b2f803401b75 Alexey Romanov      2023-08-24   57  	};
28b2f803401b75 Alexey Romanov      2023-08-24   58  
b255e1268b0b3d Jianxin Pan         2019-09-12   59  	psci {
b255e1268b0b3d Jianxin Pan         2019-09-12   60  		compatible = "arm,psci-1.0";
b255e1268b0b3d Jianxin Pan         2019-09-12   61  		method = "smc";
b255e1268b0b3d Jianxin Pan         2019-09-12   62  	};
b255e1268b0b3d Jianxin Pan         2019-09-12   63  
b255e1268b0b3d Jianxin Pan         2019-09-12   64  	reserved-memory {
b255e1268b0b3d Jianxin Pan         2019-09-12   65  		#address-cells = <2>;
b255e1268b0b3d Jianxin Pan         2019-09-12   66  		#size-cells = <2>;
b255e1268b0b3d Jianxin Pan         2019-09-12   67  		ranges;
b255e1268b0b3d Jianxin Pan         2019-09-12   68  
b255e1268b0b3d Jianxin Pan         2019-09-12   69  		linux,cma {
b255e1268b0b3d Jianxin Pan         2019-09-12   70  			compatible = "shared-dma-pool";
b255e1268b0b3d Jianxin Pan         2019-09-12   71  			reusable;
b255e1268b0b3d Jianxin Pan         2019-09-12   72  			size = <0x0 0x800000>;
b255e1268b0b3d Jianxin Pan         2019-09-12   73  			alignment = <0x0 0x400000>;
b255e1268b0b3d Jianxin Pan         2019-09-12   74  			linux,cma-default;
b255e1268b0b3d Jianxin Pan         2019-09-12   75  		};
b255e1268b0b3d Jianxin Pan         2019-09-12   76  	};
b255e1268b0b3d Jianxin Pan         2019-09-12   77  
b255e1268b0b3d Jianxin Pan         2019-09-12   78  	sm: secure-monitor {
b255e1268b0b3d Jianxin Pan         2019-09-12   79  		compatible = "amlogic,meson-gxbb-sm";
04dd0b6584cd0f Jianxin Pan         2020-01-15   80  
04dd0b6584cd0f Jianxin Pan         2020-01-15   81  		pwrc: power-controller {
04dd0b6584cd0f Jianxin Pan         2020-01-15   82  			compatible = "amlogic,meson-a1-pwrc";
04dd0b6584cd0f Jianxin Pan         2020-01-15   83  			#power-domain-cells = <1>;
04dd0b6584cd0f Jianxin Pan         2020-01-15   84  		};
b255e1268b0b3d Jianxin Pan         2019-09-12   85  	};
b255e1268b0b3d Jianxin Pan         2019-09-12   86  
b255e1268b0b3d Jianxin Pan         2019-09-12   87  	soc {
b255e1268b0b3d Jianxin Pan         2019-09-12   88  		compatible = "simple-bus";
b255e1268b0b3d Jianxin Pan         2019-09-12   89  		#address-cells = <2>;
b255e1268b0b3d Jianxin Pan         2019-09-12   90  		#size-cells = <2>;
b255e1268b0b3d Jianxin Pan         2019-09-12   91  		ranges;
b255e1268b0b3d Jianxin Pan         2019-09-12   92  
8a398729c9b3de Martin Kurbanov     2023-08-24   93  		spifc: spi@fd000400 {
8a398729c9b3de Martin Kurbanov     2023-08-24   94  			compatible = "amlogic,a1-spifc";
8a398729c9b3de Martin Kurbanov     2023-08-24   95  			reg = <0x0 0xfd000400 0x0 0x290>;
8a398729c9b3de Martin Kurbanov     2023-08-24   96  			clocks = <&clkc_periphs CLKID_SPIFC>;
8a398729c9b3de Martin Kurbanov     2023-08-24   97  			#address-cells = <1>;
8a398729c9b3de Martin Kurbanov     2023-08-24   98  			#size-cells = <0>;
8a398729c9b3de Martin Kurbanov     2023-08-24   99  			power-domains = <&pwrc PWRC_SPIFC_ID>;
8a398729c9b3de Martin Kurbanov     2023-08-24  100  			status = "disabled";
8a398729c9b3de Martin Kurbanov     2023-08-24  101  		};
8a398729c9b3de Martin Kurbanov     2023-08-24  102  
4a8fb108d6a462 Alexey Romanov      2024-11-08 @103  		clk81: clk81 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
