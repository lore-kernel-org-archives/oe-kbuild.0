Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1341A233D67
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731142964; cv=none; b=LY3qLMfFTEcbWZcTo0/FKU6YAxI6PMBJtNAqVDh2SBTSeCdEY3hqkUgnAlImKvKPRuZZjzJdospXAGyGN6meLV5h4HwrPHWoQlFDf7iKMlRx7DAvt14NZwqpDP1HbEuNkBHqxUI8ZJEJORUbAwG6nwg0u6aCjszXmzL8ZO0Bikw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731142964; c=relaxed/simple;
	bh=Raa02qqXf1SZEpfXAzhRQx0GQ1ASS6M5gTQZgpuI9pU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e9wCkMZP5FttHC4tNPguz4HFopfRbxFoYvpAMQ+lHT2UMGBUxeBS+GNKfRaRQaNq0WAVh2qVxM/cjcqhteTZeDjD1Y6ddTrGWpXlXVFMtCFxE6aLCTbFnKMnbwmfQ7HURptK4hyhIy2EKyJYJ0RUeTtrg0hwFJid9iLcTEajo8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2H2GWf/; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2H2GWf/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731142962; x=1762678962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Raa02qqXf1SZEpfXAzhRQx0GQ1ASS6M5gTQZgpuI9pU=;
  b=G2H2GWf/Ml+OROTy05a6YppjVQIFn5YhWJoe48vc/5Hhfb+wlxsQTMTd
   IhdZssvVc43/xFQsBp/c+Ta73LZ5s+Bq2dyBUgj8ATaHfvxyyk/Yf80j8
   lMv0OHc46xyr9s295LG2/bN6XSgMD3yWp2vOn0ft3GUT0cf9lgmXZw01H
   5kpLE5UD8HyKG3wd5Ac2TpeOlV6dr/fATBEUbe61Ay3MAfqIdz2KpZi49
   seGFqCuV/6QKtpx9QsKveowNzOUg4lRYHJ6OE255LTop7l+Sui31fS3Hl
   1zC2IWCugmTlxTEGQ8MrDib6muU/Cao7SQmOnFf23du/DLvs6vPXJyqMh
   A==;
X-CSE-ConnectionGUID: gnwscIRHRfaJZuQfOdfrwA==
X-CSE-MsgGUID: FGmeZjLmQkSgtApEfrqHBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30437990"
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="30437990"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 01:02:41 -0800
X-CSE-ConnectionGUID: pPfcL1W0RsaoIi4i5LtsQQ==
X-CSE-MsgGUID: NH1L+qsoSsO7jS7bWUTSQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="116833792"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 09 Nov 2024 01:02:40 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9hMb-000sF8-29;
	Sat, 09 Nov 2024 09:02:37 +0000
Date: Sat, 9 Nov 2024 17:02:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] arm64: dts: qcom: x1e80100: Add missing
 #address-cells/#size-cells to firmware node
Message-ID: <202411091645.frq37ALT-lkp@intel.com>
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
In-Reply-To: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-1-c1e173369657@linaro.org>
References: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-1-c1e173369657@linaro.org>
TO: Abel Vesa <abel.vesa@linaro.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Sibi Sankar <quic_sibis@quicinc.com>
TO: Rajendra Nayak <quic_rjendra@quicinc.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Johan Hovold <johan@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Abel Vesa <abel.vesa@linaro.org>
CC: stable+noautosel@kernel.org

Hi Abel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 929beafbe7acce3267c06115e13e03ff6e50548a]

url:    https://github.com/intel-lab-lkp/linux/commits/Abel-Vesa/arm64-dts-qcom-x1e80100-Add-missing-address-cells-size-cells-to-firmware-node/20241109-060638
base:   929beafbe7acce3267c06115e13e03ff6e50548a
patch link:    https://lore.kernel.org/r/20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-1-c1e173369657%40linaro.org
patch subject: [PATCH 1/3] arm64: dts: qcom: x1e80100: Add missing #address-cells/#size-cells to firmware node
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-002-20241109 (https://download.01.org/0day-ci/archive/20241109/202411091645.frq37ALT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091645.frq37ALT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411091645.frq37ALT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +306 arch/arm64/boot/dts/qcom/x1e80100.dtsi

af16b00578a7a1 Rajendra Nayak      2023-12-05   23  
af16b00578a7a1 Rajendra Nayak      2023-12-05   24  / {
af16b00578a7a1 Rajendra Nayak      2023-12-05   25  	interrupt-parent = <&intc>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   26  
af16b00578a7a1 Rajendra Nayak      2023-12-05   27  	#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   28  	#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   29  
af16b00578a7a1 Rajendra Nayak      2023-12-05   30  	chosen { };
af16b00578a7a1 Rajendra Nayak      2023-12-05   31  
af16b00578a7a1 Rajendra Nayak      2023-12-05   32  	clocks {
af16b00578a7a1 Rajendra Nayak      2023-12-05   33  		xo_board: xo-board {
af16b00578a7a1 Rajendra Nayak      2023-12-05   34  			compatible = "fixed-clock";
af16b00578a7a1 Rajendra Nayak      2023-12-05   35  			clock-frequency = <76800000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   36  			#clock-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   37  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   38  
af16b00578a7a1 Rajendra Nayak      2023-12-05   39  		sleep_clk: sleep-clk {
af16b00578a7a1 Rajendra Nayak      2023-12-05   40  			compatible = "fixed-clock";
af16b00578a7a1 Rajendra Nayak      2023-12-05   41  			clock-frequency = <32000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   42  			#clock-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   43  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   44  
af16b00578a7a1 Rajendra Nayak      2023-12-05   45  		bi_tcxo_div2: bi-tcxo-div2-clk {
af16b00578a7a1 Rajendra Nayak      2023-12-05   46  			compatible = "fixed-factor-clock";
af16b00578a7a1 Rajendra Nayak      2023-12-05   47  			#clock-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   48  
af16b00578a7a1 Rajendra Nayak      2023-12-05   49  			clocks = <&rpmhcc RPMH_CXO_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   50  			clock-mult = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   51  			clock-div = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   52  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   53  
af16b00578a7a1 Rajendra Nayak      2023-12-05   54  		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
af16b00578a7a1 Rajendra Nayak      2023-12-05   55  			compatible = "fixed-factor-clock";
af16b00578a7a1 Rajendra Nayak      2023-12-05   56  			#clock-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   57  
af16b00578a7a1 Rajendra Nayak      2023-12-05   58  			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   59  			clock-mult = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   60  			clock-div = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   61  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   62  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   63  
af16b00578a7a1 Rajendra Nayak      2023-12-05   64  	cpus {
af16b00578a7a1 Rajendra Nayak      2023-12-05   65  		#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   66  		#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   67  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   68  		cpu0: cpu@0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   69  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   70  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   71  			reg = <0x0 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   72  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   73  			next-level-cache = <&l2_0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   74  			power-domains = <&cpu_pd0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   75  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   76  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   77  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   78  			l2_0: l2-cache {
af16b00578a7a1 Rajendra Nayak      2023-12-05   79  				compatible = "cache";
af16b00578a7a1 Rajendra Nayak      2023-12-05   80  				cache-level = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   81  				cache-unified;
af16b00578a7a1 Rajendra Nayak      2023-12-05   82  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   83  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   84  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   85  		cpu1: cpu@100 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   86  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   87  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   88  			reg = <0x0 0x100>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   89  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   90  			next-level-cache = <&l2_0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   91  			power-domains = <&cpu_pd1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   92  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   93  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   94  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   95  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   96  		cpu2: cpu@200 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   97  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   98  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   99  			reg = <0x0 0x200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  100  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  101  			next-level-cache = <&l2_0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  102  			power-domains = <&cpu_pd2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  103  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  104  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  105  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  106  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  107  		cpu3: cpu@300 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  108  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05  109  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05  110  			reg = <0x0 0x300>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  111  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  112  			next-level-cache = <&l2_0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  113  			power-domains = <&cpu_pd3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  114  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  115  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  116  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  117  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  118  		cpu4: cpu@10000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  119  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05  120  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05  121  			reg = <0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  122  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  123  			next-level-cache = <&l2_1>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  124  			power-domains = <&cpu_pd4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  125  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  126  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  127  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  128  			l2_1: l2-cache {
af16b00578a7a1 Rajendra Nayak      2023-12-05  129  				compatible = "cache";
af16b00578a7a1 Rajendra Nayak      2023-12-05  130  				cache-level = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  131  				cache-unified;
af16b00578a7a1 Rajendra Nayak      2023-12-05  132  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  133  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  134  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  135  		cpu5: cpu@10100 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  136  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05  137  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05  138  			reg = <0x0 0x10100>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  139  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  140  			next-level-cache = <&l2_1>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  141  			power-domains = <&cpu_pd5>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  142  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  143  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  144  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  145  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  146  		cpu6: cpu@10200 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  147  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05  148  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05  149  			reg = <0x0 0x10200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  150  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  151  			next-level-cache = <&l2_1>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  152  			power-domains = <&cpu_pd6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  153  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  154  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  155  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  156  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  157  		cpu7: cpu@10300 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  158  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05  159  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05  160  			reg = <0x0 0x10300>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  161  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  162  			next-level-cache = <&l2_1>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  163  			power-domains = <&cpu_pd7>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  164  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  165  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  166  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  167  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  168  		cpu8: cpu@20000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  169  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05  170  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05  171  			reg = <0x0 0x20000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  172  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  173  			next-level-cache = <&l2_2>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  174  			power-domains = <&cpu_pd8>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  175  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  176  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  177  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  178  			l2_2: l2-cache {
af16b00578a7a1 Rajendra Nayak      2023-12-05  179  				compatible = "cache";
af16b00578a7a1 Rajendra Nayak      2023-12-05  180  				cache-level = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  181  				cache-unified;
af16b00578a7a1 Rajendra Nayak      2023-12-05  182  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  183  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  184  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  185  		cpu9: cpu@20100 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  186  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05  187  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05  188  			reg = <0x0 0x20100>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  189  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  190  			next-level-cache = <&l2_2>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  191  			power-domains = <&cpu_pd9>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  192  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  193  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  194  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  195  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  196  		cpu10: cpu@20200 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  197  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05  198  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05  199  			reg = <0x0 0x20200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  200  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  201  			next-level-cache = <&l2_2>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  202  			power-domains = <&cpu_pd10>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  203  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  204  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  205  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  206  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  207  		cpu11: cpu@20300 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  208  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05  209  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05  210  			reg = <0x0 0x20300>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  211  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  212  			next-level-cache = <&l2_2>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  213  			power-domains = <&cpu_pd11>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  214  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  215  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  216  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  217  
af16b00578a7a1 Rajendra Nayak      2023-12-05  218  		cpu-map {
af16b00578a7a1 Rajendra Nayak      2023-12-05  219  			cluster0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  220  				core0 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  221  					cpu = <&cpu0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  222  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05  223  
af16b00578a7a1 Rajendra Nayak      2023-12-05  224  				core1 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  225  					cpu = <&cpu1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  226  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05  227  
af16b00578a7a1 Rajendra Nayak      2023-12-05  228  				core2 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  229  					cpu = <&cpu2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  230  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05  231  
af16b00578a7a1 Rajendra Nayak      2023-12-05  232  				core3 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  233  					cpu = <&cpu3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  234  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05  235  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  236  
af16b00578a7a1 Rajendra Nayak      2023-12-05  237  			cluster1 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  238  				core0 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  239  					cpu = <&cpu4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  240  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05  241  
af16b00578a7a1 Rajendra Nayak      2023-12-05  242  				core1 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  243  					cpu = <&cpu5>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  244  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05  245  
af16b00578a7a1 Rajendra Nayak      2023-12-05  246  				core2 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  247  					cpu = <&cpu6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  248  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05  249  
af16b00578a7a1 Rajendra Nayak      2023-12-05  250  				core3 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  251  					cpu = <&cpu7>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  252  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05  253  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  254  
af16b00578a7a1 Rajendra Nayak      2023-12-05  255  			cluster2 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  256  				core0 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  257  					cpu = <&cpu8>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  258  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05  259  
af16b00578a7a1 Rajendra Nayak      2023-12-05  260  				core1 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  261  					cpu = <&cpu9>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  262  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05  263  
af16b00578a7a1 Rajendra Nayak      2023-12-05  264  				core2 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  265  					cpu = <&cpu10>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  266  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05  267  
af16b00578a7a1 Rajendra Nayak      2023-12-05  268  				core3 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  269  					cpu = <&cpu11>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  270  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05  271  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  272  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  273  
af16b00578a7a1 Rajendra Nayak      2023-12-05  274  		idle-states {
af16b00578a7a1 Rajendra Nayak      2023-12-05  275  			entry-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05  276  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  277  			cluster_c4: cpu-sleep-0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  278  				compatible = "arm,idle-state";
af16b00578a7a1 Rajendra Nayak      2023-12-05  279  				idle-state-name = "ret";
af16b00578a7a1 Rajendra Nayak      2023-12-05  280  				arm,psci-suspend-param = <0x00000004>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  281  				entry-latency-us = <180>;
2e65616ef07fa4 Konrad Dybcio       2024-07-16  282  				exit-latency-us = <500>;
2e65616ef07fa4 Konrad Dybcio       2024-07-16  283  				min-residency-us = <600>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  284  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  285  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  286  
af16b00578a7a1 Rajendra Nayak      2023-12-05  287  		domain-idle-states {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  288  			cluster_cl4: cluster-sleep-0 {
cb939b9b354268 Rajendra Nayak      2024-03-17  289  				compatible = "domain-idle-state";
af16b00578a7a1 Rajendra Nayak      2023-12-05  290  				arm,psci-suspend-param = <0x01000044>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  291  				entry-latency-us = <350>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  292  				exit-latency-us = <500>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  293  				min-residency-us = <2500>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  294  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  295  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  296  			cluster_cl5: cluster-sleep-1 {
cb939b9b354268 Rajendra Nayak      2024-03-17  297  				compatible = "domain-idle-state";
af16b00578a7a1 Rajendra Nayak      2023-12-05  298  				arm,psci-suspend-param = <0x01000054>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  299  				entry-latency-us = <2200>;
2e65616ef07fa4 Konrad Dybcio       2024-07-16  300  				exit-latency-us = <4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  301  				min-residency-us = <7000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  302  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  303  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  304  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05  305  
af16b00578a7a1 Rajendra Nayak      2023-12-05 @306  	firmware {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
