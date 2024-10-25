Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D82018787C
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 18:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729879948; cv=none; b=Gr1cydgMbRxmSWGYDy3wE//yEP7IfKPY2M7k0GiIpDYUvRjNDHVEYiDHg+lmTg/v6nlsy00tJsQ/0/m+sv0L5Jr9lKnyoPCeJVIXQAK19RBtX1aVle0tl5oD1krtW1qvqOuQADhhRSFpNjSNfAbmu1R6Ztc10kJeuYcs5vHNCL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729879948; c=relaxed/simple;
	bh=lfhfaVxu7abvkwYiPhf2eW4Ze1tOeU+Ih7Zb8Dul5Us=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dMkrNs0X78/Y2gMLsNLHG55U9BaRjizPRCRfjx/3BDgx4twdPZCmDsAhj6bC1RvSr/4sG4qlyVNgj7jhra9sG74LhPtPkJ5I/1nwGXHPuIO+lbNA9IFNdw/s8ul6V8syi23C2qSSEjY0L5JKK7JFVL6lbEGF4Kg0E1ruIEfnYYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nm5AxPoS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nm5AxPoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729879945; x=1761415945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lfhfaVxu7abvkwYiPhf2eW4Ze1tOeU+Ih7Zb8Dul5Us=;
  b=nm5AxPoSraqMAbXapXrIY4Cp1VyC1XKSFMCNeuTCprqVrMTuU3O7pAt6
   u/apCoFAGxO0WQ82uC9/3SLHqOqfzwZApkjpegPeAgV+nMeS54AIhFZNm
   TK6Cyydhs5VkeBGDtNUCK0f/l8cYli/c+Nxf051MeA8q5LWxEd7lUZQp6
   BRm8KAF9IwVIwTTQkiMfuJ4du2DqIG18xqOJfP/BnW6dse1/ZToBXfDGG
   3tRVre0+xkYXJAwkCz1CObLgxui7sQ8piDa8Mv/zlGNTTydlqRBcBqP+w
   0nfB3LzYLx9FwY/f3aVDSw+RlJiK4dC48D5AeiJwnlKMerqFRs8eHhqN/
   A==;
X-CSE-ConnectionGUID: 65neWgNUQq2BVWBPyG7jhA==
X-CSE-MsgGUID: wd5g56WfRg2igauMjy2nXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52111560"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52111560"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 11:12:24 -0700
X-CSE-ConnectionGUID: 4CoYnsM7Q6qYnY9jZbHn/Q==
X-CSE-MsgGUID: 7npOxbQ/QDmDo4aRFeJWSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; 
   d="scan'208";a="81135908"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Oct 2024 11:12:23 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4OnM-000YiX-0i;
	Fri, 25 Oct 2024 18:12:20 +0000
Date: Sat, 26 Oct 2024 02:12:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 13/13] arm64: dts: allwinner: a100: Add CPU Operating
 Performance Points table
Message-ID: <202410260129.jgcKTWL5-lkp@intel.com>
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
In-Reply-To: <20241024170540.2721307-14-masterr3c0rd@epochal.quest>
References: <20241024170540.2721307-14-masterr3c0rd@epochal.quest>
TO: Cody Eksal <masterr3c0rd@epochal.quest>
TO: linux-pm@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
TO: linux-sunxi@lists.linux.dev
TO: linux-kernel@vger.kernel.org
TO: linux-phy@lists.infradead.org
TO: linux-usb@vger.kernel.org
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
CC: Cody Eksal <masterr3c0rd@epochal.quest>
CC: Andre Przywara <andre.przywara@arm.com>
CC: Parthiban <parthiban@linumiz.com>
CC: Yangtao Li <frank@allwinnertech.com>
CC: Florian Fainelli <florian.fainelli@broadcom.com>
CC: Vinod Koul <vkoul@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Thierry Reding <treding@nvidia.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Viresh Kumar <vireshk@kernel.org>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Kishon Vijay Abraham I <kishon@kernel.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Shuosheng Huang <huangshuosheng@allwinnertech.com>

Hi Cody,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c2ee9f594da826bea183ed14f2cc029c719bf4da]

url:    https://github.com/intel-lab-lkp/linux/commits/Cody-Eksal/arm64-dts-allwinner-A100-Add-PMU-mode/20241025-012103
base:   c2ee9f594da826bea183ed14f2cc029c719bf4da
patch link:    https://lore.kernel.org/r/20241024170540.2721307-14-masterr3c0rd%40epochal.quest
patch subject: [PATCH 13/13] arm64: dts: allwinner: a100: Add CPU Operating Performance Points table
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-001-20241025 (https://download.01.org/0day-ci/archive/20241026/202410260129.jgcKTWL5-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241026/202410260129.jgcKTWL5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410260129.jgcKTWL5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi:102.6-560.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi:11.17-18.5: Warning (unit_address_vs_reg): /cpu-opp-table/opp@408000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi:20.17-27.5: Warning (unit_address_vs_reg): /cpu-opp-table/opp@600000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi:29.17-36.5: Warning (unit_address_vs_reg): /cpu-opp-table/opp@816000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi:38.18-45.5: Warning (unit_address_vs_reg): /cpu-opp-table/opp@1080000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi:47.18-54.5: Warning (unit_address_vs_reg): /cpu-opp-table/opp@1200000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi:56.18-63.5: Warning (unit_address_vs_reg): /cpu-opp-table/opp@1320000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi:65.18-72.5: Warning (unit_address_vs_reg): /cpu-opp-table/opp@1464000000: node has a unit name, but no reg or ranges property

vim +11 arch/arm64/boot/dts/allwinner/sun50i-a100-cpu-opp.dtsi

9dfdd9102dd585 Shuosheng Huang 2024-10-24   4  
9dfdd9102dd585 Shuosheng Huang 2024-10-24   5  / {
9dfdd9102dd585 Shuosheng Huang 2024-10-24   6  	cpu_opp_table: cpu-opp-table {
9dfdd9102dd585 Shuosheng Huang 2024-10-24   7  		compatible = "allwinner,sun50i-a100-operating-points";
9dfdd9102dd585 Shuosheng Huang 2024-10-24   8  		nvmem-cells = <&cpu_speed_grade>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24   9  		opp-shared;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  10  
9dfdd9102dd585 Shuosheng Huang 2024-10-24 @11  		opp@408000000 {
9dfdd9102dd585 Shuosheng Huang 2024-10-24  12  			clock-latency-ns = <244144>; /* 8 32k periods */
9dfdd9102dd585 Shuosheng Huang 2024-10-24  13  			opp-hz = /bits/ 64 <408000000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  14  
9dfdd9102dd585 Shuosheng Huang 2024-10-24  15  			opp-microvolt-speed0 = <900000 900000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  16  			opp-microvolt-speed1 = <900000 900000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  17  			opp-microvolt-speed2 = <900000 900000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  18  		};
9dfdd9102dd585 Shuosheng Huang 2024-10-24  19  
9dfdd9102dd585 Shuosheng Huang 2024-10-24  20  		opp@600000000 {
9dfdd9102dd585 Shuosheng Huang 2024-10-24  21  			clock-latency-ns = <244144>; /* 8 32k periods */
9dfdd9102dd585 Shuosheng Huang 2024-10-24  22  			opp-hz = /bits/ 64 <600000000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  23  
9dfdd9102dd585 Shuosheng Huang 2024-10-24  24  			opp-microvolt-speed0 = <900000 900000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  25  			opp-microvolt-speed1 = <900000 900000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  26  			opp-microvolt-speed2 = <900000 900000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  27  		};
9dfdd9102dd585 Shuosheng Huang 2024-10-24  28  
9dfdd9102dd585 Shuosheng Huang 2024-10-24  29  		opp@816000000 {
9dfdd9102dd585 Shuosheng Huang 2024-10-24  30  			clock-latency-ns = <244144>; /* 8 32k periods */
9dfdd9102dd585 Shuosheng Huang 2024-10-24  31  			opp-hz = /bits/ 64 <816000000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  32  
9dfdd9102dd585 Shuosheng Huang 2024-10-24  33  			opp-microvolt-speed0 = <940000 940000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  34  			opp-microvolt-speed1 = <900000 900000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  35  			opp-microvolt-speed2 = <900000 900000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  36  		};
9dfdd9102dd585 Shuosheng Huang 2024-10-24  37  
9dfdd9102dd585 Shuosheng Huang 2024-10-24  38  		opp@1080000000 {
9dfdd9102dd585 Shuosheng Huang 2024-10-24  39  			clock-latency-ns = <244144>; /* 8 32k periods */
9dfdd9102dd585 Shuosheng Huang 2024-10-24  40  			opp-hz = /bits/ 64 <1080000000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  41  
9dfdd9102dd585 Shuosheng Huang 2024-10-24  42  			opp-microvolt-speed0 = <1020000 1020000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  43  			opp-microvolt-speed1 = <980000 980000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  44  			opp-microvolt-speed2 = <950000 950000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  45  		};
9dfdd9102dd585 Shuosheng Huang 2024-10-24  46  
9dfdd9102dd585 Shuosheng Huang 2024-10-24  47  		opp@1200000000 {
9dfdd9102dd585 Shuosheng Huang 2024-10-24  48  			clock-latency-ns = <244144>; /* 8 32k periods */
9dfdd9102dd585 Shuosheng Huang 2024-10-24  49  			opp-hz = /bits/ 64 <1200000000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  50  
9dfdd9102dd585 Shuosheng Huang 2024-10-24  51  			opp-microvolt-speed0 = <1100000 1100000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  52  			opp-microvolt-speed1 = <1020000 1020000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  53  			opp-microvolt-speed2 = <1000000 1000000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  54  		};
9dfdd9102dd585 Shuosheng Huang 2024-10-24  55  
9dfdd9102dd585 Shuosheng Huang 2024-10-24  56  		opp@1320000000 {
9dfdd9102dd585 Shuosheng Huang 2024-10-24  57  			clock-latency-ns = <244144>; /* 8 32k periods */
9dfdd9102dd585 Shuosheng Huang 2024-10-24  58  			opp-hz = /bits/ 64 <1320000000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  59  
9dfdd9102dd585 Shuosheng Huang 2024-10-24  60  			opp-microvolt-speed0 = <1160000 1160000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  61  			opp-microvolt-speed1 = <1060000 1060000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  62  			opp-microvolt-speed2 = <1030000 1030000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  63  		};
9dfdd9102dd585 Shuosheng Huang 2024-10-24  64  
9dfdd9102dd585 Shuosheng Huang 2024-10-24  65  		opp@1464000000 {
9dfdd9102dd585 Shuosheng Huang 2024-10-24  66  			clock-latency-ns = <244144>; /* 8 32k periods */
9dfdd9102dd585 Shuosheng Huang 2024-10-24  67  			opp-hz = /bits/ 64 <1464000000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  68  
9dfdd9102dd585 Shuosheng Huang 2024-10-24  69  			opp-microvolt-speed0 = <1180000 1180000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  70  			opp-microvolt-speed1 = <1180000 1180000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  71  			opp-microvolt-speed2 = <1130000 1130000 1200000>;
9dfdd9102dd585 Shuosheng Huang 2024-10-24  72  		};
9dfdd9102dd585 Shuosheng Huang 2024-10-24  73  	};
9dfdd9102dd585 Shuosheng Huang 2024-10-24  74  };
9dfdd9102dd585 Shuosheng Huang 2024-10-24  75  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
