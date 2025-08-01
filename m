Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01EC80B
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Aug 2025 04:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754022327; cv=none; b=tgYLgzqfenH2bvvYYeKrJVkH3286iKmphTFesWLdnDAdhRcbXChWM4zWR+jVWs6jIfGI3yTBROpdKRnuEvzk3s4xpJPOCJS7ZHTusKfTQGZQbIsDbA2gS+1x0oEiBKhV1WWv2WIc9TF95RwizYfZjSO5XeKWYjhyFL15oR7RMj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754022327; c=relaxed/simple;
	bh=v2oFdBqttNbxH3T+sCIl+GKg9gMjrHS+nzr++7+O03A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r8QsuZ7+fhx3o3wqg8zmhMtlh1W1dF9ckCswmaT1lD0UsEdJUSRJtARjkqWg81cVLhfgx9Nd3hQ3/JrvNr7/TJKWTvMp4o7ZAEQMhhawZ/PEs5Bpnmga3jpI3zQFWZPwr9IIYjMpN5Fua9yqrw4i738y3p7jcsdDInXge48uyH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYd8JBeo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYd8JBeo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754022323; x=1785558323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v2oFdBqttNbxH3T+sCIl+GKg9gMjrHS+nzr++7+O03A=;
  b=fYd8JBeoBhuMOhq/N2wfxJ95PqRKZoLVKaMZshK2WtMyFhCWYgpPvX7m
   3B9IO25GM/hyaCmeiTKIXLt4vuoQ2uOLjms7E3P6ESf9BqVTDx5yYpoya
   mrNvAaWeeBy6Z1l5RjIBvaeDlcZZECN3ILwEmTXDN/nXJjNVLlWq4inCa
   pS0EXfQM4w8xnszWnjdKJzp35D41QWleWV9WlrGpXLl2ykTu/0umugZI0
   uIO6uBFqwIGAqU5AoLxqqly0SgCETbO0P9YwJWSQCKa+0uRSTgMMRiig6
   O4oDJGOn2uxmnN3vkXlVZ0+JKPQb8iiXoDBKI5GM+VVpCN/dZQLIgfMtR
   A==;
X-CSE-ConnectionGUID: F3tpPSjSQa+X81U6Y+feKA==
X-CSE-MsgGUID: miXe3lZQR/+udgvO1R1fhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67437173"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="67437173"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 21:25:23 -0700
X-CSE-ConnectionGUID: Wvl/VxK/QMKeyT9x/PN4NQ==
X-CSE-MsgGUID: VRVhVr0hS1CECT21CjvRbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="167626629"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Jul 2025 21:25:20 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhhKY-0004Lc-27;
	Fri, 01 Aug 2025 04:25:18 +0000
Date: Fri, 1 Aug 2025 12:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 7/8] arm64: dts: s32g3: Add the Software Timer Watchdog
 (SWT) description
Message-ID: <202508011255.OSmum5j8-lkp@intel.com>
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
In-Reply-To: <20250730195022.449894-8-daniel.lezcano@linaro.org>
References: <20250730195022.449894-8-daniel.lezcano@linaro.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: mbrugger@suse.com
TO: chester62515@gmail.com
TO: ghennadi.procopciuc@oss.nxp.com
TO: shawnguo@kernel.org
TO: s.hauer@pengutronix.de
CC: s32@nxp.com
CC: kernel@pengutronix.de
CC: festevam@gmail.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: imx@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
CC: Thomas Fossati <thomas.fossati@linaro.org>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linus/master v6.16 next-20250731]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Lezcano/arm64-dts-s32g2-Add-the-STM-description/20250731-035636
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250730195022.449894-8-daniel.lezcano%40linaro.org
patch subject: [PATCH 7/8] arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) description
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: arm64-randconfig-r061-20250801 (https://download.01.org/0day-ci/archive/20250801/202508011255.OSmum5j8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508011255.OSmum5j8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/s32g3.dtsi:817.27-823.5: Warning (simple_bus_reg): /soc@0/watchdog@4020C000: simple-bus unit address format error, expected "4020c000"
>> arch/arm64/boot/dts/freescale/s32g3.dtsi:825.27-831.5: Warning (simple_bus_reg): /soc@0/watchdog@40500000: simple-bus unit address format error, expected "269fb20"

vim +/4020c000 +817 arch/arm64/boot/dts/freescale/s32g3.dtsi

44b305a2de85b81 Wadim Mueller         2024-03-24   11  
44b305a2de85b81 Wadim Mueller         2024-03-24   12  / {
44b305a2de85b81 Wadim Mueller         2024-03-24   13  	compatible = "nxp,s32g3";
44b305a2de85b81 Wadim Mueller         2024-03-24   14  	interrupt-parent = <&gic>;
44b305a2de85b81 Wadim Mueller         2024-03-24   15  	#address-cells = <0x02>;
44b305a2de85b81 Wadim Mueller         2024-03-24   16  	#size-cells = <0x02>;
44b305a2de85b81 Wadim Mueller         2024-03-24   17  
44b305a2de85b81 Wadim Mueller         2024-03-24   18  	cpus {
44b305a2de85b81 Wadim Mueller         2024-03-24   19  		#address-cells = <1>;
44b305a2de85b81 Wadim Mueller         2024-03-24   20  		#size-cells = <0>;
44b305a2de85b81 Wadim Mueller         2024-03-24   21  
44b305a2de85b81 Wadim Mueller         2024-03-24   22  		cpu-map {
44b305a2de85b81 Wadim Mueller         2024-03-24   23  			cluster0 {
44b305a2de85b81 Wadim Mueller         2024-03-24   24  				core0 {
44b305a2de85b81 Wadim Mueller         2024-03-24   25  					cpu = <&cpu0>;
44b305a2de85b81 Wadim Mueller         2024-03-24   26  				};
44b305a2de85b81 Wadim Mueller         2024-03-24   27  
44b305a2de85b81 Wadim Mueller         2024-03-24   28  				core1 {
44b305a2de85b81 Wadim Mueller         2024-03-24   29  					cpu = <&cpu1>;
44b305a2de85b81 Wadim Mueller         2024-03-24   30  				};
44b305a2de85b81 Wadim Mueller         2024-03-24   31  
44b305a2de85b81 Wadim Mueller         2024-03-24   32  				core2 {
44b305a2de85b81 Wadim Mueller         2024-03-24   33  					cpu = <&cpu2>;
44b305a2de85b81 Wadim Mueller         2024-03-24   34  				};
44b305a2de85b81 Wadim Mueller         2024-03-24   35  
44b305a2de85b81 Wadim Mueller         2024-03-24   36  				core3 {
44b305a2de85b81 Wadim Mueller         2024-03-24   37  					cpu = <&cpu3>;
44b305a2de85b81 Wadim Mueller         2024-03-24   38  				};
44b305a2de85b81 Wadim Mueller         2024-03-24   39  			};
44b305a2de85b81 Wadim Mueller         2024-03-24   40  
44b305a2de85b81 Wadim Mueller         2024-03-24   41  			cluster1 {
44b305a2de85b81 Wadim Mueller         2024-03-24   42  				core0 {
44b305a2de85b81 Wadim Mueller         2024-03-24   43  					cpu = <&cpu4>;
44b305a2de85b81 Wadim Mueller         2024-03-24   44  				};
44b305a2de85b81 Wadim Mueller         2024-03-24   45  
44b305a2de85b81 Wadim Mueller         2024-03-24   46  				core1 {
44b305a2de85b81 Wadim Mueller         2024-03-24   47  					cpu = <&cpu5>;
44b305a2de85b81 Wadim Mueller         2024-03-24   48  				};
44b305a2de85b81 Wadim Mueller         2024-03-24   49  
44b305a2de85b81 Wadim Mueller         2024-03-24   50  				core2 {
44b305a2de85b81 Wadim Mueller         2024-03-24   51  					cpu = <&cpu6>;
44b305a2de85b81 Wadim Mueller         2024-03-24   52  				};
44b305a2de85b81 Wadim Mueller         2024-03-24   53  
44b305a2de85b81 Wadim Mueller         2024-03-24   54  				core3 {
44b305a2de85b81 Wadim Mueller         2024-03-24   55  					cpu = <&cpu7>;
44b305a2de85b81 Wadim Mueller         2024-03-24   56  				};
44b305a2de85b81 Wadim Mueller         2024-03-24   57  			};
44b305a2de85b81 Wadim Mueller         2024-03-24   58  		};
44b305a2de85b81 Wadim Mueller         2024-03-24   59  
44b305a2de85b81 Wadim Mueller         2024-03-24   60  		cpu0: cpu@0 {
44b305a2de85b81 Wadim Mueller         2024-03-24   61  			device_type = "cpu";
44b305a2de85b81 Wadim Mueller         2024-03-24   62  			compatible = "arm,cortex-a53";
44b305a2de85b81 Wadim Mueller         2024-03-24   63  			reg = <0x0>;
44b305a2de85b81 Wadim Mueller         2024-03-24   64  			enable-method = "psci";
44b305a2de85b81 Wadim Mueller         2024-03-24   65  			clocks = <&dfs 0>;
44b305a2de85b81 Wadim Mueller         2024-03-24   66  		};
44b305a2de85b81 Wadim Mueller         2024-03-24   67  
44b305a2de85b81 Wadim Mueller         2024-03-24   68  		cpu1: cpu@1 {
44b305a2de85b81 Wadim Mueller         2024-03-24   69  			device_type = "cpu";
44b305a2de85b81 Wadim Mueller         2024-03-24   70  			compatible = "arm,cortex-a53";
44b305a2de85b81 Wadim Mueller         2024-03-24   71  			reg = <0x1>;
44b305a2de85b81 Wadim Mueller         2024-03-24   72  			enable-method = "psci";
44b305a2de85b81 Wadim Mueller         2024-03-24   73  			clocks = <&dfs 0>;
44b305a2de85b81 Wadim Mueller         2024-03-24   74  		};
44b305a2de85b81 Wadim Mueller         2024-03-24   75  
44b305a2de85b81 Wadim Mueller         2024-03-24   76  		cpu2: cpu@2 {
44b305a2de85b81 Wadim Mueller         2024-03-24   77  			device_type = "cpu";
44b305a2de85b81 Wadim Mueller         2024-03-24   78  			compatible = "arm,cortex-a53";
44b305a2de85b81 Wadim Mueller         2024-03-24   79  			reg = <0x2>;
44b305a2de85b81 Wadim Mueller         2024-03-24   80  			enable-method = "psci";
44b305a2de85b81 Wadim Mueller         2024-03-24   81  			clocks = <&dfs 0>;
44b305a2de85b81 Wadim Mueller         2024-03-24   82  		};
44b305a2de85b81 Wadim Mueller         2024-03-24   83  
44b305a2de85b81 Wadim Mueller         2024-03-24   84  		cpu3: cpu@3 {
44b305a2de85b81 Wadim Mueller         2024-03-24   85  			device_type = "cpu";
44b305a2de85b81 Wadim Mueller         2024-03-24   86  			compatible = "arm,cortex-a53";
44b305a2de85b81 Wadim Mueller         2024-03-24   87  			reg = <0x3>;
44b305a2de85b81 Wadim Mueller         2024-03-24   88  			enable-method = "psci";
44b305a2de85b81 Wadim Mueller         2024-03-24   89  			clocks = <&dfs 0>;
44b305a2de85b81 Wadim Mueller         2024-03-24   90  		};
44b305a2de85b81 Wadim Mueller         2024-03-24   91  
44b305a2de85b81 Wadim Mueller         2024-03-24   92  		cpu4: cpu@100 {
44b305a2de85b81 Wadim Mueller         2024-03-24   93  			device_type = "cpu";
44b305a2de85b81 Wadim Mueller         2024-03-24   94  			compatible = "arm,cortex-a53";
44b305a2de85b81 Wadim Mueller         2024-03-24   95  			reg = <0x100>;
44b305a2de85b81 Wadim Mueller         2024-03-24   96  			enable-method = "psci";
44b305a2de85b81 Wadim Mueller         2024-03-24   97  			clocks = <&dfs 0>;
44b305a2de85b81 Wadim Mueller         2024-03-24   98  		};
44b305a2de85b81 Wadim Mueller         2024-03-24   99  
44b305a2de85b81 Wadim Mueller         2024-03-24  100  		cpu5: cpu@101 {
44b305a2de85b81 Wadim Mueller         2024-03-24  101  			device_type = "cpu";
44b305a2de85b81 Wadim Mueller         2024-03-24  102  			compatible = "arm,cortex-a53";
44b305a2de85b81 Wadim Mueller         2024-03-24  103  			reg = <0x101>;
44b305a2de85b81 Wadim Mueller         2024-03-24  104  			enable-method = "psci";
44b305a2de85b81 Wadim Mueller         2024-03-24  105  			clocks = <&dfs 0>;
44b305a2de85b81 Wadim Mueller         2024-03-24  106  		};
44b305a2de85b81 Wadim Mueller         2024-03-24  107  
44b305a2de85b81 Wadim Mueller         2024-03-24  108  		cpu6: cpu@102 {
44b305a2de85b81 Wadim Mueller         2024-03-24  109  			device_type = "cpu";
44b305a2de85b81 Wadim Mueller         2024-03-24  110  			compatible = "arm,cortex-a53";
44b305a2de85b81 Wadim Mueller         2024-03-24  111  			reg = <0x102>;
44b305a2de85b81 Wadim Mueller         2024-03-24  112  			enable-method = "psci";
44b305a2de85b81 Wadim Mueller         2024-03-24  113  			clocks = <&dfs 0>;
44b305a2de85b81 Wadim Mueller         2024-03-24  114  		};
44b305a2de85b81 Wadim Mueller         2024-03-24  115  
44b305a2de85b81 Wadim Mueller         2024-03-24  116  		cpu7: cpu@103 {
44b305a2de85b81 Wadim Mueller         2024-03-24  117  			device_type = "cpu";
44b305a2de85b81 Wadim Mueller         2024-03-24  118  			compatible = "arm,cortex-a53";
44b305a2de85b81 Wadim Mueller         2024-03-24  119  			reg = <0x103>;
44b305a2de85b81 Wadim Mueller         2024-03-24  120  			enable-method = "psci";
44b305a2de85b81 Wadim Mueller         2024-03-24  121  			clocks = <&dfs 0>;
44b305a2de85b81 Wadim Mueller         2024-03-24  122  		};
44b305a2de85b81 Wadim Mueller         2024-03-24  123  	};
44b305a2de85b81 Wadim Mueller         2024-03-24  124  
44b305a2de85b81 Wadim Mueller         2024-03-24  125  	firmware {
44b305a2de85b81 Wadim Mueller         2024-03-24  126  		scmi: scmi {
44b305a2de85b81 Wadim Mueller         2024-03-24  127  			compatible = "arm,scmi-smc";
44b305a2de85b81 Wadim Mueller         2024-03-24  128  			shmem = <&scmi_shmem>;
44b305a2de85b81 Wadim Mueller         2024-03-24  129  			arm,smc-id = <0xc20000fe>;
44b305a2de85b81 Wadim Mueller         2024-03-24  130  			#address-cells = <1>;
44b305a2de85b81 Wadim Mueller         2024-03-24  131  			#size-cells = <0>;
44b305a2de85b81 Wadim Mueller         2024-03-24  132  
44b305a2de85b81 Wadim Mueller         2024-03-24  133  			dfs: protocol@13 {
44b305a2de85b81 Wadim Mueller         2024-03-24  134  				reg = <0x13>;
44b305a2de85b81 Wadim Mueller         2024-03-24  135  				#clock-cells = <1>;
44b305a2de85b81 Wadim Mueller         2024-03-24  136  			};
44b305a2de85b81 Wadim Mueller         2024-03-24  137  
44b305a2de85b81 Wadim Mueller         2024-03-24  138  			clks: protocol@14 {
44b305a2de85b81 Wadim Mueller         2024-03-24  139  				reg = <0x14>;
44b305a2de85b81 Wadim Mueller         2024-03-24  140  				#clock-cells = <1>;
44b305a2de85b81 Wadim Mueller         2024-03-24  141  			};
44b305a2de85b81 Wadim Mueller         2024-03-24  142  		};
44b305a2de85b81 Wadim Mueller         2024-03-24  143  
44b305a2de85b81 Wadim Mueller         2024-03-24  144  		psci: psci {
44b305a2de85b81 Wadim Mueller         2024-03-24  145  			compatible = "arm,psci-1.0";
44b305a2de85b81 Wadim Mueller         2024-03-24  146  			method = "smc";
44b305a2de85b81 Wadim Mueller         2024-03-24  147  		};
44b305a2de85b81 Wadim Mueller         2024-03-24  148  	};
44b305a2de85b81 Wadim Mueller         2024-03-24  149  
44b305a2de85b81 Wadim Mueller         2024-03-24  150  
44b305a2de85b81 Wadim Mueller         2024-03-24  151  	pmu {
44b305a2de85b81 Wadim Mueller         2024-03-24  152  		compatible = "arm,cortex-a53-pmu";
44b305a2de85b81 Wadim Mueller         2024-03-24  153  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
44b305a2de85b81 Wadim Mueller         2024-03-24  154  	};
44b305a2de85b81 Wadim Mueller         2024-03-24  155  
44b305a2de85b81 Wadim Mueller         2024-03-24  156  	reserved-memory  {
44b305a2de85b81 Wadim Mueller         2024-03-24  157  		#address-cells = <2>;
44b305a2de85b81 Wadim Mueller         2024-03-24  158  		#size-cells = <2>;
44b305a2de85b81 Wadim Mueller         2024-03-24  159  		ranges;
44b305a2de85b81 Wadim Mueller         2024-03-24  160  
44b305a2de85b81 Wadim Mueller         2024-03-24  161  		scmi_shmem: shm@d0000000 {
44b305a2de85b81 Wadim Mueller         2024-03-24  162  			compatible = "arm,scmi-shmem";
44b305a2de85b81 Wadim Mueller         2024-03-24  163  			reg = <0x0 0xd0000000 0x0 0x80>;
44b305a2de85b81 Wadim Mueller         2024-03-24  164  			no-map;
44b305a2de85b81 Wadim Mueller         2024-03-24  165  		};
44b305a2de85b81 Wadim Mueller         2024-03-24  166  	};
44b305a2de85b81 Wadim Mueller         2024-03-24  167  
44b305a2de85b81 Wadim Mueller         2024-03-24  168  	soc@0 {
44b305a2de85b81 Wadim Mueller         2024-03-24  169  		compatible = "simple-bus";
44b305a2de85b81 Wadim Mueller         2024-03-24  170  		#address-cells = <1>;
44b305a2de85b81 Wadim Mueller         2024-03-24  171  		#size-cells = <1>;
44b305a2de85b81 Wadim Mueller         2024-03-24  172  		ranges = <0 0 0 0x80000000>;
44b305a2de85b81 Wadim Mueller         2024-03-24  173  
d57d72fd0a52354 Ciprian Marian Costea 2025-05-26  174  		rtc0: rtc@40060000 {
d57d72fd0a52354 Ciprian Marian Costea 2025-05-26  175  			compatible = "nxp,s32g3-rtc",
d57d72fd0a52354 Ciprian Marian Costea 2025-05-26  176  				     "nxp,s32g2-rtc";
d57d72fd0a52354 Ciprian Marian Costea 2025-05-26  177  			reg = <0x40060000 0x1000>;
d57d72fd0a52354 Ciprian Marian Costea 2025-05-26  178  			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
d57d72fd0a52354 Ciprian Marian Costea 2025-05-26  179  			clocks = <&clks 54>, <&clks 55>;
d57d72fd0a52354 Ciprian Marian Costea 2025-05-26  180  			clock-names = "ipg", "source0";
d57d72fd0a52354 Ciprian Marian Costea 2025-05-26  181  		};
d57d72fd0a52354 Ciprian Marian Costea 2025-05-26  182  
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  183  		pinctrl: pinctrl@4009c240 {
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  184  			compatible = "nxp,s32g2-siul2-pinctrl";
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  185  				/* MSCR0-MSCR101 registers on siul2_0 */
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  186  			reg = <0x4009c240 0x198>,
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  187  				/* MSCR112-MSCR122 registers on siul2_1 */
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  188  			      <0x44010400 0x2c>,
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  189  				/* MSCR144-MSCR190 registers on siul2_1 */
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  190  			      <0x44010480 0xbc>,
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  191  				/* IMCR0-IMCR83 registers on siul2_0 */
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  192  			      <0x4009ca40 0x150>,
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  193  				/* IMCR119-IMCR397 registers on siul2_1 */
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  194  			      <0x44010c1c 0x45c>,
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  195  				/* IMCR430-IMCR495 registers on siul2_1 */
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  196  			      <0x440110f8 0x108>;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  197  
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  198  			jtag_pins: jtag-pins {
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  199  				jtag-grp0 {
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  200  					pinmux = <0x0>;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  201  					input-enable;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  202  					bias-pull-up;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  203  					slew-rate = <166>;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  204  				};
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  205  
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  206  				jtag-grp1 {
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  207  					pinmux = <0x11>;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  208  					slew-rate = <166>;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  209  				};
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  210  
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  211  				jtag-grp2 {
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  212  					pinmux = <0x40>;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  213  					input-enable;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  214  					bias-pull-down;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  215  					slew-rate = <166>;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  216  				};
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  217  
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  218  				jtag-grp3 {
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  219  					pinmux = <0x23c0>,
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  220  						 <0x23d0>,
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  221  						 <0x2320>;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  222  				};
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  223  
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  224  				jtag-grp4 {
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  225  					pinmux = <0x51>;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  226  					input-enable;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  227  					bias-pull-up;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  228  					slew-rate = <166>;
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  229  				};
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  230  			};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  231  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  232  			pinctrl_usdhc0: usdhc0grp-pins {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  233  				usdhc0-grp0 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  234  					pinmux = <0x2e1>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  235  						 <0x381>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  236  					output-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  237  					bias-pull-down;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  238  					slew-rate = <150>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  239  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  240  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  241  				usdhc0-grp1 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  242  					pinmux = <0x2f1>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  243  						 <0x301>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  244  						 <0x311>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  245  						 <0x321>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  246  						 <0x331>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  247  						 <0x341>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  248  						 <0x351>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  249  						 <0x361>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  250  						 <0x371>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  251  					output-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  252  					input-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  253  					bias-pull-up;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  254  					slew-rate = <150>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  255  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  256  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  257  				usdhc0-grp2 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  258  					pinmux = <0x391>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  259  					output-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  260  					slew-rate = <150>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  261  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  262  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  263  				usdhc0-grp3 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  264  					pinmux = <0x3a0>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  265  					input-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  266  					slew-rate = <150>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  267  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  268  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  269  				usdhc0-grp4 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  270  					pinmux = <0x2032>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  271  						 <0x2042>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  272  						 <0x2052>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  273  						 <0x2062>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  274  						 <0x2072>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  275  						 <0x2082>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  276  						 <0x2092>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  277  						 <0x20a2>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  278  						 <0x20b2>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  279  						 <0x20c2>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  280  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  281  			};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  282  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  283  			pinctrl_usdhc0_100mhz: usdhc0-100mhzgrp-pins {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  284  				usdhc0-100mhz-grp0 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  285  					pinmux = <0x2e1>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  286  						 <0x381>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  287  					output-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  288  					bias-pull-down;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  289  					slew-rate = <150>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  290  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  291  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  292  				usdhc0-100mhz-grp1 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  293  					pinmux = <0x2f1>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  294  						 <0x301>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  295  						 <0x311>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  296  						 <0x321>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  297  						 <0x331>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  298  						 <0x341>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  299  						 <0x351>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  300  						 <0x361>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  301  						 <0x371>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  302  					output-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  303  					input-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  304  					bias-pull-up;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  305  					slew-rate = <150>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  306  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  307  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  308  				usdhc0-100mhz-grp2 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  309  					pinmux = <0x391>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  310  					output-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  311  					slew-rate = <150>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  312  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  313  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  314  				usdhc0-100mhz-grp3 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  315  					pinmux = <0x3a0>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  316  					input-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  317  					slew-rate = <150>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  318  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  319  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  320  				usdhc0-100mhz-grp4 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  321  					pinmux = <0x2032>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  322  						 <0x2042>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  323  						 <0x2052>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  324  						 <0x2062>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  325  						 <0x2072>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  326  						 <0x2082>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  327  						 <0x2092>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  328  						 <0x20a2>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  329  						 <0x20b2>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  330  						 <0x20c2>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  331  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  332  			};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  333  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  334  			pinctrl_usdhc0_200mhz: usdhc0-200mhzgrp-pins {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  335  				usdhc0-200mhz-grp0 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  336  					pinmux = <0x2e1>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  337  						 <0x381>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  338  					output-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  339  					bias-pull-down;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  340  					slew-rate = <208>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  341  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  342  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  343  				usdhc0-200mhz-grp1 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  344  					pinmux = <0x2f1>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  345  						 <0x301>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  346  						 <0x311>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  347  						 <0x321>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  348  						 <0x331>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  349  						 <0x341>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  350  						 <0x351>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  351  						 <0x361>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  352  						 <0x371>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  353  					output-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  354  					input-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  355  					bias-pull-up;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  356  					slew-rate = <208>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  357  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  358  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  359  				usdhc0-200mhz-grp2 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  360  					pinmux = <0x391>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  361  					output-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  362  					slew-rate = <208>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  363  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  364  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  365  				usdhc0-200mhz-grp3 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  366  					pinmux = <0x3a0>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  367  					input-enable;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  368  					slew-rate = <208>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  369  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  370  
f241340dca727d0 Ciprian Marian Costea 2024-08-30  371  				usdhc0-200mhz-grp4 {
f241340dca727d0 Ciprian Marian Costea 2024-08-30  372  					pinmux = <0x2032>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  373  						 <0x2042>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  374  						 <0x2052>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  375  						 <0x2062>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  376  						 <0x2072>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  377  						 <0x2082>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  378  						 <0x2092>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  379  						 <0x20a2>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  380  						 <0x20b2>,
f241340dca727d0 Ciprian Marian Costea 2024-08-30  381  						 <0x20c2>;
f241340dca727d0 Ciprian Marian Costea 2024-08-30  382  				};
f241340dca727d0 Ciprian Marian Costea 2024-08-30  383  			};
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  384  		};
d82a4f5c9528136 Andrei Stefanescu     2024-07-24  385  
9bf72db233806a7 Larisa Grigore        2025-02-03  386  		edma0: dma-controller@40144000 {
9bf72db233806a7 Larisa Grigore        2025-02-03  387  			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
9bf72db233806a7 Larisa Grigore        2025-02-03  388  			reg = <0x40144000 0x24000>,
9bf72db233806a7 Larisa Grigore        2025-02-03  389  			      <0x4012c000 0x3000>,
9bf72db233806a7 Larisa Grigore        2025-02-03  390  			      <0x40130000 0x3000>;
9bf72db233806a7 Larisa Grigore        2025-02-03  391  			#dma-cells = <2>;
9bf72db233806a7 Larisa Grigore        2025-02-03  392  			dma-channels = <32>;
9bf72db233806a7 Larisa Grigore        2025-02-03  393  			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
9bf72db233806a7 Larisa Grigore        2025-02-03  394  				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
9bf72db233806a7 Larisa Grigore        2025-02-03  395  				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
9bf72db233806a7 Larisa Grigore        2025-02-03  396  			interrupt-names = "tx-0-15",
9bf72db233806a7 Larisa Grigore        2025-02-03  397  					  "tx-16-31",
9bf72db233806a7 Larisa Grigore        2025-02-03  398  					  "err";
9bf72db233806a7 Larisa Grigore        2025-02-03  399  			clocks = <&clks 63>, <&clks 64>;
9bf72db233806a7 Larisa Grigore        2025-02-03  400  			clock-names = "dmamux0", "dmamux1";
9bf72db233806a7 Larisa Grigore        2025-02-03  401  		};
9bf72db233806a7 Larisa Grigore        2025-02-03  402  
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  403  		can0: can@401b4000 {
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  404  			compatible = "nxp,s32g3-flexcan",
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  405  					   "nxp,s32g2-flexcan";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  406  			reg = <0x401b4000 0xa000>;
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  407  			interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  408  				     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  409  				     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  410  				     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  411  			interrupt-names = "mb-0", "state", "berr", "mb-1";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  412  			clocks = <&clks 9>, <&clks 11>;
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  413  			clock-names = "ipg", "per";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  414  			status = "disabled";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  415  		};
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  416  
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  417  		can1: can@401be000 {
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  418  			compatible = "nxp,s32g3-flexcan",
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  419  					   "nxp,s32g2-flexcan";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  420  			reg = <0x401be000 0xa000>;
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  421  			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  422  				     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  423  				     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  424  				     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  425  			interrupt-names = "mb-0", "state", "berr", "mb-1";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  426  			clocks = <&clks 9>, <&clks 11>;
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  427  			clock-names = "ipg", "per";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  428  			status = "disabled";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  429  		};
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  430  
44b305a2de85b81 Wadim Mueller         2024-03-24  431  		uart0: serial@401c8000 {
44b305a2de85b81 Wadim Mueller         2024-03-24  432  			compatible = "nxp,s32g3-linflexuart",
44b305a2de85b81 Wadim Mueller         2024-03-24  433  				     "fsl,s32v234-linflexuart";
44b305a2de85b81 Wadim Mueller         2024-03-24  434  			reg = <0x401c8000 0x3000>;
44b305a2de85b81 Wadim Mueller         2024-03-24  435  			interrupts = <GIC_SPI 82 IRQ_TYPE_EDGE_RISING>;
44b305a2de85b81 Wadim Mueller         2024-03-24  436  			status = "disabled";
44b305a2de85b81 Wadim Mueller         2024-03-24  437  		};
44b305a2de85b81 Wadim Mueller         2024-03-24  438  
44b305a2de85b81 Wadim Mueller         2024-03-24  439  		uart1: serial@401cc000 {
44b305a2de85b81 Wadim Mueller         2024-03-24  440  			compatible = "nxp,s32g3-linflexuart",
44b305a2de85b81 Wadim Mueller         2024-03-24  441  				     "fsl,s32v234-linflexuart";
44b305a2de85b81 Wadim Mueller         2024-03-24  442  			reg = <0x401cc000 0x3000>;
44b305a2de85b81 Wadim Mueller         2024-03-24  443  			interrupts = <GIC_SPI 83 IRQ_TYPE_EDGE_RISING>;
44b305a2de85b81 Wadim Mueller         2024-03-24  444  			status = "disabled";
44b305a2de85b81 Wadim Mueller         2024-03-24  445  		};
44b305a2de85b81 Wadim Mueller         2024-03-24  446  
06ee2f0e2180328 Larisa Grigore        2025-05-22  447  		spi0: spi@401d4000 {
06ee2f0e2180328 Larisa Grigore        2025-05-22  448  			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
06ee2f0e2180328 Larisa Grigore        2025-05-22  449  			reg = <0x401d4000 0x1000>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  450  			interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  451  			clocks = <&clks 26>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  452  			clock-names = "dspi";
06ee2f0e2180328 Larisa Grigore        2025-05-22  453  			spi-num-chipselects = <8>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  454  			bus-num = <0>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  455  			dmas = <&edma0 0 7>, <&edma0 0 8>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  456  			dma-names = "tx", "rx";
06ee2f0e2180328 Larisa Grigore        2025-05-22  457  			status = "disabled";
06ee2f0e2180328 Larisa Grigore        2025-05-22  458  		};
06ee2f0e2180328 Larisa Grigore        2025-05-22  459  
06ee2f0e2180328 Larisa Grigore        2025-05-22  460  		spi1: spi@401d8000 {
06ee2f0e2180328 Larisa Grigore        2025-05-22  461  			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
06ee2f0e2180328 Larisa Grigore        2025-05-22  462  			reg = <0x401d8000 0x1000>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  463  			interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  464  			clocks = <&clks 26>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  465  			clock-names = "dspi";
06ee2f0e2180328 Larisa Grigore        2025-05-22  466  			spi-num-chipselects = <5>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  467  			bus-num = <1>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  468  			dmas = <&edma0 0 10>, <&edma0 0 11>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  469  			dma-names = "tx", "rx";
06ee2f0e2180328 Larisa Grigore        2025-05-22  470  			status = "disabled";
06ee2f0e2180328 Larisa Grigore        2025-05-22  471  		};
06ee2f0e2180328 Larisa Grigore        2025-05-22  472  
06ee2f0e2180328 Larisa Grigore        2025-05-22  473  		spi2: spi@401dc000 {
06ee2f0e2180328 Larisa Grigore        2025-05-22  474  			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
06ee2f0e2180328 Larisa Grigore        2025-05-22  475  			reg = <0x401dc000 0x1000>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  476  			interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  477  			clocks = <&clks 26>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  478  			clock-names = "dspi";
06ee2f0e2180328 Larisa Grigore        2025-05-22  479  			spi-num-chipselects = <5>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  480  			bus-num = <2>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  481  			dmas = <&edma0 0 13>, <&edma0 0 14>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  482  			dma-names = "tx", "rx";
06ee2f0e2180328 Larisa Grigore        2025-05-22  483  			status = "disabled";
06ee2f0e2180328 Larisa Grigore        2025-05-22  484  		};
06ee2f0e2180328 Larisa Grigore        2025-05-22  485  
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  486  		i2c0: i2c@401e4000 {
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  487  			compatible = "nxp,s32g3-i2c",
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  488  				     "nxp,s32g2-i2c";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  489  			reg = <0x401e4000 0x1000>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  490  			#address-cells = <1>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  491  			#size-cells = <0>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  492  			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  493  			clocks = <&clks 40>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  494  			clock-names = "ipg";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  495  			status = "disabled";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  496  		};
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  497  
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  498  		i2c1: i2c@401e8000 {
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  499  			compatible = "nxp,s32g3-i2c",
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  500  				     "nxp,s32g2-i2c";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  501  			reg = <0x401e8000 0x1000>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  502  			#address-cells = <1>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  503  			#size-cells = <0>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  504  			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  505  			clocks = <&clks 40>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  506  			clock-names = "ipg";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  507  			status = "disabled";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  508  		};
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  509  
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  510  		i2c2: i2c@401ec000 {
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  511  			compatible = "nxp,s32g3-i2c",
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  512  				     "nxp,s32g2-i2c";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  513  			reg = <0x401ec000 0x1000>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  514  			#address-cells = <1>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  515  			#size-cells = <0>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  516  			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  517  			clocks = <&clks 40>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  518  			clock-names = "ipg";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  519  			status = "disabled";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  520  		};
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  521  
9bf72db233806a7 Larisa Grigore        2025-02-03  522  		edma1: dma-controller@40244000 {
9bf72db233806a7 Larisa Grigore        2025-02-03  523  			compatible = "nxp,s32g3-edma", "nxp,s32g2-edma";
9bf72db233806a7 Larisa Grigore        2025-02-03  524  			reg = <0x40244000 0x24000>,
9bf72db233806a7 Larisa Grigore        2025-02-03  525  			      <0x4022c000 0x3000>,
9bf72db233806a7 Larisa Grigore        2025-02-03  526  			      <0x40230000 0x3000>;
9bf72db233806a7 Larisa Grigore        2025-02-03  527  			#dma-cells = <2>;
9bf72db233806a7 Larisa Grigore        2025-02-03  528  			dma-channels = <32>;
9bf72db233806a7 Larisa Grigore        2025-02-03  529  			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
9bf72db233806a7 Larisa Grigore        2025-02-03  530  				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
9bf72db233806a7 Larisa Grigore        2025-02-03  531  				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
9bf72db233806a7 Larisa Grigore        2025-02-03  532  			interrupt-names = "tx-0-15",
9bf72db233806a7 Larisa Grigore        2025-02-03  533  					  "tx-16-31",
9bf72db233806a7 Larisa Grigore        2025-02-03  534  					  "err";
9bf72db233806a7 Larisa Grigore        2025-02-03  535  			clocks = <&clks 63>, <&clks 64>;
9bf72db233806a7 Larisa Grigore        2025-02-03  536  			clock-names = "dmamux0", "dmamux1";
9bf72db233806a7 Larisa Grigore        2025-02-03  537  		};
9bf72db233806a7 Larisa Grigore        2025-02-03  538  
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  539  		can2: can@402a8000 {
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  540  			compatible = "nxp,s32g3-flexcan",
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  541  					   "nxp,s32g2-flexcan";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  542  			reg = <0x402a8000 0xa000>;
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  543  			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  544  				     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  545  				     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  546  				     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  547  			interrupt-names = "mb-0", "state", "berr", "mb-1";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  548  			clocks = <&clks 9>, <&clks 11>;
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  549  			clock-names = "ipg", "per";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  550  			status = "disabled";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  551  		};
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  552  
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  553  		can3: can@402b2000 {
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  554  			compatible = "nxp,s32g3-flexcan",
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  555  					   "nxp,s32g2-flexcan";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  556  			reg = <0x402b2000 0xa000>;
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  557  			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  558  				     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  559  				     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  560  				     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  561  			interrupt-names = "mb-0", "state", "berr", "mb-1";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  562  			clocks = <&clks 9>, <&clks 11>;
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  563  			clock-names = "ipg", "per";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  564  			status = "disabled";
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  565  		};
e82bc7cfea635b2 Ciprian Marian Costea 2025-02-24  566  
44b305a2de85b81 Wadim Mueller         2024-03-24  567  		uart2: serial@402bc000 {
44b305a2de85b81 Wadim Mueller         2024-03-24  568  			compatible = "nxp,s32g3-linflexuart",
44b305a2de85b81 Wadim Mueller         2024-03-24  569  				     "fsl,s32v234-linflexuart";
44b305a2de85b81 Wadim Mueller         2024-03-24  570  			reg = <0x402bc000 0x3000>;
44b305a2de85b81 Wadim Mueller         2024-03-24  571  			interrupts = <GIC_SPI 84 IRQ_TYPE_EDGE_RISING>;
44b305a2de85b81 Wadim Mueller         2024-03-24  572  			status = "disabled";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  573  		};
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  574  
06ee2f0e2180328 Larisa Grigore        2025-05-22  575  		spi3: spi@402c8000 {
06ee2f0e2180328 Larisa Grigore        2025-05-22  576  			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
06ee2f0e2180328 Larisa Grigore        2025-05-22  577  			reg = <0x402c8000 0x1000>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  578  			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  579  			clocks = <&clks 26>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  580  			clock-names = "dspi";
06ee2f0e2180328 Larisa Grigore        2025-05-22  581  			spi-num-chipselects = <5>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  582  			bus-num = <3>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  583  			dmas = <&edma0 1 7>, <&edma0 1 8>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  584  			dma-names = "tx", "rx";
06ee2f0e2180328 Larisa Grigore        2025-05-22  585  			status = "disabled";
06ee2f0e2180328 Larisa Grigore        2025-05-22  586  		};
06ee2f0e2180328 Larisa Grigore        2025-05-22  587  
06ee2f0e2180328 Larisa Grigore        2025-05-22  588  		spi4: spi@402cc000 {
06ee2f0e2180328 Larisa Grigore        2025-05-22  589  			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
06ee2f0e2180328 Larisa Grigore        2025-05-22  590  			reg = <0x402cc000 0x1000>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  591  			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  592  			clocks = <&clks 26>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  593  			clock-names = "dspi";
06ee2f0e2180328 Larisa Grigore        2025-05-22  594  			spi-num-chipselects = <5>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  595  			bus-num = <4>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  596  			dmas = <&edma0 1 10>, <&edma0 1 11>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  597  			dma-names = "tx", "rx";
06ee2f0e2180328 Larisa Grigore        2025-05-22  598  			status = "disabled";
06ee2f0e2180328 Larisa Grigore        2025-05-22  599  		};
06ee2f0e2180328 Larisa Grigore        2025-05-22  600  
06ee2f0e2180328 Larisa Grigore        2025-05-22  601  		spi5: spi@402d0000 {
06ee2f0e2180328 Larisa Grigore        2025-05-22  602  			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
06ee2f0e2180328 Larisa Grigore        2025-05-22  603  			reg = <0x402d0000 0x1000>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  604  			interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  605  			clocks = <&clks 26>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  606  			clock-names = "dspi";
06ee2f0e2180328 Larisa Grigore        2025-05-22  607  			spi-num-chipselects = <5>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  608  			bus-num = <5>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  609  			dmas = <&edma0 1 13>, <&edma0 1 14>;
06ee2f0e2180328 Larisa Grigore        2025-05-22  610  			dma-names = "tx", "rx";
06ee2f0e2180328 Larisa Grigore        2025-05-22  611  			status = "disabled";
06ee2f0e2180328 Larisa Grigore        2025-05-22  612  		};
06ee2f0e2180328 Larisa Grigore        2025-05-22  613  
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  614  		i2c3: i2c@402d8000 {
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  615  			compatible = "nxp,s32g3-i2c",
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  616  				     "nxp,s32g2-i2c";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  617  			reg = <0x402d8000 0x1000>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  618  			#address-cells = <1>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  619  			#size-cells = <0>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  620  			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  621  			clocks = <&clks 40>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  622  			clock-names = "ipg";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  623  			status = "disabled";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  624  		};
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  625  
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  626  		i2c4: i2c@402dc000 {
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  627  			compatible = "nxp,s32g3-i2c",
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  628  				     "nxp,s32g2-i2c";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  629  			reg = <0x402dc000 0x1000>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  630  			#address-cells = <1>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  631  			#size-cells = <0>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  632  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  633  			clocks = <&clks 40>;
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  634  			clock-names = "ipg";
b2194a4cf163d20 Ciprian Marian Costea 2025-01-13  635  			status = "disabled";
44b305a2de85b81 Wadim Mueller         2024-03-24  636  		};
44b305a2de85b81 Wadim Mueller         2024-03-24  637  
44b305a2de85b81 Wadim Mueller         2024-03-24  638  		usdhc0: mmc@402f0000 {
44b305a2de85b81 Wadim Mueller         2024-03-24  639  			compatible = "nxp,s32g3-usdhc",
44b305a2de85b81 Wadim Mueller         2024-03-24  640  				     "nxp,s32g2-usdhc";
44b305a2de85b81 Wadim Mueller         2024-03-24  641  			reg = <0x402f0000 0x1000>;
44b305a2de85b81 Wadim Mueller         2024-03-24  642  			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
44b305a2de85b81 Wadim Mueller         2024-03-24  643  			clocks = <&clks 32>,
44b305a2de85b81 Wadim Mueller         2024-03-24  644  				 <&clks 31>,
44b305a2de85b81 Wadim Mueller         2024-03-24  645  				 <&clks 33>;
44b305a2de85b81 Wadim Mueller         2024-03-24  646  			clock-names = "ipg", "ahb", "per";
44b305a2de85b81 Wadim Mueller         2024-03-24  647  			status = "disabled";
44b305a2de85b81 Wadim Mueller         2024-03-24  648  		};
44b305a2de85b81 Wadim Mueller         2024-03-24  649  
44b305a2de85b81 Wadim Mueller         2024-03-24  650  		gic: interrupt-controller@50800000 {
44b305a2de85b81 Wadim Mueller         2024-03-24  651  			compatible = "arm,gic-v3";
44b305a2de85b81 Wadim Mueller         2024-03-24  652  			#interrupt-cells = <3>;
44b305a2de85b81 Wadim Mueller         2024-03-24  653  			interrupt-controller;
44b305a2de85b81 Wadim Mueller         2024-03-24  654  			reg = <0x50800000 0x10000>,
44b305a2de85b81 Wadim Mueller         2024-03-24  655  			      <0x50900000 0x200000>,
44b305a2de85b81 Wadim Mueller         2024-03-24  656  			      <0x50400000 0x2000>,
44b305a2de85b81 Wadim Mueller         2024-03-24  657  			      <0x50410000 0x2000>,
44b305a2de85b81 Wadim Mueller         2024-03-24  658  			      <0x50420000 0x2000>;
44b305a2de85b81 Wadim Mueller         2024-03-24  659  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
44b305a2de85b81 Wadim Mueller         2024-03-24  660  		};
85886ac491ac309 Daniel Lezcano        2025-07-30  661  
85886ac491ac309 Daniel Lezcano        2025-07-30  662  		stm0: timer@4011c000 {
85886ac491ac309 Daniel Lezcano        2025-07-30  663  			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
85886ac491ac309 Daniel Lezcano        2025-07-30  664  			reg = <0x4011c000 0x3000>;
85886ac491ac309 Daniel Lezcano        2025-07-30  665  			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
85886ac491ac309 Daniel Lezcano        2025-07-30  666  			clock-names = "counter", "module", "register";
85886ac491ac309 Daniel Lezcano        2025-07-30  667  			interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
85886ac491ac309 Daniel Lezcano        2025-07-30  668  			status = "disabled";
85886ac491ac309 Daniel Lezcano        2025-07-30  669  		};
85886ac491ac309 Daniel Lezcano        2025-07-30  670  
85886ac491ac309 Daniel Lezcano        2025-07-30  671  		stm1: timer@40120000 {
85886ac491ac309 Daniel Lezcano        2025-07-30  672  			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
85886ac491ac309 Daniel Lezcano        2025-07-30  673  			reg = <0x40120000 0x3000>;
85886ac491ac309 Daniel Lezcano        2025-07-30  674  			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
85886ac491ac309 Daniel Lezcano        2025-07-30  675  			clock-names = "counter", "module", "register";
85886ac491ac309 Daniel Lezcano        2025-07-30  676  			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
85886ac491ac309 Daniel Lezcano        2025-07-30  677  			status = "disabled";
85886ac491ac309 Daniel Lezcano        2025-07-30  678  		};
85886ac491ac309 Daniel Lezcano        2025-07-30  679  
85886ac491ac309 Daniel Lezcano        2025-07-30  680  		stm2: timer@40124000 {
85886ac491ac309 Daniel Lezcano        2025-07-30  681  			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
85886ac491ac309 Daniel Lezcano        2025-07-30  682  			reg = <0x40124000 0x3000>;
85886ac491ac309 Daniel Lezcano        2025-07-30  683  			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
85886ac491ac309 Daniel Lezcano        2025-07-30  684  			clock-names = "counter", "module", "register";
85886ac491ac309 Daniel Lezcano        2025-07-30  685  			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
85886ac491ac309 Daniel Lezcano        2025-07-30  686  			status = "disabled";
85886ac491ac309 Daniel Lezcano        2025-07-30  687  		};
85886ac491ac309 Daniel Lezcano        2025-07-30  688  
85886ac491ac309 Daniel Lezcano        2025-07-30  689  		stm3: timer@40128000 {
85886ac491ac309 Daniel Lezcano        2025-07-30  690  			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
85886ac491ac309 Daniel Lezcano        2025-07-30  691  			reg = <0x40128000 0x3000>;
85886ac491ac309 Daniel Lezcano        2025-07-30  692  			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
85886ac491ac309 Daniel Lezcano        2025-07-30  693  			clock-names = "counter", "module", "register";
85886ac491ac309 Daniel Lezcano        2025-07-30  694  			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
85886ac491ac309 Daniel Lezcano        2025-07-30  695  			status = "disabled";
85886ac491ac309 Daniel Lezcano        2025-07-30  696  		};
85886ac491ac309 Daniel Lezcano        2025-07-30  697  
85886ac491ac309 Daniel Lezcano        2025-07-30  698  		stm4: timer@4021c000 {
85886ac491ac309 Daniel Lezcano        2025-07-30  699  			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
85886ac491ac309 Daniel Lezcano        2025-07-30  700  			reg = <0x4021c000 0x3000>;
85886ac491ac309 Daniel Lezcano        2025-07-30  701  			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
85886ac491ac309 Daniel Lezcano        2025-07-30  702  			clock-names = "counter", "module", "register";
85886ac491ac309 Daniel Lezcano        2025-07-30  703  			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
85886ac491ac309 Daniel Lezcano        2025-07-30  704  			status = "disabled";
85886ac491ac309 Daniel Lezcano        2025-07-30  705  		};
85886ac491ac309 Daniel Lezcano        2025-07-30  706  
85886ac491ac309 Daniel Lezcano        2025-07-30  707  		stm5: timer@40220000 {
85886ac491ac309 Daniel Lezcano        2025-07-30  708  			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
85886ac491ac309 Daniel Lezcano        2025-07-30  709  			reg = <0x40220000 0x3000>;
85886ac491ac309 Daniel Lezcano        2025-07-30  710  			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
85886ac491ac309 Daniel Lezcano        2025-07-30  711  			clock-names = "counter", "module", "register";
85886ac491ac309 Daniel Lezcano        2025-07-30  712  			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
85886ac491ac309 Daniel Lezcano        2025-07-30  713  			status = "disabled";
85886ac491ac309 Daniel Lezcano        2025-07-30  714  		};
85886ac491ac309 Daniel Lezcano        2025-07-30  715  
85886ac491ac309 Daniel Lezcano        2025-07-30  716  		stm6: timer@40224000 {
85886ac491ac309 Daniel Lezcano        2025-07-30  717  			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
85886ac491ac309 Daniel Lezcano        2025-07-30  718  			reg = <0x40224000 0x3000>;
85886ac491ac309 Daniel Lezcano        2025-07-30  719  			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
85886ac491ac309 Daniel Lezcano        2025-07-30  720  			clock-names = "counter", "module", "register";
85886ac491ac309 Daniel Lezcano        2025-07-30  721  			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
85886ac491ac309 Daniel Lezcano        2025-07-30  722  			status = "disabled";
85886ac491ac309 Daniel Lezcano        2025-07-30  723  		};
85886ac491ac309 Daniel Lezcano        2025-07-30  724  
85886ac491ac309 Daniel Lezcano        2025-07-30  725  		stm8: timer@40520000 {
85886ac491ac309 Daniel Lezcano        2025-07-30  726  			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
85886ac491ac309 Daniel Lezcano        2025-07-30  727  			reg = <0x40520000 0x3000>;
85886ac491ac309 Daniel Lezcano        2025-07-30  728  			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
85886ac491ac309 Daniel Lezcano        2025-07-30  729  			clock-names = "counter", "module", "register";
85886ac491ac309 Daniel Lezcano        2025-07-30  730  			interrupts = <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>;
85886ac491ac309 Daniel Lezcano        2025-07-30  731  			status = "disabled";
85886ac491ac309 Daniel Lezcano        2025-07-30  732  		};
85886ac491ac309 Daniel Lezcano        2025-07-30  733  
85886ac491ac309 Daniel Lezcano        2025-07-30  734  		stm9: timer@40524000 {
85886ac491ac309 Daniel Lezcano        2025-07-30  735  			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
85886ac491ac309 Daniel Lezcano        2025-07-30  736  			reg = <0x40524000 0x3000>;
85886ac491ac309 Daniel Lezcano        2025-07-30  737  			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
85886ac491ac309 Daniel Lezcano        2025-07-30  738  			clock-names = "counter", "module", "register";
85886ac491ac309 Daniel Lezcano        2025-07-30  739  			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
85886ac491ac309 Daniel Lezcano        2025-07-30  740  			status = "disabled";
85886ac491ac309 Daniel Lezcano        2025-07-30  741  		};
85886ac491ac309 Daniel Lezcano        2025-07-30  742  
85886ac491ac309 Daniel Lezcano        2025-07-30  743  		stm10: timer@40528000 {
85886ac491ac309 Daniel Lezcano        2025-07-30  744  			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
85886ac491ac309 Daniel Lezcano        2025-07-30  745  			reg = <0x40528000 0x3000>;
85886ac491ac309 Daniel Lezcano        2025-07-30  746  			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
85886ac491ac309 Daniel Lezcano        2025-07-30  747  			clock-names = "counter", "module", "register";
85886ac491ac309 Daniel Lezcano        2025-07-30  748  			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_HIGH>;
85886ac491ac309 Daniel Lezcano        2025-07-30  749  			status = "disabled";
85886ac491ac309 Daniel Lezcano        2025-07-30  750  		};
85886ac491ac309 Daniel Lezcano        2025-07-30  751  
85886ac491ac309 Daniel Lezcano        2025-07-30  752  		stm11: timer@4052c000 {
85886ac491ac309 Daniel Lezcano        2025-07-30  753  			compatible = "nxp,s32g3-stm", "nxp,s32g2-stm";
85886ac491ac309 Daniel Lezcano        2025-07-30  754  			reg = <0x4052c000 0x3000>;
85886ac491ac309 Daniel Lezcano        2025-07-30  755  			clocks = <&clks 0x3b>, <&clks 0x3c>, <&clks 0x3c>;
85886ac491ac309 Daniel Lezcano        2025-07-30  756  			clock-names = "counter", "module", "register";
85886ac491ac309 Daniel Lezcano        2025-07-30  757  			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
85886ac491ac309 Daniel Lezcano        2025-07-30  758  			status = "disabled";
85886ac491ac309 Daniel Lezcano        2025-07-30  759  		};
e2288077cdbbc49 Daniel Lezcano        2025-07-30  760  
e2288077cdbbc49 Daniel Lezcano        2025-07-30  761  		swt0: watchdog@40100000 {
e2288077cdbbc49 Daniel Lezcano        2025-07-30  762  			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  763  			reg = <0x40100000 0x1000>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  764  			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  765  			clock-names = "counter", "module", "register";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  766  			status = "disabled";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  767  		};
e2288077cdbbc49 Daniel Lezcano        2025-07-30  768  
e2288077cdbbc49 Daniel Lezcano        2025-07-30  769  		swt1: watchdog@40104000 {
e2288077cdbbc49 Daniel Lezcano        2025-07-30  770  			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  771  			reg = <0x40104000 0x1000>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  772  			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  773  			clock-names = "counter", "module", "register";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  774  			status = "disabled";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  775  		};
e2288077cdbbc49 Daniel Lezcano        2025-07-30  776  
e2288077cdbbc49 Daniel Lezcano        2025-07-30  777  		swt2: watchdog@40108000 {
e2288077cdbbc49 Daniel Lezcano        2025-07-30  778  			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  779  			reg = <0x40108000 0x1000>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  780  			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  781  			clock-names = "counter", "module", "register";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  782  			status = "disabled";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  783  		};
e2288077cdbbc49 Daniel Lezcano        2025-07-30  784  
e2288077cdbbc49 Daniel Lezcano        2025-07-30  785  		swt3: watchdog@4010c000 {
e2288077cdbbc49 Daniel Lezcano        2025-07-30  786  			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  787  			reg = <0x4010c000 0x1000>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  788  			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  789  			clock-names = "counter", "module", "register";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  790  			status = "disabled";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  791  		};
e2288077cdbbc49 Daniel Lezcano        2025-07-30  792  
e2288077cdbbc49 Daniel Lezcano        2025-07-30  793  		swt4: watchdog@40200000 {
e2288077cdbbc49 Daniel Lezcano        2025-07-30  794  			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  795  			reg = <0x40200000 0x1000>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  796  			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  797  			clock-names = "counter", "module", "register";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  798  			status = "disabled";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  799  		};
e2288077cdbbc49 Daniel Lezcano        2025-07-30  800  
e2288077cdbbc49 Daniel Lezcano        2025-07-30  801  		swt5: watchdog@40204000 {
e2288077cdbbc49 Daniel Lezcano        2025-07-30  802  			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  803  			reg = <0x40204000 0x1000>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  804  			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  805  			clock-names = "counter", "module", "register";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  806  			status = "disabled";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  807  		};
e2288077cdbbc49 Daniel Lezcano        2025-07-30  808  
e2288077cdbbc49 Daniel Lezcano        2025-07-30  809  		swt6: watchdog@40208000 {
e2288077cdbbc49 Daniel Lezcano        2025-07-30  810  			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  811  			reg = <0x40208000 0x1000>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  812  			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  813  			clock-names = "counter", "module", "register";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  814  			status = "disabled";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  815  		};
e2288077cdbbc49 Daniel Lezcano        2025-07-30  816  
e2288077cdbbc49 Daniel Lezcano        2025-07-30 @817  		swt7: watchdog@4020C000 {
e2288077cdbbc49 Daniel Lezcano        2025-07-30  818  			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  819  			reg = <0x4020C000 0x1000>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  820  			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
e2288077cdbbc49 Daniel Lezcano        2025-07-30  821  			clock-names = "counter", "module", "register";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  822  			status = "disabled";
e2288077cdbbc49 Daniel Lezcano        2025-07-30  823  		};
e2288077cdbbc49 Daniel Lezcano        2025-07-30  824  
e2288077cdbbc49 Daniel Lezcano        2025-07-30 @825  		swt8: watchdog@40500000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
