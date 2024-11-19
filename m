Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EEF38FA3
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Nov 2024 02:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731983683; cv=none; b=fr0gkdIUnfUIiqPfKhIbljT7BgmvL/wKJNSGMMkSgEzx2GUhRDSjasprGs5/tWZQu7D2SsktPbWvZTHQ5zkWLNIn5DXG3T+rInYkOMhSgQFpq8d3id6TuWiIMCnXCfOkVOjIYavzxuy4bPPV/AGhpjBUDcUCO/LYSlS317sHKow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731983683; c=relaxed/simple;
	bh=IP6EuRI20NbqHgO6ciiPdd3/NDtha/OhTumV3Qubv28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YGcQ7dMt0bMIYgnGHYiMcKQg5QZl0OeuPV0w/Pp4NtiDI2iNa3ad1dz7IdtFRb3MGeNAvFWwcbYapHzTHkPz4anTKAEQdkmQaQkJ1D9tgLdgkKhji2DqNd15IJOXUmw+yY/QDAgy0f+Ts7/4GyiNeKK3znpQKFGdAuJ8ajV80Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bx+d/9rv; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bx+d/9rv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731983681; x=1763519681;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IP6EuRI20NbqHgO6ciiPdd3/NDtha/OhTumV3Qubv28=;
  b=bx+d/9rvl2lq2arGdkvbYIchs5xKS4Xy/w/E5+OsIq9BuDSBA0VJTrlp
   U5Efzc1rZ14PoGAfjMY0MTSVh4sX5UgdpOMQwJ5XGx+h6cW9uMzH3547O
   GiZ0sDKf4Kf1sBldWTkMjboa33xG2bjuLogJZWgB2wUDNJ2uUKTzOecpK
   xkBhhVnwO3rxt2LPaPvrjc1TxQJrLHOTw9IQEFX+7x+OaYmaD+G9AQwN0
   YjbRtw7rVV6aYXWWH1ZWbQRPT4clvFxzz5lK1484HsWMaTOROVSKVSgv7
   eqHjooKkXflv/+3F6iWbFmSnHmn2nJ0PPR7sbQEjVVSQfEP0Fol4QlCBk
   g==;
X-CSE-ConnectionGUID: ZWptqbf3RZ2gjHYV2dloGg==
X-CSE-MsgGUID: JXuqUiM6QEOdJTFZlDPaGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="35872430"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="35872430"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:34:39 -0800
X-CSE-ConnectionGUID: I92ATzeAR9WskqrduNyJgQ==
X-CSE-MsgGUID: O+OYhz+cSQqB47yq9Y3nAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89537859"
Received: from lkp-server02.sh.intel.com (HELO 2cc4542d09d4) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Nov 2024 18:34:37 -0800
Received: from kbuild by 2cc4542d09d4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDE4N-00002o-1K;
	Tue, 19 Nov 2024 02:34:28 +0000
Date: Tue, 19 Nov 2024 10:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 6/7] arm64: dts: qcom: ipq5424: Add tsens node
Message-ID: <202411190901.gAjEC4xi-lkp@intel.com>
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
In-Reply-To: <20241115103957.1157495-7-quic_mmanikan@quicinc.com>
References: <20241115103957.1157495-7-quic_mmanikan@quicinc.com>
TO: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
TO: srinivas.kandagatla@linaro.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: amitk@kernel.org
TO: thara.gopinath@gmail.com
TO: rafael@kernel.org
TO: daniel.lezcano@linaro.org
TO: rui.zhang@intel.com
TO: lukasz.luba@arm.com
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: linux-arm-msm@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-pm@vger.kernel.org
CC: quic_srichara@quicinc.com
CC: quic_varada@quicinc.com

Hi Manikanta,

kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20241114]
[cannot apply to robh/for-next rafael-pm/thermal v6.12-rc7 v6.12-rc6 v6.12-rc5 linus/master v6.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Manikanta-Mylavarapu/dt-bindings-thermal-tsens-Add-ipq5332-ipq5424-compatible/20241115-184431
base:   next-20241114
patch link:    https://lore.kernel.org/r/20241115103957.1157495-7-quic_mmanikan%40quicinc.com
patch subject: [PATCH v8 6/7] arm64: dts: qcom: ipq5424: Add tsens node
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241119/202411190901.gAjEC4xi-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190901.gAjEC4xi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411190901.gAjEC4xi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq5424.dtsi:159.30-162.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/s10@3dd: duplicate unit-address (also used in node /soc@0/efuse@a4000/s11@3dd)
>> arch/arm64/boot/dts/qcom/ipq5424.dtsi:169.30-172.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/s12@3de: duplicate unit-address (also used in node /soc@0/efuse@a4000/s13@3de)
>> arch/arm64/boot/dts/qcom/ipq5424.dtsi:189.25-192.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/mode@419: duplicate unit-address (also used in node /soc@0/efuse@a4000/base0@419)

vim +159 arch/arm64/boot/dts/qcom/ipq5424.dtsi

1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   13  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   14  / {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   15  	#address-cells = <2>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   16  	#size-cells = <2>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   17  	interrupt-parent = <&intc>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   18  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   19  	clocks {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   20  		sleep_clk: sleep-clk {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   21  			compatible = "fixed-clock";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   22  			#clock-cells = <0>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   23  		};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   24  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   25  		xo_board: xo-board-clk {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   26  			compatible = "fixed-clock";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   27  			#clock-cells = <0>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   28  		};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   29  	};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   30  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   31  	cpus: cpus {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   32  		#address-cells = <1>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   33  		#size-cells = <0>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   34  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   35  		cpu0: cpu@0 {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   36  			device_type = "cpu";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   37  			compatible = "arm,cortex-a55";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   38  			reg = <0x0>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   39  			enable-method = "psci";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   40  			next-level-cache = <&l2_0>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   41  			l2_0: l2-cache {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   42  				compatible = "cache";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   43  				cache-level = <2>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   44  				cache-unified;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   45  				next-level-cache = <&l3_0>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   46  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   47  				l3_0: l3-cache {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   48  					compatible = "cache";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   49  					cache-level = <3>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   50  					cache-unified;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   51  				};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   52  			};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   53  		};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   54  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   55  		cpu1: cpu@100 {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   56  			device_type = "cpu";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   57  			compatible = "arm,cortex-a55";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   58  			enable-method = "psci";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   59  			reg = <0x100>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   60  			next-level-cache = <&l2_100>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   61  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   62  			l2_100: l2-cache {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   63  				compatible = "cache";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   64  				cache-level = <2>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   65  				cache-unified;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   66  				next-level-cache = <&l3_0>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   67  			};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   68  		};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   69  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   70  		cpu2: cpu@200 {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   71  			device_type = "cpu";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   72  			compatible = "arm,cortex-a55";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   73  			enable-method = "psci";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   74  			reg = <0x200>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   75  			next-level-cache = <&l2_200>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   76  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   77  			l2_200: l2-cache {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   78  				compatible = "cache";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   79  				cache-level = <2>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   80  				cache-unified;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   81  				next-level-cache = <&l3_0>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   82  			};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   83  		};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   84  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   85  		cpu3: cpu@300 {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   86  			device_type = "cpu";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   87  			compatible = "arm,cortex-a55";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   88  			enable-method = "psci";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   89  			reg = <0x300>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   90  			next-level-cache = <&l2_300>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   91  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   92  			l2_300: l2-cache {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   93  				compatible = "cache";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   94  				cache-level = <2>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   95  				cache-unified;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   96  				next-level-cache = <&l3_0>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   97  			};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   98  		};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28   99  	};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  100  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  101  	memory@80000000 {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  102  		device_type = "memory";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  103  		/* We expect the bootloader to fill in the size */
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  104  		reg = <0x0 0x80000000 0x0 0x0>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  105  	};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  106  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  107  	pmu-a55 {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  108  		compatible = "arm,cortex-a55-pmu";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  109  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  110  	};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  111  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  112  	pmu-dsu {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  113  		compatible = "arm,dsu-pmu";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  114  		interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  115  		cpus = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  116  	};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  117  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  118  	psci {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  119  		compatible = "arm,psci-1.0";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  120  		method = "smc";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  121  	};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  122  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  123  	reserved-memory {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  124  		#address-cells = <2>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  125  		#size-cells = <2>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  126  		ranges;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  127  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  128  		tz@8a600000 {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  129  			reg = <0x0 0x8a600000 0x0 0x200000>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  130  			no-map;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  131  		};
35e0a4f0a39651 Manikanta Mylavarapu  2024-10-16  132  
35e0a4f0a39651 Manikanta Mylavarapu  2024-10-16  133  		smem@8a800000 {
35e0a4f0a39651 Manikanta Mylavarapu  2024-10-16  134  			compatible = "qcom,smem";
35e0a4f0a39651 Manikanta Mylavarapu  2024-10-16  135  			reg = <0x0 0x8a800000 0x0 0x32000>;
35e0a4f0a39651 Manikanta Mylavarapu  2024-10-16  136  			no-map;
35e0a4f0a39651 Manikanta Mylavarapu  2024-10-16  137  
35e0a4f0a39651 Manikanta Mylavarapu  2024-10-16  138  			hwlocks = <&tcsr_mutex 3>;
35e0a4f0a39651 Manikanta Mylavarapu  2024-10-16  139  		};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  140  	};
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  141  
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  142  	soc@0 {
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  143  		compatible = "simple-bus";
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  144  		#address-cells = <2>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  145  		#size-cells = <2>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  146  		ranges = <0 0 0 0 0x10 0>;
1a91d2a6021e29 Sricharan Ramabadhran 2024-10-28  147  
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  148  		efuse@a4000 {
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  149  			compatible = "qcom,ipq5424-qfprom", "qcom,qfprom";
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  150  			reg = <0 0x000a4000 0 0x741>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  151  			#address-cells = <1>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  152  			#size-cells = <1>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  153  
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  154  			tsens_sens9_off: s9@3dc {
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  155  				reg = <0x3dc 0x1>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  156  				bits = <4 4>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  157  			};
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  158  
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15 @159  			tsens_sens10_off: s10@3dd {
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  160  				reg = <0x3dd 0x1>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  161  				bits = <0 4>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  162  			};
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  163  
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  164  			tsens_sens11_off: s11@3dd {
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  165  				reg = <0x3dd 0x1>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  166  				bits = <4 4>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  167  			};
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  168  
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15 @169  			tsens_sens12_off: s12@3de {
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  170  				reg = <0x3de 0x1>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  171  				bits = <0 4>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  172  			};
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  173  
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  174  			tsens_sens13_off: s13@3de {
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  175  				reg = <0x3de 0x1>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  176  				bits = <4 4>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  177  			};
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  178  
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  179  			tsens_sens14_off: s14@3e5 {
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  180  				reg = <0x3e5 0x2>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  181  				bits = <7 4>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  182  			};
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  183  
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  184  			tsens_sens15_off: s15@3e6 {
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  185  				reg = <0x3e6 0x1>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  186  				bits = <3 4>;
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  187  			};
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15  188  
02a36fd6c58703 Manikanta Mylavarapu  2024-11-15 @189  			tsens_mode: mode@419 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
