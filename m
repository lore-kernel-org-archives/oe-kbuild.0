Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86AB289367
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Jul 2025 11:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752751294; cv=none; b=kCHAsHmgaA7KDcL1BZMtQyygKG5HzpLzguHqfphHCVaYrg6VojtvwKs0WmFkzyvIHgK3stxPnrhzqzfmkIUMiwETwzduvnZIHfqC+R+gc0Gy0JQEo6GqiYdYI0pQ4CpMDc0gz2S4BO2LntAT4uBagE8OO6fgZbdMW6DNX3LvhZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752751294; c=relaxed/simple;
	bh=dd9Hh98XNb7q1ANRW0yMz8rWk8HKt/L75Fmf2ap2A54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AZ1D3RyJN/rNJxWwNTR2So3f59Mzr7kRUmmVHqmDx9aSx1x0ssaMGQRT82EvHxi5ajKQ1Z9beq2k/2ViYsr+xe0jIyoJIGX2fKfllzgc2pqu1No5hROgMudDQY4Ok77tFJU49ramdDdrVCs7h6UlUEp2pwlUk1rgWycH9XaSBD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEqzVHEu; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEqzVHEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752751292; x=1784287292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dd9Hh98XNb7q1ANRW0yMz8rWk8HKt/L75Fmf2ap2A54=;
  b=WEqzVHEuTOVC8YFsPe0TVFhwO4mi/7Gg+PBb/v+lJ48bGUOxmIUSEUSW
   Jra9Y4cNZp73MP/JWyhYanSYPFwfBFrigPlDNaXY311w+/Sv609b/ocg8
   vZKn/3RnzaRY3p0H15xBqVBdF262p4TeGZ9XhFY0D3w3Yd/HWsRGcG/li
   ZXFPeRmW8/hWzA6WjyIBFflzuv7MFREVBZohc9Gse6wDVa3NlLe2CS9kt
   kIzInmKFQoBsCD5idHkX7UBgpdSZ6BTYlBLvfDKlVuqJxHr3BQZLhVZYz
   pHLiQGRFqXUAsnrvIdM77JClUzrnjVB0CBqBYX87npKP4ZfxNPf0U+S+M
   A==;
X-CSE-ConnectionGUID: LhFjrEeqTl+vtu8Dcs+vjw==
X-CSE-MsgGUID: U71JFOfvRd6bsfUTNDb2Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54738552"
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="54738552"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 04:21:31 -0700
X-CSE-ConnectionGUID: ukX3CrxsROKR5pFoaofi4w==
X-CSE-MsgGUID: 6GMgtEk2R/Obx1qkexooPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,318,1744095600"; 
   d="scan'208";a="157158838"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Jul 2025 04:21:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucMg3-000DZd-09;
	Thu, 17 Jul 2025 11:21:27 +0000
Date: Thu, 17 Jul 2025 19:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
Message-ID: <202507171934.G0XcPRZB-lkp@intel.com>
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
In-Reply-To: <20250716-hamoa_initial-v1-4-f6f5d0f9a163@oss.qualcomm.com>
References: <20250716-hamoa_initial-v1-4-f6f5d0f9a163@oss.qualcomm.com>
TO: Yijie Yang <yijie.yang@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Yijie Yang <yijie.yang@oss.qualcomm.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Yijie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bf66a1ba8e378d23fde984df2034d909215f5150]

url:    https://github.com/intel-lab-lkp/linux/commits/Yijie-Yang/dt-bindings-arm-qcom-Document-HAMOA-IOT-EVK-board/20250716-171515
base:   bf66a1ba8e378d23fde984df2034d909215f5150
patch link:    https://lore.kernel.org/r/20250716-hamoa_initial-v1-4-f6f5d0f9a163%40oss.qualcomm.com
patch subject: [PATCH 4/4] arm64: dts: qcom: Add base HAMOA-IOT-EVK board
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: arm64-randconfig-001-20250717 (https://download.01.org/0day-ci/archive/20250717/202507171934.G0XcPRZB-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250717/202507171934.G0XcPRZB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507171934.G0XcPRZB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4879.11-4889.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts:40.10-51.6: Warning (graph_child_address): /pmic-glink/connector@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +40 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts

215ff44203cf57 Yijie Yang 2025-07-16    9  
215ff44203cf57 Yijie Yang 2025-07-16   10  / {
215ff44203cf57 Yijie Yang 2025-07-16   11  	model = "Qualcomm Technologies, Inc. Hamoa IoT EVK";
215ff44203cf57 Yijie Yang 2025-07-16   12  	compatible = "qcom,hamoa-iot-evk", "qcom,x1e80100";
215ff44203cf57 Yijie Yang 2025-07-16   13  	chassis-type = "embedded";
215ff44203cf57 Yijie Yang 2025-07-16   14  
215ff44203cf57 Yijie Yang 2025-07-16   15  	aliases {
215ff44203cf57 Yijie Yang 2025-07-16   16  		serial0 = &uart21;
215ff44203cf57 Yijie Yang 2025-07-16   17  		serial1 = &uart14;
215ff44203cf57 Yijie Yang 2025-07-16   18  	};
215ff44203cf57 Yijie Yang 2025-07-16   19  
215ff44203cf57 Yijie Yang 2025-07-16   20  	chosen {
215ff44203cf57 Yijie Yang 2025-07-16   21  		stdout-path = "serial0:115200n8";
215ff44203cf57 Yijie Yang 2025-07-16   22  	};
215ff44203cf57 Yijie Yang 2025-07-16   23  
215ff44203cf57 Yijie Yang 2025-07-16   24  	pmic-glink {
215ff44203cf57 Yijie Yang 2025-07-16   25  		compatible = "qcom,x1e80100-pmic-glink",
215ff44203cf57 Yijie Yang 2025-07-16   26  			     "qcom,sm8550-pmic-glink",
215ff44203cf57 Yijie Yang 2025-07-16   27  			     "qcom,pmic-glink";
215ff44203cf57 Yijie Yang 2025-07-16   28  		#address-cells = <1>;
215ff44203cf57 Yijie Yang 2025-07-16   29  		#size-cells = <0>;
215ff44203cf57 Yijie Yang 2025-07-16   30  		orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
215ff44203cf57 Yijie Yang 2025-07-16   31  				    <&tlmm 123 GPIO_ACTIVE_HIGH>,
215ff44203cf57 Yijie Yang 2025-07-16   32  				    <&tlmm 125 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16   33  
215ff44203cf57 Yijie Yang 2025-07-16   34  		connector@0 {
215ff44203cf57 Yijie Yang 2025-07-16   35  			compatible = "usb-c-connector";
215ff44203cf57 Yijie Yang 2025-07-16   36  			reg = <0>;
215ff44203cf57 Yijie Yang 2025-07-16   37  			power-role = "dual";
215ff44203cf57 Yijie Yang 2025-07-16   38  			data-role = "dual";
215ff44203cf57 Yijie Yang 2025-07-16   39  
215ff44203cf57 Yijie Yang 2025-07-16  @40  			ports {
215ff44203cf57 Yijie Yang 2025-07-16   41  				#address-cells = <1>;
215ff44203cf57 Yijie Yang 2025-07-16   42  				#size-cells = <0>;
215ff44203cf57 Yijie Yang 2025-07-16   43  
215ff44203cf57 Yijie Yang 2025-07-16   44  				port@0 {
215ff44203cf57 Yijie Yang 2025-07-16   45  					reg = <0>;
215ff44203cf57 Yijie Yang 2025-07-16   46  
215ff44203cf57 Yijie Yang 2025-07-16   47  					pmic_glink_ss0_hs_in: endpoint {
215ff44203cf57 Yijie Yang 2025-07-16   48  						remote-endpoint = <&usb_1_ss0_dwc3_hs>;
215ff44203cf57 Yijie Yang 2025-07-16   49  					};
215ff44203cf57 Yijie Yang 2025-07-16   50  				};
215ff44203cf57 Yijie Yang 2025-07-16   51  			};
215ff44203cf57 Yijie Yang 2025-07-16   52  		};
215ff44203cf57 Yijie Yang 2025-07-16   53  
215ff44203cf57 Yijie Yang 2025-07-16   54  		connector@1 {
215ff44203cf57 Yijie Yang 2025-07-16   55  			compatible = "usb-c-connector";
215ff44203cf57 Yijie Yang 2025-07-16   56  			reg = <1>;
215ff44203cf57 Yijie Yang 2025-07-16   57  			power-role = "dual";
215ff44203cf57 Yijie Yang 2025-07-16   58  			data-role = "dual";
215ff44203cf57 Yijie Yang 2025-07-16   59  
215ff44203cf57 Yijie Yang 2025-07-16   60  			ports {
215ff44203cf57 Yijie Yang 2025-07-16   61  				#address-cells = <1>;
215ff44203cf57 Yijie Yang 2025-07-16   62  				#size-cells = <0>;
215ff44203cf57 Yijie Yang 2025-07-16   63  
215ff44203cf57 Yijie Yang 2025-07-16   64  				port@0 {
215ff44203cf57 Yijie Yang 2025-07-16   65  					reg = <0>;
215ff44203cf57 Yijie Yang 2025-07-16   66  
215ff44203cf57 Yijie Yang 2025-07-16   67  					pmic_glink_ss1_hs_in: endpoint {
215ff44203cf57 Yijie Yang 2025-07-16   68  						remote-endpoint = <&usb_1_ss1_dwc3_hs>;
215ff44203cf57 Yijie Yang 2025-07-16   69  					};
215ff44203cf57 Yijie Yang 2025-07-16   70  				};
215ff44203cf57 Yijie Yang 2025-07-16   71  
215ff44203cf57 Yijie Yang 2025-07-16   72  				port@1 {
215ff44203cf57 Yijie Yang 2025-07-16   73  					reg = <1>;
215ff44203cf57 Yijie Yang 2025-07-16   74  
215ff44203cf57 Yijie Yang 2025-07-16   75  					pmic_glink_ss1_ss_in: endpoint {
215ff44203cf57 Yijie Yang 2025-07-16   76  						remote-endpoint = <&retimer_ss1_ss_out>;
215ff44203cf57 Yijie Yang 2025-07-16   77  					};
215ff44203cf57 Yijie Yang 2025-07-16   78  				};
215ff44203cf57 Yijie Yang 2025-07-16   79  
215ff44203cf57 Yijie Yang 2025-07-16   80  				port@2 {
215ff44203cf57 Yijie Yang 2025-07-16   81  					reg = <2>;
215ff44203cf57 Yijie Yang 2025-07-16   82  
215ff44203cf57 Yijie Yang 2025-07-16   83  					pmic_glink_ss1_con_sbu_in: endpoint {
215ff44203cf57 Yijie Yang 2025-07-16   84  						remote-endpoint = <&retimer_ss1_con_sbu_out>;
215ff44203cf57 Yijie Yang 2025-07-16   85  					};
215ff44203cf57 Yijie Yang 2025-07-16   86  				};
215ff44203cf57 Yijie Yang 2025-07-16   87  			};
215ff44203cf57 Yijie Yang 2025-07-16   88  		};
215ff44203cf57 Yijie Yang 2025-07-16   89  
215ff44203cf57 Yijie Yang 2025-07-16   90  		connector@2 {
215ff44203cf57 Yijie Yang 2025-07-16   91  			compatible = "usb-c-connector";
215ff44203cf57 Yijie Yang 2025-07-16   92  			reg = <2>;
215ff44203cf57 Yijie Yang 2025-07-16   93  			power-role = "dual";
215ff44203cf57 Yijie Yang 2025-07-16   94  			data-role = "dual";
215ff44203cf57 Yijie Yang 2025-07-16   95  
215ff44203cf57 Yijie Yang 2025-07-16   96  			ports {
215ff44203cf57 Yijie Yang 2025-07-16   97  				#address-cells = <1>;
215ff44203cf57 Yijie Yang 2025-07-16   98  				#size-cells = <0>;
215ff44203cf57 Yijie Yang 2025-07-16   99  
215ff44203cf57 Yijie Yang 2025-07-16  100  				port@0 {
215ff44203cf57 Yijie Yang 2025-07-16  101  					reg = <0>;
215ff44203cf57 Yijie Yang 2025-07-16  102  
215ff44203cf57 Yijie Yang 2025-07-16  103  					pmic_glink_ss2_hs_in: endpoint {
215ff44203cf57 Yijie Yang 2025-07-16  104  						remote-endpoint = <&usb_1_ss2_dwc3_hs>;
215ff44203cf57 Yijie Yang 2025-07-16  105  					};
215ff44203cf57 Yijie Yang 2025-07-16  106  				};
215ff44203cf57 Yijie Yang 2025-07-16  107  
215ff44203cf57 Yijie Yang 2025-07-16  108  				port@1 {
215ff44203cf57 Yijie Yang 2025-07-16  109  					reg = <1>;
215ff44203cf57 Yijie Yang 2025-07-16  110  
215ff44203cf57 Yijie Yang 2025-07-16  111  					pmic_glink_ss2_ss_in: endpoint {
215ff44203cf57 Yijie Yang 2025-07-16  112  						remote-endpoint = <&retimer_ss2_ss_out>;
215ff44203cf57 Yijie Yang 2025-07-16  113  					};
215ff44203cf57 Yijie Yang 2025-07-16  114  				};
215ff44203cf57 Yijie Yang 2025-07-16  115  
215ff44203cf57 Yijie Yang 2025-07-16  116  				port@2 {
215ff44203cf57 Yijie Yang 2025-07-16  117  					reg = <2>;
215ff44203cf57 Yijie Yang 2025-07-16  118  
215ff44203cf57 Yijie Yang 2025-07-16  119  					pmic_glink_ss2_con_sbu_in: endpoint {
215ff44203cf57 Yijie Yang 2025-07-16  120  						remote-endpoint = <&retimer_ss2_con_sbu_out>;
215ff44203cf57 Yijie Yang 2025-07-16  121  					};
215ff44203cf57 Yijie Yang 2025-07-16  122  				};
215ff44203cf57 Yijie Yang 2025-07-16  123  			};
215ff44203cf57 Yijie Yang 2025-07-16  124  		};
215ff44203cf57 Yijie Yang 2025-07-16  125  	};
215ff44203cf57 Yijie Yang 2025-07-16  126  
215ff44203cf57 Yijie Yang 2025-07-16  127  	vph_pwr: regulator-vph-pwr {
215ff44203cf57 Yijie Yang 2025-07-16  128  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  129  
215ff44203cf57 Yijie Yang 2025-07-16  130  		regulator-name = "vph_pwr";
215ff44203cf57 Yijie Yang 2025-07-16  131  		regulator-min-microvolt = <3700000>;
215ff44203cf57 Yijie Yang 2025-07-16  132  		regulator-max-microvolt = <3700000>;
215ff44203cf57 Yijie Yang 2025-07-16  133  
215ff44203cf57 Yijie Yang 2025-07-16  134  		regulator-always-on;
215ff44203cf57 Yijie Yang 2025-07-16  135  		regulator-boot-on;
215ff44203cf57 Yijie Yang 2025-07-16  136  	};
215ff44203cf57 Yijie Yang 2025-07-16  137  
215ff44203cf57 Yijie Yang 2025-07-16  138  	vreg_nvme: regulator-nvme {
215ff44203cf57 Yijie Yang 2025-07-16  139  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  140  
215ff44203cf57 Yijie Yang 2025-07-16  141  		regulator-name = "VREG_NVME_3P3";
215ff44203cf57 Yijie Yang 2025-07-16  142  		regulator-min-microvolt = <3300000>;
215ff44203cf57 Yijie Yang 2025-07-16  143  		regulator-max-microvolt = <3300000>;
215ff44203cf57 Yijie Yang 2025-07-16  144  
215ff44203cf57 Yijie Yang 2025-07-16  145  		gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16  146  		enable-active-high;
215ff44203cf57 Yijie Yang 2025-07-16  147  
215ff44203cf57 Yijie Yang 2025-07-16  148  		pinctrl-0 = <&nvme_reg_en>;
215ff44203cf57 Yijie Yang 2025-07-16  149  		pinctrl-names = "default";
215ff44203cf57 Yijie Yang 2025-07-16  150  
215ff44203cf57 Yijie Yang 2025-07-16  151  		regulator-boot-on;
215ff44203cf57 Yijie Yang 2025-07-16  152  	};
215ff44203cf57 Yijie Yang 2025-07-16  153  
215ff44203cf57 Yijie Yang 2025-07-16  154  	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
215ff44203cf57 Yijie Yang 2025-07-16  155  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  156  
215ff44203cf57 Yijie Yang 2025-07-16  157  		regulator-name = "VREG_RTMR0_1P15";
215ff44203cf57 Yijie Yang 2025-07-16  158  		regulator-min-microvolt = <1150000>;
215ff44203cf57 Yijie Yang 2025-07-16  159  		regulator-max-microvolt = <1150000>;
215ff44203cf57 Yijie Yang 2025-07-16  160  
215ff44203cf57 Yijie Yang 2025-07-16  161  		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16  162  		enable-active-high;
215ff44203cf57 Yijie Yang 2025-07-16  163  
215ff44203cf57 Yijie Yang 2025-07-16  164  		pinctrl-0 = <&usb0_pwr_1p15_reg_en>;
215ff44203cf57 Yijie Yang 2025-07-16  165  		pinctrl-names = "default";
215ff44203cf57 Yijie Yang 2025-07-16  166  
215ff44203cf57 Yijie Yang 2025-07-16  167  		regulator-boot-on;
215ff44203cf57 Yijie Yang 2025-07-16  168  	};
215ff44203cf57 Yijie Yang 2025-07-16  169  
215ff44203cf57 Yijie Yang 2025-07-16  170  	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
215ff44203cf57 Yijie Yang 2025-07-16  171  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  172  
215ff44203cf57 Yijie Yang 2025-07-16  173  		regulator-name = "VREG_RTMR0_1P8";
215ff44203cf57 Yijie Yang 2025-07-16  174  		regulator-min-microvolt = <1800000>;
215ff44203cf57 Yijie Yang 2025-07-16  175  		regulator-max-microvolt = <1800000>;
215ff44203cf57 Yijie Yang 2025-07-16  176  
215ff44203cf57 Yijie Yang 2025-07-16  177  		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16  178  		enable-active-high;
215ff44203cf57 Yijie Yang 2025-07-16  179  
215ff44203cf57 Yijie Yang 2025-07-16  180  		pinctrl-0 = <&usb0_1p8_reg_en>;
215ff44203cf57 Yijie Yang 2025-07-16  181  		pinctrl-names = "default";
215ff44203cf57 Yijie Yang 2025-07-16  182  
215ff44203cf57 Yijie Yang 2025-07-16  183  		regulator-boot-on;
215ff44203cf57 Yijie Yang 2025-07-16  184  	};
215ff44203cf57 Yijie Yang 2025-07-16  185  
215ff44203cf57 Yijie Yang 2025-07-16  186  	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
215ff44203cf57 Yijie Yang 2025-07-16  187  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  188  
215ff44203cf57 Yijie Yang 2025-07-16  189  		regulator-name = "VREG_RTMR0_3P3";
215ff44203cf57 Yijie Yang 2025-07-16  190  		regulator-min-microvolt = <3300000>;
215ff44203cf57 Yijie Yang 2025-07-16  191  		regulator-max-microvolt = <3300000>;
215ff44203cf57 Yijie Yang 2025-07-16  192  
215ff44203cf57 Yijie Yang 2025-07-16  193  		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16  194  		enable-active-high;
215ff44203cf57 Yijie Yang 2025-07-16  195  
215ff44203cf57 Yijie Yang 2025-07-16  196  		pinctrl-0 = <&usb0_3p3_reg_en>;
215ff44203cf57 Yijie Yang 2025-07-16  197  		pinctrl-names = "default";
215ff44203cf57 Yijie Yang 2025-07-16  198  
215ff44203cf57 Yijie Yang 2025-07-16  199  		regulator-boot-on;
215ff44203cf57 Yijie Yang 2025-07-16  200  	};
215ff44203cf57 Yijie Yang 2025-07-16  201  
215ff44203cf57 Yijie Yang 2025-07-16  202  	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
215ff44203cf57 Yijie Yang 2025-07-16  203  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  204  
215ff44203cf57 Yijie Yang 2025-07-16  205  		regulator-name = "VREG_RTMR1_1P15";
215ff44203cf57 Yijie Yang 2025-07-16  206  		regulator-min-microvolt = <1150000>;
215ff44203cf57 Yijie Yang 2025-07-16  207  		regulator-max-microvolt = <1150000>;
215ff44203cf57 Yijie Yang 2025-07-16  208  
215ff44203cf57 Yijie Yang 2025-07-16  209  		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16  210  		enable-active-high;
215ff44203cf57 Yijie Yang 2025-07-16  211  
215ff44203cf57 Yijie Yang 2025-07-16  212  		pinctrl-0 = <&usb1_pwr_1p15_reg_en>;
215ff44203cf57 Yijie Yang 2025-07-16  213  		pinctrl-names = "default";
215ff44203cf57 Yijie Yang 2025-07-16  214  
215ff44203cf57 Yijie Yang 2025-07-16  215  		regulator-boot-on;
215ff44203cf57 Yijie Yang 2025-07-16  216  	};
215ff44203cf57 Yijie Yang 2025-07-16  217  
215ff44203cf57 Yijie Yang 2025-07-16  218  	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
215ff44203cf57 Yijie Yang 2025-07-16  219  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  220  
215ff44203cf57 Yijie Yang 2025-07-16  221  		regulator-name = "VREG_RTMR1_1P8";
215ff44203cf57 Yijie Yang 2025-07-16  222  		regulator-min-microvolt = <1800000>;
215ff44203cf57 Yijie Yang 2025-07-16  223  		regulator-max-microvolt = <1800000>;
215ff44203cf57 Yijie Yang 2025-07-16  224  
215ff44203cf57 Yijie Yang 2025-07-16  225  		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16  226  		enable-active-high;
215ff44203cf57 Yijie Yang 2025-07-16  227  
215ff44203cf57 Yijie Yang 2025-07-16  228  		pinctrl-0 = <&usb1_pwr_1p8_reg_en>;
215ff44203cf57 Yijie Yang 2025-07-16  229  		pinctrl-names = "default";
215ff44203cf57 Yijie Yang 2025-07-16  230  
215ff44203cf57 Yijie Yang 2025-07-16  231  		regulator-boot-on;
215ff44203cf57 Yijie Yang 2025-07-16  232  	};
215ff44203cf57 Yijie Yang 2025-07-16  233  
215ff44203cf57 Yijie Yang 2025-07-16  234  	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
215ff44203cf57 Yijie Yang 2025-07-16  235  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  236  
215ff44203cf57 Yijie Yang 2025-07-16  237  		regulator-name = "VREG_RTMR1_3P3";
215ff44203cf57 Yijie Yang 2025-07-16  238  		regulator-min-microvolt = <3300000>;
215ff44203cf57 Yijie Yang 2025-07-16  239  		regulator-max-microvolt = <3300000>;
215ff44203cf57 Yijie Yang 2025-07-16  240  
215ff44203cf57 Yijie Yang 2025-07-16  241  		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16  242  		enable-active-high;
215ff44203cf57 Yijie Yang 2025-07-16  243  
215ff44203cf57 Yijie Yang 2025-07-16  244  		pinctrl-0 = <&usb1_pwr_3p3_reg_en>;
215ff44203cf57 Yijie Yang 2025-07-16  245  		pinctrl-names = "default";
215ff44203cf57 Yijie Yang 2025-07-16  246  
215ff44203cf57 Yijie Yang 2025-07-16  247  		regulator-boot-on;
215ff44203cf57 Yijie Yang 2025-07-16  248  	};
215ff44203cf57 Yijie Yang 2025-07-16  249  
215ff44203cf57 Yijie Yang 2025-07-16  250  	vreg_rtmr2_1p15: regulator-rtmr2-1p15 {
215ff44203cf57 Yijie Yang 2025-07-16  251  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  252  
215ff44203cf57 Yijie Yang 2025-07-16  253  		regulator-name = "VREG_RTMR2_1P15";
215ff44203cf57 Yijie Yang 2025-07-16  254  		regulator-min-microvolt = <1150000>;
215ff44203cf57 Yijie Yang 2025-07-16  255  		regulator-max-microvolt = <1150000>;
215ff44203cf57 Yijie Yang 2025-07-16  256  
215ff44203cf57 Yijie Yang 2025-07-16  257  		gpio = <&tlmm 189 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16  258  		enable-active-high;
215ff44203cf57 Yijie Yang 2025-07-16  259  
215ff44203cf57 Yijie Yang 2025-07-16  260  		pinctrl-0 = <&usb2_pwr_1p15_reg_en>;
215ff44203cf57 Yijie Yang 2025-07-16  261  		pinctrl-names = "default";
215ff44203cf57 Yijie Yang 2025-07-16  262  
215ff44203cf57 Yijie Yang 2025-07-16  263  		regulator-boot-on;
215ff44203cf57 Yijie Yang 2025-07-16  264  	};
215ff44203cf57 Yijie Yang 2025-07-16  265  
215ff44203cf57 Yijie Yang 2025-07-16  266  	vreg_rtmr2_1p8: regulator-rtmr2-1p8 {
215ff44203cf57 Yijie Yang 2025-07-16  267  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  268  
215ff44203cf57 Yijie Yang 2025-07-16  269  		regulator-name = "VREG_RTMR2_1P8";
215ff44203cf57 Yijie Yang 2025-07-16  270  		regulator-min-microvolt = <1800000>;
215ff44203cf57 Yijie Yang 2025-07-16  271  		regulator-max-microvolt = <1800000>;
215ff44203cf57 Yijie Yang 2025-07-16  272  
215ff44203cf57 Yijie Yang 2025-07-16  273  		gpio = <&tlmm 126 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16  274  		enable-active-high;
215ff44203cf57 Yijie Yang 2025-07-16  275  
215ff44203cf57 Yijie Yang 2025-07-16  276  		pinctrl-0 = <&usb2_pwr_1p8_reg_en>;
215ff44203cf57 Yijie Yang 2025-07-16  277  		pinctrl-names = "default";
215ff44203cf57 Yijie Yang 2025-07-16  278  
215ff44203cf57 Yijie Yang 2025-07-16  279  		regulator-boot-on;
215ff44203cf57 Yijie Yang 2025-07-16  280  	};
215ff44203cf57 Yijie Yang 2025-07-16  281  
215ff44203cf57 Yijie Yang 2025-07-16  282  	vreg_rtmr2_3p3: regulator-rtmr2-3p3 {
215ff44203cf57 Yijie Yang 2025-07-16  283  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  284  
215ff44203cf57 Yijie Yang 2025-07-16  285  		regulator-name = "VREG_RTMR2_3P3";
215ff44203cf57 Yijie Yang 2025-07-16  286  		regulator-min-microvolt = <3300000>;
215ff44203cf57 Yijie Yang 2025-07-16  287  		regulator-max-microvolt = <3300000>;
215ff44203cf57 Yijie Yang 2025-07-16  288  
215ff44203cf57 Yijie Yang 2025-07-16  289  		gpio = <&tlmm 187 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16  290  		enable-active-high;
215ff44203cf57 Yijie Yang 2025-07-16  291  
215ff44203cf57 Yijie Yang 2025-07-16  292  		pinctrl-0 = <&usb2_pwr_3p3_reg_en>;
215ff44203cf57 Yijie Yang 2025-07-16  293  		pinctrl-names = "default";
215ff44203cf57 Yijie Yang 2025-07-16  294  
215ff44203cf57 Yijie Yang 2025-07-16  295  		regulator-boot-on;
215ff44203cf57 Yijie Yang 2025-07-16  296  	};
215ff44203cf57 Yijie Yang 2025-07-16  297  
215ff44203cf57 Yijie Yang 2025-07-16  298  	vreg_wcn_3p3: regulator-wcn-3p3 {
215ff44203cf57 Yijie Yang 2025-07-16  299  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  300  
215ff44203cf57 Yijie Yang 2025-07-16  301  		regulator-name = "VREG_WCN_3P3";
215ff44203cf57 Yijie Yang 2025-07-16  302  		regulator-min-microvolt = <3300000>;
215ff44203cf57 Yijie Yang 2025-07-16  303  		regulator-max-microvolt = <3300000>;
215ff44203cf57 Yijie Yang 2025-07-16  304  
215ff44203cf57 Yijie Yang 2025-07-16  305  		gpio = <&tlmm 214 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16  306  		enable-active-high;
215ff44203cf57 Yijie Yang 2025-07-16  307  
215ff44203cf57 Yijie Yang 2025-07-16  308  		pinctrl-0 = <&wcn_sw_en>;
215ff44203cf57 Yijie Yang 2025-07-16  309  		pinctrl-names = "default";
215ff44203cf57 Yijie Yang 2025-07-16  310  
215ff44203cf57 Yijie Yang 2025-07-16  311  		regulator-boot-on;
215ff44203cf57 Yijie Yang 2025-07-16  312  	};
215ff44203cf57 Yijie Yang 2025-07-16  313  
215ff44203cf57 Yijie Yang 2025-07-16  314  	/*
215ff44203cf57 Yijie Yang 2025-07-16  315  	 * TODO: These two regulators are actually part of the removable M.2
215ff44203cf57 Yijie Yang 2025-07-16  316  	 * card and not the CRD mainboard. Need to describe this differently.
215ff44203cf57 Yijie Yang 2025-07-16  317  	 * Functionally it works correctly, because all we need to do is to
215ff44203cf57 Yijie Yang 2025-07-16  318  	 * turn on the actual 3.3V supply above.
215ff44203cf57 Yijie Yang 2025-07-16  319  	 */
215ff44203cf57 Yijie Yang 2025-07-16  320  	vreg_wcn_0p95: regulator-wcn-0p95 {
215ff44203cf57 Yijie Yang 2025-07-16  321  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  322  
215ff44203cf57 Yijie Yang 2025-07-16  323  		regulator-name = "VREG_WCN_0P95";
215ff44203cf57 Yijie Yang 2025-07-16  324  		regulator-min-microvolt = <950000>;
215ff44203cf57 Yijie Yang 2025-07-16  325  		regulator-max-microvolt = <950000>;
215ff44203cf57 Yijie Yang 2025-07-16  326  
215ff44203cf57 Yijie Yang 2025-07-16  327  		vin-supply = <&vreg_wcn_3p3>;
215ff44203cf57 Yijie Yang 2025-07-16  328  	};
215ff44203cf57 Yijie Yang 2025-07-16  329  
215ff44203cf57 Yijie Yang 2025-07-16  330  	vreg_wcn_1p9: regulator-wcn-1p9 {
215ff44203cf57 Yijie Yang 2025-07-16  331  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  332  
215ff44203cf57 Yijie Yang 2025-07-16  333  		regulator-name = "VREG_WCN_1P9";
215ff44203cf57 Yijie Yang 2025-07-16  334  		regulator-min-microvolt = <1900000>;
215ff44203cf57 Yijie Yang 2025-07-16  335  		regulator-max-microvolt = <1900000>;
215ff44203cf57 Yijie Yang 2025-07-16  336  
215ff44203cf57 Yijie Yang 2025-07-16  337  		vin-supply = <&vreg_wcn_3p3>;
215ff44203cf57 Yijie Yang 2025-07-16  338  	};
215ff44203cf57 Yijie Yang 2025-07-16  339  
215ff44203cf57 Yijie Yang 2025-07-16  340  	vreg_wwan: regulator-wwan {
215ff44203cf57 Yijie Yang 2025-07-16  341  		compatible = "regulator-fixed";
215ff44203cf57 Yijie Yang 2025-07-16  342  
215ff44203cf57 Yijie Yang 2025-07-16  343  		regulator-name = "SDX_VPH_PWR";
215ff44203cf57 Yijie Yang 2025-07-16  344  		regulator-min-microvolt = <3300000>;
215ff44203cf57 Yijie Yang 2025-07-16  345  		regulator-max-microvolt = <3300000>;
215ff44203cf57 Yijie Yang 2025-07-16  346  
215ff44203cf57 Yijie Yang 2025-07-16  347  		gpio = <&tlmm 221 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16  348  		enable-active-high;
215ff44203cf57 Yijie Yang 2025-07-16  349  
215ff44203cf57 Yijie Yang 2025-07-16  350  		pinctrl-0 = <&wwan_sw_en>;
215ff44203cf57 Yijie Yang 2025-07-16  351  		pinctrl-names = "default";
215ff44203cf57 Yijie Yang 2025-07-16  352  
215ff44203cf57 Yijie Yang 2025-07-16  353  		regulator-boot-on;
215ff44203cf57 Yijie Yang 2025-07-16  354  	};
215ff44203cf57 Yijie Yang 2025-07-16  355  
215ff44203cf57 Yijie Yang 2025-07-16  356  	wcn7850-pmu {
215ff44203cf57 Yijie Yang 2025-07-16  357  		compatible = "qcom,wcn7850-pmu";
215ff44203cf57 Yijie Yang 2025-07-16  358  
215ff44203cf57 Yijie Yang 2025-07-16  359  		vdd-supply = <&vreg_wcn_0p95>;
215ff44203cf57 Yijie Yang 2025-07-16  360  		vddio-supply = <&vreg_l15b_1p8>;
215ff44203cf57 Yijie Yang 2025-07-16  361  		vddaon-supply = <&vreg_wcn_0p95>;
215ff44203cf57 Yijie Yang 2025-07-16  362  		vdddig-supply = <&vreg_wcn_0p95>;
215ff44203cf57 Yijie Yang 2025-07-16  363  		vddrfa1p2-supply = <&vreg_wcn_1p9>;
215ff44203cf57 Yijie Yang 2025-07-16  364  		vddrfa1p8-supply = <&vreg_wcn_1p9>;
215ff44203cf57 Yijie Yang 2025-07-16  365  
215ff44203cf57 Yijie Yang 2025-07-16  366  		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
215ff44203cf57 Yijie Yang 2025-07-16  367  
215ff44203cf57 Yijie Yang 2025-07-16  368  		pinctrl-0 = <&wcn_bt_en>;
215ff44203cf57 Yijie Yang 2025-07-16  369  		pinctrl-names = "default";
215ff44203cf57 Yijie Yang 2025-07-16  370  
215ff44203cf57 Yijie Yang 2025-07-16  371  		regulators {
215ff44203cf57 Yijie Yang 2025-07-16  372  			vreg_pmu_rfa_cmn: ldo0 {
215ff44203cf57 Yijie Yang 2025-07-16  373  				regulator-name = "vreg_pmu_rfa_cmn";
215ff44203cf57 Yijie Yang 2025-07-16  374  			};
215ff44203cf57 Yijie Yang 2025-07-16  375  
215ff44203cf57 Yijie Yang 2025-07-16  376  			vreg_pmu_aon_0p59: ldo1 {
215ff44203cf57 Yijie Yang 2025-07-16  377  				regulator-name = "vreg_pmu_aon_0p59";
215ff44203cf57 Yijie Yang 2025-07-16  378  			};
215ff44203cf57 Yijie Yang 2025-07-16  379  
215ff44203cf57 Yijie Yang 2025-07-16  380  			vreg_pmu_wlcx_0p8: ldo2 {
215ff44203cf57 Yijie Yang 2025-07-16  381  				regulator-name = "vreg_pmu_wlcx_0p8";
215ff44203cf57 Yijie Yang 2025-07-16  382  			};
215ff44203cf57 Yijie Yang 2025-07-16  383  
215ff44203cf57 Yijie Yang 2025-07-16  384  			vreg_pmu_wlmx_0p85: ldo3 {
215ff44203cf57 Yijie Yang 2025-07-16  385  				regulator-name = "vreg_pmu_wlmx_0p85";
215ff44203cf57 Yijie Yang 2025-07-16  386  			};
215ff44203cf57 Yijie Yang 2025-07-16  387  
215ff44203cf57 Yijie Yang 2025-07-16  388  			vreg_pmu_btcmx_0p85: ldo4 {
215ff44203cf57 Yijie Yang 2025-07-16  389  				regulator-name = "vreg_pmu_btcmx_0p85";
215ff44203cf57 Yijie Yang 2025-07-16  390  			};
215ff44203cf57 Yijie Yang 2025-07-16  391  
215ff44203cf57 Yijie Yang 2025-07-16  392  			vreg_pmu_rfa_0p8: ldo5 {
215ff44203cf57 Yijie Yang 2025-07-16  393  				regulator-name = "vreg_pmu_rfa_0p8";
215ff44203cf57 Yijie Yang 2025-07-16  394  			};
215ff44203cf57 Yijie Yang 2025-07-16  395  
215ff44203cf57 Yijie Yang 2025-07-16  396  			vreg_pmu_rfa_1p2: ldo6 {
215ff44203cf57 Yijie Yang 2025-07-16  397  				regulator-name = "vreg_pmu_rfa_1p2";
215ff44203cf57 Yijie Yang 2025-07-16  398  			};
215ff44203cf57 Yijie Yang 2025-07-16  399  
215ff44203cf57 Yijie Yang 2025-07-16  400  			vreg_pmu_rfa_1p8: ldo7 {
215ff44203cf57 Yijie Yang 2025-07-16  401  				regulator-name = "vreg_pmu_rfa_1p8";
215ff44203cf57 Yijie Yang 2025-07-16  402  			};
215ff44203cf57 Yijie Yang 2025-07-16  403  
215ff44203cf57 Yijie Yang 2025-07-16  404  			vreg_pmu_pcie_0p9: ldo8 {
215ff44203cf57 Yijie Yang 2025-07-16  405  				regulator-name = "vreg_pmu_pcie_0p9";
215ff44203cf57 Yijie Yang 2025-07-16  406  			};
215ff44203cf57 Yijie Yang 2025-07-16  407  
215ff44203cf57 Yijie Yang 2025-07-16  408  			vreg_pmu_pcie_1p8: ldo9 {
215ff44203cf57 Yijie Yang 2025-07-16  409  				regulator-name = "vreg_pmu_pcie_1p8";
215ff44203cf57 Yijie Yang 2025-07-16  410  			};
215ff44203cf57 Yijie Yang 2025-07-16  411  		};
215ff44203cf57 Yijie Yang 2025-07-16  412  	};
215ff44203cf57 Yijie Yang 2025-07-16  413  };
215ff44203cf57 Yijie Yang 2025-07-16  414  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
