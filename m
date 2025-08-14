Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5EAF22D78F
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 08:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755159206; cv=none; b=iF4Btd9gm9c8y5P4ApXCSn/WKSzbLCvTDOkqP1Yhqd7f1ARGer4Gg7uie1Ut7p7ebTLSJYot9incQukZYKU3i4oiaL5Dw0A3u7lWZSb/40GBObC4Xkc0p6DS59m7g1MCwmALkKKSS2HzvxG+O6QaYVS9jEJIIEfT6Y/TN4jkYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755159206; c=relaxed/simple;
	bh=9ztKAKY+a9rIgyb3vN2nJKbfk+3XYK1MK6qTrSHcZ7U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JHw3xMwFVzbRarDJCgSFk3hdX3UYdzitmrjRMf8wU0qfpGQPmUvofSz4d8WzNoSHeIgE/a+vde1eQojkcmDtkOxTNHYFRY/mkuAa/Us4b18yJ6JvLqc1jf5a8FKLq9ucqsMk2SeULhSVQCypaKgwPQko55YJv6NlQ49FMAE9gT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TYL9yTq5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TYL9yTq5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755159204; x=1786695204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ztKAKY+a9rIgyb3vN2nJKbfk+3XYK1MK6qTrSHcZ7U=;
  b=TYL9yTq5I73/1yMQ4SnU+0zzaoYuAc3Yt6ZMsmeTfphQ7i0z34uKm7VX
   juL+H7iVjGrdIAaSa5fWf3ihUkZPHU7pa4eS3ddesI7g+2UvBa8RPCVzb
   GIFErRB6Uz7lcKzStg4lRxo8d+3Hf5AxiL//4i/GiRIHLBJ31Ylg8juyn
   9ZyFCL0Z96bdoLCvRvKPXFo5U09DaRHjgw0gjBspzDt826IootA2SKlsv
   IRLJLytJUqK9m96jWOGA1hPCeik9vwlMKOrUkSVl/+02SnJgN1XKCCrGE
   uTTUpUrYDRA2JJtfJlqZfAA/PdOENDXUNAS8hPFvGUukyJzWVjDzDZYR6
   w==;
X-CSE-ConnectionGUID: s23KYJe9TQ+IykEhaAZhpg==
X-CSE-MsgGUID: HDQIniDcSuST874zksZmOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57536132"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="57536132"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 01:13:23 -0700
X-CSE-ConnectionGUID: O99eXUtFQt+uvXD8zDxl4A==
X-CSE-MsgGUID: XfkhlkBLTQCsyNurK4I+DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="170930896"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 14 Aug 2025 01:13:22 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umT5L-0000EH-0u;
	Thu, 14 Aug 2025 08:13:19 +0000
Date: Thu, 14 Aug 2025 10:13:10 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arc/boot/dts/hsdk.dts:109.6-341.4: Warning
 (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit
 name
Message-ID: <202508141052.7aa2ocgy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: linux-snps-arc@lists.infradead.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9
commit: 3b7f793acc13b6108452271b306d4aa94a3c4940 ARC: migrate to the generic rule for built-in DTB
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: arc-hsdk_defconfig (https://download.01.org/0day-ci/archive/20250814/202508141052.7aa2ocgy-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141052.7aa2ocgy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508141052.7aa2ocgy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arc/boot/dts/hsdk.dts:109.6-341.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arc/boot/dts/hsdk.dts:148.20-152.5: Warning (simple_bus_reg): /soc/gmacclk: missing or empty reg/ranges property
>> arch/arc/boot/dts/hsdk.dts:154.26-169.5: Warning (simple_bus_reg): /soc/mmcclk-ciu: missing or empty reg/ranges property
>> arch/arc/boot/dts/hsdk.dts:171.26-175.5: Warning (simple_bus_reg): /soc/mmcclk-biu: missing or empty reg/ranges property
>> arch/arc/boot/dts/hsdk.dts:177.30-181.5: Warning (simple_bus_reg): /soc/gpu-core-clk: missing or empty reg/ranges property
>> arch/arc/boot/dts/hsdk.dts:183.28-187.5: Warning (simple_bus_reg): /soc/gpu-dma-clk: missing or empty reg/ranges property
>> arch/arc/boot/dts/hsdk.dts:189.28-193.5: Warning (simple_bus_reg): /soc/gpu-cfg-clk: missing or empty reg/ranges property
>> arch/arc/boot/dts/hsdk.dts:195.32-199.5: Warning (simple_bus_reg): /soc/dmac-core-clk: missing or empty reg/ranges property
>> arch/arc/boot/dts/hsdk.dts:201.34-205.5: Warning (simple_bus_reg): /soc/dmac-gpu-cfg-clk: missing or empty reg/ranges property

vim +109 arch/arc/boot/dts/hsdk.dts

a518d63777a4e9 Alexey Brodkin  2017-08-15   13  
a518d63777a4e9 Alexey Brodkin  2017-08-15   14  / {
a518d63777a4e9 Alexey Brodkin  2017-08-15   15  	model = "snps,hsdk";
a518d63777a4e9 Alexey Brodkin  2017-08-15   16  	compatible = "snps,hsdk";
a518d63777a4e9 Alexey Brodkin  2017-08-15   17  
21cee1bd1594b2 Vineet Gupta    2019-04-02   18  	#address-cells = <2>;
21cee1bd1594b2 Vineet Gupta    2019-04-02   19  	#size-cells = <2>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   20  
a518d63777a4e9 Alexey Brodkin  2017-08-15   21  	chosen {
a518d63777a4e9 Alexey Brodkin  2017-08-15   22  		bootargs = "earlycon=uart8250,mmio32,0xf0005000,115200n8 console=ttyS0,115200n8 debug print-fatal-signals=1";
a518d63777a4e9 Alexey Brodkin  2017-08-15   23  	};
a518d63777a4e9 Alexey Brodkin  2017-08-15   24  
5c0920897af597 Alexey Brodkin  2018-08-02   25  	aliases {
5c0920897af597 Alexey Brodkin  2018-08-02   26  		ethernet = &gmac;
5c0920897af597 Alexey Brodkin  2018-08-02   27  	};
5c0920897af597 Alexey Brodkin  2018-08-02   28  
a518d63777a4e9 Alexey Brodkin  2017-08-15   29  	cpus {
a518d63777a4e9 Alexey Brodkin  2017-08-15   30  		#address-cells = <1>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   31  		#size-cells = <0>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   32  
a518d63777a4e9 Alexey Brodkin  2017-08-15   33  		cpu@0 {
a518d63777a4e9 Alexey Brodkin  2017-08-15   34  			device_type = "cpu";
a518d63777a4e9 Alexey Brodkin  2017-08-15   35  			compatible = "snps,archs38";
a518d63777a4e9 Alexey Brodkin  2017-08-15   36  			reg = <0>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   37  			clocks = <&core_clk>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   38  		};
a518d63777a4e9 Alexey Brodkin  2017-08-15   39  
a518d63777a4e9 Alexey Brodkin  2017-08-15   40  		cpu@1 {
a518d63777a4e9 Alexey Brodkin  2017-08-15   41  			device_type = "cpu";
a518d63777a4e9 Alexey Brodkin  2017-08-15   42  			compatible = "snps,archs38";
a518d63777a4e9 Alexey Brodkin  2017-08-15   43  			reg = <1>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   44  			clocks = <&core_clk>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   45  		};
a518d63777a4e9 Alexey Brodkin  2017-08-15   46  
a518d63777a4e9 Alexey Brodkin  2017-08-15   47  		cpu@2 {
a518d63777a4e9 Alexey Brodkin  2017-08-15   48  			device_type = "cpu";
a518d63777a4e9 Alexey Brodkin  2017-08-15   49  			compatible = "snps,archs38";
a518d63777a4e9 Alexey Brodkin  2017-08-15   50  			reg = <2>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   51  			clocks = <&core_clk>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   52  		};
a518d63777a4e9 Alexey Brodkin  2017-08-15   53  
a518d63777a4e9 Alexey Brodkin  2017-08-15   54  		cpu@3 {
a518d63777a4e9 Alexey Brodkin  2017-08-15   55  			device_type = "cpu";
a518d63777a4e9 Alexey Brodkin  2017-08-15   56  			compatible = "snps,archs38";
a518d63777a4e9 Alexey Brodkin  2017-08-15   57  			reg = <3>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   58  			clocks = <&core_clk>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   59  		};
a518d63777a4e9 Alexey Brodkin  2017-08-15   60  	};
a518d63777a4e9 Alexey Brodkin  2017-08-15   61  
ef833eab1ddec0 Eugeniy Paltsev 2017-09-04   62  	input_clk: input-clk {
a518d63777a4e9 Alexey Brodkin  2017-08-15   63  		#clock-cells = <0>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   64  		compatible = "fixed-clock";
ef833eab1ddec0 Eugeniy Paltsev 2017-09-04   65  		clock-frequency = <33333333>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   66  	};
a518d63777a4e9 Alexey Brodkin  2017-08-15   67  
ab563bf54a4d08 Eugeniy Paltsev 2019-10-18   68  	reg_5v0: regulator-5v0 {
ab563bf54a4d08 Eugeniy Paltsev 2019-10-18   69  		compatible = "regulator-fixed";
ab563bf54a4d08 Eugeniy Paltsev 2019-10-18   70  
ab563bf54a4d08 Eugeniy Paltsev 2019-10-18   71  		regulator-name = "5v0-supply";
ab563bf54a4d08 Eugeniy Paltsev 2019-10-18   72  		regulator-min-microvolt = <5000000>;
ab563bf54a4d08 Eugeniy Paltsev 2019-10-18   73  		regulator-max-microvolt = <5000000>;
ab563bf54a4d08 Eugeniy Paltsev 2019-10-18   74  	};
ab563bf54a4d08 Eugeniy Paltsev 2019-10-18   75  
a518d63777a4e9 Alexey Brodkin  2017-08-15   76  	cpu_intc: cpu-interrupt-controller {
a518d63777a4e9 Alexey Brodkin  2017-08-15   77  		compatible = "snps,archs-intc";
a518d63777a4e9 Alexey Brodkin  2017-08-15   78  		interrupt-controller;
a518d63777a4e9 Alexey Brodkin  2017-08-15   79  		#interrupt-cells = <1>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   80  	};
a518d63777a4e9 Alexey Brodkin  2017-08-15   81  
a518d63777a4e9 Alexey Brodkin  2017-08-15   82  	idu_intc: idu-interrupt-controller {
a518d63777a4e9 Alexey Brodkin  2017-08-15   83  		compatible = "snps,archs-idu-intc";
a518d63777a4e9 Alexey Brodkin  2017-08-15   84  		interrupt-controller;
a518d63777a4e9 Alexey Brodkin  2017-08-15   85  		#interrupt-cells = <1>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   86  		interrupt-parent = <&cpu_intc>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   87  	};
a518d63777a4e9 Alexey Brodkin  2017-08-15   88  
a518d63777a4e9 Alexey Brodkin  2017-08-15   89  	arcpct: pct {
a518d63777a4e9 Alexey Brodkin  2017-08-15   90  		compatible = "snps,archs-pct";
fe81d927b78c4f Vineet Gupta    2020-07-09   91  		interrupt-parent = <&cpu_intc>;
fe81d927b78c4f Vineet Gupta    2020-07-09   92  		interrupts = <20>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   93  	};
a518d63777a4e9 Alexey Brodkin  2017-08-15   94  
a518d63777a4e9 Alexey Brodkin  2017-08-15   95  	/* TIMER0 with interrupt for clockevent */
a518d63777a4e9 Alexey Brodkin  2017-08-15   96  	timer {
a518d63777a4e9 Alexey Brodkin  2017-08-15   97  		compatible = "snps,arc-timer";
a518d63777a4e9 Alexey Brodkin  2017-08-15   98  		interrupts = <16>;
a518d63777a4e9 Alexey Brodkin  2017-08-15   99  		interrupt-parent = <&cpu_intc>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  100  		clocks = <&core_clk>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  101  	};
a518d63777a4e9 Alexey Brodkin  2017-08-15  102  
a518d63777a4e9 Alexey Brodkin  2017-08-15  103  	/* 64-bit Global Free Running Counter */
a518d63777a4e9 Alexey Brodkin  2017-08-15  104  	gfrc {
a518d63777a4e9 Alexey Brodkin  2017-08-15  105  		compatible = "snps,archs-timer-gfrc";
a518d63777a4e9 Alexey Brodkin  2017-08-15  106  		clocks = <&core_clk>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  107  	};
a518d63777a4e9 Alexey Brodkin  2017-08-15  108  
a518d63777a4e9 Alexey Brodkin  2017-08-15 @109  	soc {
a518d63777a4e9 Alexey Brodkin  2017-08-15  110  		compatible = "simple-bus";
a518d63777a4e9 Alexey Brodkin  2017-08-15  111  		#address-cells = <1>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  112  		#size-cells = <1>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  113  		interrupt-parent = <&idu_intc>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  114  
21cee1bd1594b2 Vineet Gupta    2019-04-02  115  		ranges = <0x00000000 0x0 0xf0000000 0x10000000>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  116  
ab8eb7db1dcc03 Eugeniy Paltsev 2017-09-22  117  		cgu_rst: reset-controller@8a0 {
ab8eb7db1dcc03 Eugeniy Paltsev 2017-09-22  118  			compatible = "snps,hsdk-reset";
ab8eb7db1dcc03 Eugeniy Paltsev 2017-09-22  119  			#reset-cells = <1>;
ef4c54c340de47 Alexey Brodkin  2019-01-24  120  			reg = <0x8a0 0x4>, <0xff0 0x4>;
ab8eb7db1dcc03 Eugeniy Paltsev 2017-09-22  121  		};
ab8eb7db1dcc03 Eugeniy Paltsev 2017-09-22  122  
ef833eab1ddec0 Eugeniy Paltsev 2017-09-04  123  		core_clk: core-clk@0 {
ef833eab1ddec0 Eugeniy Paltsev 2017-09-04  124  			compatible = "snps,hsdk-core-pll-clock";
ef4c54c340de47 Alexey Brodkin  2019-01-24  125  			reg = <0x00 0x10>, <0x14b8 0x4>;
ef833eab1ddec0 Eugeniy Paltsev 2017-09-04  126  			#clock-cells = <0>;
ef833eab1ddec0 Eugeniy Paltsev 2017-09-04  127  			clocks = <&input_clk>;
a08c832f277d7a Eugeniy Paltsev 2017-12-09  128  
a08c832f277d7a Eugeniy Paltsev 2017-12-09  129  			/*
a08c832f277d7a Eugeniy Paltsev 2017-12-09  130  			 * Set initial core pll output frequency to 1GHz.
a08c832f277d7a Eugeniy Paltsev 2017-12-09  131  			 * It will be applied at the core pll driver probing
a08c832f277d7a Eugeniy Paltsev 2017-12-09  132  			 * on early boot.
a08c832f277d7a Eugeniy Paltsev 2017-12-09  133  			 */
a08c832f277d7a Eugeniy Paltsev 2017-12-09  134  			assigned-clocks = <&core_clk>;
a08c832f277d7a Eugeniy Paltsev 2017-12-09  135  			assigned-clock-rates = <1000000000>;
ef833eab1ddec0 Eugeniy Paltsev 2017-09-04  136  		};
ef833eab1ddec0 Eugeniy Paltsev 2017-09-04  137  
a518d63777a4e9 Alexey Brodkin  2017-08-15  138  		serial: serial@5000 {
a518d63777a4e9 Alexey Brodkin  2017-08-15  139  			compatible = "snps,dw-apb-uart";
a518d63777a4e9 Alexey Brodkin  2017-08-15  140  			reg = <0x5000 0x100>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  141  			clock-frequency = <33330000>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  142  			interrupts = <6>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  143  			baud = <115200>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  144  			reg-shift = <2>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  145  			reg-io-width = <4>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  146  		};
a518d63777a4e9 Alexey Brodkin  2017-08-15  147  
a518d63777a4e9 Alexey Brodkin  2017-08-15 @148  		gmacclk: gmacclk {
a518d63777a4e9 Alexey Brodkin  2017-08-15  149  			compatible = "fixed-clock";
a518d63777a4e9 Alexey Brodkin  2017-08-15  150  			clock-frequency = <400000000>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  151  			#clock-cells = <0>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  152  		};
a518d63777a4e9 Alexey Brodkin  2017-08-15  153  
a518d63777a4e9 Alexey Brodkin  2017-08-15 @154  		mmcclk_ciu: mmcclk-ciu {
a518d63777a4e9 Alexey Brodkin  2017-08-15  155  			compatible = "fixed-clock";
6afa3bcf1f919c Eugeniy Paltsev 2017-09-08  156  			/*
6afa3bcf1f919c Eugeniy Paltsev 2017-09-08  157  			 * DW sdio controller has external ciu clock divider
6afa3bcf1f919c Eugeniy Paltsev 2017-09-08  158  			 * controlled via register in SDIO IP. Due to its
753affba96d360 Eugeniy Paltsev 2017-10-11  159  			 * unexpected default value (it should divide by 1
753affba96d360 Eugeniy Paltsev 2017-10-11  160  			 * but it divides by 8) SDIO IP uses wrong clock and
6afa3bcf1f919c Eugeniy Paltsev 2017-09-08  161  			 * works unstable (see STAR 9001204800)
753affba96d360 Eugeniy Paltsev 2017-10-11  162  			 * We switched to the minimum possible value of the
753affba96d360 Eugeniy Paltsev 2017-10-11  163  			 * divisor (div-by-2) in HSDK platform code.
6afa3bcf1f919c Eugeniy Paltsev 2017-09-08  164  			 * So add temporary fix and change clock frequency
753affba96d360 Eugeniy Paltsev 2017-10-11  165  			 * to 50000000 Hz until we fix dw sdio driver itself.
6afa3bcf1f919c Eugeniy Paltsev 2017-09-08  166  			 */
753affba96d360 Eugeniy Paltsev 2017-10-11  167  			clock-frequency = <50000000>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  168  			#clock-cells = <0>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  169  		};
a518d63777a4e9 Alexey Brodkin  2017-08-15  170  
a518d63777a4e9 Alexey Brodkin  2017-08-15 @171  		mmcclk_biu: mmcclk-biu {
a518d63777a4e9 Alexey Brodkin  2017-08-15  172  			compatible = "fixed-clock";
a518d63777a4e9 Alexey Brodkin  2017-08-15  173  			clock-frequency = <400000000>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  174  			#clock-cells = <0>;
a518d63777a4e9 Alexey Brodkin  2017-08-15  175  		};
a518d63777a4e9 Alexey Brodkin  2017-08-15  176  
b04700645d78e1 Eugeniy Paltsev 2019-05-21 @177  		gpu_core_clk: gpu-core-clk {
b04700645d78e1 Eugeniy Paltsev 2019-05-21  178  			compatible = "fixed-clock";
b04700645d78e1 Eugeniy Paltsev 2019-05-21  179  			clock-frequency = <400000000>;
b04700645d78e1 Eugeniy Paltsev 2019-05-21  180  			#clock-cells = <0>;
b04700645d78e1 Eugeniy Paltsev 2019-05-21  181  		};
b04700645d78e1 Eugeniy Paltsev 2019-05-21  182  
b04700645d78e1 Eugeniy Paltsev 2019-05-21 @183  		gpu_dma_clk: gpu-dma-clk {
b04700645d78e1 Eugeniy Paltsev 2019-05-21  184  			compatible = "fixed-clock";
b04700645d78e1 Eugeniy Paltsev 2019-05-21  185  			clock-frequency = <400000000>;
b04700645d78e1 Eugeniy Paltsev 2019-05-21  186  			#clock-cells = <0>;
b04700645d78e1 Eugeniy Paltsev 2019-05-21  187  		};
b04700645d78e1 Eugeniy Paltsev 2019-05-21  188  
b04700645d78e1 Eugeniy Paltsev 2019-05-21 @189  		gpu_cfg_clk: gpu-cfg-clk {
b04700645d78e1 Eugeniy Paltsev 2019-05-21  190  			compatible = "fixed-clock";
b04700645d78e1 Eugeniy Paltsev 2019-05-21  191  			clock-frequency = <200000000>;
b04700645d78e1 Eugeniy Paltsev 2019-05-21  192  			#clock-cells = <0>;
b04700645d78e1 Eugeniy Paltsev 2019-05-21  193  		};
b04700645d78e1 Eugeniy Paltsev 2019-05-21  194  
5d4ab8d0960e39 Eugeniy Paltsev 2019-02-19 @195  		dmac_core_clk: dmac-core-clk {
5d4ab8d0960e39 Eugeniy Paltsev 2019-02-19  196  			compatible = "fixed-clock";
5d4ab8d0960e39 Eugeniy Paltsev 2019-02-19  197  			clock-frequency = <400000000>;
5d4ab8d0960e39 Eugeniy Paltsev 2019-02-19  198  			#clock-cells = <0>;
5d4ab8d0960e39 Eugeniy Paltsev 2019-02-19  199  		};
5d4ab8d0960e39 Eugeniy Paltsev 2019-02-19  200  
5d4ab8d0960e39 Eugeniy Paltsev 2019-02-19 @201  		dmac_cfg_clk: dmac-gpu-cfg-clk {

:::::: The code at line 109 was first introduced by commit
:::::: a518d63777a4e94e4b2dd86501604ec49ffe86b2 ARC: [plat-hsdk] initial port for HSDK board

:::::: TO: Alexey Brodkin <abrodkin@synopsys.com>
:::::: CC: Vineet Gupta <vgupta@synopsys.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
