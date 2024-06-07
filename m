Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6508B10F4
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Jun 2024 00:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717721240; cv=none; b=ABkhcN4P7ZM2gptxITYLTgNrDAyYx5Gnlyq1DxBFYrWJoCOspTgvHAqv6zIDbbwOQCgsDIZHBKP2xPMX8/1uFE6MxO83X4ubvahks+ZiwvIDjbn1LDlCjyFpzPLHdWj/wFa9GHz0v5XDYkxbSuHDVwzlp6LinNusNJmJT5Mxrdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717721240; c=relaxed/simple;
	bh=SfihLPZWIqMXncf7hkY8hGy5garcTiNXjhW3ywXL90A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t2WkuLkbRiKx8RH+2e8Jj2yzJdA27R3KMUsgB8+YbUP3tmkn4dWjkesEMekGyzMBQSRlJQmwJG4jKwJ2fwlxPauJEqyvpHgXpGyM0WvoJf40VOipUTjJekgQifOSJRz/L+5npIEgB/7+fuF3G8CiLl3Dt4tVWVmA4P3/4QYWYns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkdllIO5; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkdllIO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717721236; x=1749257236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SfihLPZWIqMXncf7hkY8hGy5garcTiNXjhW3ywXL90A=;
  b=DkdllIO58lLk2xO1yPvY4oXp+v91B+RMjtgPDeOPFkLcU9KSR2Nfuqhs
   RVnlOUxqu0YgTQZ2Tc5i8S7gO5WR90VKm6OCtyNGJLxB6Xa8LKM8xtOmT
   0G6SsOBwjU5CVcmxX5m9xbzecQXOl87SVqva7juTqdvGGwb6eI/7n7wbQ
   ujONBLchna1/r02Qjq5Pie/BBl0TzLTrtQyytG03S2SKDNnJzVC76k+1i
   4dSbIPHJvLFkvAMMfBxq7DiNP64UIRI14JpLdxDOEPd1i551Kc803VnLH
   kr6FWEhQA4Eoy5rth+RQhMCDJJN/IOO0jV68g8FzQUJSDUtGZtdVGJSTB
   w==;
X-CSE-ConnectionGUID: IBGSFV2BRJmZ8rRdv/QGDw==
X-CSE-MsgGUID: ol+L06raQ5+YnK3yQi3HFg==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="31917735"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="31917735"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 17:47:16 -0700
X-CSE-ConnectionGUID: JdEG1IHcTBqQQbBazbIa0w==
X-CSE-MsgGUID: 86BQvMAASCmxw6b+x/y5Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="43251653"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 06 Jun 2024 17:47:14 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFNlA-0003wE-0B;
	Fri, 07 Jun 2024 00:47:12 +0000
Date: Fri, 7 Jun 2024 08:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-ak4619-for-v6.1-2024-06-03 3374/17202]
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi:714.25-745.5: Warning
 (unique_unit_address): /soc/pcie@e65d0000: duplicate unit-address (also used
 in node /soc/pcie-ep@e65d0000)
Message-ID: <202406070812.flMMoYvF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/boot/dts/renesas/r8a779f0.dtsi:714.25-745.5: Warning (unique_unit_address): /soc/pcie@e65d0000: duplicate unit-address (also used in node /soc/pcie-ep@e65d0000)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

tree:   https://github.com/morimoto/linux sound-ak4619-for-v6.1-2024-06-03
head:   fcb2c815fbf0f03847caecb88b5f1da7d72c7123
commit: e4053d3462c6f3714937a08d4c4035492c2148a7 [3374/17202] arm64: dts: renesas: r8a779f0: Add PCIe Host and Endpoint nodes
:::::: branch date: 4 days ago
:::::: commit date: 1 year, 4 months ago
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070812.flMMoYvF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406070812.flMMoYvF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779f0.dtsi:714.25-745.5: Warning (unique_unit_address): /soc/pcie@e65d0000: duplicate unit-address (also used in node /soc/pcie-ep@e65d0000)
>> arch/arm64/boot/dts/renesas/r8a779f0.dtsi:747.25-778.5: Warning (unique_unit_address): /soc/pcie@e65d8000: duplicate unit-address (also used in node /soc/pcie-ep@e65d8000)

vim +714 arch/arm64/boot/dts/renesas/r8a779f0.dtsi

c62331e8222f8f Yoshihiro Shimoda  2021-12-01   11  
c62331e8222f8f Yoshihiro Shimoda  2021-12-01   12  / {
c62331e8222f8f Yoshihiro Shimoda  2021-12-01   13  	compatible = "renesas,r8a779f0";
c62331e8222f8f Yoshihiro Shimoda  2021-12-01   14  	#address-cells = <2>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01   15  	#size-cells = <2>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01   16  
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   17  	cluster01_opp: opp-table-0 {
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   18  		compatible = "operating-points-v2";
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   19  		opp-shared;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   20  
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   21  		opp-500000000 {
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   22  			opp-hz = /bits/ 64 <500000000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   23  			opp-microvolt = <880000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   24  			clock-latency-ns = <500000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   25  		};
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   26  		opp-800000000 {
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   27  			opp-hz = /bits/ 64 <800000000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   28  			opp-microvolt = <880000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   29  			clock-latency-ns = <500000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   30  		};
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   31  		opp-1000000000 {
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   32  			opp-hz = /bits/ 64 <1000000000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   33  			opp-microvolt = <880000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   34  			clock-latency-ns = <500000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   35  		};
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   36  		opp-1200000000 {
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   37  			opp-hz = /bits/ 64 <1200000000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   38  			opp-microvolt = <880000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   39  			clock-latency-ns = <500000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   40  			opp-suspend;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   41  		};
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   42  	};
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   43  
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   44  	cluster23_opp: opp-table-1 {
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   45  		compatible = "operating-points-v2";
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   46  		opp-shared;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   47  
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   48  		opp-500000000 {
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   49  			opp-hz = /bits/ 64 <500000000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   50  			opp-microvolt = <880000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   51  			clock-latency-ns = <500000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   52  		};
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   53  		opp-800000000 {
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   54  			opp-hz = /bits/ 64 <800000000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   55  			opp-microvolt = <880000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   56  			clock-latency-ns = <500000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   57  		};
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   58  		opp-1000000000 {
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   59  			opp-hz = /bits/ 64 <1000000000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   60  			opp-microvolt = <880000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   61  			clock-latency-ns = <500000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   62  		};
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   63  		opp-1200000000 {
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   64  			opp-hz = /bits/ 64 <1200000000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   65  			opp-microvolt = <880000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   66  			clock-latency-ns = <500000>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   67  			opp-suspend;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   68  		};
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   69  	};
662f61eed2c5bf Geert Uytterhoeven 2022-11-30   70  
c62331e8222f8f Yoshihiro Shimoda  2021-12-01   71  	cpus {
c62331e8222f8f Yoshihiro Shimoda  2021-12-01   72  		#address-cells = <1>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01   73  		#size-cells = <0>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01   74  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   75  		cpu-map {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   76  			cluster0 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   77  				core0 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   78  					cpu = <&a55_0>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   79  				};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   80  				core1 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   81  					cpu = <&a55_1>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   82  				};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   83  			};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   84  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   85  			cluster1 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   86  				core0 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   87  					cpu = <&a55_2>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   88  				};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   89  				core1 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   90  					cpu = <&a55_3>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   91  				};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   92  			};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   93  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   94  			cluster2 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   95  				core0 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   96  					cpu = <&a55_4>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   97  				};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   98  				core1 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08   99  					cpu = <&a55_5>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  100  				};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  101  			};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  102  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  103  			cluster3 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  104  				core0 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  105  					cpu = <&a55_6>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  106  				};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  107  				core1 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  108  					cpu = <&a55_7>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  109  				};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  110  			};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  111  		};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  112  
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  113  		a55_0: cpu@0 {
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  114  			compatible = "arm,cortex-a55";
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  115  			reg = <0>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  116  			device_type = "cpu";
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  117  			power-domains = <&sysc R8A779F0_PD_A1E0D0C0>;
ffeca49a8ba9aa Geert Uytterhoeven 2022-06-08  118  			next-level-cache = <&L3_CA55_0>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  119  			enable-method = "psci";
9bc7cd07aadeda Tho Vu             2022-06-08  120  			cpu-idle-states = <&CPU_SLEEP_0>;
e5fba0bc8240eb Geert Uytterhoeven 2022-06-08  121  			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30  122  			operating-points-v2 = <&cluster01_opp>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  123  		};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  124  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  125  		a55_1: cpu@100 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  126  			compatible = "arm,cortex-a55";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  127  			reg = <0x100>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  128  			device_type = "cpu";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  129  			power-domains = <&sysc R8A779F0_PD_A1E0D0C1>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  130  			next-level-cache = <&L3_CA55_0>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  131  			enable-method = "psci";
9bc7cd07aadeda Tho Vu             2022-06-08  132  			cpu-idle-states = <&CPU_SLEEP_0>;
e5fba0bc8240eb Geert Uytterhoeven 2022-06-08  133  			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30  134  			operating-points-v2 = <&cluster01_opp>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  135  		};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  136  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  137  		a55_2: cpu@10000 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  138  			compatible = "arm,cortex-a55";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  139  			reg = <0x10000>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  140  			device_type = "cpu";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  141  			power-domains = <&sysc R8A779F0_PD_A1E0D1C0>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  142  			next-level-cache = <&L3_CA55_1>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  143  			enable-method = "psci";
9bc7cd07aadeda Tho Vu             2022-06-08  144  			cpu-idle-states = <&CPU_SLEEP_0>;
e5fba0bc8240eb Geert Uytterhoeven 2022-06-08  145  			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30  146  			operating-points-v2 = <&cluster01_opp>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  147  		};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  148  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  149  		a55_3: cpu@10100 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  150  			compatible = "arm,cortex-a55";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  151  			reg = <0x10100>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  152  			device_type = "cpu";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  153  			power-domains = <&sysc R8A779F0_PD_A1E0D1C1>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  154  			next-level-cache = <&L3_CA55_1>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  155  			enable-method = "psci";
9bc7cd07aadeda Tho Vu             2022-06-08  156  			cpu-idle-states = <&CPU_SLEEP_0>;
e5fba0bc8240eb Geert Uytterhoeven 2022-06-08  157  			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z0>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30  158  			operating-points-v2 = <&cluster01_opp>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  159  		};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  160  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  161  		a55_4: cpu@20000 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  162  			compatible = "arm,cortex-a55";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  163  			reg = <0x20000>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  164  			device_type = "cpu";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  165  			power-domains = <&sysc R8A779F0_PD_A1E1D0C0>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  166  			next-level-cache = <&L3_CA55_2>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  167  			enable-method = "psci";
9bc7cd07aadeda Tho Vu             2022-06-08  168  			cpu-idle-states = <&CPU_SLEEP_0>;
e5fba0bc8240eb Geert Uytterhoeven 2022-06-08  169  			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30  170  			operating-points-v2 = <&cluster23_opp>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  171  		};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  172  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  173  		a55_5: cpu@20100 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  174  			compatible = "arm,cortex-a55";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  175  			reg = <0x20100>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  176  			device_type = "cpu";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  177  			power-domains = <&sysc R8A779F0_PD_A1E1D0C1>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  178  			next-level-cache = <&L3_CA55_2>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  179  			enable-method = "psci";
9bc7cd07aadeda Tho Vu             2022-06-08  180  			cpu-idle-states = <&CPU_SLEEP_0>;
e5fba0bc8240eb Geert Uytterhoeven 2022-06-08  181  			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30  182  			operating-points-v2 = <&cluster23_opp>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  183  		};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  184  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  185  		a55_6: cpu@30000 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  186  			compatible = "arm,cortex-a55";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  187  			reg = <0x30000>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  188  			device_type = "cpu";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  189  			power-domains = <&sysc R8A779F0_PD_A1E1D1C0>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  190  			next-level-cache = <&L3_CA55_3>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  191  			enable-method = "psci";
9bc7cd07aadeda Tho Vu             2022-06-08  192  			cpu-idle-states = <&CPU_SLEEP_0>;
e5fba0bc8240eb Geert Uytterhoeven 2022-06-08  193  			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30  194  			operating-points-v2 = <&cluster23_opp>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  195  		};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  196  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  197  		a55_7: cpu@30100 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  198  			compatible = "arm,cortex-a55";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  199  			reg = <0x30100>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  200  			device_type = "cpu";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  201  			power-domains = <&sysc R8A779F0_PD_A1E1D1C1>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  202  			next-level-cache = <&L3_CA55_3>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  203  			enable-method = "psci";
9bc7cd07aadeda Tho Vu             2022-06-08  204  			cpu-idle-states = <&CPU_SLEEP_0>;
e5fba0bc8240eb Geert Uytterhoeven 2022-06-08  205  			clocks = <&cpg CPG_CORE R8A779F0_CLK_Z1>;
662f61eed2c5bf Geert Uytterhoeven 2022-11-30  206  			operating-points-v2 = <&cluster23_opp>;
ffeca49a8ba9aa Geert Uytterhoeven 2022-06-08  207  		};
ffeca49a8ba9aa Geert Uytterhoeven 2022-06-08  208  
ffeca49a8ba9aa Geert Uytterhoeven 2022-06-08  209  		L3_CA55_0: cache-controller-0 {
ffeca49a8ba9aa Geert Uytterhoeven 2022-06-08  210  			compatible = "cache";
ffeca49a8ba9aa Geert Uytterhoeven 2022-06-08  211  			power-domains = <&sysc R8A779F0_PD_A2E0D0>;
ffeca49a8ba9aa Geert Uytterhoeven 2022-06-08  212  			cache-unified;
ffeca49a8ba9aa Geert Uytterhoeven 2022-06-08  213  			cache-level = <3>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  214  		};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  215  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  216  		L3_CA55_1: cache-controller-1 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  217  			compatible = "cache";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  218  			power-domains = <&sysc R8A779F0_PD_A2E0D1>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  219  			cache-unified;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  220  			cache-level = <3>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  221  		};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  222  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  223  		L3_CA55_2: cache-controller-2 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  224  			compatible = "cache";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  225  			power-domains = <&sysc R8A779F0_PD_A2E1D0>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  226  			cache-unified;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  227  			cache-level = <3>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  228  		};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  229  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  230  		L3_CA55_3: cache-controller-3 {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  231  			compatible = "cache";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  232  			power-domains = <&sysc R8A779F0_PD_A2E1D1>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  233  			cache-unified;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  234  			cache-level = <3>;
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  235  		};
9bc7cd07aadeda Tho Vu             2022-06-08  236  
9bc7cd07aadeda Tho Vu             2022-06-08  237  		idle-states {
9bc7cd07aadeda Tho Vu             2022-06-08  238  			entry-method = "psci";
9bc7cd07aadeda Tho Vu             2022-06-08  239  
9bc7cd07aadeda Tho Vu             2022-06-08  240  			CPU_SLEEP_0: cpu-sleep-0 {
9bc7cd07aadeda Tho Vu             2022-06-08  241  				compatible = "arm,idle-state";
9bc7cd07aadeda Tho Vu             2022-06-08  242  				arm,psci-suspend-param = <0x0010000>;
9bc7cd07aadeda Tho Vu             2022-06-08  243  				local-timer-stop;
9bc7cd07aadeda Tho Vu             2022-06-08  244  				entry-latency-us = <400>;
9bc7cd07aadeda Tho Vu             2022-06-08  245  				exit-latency-us = <500>;
9bc7cd07aadeda Tho Vu             2022-06-08  246  				min-residency-us = <4000>;
9bc7cd07aadeda Tho Vu             2022-06-08  247  			};
9bc7cd07aadeda Tho Vu             2022-06-08  248  		};
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  249  	};
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  250  
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  251  	extal_clk: extal {
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  252  		compatible = "fixed-clock";
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  253  		#clock-cells = <0>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  254  		/* This value must be overridden by the board */
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  255  		clock-frequency = <0>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  256  	};
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  257  
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  258  	extalr_clk: extalr {
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  259  		compatible = "fixed-clock";
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  260  		#clock-cells = <0>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  261  		/* This value must be overridden by the board */
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  262  		clock-frequency = <0>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  263  	};
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  264  
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  265  	pmu_a55 {
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  266  		compatible = "arm,cortex-a55-pmu";
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  267  		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  268  	};
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  269  
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  270  	psci {
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  271  		compatible = "arm,psci-1.0", "arm,psci-0.2";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  272  		method = "smc";
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  273  	};
2dcb78d2266c0a Geert Uytterhoeven 2022-06-08  274  
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  275  	/* External SCIF clock - to be overridden by boards that provide it */
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  276  	scif_clk: scif {
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  277  		compatible = "fixed-clock";
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  278  		#clock-cells = <0>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  279  		clock-frequency = <0>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  280  	};
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  281  
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  282  	soc: soc {
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  283  		compatible = "simple-bus";
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  284  		interrupt-parent = <&gic>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  285  		#address-cells = <2>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  286  		#size-cells = <2>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  287  		ranges;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  288  
8ca367e26ad9f8 Geert Uytterhoeven 2022-01-18  289  		rwdt: watchdog@e6020000 {
8ca367e26ad9f8 Geert Uytterhoeven 2022-01-18  290  			compatible = "renesas,r8a779f0-wdt",
8ca367e26ad9f8 Geert Uytterhoeven 2022-01-18  291  				     "renesas,rcar-gen4-wdt";
8ca367e26ad9f8 Geert Uytterhoeven 2022-01-18  292  			reg = <0 0xe6020000 0 0x0c>;
ccc0dd722e66da Wolfram Sang       2022-03-22  293  			interrupts = <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>;
8ca367e26ad9f8 Geert Uytterhoeven 2022-01-18  294  			clocks = <&cpg CPG_MOD 907>;
8ca367e26ad9f8 Geert Uytterhoeven 2022-01-18  295  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
8ca367e26ad9f8 Geert Uytterhoeven 2022-01-18  296  			resets = <&cpg 907>;
8ca367e26ad9f8 Geert Uytterhoeven 2022-01-18  297  			status = "disabled";
8ca367e26ad9f8 Geert Uytterhoeven 2022-01-18  298  		};
8ca367e26ad9f8 Geert Uytterhoeven 2022-01-18  299  
cfcccc9126a7ae Geert Uytterhoeven 2022-02-21  300  		pfc: pinctrl@e6050000 {
cfcccc9126a7ae Geert Uytterhoeven 2022-02-21  301  			compatible = "renesas,pfc-r8a779f0";
cfcccc9126a7ae Geert Uytterhoeven 2022-02-21  302  			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
cfcccc9126a7ae Geert Uytterhoeven 2022-02-21  303  			      <0 0xe6051000 0 0x16c>, <0 0xe6051800 0 0x16c>;
cfcccc9126a7ae Geert Uytterhoeven 2022-02-21  304  		};
cfcccc9126a7ae Geert Uytterhoeven 2022-02-21  305  
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  306  		gpio0: gpio@e6050180 {
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  307  			compatible = "renesas,gpio-r8a779f0",
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  308  				     "renesas,rcar-gen4-gpio";
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  309  			reg = <0 0xe6050180 0 0x54>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  310  			interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  311  			clocks = <&cpg CPG_MOD 915>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  312  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  313  			resets = <&cpg 915>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  314  			gpio-controller;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  315  			#gpio-cells = <2>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  316  			gpio-ranges = <&pfc 0 0 21>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  317  			interrupt-controller;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  318  			#interrupt-cells = <2>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  319  		};
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  320  
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  321  		gpio1: gpio@e6050980 {
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  322  			compatible = "renesas,gpio-r8a779f0",
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  323  				     "renesas,rcar-gen4-gpio";
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  324  			reg = <0 0xe6050980 0 0x54>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  325  			interrupts = <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  326  			clocks = <&cpg CPG_MOD 915>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  327  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  328  			resets = <&cpg 915>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  329  			gpio-controller;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  330  			#gpio-cells = <2>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  331  			gpio-ranges = <&pfc 0 32 25>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  332  			interrupt-controller;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  333  			#interrupt-cells = <2>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  334  		};
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  335  
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  336  		gpio2: gpio@e6051180 {
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  337  			compatible = "renesas,gpio-r8a779f0",
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  338  				     "renesas,rcar-gen4-gpio";
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  339  			reg = <0 0xe6051180 0 0x54>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  340  			interrupts = <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  341  			clocks = <&cpg CPG_MOD 915>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  342  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  343  			resets = <&cpg 915>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  344  			gpio-controller;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  345  			#gpio-cells = <2>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  346  			gpio-ranges = <&pfc 0 64 17>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  347  			interrupt-controller;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  348  			#interrupt-cells = <2>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  349  		};
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  350  
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  351  		gpio3: gpio@e6051980 {
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  352  			compatible = "renesas,gpio-r8a779f0",
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  353  				     "renesas,rcar-gen4-gpio";
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  354  			reg = <0 0xe6051980 0 0x54>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  355  			interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  356  			clocks = <&cpg CPG_MOD 915>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  357  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  358  			resets = <&cpg 915>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  359  			gpio-controller;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  360  			#gpio-cells = <2>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  361  			gpio-ranges = <&pfc 0 96 19>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  362  			interrupt-controller;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  363  			#interrupt-cells = <2>;
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  364  		};
8ba8560d4ff1b1 Geert Uytterhoeven 2022-04-04  365  
d227fcc390e3e9 Wolfram Sang       2022-07-13  366  		cmt0: timer@e60f0000 {
d227fcc390e3e9 Wolfram Sang       2022-07-13  367  			compatible = "renesas,r8a779f0-cmt0",
d227fcc390e3e9 Wolfram Sang       2022-07-13  368  				     "renesas,rcar-gen4-cmt0";
d227fcc390e3e9 Wolfram Sang       2022-07-13  369  			reg = <0 0xe60f0000 0 0x1004>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  370  			interrupts = <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  371  				     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  372  			clocks = <&cpg CPG_MOD 910>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  373  			clock-names = "fck";
d227fcc390e3e9 Wolfram Sang       2022-07-13  374  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  375  			resets = <&cpg 910>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  376  			status = "disabled";
d227fcc390e3e9 Wolfram Sang       2022-07-13  377  		};
d227fcc390e3e9 Wolfram Sang       2022-07-13  378  
d227fcc390e3e9 Wolfram Sang       2022-07-13  379  		cmt1: timer@e6130000 {
d227fcc390e3e9 Wolfram Sang       2022-07-13  380  			compatible = "renesas,r8a779f0-cmt1",
d227fcc390e3e9 Wolfram Sang       2022-07-13  381  				     "renesas,rcar-gen4-cmt1";
d227fcc390e3e9 Wolfram Sang       2022-07-13  382  			reg = <0 0xe6130000 0 0x1004>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  383  			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  384  				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  385  				     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  386  				     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  387  				     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  388  				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  389  				     <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  390  				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  391  			clocks = <&cpg CPG_MOD 911>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  392  			clock-names = "fck";
d227fcc390e3e9 Wolfram Sang       2022-07-13  393  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  394  			resets = <&cpg 911>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  395  			status = "disabled";
d227fcc390e3e9 Wolfram Sang       2022-07-13  396  		};
d227fcc390e3e9 Wolfram Sang       2022-07-13  397  
d227fcc390e3e9 Wolfram Sang       2022-07-13  398  		cmt2: timer@e6140000 {
d227fcc390e3e9 Wolfram Sang       2022-07-13  399  			compatible = "renesas,r8a779f0-cmt1",
d227fcc390e3e9 Wolfram Sang       2022-07-13  400  				     "renesas,rcar-gen4-cmt1";
d227fcc390e3e9 Wolfram Sang       2022-07-13  401  			reg = <0 0xe6140000 0 0x1004>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  402  			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  403  				     <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  404  				     <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  405  				     <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  406  				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  407  				     <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  408  				     <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  409  				     <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  410  			clocks = <&cpg CPG_MOD 912>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  411  			clock-names = "fck";
d227fcc390e3e9 Wolfram Sang       2022-07-13  412  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  413  			resets = <&cpg 912>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  414  			status = "disabled";
d227fcc390e3e9 Wolfram Sang       2022-07-13  415  		};
d227fcc390e3e9 Wolfram Sang       2022-07-13  416  
d227fcc390e3e9 Wolfram Sang       2022-07-13  417  		cmt3: timer@e6148000 {
d227fcc390e3e9 Wolfram Sang       2022-07-13  418  			compatible = "renesas,r8a779f0-cmt1",
d227fcc390e3e9 Wolfram Sang       2022-07-13  419  				     "renesas,rcar-gen4-cmt1";
d227fcc390e3e9 Wolfram Sang       2022-07-13  420  			reg = <0 0xe6148000 0 0x1004>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  421  			interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  422  				     <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  423  				     <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  424  				     <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  425  				     <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  426  				     <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  427  				     <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
d227fcc390e3e9 Wolfram Sang       2022-07-13  428  				     <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  429  			clocks = <&cpg CPG_MOD 913>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  430  			clock-names = "fck";
d227fcc390e3e9 Wolfram Sang       2022-07-13  431  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  432  			resets = <&cpg 913>;
d227fcc390e3e9 Wolfram Sang       2022-07-13  433  			status = "disabled";
d227fcc390e3e9 Wolfram Sang       2022-07-13  434  		};
d227fcc390e3e9 Wolfram Sang       2022-07-13  435  
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  436  		cpg: clock-controller@e6150000 {
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  437  			compatible = "renesas,r8a779f0-cpg-mssr";
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  438  			reg = <0 0xe6150000 0 0x4000>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  439  			clocks = <&extal_clk>, <&extalr_clk>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  440  			clock-names = "extal", "extalr";
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  441  			#clock-cells = <2>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  442  			#power-domain-cells = <0>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  443  			#reset-cells = <1>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  444  		};
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  445  
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  446  		rst: reset-controller@e6160000 {
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  447  			compatible = "renesas,r8a779f0-rst";
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  448  			reg = <0 0xe6160000 0 0x4000>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  449  		};
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  450  
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  451  		sysc: system-controller@e6180000 {
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  452  			compatible = "renesas,r8a779f0-sysc";
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  453  			reg = <0 0xe6180000 0 0x4000>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  454  			#power-domain-cells = <1>;
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  455  		};
c62331e8222f8f Yoshihiro Shimoda  2021-12-01  456  
5a3ad6f466fe7a Linh Phung         2022-05-25  457  		tsc: thermal@e6198000 {
5a3ad6f466fe7a Linh Phung         2022-05-25  458  			compatible = "renesas,r8a779f0-thermal";
5a3ad6f466fe7a Linh Phung         2022-05-25  459  			/* The 4th sensor is in control domain and not for Linux */
5a3ad6f466fe7a Linh Phung         2022-05-25  460  			reg = <0 0xe6198000 0 0x200>,
5a3ad6f466fe7a Linh Phung         2022-05-25  461  			      <0 0xe61a0000 0 0x200>,
5a3ad6f466fe7a Linh Phung         2022-05-25  462  			      <0 0xe61a8000 0 0x200>;
5a3ad6f466fe7a Linh Phung         2022-05-25  463  			clocks = <&cpg CPG_MOD 919>;
5a3ad6f466fe7a Linh Phung         2022-05-25  464  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
5a3ad6f466fe7a Linh Phung         2022-05-25  465  			resets = <&cpg 919>;
5a3ad6f466fe7a Linh Phung         2022-05-25  466  			#thermal-sensor-cells = <1>;
5a3ad6f466fe7a Linh Phung         2022-05-25  467  		};
5a3ad6f466fe7a Linh Phung         2022-05-25  468  
7adc69f8ac3510 Wolfram Sang       2022-07-26  469  		tmu0: timer@e61e0000 {
7adc69f8ac3510 Wolfram Sang       2022-07-26  470  			compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
7adc69f8ac3510 Wolfram Sang       2022-07-26  471  			reg = <0 0xe61e0000 0 0x30>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  472  			interrupts = <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
7adc69f8ac3510 Wolfram Sang       2022-07-26  473  				     <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>,
7adc69f8ac3510 Wolfram Sang       2022-07-26  474  				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  475  			clocks = <&cpg CPG_MOD 713>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  476  			clock-names = "fck";
7adc69f8ac3510 Wolfram Sang       2022-07-26  477  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  478  			resets = <&cpg 713>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  479  			status = "disabled";
7adc69f8ac3510 Wolfram Sang       2022-07-26  480  		};
7adc69f8ac3510 Wolfram Sang       2022-07-26  481  
7adc69f8ac3510 Wolfram Sang       2022-07-26  482  		tmu1: timer@e6fc0000 {
7adc69f8ac3510 Wolfram Sang       2022-07-26  483  			compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
7adc69f8ac3510 Wolfram Sang       2022-07-26  484  			reg = <0 0xe6fc0000 0 0x30>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  485  			interrupts = <GIC_SPI 477 IRQ_TYPE_LEVEL_HIGH>,
7adc69f8ac3510 Wolfram Sang       2022-07-26  486  				     <GIC_SPI 478 IRQ_TYPE_LEVEL_HIGH>,
7adc69f8ac3510 Wolfram Sang       2022-07-26  487  				     <GIC_SPI 479 IRQ_TYPE_LEVEL_HIGH>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  488  			clocks = <&cpg CPG_MOD 714>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  489  			clock-names = "fck";
7adc69f8ac3510 Wolfram Sang       2022-07-26  490  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  491  			resets = <&cpg 714>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  492  			status = "disabled";
7adc69f8ac3510 Wolfram Sang       2022-07-26  493  		};
7adc69f8ac3510 Wolfram Sang       2022-07-26  494  
7adc69f8ac3510 Wolfram Sang       2022-07-26  495  		tmu2: timer@e6fd0000 {
7adc69f8ac3510 Wolfram Sang       2022-07-26  496  			compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
7adc69f8ac3510 Wolfram Sang       2022-07-26  497  			reg = <0 0xe6fd0000 0 0x30>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  498  			interrupts = <GIC_SPI 481 IRQ_TYPE_LEVEL_HIGH>,
7adc69f8ac3510 Wolfram Sang       2022-07-26  499  				     <GIC_SPI 482 IRQ_TYPE_LEVEL_HIGH>,
7adc69f8ac3510 Wolfram Sang       2022-07-26  500  				     <GIC_SPI 483 IRQ_TYPE_LEVEL_HIGH>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  501  			clocks = <&cpg CPG_MOD 715>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  502  			clock-names = "fck";
7adc69f8ac3510 Wolfram Sang       2022-07-26  503  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  504  			resets = <&cpg 715>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  505  			status = "disabled";
7adc69f8ac3510 Wolfram Sang       2022-07-26  506  		};
7adc69f8ac3510 Wolfram Sang       2022-07-26  507  
7adc69f8ac3510 Wolfram Sang       2022-07-26  508  		tmu3: timer@e6fe0000 {
7adc69f8ac3510 Wolfram Sang       2022-07-26  509  			compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
7adc69f8ac3510 Wolfram Sang       2022-07-26  510  			reg = <0 0xe6fe0000 0 0x30>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  511  			interrupts = <GIC_SPI 485 IRQ_TYPE_LEVEL_HIGH>,
7adc69f8ac3510 Wolfram Sang       2022-07-26  512  				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
7adc69f8ac3510 Wolfram Sang       2022-07-26  513  				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  514  			clocks = <&cpg CPG_MOD 716>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  515  			clock-names = "fck";
7adc69f8ac3510 Wolfram Sang       2022-07-26  516  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  517  			resets = <&cpg 716>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  518  			status = "disabled";
7adc69f8ac3510 Wolfram Sang       2022-07-26  519  		};
7adc69f8ac3510 Wolfram Sang       2022-07-26  520  
7adc69f8ac3510 Wolfram Sang       2022-07-26  521  		tmu4: timer@ffc00000 {
7adc69f8ac3510 Wolfram Sang       2022-07-26  522  			compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
7adc69f8ac3510 Wolfram Sang       2022-07-26  523  			reg = <0 0xffc00000 0 0x30>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  524  			interrupts = <GIC_SPI 489 IRQ_TYPE_LEVEL_HIGH>,
7adc69f8ac3510 Wolfram Sang       2022-07-26  525  				     <GIC_SPI 490 IRQ_TYPE_LEVEL_HIGH>,
7adc69f8ac3510 Wolfram Sang       2022-07-26  526  				     <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  527  			clocks = <&cpg CPG_MOD 717>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  528  			clock-names = "fck";
7adc69f8ac3510 Wolfram Sang       2022-07-26  529  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  530  			resets = <&cpg 717>;
7adc69f8ac3510 Wolfram Sang       2022-07-26  531  			status = "disabled";
7adc69f8ac3510 Wolfram Sang       2022-07-26  532  		};
7adc69f8ac3510 Wolfram Sang       2022-07-26  533  
387e16cbee4c56 Yoshihiro Shimoda  2022-11-18  534  		eth_serdes: phy@e6444000 {
387e16cbee4c56 Yoshihiro Shimoda  2022-11-18  535  			compatible = "renesas,r8a779f0-ether-serdes";
387e16cbee4c56 Yoshihiro Shimoda  2022-11-18  536  			reg = <0 0xe6444000 0 0x2800>;
387e16cbee4c56 Yoshihiro Shimoda  2022-11-18  537  			clocks = <&cpg CPG_MOD 1506>;
387e16cbee4c56 Yoshihiro Shimoda  2022-11-18  538  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
387e16cbee4c56 Yoshihiro Shimoda  2022-11-18  539  			resets = <&cpg 1506>;
387e16cbee4c56 Yoshihiro Shimoda  2022-11-18  540  			#phy-cells = <1>;
387e16cbee4c56 Yoshihiro Shimoda  2022-11-18  541  			status = "disabled";
387e16cbee4c56 Yoshihiro Shimoda  2022-11-18  542  		};
387e16cbee4c56 Yoshihiro Shimoda  2022-11-18  543  
bd04437341962d Geert Uytterhoeven 2022-02-03  544  		i2c0: i2c@e6500000 {
bd04437341962d Geert Uytterhoeven 2022-02-03  545  			compatible = "renesas,i2c-r8a779f0",
bd04437341962d Geert Uytterhoeven 2022-02-03  546  				     "renesas,rcar-gen4-i2c";
bd04437341962d Geert Uytterhoeven 2022-02-03  547  			reg = <0 0xe6500000 0 0x40>;
bd04437341962d Geert Uytterhoeven 2022-02-03  548  			interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
bd04437341962d Geert Uytterhoeven 2022-02-03  549  			clocks = <&cpg CPG_MOD 518>;
bd04437341962d Geert Uytterhoeven 2022-02-03  550  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
bd04437341962d Geert Uytterhoeven 2022-02-03  551  			resets = <&cpg 518>;
bd04437341962d Geert Uytterhoeven 2022-02-03  552  			dmas = <&dmac0 0x91>, <&dmac0 0x90>,
bd04437341962d Geert Uytterhoeven 2022-02-03  553  			       <&dmac1 0x91>, <&dmac1 0x90>;
bd04437341962d Geert Uytterhoeven 2022-02-03  554  			dma-names = "tx", "rx", "tx", "rx";
bd04437341962d Geert Uytterhoeven 2022-02-03  555  			i2c-scl-internal-delay-ns = <110>;
bd04437341962d Geert Uytterhoeven 2022-02-03  556  			#address-cells = <1>;
bd04437341962d Geert Uytterhoeven 2022-02-03  557  			#size-cells = <0>;
bd04437341962d Geert Uytterhoeven 2022-02-03  558  			status = "disabled";
bd04437341962d Geert Uytterhoeven 2022-02-03  559  		};
bd04437341962d Geert Uytterhoeven 2022-02-03  560  
bd04437341962d Geert Uytterhoeven 2022-02-03  561  		i2c1: i2c@e6508000 {
bd04437341962d Geert Uytterhoeven 2022-02-03  562  			compatible = "renesas,i2c-r8a779f0",
bd04437341962d Geert Uytterhoeven 2022-02-03  563  				     "renesas,rcar-gen4-i2c";
bd04437341962d Geert Uytterhoeven 2022-02-03  564  			reg = <0 0xe6508000 0 0x40>;
bd04437341962d Geert Uytterhoeven 2022-02-03  565  			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
bd04437341962d Geert Uytterhoeven 2022-02-03  566  			clocks = <&cpg CPG_MOD 519>;
bd04437341962d Geert Uytterhoeven 2022-02-03  567  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
bd04437341962d Geert Uytterhoeven 2022-02-03  568  			resets = <&cpg 519>;
bd04437341962d Geert Uytterhoeven 2022-02-03  569  			dmas = <&dmac0 0x93>, <&dmac0 0x92>,
bd04437341962d Geert Uytterhoeven 2022-02-03  570  			       <&dmac1 0x93>, <&dmac1 0x92>;
bd04437341962d Geert Uytterhoeven 2022-02-03  571  			dma-names = "tx", "rx", "tx", "rx";
bd04437341962d Geert Uytterhoeven 2022-02-03  572  			i2c-scl-internal-delay-ns = <110>;
bd04437341962d Geert Uytterhoeven 2022-02-03  573  			#address-cells = <1>;
bd04437341962d Geert Uytterhoeven 2022-02-03  574  			#size-cells = <0>;
bd04437341962d Geert Uytterhoeven 2022-02-03  575  			status = "disabled";
bd04437341962d Geert Uytterhoeven 2022-02-03  576  		};
bd04437341962d Geert Uytterhoeven 2022-02-03  577  
bd04437341962d Geert Uytterhoeven 2022-02-03  578  		i2c2: i2c@e6510000 {
bd04437341962d Geert Uytterhoeven 2022-02-03  579  			compatible = "renesas,i2c-r8a779f0",
bd04437341962d Geert Uytterhoeven 2022-02-03  580  				     "renesas,rcar-gen4-i2c";
bd04437341962d Geert Uytterhoeven 2022-02-03  581  			reg = <0 0xe6510000 0 0x40>;
bd04437341962d Geert Uytterhoeven 2022-02-03  582  			interrupts = <0 240 IRQ_TYPE_LEVEL_HIGH>;
bd04437341962d Geert Uytterhoeven 2022-02-03  583  			clocks = <&cpg CPG_MOD 520>;
bd04437341962d Geert Uytterhoeven 2022-02-03  584  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
bd04437341962d Geert Uytterhoeven 2022-02-03  585  			resets = <&cpg 520>;
bd04437341962d Geert Uytterhoeven 2022-02-03  586  			dmas = <&dmac0 0x95>, <&dmac0 0x94>,
bd04437341962d Geert Uytterhoeven 2022-02-03  587  			       <&dmac1 0x95>, <&dmac1 0x94>;
bd04437341962d Geert Uytterhoeven 2022-02-03  588  			dma-names = "tx", "rx", "tx", "rx";
bd04437341962d Geert Uytterhoeven 2022-02-03  589  			i2c-scl-internal-delay-ns = <110>;
bd04437341962d Geert Uytterhoeven 2022-02-03  590  			#address-cells = <1>;
bd04437341962d Geert Uytterhoeven 2022-02-03  591  			#size-cells = <0>;
bd04437341962d Geert Uytterhoeven 2022-02-03  592  			status = "disabled";
bd04437341962d Geert Uytterhoeven 2022-02-03  593  		};
bd04437341962d Geert Uytterhoeven 2022-02-03  594  
bd04437341962d Geert Uytterhoeven 2022-02-03  595  		i2c3: i2c@e66d0000 {
bd04437341962d Geert Uytterhoeven 2022-02-03  596  			compatible = "renesas,i2c-r8a779f0",
bd04437341962d Geert Uytterhoeven 2022-02-03  597  				     "renesas,rcar-gen4-i2c";
bd04437341962d Geert Uytterhoeven 2022-02-03  598  			reg = <0 0xe66d0000 0 0x40>;
bd04437341962d Geert Uytterhoeven 2022-02-03  599  			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
bd04437341962d Geert Uytterhoeven 2022-02-03  600  			clocks = <&cpg CPG_MOD 521>;
bd04437341962d Geert Uytterhoeven 2022-02-03  601  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
bd04437341962d Geert Uytterhoeven 2022-02-03  602  			resets = <&cpg 521>;
bd04437341962d Geert Uytterhoeven 2022-02-03  603  			dmas = <&dmac0 0x97>, <&dmac0 0x96>,
bd04437341962d Geert Uytterhoeven 2022-02-03  604  			       <&dmac1 0x97>, <&dmac1 0x96>;
bd04437341962d Geert Uytterhoeven 2022-02-03  605  			dma-names = "tx", "rx", "tx", "rx";
bd04437341962d Geert Uytterhoeven 2022-02-03  606  			i2c-scl-internal-delay-ns = <110>;
bd04437341962d Geert Uytterhoeven 2022-02-03  607  			#address-cells = <1>;
bd04437341962d Geert Uytterhoeven 2022-02-03  608  			#size-cells = <0>;
bd04437341962d Geert Uytterhoeven 2022-02-03  609  			status = "disabled";
bd04437341962d Geert Uytterhoeven 2022-02-03  610  		};
bd04437341962d Geert Uytterhoeven 2022-02-03  611  
bd04437341962d Geert Uytterhoeven 2022-02-03  612  		i2c4: i2c@e66d8000 {
bd04437341962d Geert Uytterhoeven 2022-02-03  613  			compatible = "renesas,i2c-r8a779f0",
bd04437341962d Geert Uytterhoeven 2022-02-03  614  				     "renesas,rcar-gen4-i2c";
bd04437341962d Geert Uytterhoeven 2022-02-03  615  			reg = <0 0xe66d8000 0 0x40>;
bd04437341962d Geert Uytterhoeven 2022-02-03  616  			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
bd04437341962d Geert Uytterhoeven 2022-02-03  617  			clocks = <&cpg CPG_MOD 522>;
bd04437341962d Geert Uytterhoeven 2022-02-03  618  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
bd04437341962d Geert Uytterhoeven 2022-02-03  619  			resets = <&cpg 522>;
bd04437341962d Geert Uytterhoeven 2022-02-03  620  			dmas = <&dmac0 0x99>, <&dmac0 0x98>,
bd04437341962d Geert Uytterhoeven 2022-02-03  621  			       <&dmac1 0x99>, <&dmac1 0x98>;
bd04437341962d Geert Uytterhoeven 2022-02-03  622  			dma-names = "tx", "rx", "tx", "rx";
bd04437341962d Geert Uytterhoeven 2022-02-03  623  			i2c-scl-internal-delay-ns = <110>;
bd04437341962d Geert Uytterhoeven 2022-02-03  624  			#address-cells = <1>;
bd04437341962d Geert Uytterhoeven 2022-02-03  625  			#size-cells = <0>;
bd04437341962d Geert Uytterhoeven 2022-02-03  626  			status = "disabled";
bd04437341962d Geert Uytterhoeven 2022-02-03  627  		};
bd04437341962d Geert Uytterhoeven 2022-02-03  628  
bd04437341962d Geert Uytterhoeven 2022-02-03  629  		i2c5: i2c@e66e0000 {
bd04437341962d Geert Uytterhoeven 2022-02-03  630  			compatible = "renesas,i2c-r8a779f0",
bd04437341962d Geert Uytterhoeven 2022-02-03  631  				     "renesas,rcar-gen4-i2c";
bd04437341962d Geert Uytterhoeven 2022-02-03  632  			reg = <0 0xe66e0000 0 0x40>;
bd04437341962d Geert Uytterhoeven 2022-02-03  633  			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
bd04437341962d Geert Uytterhoeven 2022-02-03  634  			clocks = <&cpg CPG_MOD 523>;
bd04437341962d Geert Uytterhoeven 2022-02-03  635  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
bd04437341962d Geert Uytterhoeven 2022-02-03  636  			resets = <&cpg 523>;
bd04437341962d Geert Uytterhoeven 2022-02-03  637  			dmas = <&dmac0 0x9b>, <&dmac0 0x9a>,
bd04437341962d Geert Uytterhoeven 2022-02-03  638  			       <&dmac1 0x9b>, <&dmac1 0x9a>;
bd04437341962d Geert Uytterhoeven 2022-02-03  639  			dma-names = "tx", "rx", "tx", "rx";
bd04437341962d Geert Uytterhoeven 2022-02-03  640  			i2c-scl-internal-delay-ns = <110>;
bd04437341962d Geert Uytterhoeven 2022-02-03  641  			#address-cells = <1>;
bd04437341962d Geert Uytterhoeven 2022-02-03  642  			#size-cells = <0>;
bd04437341962d Geert Uytterhoeven 2022-02-03  643  			status = "disabled";
bd04437341962d Geert Uytterhoeven 2022-02-03  644  		};
bd04437341962d Geert Uytterhoeven 2022-02-03  645  
01a787f78bfd15 Linh Phung         2022-06-14  646  		hscif0: serial@e6540000 {
01a787f78bfd15 Linh Phung         2022-06-14  647  			compatible = "renesas,hscif-r8a779f0",
01a787f78bfd15 Linh Phung         2022-06-14  648  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
01a787f78bfd15 Linh Phung         2022-06-14  649  			reg = <0 0xe6540000 0 0x60>;
01a787f78bfd15 Linh Phung         2022-06-14  650  			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
01a787f78bfd15 Linh Phung         2022-06-14  651  			clocks = <&cpg CPG_MOD 514>,
a5101ef18b4d07 Wolfram Sang       2022-11-03  652  				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
01a787f78bfd15 Linh Phung         2022-06-14  653  				 <&scif_clk>;
01a787f78bfd15 Linh Phung         2022-06-14  654  			clock-names = "fck", "brg_int", "scif_clk";
01a787f78bfd15 Linh Phung         2022-06-14  655  			dmas = <&dmac0 0x31>, <&dmac0 0x30>,
01a787f78bfd15 Linh Phung         2022-06-14  656  			       <&dmac1 0x31>, <&dmac1 0x30>;
01a787f78bfd15 Linh Phung         2022-06-14  657  			dma-names = "tx", "rx", "tx", "rx";
01a787f78bfd15 Linh Phung         2022-06-14  658  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
01a787f78bfd15 Linh Phung         2022-06-14  659  			resets = <&cpg 514>;
01a787f78bfd15 Linh Phung         2022-06-14  660  			status = "disabled";
01a787f78bfd15 Linh Phung         2022-06-14  661  		};
01a787f78bfd15 Linh Phung         2022-06-14  662  
01a787f78bfd15 Linh Phung         2022-06-14  663  		hscif1: serial@e6550000 {
01a787f78bfd15 Linh Phung         2022-06-14  664  			compatible = "renesas,hscif-r8a779f0",
01a787f78bfd15 Linh Phung         2022-06-14  665  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
01a787f78bfd15 Linh Phung         2022-06-14  666  			reg = <0 0xe6550000 0 0x60>;
01a787f78bfd15 Linh Phung         2022-06-14  667  			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
01a787f78bfd15 Linh Phung         2022-06-14  668  			clocks = <&cpg CPG_MOD 515>,
a5101ef18b4d07 Wolfram Sang       2022-11-03  669  				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
01a787f78bfd15 Linh Phung         2022-06-14  670  				 <&scif_clk>;
01a787f78bfd15 Linh Phung         2022-06-14  671  			clock-names = "fck", "brg_int", "scif_clk";
01a787f78bfd15 Linh Phung         2022-06-14  672  			dmas = <&dmac0 0x33>, <&dmac0 0x32>,
01a787f78bfd15 Linh Phung         2022-06-14  673  			       <&dmac1 0x33>, <&dmac1 0x32>;
01a787f78bfd15 Linh Phung         2022-06-14  674  			dma-names = "tx", "rx", "tx", "rx";
01a787f78bfd15 Linh Phung         2022-06-14  675  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
01a787f78bfd15 Linh Phung         2022-06-14  676  			resets = <&cpg 515>;
01a787f78bfd15 Linh Phung         2022-06-14  677  			status = "disabled";
01a787f78bfd15 Linh Phung         2022-06-14  678  		};
01a787f78bfd15 Linh Phung         2022-06-14  679  
01a787f78bfd15 Linh Phung         2022-06-14  680  		hscif2: serial@e6560000 {
01a787f78bfd15 Linh Phung         2022-06-14  681  			compatible = "renesas,hscif-r8a779f0",
01a787f78bfd15 Linh Phung         2022-06-14  682  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
01a787f78bfd15 Linh Phung         2022-06-14  683  			reg = <0 0xe6560000 0 0x60>;
01a787f78bfd15 Linh Phung         2022-06-14  684  			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
01a787f78bfd15 Linh Phung         2022-06-14  685  			clocks = <&cpg CPG_MOD 516>,
a5101ef18b4d07 Wolfram Sang       2022-11-03  686  				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
01a787f78bfd15 Linh Phung         2022-06-14  687  				 <&scif_clk>;
01a787f78bfd15 Linh Phung         2022-06-14  688  			clock-names = "fck", "brg_int", "scif_clk";
01a787f78bfd15 Linh Phung         2022-06-14  689  			dmas = <&dmac0 0x35>, <&dmac0 0x34>,
01a787f78bfd15 Linh Phung         2022-06-14  690  			       <&dmac1 0x35>, <&dmac1 0x34>;
01a787f78bfd15 Linh Phung         2022-06-14  691  			dma-names = "tx", "rx", "tx", "rx";
01a787f78bfd15 Linh Phung         2022-06-14  692  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
01a787f78bfd15 Linh Phung         2022-06-14  693  			resets = <&cpg 516>;
01a787f78bfd15 Linh Phung         2022-06-14  694  			status = "disabled";
01a787f78bfd15 Linh Phung         2022-06-14  695  		};
01a787f78bfd15 Linh Phung         2022-06-14  696  
01a787f78bfd15 Linh Phung         2022-06-14  697  		hscif3: serial@e66a0000 {
01a787f78bfd15 Linh Phung         2022-06-14  698  			compatible = "renesas,hscif-r8a779f0",
01a787f78bfd15 Linh Phung         2022-06-14  699  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
01a787f78bfd15 Linh Phung         2022-06-14  700  			reg = <0 0xe66a0000 0 0x60>;
01a787f78bfd15 Linh Phung         2022-06-14  701  			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
01a787f78bfd15 Linh Phung         2022-06-14  702  			clocks = <&cpg CPG_MOD 517>,
a5101ef18b4d07 Wolfram Sang       2022-11-03  703  				 <&cpg CPG_CORE R8A779F0_CLK_SASYNCPERD1>,
01a787f78bfd15 Linh Phung         2022-06-14  704  				 <&scif_clk>;
01a787f78bfd15 Linh Phung         2022-06-14  705  			clock-names = "fck", "brg_int", "scif_clk";
01a787f78bfd15 Linh Phung         2022-06-14  706  			dmas = <&dmac0 0x37>, <&dmac0 0x36>,
01a787f78bfd15 Linh Phung         2022-06-14  707  			       <&dmac1 0x37>, <&dmac1 0x36>;
01a787f78bfd15 Linh Phung         2022-06-14  708  			dma-names = "tx", "rx", "tx", "rx";
01a787f78bfd15 Linh Phung         2022-06-14  709  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
01a787f78bfd15 Linh Phung         2022-06-14  710  			resets = <&cpg 517>;
01a787f78bfd15 Linh Phung         2022-06-14  711  			status = "disabled";
01a787f78bfd15 Linh Phung         2022-06-14  712  		};
01a787f78bfd15 Linh Phung         2022-06-14  713  
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10 @714  		pciec0: pcie@e65d0000 {
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  715  			compatible = "renesas,r8a779f0-pcie",
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  716  				     "renesas,rcar-gen4-pcie";
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  717  			reg = <0 0xe65d0000 0 0x3000>, <0 0xe65d3000 0 0x2000>,
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  718  			      <0 0xe65d5000 0 0x1200>, <0 0xe65d6200 0 0x0e00>,
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  719  			      <0 0xfe000000 0 0x400000>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  720  			reg-names = "dbi", "atu", "dma", "app", "config";
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  721  			#address-cells = <3>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  722  			#size-cells = <2>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  723  			bus-range = <0x00 0xff>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  724  			device_type = "pci";
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  725  			ranges = <0x82000000 0 0x30000000 0 0x30000000 0 0x10000000>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  726  			dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 0 0x80000000>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  727  			interrupts = <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  728  				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>,
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  729  				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  730  				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  731  			interrupt-names = "msi", "dma", "sft_ce", "app";
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  732  			#interrupt-cells = <1>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  733  			interrupt-map-mask = <0 0 0 7>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  734  			interrupt-map = <0 0 0 1 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  735  					<0 0 0 2 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  736  					<0 0 0 3 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  737  					<0 0 0 4 &gic GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  738  			clocks = <&cpg CPG_MOD 624>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  739  			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  740  			resets = <&cpg 624>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  741  			num-lanes = <2>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  742  			snps,enable-cdm-check;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  743  			max-link-speed = <4>;
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  744  			status = "disabled";
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  745  		};
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10  746  
e4053d3462c6f3 Yoshihiro Shimoda  2023-02-10 @747  		pciec1: pcie@e65d8000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
