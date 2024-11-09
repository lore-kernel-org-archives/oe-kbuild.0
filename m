Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A3A13D50C
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 13:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731158283; cv=none; b=PLn9tJUgGtWlf9mFgzoxgQ53MhrNZsDOwRdUtWZhPyr7KqcI7IR0hfxigv1lVHMoMhMSNxcTwyOK/w/lD7OlYqKEP5pVTHKYLRo3eS64siIjZuQAOYvwD0Wms3EfUbtqM1kDTL2eq8vbvS+07Qn+GFG6VwqiyEhXJhqbOJbeM+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731158283; c=relaxed/simple;
	bh=pIQe/A4uw4BH3TUNwZGrrvoNyiJnulhhPX9CuIizu4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LkcSV8NiZ7tmhuBuCX2DoCZjrrUQlbCvuoDoFDQZZYwN/VbVTDFMYfsK0E0qObCiPM0sU9/G4mYeGZ6SIqaKLm/EPK8H/eO8E0ixN+Gqydvl4CgChXZHojbf9EgNU31scrkAPabz/D3jTCF+9TRcwSCgK9+2jnjcF4n3lIES5mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5/B3CAE; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5/B3CAE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731158268; x=1762694268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pIQe/A4uw4BH3TUNwZGrrvoNyiJnulhhPX9CuIizu4M=;
  b=I5/B3CAEbO0anQST8Pwx4Pr70FgkoFGS2s+b/snA/FVdzO9WaZwSjf0b
   OtSDMZFN4CuBpPMIRHMQ4xp1/v9JvNnHwbEcwUjvdpr1A3bRKUQ44LV8J
   UV+hWcw/ZwwJrZMmufxOehLpzfrLNDqypdvI3tPDt8wQJNnDKCW/ZaSLg
   /YXa0ttDkCGgBzTZGkl2YeWXg9akRrQJxyxfhK4/2Cgz8sRI1O0GgA9Px
   Bgxdef7Fu/lQE/nFDVdnY8tp9e0TafZ75mJH+2vtcnTBIG14ybaCD8d4G
   h12qBVvtuCphnhRkMGNklRyrGWG6bT9QIDihYsvJjjp0pAdvgHPTae5bI
   g==;
X-CSE-ConnectionGUID: PVFeIPMPQnaq6oAO0rqEFg==
X-CSE-MsgGUID: c06oSOINT2G1cAYaC+KlNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="18652876"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="18652876"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 05:17:47 -0800
X-CSE-ConnectionGUID: jgPGJ5TvSaG+0Cp37MTqzQ==
X-CSE-MsgGUID: P+AX/t8rTqqcsWGd0Amomg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="85681443"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Nov 2024 05:17:45 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9lLS-000sN0-1j;
	Sat, 09 Nov 2024 13:17:42 +0000
Date: Sat, 9 Nov 2024 21:17:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/3] arm64: dts: qcom: x1e80100: Add missing
 #address-cells/#size-cells to ADSP GPR nodes
Message-ID: <202411092010.EHuek8dO-lkp@intel.com>
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
In-Reply-To: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-2-c1e173369657@linaro.org>
References: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-2-c1e173369657@linaro.org>
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
patch link:    https://lore.kernel.org/r/20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-2-c1e173369657%40linaro.org
patch subject: [PATCH 2/3] arm64: dts: qcom: x1e80100: Add missing #address-cells/#size-cells to ADSP GPR nodes
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: arm64-randconfig-002-20241109 (https://download.01.org/0day-ci/archive/20241109/202411092010.EHuek8dO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411092010.EHuek8dO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411092010.EHuek8dO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +6229 arch/arm64/boot/dts/qcom/x1e80100.dtsi

af16b00578a7a1 Rajendra Nayak      2023-12-05    23  
af16b00578a7a1 Rajendra Nayak      2023-12-05    24  / {
af16b00578a7a1 Rajendra Nayak      2023-12-05    25  	interrupt-parent = <&intc>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    26  
af16b00578a7a1 Rajendra Nayak      2023-12-05    27  	#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    28  	#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    29  
af16b00578a7a1 Rajendra Nayak      2023-12-05    30  	chosen { };
af16b00578a7a1 Rajendra Nayak      2023-12-05    31  
af16b00578a7a1 Rajendra Nayak      2023-12-05    32  	clocks {
af16b00578a7a1 Rajendra Nayak      2023-12-05    33  		xo_board: xo-board {
af16b00578a7a1 Rajendra Nayak      2023-12-05    34  			compatible = "fixed-clock";
af16b00578a7a1 Rajendra Nayak      2023-12-05    35  			clock-frequency = <76800000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    36  			#clock-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    37  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05    38  
af16b00578a7a1 Rajendra Nayak      2023-12-05    39  		sleep_clk: sleep-clk {
af16b00578a7a1 Rajendra Nayak      2023-12-05    40  			compatible = "fixed-clock";
af16b00578a7a1 Rajendra Nayak      2023-12-05    41  			clock-frequency = <32000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    42  			#clock-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    43  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05    44  
af16b00578a7a1 Rajendra Nayak      2023-12-05    45  		bi_tcxo_div2: bi-tcxo-div2-clk {
af16b00578a7a1 Rajendra Nayak      2023-12-05    46  			compatible = "fixed-factor-clock";
af16b00578a7a1 Rajendra Nayak      2023-12-05    47  			#clock-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    48  
af16b00578a7a1 Rajendra Nayak      2023-12-05    49  			clocks = <&rpmhcc RPMH_CXO_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    50  			clock-mult = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    51  			clock-div = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    52  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05    53  
af16b00578a7a1 Rajendra Nayak      2023-12-05    54  		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
af16b00578a7a1 Rajendra Nayak      2023-12-05    55  			compatible = "fixed-factor-clock";
af16b00578a7a1 Rajendra Nayak      2023-12-05    56  			#clock-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    57  
af16b00578a7a1 Rajendra Nayak      2023-12-05    58  			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    59  			clock-mult = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    60  			clock-div = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    61  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05    62  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05    63  
af16b00578a7a1 Rajendra Nayak      2023-12-05    64  	cpus {
af16b00578a7a1 Rajendra Nayak      2023-12-05    65  		#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    66  		#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    67  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    68  		cpu0: cpu@0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05    69  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05    70  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05    71  			reg = <0x0 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    72  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    73  			next-level-cache = <&l2_0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    74  			power-domains = <&cpu_pd0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    75  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    76  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    77  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    78  			l2_0: l2-cache {
af16b00578a7a1 Rajendra Nayak      2023-12-05    79  				compatible = "cache";
af16b00578a7a1 Rajendra Nayak      2023-12-05    80  				cache-level = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    81  				cache-unified;
af16b00578a7a1 Rajendra Nayak      2023-12-05    82  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05    83  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05    84  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    85  		cpu1: cpu@100 {
af16b00578a7a1 Rajendra Nayak      2023-12-05    86  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05    87  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05    88  			reg = <0x0 0x100>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    89  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    90  			next-level-cache = <&l2_0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    91  			power-domains = <&cpu_pd1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    92  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    93  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05    94  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05    95  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22    96  		cpu2: cpu@200 {
af16b00578a7a1 Rajendra Nayak      2023-12-05    97  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05    98  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05    99  			reg = <0x0 0x200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   100  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   101  			next-level-cache = <&l2_0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   102  			power-domains = <&cpu_pd2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   103  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   104  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   105  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   106  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   107  		cpu3: cpu@300 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   108  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   109  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   110  			reg = <0x0 0x300>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   111  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   112  			next-level-cache = <&l2_0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   113  			power-domains = <&cpu_pd3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   114  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   115  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   116  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   117  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   118  		cpu4: cpu@10000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   119  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   120  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   121  			reg = <0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   122  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   123  			next-level-cache = <&l2_1>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   124  			power-domains = <&cpu_pd4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   125  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   126  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   127  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   128  			l2_1: l2-cache {
af16b00578a7a1 Rajendra Nayak      2023-12-05   129  				compatible = "cache";
af16b00578a7a1 Rajendra Nayak      2023-12-05   130  				cache-level = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   131  				cache-unified;
af16b00578a7a1 Rajendra Nayak      2023-12-05   132  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   133  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   134  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   135  		cpu5: cpu@10100 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   136  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   137  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   138  			reg = <0x0 0x10100>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   139  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   140  			next-level-cache = <&l2_1>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   141  			power-domains = <&cpu_pd5>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   142  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   143  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   144  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   145  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   146  		cpu6: cpu@10200 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   147  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   148  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   149  			reg = <0x0 0x10200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   150  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   151  			next-level-cache = <&l2_1>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   152  			power-domains = <&cpu_pd6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   153  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   154  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   155  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   156  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   157  		cpu7: cpu@10300 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   158  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   159  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   160  			reg = <0x0 0x10300>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   161  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   162  			next-level-cache = <&l2_1>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   163  			power-domains = <&cpu_pd7>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   164  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   165  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   166  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   167  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   168  		cpu8: cpu@20000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   169  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   170  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   171  			reg = <0x0 0x20000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   172  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   173  			next-level-cache = <&l2_2>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   174  			power-domains = <&cpu_pd8>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   175  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   176  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   177  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   178  			l2_2: l2-cache {
af16b00578a7a1 Rajendra Nayak      2023-12-05   179  				compatible = "cache";
af16b00578a7a1 Rajendra Nayak      2023-12-05   180  				cache-level = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   181  				cache-unified;
af16b00578a7a1 Rajendra Nayak      2023-12-05   182  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   183  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   184  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   185  		cpu9: cpu@20100 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   186  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   187  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   188  			reg = <0x0 0x20100>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   189  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   190  			next-level-cache = <&l2_2>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   191  			power-domains = <&cpu_pd9>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   192  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   193  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   194  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   195  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   196  		cpu10: cpu@20200 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   197  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   198  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   199  			reg = <0x0 0x20200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   200  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   201  			next-level-cache = <&l2_2>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   202  			power-domains = <&cpu_pd10>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   203  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   204  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   205  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   206  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   207  		cpu11: cpu@20300 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   208  			device_type = "cpu";
af16b00578a7a1 Rajendra Nayak      2023-12-05   209  			compatible = "qcom,oryon";
af16b00578a7a1 Rajendra Nayak      2023-12-05   210  			reg = <0x0 0x20300>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   211  			enable-method = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   212  			next-level-cache = <&l2_2>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   213  			power-domains = <&cpu_pd11>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   214  			power-domain-names = "psci";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   215  			cpu-idle-states = <&cluster_c4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   216  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   217  
af16b00578a7a1 Rajendra Nayak      2023-12-05   218  		cpu-map {
af16b00578a7a1 Rajendra Nayak      2023-12-05   219  			cluster0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   220  				core0 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   221  					cpu = <&cpu0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   222  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   223  
af16b00578a7a1 Rajendra Nayak      2023-12-05   224  				core1 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   225  					cpu = <&cpu1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   226  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   227  
af16b00578a7a1 Rajendra Nayak      2023-12-05   228  				core2 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   229  					cpu = <&cpu2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   230  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   231  
af16b00578a7a1 Rajendra Nayak      2023-12-05   232  				core3 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   233  					cpu = <&cpu3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   234  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   235  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   236  
af16b00578a7a1 Rajendra Nayak      2023-12-05   237  			cluster1 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   238  				core0 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   239  					cpu = <&cpu4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   240  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   241  
af16b00578a7a1 Rajendra Nayak      2023-12-05   242  				core1 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   243  					cpu = <&cpu5>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   244  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   245  
af16b00578a7a1 Rajendra Nayak      2023-12-05   246  				core2 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   247  					cpu = <&cpu6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   248  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   249  
af16b00578a7a1 Rajendra Nayak      2023-12-05   250  				core3 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   251  					cpu = <&cpu7>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   252  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   253  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   254  
af16b00578a7a1 Rajendra Nayak      2023-12-05   255  			cluster2 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   256  				core0 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   257  					cpu = <&cpu8>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   258  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   259  
af16b00578a7a1 Rajendra Nayak      2023-12-05   260  				core1 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   261  					cpu = <&cpu9>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   262  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   263  
af16b00578a7a1 Rajendra Nayak      2023-12-05   264  				core2 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   265  					cpu = <&cpu10>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   266  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   267  
af16b00578a7a1 Rajendra Nayak      2023-12-05   268  				core3 {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   269  					cpu = <&cpu11>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   270  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05   271  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   272  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   273  
af16b00578a7a1 Rajendra Nayak      2023-12-05   274  		idle-states {
af16b00578a7a1 Rajendra Nayak      2023-12-05   275  			entry-method = "psci";
af16b00578a7a1 Rajendra Nayak      2023-12-05   276  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   277  			cluster_c4: cpu-sleep-0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   278  				compatible = "arm,idle-state";
af16b00578a7a1 Rajendra Nayak      2023-12-05   279  				idle-state-name = "ret";
af16b00578a7a1 Rajendra Nayak      2023-12-05   280  				arm,psci-suspend-param = <0x00000004>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   281  				entry-latency-us = <180>;
2e65616ef07fa4 Konrad Dybcio       2024-07-16   282  				exit-latency-us = <500>;
2e65616ef07fa4 Konrad Dybcio       2024-07-16   283  				min-residency-us = <600>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   284  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   285  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   286  
af16b00578a7a1 Rajendra Nayak      2023-12-05   287  		domain-idle-states {
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   288  			cluster_cl4: cluster-sleep-0 {
cb939b9b354268 Rajendra Nayak      2024-03-17   289  				compatible = "domain-idle-state";
af16b00578a7a1 Rajendra Nayak      2023-12-05   290  				arm,psci-suspend-param = <0x01000044>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   291  				entry-latency-us = <350>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   292  				exit-latency-us = <500>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   293  				min-residency-us = <2500>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   294  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   295  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   296  			cluster_cl5: cluster-sleep-1 {
cb939b9b354268 Rajendra Nayak      2024-03-17   297  				compatible = "domain-idle-state";
af16b00578a7a1 Rajendra Nayak      2023-12-05   298  				arm,psci-suspend-param = <0x01000054>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   299  				entry-latency-us = <2200>;
2e65616ef07fa4 Konrad Dybcio       2024-07-16   300  				exit-latency-us = <4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   301  				min-residency-us = <7000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   302  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   303  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   304  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   305  
af16b00578a7a1 Rajendra Nayak      2023-12-05   306  	firmware {
48ef8eb6460101 Abel Vesa           2024-11-09   307  		#address-cells = <1>;
48ef8eb6460101 Abel Vesa           2024-11-09   308  		#size-cells = <0>;
48ef8eb6460101 Abel Vesa           2024-11-09   309  
af16b00578a7a1 Rajendra Nayak      2023-12-05   310  		scm: scm {
af16b00578a7a1 Rajendra Nayak      2023-12-05   311  			compatible = "qcom,scm-x1e80100", "qcom,scm";
af16b00578a7a1 Rajendra Nayak      2023-12-05   312  			interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   313  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
8beaf6e08d986e Johan Hovold        2024-10-02   314  			qcom,dload-mode = <&tcsr 0x19000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   315  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   316  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   317  
af16b00578a7a1 Rajendra Nayak      2023-12-05   318  	clk_virt: interconnect-0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   319  		compatible = "qcom,x1e80100-clk-virt";
af16b00578a7a1 Rajendra Nayak      2023-12-05   320  		#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   321  		qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   322  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   323  
af16b00578a7a1 Rajendra Nayak      2023-12-05   324  	mc_virt: interconnect-1 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   325  		compatible = "qcom,x1e80100-mc-virt";
af16b00578a7a1 Rajendra Nayak      2023-12-05   326  		#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   327  		qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   328  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   329  
af16b00578a7a1 Rajendra Nayak      2023-12-05   330  	memory@80000000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   331  		device_type = "memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05   332  		/* We expect the bootloader to fill in the size */
af16b00578a7a1 Rajendra Nayak      2023-12-05   333  		reg = <0 0x80000000 0 0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   334  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   335  
af16b00578a7a1 Rajendra Nayak      2023-12-05   336  	pmu {
af16b00578a7a1 Rajendra Nayak      2023-12-05   337  		compatible = "arm,armv8-pmuv3";
af16b00578a7a1 Rajendra Nayak      2023-12-05   338  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   339  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   340  
af16b00578a7a1 Rajendra Nayak      2023-12-05   341  	psci {
af16b00578a7a1 Rajendra Nayak      2023-12-05   342  		compatible = "arm,psci-1.0";
af16b00578a7a1 Rajendra Nayak      2023-12-05   343  		method = "smc";
af16b00578a7a1 Rajendra Nayak      2023-12-05   344  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   345  		cpu_pd0: power-domain-cpu0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   346  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   347  			power-domains = <&cluster_pd0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   348  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   349  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   350  		cpu_pd1: power-domain-cpu1 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   351  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   352  			power-domains = <&cluster_pd0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   353  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   354  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   355  		cpu_pd2: power-domain-cpu2 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   356  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   357  			power-domains = <&cluster_pd0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   358  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   359  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   360  		cpu_pd3: power-domain-cpu3 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   361  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   362  			power-domains = <&cluster_pd0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   363  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   364  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   365  		cpu_pd4: power-domain-cpu4 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   366  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   367  			power-domains = <&cluster_pd1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   368  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   369  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   370  		cpu_pd5: power-domain-cpu5 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   371  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   372  			power-domains = <&cluster_pd1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   373  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   374  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   375  		cpu_pd6: power-domain-cpu6 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   376  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   377  			power-domains = <&cluster_pd1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   378  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   379  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   380  		cpu_pd7: power-domain-cpu7 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   381  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   382  			power-domains = <&cluster_pd1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   383  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   384  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   385  		cpu_pd8: power-domain-cpu8 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   386  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   387  			power-domains = <&cluster_pd2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   388  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   389  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   390  		cpu_pd9: power-domain-cpu9 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   391  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   392  			power-domains = <&cluster_pd2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   393  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   394  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   395  		cpu_pd10: power-domain-cpu10 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   396  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   397  			power-domains = <&cluster_pd2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   398  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   399  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   400  		cpu_pd11: power-domain-cpu11 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   401  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   402  			power-domains = <&cluster_pd2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   403  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   404  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   405  		cluster_pd0: power-domain-cpu-cluster0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   406  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   407  			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   408  			power-domains = <&system_pd>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   409  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   410  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   411  		cluster_pd1: power-domain-cpu-cluster1 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   412  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   413  			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   414  			power-domains = <&system_pd>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   415  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   416  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   417  		cluster_pd2: power-domain-cpu-cluster2 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   418  			#power-domain-cells = <0>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   419  			domain-idle-states = <&cluster_cl4>, <&cluster_cl5>;
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   420  			power-domains = <&system_pd>;
f33767e3cfa5d4 Konrad Dybcio       2024-01-02   421  		};
f33767e3cfa5d4 Konrad Dybcio       2024-01-02   422  
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22   423  		system_pd: power-domain-system {
f33767e3cfa5d4 Konrad Dybcio       2024-01-02   424  			#power-domain-cells = <0>;
f33767e3cfa5d4 Konrad Dybcio       2024-01-02   425  			/* TODO: system-wide idle states */
af16b00578a7a1 Rajendra Nayak      2023-12-05   426  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   427  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   428  
af16b00578a7a1 Rajendra Nayak      2023-12-05   429  	reserved-memory {
af16b00578a7a1 Rajendra Nayak      2023-12-05   430  		#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   431  		#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   432  		ranges;
af16b00578a7a1 Rajendra Nayak      2023-12-05   433  
af16b00578a7a1 Rajendra Nayak      2023-12-05   434  		gunyah_hyp_mem: gunyah-hyp@80000000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   435  			reg = <0x0 0x80000000 0x0 0x800000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   436  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   437  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   438  
af16b00578a7a1 Rajendra Nayak      2023-12-05   439  		hyp_elf_package_mem: hyp-elf-package@80800000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   440  			reg = <0x0 0x80800000 0x0 0x200000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   441  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   442  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   443  
af16b00578a7a1 Rajendra Nayak      2023-12-05   444  		ncc_mem: ncc@80a00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   445  			reg = <0x0 0x80a00000 0x0 0x400000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   446  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   447  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   448  
af16b00578a7a1 Rajendra Nayak      2023-12-05   449  		cpucp_log_mem: cpucp-log@80e00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   450  			reg = <0x0 0x80e00000 0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   451  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   452  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   453  
af16b00578a7a1 Rajendra Nayak      2023-12-05   454  		cpucp_mem: cpucp@80e40000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   455  			reg = <0x0 0x80e40000 0x0 0x540000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   456  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   457  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   458  
af16b00578a7a1 Rajendra Nayak      2023-12-05   459  		reserved-region@81380000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   460  			reg = <0x0 0x81380000 0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   461  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   462  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   463  
af16b00578a7a1 Rajendra Nayak      2023-12-05   464  		tags_mem: tags-region@81400000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   465  			reg = <0x0 0x81400000 0x0 0x1a0000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   466  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   467  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   468  
af16b00578a7a1 Rajendra Nayak      2023-12-05   469  		xbl_dtlog_mem: xbl-dtlog@81a00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   470  			reg = <0x0 0x81a00000 0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   471  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   472  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   473  
af16b00578a7a1 Rajendra Nayak      2023-12-05   474  		xbl_ramdump_mem: xbl-ramdump@81a40000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   475  			reg = <0x0 0x81a40000 0x0 0x1c0000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   476  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   477  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   478  
af16b00578a7a1 Rajendra Nayak      2023-12-05   479  		aop_image_mem: aop-image@81c00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   480  			reg = <0x0 0x81c00000 0x0 0x60000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   481  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   482  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   483  
af16b00578a7a1 Rajendra Nayak      2023-12-05   484  		aop_cmd_db_mem: aop-cmd-db@81c60000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   485  			compatible = "qcom,cmd-db";
af16b00578a7a1 Rajendra Nayak      2023-12-05   486  			reg = <0x0 0x81c60000 0x0 0x20000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   487  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   488  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   489  
af16b00578a7a1 Rajendra Nayak      2023-12-05   490  		aop_config_mem: aop-config@81c80000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   491  			reg = <0x0 0x81c80000 0x0 0x20000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   492  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   493  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   494  
af16b00578a7a1 Rajendra Nayak      2023-12-05   495  		tme_crash_dump_mem: tme-crash-dump@81ca0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   496  			reg = <0x0 0x81ca0000 0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   497  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   498  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   499  
af16b00578a7a1 Rajendra Nayak      2023-12-05   500  		tme_log_mem: tme-log@81ce0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   501  			reg = <0x0 0x81ce0000 0x0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   502  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   503  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   504  
af16b00578a7a1 Rajendra Nayak      2023-12-05   505  		uefi_log_mem: uefi-log@81ce4000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   506  			reg = <0x0 0x81ce4000 0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   507  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   508  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   509  
af16b00578a7a1 Rajendra Nayak      2023-12-05   510  		secdata_apss_mem: secdata-apss@81cff000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   511  			reg = <0x0 0x81cff000 0x0 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   512  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   513  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   514  
af16b00578a7a1 Rajendra Nayak      2023-12-05   515  		pdp_ns_shared_mem: pdp-ns-shared@81e00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   516  			reg = <0x0 0x81e00000 0x0 0x100000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   517  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   518  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   519  
af16b00578a7a1 Rajendra Nayak      2023-12-05   520  		gpu_prr_mem: gpu-prr@81f00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   521  			reg = <0x0 0x81f00000 0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   522  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   523  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   524  
af16b00578a7a1 Rajendra Nayak      2023-12-05   525  		tpm_control_mem: tpm-control@81f10000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   526  			reg = <0x0 0x81f10000 0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   527  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   528  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   529  
af16b00578a7a1 Rajendra Nayak      2023-12-05   530  		usb_ucsi_shared_mem: usb-ucsi-shared@81f20000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   531  			reg = <0x0 0x81f20000 0x0 0x10000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   532  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   533  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   534  
af16b00578a7a1 Rajendra Nayak      2023-12-05   535  		pld_pep_mem: pld-pep@81f30000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   536  			reg = <0x0 0x81f30000 0x0 0x6000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   537  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   538  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   539  
af16b00578a7a1 Rajendra Nayak      2023-12-05   540  		pld_gmu_mem: pld-gmu@81f36000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   541  			reg = <0x0 0x81f36000 0x0 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   542  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   543  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   544  
af16b00578a7a1 Rajendra Nayak      2023-12-05   545  		pld_pdp_mem: pld-pdp@81f37000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   546  			reg = <0x0 0x81f37000 0x0 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   547  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   548  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   549  
af16b00578a7a1 Rajendra Nayak      2023-12-05   550  		tz_stat_mem: tz-stat@82700000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   551  			reg = <0x0 0x82700000 0x0 0x100000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   552  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   553  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   554  
af16b00578a7a1 Rajendra Nayak      2023-12-05   555  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   556  			reg = <0x0 0x82800000 0x0 0xc00000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   557  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   558  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   559  
af16b00578a7a1 Rajendra Nayak      2023-12-05   560  		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@84b00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   561  			reg = <0x0 0x84b00000 0x0 0x800000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   562  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   563  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   564  
af16b00578a7a1 Rajendra Nayak      2023-12-05   565  		spu_secure_shared_memory_mem: spu-secure-shared-memory@85300000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   566  			reg = <0x0 0x85300000 0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   567  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   568  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   569  
af16b00578a7a1 Rajendra Nayak      2023-12-05   570  		adsp_boot_dtb_mem: adsp-boot-dtb@866c0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   571  			reg = <0x0 0x866c0000 0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   572  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   573  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   574  
af16b00578a7a1 Rajendra Nayak      2023-12-05   575  		spss_region_mem: spss-region@86700000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   576  			reg = <0x0 0x86700000 0x0 0x400000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   577  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   578  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   579  
af16b00578a7a1 Rajendra Nayak      2023-12-05   580  		adsp_boot_mem: adsp-boot@86b00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   581  			reg = <0x0 0x86b00000 0x0 0xc00000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   582  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   583  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   584  
af16b00578a7a1 Rajendra Nayak      2023-12-05   585  		video_mem: video@87700000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   586  			reg = <0x0 0x87700000 0x0 0x700000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   587  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   588  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   589  
af16b00578a7a1 Rajendra Nayak      2023-12-05   590  		adspslpi_mem: adspslpi@87e00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   591  			reg = <0x0 0x87e00000 0x0 0x3a00000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   592  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   593  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   594  
af16b00578a7a1 Rajendra Nayak      2023-12-05   595  		q6_adsp_dtb_mem: q6-adsp-dtb@8b800000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   596  			reg = <0x0 0x8b800000 0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   597  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   598  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   599  
af16b00578a7a1 Rajendra Nayak      2023-12-05   600  		cdsp_mem: cdsp@8b900000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   601  			reg = <0x0 0x8b900000 0x0 0x2000000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   602  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   603  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   604  
af16b00578a7a1 Rajendra Nayak      2023-12-05   605  		q6_cdsp_dtb_mem: q6-cdsp-dtb@8d900000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   606  			reg = <0x0 0x8d900000 0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   607  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   608  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   609  
af16b00578a7a1 Rajendra Nayak      2023-12-05   610  		gpu_microcode_mem: gpu-microcode@8d9fe000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   611  			reg = <0x0 0x8d9fe000 0x0 0x2000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   612  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   613  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   614  
af16b00578a7a1 Rajendra Nayak      2023-12-05   615  		cvp_mem: cvp@8da00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   616  			reg = <0x0 0x8da00000 0x0 0x700000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   617  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   618  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   619  
af16b00578a7a1 Rajendra Nayak      2023-12-05   620  		camera_mem: camera@8e100000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   621  			reg = <0x0 0x8e100000 0x0 0x800000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   622  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   623  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   624  
af16b00578a7a1 Rajendra Nayak      2023-12-05   625  		av1_encoder_mem: av1-encoder@8e900000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   626  			reg = <0x0 0x8e900000 0x0 0x700000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   627  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   628  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   629  
af16b00578a7a1 Rajendra Nayak      2023-12-05   630  		reserved-region@8f000000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   631  			reg = <0x0 0x8f000000 0x0 0xa00000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   632  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   633  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   634  
af16b00578a7a1 Rajendra Nayak      2023-12-05   635  		wpss_mem: wpss@8fa00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   636  			reg = <0x0 0x8fa00000 0x0 0x1900000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   637  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   638  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   639  
af16b00578a7a1 Rajendra Nayak      2023-12-05   640  		q6_wpss_dtb_mem: q6-wpss-dtb@91300000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   641  			reg = <0x0 0x91300000 0x0 0x80000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   642  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   643  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   644  
af16b00578a7a1 Rajendra Nayak      2023-12-05   645  		xbl_sc_mem: xbl-sc@d8000000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   646  			reg = <0x0 0xd8000000 0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   647  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   648  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   649  
af16b00578a7a1 Rajendra Nayak      2023-12-05   650  		reserved-region@d8040000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   651  			reg = <0x0 0xd8040000 0x0 0xa0000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   652  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   653  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   654  
af16b00578a7a1 Rajendra Nayak      2023-12-05   655  		qtee_mem: qtee@d80e0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   656  			reg = <0x0 0xd80e0000 0x0 0x520000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   657  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   658  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   659  
af16b00578a7a1 Rajendra Nayak      2023-12-05   660  		ta_mem: ta@d8600000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   661  			reg = <0x0 0xd8600000 0x0 0x8a00000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   662  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   663  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   664  
af16b00578a7a1 Rajendra Nayak      2023-12-05   665  		tags_mem1: tags@e1000000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   666  			reg = <0x0 0xe1000000 0x0 0x26a0000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   667  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   668  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   669  
af16b00578a7a1 Rajendra Nayak      2023-12-05   670  		llcc_lpi_mem: llcc-lpi@ff800000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   671  			reg = <0x0 0xff800000 0x0 0x600000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   672  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   673  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   674  
af16b00578a7a1 Rajendra Nayak      2023-12-05   675  		smem_mem: smem@ffe00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   676  			compatible = "qcom,smem";
af16b00578a7a1 Rajendra Nayak      2023-12-05   677  			reg = <0x0 0xffe00000 0x0 0x200000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   678  			hwlocks = <&tcsr_mutex 3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   679  			no-map;
af16b00578a7a1 Rajendra Nayak      2023-12-05   680  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   681  	};
af16b00578a7a1 Rajendra Nayak      2023-12-05   682  
0b6ae7364b1133 Sibi Sankar         2024-01-29   683  	smp2p-adsp {
0b6ae7364b1133 Sibi Sankar         2024-01-29   684  		compatible = "qcom,smp2p";
0b6ae7364b1133 Sibi Sankar         2024-01-29   685  
0b6ae7364b1133 Sibi Sankar         2024-01-29   686  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
0b6ae7364b1133 Sibi Sankar         2024-01-29   687  					     IPCC_MPROC_SIGNAL_SMP2P
0b6ae7364b1133 Sibi Sankar         2024-01-29   688  					     IRQ_TYPE_EDGE_RISING>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   689  
0b6ae7364b1133 Sibi Sankar         2024-01-29   690  		mboxes = <&ipcc IPCC_CLIENT_LPASS
0b6ae7364b1133 Sibi Sankar         2024-01-29   691  				IPCC_MPROC_SIGNAL_SMP2P>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   692  
0b6ae7364b1133 Sibi Sankar         2024-01-29   693  		qcom,smem = <443>, <429>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   694  		qcom,local-pid = <0>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   695  		qcom,remote-pid = <2>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   696  
0b6ae7364b1133 Sibi Sankar         2024-01-29   697  		smp2p_adsp_out: master-kernel {
0b6ae7364b1133 Sibi Sankar         2024-01-29   698  			qcom,entry-name = "master-kernel";
0b6ae7364b1133 Sibi Sankar         2024-01-29   699  			#qcom,smem-state-cells = <1>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   700  		};
0b6ae7364b1133 Sibi Sankar         2024-01-29   701  
0b6ae7364b1133 Sibi Sankar         2024-01-29   702  		smp2p_adsp_in: slave-kernel {
0b6ae7364b1133 Sibi Sankar         2024-01-29   703  			qcom,entry-name = "slave-kernel";
0b6ae7364b1133 Sibi Sankar         2024-01-29   704  			interrupt-controller;
0b6ae7364b1133 Sibi Sankar         2024-01-29   705  			#interrupt-cells = <2>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   706  		};
0b6ae7364b1133 Sibi Sankar         2024-01-29   707  	};
0b6ae7364b1133 Sibi Sankar         2024-01-29   708  
0b6ae7364b1133 Sibi Sankar         2024-01-29   709  	smp2p-cdsp {
0b6ae7364b1133 Sibi Sankar         2024-01-29   710  		compatible = "qcom,smp2p";
0b6ae7364b1133 Sibi Sankar         2024-01-29   711  
0b6ae7364b1133 Sibi Sankar         2024-01-29   712  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
0b6ae7364b1133 Sibi Sankar         2024-01-29   713  					     IPCC_MPROC_SIGNAL_SMP2P
0b6ae7364b1133 Sibi Sankar         2024-01-29   714  					     IRQ_TYPE_EDGE_RISING>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   715  
0b6ae7364b1133 Sibi Sankar         2024-01-29   716  		mboxes = <&ipcc IPCC_CLIENT_CDSP
0b6ae7364b1133 Sibi Sankar         2024-01-29   717  				IPCC_MPROC_SIGNAL_SMP2P>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   718  
0b6ae7364b1133 Sibi Sankar         2024-01-29   719  		qcom,smem = <94>, <432>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   720  		qcom,local-pid = <0>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   721  		qcom,remote-pid = <5>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   722  
0b6ae7364b1133 Sibi Sankar         2024-01-29   723  		smp2p_cdsp_out: master-kernel {
0b6ae7364b1133 Sibi Sankar         2024-01-29   724  			qcom,entry-name = "master-kernel";
0b6ae7364b1133 Sibi Sankar         2024-01-29   725  			#qcom,smem-state-cells = <1>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   726  		};
0b6ae7364b1133 Sibi Sankar         2024-01-29   727  
0b6ae7364b1133 Sibi Sankar         2024-01-29   728  		smp2p_cdsp_in: slave-kernel {
0b6ae7364b1133 Sibi Sankar         2024-01-29   729  			qcom,entry-name = "slave-kernel";
0b6ae7364b1133 Sibi Sankar         2024-01-29   730  			interrupt-controller;
0b6ae7364b1133 Sibi Sankar         2024-01-29   731  			#interrupt-cells = <2>;
0b6ae7364b1133 Sibi Sankar         2024-01-29   732  		};
0b6ae7364b1133 Sibi Sankar         2024-01-29   733  	};
0b6ae7364b1133 Sibi Sankar         2024-01-29   734  
af16b00578a7a1 Rajendra Nayak      2023-12-05   735  	soc: soc@0 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   736  		compatible = "simple-bus";
af16b00578a7a1 Rajendra Nayak      2023-12-05   737  
af16b00578a7a1 Rajendra Nayak      2023-12-05   738  		#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   739  		#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   740  		dma-ranges = <0 0 0 0 0x10 0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   741  		ranges = <0 0 0 0 0x10 0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   742  
af16b00578a7a1 Rajendra Nayak      2023-12-05   743  		gcc: clock-controller@100000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   744  			compatible = "qcom,x1e80100-gcc";
af16b00578a7a1 Rajendra Nayak      2023-12-05   745  			reg = <0 0x00100000 0 0x200000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   746  
af16b00578a7a1 Rajendra Nayak      2023-12-05   747  			clocks = <&bi_tcxo_div2>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   748  				 <&sleep_clk>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   749  				 <0>,
5eb83fc10289db Abel Vesa           2024-01-29   750  				 <&pcie4_phy>,
62ab23e1550820 Johan Hovold        2024-07-22   751  				 <&pcie5_phy>,
5eb83fc10289db Abel Vesa           2024-01-29   752  				 <&pcie6a_phy>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   753  				 <0>,
4af46b7bd66fa3 Abel Vesa           2024-01-29   754  				 <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29   755  				 <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29   756  				 <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   757  
af16b00578a7a1 Rajendra Nayak      2023-12-05   758  			power-domains = <&rpmhpd RPMHPD_CX>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   759  			#clock-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   760  			#reset-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   761  			#power-domain-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   762  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   763  
6a07a4f3f509c3 Sibi Sankar         2024-01-29   764  		ipcc: mailbox@408000 {
6a07a4f3f509c3 Sibi Sankar         2024-01-29   765  			compatible = "qcom,x1e80100-ipcc", "qcom,ipcc";
6a07a4f3f509c3 Sibi Sankar         2024-01-29   766  			reg = <0 0x00408000 0 0x1000>;
6a07a4f3f509c3 Sibi Sankar         2024-01-29   767  
6a07a4f3f509c3 Sibi Sankar         2024-01-29   768  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
6a07a4f3f509c3 Sibi Sankar         2024-01-29   769  			interrupt-controller;
6a07a4f3f509c3 Sibi Sankar         2024-01-29   770  			#interrupt-cells = <3>;
6a07a4f3f509c3 Sibi Sankar         2024-01-29   771  
6a07a4f3f509c3 Sibi Sankar         2024-01-29   772  			#mbox-cells = <2>;
6a07a4f3f509c3 Sibi Sankar         2024-01-29   773  		};
6a07a4f3f509c3 Sibi Sankar         2024-01-29   774  
af16b00578a7a1 Rajendra Nayak      2023-12-05   775  		gpi_dma2: dma-controller@800000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   776  			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1 Rajendra Nayak      2023-12-05   777  			reg = <0 0x00800000 0 0x60000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   778  
af16b00578a7a1 Rajendra Nayak      2023-12-05   779  			interrupts = <GIC_SPI 788 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   780  				     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   781  				     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   782  				     <GIC_SPI 791 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   783  				     <GIC_SPI 792 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   784  				     <GIC_SPI 793 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   785  				     <GIC_SPI 794 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   786  				     <GIC_SPI 795 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   787  				     <GIC_SPI 796 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   788  				     <GIC_SPI 797 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   789  				     <GIC_SPI 798 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   790  				     <GIC_SPI 799 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   791  
af16b00578a7a1 Rajendra Nayak      2023-12-05   792  			dma-channels = <12>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   793  			dma-channel-mask = <0x3e>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   794  			#dma-cells = <3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   795  
af16b00578a7a1 Rajendra Nayak      2023-12-05   796  			iommus = <&apps_smmu 0x436 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   797  
af16b00578a7a1 Rajendra Nayak      2023-12-05   798  			status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   799  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05   800  
af16b00578a7a1 Rajendra Nayak      2023-12-05   801  		qupv3_2: geniqup@8c0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   802  			compatible = "qcom,geni-se-qup";
af16b00578a7a1 Rajendra Nayak      2023-12-05   803  			reg = <0 0x008c0000 0 0x2000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   804  
af16b00578a7a1 Rajendra Nayak      2023-12-05   805  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   806  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   807  			clock-names = "m-ahb",
af16b00578a7a1 Rajendra Nayak      2023-12-05   808  				      "s-ahb";
af16b00578a7a1 Rajendra Nayak      2023-12-05   809  
af16b00578a7a1 Rajendra Nayak      2023-12-05   810  			iommus = <&apps_smmu 0x423 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   811  
af16b00578a7a1 Rajendra Nayak      2023-12-05   812  			#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   813  			#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   814  			ranges;
af16b00578a7a1 Rajendra Nayak      2023-12-05   815  
af16b00578a7a1 Rajendra Nayak      2023-12-05   816  			status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   817  
af16b00578a7a1 Rajendra Nayak      2023-12-05   818  			i2c16: i2c@880000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   819  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05   820  				reg = <0 0x00880000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   821  
af16b00578a7a1 Rajendra Nayak      2023-12-05   822  				interrupts = <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   823  
af16b00578a7a1 Rajendra Nayak      2023-12-05   824  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   825  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05   826  
af16b00578a7a1 Rajendra Nayak      2023-12-05   827  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   828  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   829  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   830  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   831  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   832  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   833  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05   834  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05   835  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05   836  
af16b00578a7a1 Rajendra Nayak      2023-12-05   837  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   838  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   839  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05   840  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05   841  
af16b00578a7a1 Rajendra Nayak      2023-12-05   842  				pinctrl-0 = <&qup_i2c16_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   843  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05   844  
af16b00578a7a1 Rajendra Nayak      2023-12-05   845  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   846  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   847  
af16b00578a7a1 Rajendra Nayak      2023-12-05   848  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   849  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   850  
af16b00578a7a1 Rajendra Nayak      2023-12-05   851  			spi16: spi@880000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   852  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05   853  				reg = <0 0x00880000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   854  
af16b00578a7a1 Rajendra Nayak      2023-12-05   855  				interrupts = <GIC_SPI 808 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   856  
af16b00578a7a1 Rajendra Nayak      2023-12-05   857  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   858  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05   859  
af16b00578a7a1 Rajendra Nayak      2023-12-05   860  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   861  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   862  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   863  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   864  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   865  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   866  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05   867  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05   868  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05   869  
af16b00578a7a1 Rajendra Nayak      2023-12-05   870  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   871  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   872  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05   873  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05   874  
af16b00578a7a1 Rajendra Nayak      2023-12-05   875  				pinctrl-0 = <&qup_spi16_data_clk>, <&qup_spi16_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   876  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05   877  
af16b00578a7a1 Rajendra Nayak      2023-12-05   878  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   879  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   880  
af16b00578a7a1 Rajendra Nayak      2023-12-05   881  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   882  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   883  
af16b00578a7a1 Rajendra Nayak      2023-12-05   884  			i2c17: i2c@884000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   885  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05   886  				reg = <0 0x00884000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   887  
af16b00578a7a1 Rajendra Nayak      2023-12-05   888  				interrupts = <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   889  
af16b00578a7a1 Rajendra Nayak      2023-12-05   890  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   891  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05   892  
af16b00578a7a1 Rajendra Nayak      2023-12-05   893  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   894  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   895  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   896  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   897  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   898  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   899  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05   900  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05   901  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05   902  
af16b00578a7a1 Rajendra Nayak      2023-12-05   903  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   904  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   905  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05   906  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05   907  
af16b00578a7a1 Rajendra Nayak      2023-12-05   908  				pinctrl-0 = <&qup_i2c17_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   909  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05   910  
af16b00578a7a1 Rajendra Nayak      2023-12-05   911  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   912  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   913  
af16b00578a7a1 Rajendra Nayak      2023-12-05   914  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   915  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   916  
af16b00578a7a1 Rajendra Nayak      2023-12-05   917  			spi17: spi@884000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   918  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05   919  				reg = <0 0x00884000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   920  
af16b00578a7a1 Rajendra Nayak      2023-12-05   921  				interrupts = <GIC_SPI 809 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   922  
af16b00578a7a1 Rajendra Nayak      2023-12-05   923  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   924  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05   925  
af16b00578a7a1 Rajendra Nayak      2023-12-05   926  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   927  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   928  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   929  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   930  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   931  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   932  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05   933  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05   934  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05   935  
af16b00578a7a1 Rajendra Nayak      2023-12-05   936  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   937  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   938  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05   939  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05   940  
af16b00578a7a1 Rajendra Nayak      2023-12-05   941  				pinctrl-0 = <&qup_spi17_data_clk>, <&qup_spi17_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   942  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05   943  
af16b00578a7a1 Rajendra Nayak      2023-12-05   944  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   945  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   946  
af16b00578a7a1 Rajendra Nayak      2023-12-05   947  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   948  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   949  
af16b00578a7a1 Rajendra Nayak      2023-12-05   950  			i2c18: i2c@888000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   951  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05   952  				reg = <0 0x00888000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   953  
af16b00578a7a1 Rajendra Nayak      2023-12-05   954  				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   955  
af16b00578a7a1 Rajendra Nayak      2023-12-05   956  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   957  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05   958  
af16b00578a7a1 Rajendra Nayak      2023-12-05   959  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   960  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   961  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   962  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   963  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   964  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   965  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05   966  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05   967  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05   968  
af16b00578a7a1 Rajendra Nayak      2023-12-05   969  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   970  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   971  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05   972  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05   973  
af16b00578a7a1 Rajendra Nayak      2023-12-05   974  				pinctrl-0 = <&qup_i2c18_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   975  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05   976  
af16b00578a7a1 Rajendra Nayak      2023-12-05   977  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   978  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   979  
af16b00578a7a1 Rajendra Nayak      2023-12-05   980  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05   981  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05   982  
af16b00578a7a1 Rajendra Nayak      2023-12-05   983  			spi18: spi@888000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05   984  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05   985  				reg = <0 0x00888000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   986  
af16b00578a7a1 Rajendra Nayak      2023-12-05   987  				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   988  
af16b00578a7a1 Rajendra Nayak      2023-12-05   989  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   990  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05   991  
af16b00578a7a1 Rajendra Nayak      2023-12-05   992  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   993  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   994  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   995  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05   996  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05   997  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05   998  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05   999  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1000  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1001  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1002  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1003  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1004  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1005  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1006  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1007  				pinctrl-0 = <&qup_spi18_data_clk>, <&qup_spi18_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1008  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1009  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1010  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1011  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1012  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1013  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1014  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1015  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1016  			i2c19: i2c@88c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1017  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1018  				reg = <0 0x0088c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1019  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1020  				interrupts = <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1021  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1022  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1023  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1024  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1025  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1026  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1027  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1028  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1029  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1030  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1031  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1032  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1033  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1034  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1035  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1036  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1037  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1038  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1039  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1040  				pinctrl-0 = <&qup_i2c19_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1041  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1042  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1043  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1044  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1045  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1046  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1047  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1048  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1049  			spi19: spi@88c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1050  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1051  				reg = <0 0x0088c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1052  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1053  				interrupts = <GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1054  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1055  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1056  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1057  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1058  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1059  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1060  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1061  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1062  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1063  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1064  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1065  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1066  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1067  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1068  				dmas = <&gpi_dma2 0 3 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1069  				       <&gpi_dma2 1 3 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1070  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1071  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1072  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1073  				pinctrl-0 = <&qup_spi19_data_clk>, <&qup_spi19_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1074  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1075  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1076  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1077  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1078  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1079  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1080  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1081  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1082  			i2c20: i2c@890000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1083  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1084  				reg = <0 0x00890000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1085  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1086  				interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1087  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1088  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1089  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1090  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1091  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1092  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1093  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1094  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1095  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1096  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1097  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1098  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1099  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1100  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1101  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1102  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1103  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1104  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1105  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1106  				pinctrl-0 = <&qup_i2c20_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1107  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1108  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1109  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1110  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1111  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1112  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1113  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1114  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1115  			spi20: spi@890000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1116  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1117  				reg = <0 0x00890000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1118  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1119  				interrupts = <GIC_SPI 812 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1120  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1121  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1122  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1123  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1124  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1125  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1126  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1127  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1128  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1129  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1130  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1131  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1132  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1133  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1134  				dmas = <&gpi_dma2 0 4 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1135  				       <&gpi_dma2 1 4 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1136  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1137  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1138  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1139  				pinctrl-0 = <&qup_spi20_data_clk>, <&qup_spi20_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1140  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1141  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1142  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1143  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1144  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1145  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1146  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1147  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1148  			i2c21: i2c@894000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1149  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1150  				reg = <0 0x00894000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1151  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1152  				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1153  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1154  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1155  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1156  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1157  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1158  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1159  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1160  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1161  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1162  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1163  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1164  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1165  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1166  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1167  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1168  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1169  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1170  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1171  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1172  				pinctrl-0 = <&qup_i2c21_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1173  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1174  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1175  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1176  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1177  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1178  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1179  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1180  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1181  			spi21: spi@894000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1182  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1183  				reg = <0 0x00894000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1184  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1185  				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1186  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1187  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1188  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1189  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1190  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1191  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1192  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1193  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1194  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1195  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1196  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1197  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1198  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1199  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1200  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1201  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1202  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1203  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1204  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1205  				pinctrl-0 = <&qup_spi21_data_clk>, <&qup_spi21_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1206  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1207  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1208  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1209  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1210  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1211  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1212  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1213  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1214  			uart21: serial@894000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1215  				compatible = "qcom,geni-uart";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1216  				reg = <0 0x00894000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1217  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1218  				interrupts = <GIC_SPI 813 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1219  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1220  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1221  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1222  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1223  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1224  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1225  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1226  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1227  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1228  						     "qup-config";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1229  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1230  				pinctrl-0 = <&qup_uart21_default>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1231  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1232  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1233  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1234  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1235  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1236  			i2c22: i2c@898000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1237  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1238  				reg = <0 0x00898000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1239  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1240  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1241  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1242  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1243  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1244  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1245  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1246  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1247  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1248  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1249  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1250  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1251  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1252  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1253  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1254  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1255  				dmas = <&gpi_dma2 0 6 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1256  				       <&gpi_dma2 1 6 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1257  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1258  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1259  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1260  				pinctrl-0 = <&qup_i2c22_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1261  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1262  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1263  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1264  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1265  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1266  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1267  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1268  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1269  			spi22: spi@898000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1270  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1271  				reg = <0 0x00898000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1272  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1273  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1274  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1275  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1276  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1277  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1278  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1279  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1280  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1281  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1282  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1283  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1284  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1285  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1286  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1287  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1288  				dmas = <&gpi_dma2 0 6 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1289  				       <&gpi_dma2 1 6 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1290  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1291  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1292  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1293  				pinctrl-0 = <&qup_spi22_data_clk>, <&qup_spi22_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1294  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1295  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1296  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1297  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1298  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1299  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1300  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1301  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1302  			i2c23: i2c@89c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1303  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1304  				reg = <0 0x0089c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1305  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1306  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1307  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1308  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1309  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1310  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1311  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1312  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1313  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1314  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1315  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1316  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1317  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1318  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1319  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1320  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1321  				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1322  				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1323  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1324  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1325  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1326  				pinctrl-0 = <&qup_i2c23_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1327  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1328  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1329  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1330  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1331  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1332  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1333  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1334  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1335  			spi23: spi@89c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1336  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1337  				reg = <0 0x0089c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1338  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1339  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1340  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1341  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1342  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1343  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1344  				interconnects = <&clk_virt MASTER_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1345  						 &clk_virt SLAVE_QUP_CORE_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1346  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1347  						 &config_noc SLAVE_QUP_2 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1348  						<&aggre2_noc MASTER_QUP_2 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1349  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1350  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1351  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1352  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1353  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1354  				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1355  				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1356  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1357  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1358  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1359  				pinctrl-0 = <&qup_spi23_data_clk>, <&qup_spi23_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1360  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1361  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1362  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1363  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1364  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1365  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1366  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1367  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1368  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1369  		gpi_dma1: dma-controller@a00000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1370  			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1371  			reg = <0 0x00a00000 0 0x60000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1372  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1373  			interrupts = <GIC_SPI 776 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1374  				     <GIC_SPI 777 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1375  				     <GIC_SPI 778 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1376  				     <GIC_SPI 779 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1377  				     <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1378  				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1379  				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1380  				     <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1381  				     <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1382  				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1383  				     <GIC_SPI 786 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1384  				     <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1385  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1386  			dma-channels = <12>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1387  			dma-channel-mask = <0x3e>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1388  			#dma-cells = <3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1389  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1390  			iommus = <&apps_smmu 0x136 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1391  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1392  			status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1393  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1394  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1395  		qupv3_1: geniqup@ac0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1396  			compatible = "qcom,geni-se-qup";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1397  			reg = <0 0x00ac0000 0 0x2000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1398  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1399  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1400  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1401  			clock-names = "m-ahb",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1402  				      "s-ahb";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1403  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1404  			iommus = <&apps_smmu 0x123 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1405  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1406  			#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1407  			#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1408  			ranges;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1409  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1410  			status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1411  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1412  			i2c8: i2c@a80000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1413  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1414  				reg = <0 0x00a80000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1415  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1416  				interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1417  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1418  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1419  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1420  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1421  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1422  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1423  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1424  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1425  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1426  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1427  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1428  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1429  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1430  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1431  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1432  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1433  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1434  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1435  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1436  				pinctrl-0 = <&qup_i2c8_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1437  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1438  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1439  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1440  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1441  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1442  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1443  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1444  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1445  			spi8: spi@a80000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1446  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1447  				reg = <0 0x00a80000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1448  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1449  				interrupts = <GIC_SPI 800 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1450  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1451  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1452  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1453  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1454  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1455  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1456  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1457  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1458  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1459  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1460  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1461  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1462  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1463  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1464  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1465  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1466  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1467  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1468  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1469  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1470  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1471  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1472  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1473  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1474  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1475  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1476  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1477  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1478  			i2c9: i2c@a84000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1479  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1480  				reg = <0 0x00a84000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1481  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1482  				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1483  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1484  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1485  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1486  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1487  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1488  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1489  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1490  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1491  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1492  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1493  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1494  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1495  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1496  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1497  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1498  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1499  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1500  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1501  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1502  				pinctrl-0 = <&qup_i2c9_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1503  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1504  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1505  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1506  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1507  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1508  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1509  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1510  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1511  			spi9: spi@a84000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1512  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1513  				reg = <0 0x00a84000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1514  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1515  				interrupts = <GIC_SPI 801 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1516  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1517  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1518  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1519  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1520  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1521  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1522  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1523  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1524  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1525  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1526  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1527  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1528  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1529  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1530  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1531  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1532  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1533  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1534  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1535  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1536  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1537  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1538  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1539  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1540  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1541  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1542  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1543  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1544  			i2c10: i2c@a88000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1545  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1546  				reg = <0 0x00a88000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1547  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1548  				interrupts = <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1549  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1550  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1551  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1552  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1553  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1554  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1555  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1556  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1557  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1558  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1559  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1560  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1561  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1562  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1563  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1564  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1565  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1566  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1567  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1568  				pinctrl-0 = <&qup_i2c10_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1569  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1570  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1571  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1572  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1573  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1574  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1575  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1576  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1577  			spi10: spi@a88000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1578  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1579  				reg = <0 0x00a88000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1580  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1581  				interrupts = <GIC_SPI 802 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1582  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1583  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1584  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1585  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1586  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1587  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1588  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1589  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1590  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1591  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1592  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1593  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1594  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1595  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1596  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1597  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1598  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1599  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1600  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1601  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1602  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1603  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1604  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1605  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1606  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1607  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1608  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1609  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1610  			i2c11: i2c@a8c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1611  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1612  				reg = <0 0x00a8c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1613  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1614  				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1615  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1616  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1617  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1618  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1619  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1620  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1621  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1622  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1623  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1624  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1625  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1626  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1627  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1628  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1629  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1630  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1631  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1632  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1633  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1634  				pinctrl-0 = <&qup_i2c11_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1635  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1636  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1637  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1638  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1639  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1640  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1641  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1642  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1643  			spi11: spi@a8c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1644  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1645  				reg = <0 0x00a8c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1646  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1647  				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1648  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1649  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1650  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1651  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1652  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1653  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1654  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1655  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1656  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1657  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1658  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1659  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1660  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1661  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1662  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1663  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1664  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1665  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1666  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1667  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1668  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1669  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1670  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1671  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1672  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1673  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1674  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1675  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1676  			i2c12: i2c@a90000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1677  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1678  				reg = <0 0x00a90000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1679  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1680  				interrupts = <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1681  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1682  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1683  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1684  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1685  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1686  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1687  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1688  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1689  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1690  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1691  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1692  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1693  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1694  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1695  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1696  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1697  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1698  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1699  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1700  				pinctrl-0 = <&qup_i2c12_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1701  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1702  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1703  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1704  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1705  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1706  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1707  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1708  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1709  			spi12: spi@a90000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1710  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1711  				reg = <0 0x00a90000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1712  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1713  				interrupts = <GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1714  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1715  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1716  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1717  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1718  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1719  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1720  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1721  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1722  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1723  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1724  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1725  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1726  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1727  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1728  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1729  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1730  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1731  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1732  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1733  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1734  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1735  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1736  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1737  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1738  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1739  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1740  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1741  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1742  			i2c13: i2c@a94000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1743  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1744  				reg = <0 0x00a94000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1745  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1746  				interrupts = <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1747  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1748  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1749  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1750  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1751  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1752  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1753  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1754  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1755  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1756  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1757  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1758  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1759  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1760  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1761  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1762  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1763  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1764  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1765  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1766  				pinctrl-0 = <&qup_i2c13_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1767  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1768  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1769  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1770  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1771  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1772  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1773  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1774  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1775  			spi13: spi@a94000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1776  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1777  				reg = <0 0x00a94000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1778  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1779  				interrupts = <GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1780  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1781  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1782  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1783  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1784  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1785  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1786  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1787  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1788  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1789  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1790  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1791  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1792  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1793  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1794  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1795  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1796  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1797  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1798  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1799  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1800  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1801  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1802  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1803  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1804  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1805  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1806  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1807  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1808  			i2c14: i2c@a98000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1809  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1810  				reg = <0 0x00a98000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1811  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1812  				interrupts = <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1813  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1814  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1815  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1816  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1817  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1818  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1819  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1820  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1821  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1822  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1823  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1824  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1825  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1826  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1827  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1828  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1829  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1830  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1831  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1832  				pinctrl-0 = <&qup_i2c14_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1833  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1834  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1835  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1836  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1837  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1838  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1839  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1840  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1841  			spi14: spi@a98000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1842  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1843  				reg = <0 0x00a98000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1844  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1845  				interrupts = <GIC_SPI 806 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1846  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1847  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1848  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1849  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1850  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1851  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1852  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1853  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1854  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1855  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1856  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1857  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1858  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1859  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1860  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1861  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1862  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1863  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1864  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1865  				pinctrl-0 = <&qup_spi14_data_clk>, <&qup_spi14_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1866  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1867  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1868  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1869  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1870  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1871  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1872  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1873  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1874  			i2c15: i2c@a9c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1875  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1876  				reg = <0 0x00a9c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1877  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1878  				interrupts = <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1879  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1880  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1881  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1882  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1883  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1884  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1885  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1886  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1887  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1888  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1889  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1890  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1891  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1892  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1893  				dmas = <&gpi_dma1 0 7 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1894  				       <&gpi_dma1 1 7 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1895  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1896  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1897  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1898  				pinctrl-0 = <&qup_i2c15_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1899  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1900  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1901  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1902  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1903  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1904  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1905  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1906  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1907  			spi15: spi@a9c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1908  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1909  				reg = <0 0x00a9c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1910  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1911  				interrupts = <GIC_SPI 807 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1912  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1913  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1914  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1915  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1916  				interconnects = <&clk_virt MASTER_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1917  						 &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1918  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1919  						 &config_noc SLAVE_QUP_1 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1920  						<&aggre1_noc MASTER_QUP_1 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1921  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1922  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1923  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1924  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1925  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1926  				dmas = <&gpi_dma1 0 7 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1927  				       <&gpi_dma1 1 7 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1928  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1929  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1930  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1931  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1932  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1933  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1934  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1935  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1936  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1937  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1938  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1939  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1940  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1941  		gpi_dma0: dma-controller@b00000  {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1942  			compatible = "qcom,x1e80100-gpi-dma", "qcom,sm6350-gpi-dma";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1943  			reg = <0 0x00b00000 0 0x60000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1944  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1945  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1946  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1947  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1948  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1949  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1950  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1951  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1952  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1953  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1954  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1955  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1956  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1957  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1958  			dma-channels = <12>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1959  			dma-channel-mask = <0x3e>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1960  			#dma-cells = <3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1961  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1962  			iommus = <&apps_smmu 0x456 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1963  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1964  			status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1965  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  1966  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1967  		qupv3_0: geniqup@bc0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1968  			compatible = "qcom,geni-se-qup";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1969  			reg = <0 0x00bc0000 0 0x2000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1970  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1971  			clocks = <&gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1972  				 <&gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1973  			clock-names = "m-ahb",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1974  				      "s-ahb";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1975  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1976  			iommus = <&apps_smmu 0x443 0x0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1977  			#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1978  			#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1979  			ranges;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1980  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1981  			status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1982  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1983  			i2c0: i2c@b80000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  1984  				compatible = "qcom,geni-i2c";
27302c7d859099 Konrad Dybcio       2024-07-11  1985  				reg = <0 0x00b80000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1986  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1987  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1988  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1989  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1990  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  1991  
af16b00578a7a1 Rajendra Nayak      2023-12-05  1992  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1993  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1994  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1995  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  1996  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  1997  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  1998  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  1999  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2000  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2001  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2002  				dmas = <&gpi_dma0 0 0 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2003  				       <&gpi_dma0 1 0 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2004  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2005  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2006  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2007  				pinctrl-0 = <&qup_i2c0_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2008  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2009  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2010  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2011  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2012  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2013  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2014  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2015  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2016  			spi0: spi@b80000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2017  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2018  				reg = <0 0x00b80000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2019  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2020  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2021  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2022  				clocks = <&gcc GCC_QUPV3_WRAP0_S0_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2023  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2024  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2025  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2026  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2027  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2028  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2029  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2030  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2031  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2032  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2033  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2034  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2035  				dmas = <&gpi_dma0 0 0 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2036  				       <&gpi_dma0 1 0 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2037  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2038  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2039  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2040  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2041  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2042  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2043  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2044  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2045  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2046  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2047  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2048  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2049  			i2c1: i2c@b84000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2050  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2051  				reg = <0 0x00b84000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2052  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2053  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2054  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2055  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2056  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2057  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2058  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2059  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2060  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2061  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2062  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2063  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2064  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2065  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2066  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2067  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2068  				dmas = <&gpi_dma0 0 1 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2069  				       <&gpi_dma0 1 1 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2070  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2071  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2072  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2073  				pinctrl-0 = <&qup_i2c1_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2074  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2075  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2076  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2077  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2078  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2079  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2080  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2081  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2082  			spi1: spi@b84000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2083  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2084  				reg = <0 0x00b84000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2085  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2086  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2087  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2088  				clocks = <&gcc GCC_QUPV3_WRAP0_S1_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2089  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2090  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2091  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2092  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2093  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2094  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2095  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2096  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2097  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2098  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2099  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2100  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2101  				dmas = <&gpi_dma0 0 1 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2102  				       <&gpi_dma0 1 1 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2103  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2104  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2105  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2106  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2107  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2108  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2109  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2110  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2111  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2112  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2113  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2114  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2115  			i2c2: i2c@b88000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2116  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2117  				reg = <0 0x00b88000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2118  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2119  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2120  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2121  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2122  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2123  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2124  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2125  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2126  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2127  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2128  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2129  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2130  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2131  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2132  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2133  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2134  				dmas = <&gpi_dma0 0 2 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2135  				       <&gpi_dma0 1 2 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2136  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2137  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2138  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2139  				pinctrl-0 = <&qup_i2c2_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2140  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2141  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2142  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2143  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2144  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2145  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2146  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2147  
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2148  			uart2: serial@b88000 {
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2149  				compatible = "qcom,geni-uart";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2150  				reg = <0 0x00b88000 0 0x4000>;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2151  
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2152  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2153  
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2154  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2155  				clock-names = "se";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2156  
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2157  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2158  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2159  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2160  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2161  				interconnect-names = "qup-core",
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2162  						     "qup-config";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2163  
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2164  				pinctrl-0 = <&qup_uart2_default>;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2165  				pinctrl-names = "default";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2166  
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2167  				status = "disabled";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2168  			};
ecbdce2041ee09 Konrad Dybcio       2024-08-26  2169  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2170  			spi2: spi@b88000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2171  				compatible = "qcom,geni-spi";
27302c7d859099 Konrad Dybcio       2024-07-11  2172  				reg = <0 0x00b88000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2173  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2174  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2175  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2176  				clocks = <&gcc GCC_QUPV3_WRAP0_S2_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2177  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2178  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2179  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2180  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2181  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2182  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2183  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2184  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2185  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2186  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2187  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2188  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2189  				dmas = <&gpi_dma0 0 2 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2190  				       <&gpi_dma0 1 2 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2191  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2192  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2193  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2194  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2195  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2196  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2197  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2198  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2199  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2200  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2201  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2202  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2203  			i2c3: i2c@b8c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2204  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2205  				reg = <0 0x00b8c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2206  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2207  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2208  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2209  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2210  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2211  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2212  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2213  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2214  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2215  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2216  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2217  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2218  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2219  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2220  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2221  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2222  				dmas = <&gpi_dma0 0 3 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2223  				       <&gpi_dma0 1 3 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2224  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2225  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2226  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2227  				pinctrl-0 = <&qup_i2c3_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2228  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2229  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2230  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2231  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2232  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2233  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2234  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2235  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2236  			spi3: spi@b8c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2237  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2238  				reg = <0 0x00b8c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2239  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2240  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2241  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2242  				clocks = <&gcc GCC_QUPV3_WRAP0_S3_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2243  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2244  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2245  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2246  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2247  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2248  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2249  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2250  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2251  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2252  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2253  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2254  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2255  				dmas = <&gpi_dma0 0 3 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2256  				       <&gpi_dma0 1 3 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2257  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2258  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2259  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2260  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2261  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2262  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2263  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2264  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2265  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2266  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2267  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2268  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2269  			i2c4: i2c@b90000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2270  				compatible = "qcom,geni-i2c";
27302c7d859099 Konrad Dybcio       2024-07-11  2271  				reg = <0 0x00b90000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2272  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2273  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2274  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2275  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2276  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2277  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2278  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2279  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2280  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2281  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2282  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2283  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2284  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2285  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2286  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2287  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2288  				dmas = <&gpi_dma0 0 4 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2289  				       <&gpi_dma0 1 4 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2290  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2291  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2292  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2293  				pinctrl-0 = <&qup_i2c4_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2294  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2295  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2296  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2297  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2298  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2299  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2300  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2301  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2302  			spi4: spi@b90000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2303  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2304  				reg = <0 0x00b90000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2305  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2306  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2307  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2308  				clocks = <&gcc GCC_QUPV3_WRAP0_S4_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2309  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2310  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2311  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2312  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2313  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2314  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2315  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2316  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2317  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2318  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2319  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2320  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2321  				dmas = <&gpi_dma0 0 4 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2322  				       <&gpi_dma0 1 4 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2323  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2324  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2325  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2326  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2327  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2328  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2329  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2330  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2331  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2332  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2333  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2334  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2335  			i2c5: i2c@b94000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2336  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2337  				reg = <0 0x00b94000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2338  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2339  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2340  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2341  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2342  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2343  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2344  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2345  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2346  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2347  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2348  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2349  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2350  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2351  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2352  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2353  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2354  				dmas = <&gpi_dma0 0 5 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2355  				       <&gpi_dma0 1 5 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2356  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2357  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2358  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2359  				pinctrl-0 = <&qup_i2c5_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2360  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2361  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2362  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2363  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2364  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2365  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2366  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2367  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2368  			spi5: spi@b94000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2369  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2370  				reg = <0 0x00b94000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2371  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2372  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2373  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2374  				clocks = <&gcc GCC_QUPV3_WRAP0_S5_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2375  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2376  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2377  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2378  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2379  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2380  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2381  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2382  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2383  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2384  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2385  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2386  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2387  				dmas = <&gpi_dma0 0 5 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2388  				       <&gpi_dma0 1 5 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2389  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2390  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2391  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2392  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2393  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2394  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2395  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2396  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2397  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2398  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2399  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2400  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2401  			i2c6: i2c@b98000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2402  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2403  				reg = <0 0x00b98000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2404  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2405  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2406  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2407  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2408  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2409  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2410  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2411  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2412  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2413  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2414  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2415  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2416  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2417  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2418  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2419  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2420  				dmas = <&gpi_dma0 0 6 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2421  				       <&gpi_dma0 1 6 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2422  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2423  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2424  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2425  				pinctrl-0 = <&qup_i2c6_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2426  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2427  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2428  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2429  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2430  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2431  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2432  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2433  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2434  			spi6: spi@b98000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2435  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2436  				reg = <0 0x00b98000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2437  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2438  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2439  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2440  				clocks = <&gcc GCC_QUPV3_WRAP0_S6_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2441  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2442  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2443  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2444  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2445  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2446  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2447  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2448  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2449  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2450  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2451  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2452  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2453  				dmas = <&gpi_dma0 0 6 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2454  				       <&gpi_dma0 1 6 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2455  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2456  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2457  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2458  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2459  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2460  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2461  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2462  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2463  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2464  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2465  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2466  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2467  			i2c7: i2c@b9c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2468  				compatible = "qcom,geni-i2c";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2469  				reg = <0 0x00b9c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2470  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2471  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2472  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2473  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2474  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2475  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2476  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2477  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2478  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2479  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2480  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2481  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2482  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2483  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2484  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2485  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2486  				dmas = <&gpi_dma0 0 7 QCOM_GPI_I2C>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2487  				       <&gpi_dma0 1 7 QCOM_GPI_I2C>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2488  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2489  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2490  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2491  				pinctrl-0 = <&qup_i2c7_data_clk>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2492  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2493  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2494  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2495  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2496  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2497  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2498  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2499  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2500  			spi7: spi@b9c000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2501  				compatible = "qcom,geni-spi";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2502  				reg = <0 0x00b9c000 0 0x4000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2503  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2504  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2505  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2506  				clocks = <&gcc GCC_QUPV3_WRAP0_S7_CLK>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2507  				clock-names = "se";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2508  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2509  				interconnects = <&clk_virt MASTER_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2510  						 &clk_virt SLAVE_QUP_CORE_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2511  						<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2512  						 &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2513  						<&aggre2_noc MASTER_QUP_0 QCOM_ICC_TAG_ALWAYS
af16b00578a7a1 Rajendra Nayak      2023-12-05  2514  						 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2515  				interconnect-names = "qup-core",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2516  						     "qup-config",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2517  						     "qup-memory";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2518  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2519  				dmas = <&gpi_dma0 0 7 QCOM_GPI_SPI>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  2520  				       <&gpi_dma0 1 7 QCOM_GPI_SPI>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2521  				dma-names = "tx",
af16b00578a7a1 Rajendra Nayak      2023-12-05  2522  					    "rx";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2523  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2524  				pinctrl-0 = <&qup_spi7_data_clk>, <&qup_spi7_cs>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2525  				pinctrl-names = "default";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2526  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2527  				#address-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2528  				#size-cells = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2529  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2530  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  2531  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2532  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2533  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2534  		tsens0: thermal-sensor@c271000 {
4e915987ff5b91 Rajendra Nayak      2024-06-21  2535  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2536  			reg = <0 0x0c271000 0 0x1000>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2537  			      <0 0x0c222000 0 0x1000>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2538  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2539  			interrupts-extended = <&pdc 26 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2540  					      <&intc GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2541  			interrupt-names = "uplow",
4e915987ff5b91 Rajendra Nayak      2024-06-21  2542  					  "critical";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2543  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2544  			#qcom,sensors = <16>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2545  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2546  			#thermal-sensor-cells = <1>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2547  		};
4e915987ff5b91 Rajendra Nayak      2024-06-21  2548  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2549  		tsens1: thermal-sensor@c272000 {
4e915987ff5b91 Rajendra Nayak      2024-06-21  2550  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2551  			reg = <0 0x0c272000 0 0x1000>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2552  			      <0 0x0c223000 0 0x1000>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2553  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2554  			interrupts-extended = <&pdc 27 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2555  					      <&intc GIC_SPI 642 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2556  			interrupt-names = "uplow",
4e915987ff5b91 Rajendra Nayak      2024-06-21  2557  					  "critical";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2558  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2559  			#qcom,sensors = <16>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2560  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2561  			#thermal-sensor-cells = <1>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2562  		};
4e915987ff5b91 Rajendra Nayak      2024-06-21  2563  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2564  		tsens2: thermal-sensor@c273000 {
4e915987ff5b91 Rajendra Nayak      2024-06-21  2565  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2566  			reg = <0 0x0c273000 0 0x1000>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2567  			      <0 0x0c224000 0 0x1000>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2568  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2569  			interrupts-extended = <&pdc 28 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2570  					      <&intc GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2571  			interrupt-names = "uplow",
4e915987ff5b91 Rajendra Nayak      2024-06-21  2572  					  "critical";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2573  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2574  			#qcom,sensors = <16>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2575  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2576  			#thermal-sensor-cells = <1>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2577  		};
4e915987ff5b91 Rajendra Nayak      2024-06-21  2578  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2579  		tsens3: thermal-sensor@c274000 {
4e915987ff5b91 Rajendra Nayak      2024-06-21  2580  			compatible = "qcom,x1e80100-tsens", "qcom,tsens-v2";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2581  			reg = <0 0x0c274000 0 0x1000>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2582  			      <0 0x0c225000 0 0x1000>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2583  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2584  			interrupts-extended = <&pdc 29 IRQ_TYPE_LEVEL_HIGH>,
4e915987ff5b91 Rajendra Nayak      2024-06-21  2585  					      <&intc GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2586  			interrupt-names = "uplow",
4e915987ff5b91 Rajendra Nayak      2024-06-21  2587  					  "critical";
4e915987ff5b91 Rajendra Nayak      2024-06-21  2588  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2589  			#qcom,sensors = <16>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2590  
4e915987ff5b91 Rajendra Nayak      2024-06-21  2591  			#thermal-sensor-cells = <1>;
4e915987ff5b91 Rajendra Nayak      2024-06-21  2592  		};
4e915987ff5b91 Rajendra Nayak      2024-06-21  2593  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2594  		usb_1_ss0_hsphy: phy@fd3000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  2595  			compatible = "qcom,x1e80100-snps-eusb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2596  				     "qcom,sm8550-snps-eusb2-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2597  			reg = <0 0x00fd3000 0 0x154>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2598  			#phy-cells = <0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2599  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2600  			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2601  			clock-names = "ref";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2602  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2603  			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2604  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2605  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2606  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2607  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2608  		usb_1_ss0_qmpphy: phy@fd5000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  2609  			compatible = "qcom,x1e80100-qmp-usb3-dp-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2610  			reg = <0 0x00fd5000 0 0x4000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2611  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2612  			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2613  				 <&rpmhcc RPMH_CXO_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2614  				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2615  				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2616  			clock-names = "aux",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2617  				      "ref",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2618  				      "com_aux",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2619  				      "usb3_pipe";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2620  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2621  			power-domains = <&gcc GCC_USB_0_PHY_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2622  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2623  			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2624  				 <&gcc GCC_USB4_0_DP0_PHY_PRIM_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2625  			reset-names = "phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2626  				      "common";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2627  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2628  			#clock-cells = <1>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2629  			#phy-cells = <1>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2630  
17c5909f53e01c Abel Vesa           2024-08-29  2631  			orientation-switch;
17c5909f53e01c Abel Vesa           2024-08-29  2632  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2633  			status = "disabled";
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2634  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2635  			ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2636  				#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2637  				#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2638  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2639  				port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2640  					reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2641  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2642  					usb_1_ss0_qmpphy_out: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2643  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2644  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2645  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2646  				port@1 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2647  					reg = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2648  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2649  					usb_1_ss0_qmpphy_usb_ss_in: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2650  						remote-endpoint = <&usb_1_ss0_dwc3_ss>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2651  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2652  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2653  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2654  				port@2 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2655  					reg = <2>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2656  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2657  					usb_1_ss0_qmpphy_dp_in: endpoint {
aa48a8a5d642b5 Abel Vesa           2024-06-06  2658  						remote-endpoint = <&mdss_dp0_out>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2659  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2660  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2661  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2662  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2663  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2664  		usb_1_ss1_hsphy: phy@fd9000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  2665  			compatible = "qcom,x1e80100-snps-eusb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2666  				     "qcom,sm8550-snps-eusb2-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2667  			reg = <0 0x00fd9000 0 0x154>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2668  			#phy-cells = <0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2669  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2670  			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2671  			clock-names = "ref";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2672  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2673  			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2674  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2675  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2676  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2677  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2678  		usb_1_ss1_qmpphy: phy@fda000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  2679  			compatible = "qcom,x1e80100-qmp-usb3-dp-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2680  			reg = <0 0x00fda000 0 0x4000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2681  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2682  			clocks = <&gcc GCC_USB3_SEC_PHY_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2683  				 <&rpmhcc RPMH_CXO_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2684  				 <&gcc GCC_USB3_SEC_PHY_COM_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2685  				 <&gcc GCC_USB3_SEC_PHY_PIPE_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2686  			clock-names = "aux",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2687  				      "ref",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2688  				      "com_aux",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2689  				      "usb3_pipe";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2690  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2691  			power-domains = <&gcc GCC_USB_1_PHY_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2692  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2693  			resets = <&gcc GCC_USB3_PHY_SEC_BCR>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2694  				 <&gcc GCC_USB4_1_DP0_PHY_SEC_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2695  			reset-names = "phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2696  				      "common";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2697  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2698  			#clock-cells = <1>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2699  			#phy-cells = <1>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2700  
17c5909f53e01c Abel Vesa           2024-08-29  2701  			orientation-switch;
17c5909f53e01c Abel Vesa           2024-08-29  2702  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2703  			status = "disabled";
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2704  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2705  			ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2706  				#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2707  				#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2708  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2709  				port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2710  					reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2711  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2712  					usb_1_ss1_qmpphy_out: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2713  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2714  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2715  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2716  				port@1 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2717  					reg = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2718  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2719  					usb_1_ss1_qmpphy_usb_ss_in: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2720  						remote-endpoint = <&usb_1_ss1_dwc3_ss>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2721  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2722  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2723  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2724  				port@2 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2725  					reg = <2>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2726  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2727  					usb_1_ss1_qmpphy_dp_in: endpoint {
aa48a8a5d642b5 Abel Vesa           2024-06-06  2728  						remote-endpoint = <&mdss_dp1_out>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2729  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2730  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2731  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2732  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2733  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2734  		usb_1_ss2_hsphy: phy@fde000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  2735  			compatible = "qcom,x1e80100-snps-eusb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2736  				     "qcom,sm8550-snps-eusb2-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2737  			reg = <0 0x00fde000 0 0x154>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2738  			#phy-cells = <0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2739  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2740  			clocks = <&tcsr TCSR_USB2_1_CLKREF_EN>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2741  			clock-names = "ref";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2742  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2743  			resets = <&gcc GCC_QUSB2PHY_TERT_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2744  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2745  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2746  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2747  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2748  		usb_1_ss2_qmpphy: phy@fdf000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  2749  			compatible = "qcom,x1e80100-qmp-usb3-dp-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2750  			reg = <0 0x00fdf000 0 0x4000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2751  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2752  			clocks = <&gcc GCC_USB3_TERT_PHY_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2753  				 <&rpmhcc RPMH_CXO_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2754  				 <&gcc GCC_USB3_TERT_PHY_COM_AUX_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2755  				 <&gcc GCC_USB3_TERT_PHY_PIPE_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2756  			clock-names = "aux",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2757  				      "ref",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2758  				      "com_aux",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2759  				      "usb3_pipe";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2760  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2761  			power-domains = <&gcc GCC_USB_2_PHY_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2762  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2763  			resets = <&gcc GCC_USB3_PHY_TERT_BCR>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  2764  				 <&gcc GCC_USB4_2_DP0_PHY_TERT_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2765  			reset-names = "phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  2766  				      "common";
4af46b7bd66fa3 Abel Vesa           2024-01-29  2767  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2768  			#clock-cells = <1>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2769  			#phy-cells = <1>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  2770  
17c5909f53e01c Abel Vesa           2024-08-29  2771  			orientation-switch;
17c5909f53e01c Abel Vesa           2024-08-29  2772  
4af46b7bd66fa3 Abel Vesa           2024-01-29  2773  			status = "disabled";
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2774  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2775  			ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2776  				#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2777  				#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2778  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2779  				port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2780  					reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2781  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2782  					usb_1_ss2_qmpphy_out: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2783  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2784  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2785  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2786  				port@1 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2787  					reg = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2788  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2789  					usb_1_ss2_qmpphy_usb_ss_in: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2790  						remote-endpoint = <&usb_1_ss2_dwc3_ss>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2791  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2792  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2793  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2794  				port@2 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2795  					reg = <2>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2796  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2797  					usb_1_ss2_qmpphy_dp_in: endpoint {
aa48a8a5d642b5 Abel Vesa           2024-06-06  2798  						remote-endpoint = <&mdss_dp2_out>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2799  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2800  				};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  2801  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2802  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  2803  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2804  		cnoc_main: interconnect@1500000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2805  			compatible = "qcom,x1e80100-cnoc-main";
27302c7d859099 Konrad Dybcio       2024-07-11  2806  			reg = <0 0x01500000 0 0x14400>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2807  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2808  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2809  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2810  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2811  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2812  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2813  		config_noc: interconnect@1600000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2814  			compatible = "qcom,x1e80100-cnoc-cfg";
27302c7d859099 Konrad Dybcio       2024-07-11  2815  			reg = <0 0x01600000 0 0x6600>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2816  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2817  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2818  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2819  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2820  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2821  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2822  		system_noc: interconnect@1680000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2823  			compatible = "qcom,x1e80100-system-noc";
27302c7d859099 Konrad Dybcio       2024-07-11  2824  			reg = <0 0x01680000 0 0x1c080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2825  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2826  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2827  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2828  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2829  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2830  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2831  		pcie_south_anoc: interconnect@16c0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2832  			compatible = "qcom,x1e80100-pcie-south-anoc";
27302c7d859099 Konrad Dybcio       2024-07-11  2833  			reg = <0 0x016c0000 0 0xd080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2834  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2835  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2836  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2837  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2838  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2839  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2840  		pcie_center_anoc: interconnect@16d0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2841  			compatible = "qcom,x1e80100-pcie-center-anoc";
27302c7d859099 Konrad Dybcio       2024-07-11  2842  			reg = <0 0x016d0000 0 0x7000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2843  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2844  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2845  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2846  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2847  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2848  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2849  		aggre1_noc: interconnect@16e0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2850  			compatible = "qcom,x1e80100-aggre1-noc";
27302c7d859099 Konrad Dybcio       2024-07-11  2851  			reg = <0 0x016e0000 0 0x14400>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2852  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2853  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2854  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2855  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2856  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2857  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2858  		aggre2_noc: interconnect@1700000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2859  			compatible = "qcom,x1e80100-aggre2-noc";
27302c7d859099 Konrad Dybcio       2024-07-11  2860  			reg = <0 0x01700000 0 0x1c400>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2861  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2862  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2863  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2864  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2865  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2866  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2867  		pcie_north_anoc: interconnect@1740000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2868  			compatible = "qcom,x1e80100-pcie-north-anoc";
27302c7d859099 Konrad Dybcio       2024-07-11  2869  			reg = <0 0x01740000 0 0x9080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2870  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2871  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2872  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2873  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2874  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2875  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2876  		usb_center_anoc: interconnect@1750000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2877  			compatible = "qcom,x1e80100-usb-center-anoc";
27302c7d859099 Konrad Dybcio       2024-07-11  2878  			reg = <0 0x01750000 0 0x8800>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2879  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2880  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2881  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2882  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2883  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2884  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2885  		usb_north_anoc: interconnect@1760000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2886  			compatible = "qcom,x1e80100-usb-north-anoc";
27302c7d859099 Konrad Dybcio       2024-07-11  2887  			reg = <0 0x01760000 0 0x7080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2888  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2889  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2890  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2891  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2892  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2893  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2894  		usb_south_anoc: interconnect@1770000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2895  			compatible = "qcom,x1e80100-usb-south-anoc";
27302c7d859099 Konrad Dybcio       2024-07-11  2896  			reg = <0 0x01770000 0 0xf080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2897  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2898  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2899  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2900  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2901  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2902  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2903  		mmss_noc: interconnect@1780000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  2904  			compatible = "qcom,x1e80100-mmss-noc";
27302c7d859099 Konrad Dybcio       2024-07-11  2905  			reg = <0 0x01780000 0 0x5B800>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2906  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2907  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2908  
af16b00578a7a1 Rajendra Nayak      2023-12-05  2909  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  2910  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  2911  
5eb83fc10289db Abel Vesa           2024-01-29  2912  		pcie6a: pci@1bf8000 {
5eb83fc10289db Abel Vesa           2024-01-29  2913  			device_type = "pci";
5eb83fc10289db Abel Vesa           2024-01-29  2914  			compatible = "qcom,pcie-x1e80100";
5eb83fc10289db Abel Vesa           2024-01-29  2915  			reg = <0 0x01bf8000 0 0x3000>,
8e99e770f7eab8 Abel Vesa           2024-06-04  2916  			      <0 0x70000000 0 0xf20>,
8e99e770f7eab8 Abel Vesa           2024-06-04  2917  			      <0 0x70000f40 0 0xa8>,
5eb83fc10289db Abel Vesa           2024-01-29  2918  			      <0 0x70001000 0 0x1000>,
8e99e770f7eab8 Abel Vesa           2024-06-04  2919  			      <0 0x70100000 0 0x100000>,
8e99e770f7eab8 Abel Vesa           2024-06-04  2920  			      <0 0x01bfb000 0 0x1000>;
5eb83fc10289db Abel Vesa           2024-01-29  2921  			reg-names = "parf",
5eb83fc10289db Abel Vesa           2024-01-29  2922  				    "dbi",
5eb83fc10289db Abel Vesa           2024-01-29  2923  				    "elbi",
5eb83fc10289db Abel Vesa           2024-01-29  2924  				    "atu",
8e99e770f7eab8 Abel Vesa           2024-06-04  2925  				    "config",
8e99e770f7eab8 Abel Vesa           2024-06-04  2926  				    "mhi";
5eb83fc10289db Abel Vesa           2024-01-29  2927  			#address-cells = <3>;
5eb83fc10289db Abel Vesa           2024-01-29  2928  			#size-cells = <2>;
7af14185001241 Konrad Dybcio       2024-07-10  2929  			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
7af14185001241 Konrad Dybcio       2024-07-10  2930  				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0x1d00000>;
7af14185001241 Konrad Dybcio       2024-07-10  2931  			bus-range = <0x00 0xff>;
5eb83fc10289db Abel Vesa           2024-01-29  2932  
5eb83fc10289db Abel Vesa           2024-01-29  2933  			dma-coherent;
5eb83fc10289db Abel Vesa           2024-01-29  2934  
f8fa1f2f6412bf Johan Hovold        2024-07-22  2935  			linux,pci-domain = <6>;
837c333f46df8c Abel Vesa           2024-10-09  2936  			num-lanes = <4>;
5eb83fc10289db Abel Vesa           2024-01-29  2937  
9c4cd0aef259d4 Johan Hovold        2024-10-09  2938  			msi-map = <0x0 &gic_its 0xe0000 0x10000>;
5eb83fc10289db Abel Vesa           2024-01-29  2939  
5eb83fc10289db Abel Vesa           2024-01-29  2940  			interrupts = <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2941  				     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2942  				     <GIC_SPI 837 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2943  				     <GIC_SPI 838 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2944  				     <GIC_SPI 839 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2945  				     <GIC_SPI 840 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2946  				     <GIC_SPI 841 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2947  				     <GIC_SPI 842 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db Abel Vesa           2024-01-29  2948  			interrupt-names = "msi0",
5eb83fc10289db Abel Vesa           2024-01-29  2949  					  "msi1",
5eb83fc10289db Abel Vesa           2024-01-29  2950  					  "msi2",
5eb83fc10289db Abel Vesa           2024-01-29  2951  					  "msi3",
5eb83fc10289db Abel Vesa           2024-01-29  2952  					  "msi4",
5eb83fc10289db Abel Vesa           2024-01-29  2953  					  "msi5",
5eb83fc10289db Abel Vesa           2024-01-29  2954  					  "msi6",
5eb83fc10289db Abel Vesa           2024-01-29  2955  					  "msi7";
5eb83fc10289db Abel Vesa           2024-01-29  2956  
5eb83fc10289db Abel Vesa           2024-01-29  2957  			#interrupt-cells = <1>;
5eb83fc10289db Abel Vesa           2024-01-29  2958  			interrupt-map-mask = <0 0 0 0x7>;
5eb83fc10289db Abel Vesa           2024-01-29  2959  			interrupt-map = <0 0 0 1 &intc 0 0 0 843 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2960  					<0 0 0 2 &intc 0 0 0 844 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2961  					<0 0 0 3 &intc 0 0 0 845 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  2962  					<0 0 0 4 &intc 0 0 0 772 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db Abel Vesa           2024-01-29  2963  
5eb83fc10289db Abel Vesa           2024-01-29  2964  			clocks = <&gcc GCC_PCIE_6A_AUX_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2965  				 <&gcc GCC_PCIE_6A_CFG_AHB_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2966  				 <&gcc GCC_PCIE_6A_MSTR_AXI_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2967  				 <&gcc GCC_PCIE_6A_SLV_AXI_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2968  				 <&gcc GCC_PCIE_6A_SLV_Q2A_AXI_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2969  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_SOUTH_AHB_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  2970  				 <&gcc GCC_CNOC_PCIE_SOUTH_SF_AXI_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  2971  			clock-names = "aux",
5eb83fc10289db Abel Vesa           2024-01-29  2972  				      "cfg",
5eb83fc10289db Abel Vesa           2024-01-29  2973  				      "bus_master",
5eb83fc10289db Abel Vesa           2024-01-29  2974  				      "bus_slave",
5eb83fc10289db Abel Vesa           2024-01-29  2975  				      "slave_q2a",
5eb83fc10289db Abel Vesa           2024-01-29  2976  				      "noc_aggr",
5eb83fc10289db Abel Vesa           2024-01-29  2977  				      "cnoc_sf_axi";
5eb83fc10289db Abel Vesa           2024-01-29  2978  
5eb83fc10289db Abel Vesa           2024-01-29  2979  			assigned-clocks = <&gcc GCC_PCIE_6A_AUX_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  2980  			assigned-clock-rates = <19200000>;
5eb83fc10289db Abel Vesa           2024-01-29  2981  
5eb83fc10289db Abel Vesa           2024-01-29  2982  			interconnects = <&pcie_south_anoc MASTER_PCIE_6A QCOM_ICC_TAG_ALWAYS
5eb83fc10289db Abel Vesa           2024-01-29  2983  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
5eb83fc10289db Abel Vesa           2024-01-29  2984  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
5eb83fc10289db Abel Vesa           2024-01-29  2985  					 &cnoc_main SLAVE_PCIE_6A QCOM_ICC_TAG_ALWAYS>;
5eb83fc10289db Abel Vesa           2024-01-29  2986  			interconnect-names = "pcie-mem",
5eb83fc10289db Abel Vesa           2024-01-29  2987  					     "cpu-pcie";
5eb83fc10289db Abel Vesa           2024-01-29  2988  
5eb83fc10289db Abel Vesa           2024-01-29  2989  			resets = <&gcc GCC_PCIE_6A_BCR>,
5eb83fc10289db Abel Vesa           2024-01-29  2990  				 <&gcc GCC_PCIE_6A_LINK_DOWN_BCR>;
5eb83fc10289db Abel Vesa           2024-01-29  2991  			reset-names = "pci",
5eb83fc10289db Abel Vesa           2024-01-29  2992  				      "link_down";
5eb83fc10289db Abel Vesa           2024-01-29  2993  
5eb83fc10289db Abel Vesa           2024-01-29  2994  			power-domains = <&gcc GCC_PCIE_6A_GDSC>;
98abf2fbd17901 Johan Hovold        2024-07-22  2995  			required-opps = <&rpmhpd_opp_nom>;
5eb83fc10289db Abel Vesa           2024-01-29  2996  
5eb83fc10289db Abel Vesa           2024-01-29  2997  			phys = <&pcie6a_phy>;
5eb83fc10289db Abel Vesa           2024-01-29  2998  			phy-names = "pciephy";
5eb83fc10289db Abel Vesa           2024-01-29  2999  
5eb83fc10289db Abel Vesa           2024-01-29  3000  			status = "disabled";
5eb83fc10289db Abel Vesa           2024-01-29  3001  		};
5eb83fc10289db Abel Vesa           2024-01-29  3002  
5eb83fc10289db Abel Vesa           2024-01-29  3003  		pcie6a_phy: phy@1bfc000 {
837c333f46df8c Abel Vesa           2024-10-09  3004  			compatible = "qcom,x1e80100-qmp-gen4x4-pcie-phy";
837c333f46df8c Abel Vesa           2024-10-09  3005  			reg = <0 0x01bfc000 0 0x2000>,
837c333f46df8c Abel Vesa           2024-10-09  3006  			      <0 0x01bfe000 0 0x2000>;
5eb83fc10289db Abel Vesa           2024-01-29  3007  
5eb83fc10289db Abel Vesa           2024-01-29  3008  			clocks = <&gcc GCC_PCIE_6A_PHY_AUX_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3009  				 <&gcc GCC_PCIE_6A_CFG_AHB_CLK>,
27727cb6604e09 Johan Hovold        2024-09-16  3010  				 <&tcsr TCSR_PCIE_4L_CLKREF_EN>,
5eb83fc10289db Abel Vesa           2024-01-29  3011  				 <&gcc GCC_PCIE_6A_PHY_RCHNG_CLK>,
27727cb6604e09 Johan Hovold        2024-09-16  3012  				 <&gcc GCC_PCIE_6A_PIPE_CLK>,
27727cb6604e09 Johan Hovold        2024-09-16  3013  				 <&gcc GCC_PCIE_6A_PIPEDIV2_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  3014  			clock-names = "aux",
5eb83fc10289db Abel Vesa           2024-01-29  3015  				      "cfg_ahb",
5eb83fc10289db Abel Vesa           2024-01-29  3016  				      "ref",
5eb83fc10289db Abel Vesa           2024-01-29  3017  				      "rchng",
27727cb6604e09 Johan Hovold        2024-09-16  3018  				      "pipe",
27727cb6604e09 Johan Hovold        2024-09-16  3019  				      "pipediv2";
5eb83fc10289db Abel Vesa           2024-01-29  3020  
5eb83fc10289db Abel Vesa           2024-01-29  3021  			resets = <&gcc GCC_PCIE_6A_PHY_BCR>,
5eb83fc10289db Abel Vesa           2024-01-29  3022  				 <&gcc GCC_PCIE_6A_NOCSR_COM_PHY_BCR>;
5eb83fc10289db Abel Vesa           2024-01-29  3023  			reset-names = "phy",
5eb83fc10289db Abel Vesa           2024-01-29  3024  				      "phy_nocsr";
5eb83fc10289db Abel Vesa           2024-01-29  3025  
5eb83fc10289db Abel Vesa           2024-01-29  3026  			assigned-clocks = <&gcc GCC_PCIE_6A_PHY_RCHNG_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  3027  			assigned-clock-rates = <100000000>;
5eb83fc10289db Abel Vesa           2024-01-29  3028  
5eb83fc10289db Abel Vesa           2024-01-29  3029  			power-domains = <&gcc GCC_PCIE_6_PHY_GDSC>;
5eb83fc10289db Abel Vesa           2024-01-29  3030  
837c333f46df8c Abel Vesa           2024-10-09  3031  			qcom,4ln-config-sel = <&tcsr 0x1a000 0>;
837c333f46df8c Abel Vesa           2024-10-09  3032  
5eb83fc10289db Abel Vesa           2024-01-29  3033  			#clock-cells = <0>;
5eb83fc10289db Abel Vesa           2024-01-29  3034  			clock-output-names = "pcie6a_pipe_clk";
5eb83fc10289db Abel Vesa           2024-01-29  3035  
5eb83fc10289db Abel Vesa           2024-01-29  3036  			#phy-cells = <0>;
5eb83fc10289db Abel Vesa           2024-01-29  3037  
5eb83fc10289db Abel Vesa           2024-01-29  3038  			status = "disabled";
5eb83fc10289db Abel Vesa           2024-01-29  3039  		};
5eb83fc10289db Abel Vesa           2024-01-29  3040  
62ab23e1550820 Johan Hovold        2024-07-22  3041  		pcie5: pci@1c00000 {
62ab23e1550820 Johan Hovold        2024-07-22  3042  			device_type = "pci";
62ab23e1550820 Johan Hovold        2024-07-22  3043  			compatible = "qcom,pcie-x1e80100";
62ab23e1550820 Johan Hovold        2024-07-22  3044  			reg = <0 0x01c00000 0 0x3000>,
62ab23e1550820 Johan Hovold        2024-07-22  3045  			      <0 0x7e000000 0 0xf1d>,
62ab23e1550820 Johan Hovold        2024-07-22  3046  			      <0 0x7e000f40 0 0xa8>,
62ab23e1550820 Johan Hovold        2024-07-22  3047  			      <0 0x7e001000 0 0x1000>,
62ab23e1550820 Johan Hovold        2024-07-22  3048  			      <0 0x7e100000 0 0x100000>,
62ab23e1550820 Johan Hovold        2024-07-22  3049  			      <0 0x01c03000 0 0x1000>;
62ab23e1550820 Johan Hovold        2024-07-22  3050  			reg-names = "parf",
62ab23e1550820 Johan Hovold        2024-07-22  3051  				    "dbi",
62ab23e1550820 Johan Hovold        2024-07-22  3052  				    "elbi",
62ab23e1550820 Johan Hovold        2024-07-22  3053  				    "atu",
62ab23e1550820 Johan Hovold        2024-07-22  3054  				    "config",
62ab23e1550820 Johan Hovold        2024-07-22  3055  				    "mhi";
62ab23e1550820 Johan Hovold        2024-07-22  3056  			#address-cells = <3>;
62ab23e1550820 Johan Hovold        2024-07-22  3057  			#size-cells = <2>;
62ab23e1550820 Johan Hovold        2024-07-22  3058  			ranges = <0x01000000 0x0 0x00000000 0x0 0x7e200000 0x0 0x100000>,
62ab23e1550820 Johan Hovold        2024-07-22  3059  				 <0x02000000 0x0 0x7e300000 0x0 0x7e300000 0x0 0x1d00000>;
62ab23e1550820 Johan Hovold        2024-07-22  3060  			bus-range = <0x00 0xff>;
62ab23e1550820 Johan Hovold        2024-07-22  3061  
62ab23e1550820 Johan Hovold        2024-07-22  3062  			dma-coherent;
62ab23e1550820 Johan Hovold        2024-07-22  3063  
62ab23e1550820 Johan Hovold        2024-07-22  3064  			linux,pci-domain = <5>;
62ab23e1550820 Johan Hovold        2024-07-22  3065  			num-lanes = <2>;
62ab23e1550820 Johan Hovold        2024-07-22  3066  
62ab23e1550820 Johan Hovold        2024-07-22  3067  			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820 Johan Hovold        2024-07-22  3068  				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820 Johan Hovold        2024-07-22  3069  				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820 Johan Hovold        2024-07-22  3070  				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820 Johan Hovold        2024-07-22  3071  				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820 Johan Hovold        2024-07-22  3072  				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820 Johan Hovold        2024-07-22  3073  				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820 Johan Hovold        2024-07-22  3074  				     <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
62ab23e1550820 Johan Hovold        2024-07-22  3075  			interrupt-names = "msi0",
62ab23e1550820 Johan Hovold        2024-07-22  3076  					  "msi1",
62ab23e1550820 Johan Hovold        2024-07-22  3077  					  "msi2",
62ab23e1550820 Johan Hovold        2024-07-22  3078  					  "msi3",
62ab23e1550820 Johan Hovold        2024-07-22  3079  					  "msi4",
62ab23e1550820 Johan Hovold        2024-07-22  3080  					  "msi5",
62ab23e1550820 Johan Hovold        2024-07-22  3081  					  "msi6",
62ab23e1550820 Johan Hovold        2024-07-22  3082  					  "msi7";
62ab23e1550820 Johan Hovold        2024-07-22  3083  
62ab23e1550820 Johan Hovold        2024-07-22  3084  			#interrupt-cells = <1>;
62ab23e1550820 Johan Hovold        2024-07-22  3085  			interrupt-map-mask = <0 0 0 0x7>;
62ab23e1550820 Johan Hovold        2024-07-22  3086  			interrupt-map = <0 0 0 1 &intc 0 0 0 70 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820 Johan Hovold        2024-07-22  3087  					<0 0 0 2 &intc 0 0 0 71 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820 Johan Hovold        2024-07-22  3088  					<0 0 0 3 &intc 0 0 0 72 IRQ_TYPE_LEVEL_HIGH>,
62ab23e1550820 Johan Hovold        2024-07-22  3089  					<0 0 0 4 &intc 0 0 0 73 IRQ_TYPE_LEVEL_HIGH>;
62ab23e1550820 Johan Hovold        2024-07-22  3090  
62ab23e1550820 Johan Hovold        2024-07-22  3091  			clocks = <&gcc GCC_PCIE_5_AUX_CLK>,
62ab23e1550820 Johan Hovold        2024-07-22  3092  				 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
62ab23e1550820 Johan Hovold        2024-07-22  3093  				 <&gcc GCC_PCIE_5_MSTR_AXI_CLK>,
62ab23e1550820 Johan Hovold        2024-07-22  3094  				 <&gcc GCC_PCIE_5_SLV_AXI_CLK>,
62ab23e1550820 Johan Hovold        2024-07-22  3095  				 <&gcc GCC_PCIE_5_SLV_Q2A_AXI_CLK>,
62ab23e1550820 Johan Hovold        2024-07-22  3096  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_NORTH_AHB_CLK>,
62ab23e1550820 Johan Hovold        2024-07-22  3097  				 <&gcc GCC_CNOC_PCIE_NORTH_SF_AXI_CLK>;
62ab23e1550820 Johan Hovold        2024-07-22  3098  			clock-names = "aux",
62ab23e1550820 Johan Hovold        2024-07-22  3099  				      "cfg",
62ab23e1550820 Johan Hovold        2024-07-22  3100  				      "bus_master",
62ab23e1550820 Johan Hovold        2024-07-22  3101  				      "bus_slave",
62ab23e1550820 Johan Hovold        2024-07-22  3102  				      "slave_q2a",
62ab23e1550820 Johan Hovold        2024-07-22  3103  				      "noc_aggr",
62ab23e1550820 Johan Hovold        2024-07-22  3104  				      "cnoc_sf_axi";
62ab23e1550820 Johan Hovold        2024-07-22  3105  
62ab23e1550820 Johan Hovold        2024-07-22  3106  			assigned-clocks = <&gcc GCC_PCIE_5_AUX_CLK>;
62ab23e1550820 Johan Hovold        2024-07-22  3107  			assigned-clock-rates = <19200000>;
62ab23e1550820 Johan Hovold        2024-07-22  3108  
54376fe116ef69 Johan Hovold        2024-10-24  3109  			interconnects = <&pcie_north_anoc MASTER_PCIE_5 QCOM_ICC_TAG_ALWAYS
62ab23e1550820 Johan Hovold        2024-07-22  3110  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
62ab23e1550820 Johan Hovold        2024-07-22  3111  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
62ab23e1550820 Johan Hovold        2024-07-22  3112  					 &cnoc_main SLAVE_PCIE_5 QCOM_ICC_TAG_ALWAYS>;
62ab23e1550820 Johan Hovold        2024-07-22  3113  			interconnect-names = "pcie-mem",
62ab23e1550820 Johan Hovold        2024-07-22  3114  					     "cpu-pcie";
62ab23e1550820 Johan Hovold        2024-07-22  3115  
62ab23e1550820 Johan Hovold        2024-07-22  3116  			resets = <&gcc GCC_PCIE_5_BCR>,
62ab23e1550820 Johan Hovold        2024-07-22  3117  				 <&gcc GCC_PCIE_5_LINK_DOWN_BCR>;
62ab23e1550820 Johan Hovold        2024-07-22  3118  			reset-names = "pci",
62ab23e1550820 Johan Hovold        2024-07-22  3119  				      "link_down";
62ab23e1550820 Johan Hovold        2024-07-22  3120  
62ab23e1550820 Johan Hovold        2024-07-22  3121  			power-domains = <&gcc GCC_PCIE_5_GDSC>;
62ab23e1550820 Johan Hovold        2024-07-22  3122  			required-opps = <&rpmhpd_opp_nom>;
62ab23e1550820 Johan Hovold        2024-07-22  3123  
62ab23e1550820 Johan Hovold        2024-07-22  3124  			phys = <&pcie5_phy>;
62ab23e1550820 Johan Hovold        2024-07-22  3125  			phy-names = "pciephy";
62ab23e1550820 Johan Hovold        2024-07-22  3126  
62ab23e1550820 Johan Hovold        2024-07-22  3127  			status = "disabled";
62ab23e1550820 Johan Hovold        2024-07-22  3128  		};
62ab23e1550820 Johan Hovold        2024-07-22  3129  
62ab23e1550820 Johan Hovold        2024-07-22  3130  		pcie5_phy: phy@1c06000 {
62ab23e1550820 Johan Hovold        2024-07-22  3131  			compatible = "qcom,x1e80100-qmp-gen3x2-pcie-phy";
62ab23e1550820 Johan Hovold        2024-07-22  3132  			reg = <0 0x01c06000 0 0x2000>;
62ab23e1550820 Johan Hovold        2024-07-22  3133  
62ab23e1550820 Johan Hovold        2024-07-22  3134  			clocks = <&gcc GCC_PCIE_5_AUX_CLK>,
62ab23e1550820 Johan Hovold        2024-07-22  3135  				 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
0b80b3c0f6d20f Johan Hovold        2024-09-16  3136  				 <&tcsr TCSR_PCIE_2L_5_CLKREF_EN>,
62ab23e1550820 Johan Hovold        2024-07-22  3137  				 <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>,
0b80b3c0f6d20f Johan Hovold        2024-09-16  3138  				 <&gcc GCC_PCIE_5_PIPE_CLK>,
0b80b3c0f6d20f Johan Hovold        2024-09-16  3139  				 <&gcc GCC_PCIE_5_PIPEDIV2_CLK>;
62ab23e1550820 Johan Hovold        2024-07-22  3140  			clock-names = "aux",
62ab23e1550820 Johan Hovold        2024-07-22  3141  				      "cfg_ahb",
62ab23e1550820 Johan Hovold        2024-07-22  3142  				      "ref",
62ab23e1550820 Johan Hovold        2024-07-22  3143  				      "rchng",
0b80b3c0f6d20f Johan Hovold        2024-09-16  3144  				      "pipe",
0b80b3c0f6d20f Johan Hovold        2024-09-16  3145  				      "pipediv2";
62ab23e1550820 Johan Hovold        2024-07-22  3146  
62ab23e1550820 Johan Hovold        2024-07-22  3147  			resets = <&gcc GCC_PCIE_5_PHY_BCR>;
62ab23e1550820 Johan Hovold        2024-07-22  3148  			reset-names = "phy";
62ab23e1550820 Johan Hovold        2024-07-22  3149  
62ab23e1550820 Johan Hovold        2024-07-22  3150  			assigned-clocks = <&gcc GCC_PCIE_5_PHY_RCHNG_CLK>;
62ab23e1550820 Johan Hovold        2024-07-22  3151  			assigned-clock-rates = <100000000>;
62ab23e1550820 Johan Hovold        2024-07-22  3152  
62ab23e1550820 Johan Hovold        2024-07-22  3153  			power-domains = <&gcc GCC_PCIE_5_PHY_GDSC>;
62ab23e1550820 Johan Hovold        2024-07-22  3154  
62ab23e1550820 Johan Hovold        2024-07-22  3155  			#clock-cells = <0>;
62ab23e1550820 Johan Hovold        2024-07-22  3156  			clock-output-names = "pcie5_pipe_clk";
62ab23e1550820 Johan Hovold        2024-07-22  3157  
62ab23e1550820 Johan Hovold        2024-07-22  3158  			#phy-cells = <0>;
5eb83fc10289db Abel Vesa           2024-01-29  3159  
5eb83fc10289db Abel Vesa           2024-01-29  3160  			status = "disabled";
5eb83fc10289db Abel Vesa           2024-01-29  3161  		};
5eb83fc10289db Abel Vesa           2024-01-29  3162  
5eb83fc10289db Abel Vesa           2024-01-29  3163  		pcie4: pci@1c08000 {
5eb83fc10289db Abel Vesa           2024-01-29  3164  			device_type = "pci";
5eb83fc10289db Abel Vesa           2024-01-29  3165  			compatible = "qcom,pcie-x1e80100";
5eb83fc10289db Abel Vesa           2024-01-29  3166  			reg = <0 0x01c08000 0 0x3000>,
5eb83fc10289db Abel Vesa           2024-01-29  3167  			      <0 0x7c000000 0 0xf1d>,
5eb83fc10289db Abel Vesa           2024-01-29  3168  			      <0 0x7c000f40 0 0xa8>,
5eb83fc10289db Abel Vesa           2024-01-29  3169  			      <0 0x7c001000 0 0x1000>,
5eb83fc10289db Abel Vesa           2024-01-29  3170  			      <0 0x7c100000 0 0x100000>,
5eb83fc10289db Abel Vesa           2024-01-29  3171  			      <0 0x01c0b000 0 0x1000>;
5eb83fc10289db Abel Vesa           2024-01-29  3172  			reg-names = "parf",
5eb83fc10289db Abel Vesa           2024-01-29  3173  			            "dbi",
5eb83fc10289db Abel Vesa           2024-01-29  3174  				    "elbi",
5eb83fc10289db Abel Vesa           2024-01-29  3175  				    "atu",
5eb83fc10289db Abel Vesa           2024-01-29  3176  				    "config",
5eb83fc10289db Abel Vesa           2024-01-29  3177  				    "mhi";
5eb83fc10289db Abel Vesa           2024-01-29  3178  			#address-cells = <3>;
5eb83fc10289db Abel Vesa           2024-01-29  3179  			#size-cells = <2>;
7af14185001241 Konrad Dybcio       2024-07-10  3180  			ranges = <0x01000000 0x0 0x00000000 0x0 0x7c200000 0x0 0x100000>,
7af14185001241 Konrad Dybcio       2024-07-10  3181  				 <0x02000000 0x0 0x7c300000 0x0 0x7c300000 0x0 0x1d00000>;
5eb83fc10289db Abel Vesa           2024-01-29  3182  			bus-range = <0x00 0xff>;
5eb83fc10289db Abel Vesa           2024-01-29  3183  
5eb83fc10289db Abel Vesa           2024-01-29  3184  			dma-coherent;
5eb83fc10289db Abel Vesa           2024-01-29  3185  
f8fa1f2f6412bf Johan Hovold        2024-07-22  3186  			linux,pci-domain = <4>;
5eb83fc10289db Abel Vesa           2024-01-29  3187  			num-lanes = <2>;
5eb83fc10289db Abel Vesa           2024-01-29  3188  
9c4cd0aef259d4 Johan Hovold        2024-10-09  3189  			msi-map = <0x0 &gic_its 0xc0000 0x10000>;
9c4cd0aef259d4 Johan Hovold        2024-10-09  3190  
5eb83fc10289db Abel Vesa           2024-01-29  3191  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3192  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3193  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3194  				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3195  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3196  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3197  				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3198  				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db Abel Vesa           2024-01-29  3199  			interrupt-names = "msi0",
5eb83fc10289db Abel Vesa           2024-01-29  3200  					  "msi1",
5eb83fc10289db Abel Vesa           2024-01-29  3201  					  "msi2",
5eb83fc10289db Abel Vesa           2024-01-29  3202  					  "msi3",
5eb83fc10289db Abel Vesa           2024-01-29  3203  					  "msi4",
5eb83fc10289db Abel Vesa           2024-01-29  3204  					  "msi5",
5eb83fc10289db Abel Vesa           2024-01-29  3205  					  "msi6",
5eb83fc10289db Abel Vesa           2024-01-29  3206  					  "msi7";
5eb83fc10289db Abel Vesa           2024-01-29  3207  
5eb83fc10289db Abel Vesa           2024-01-29  3208  			#interrupt-cells = <1>;
5eb83fc10289db Abel Vesa           2024-01-29  3209  			interrupt-map-mask = <0 0 0 0x7>;
5eb83fc10289db Abel Vesa           2024-01-29  3210  			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3211  					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3212  					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>,
5eb83fc10289db Abel Vesa           2024-01-29  3213  					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>;
5eb83fc10289db Abel Vesa           2024-01-29  3214  
5eb83fc10289db Abel Vesa           2024-01-29  3215  			clocks = <&gcc GCC_PCIE_4_AUX_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3216  				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3217  				 <&gcc GCC_PCIE_4_MSTR_AXI_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3218  				 <&gcc GCC_PCIE_4_SLV_AXI_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3219  				 <&gcc GCC_PCIE_4_SLV_Q2A_AXI_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3220  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_NORTH_AHB_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3221  				 <&gcc GCC_CNOC_PCIE_NORTH_SF_AXI_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  3222  			clock-names = "aux",
5eb83fc10289db Abel Vesa           2024-01-29  3223  				      "cfg",
5eb83fc10289db Abel Vesa           2024-01-29  3224  				      "bus_master",
5eb83fc10289db Abel Vesa           2024-01-29  3225  				      "bus_slave",
5eb83fc10289db Abel Vesa           2024-01-29  3226  				      "slave_q2a",
5eb83fc10289db Abel Vesa           2024-01-29  3227  				      "noc_aggr",
5eb83fc10289db Abel Vesa           2024-01-29  3228  				      "cnoc_sf_axi";
5eb83fc10289db Abel Vesa           2024-01-29  3229  
5eb83fc10289db Abel Vesa           2024-01-29  3230  			assigned-clocks = <&gcc GCC_PCIE_4_AUX_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  3231  			assigned-clock-rates = <19200000>;
5eb83fc10289db Abel Vesa           2024-01-29  3232  
f3bba5eb46ddb8 Johan Hovold        2024-10-24  3233  			interconnects = <&pcie_north_anoc MASTER_PCIE_4 QCOM_ICC_TAG_ALWAYS
5eb83fc10289db Abel Vesa           2024-01-29  3234  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
5eb83fc10289db Abel Vesa           2024-01-29  3235  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
5eb83fc10289db Abel Vesa           2024-01-29  3236  					 &cnoc_main SLAVE_PCIE_4 QCOM_ICC_TAG_ALWAYS>;
5eb83fc10289db Abel Vesa           2024-01-29  3237  			interconnect-names = "pcie-mem",
5eb83fc10289db Abel Vesa           2024-01-29  3238  					     "cpu-pcie";
5eb83fc10289db Abel Vesa           2024-01-29  3239  
5eb83fc10289db Abel Vesa           2024-01-29  3240  			resets = <&gcc GCC_PCIE_4_BCR>,
5eb83fc10289db Abel Vesa           2024-01-29  3241  				 <&gcc GCC_PCIE_4_LINK_DOWN_BCR>;
5eb83fc10289db Abel Vesa           2024-01-29  3242  			reset-names = "pci",
5eb83fc10289db Abel Vesa           2024-01-29  3243  				      "link_down";
5eb83fc10289db Abel Vesa           2024-01-29  3244  
5eb83fc10289db Abel Vesa           2024-01-29  3245  			power-domains = <&gcc GCC_PCIE_4_GDSC>;
98abf2fbd17901 Johan Hovold        2024-07-22  3246  			required-opps = <&rpmhpd_opp_nom>;
5eb83fc10289db Abel Vesa           2024-01-29  3247  
5eb83fc10289db Abel Vesa           2024-01-29  3248  			phys = <&pcie4_phy>;
5eb83fc10289db Abel Vesa           2024-01-29  3249  			phy-names = "pciephy";
5eb83fc10289db Abel Vesa           2024-01-29  3250  
5eb83fc10289db Abel Vesa           2024-01-29  3251  			status = "disabled";
8bc7cb73df8644 Patrick Wildt       2024-07-15  3252  
8bc7cb73df8644 Patrick Wildt       2024-07-15  3253  			pcie4_port0: pcie@0 {
8bc7cb73df8644 Patrick Wildt       2024-07-15  3254  				device_type = "pci";
8bc7cb73df8644 Patrick Wildt       2024-07-15  3255  				reg = <0x0 0x0 0x0 0x0 0x0>;
8bc7cb73df8644 Patrick Wildt       2024-07-15  3256  				bus-range = <0x01 0xff>;
8bc7cb73df8644 Patrick Wildt       2024-07-15  3257  
8bc7cb73df8644 Patrick Wildt       2024-07-15  3258  				#address-cells = <3>;
8bc7cb73df8644 Patrick Wildt       2024-07-15  3259  				#size-cells = <2>;
8bc7cb73df8644 Patrick Wildt       2024-07-15  3260  				ranges;
8bc7cb73df8644 Patrick Wildt       2024-07-15  3261  			};
5eb83fc10289db Abel Vesa           2024-01-29  3262  		};
5eb83fc10289db Abel Vesa           2024-01-29  3263  
5eb83fc10289db Abel Vesa           2024-01-29  3264  		pcie4_phy: phy@1c0e000 {
5eb83fc10289db Abel Vesa           2024-01-29  3265  			compatible = "qcom,x1e80100-qmp-gen3x2-pcie-phy";
5eb83fc10289db Abel Vesa           2024-01-29  3266  			reg = <0 0x01c0e000 0 0x2000>;
5eb83fc10289db Abel Vesa           2024-01-29  3267  
5eb83fc10289db Abel Vesa           2024-01-29  3268  			clocks = <&gcc GCC_PCIE_4_AUX_CLK>,
5eb83fc10289db Abel Vesa           2024-01-29  3269  				 <&gcc GCC_PCIE_4_CFG_AHB_CLK>,
27727cb6604e09 Johan Hovold        2024-09-16  3270  				 <&tcsr TCSR_PCIE_2L_4_CLKREF_EN>,
5eb83fc10289db Abel Vesa           2024-01-29  3271  				 <&gcc GCC_PCIE_4_PHY_RCHNG_CLK>,
27727cb6604e09 Johan Hovold        2024-09-16  3272  				 <&gcc GCC_PCIE_4_PIPE_CLK>,
27727cb6604e09 Johan Hovold        2024-09-16  3273  				 <&gcc GCC_PCIE_4_PIPEDIV2_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  3274  			clock-names = "aux",
5eb83fc10289db Abel Vesa           2024-01-29  3275  				      "cfg_ahb",
5eb83fc10289db Abel Vesa           2024-01-29  3276  				      "ref",
5eb83fc10289db Abel Vesa           2024-01-29  3277  				      "rchng",
27727cb6604e09 Johan Hovold        2024-09-16  3278  				      "pipe",
27727cb6604e09 Johan Hovold        2024-09-16  3279  				      "pipediv2";
5eb83fc10289db Abel Vesa           2024-01-29  3280  
5eb83fc10289db Abel Vesa           2024-01-29  3281  			resets = <&gcc GCC_PCIE_4_PHY_BCR>;
5eb83fc10289db Abel Vesa           2024-01-29  3282  			reset-names = "phy";
5eb83fc10289db Abel Vesa           2024-01-29  3283  
5eb83fc10289db Abel Vesa           2024-01-29  3284  			assigned-clocks = <&gcc GCC_PCIE_4_PHY_RCHNG_CLK>;
5eb83fc10289db Abel Vesa           2024-01-29  3285  			assigned-clock-rates = <100000000>;
5eb83fc10289db Abel Vesa           2024-01-29  3286  
5eb83fc10289db Abel Vesa           2024-01-29  3287  			power-domains = <&gcc GCC_PCIE_4_PHY_GDSC>;
5eb83fc10289db Abel Vesa           2024-01-29  3288  
5eb83fc10289db Abel Vesa           2024-01-29  3289  			#clock-cells = <0>;
5eb83fc10289db Abel Vesa           2024-01-29  3290  			clock-output-names = "pcie4_pipe_clk";
5eb83fc10289db Abel Vesa           2024-01-29  3291  
5eb83fc10289db Abel Vesa           2024-01-29  3292  			#phy-cells = <0>;
5eb83fc10289db Abel Vesa           2024-01-29  3293  
5eb83fc10289db Abel Vesa           2024-01-29  3294  			status = "disabled";
5eb83fc10289db Abel Vesa           2024-01-29  3295  		};
5eb83fc10289db Abel Vesa           2024-01-29  3296  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3297  		tcsr_mutex: hwlock@1f40000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  3298  			compatible = "qcom,tcsr-mutex";
af16b00578a7a1 Rajendra Nayak      2023-12-05  3299  			reg = <0 0x01f40000 0 0x20000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3300  			#hwlock-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3301  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  3302  
8b6e2bf94b278c Abel Vesa           2024-01-29  3303  		tcsr: clock-controller@1fc0000 {
8b6e2bf94b278c Abel Vesa           2024-01-29  3304  			compatible = "qcom,x1e80100-tcsr", "syscon";
8b6e2bf94b278c Abel Vesa           2024-01-29  3305  			reg = <0 0x01fc0000 0 0x30000>;
8b6e2bf94b278c Abel Vesa           2024-01-29  3306  			clocks = <&rpmhcc RPMH_CXO_CLK>;
8b6e2bf94b278c Abel Vesa           2024-01-29  3307  			#clock-cells = <1>;
8b6e2bf94b278c Abel Vesa           2024-01-29  3308  			#reset-cells = <1>;
8b6e2bf94b278c Abel Vesa           2024-01-29  3309  		};
8b6e2bf94b278c Abel Vesa           2024-01-29  3310  
721e38301b79a6 Akhil P Oommen      2024-06-29  3311  		gpu: gpu@3d00000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3312  			compatible = "qcom,adreno-43050c01", "qcom,adreno";
721e38301b79a6 Akhil P Oommen      2024-06-29  3313  			reg = <0x0 0x03d00000 0x0 0x40000>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3314  			      <0x0 0x03d9e000 0x0 0x1000>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3315  			      <0x0 0x03d61000 0x0 0x800>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3316  
721e38301b79a6 Akhil P Oommen      2024-06-29  3317  			reg-names = "kgsl_3d0_reg_memory",
721e38301b79a6 Akhil P Oommen      2024-06-29  3318  				    "cx_mem",
721e38301b79a6 Akhil P Oommen      2024-06-29  3319  				    "cx_dbgc";
721e38301b79a6 Akhil P Oommen      2024-06-29  3320  
721e38301b79a6 Akhil P Oommen      2024-06-29  3321  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3322  
721e38301b79a6 Akhil P Oommen      2024-06-29  3323  			iommus = <&adreno_smmu 0 0x0>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3324  				 <&adreno_smmu 1 0x0>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3325  
721e38301b79a6 Akhil P Oommen      2024-06-29  3326  			operating-points-v2 = <&gpu_opp_table>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3327  
721e38301b79a6 Akhil P Oommen      2024-06-29  3328  			qcom,gmu = <&gmu>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3329  			#cooling-cells = <2>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3330  
721e38301b79a6 Akhil P Oommen      2024-06-29  3331  			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3332  			interconnect-names = "gfx-mem";
721e38301b79a6 Akhil P Oommen      2024-06-29  3333  
1f7574a1f9a892 Dmitry Baryshkov    2024-07-15  3334  			status = "disabled";
1f7574a1f9a892 Dmitry Baryshkov    2024-07-15  3335  
721e38301b79a6 Akhil P Oommen      2024-06-29  3336  			zap-shader {
721e38301b79a6 Akhil P Oommen      2024-06-29  3337  				memory-region = <&gpu_microcode_mem>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3338  			};
721e38301b79a6 Akhil P Oommen      2024-06-29  3339  
721e38301b79a6 Akhil P Oommen      2024-06-29  3340  			gpu_opp_table: opp-table {
721e38301b79a6 Akhil P Oommen      2024-06-29  3341  				compatible = "operating-points-v2";
721e38301b79a6 Akhil P Oommen      2024-06-29  3342  
721e38301b79a6 Akhil P Oommen      2024-06-29  3343  				opp-1100000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3344  					opp-hz = /bits/ 64 <1100000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3345  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3346  					opp-peak-kBps = <16500000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3347  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3348  
721e38301b79a6 Akhil P Oommen      2024-06-29  3349  				opp-1000000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3350  					opp-hz = /bits/ 64 <1000000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3351  					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3352  					opp-peak-kBps = <14398438>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3353  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3354  
721e38301b79a6 Akhil P Oommen      2024-06-29  3355  				opp-925000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3356  					opp-hz = /bits/ 64 <925000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3357  					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3358  					opp-peak-kBps = <14398438>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3359  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3360  
721e38301b79a6 Akhil P Oommen      2024-06-29  3361  				opp-800000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3362  					opp-hz = /bits/ 64 <800000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3363  					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3364  					opp-peak-kBps = <12449219>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3365  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3366  
721e38301b79a6 Akhil P Oommen      2024-06-29  3367  				opp-744000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3368  					opp-hz = /bits/ 64 <744000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3369  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3370  					opp-peak-kBps = <10687500>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3371  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3372  
721e38301b79a6 Akhil P Oommen      2024-06-29  3373  				opp-687000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3374  					opp-hz = /bits/ 64 <687000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3375  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3376  					opp-peak-kBps = <8171875>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3377  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3378  
721e38301b79a6 Akhil P Oommen      2024-06-29  3379  				opp-550000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3380  					opp-hz = /bits/ 64 <550000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3381  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3382  					opp-peak-kBps = <6074219>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3383  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3384  
721e38301b79a6 Akhil P Oommen      2024-06-29  3385  				opp-390000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3386  					opp-hz = /bits/ 64 <390000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3387  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3388  					opp-peak-kBps = <3000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3389  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3390  
721e38301b79a6 Akhil P Oommen      2024-06-29  3391  				opp-300000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3392  					opp-hz = /bits/ 64 <300000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3393  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3394  					opp-peak-kBps = <2136719>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3395  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3396  			};
721e38301b79a6 Akhil P Oommen      2024-06-29  3397  		};
721e38301b79a6 Akhil P Oommen      2024-06-29  3398  
721e38301b79a6 Akhil P Oommen      2024-06-29  3399  		gmu: gmu@3d6a000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3400  			compatible = "qcom,adreno-gmu-x185.1", "qcom,adreno-gmu";
721e38301b79a6 Akhil P Oommen      2024-06-29  3401  			reg = <0x0 0x03d6a000 0x0 0x35000>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3402  			      <0x0 0x03d50000 0x0 0x10000>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3403  			      <0x0 0x0b280000 0x0 0x10000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3404  			reg-names = "gmu", "rscc", "gmu_pdc";
721e38301b79a6 Akhil P Oommen      2024-06-29  3405  
721e38301b79a6 Akhil P Oommen      2024-06-29  3406  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3407  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3408  			interrupt-names = "hfi", "gmu";
721e38301b79a6 Akhil P Oommen      2024-06-29  3409  
721e38301b79a6 Akhil P Oommen      2024-06-29  3410  			clocks = <&gpucc GPU_CC_AHB_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3411  				 <&gpucc GPU_CC_CX_GMU_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3412  				 <&gpucc GPU_CC_CXO_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3413  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3414  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3415  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3416  				 <&gpucc GPU_CC_DEMET_CLK>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3417  			clock-names = "ahb",
721e38301b79a6 Akhil P Oommen      2024-06-29  3418  				      "gmu",
721e38301b79a6 Akhil P Oommen      2024-06-29  3419  				      "cxo",
721e38301b79a6 Akhil P Oommen      2024-06-29  3420  				      "axi",
721e38301b79a6 Akhil P Oommen      2024-06-29  3421  				      "memnoc",
721e38301b79a6 Akhil P Oommen      2024-06-29  3422  				      "hub",
721e38301b79a6 Akhil P Oommen      2024-06-29  3423  				      "demet";
721e38301b79a6 Akhil P Oommen      2024-06-29  3424  
721e38301b79a6 Akhil P Oommen      2024-06-29  3425  			power-domains = <&gpucc GPU_CX_GDSC>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3426  					<&gpucc GPU_GX_GDSC>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3427  			power-domain-names = "cx",
721e38301b79a6 Akhil P Oommen      2024-06-29  3428  					     "gx";
721e38301b79a6 Akhil P Oommen      2024-06-29  3429  
721e38301b79a6 Akhil P Oommen      2024-06-29  3430  			iommus = <&adreno_smmu 5 0x0>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3431  
721e38301b79a6 Akhil P Oommen      2024-06-29  3432  			qcom,qmp = <&aoss_qmp>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3433  
721e38301b79a6 Akhil P Oommen      2024-06-29  3434  			operating-points-v2 = <&gmu_opp_table>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3435  
721e38301b79a6 Akhil P Oommen      2024-06-29  3436  			gmu_opp_table: opp-table {
721e38301b79a6 Akhil P Oommen      2024-06-29  3437  				compatible = "operating-points-v2";
721e38301b79a6 Akhil P Oommen      2024-06-29  3438  
721e38301b79a6 Akhil P Oommen      2024-06-29  3439  				opp-550000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3440  					opp-hz = /bits/ 64 <550000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3441  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3442  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3443  
721e38301b79a6 Akhil P Oommen      2024-06-29  3444  				opp-220000000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3445  					opp-hz = /bits/ 64 <220000000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3446  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3447  				};
721e38301b79a6 Akhil P Oommen      2024-06-29  3448  			};
721e38301b79a6 Akhil P Oommen      2024-06-29  3449  		};
721e38301b79a6 Akhil P Oommen      2024-06-29  3450  
721e38301b79a6 Akhil P Oommen      2024-06-29  3451  		gpucc: clock-controller@3d90000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3452  			compatible = "qcom,x1e80100-gpucc";
721e38301b79a6 Akhil P Oommen      2024-06-29  3453  			reg = <0 0x03d90000 0 0xa000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3454  			clocks = <&bi_tcxo_div2>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3455  				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3456  				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3457  			#clock-cells = <1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3458  			#reset-cells = <1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3459  			#power-domain-cells = <1>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3460  		};
721e38301b79a6 Akhil P Oommen      2024-06-29  3461  
721e38301b79a6 Akhil P Oommen      2024-06-29  3462  		adreno_smmu: iommu@3da0000 {
721e38301b79a6 Akhil P Oommen      2024-06-29  3463  			compatible = "qcom,x1e80100-smmu-500", "qcom,adreno-smmu",
721e38301b79a6 Akhil P Oommen      2024-06-29  3464  				     "qcom,smmu-500", "arm,mmu-500";
721e38301b79a6 Akhil P Oommen      2024-06-29  3465  			reg = <0x0 0x03da0000 0x0 0x40000>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3466  			#iommu-cells = <2>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3467  			#global-interrupts = <1>;
dfbe93f32c12f5 Konrad Dybcio       2024-07-16  3468  			interrupts = <GIC_SPI 674 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3469  				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3470  				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3471  				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3472  				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3473  				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3474  				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3475  				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3476  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3477  				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3478  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3479  				     <GIC_SPI 688 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3480  				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3481  				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3482  				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3483  				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3484  				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3485  				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3486  				     <GIC_SPI 660 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3487  				     <GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3488  				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3489  				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3490  				     <GIC_SPI 667 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3491  				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3492  				     <GIC_SPI 670 IRQ_TYPE_LEVEL_HIGH>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3493  				     <GIC_SPI 700 IRQ_TYPE_LEVEL_HIGH>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3494  			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3495  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3496  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
721e38301b79a6 Akhil P Oommen      2024-06-29  3497  				 <&gpucc GPU_CC_AHB_CLK>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3498  			clock-names = "hlos",
721e38301b79a6 Akhil P Oommen      2024-06-29  3499  				      "bus",
721e38301b79a6 Akhil P Oommen      2024-06-29  3500  				      "iface",
721e38301b79a6 Akhil P Oommen      2024-06-29  3501  				      "ahb";
721e38301b79a6 Akhil P Oommen      2024-06-29  3502  			power-domains = <&gpucc GPU_CX_GDSC>;
721e38301b79a6 Akhil P Oommen      2024-06-29  3503  			dma-coherent;
721e38301b79a6 Akhil P Oommen      2024-06-29  3504  		};
721e38301b79a6 Akhil P Oommen      2024-06-29  3505  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3506  		gem_noc: interconnect@26400000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  3507  			compatible = "qcom,x1e80100-gem-noc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  3508  			reg = <0 0x26400000 0 0x311200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3509  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3510  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3511  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3512  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3513  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  3514  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3515  		nsp_noc: interconnect@320c0000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  3516  			compatible = "qcom,x1e80100-nsp-noc";
27302c7d859099 Konrad Dybcio       2024-07-11  3517  			reg = <0 0x320C0000 0 0xe080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3518  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3519  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3520  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3521  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3522  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  3523  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3524  		lpass_wsa2macro: codec@6aa0000 {
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3525  			compatible = "qcom,x1e80100-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3526  			reg = <0 0x06aa0000 0 0x1000>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3527  			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3528  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3529  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3530  				 <&lpass_vamacro>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3531  			clock-names = "mclk",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3532  				      "macro",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3533  				      "dcodec",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3534  				      "fsgen";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3535  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3536  			#clock-cells = <0>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3537  			clock-output-names = "wsa2-mclk";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3538  			#sound-dai-cells = <1>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3539  			sound-name-prefix = "WSA2";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3540  		};
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3541  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3542  		swr3: soundwire@6ab0000 {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3543  			compatible = "qcom,soundwire-v2.0.0";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3544  			reg = <0 0x06ab0000 0 0x10000>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3545  			clocks = <&lpass_wsa2macro>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3546  			clock-names = "iface";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3547  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3548  			label = "WSA2";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3549  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3550  			pinctrl-0 = <&wsa2_swr_active>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3551  			pinctrl-names = "default";
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3552  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA2_CGCR>;
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3553  			reset-names = "swr_audio_cgcr";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3554  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3555  			qcom,din-ports = <4>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3556  			qcom,dout-ports = <9>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3557  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3558  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3559  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3560  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3561  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3562  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3563  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3564  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3565  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3566  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3567  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3568  			#address-cells = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3569  			#size-cells = <0>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3570  			#sound-dai-cells = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3571  			status = "disabled";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3572  		};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3573  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3574  		lpass_rxmacro: codec@6ac0000 {
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3575  			compatible = "qcom,x1e80100-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3576  			reg = <0 0x06ac0000 0 0x1000>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3577  			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3578  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3579  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3580  				 <&lpass_vamacro>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3581  			clock-names = "mclk",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3582  				      "macro",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3583  				      "dcodec",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3584  				      "fsgen";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3585  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3586  			#clock-cells = <0>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3587  			clock-output-names = "mclk";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3588  			#sound-dai-cells = <1>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3589  		};
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3590  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3591  		swr1: soundwire@6ad0000 {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3592  			compatible = "qcom,soundwire-v2.0.0";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3593  			reg = <0 0x06ad0000 0 0x10000>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3594  			clocks = <&lpass_rxmacro>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3595  			clock-names = "iface";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3596  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3597  			label = "RX";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3598  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3599  			pinctrl-0 = <&rx_swr_active>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3600  			pinctrl-names = "default";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3601  
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3602  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3603  			reset-names = "swr_audio_cgcr";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3604  			qcom,din-ports = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3605  			qcom,dout-ports = <11>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3606  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3607  			qcom,ports-sinterval =		/bits/ 16 <0x03 0x1f 0x1f 0x07 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3608  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3609  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3610  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3611  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0x0f 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3612  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
d4fac32cbe9504 Krzysztof Kozlowski 2024-02-27  3613  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0x01 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3614  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3615  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3616  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3617  			#address-cells = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3618  			#size-cells = <0>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3619  			#sound-dai-cells = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3620  			status = "disabled";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3621  		};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3622  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3623  		lpass_txmacro: codec@6ae0000 {
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3624  			compatible = "qcom,x1e80100-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3625  			reg = <0 0x06ae0000 0 0x1000>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3626  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3627  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3628  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3629  				 <&lpass_vamacro>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3630  			clock-names = "mclk",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3631  				      "macro",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3632  				      "dcodec",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3633  				      "fsgen";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3634  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3635  			#clock-cells = <0>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3636  			clock-output-names = "mclk";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3637  			#sound-dai-cells = <1>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3638  		};
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3639  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3640  		lpass_wsamacro: codec@6b00000 {
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3641  			compatible = "qcom,x1e80100-lpass-wsa-macro", "qcom,sm8550-lpass-wsa-macro";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3642  			reg = <0 0x06b00000 0 0x1000>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3643  			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3644  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3645  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3646  				 <&lpass_vamacro>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3647  			clock-names = "mclk",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3648  				      "macro",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3649  				      "dcodec",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3650  				      "fsgen";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3651  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3652  			#clock-cells = <0>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3653  			clock-output-names = "mclk";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3654  			#sound-dai-cells = <1>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3655  			sound-name-prefix = "WSA";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3656  		};
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3657  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3658  		swr0: soundwire@6b10000 {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3659  			compatible = "qcom,soundwire-v2.0.0";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3660  			reg = <0 0x06b10000 0 0x10000>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3661  			clocks = <&lpass_wsamacro>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3662  			clock-names = "iface";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3663  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3664  			label = "WSA";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3665  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3666  			pinctrl-0 = <&wsa_swr_active>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3667  			pinctrl-names = "default";
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3668  			resets = <&lpass_audiocc LPASS_AUDIO_SWR_WSA_CGCR>;
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3669  			reset-names = "swr_audio_cgcr";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3670  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3671  			qcom,din-ports = <4>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3672  			qcom,dout-ports = <9>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3673  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3674  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0xc8 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3675  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3676  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3677  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3678  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3679  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3680  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3681  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3682  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3683  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3684  			#address-cells = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3685  			#size-cells = <0>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3686  			#sound-dai-cells = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3687  			status = "disabled";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3688  		};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3689  
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3690  		lpass_audiocc: clock-controller@6b6c000 {
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3691  			compatible = "qcom,x1e80100-lpassaudiocc", "qcom,sc8280xp-lpassaudiocc";
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3692  			reg = <0 0x06b6c000 0 0x1000>;
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3693  			#clock-cells = <1>;
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3694  			#reset-cells = <1>;
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3695  		};
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3696  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3697  		swr2: soundwire@6d30000 {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3698  			compatible = "qcom,soundwire-v2.0.0";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3699  			reg = <0 0x06d30000 0 0x10000>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3700  			clocks = <&lpass_txmacro>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3701  			clock-names = "iface";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3702  			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3703  				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3704  			interrupt-names = "core", "wakeup";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3705  			label = "TX";
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3706  			resets = <&lpasscc LPASS_AUDIO_SWR_TX_CGCR>;
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3707  			reset-names = "swr_audio_cgcr";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3708  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3709  			pinctrl-0 = <&tx_swr_active>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3710  			pinctrl-names = "default";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3711  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3712  			qcom,din-ports = <4>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3713  			qcom,dout-ports = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3714  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3715  			qcom,ports-sinterval-low =	/bits/ 8 <0x00 0x01 0x03 0x03 0x00>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3716  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x01 0x02 0x00 0x00>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3717  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3718  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3719  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3720  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3721  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3722  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3723  			qcom,ports-lane-control =	/bits/ 8 <0xff 0x00 0x00 0x01 0xff>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3724  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3725  			#address-cells = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3726  			#size-cells = <0>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3727  			#sound-dai-cells = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3728  			status = "disabled";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3729  		};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3730  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3731  		lpass_vamacro: codec@6d44000 {
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3732  			compatible = "qcom,x1e80100-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3733  			reg = <0 0x06d44000 0 0x1000>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3734  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3735  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3736  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3737  			clock-names = "mclk",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3738  				      "macro",
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3739  				      "dcodec";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3740  
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3741  			#clock-cells = <0>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3742  			clock-output-names = "fsgen";
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3743  			#sound-dai-cells = <1>;
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3744  		};
c6d6df1703d47c Krzysztof Kozlowski 2023-12-14  3745  
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3746  		lpass_tlmm: pinctrl@6e80000 {
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3747  			compatible = "qcom,x1e80100-lpass-lpi-pinctrl", "qcom,sm8550-lpass-lpi-pinctrl";
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3748  			reg = <0 0x06e80000 0 0x20000>,
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3749  			      <0 0x07250000 0 0x10000>;
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3750  
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3751  			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3752  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3753  			clock-names = "core", "audio";
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3754  
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3755  			gpio-controller;
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3756  			#gpio-cells = <2>;
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3757  			gpio-ranges = <&lpass_tlmm 0 0 23>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3758  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3759  			tx_swr_active: tx-swr-active-state {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3760  				clk-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3761  					pins = "gpio0";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3762  					function = "swr_tx_clk";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3763  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3764  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3765  					bias-disable;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3766  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3767  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3768  				data-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3769  					pins = "gpio1", "gpio2";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3770  					function = "swr_tx_data";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3771  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3772  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3773  					bias-bus-hold;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3774  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3775  			};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3776  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3777  			rx_swr_active: rx-swr-active-state {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3778  				clk-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3779  					pins = "gpio3";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3780  					function = "swr_rx_clk";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3781  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3782  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3783  					bias-disable;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3784  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3785  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3786  				data-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3787  					pins = "gpio4", "gpio5";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3788  					function = "swr_rx_data";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3789  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3790  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3791  					bias-bus-hold;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3792  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3793  			};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3794  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3795  			dmic01_default: dmic01-default-state {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3796  				clk-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3797  					pins = "gpio6";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3798  					function = "dmic1_clk";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3799  					drive-strength = <8>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3800  					output-high;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3801  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3802  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3803  				data-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3804  					pins = "gpio7";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3805  					function = "dmic1_data";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3806  					drive-strength = <8>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3807  					input-enable;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3808  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3809  			};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3810  
8794916799d61f Krzysztof Kozlowski 2024-02-12  3811  			dmic23_default: dmic23-default-state {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3812  				clk-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3813  					pins = "gpio8";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3814  					function = "dmic2_clk";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3815  					drive-strength = <8>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3816  					output-high;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3817  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3818  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3819  				data-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3820  					pins = "gpio9";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3821  					function = "dmic2_data";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3822  					drive-strength = <8>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3823  					input-enable;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3824  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3825  			};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3826  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3827  			wsa_swr_active: wsa-swr-active-state {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3828  				clk-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3829  					pins = "gpio10";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3830  					function = "wsa_swr_clk";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3831  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3832  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3833  					bias-disable;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3834  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3835  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3836  				data-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3837  					pins = "gpio11";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3838  					function = "wsa_swr_data";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3839  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3840  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3841  					bias-bus-hold;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3842  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3843  			};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3844  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3845  			wsa2_swr_active: wsa2-swr-active-state {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3846  				clk-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3847  					pins = "gpio15";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3848  					function = "wsa2_swr_clk";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3849  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3850  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3851  					bias-disable;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3852  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3853  
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3854  				data-pins {
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3855  					pins = "gpio16";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3856  					function = "wsa2_swr_data";
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3857  					drive-strength = <2>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3858  					slew-rate = <1>;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3859  					bias-bus-hold;
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3860  				};
641a7e7e97b6cf Krzysztof Kozlowski 2023-12-14  3861  			};
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3862  		};
060df4cbfe111d Krzysztof Kozlowski 2023-12-12  3863  
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3864  		lpasscc: clock-controller@6ea0000 {
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3865  			compatible = "qcom,x1e80100-lpasscc", "qcom,sc8280xp-lpasscc";
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3866  			reg = <0 0x06ea0000 0 0x12000>;
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3867  			#clock-cells = <1>;
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3868  			#reset-cells = <1>;
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3869  		};
8c7dbbed27723c Srinivas Kandagatla 2024-06-24  3870  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3871  		lpass_ag_noc: interconnect@7e40000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  3872  			compatible = "qcom,x1e80100-lpass-ag-noc";
27302c7d859099 Konrad Dybcio       2024-07-11  3873  			reg = <0 0x07e40000 0 0xe080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3874  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3875  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3876  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3877  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3878  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  3879  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3880  		lpass_lpiaon_noc: interconnect@7400000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  3881  			compatible = "qcom,x1e80100-lpass-lpiaon-noc";
27302c7d859099 Konrad Dybcio       2024-07-11  3882  			reg = <0 0x07400000 0 0x19080>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3883  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3884  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3885  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3886  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3887  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  3888  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3889  		lpass_lpicx_noc: interconnect@7430000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  3890  			compatible = "qcom,x1e80100-lpass-lpicx-noc";
27302c7d859099 Konrad Dybcio       2024-07-11  3891  			reg = <0 0x07430000 0 0x3A200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3892  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3893  			qcom,bcm-voters = <&apps_bcm_voter>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3894  
af16b00578a7a1 Rajendra Nayak      2023-12-05  3895  			#interconnect-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  3896  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  3897  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3898  		usb_2_hsphy: phy@88e0000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  3899  			compatible = "qcom,x1e80100-snps-eusb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  3900  				     "qcom,sm8550-snps-eusb2-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3901  			reg = <0 0x088e0000 0 0x154>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3902  			#phy-cells = <0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3903  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3904  			clocks = <&tcsr TCSR_USB2_2_CLKREF_EN>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3905  			clock-names = "ref";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3906  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3907  			resets = <&gcc GCC_QUSB2PHY_USB20_HS_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3908  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3909  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3910  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  3911  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3912  		usb_mp_hsphy0: phy@88e1000 {
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3913  			compatible = "qcom,x1e80100-snps-eusb2-phy",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3914  				     "qcom,sm8550-snps-eusb2-phy";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3915  			reg = <0 0x088e1000 0 0x154>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3916  			#phy-cells = <0>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3917  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3918  			clocks = <&tcsr TCSR_USB3_MP0_CLKREF_EN>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3919  			clock-names = "ref";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3920  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3921  			resets = <&gcc GCC_QUSB2PHY_HS0_MP_BCR>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3922  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3923  			status = "disabled";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3924  		};
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3925  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3926  		usb_mp_hsphy1: phy@88e2000 {
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3927  			compatible = "qcom,x1e80100-snps-eusb2-phy",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3928  				     "qcom,sm8550-snps-eusb2-phy";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3929  			reg = <0 0x088e2000 0 0x154>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3930  			#phy-cells = <0>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3931  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3932  			clocks = <&tcsr TCSR_USB3_MP1_CLKREF_EN>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3933  			clock-names = "ref";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3934  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3935  			resets = <&gcc GCC_QUSB2PHY_HS1_MP_BCR>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3936  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3937  			status = "disabled";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3938  		};
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3939  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3940  		usb_mp_qmpphy0: phy@88e3000 {
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3941  			compatible = "qcom,x1e80100-qmp-usb3-uni-phy";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3942  			reg = <0 0x088e3000 0 0x2000>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3943  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3944  			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3945  				 <&rpmhcc RPMH_CXO_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3946  				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3947  				 <&gcc GCC_USB3_MP_PHY_PIPE_0_CLK>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3948  			clock-names = "aux",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3949  				      "ref",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3950  				      "com_aux",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3951  				      "pipe";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3952  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3953  			resets = <&gcc GCC_USB3_UNIPHY_MP0_BCR>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3954  				 <&gcc GCC_USB3UNIPHY_PHY_MP0_BCR>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3955  			reset-names = "phy",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3956  				      "phy_phy";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3957  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3958  			power-domains = <&gcc GCC_USB3_MP_SS0_PHY_GDSC>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3959  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3960  			#clock-cells = <0>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3961  			clock-output-names = "usb_mp_phy0_pipe_clk";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3962  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3963  			#phy-cells = <0>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3964  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3965  			status = "disabled";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3966  		};
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3967  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3968  		usb_mp_qmpphy1: phy@88e5000 {
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3969  			compatible = "qcom,x1e80100-qmp-usb3-uni-phy";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3970  			reg = <0 0x088e5000 0 0x2000>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3971  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3972  			clocks = <&gcc GCC_USB3_MP_PHY_AUX_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3973  				 <&rpmhcc RPMH_CXO_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3974  				 <&gcc GCC_USB3_MP_PHY_COM_AUX_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3975  				 <&gcc GCC_USB3_MP_PHY_PIPE_1_CLK>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3976  			clock-names = "aux",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3977  				      "ref",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3978  				      "com_aux",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3979  				      "pipe";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3980  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3981  			resets = <&gcc GCC_USB3_UNIPHY_MP1_BCR>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3982  				 <&gcc GCC_USB3UNIPHY_PHY_MP1_BCR>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3983  			reset-names = "phy",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3984  				      "phy_phy";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3985  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3986  			power-domains = <&gcc GCC_USB3_MP_SS1_PHY_GDSC>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3987  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3988  			#clock-cells = <0>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3989  			clock-output-names = "usb_mp_phy1_pipe_clk";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3990  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3991  			#phy-cells = <0>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3992  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3993  			status = "disabled";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3994  		};
5c5edbf46177e6 Konrad Dybcio       2024-08-20  3995  
4af46b7bd66fa3 Abel Vesa           2024-01-29  3996  		usb_1_ss2: usb@a0f8800 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  3997  			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  3998  			reg = <0 0x0a0f8800 0 0x400>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  3999  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4000  			clocks = <&gcc GCC_CFG_NOC_USB3_TERT_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4001  				 <&gcc GCC_USB30_TERT_MASTER_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4002  				 <&gcc GCC_AGGRE_USB3_TERT_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4003  				 <&gcc GCC_USB30_TERT_SLEEP_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4004  				 <&gcc GCC_USB30_TERT_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4005  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4006  				 <&gcc GCC_AGGRE_NOC_USB_NORTH_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4007  				 <&gcc GCC_AGGRE_NOC_USB_SOUTH_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4008  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4009  			clock-names = "cfg_noc",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4010  				      "core",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4011  				      "iface",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4012  				      "sleep",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4013  				      "mock_utmi",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4014  				      "noc_aggr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4015  				      "noc_aggr_north",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4016  				      "noc_aggr_south",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4017  				      "noc_sys";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4018  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4019  			assigned-clocks = <&gcc GCC_USB30_TERT_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4020  					  <&gcc GCC_USB30_TERT_MASTER_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4021  			assigned-clock-rates = <19200000>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4022  					       <200000000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4023  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4024  			interrupts-extended = <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4025  					      <&pdc 58 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4026  					      <&pdc 57 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4027  					      <&pdc 10 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4028  			interrupt-names = "pwr_event",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4029  					  "dp_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4030  					  "dm_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4031  					  "ss_phy_irq";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4032  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4033  			power-domains = <&gcc GCC_USB30_TERT_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4034  			required-opps = <&rpmhpd_opp_nom>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4035  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4036  			resets = <&gcc GCC_USB30_TERT_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4037  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4038  			interconnects = <&usb_south_anoc MASTER_USB3_2 QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3 Abel Vesa           2024-01-29  4039  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4040  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3 Abel Vesa           2024-01-29  4041  					 &config_noc SLAVE_USB3_2 QCOM_ICC_TAG_ALWAYS>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4042  			interconnect-names = "usb-ddr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4043  					     "apps-usb";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4044  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4045  			wakeup-source;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4046  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4047  			#address-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4048  			#size-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4049  			ranges;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4050  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4051  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4052  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4053  			usb_1_ss2_dwc3: usb@a000000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  4054  				compatible = "snps,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4055  				reg = <0 0x0a000000 0 0xcd00>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4056  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4057  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4058  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4059  				iommus = <&apps_smmu 0x14a0 0x0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4060  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4061  				phys = <&usb_1_ss2_hsphy>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4062  				       <&usb_1_ss2_qmpphy QMP_USB43DP_USB3_PHY>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4063  				phy-names = "usb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4064  				            "usb3-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4065  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4066  				snps,dis_u2_susphy_quirk;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4067  				snps,dis_enblslpm_quirk;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4068  				snps,usb3_lpm_capable;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4069  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4070  				dma-coherent;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4071  
f042bc234c2e00 Jonathan Marek      2024-10-11  4072  				usb-role-switch;
f042bc234c2e00 Jonathan Marek      2024-10-11  4073  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4074  				ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4075  					#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4076  					#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4077  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4078  					port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4079  						reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4080  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4081  						usb_1_ss2_dwc3_hs: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4082  						};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4083  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4084  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4085  					port@1 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4086  						reg = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4087  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4088  						usb_1_ss2_dwc3_ss: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4089  							remote-endpoint = <&usb_1_ss2_qmpphy_usb_ss_in>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4090  						};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4091  					};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4092  				};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4093  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4094  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4095  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4096  		usb_2: usb@a2f8800 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  4097  			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4098  			reg = <0 0x0a2f8800 0 0x400>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4099  			#address-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4100  			#size-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4101  			ranges;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4102  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4103  			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4104  				 <&gcc GCC_USB20_MASTER_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4105  				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4106  				 <&gcc GCC_USB20_SLEEP_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4107  				 <&gcc GCC_USB20_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4108  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4109  				 <&gcc GCC_AGGRE_NOC_USB_NORTH_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4110  				 <&gcc GCC_AGGRE_NOC_USB_SOUTH_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4111  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4112  			clock-names = "cfg_noc",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4113  				      "core",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4114  				      "iface",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4115  				      "sleep",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4116  				      "mock_utmi",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4117  				      "noc_aggr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4118  				      "noc_aggr_north",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4119  				      "noc_aggr_south",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4120  				      "noc_sys";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4121  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4122  			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4123  					  <&gcc GCC_USB20_MASTER_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4124  			assigned-clock-rates = <19200000>, <200000000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4125  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4126  			interrupts-extended = <&intc GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4127  					      <&pdc 50 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4128  					      <&pdc 49 IRQ_TYPE_EDGE_BOTH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4129  			interrupt-names = "pwr_event",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4130  					  "dp_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4131  					  "dm_hs_phy_irq";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4132  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4133  			power-domains = <&gcc GCC_USB20_PRIM_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4134  			required-opps = <&rpmhpd_opp_nom>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4135  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4136  			resets = <&gcc GCC_USB20_PRIM_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4137  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4138  			interconnects = <&usb_north_anoc MASTER_USB2 QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3 Abel Vesa           2024-01-29  4139  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4140  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3 Abel Vesa           2024-01-29  4141  					 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ALWAYS>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4142  			interconnect-names = "usb-ddr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4143  					     "apps-usb";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4144  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4145  			wakeup-source;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4146  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4147  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4148  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4149  			usb_2_dwc3: usb@a200000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  4150  				compatible = "snps,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4151  				reg = <0 0x0a200000 0 0xcd00>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4152  				interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4153  				iommus = <&apps_smmu 0x14e0 0x0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4154  				phys = <&usb_2_hsphy>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4155  				phy-names = "usb2-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4156  				maximum-speed = "high-speed";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4157  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4158  				ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4159  					#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4160  					#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4161  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4162  					port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4163  						reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4164  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4165  						usb_2_dwc3_hs: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4166  						};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4167  					};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4168  				};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4169  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4170  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4171  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4172  		usb_mp: usb@a4f8800 {
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4173  			compatible = "qcom,x1e80100-dwc3-mp", "qcom,dwc3";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4174  			reg = <0 0x0a4f8800 0 0x400>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4175  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4176  			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4177  				 <&gcc GCC_USB30_MP_MASTER_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4178  				 <&gcc GCC_AGGRE_USB3_MP_AXI_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4179  				 <&gcc GCC_USB30_MP_SLEEP_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4180  				 <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4181  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4182  				 <&gcc GCC_AGGRE_NOC_USB_NORTH_AXI_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4183  				 <&gcc GCC_AGGRE_NOC_USB_SOUTH_AXI_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4184  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4185  			clock-names = "cfg_noc",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4186  				      "core",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4187  				      "iface",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4188  				      "sleep",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4189  				      "mock_utmi",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4190  				      "noc_aggr",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4191  				      "noc_aggr_north",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4192  				      "noc_aggr_south",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4193  				      "noc_sys";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4194  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4195  			assigned-clocks = <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4196  					  <&gcc GCC_USB30_MP_MASTER_CLK>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4197  			assigned-clock-rates = <19200000>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4198  					       <200000000>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4199  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4200  			interrupts-extended = <&intc GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4201  					      <&intc GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4202  					      <&intc GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4203  					      <&intc GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4204  					      <&pdc 52 IRQ_TYPE_EDGE_BOTH>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4205  					      <&pdc 51 IRQ_TYPE_EDGE_BOTH>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4206  					      <&pdc 54 IRQ_TYPE_EDGE_BOTH>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4207  					      <&pdc 53 IRQ_TYPE_EDGE_BOTH>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4208  					      <&pdc 55 IRQ_TYPE_LEVEL_HIGH>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4209  					      <&pdc 56 IRQ_TYPE_LEVEL_HIGH>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4210  			interrupt-names = "pwr_event_1", "pwr_event_2",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4211  					  "hs_phy_1",	 "hs_phy_2",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4212  					  "dp_hs_phy_1", "dm_hs_phy_1",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4213  					  "dp_hs_phy_2", "dm_hs_phy_2",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4214  					  "ss_phy_1",	 "ss_phy_2";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4215  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4216  			power-domains = <&gcc GCC_USB30_MP_GDSC>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4217  			required-opps = <&rpmhpd_opp_nom>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4218  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4219  			resets = <&gcc GCC_USB30_MP_BCR>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4220  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4221  			interconnects = <&usb_north_anoc MASTER_USB3_MP QCOM_ICC_TAG_ALWAYS
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4222  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4223  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4224  					 &config_noc SLAVE_USB3_MP QCOM_ICC_TAG_ALWAYS>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4225  			interconnect-names = "usb-ddr",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4226  					     "apps-usb";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4227  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4228  			wakeup-source;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4229  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4230  			#address-cells = <2>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4231  			#size-cells = <2>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4232  			ranges;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4233  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4234  			status = "disabled";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4235  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4236  			usb_mp_dwc3: usb@a400000 {
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4237  				compatible = "snps,dwc3";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4238  				reg = <0 0x0a400000 0 0xcd00>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4239  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4240  				interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4241  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4242  				iommus = <&apps_smmu 0x1400 0x0>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4243  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4244  				phys = <&usb_mp_hsphy0>, <&usb_mp_qmpphy0>,
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4245  				       <&usb_mp_hsphy1>, <&usb_mp_qmpphy1>;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4246  				phy-names = "usb2-0", "usb3-0",
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4247  					    "usb2-1", "usb3-1";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4248  				dr_mode = "host";
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4249  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4250  				snps,dis_u2_susphy_quirk;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4251  				snps,dis_enblslpm_quirk;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4252  				snps,usb3_lpm_capable;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4253  
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4254  				dma-coherent;
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4255  			};
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4256  		};
5c5edbf46177e6 Konrad Dybcio       2024-08-20  4257  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4258  		usb_1_ss0: usb@a6f8800 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  4259  			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4260  			reg = <0 0x0a6f8800 0 0x400>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4261  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4262  			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4263  				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4264  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4265  				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4266  				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4267  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4268  				 <&gcc GCC_CFG_NOC_USB_ANOC_NORTH_AHB_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4269  				 <&gcc GCC_CFG_NOC_USB_ANOC_SOUTH_AHB_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4270  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4271  			clock-names = "cfg_noc",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4272  				      "core",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4273  				      "iface",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4274  				      "sleep",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4275  				      "mock_utmi",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4276  				      "noc_aggr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4277  				      "noc_aggr_north",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4278  				      "noc_aggr_south",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4279  				      "noc_sys";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4280  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4281  			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4282  					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4283  			assigned-clock-rates = <19200000>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4284  					       <200000000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4285  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4286  			interrupts-extended = <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4287  					      <&pdc 61 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4288  					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4289  					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4290  			interrupt-names = "pwr_event",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4291  					  "dp_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4292  					  "dm_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4293  					  "ss_phy_irq";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4294  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4295  			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4296  			required-opps = <&rpmhpd_opp_nom>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4297  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4298  			resets = <&gcc GCC_USB30_PRIM_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4299  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4300  			wakeup-source;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4301  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4302  			#address-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4303  			#size-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4304  			ranges;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4305  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4306  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4307  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4308  			usb_1_ss0_dwc3: usb@a600000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  4309  				compatible = "snps,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4310  				reg = <0 0x0a600000 0 0xcd00>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4311  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4312  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4313  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4314  				iommus = <&apps_smmu 0x1420 0x0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4315  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4316  				phys = <&usb_1_ss0_hsphy>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4317  				       <&usb_1_ss0_qmpphy QMP_USB43DP_USB3_PHY>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4318  				phy-names = "usb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4319  					    "usb3-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4320  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4321  				snps,dis_u2_susphy_quirk;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4322  				snps,dis_enblslpm_quirk;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4323  				snps,usb3_lpm_capable;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4324  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4325  				dma-coherent;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4326  
f042bc234c2e00 Jonathan Marek      2024-10-11  4327  				usb-role-switch;
f042bc234c2e00 Jonathan Marek      2024-10-11  4328  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4329  				ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4330  					#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4331  					#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4332  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4333  					port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4334  						reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4335  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4336  						usb_1_ss0_dwc3_hs: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4337  						};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4338  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4339  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4340  					port@1 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4341  						reg = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4342  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4343  						usb_1_ss0_dwc3_ss: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4344  							remote-endpoint = <&usb_1_ss0_qmpphy_usb_ss_in>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4345  						};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4346  					};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4347  				};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4348  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4349  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4350  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4351  		usb_1_ss1: usb@a8f8800 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  4352  			compatible = "qcom,x1e80100-dwc3", "qcom,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4353  			reg = <0 0x0a8f8800 0 0x400>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4354  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4355  			clocks = <&gcc GCC_CFG_NOC_USB3_SEC_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4356  				 <&gcc GCC_USB30_SEC_MASTER_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4357  				 <&gcc GCC_AGGRE_USB3_SEC_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4358  				 <&gcc GCC_USB30_SEC_SLEEP_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4359  				 <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4360  				 <&gcc GCC_AGGRE_USB_NOC_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4361  				 <&gcc GCC_AGGRE_NOC_USB_NORTH_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4362  				 <&gcc GCC_AGGRE_NOC_USB_SOUTH_AXI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4363  				 <&gcc GCC_SYS_NOC_USB_AXI_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4364  			clock-names = "cfg_noc",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4365  				      "core",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4366  				      "iface",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4367  				      "sleep",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4368  				      "mock_utmi",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4369  				      "noc_aggr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4370  				      "noc_aggr_north",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4371  				      "noc_aggr_south",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4372  				      "noc_sys";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4373  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4374  			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4375  					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4376  			assigned-clock-rates = <19200000>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4377  					       <200000000>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4378  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4379  			interrupts-extended = <&intc GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4380  					      <&pdc 60 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4381  					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4382  					      <&pdc 47 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4383  			interrupt-names = "pwr_event",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4384  					  "dp_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4385  					  "dm_hs_phy_irq",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4386  					  "ss_phy_irq";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4387  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4388  			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4389  			required-opps = <&rpmhpd_opp_nom>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4390  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4391  			resets = <&gcc GCC_USB30_SEC_BCR>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4392  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4393  			interconnects = <&usb_south_anoc MASTER_USB3_1 QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3 Abel Vesa           2024-01-29  4394  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4395  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
4af46b7bd66fa3 Abel Vesa           2024-01-29  4396  					 &config_noc SLAVE_USB3_1 QCOM_ICC_TAG_ALWAYS>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4397  			interconnect-names = "usb-ddr",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4398  					     "apps-usb";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4399  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4400  			wakeup-source;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4401  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4402  			#address-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4403  			#size-cells = <2>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4404  			ranges;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4405  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4406  			status = "disabled";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4407  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4408  			usb_1_ss1_dwc3: usb@a800000 {
4af46b7bd66fa3 Abel Vesa           2024-01-29  4409  				compatible = "snps,dwc3";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4410  				reg = <0 0x0a800000 0 0xcd00>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4411  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4412  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4413  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4414  				iommus = <&apps_smmu 0x1460 0x0>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4415  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4416  				phys = <&usb_1_ss1_hsphy>,
4af46b7bd66fa3 Abel Vesa           2024-01-29  4417  				       <&usb_1_ss1_qmpphy QMP_USB43DP_USB3_PHY>;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4418  				phy-names = "usb2-phy",
4af46b7bd66fa3 Abel Vesa           2024-01-29  4419  					    "usb3-phy";
4af46b7bd66fa3 Abel Vesa           2024-01-29  4420  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4421  				snps,dis_u2_susphy_quirk;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4422  				snps,dis_enblslpm_quirk;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4423  				snps,usb3_lpm_capable;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4424  
4af46b7bd66fa3 Abel Vesa           2024-01-29  4425  				dma-coherent;
4af46b7bd66fa3 Abel Vesa           2024-01-29  4426  
f042bc234c2e00 Jonathan Marek      2024-10-11  4427  				usb-role-switch;
f042bc234c2e00 Jonathan Marek      2024-10-11  4428  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4429  				ports {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4430  					#address-cells = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4431  					#size-cells = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4432  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4433  					port@0 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4434  						reg = <0>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4435  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4436  						usb_1_ss1_dwc3_hs: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4437  						};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4438  					};
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4439  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4440  					port@1 {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4441  						reg = <1>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4442  
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4443  						usb_1_ss1_dwc3_ss: endpoint {
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4444  							remote-endpoint = <&usb_1_ss1_qmpphy_usb_ss_in>;
b73ed308f9f694 Dmitry Baryshkov    2024-05-12  4445  						};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4446  					};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4447  				};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4448  			};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4449  		};
4af46b7bd66fa3 Abel Vesa           2024-01-29  4450  
1940c25eaa63f6 Abel Vesa           2024-01-29  4451  		mdss: display-subsystem@ae00000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4452  			compatible = "qcom,x1e80100-mdss";
1940c25eaa63f6 Abel Vesa           2024-01-29  4453  			reg = <0 0x0ae00000 0 0x1000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4454  			reg-names = "mdss";
1940c25eaa63f6 Abel Vesa           2024-01-29  4455  
1940c25eaa63f6 Abel Vesa           2024-01-29  4456  			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4457  
1940c25eaa63f6 Abel Vesa           2024-01-29  4458  			clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4459  				 <&gcc GCC_DISP_HF_AXI_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4460  				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4461  
1940c25eaa63f6 Abel Vesa           2024-01-29  4462  			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4463  
1940c25eaa63f6 Abel Vesa           2024-01-29  4464  			interconnects = <&mmss_noc MASTER_MDP QCOM_ICC_TAG_ALWAYS
1940c25eaa63f6 Abel Vesa           2024-01-29  4465  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ALWAYS>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4466  					<&mc_virt MASTER_LLCC QCOM_ICC_TAG_ALWAYS
1940c25eaa63f6 Abel Vesa           2024-01-29  4467  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4468  					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
1940c25eaa63f6 Abel Vesa           2024-01-29  4469  					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4470  			interconnect-names = "mdp0-mem",
1940c25eaa63f6 Abel Vesa           2024-01-29  4471  					     "mdp1-mem",
1940c25eaa63f6 Abel Vesa           2024-01-29  4472  					     "cpu-cfg";
1940c25eaa63f6 Abel Vesa           2024-01-29  4473  
1940c25eaa63f6 Abel Vesa           2024-01-29  4474  			power-domains = <&dispcc MDSS_GDSC>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4475  
1940c25eaa63f6 Abel Vesa           2024-01-29  4476  			iommus = <&apps_smmu 0x1c00 0x2>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4477  
1940c25eaa63f6 Abel Vesa           2024-01-29  4478  			interrupt-controller;
1940c25eaa63f6 Abel Vesa           2024-01-29  4479  			#interrupt-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4480  
1940c25eaa63f6 Abel Vesa           2024-01-29  4481  			#address-cells = <2>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4482  			#size-cells = <2>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4483  			ranges;
1940c25eaa63f6 Abel Vesa           2024-01-29  4484  
1940c25eaa63f6 Abel Vesa           2024-01-29  4485  			status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4486  
1940c25eaa63f6 Abel Vesa           2024-01-29  4487  			mdss_mdp: display-controller@ae01000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4488  				compatible = "qcom,x1e80100-dpu";
1940c25eaa63f6 Abel Vesa           2024-01-29  4489  				reg = <0 0x0ae01000 0 0x8f000>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4490  				      <0 0x0aeb0000 0 0x2008>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4491  				reg-names = "mdp",
1940c25eaa63f6 Abel Vesa           2024-01-29  4492  					    "vbif";
1940c25eaa63f6 Abel Vesa           2024-01-29  4493  
1940c25eaa63f6 Abel Vesa           2024-01-29  4494  				interrupts-extended = <&mdss 0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4495  
1940c25eaa63f6 Abel Vesa           2024-01-29  4496  				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4497  					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4498  					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4499  					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4500  					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4501  				clock-names = "nrt_bus",
1940c25eaa63f6 Abel Vesa           2024-01-29  4502  					      "iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4503  					      "lut",
1940c25eaa63f6 Abel Vesa           2024-01-29  4504  					      "core",
1940c25eaa63f6 Abel Vesa           2024-01-29  4505  					      "vsync";
1940c25eaa63f6 Abel Vesa           2024-01-29  4506  
1940c25eaa63f6 Abel Vesa           2024-01-29  4507  				operating-points-v2 = <&mdp_opp_table>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4508  
1940c25eaa63f6 Abel Vesa           2024-01-29  4509  				power-domains = <&rpmhpd RPMHPD_MMCX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4510  
1940c25eaa63f6 Abel Vesa           2024-01-29  4511  				ports {
1940c25eaa63f6 Abel Vesa           2024-01-29  4512  					#address-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4513  					#size-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4514  
1940c25eaa63f6 Abel Vesa           2024-01-29  4515  					port@0 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4516  						reg = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4517  
1940c25eaa63f6 Abel Vesa           2024-01-29  4518  						mdss_intf0_out: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4519  							remote-endpoint = <&mdss_dp0_in>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4520  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4521  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4522  
1940c25eaa63f6 Abel Vesa           2024-01-29  4523  					port@4 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4524  						reg = <4>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4525  
1940c25eaa63f6 Abel Vesa           2024-01-29  4526  						mdss_intf4_out: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4527  							remote-endpoint = <&mdss_dp1_in>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4528  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4529  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4530  
1940c25eaa63f6 Abel Vesa           2024-01-29  4531  					port@5 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4532  						reg = <5>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4533  
1940c25eaa63f6 Abel Vesa           2024-01-29  4534  						mdss_intf5_out: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4535  							remote-endpoint = <&mdss_dp3_in>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4536  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4537  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4538  
1940c25eaa63f6 Abel Vesa           2024-01-29  4539  					port@6 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4540  						reg = <6>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4541  
1940c25eaa63f6 Abel Vesa           2024-01-29  4542  						mdss_intf6_out: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4543  							remote-endpoint = <&mdss_dp2_in>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4544  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4545  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4546  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4547  
1940c25eaa63f6 Abel Vesa           2024-01-29  4548  				mdp_opp_table: opp-table {
1940c25eaa63f6 Abel Vesa           2024-01-29  4549  					compatible = "operating-points-v2";
1940c25eaa63f6 Abel Vesa           2024-01-29  4550  
1940c25eaa63f6 Abel Vesa           2024-01-29  4551  					opp-200000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4552  						opp-hz = /bits/ 64 <200000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4553  						required-opps = <&rpmhpd_opp_low_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4554  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4555  
1940c25eaa63f6 Abel Vesa           2024-01-29  4556  					opp-325000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4557  						opp-hz = /bits/ 64 <325000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4558  						required-opps = <&rpmhpd_opp_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4559  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4560  
1940c25eaa63f6 Abel Vesa           2024-01-29  4561  					opp-375000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4562  						opp-hz = /bits/ 64 <375000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4563  						required-opps = <&rpmhpd_opp_svs_l1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4564  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4565  
1940c25eaa63f6 Abel Vesa           2024-01-29  4566  					opp-514000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4567  						opp-hz = /bits/ 64 <514000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4568  						required-opps = <&rpmhpd_opp_nom>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4569  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4570  
1940c25eaa63f6 Abel Vesa           2024-01-29  4571  					opp-575000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4572  						opp-hz = /bits/ 64 <575000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4573  						required-opps = <&rpmhpd_opp_nom_l1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4574  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4575  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4576  			};
1940c25eaa63f6 Abel Vesa           2024-01-29  4577  
1940c25eaa63f6 Abel Vesa           2024-01-29  4578  			mdss_dp0: displayport-controller@ae90000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4579  				compatible = "qcom,x1e80100-dp";
27302c7d859099 Konrad Dybcio       2024-07-11  4580  				reg = <0 0x0ae90000 0 0x200>,
27302c7d859099 Konrad Dybcio       2024-07-11  4581  				      <0 0x0ae90200 0 0x200>,
27302c7d859099 Konrad Dybcio       2024-07-11  4582  				      <0 0x0ae90400 0 0x600>,
27302c7d859099 Konrad Dybcio       2024-07-11  4583  				      <0 0x0ae91000 0 0x400>,
27302c7d859099 Konrad Dybcio       2024-07-11  4584  				      <0 0x0ae91400 0 0x400>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4585  
1940c25eaa63f6 Abel Vesa           2024-01-29  4586  				interrupts-extended = <&mdss 12>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4587  
1940c25eaa63f6 Abel Vesa           2024-01-29  4588  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4589  					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4590  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4591  					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4592  					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4593  				clock-names = "core_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4594  					      "core_aux",
1940c25eaa63f6 Abel Vesa           2024-01-29  4595  					      "ctrl_link",
1940c25eaa63f6 Abel Vesa           2024-01-29  4596  					      "ctrl_link_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4597  					      "stream_pixel";
1940c25eaa63f6 Abel Vesa           2024-01-29  4598  
1940c25eaa63f6 Abel Vesa           2024-01-29  4599  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4600  						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4601  				assigned-clock-parents = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4602  							 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4603  
1940c25eaa63f6 Abel Vesa           2024-01-29  4604  				operating-points-v2 = <&mdss_dp0_opp_table>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4605  
1940c25eaa63f6 Abel Vesa           2024-01-29  4606  				power-domains = <&rpmhpd RPMHPD_MMCX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4607  
1940c25eaa63f6 Abel Vesa           2024-01-29  4608  				phys = <&usb_1_ss0_qmpphy QMP_USB43DP_DP_PHY>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4609  				phy-names = "dp";
1940c25eaa63f6 Abel Vesa           2024-01-29  4610  
1940c25eaa63f6 Abel Vesa           2024-01-29  4611  				#sound-dai-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4612  
1940c25eaa63f6 Abel Vesa           2024-01-29  4613  				status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4614  
1940c25eaa63f6 Abel Vesa           2024-01-29  4615  				ports {
1940c25eaa63f6 Abel Vesa           2024-01-29  4616  					#address-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4617  					#size-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4618  
1940c25eaa63f6 Abel Vesa           2024-01-29  4619  					port@0 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4620  						reg = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4621  
1940c25eaa63f6 Abel Vesa           2024-01-29  4622  						mdss_dp0_in: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4623  							remote-endpoint = <&mdss_intf0_out>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4624  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4625  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4626  
1940c25eaa63f6 Abel Vesa           2024-01-29  4627  					port@1 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4628  						reg = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4629  
1940c25eaa63f6 Abel Vesa           2024-01-29  4630  						mdss_dp0_out: endpoint {
aa48a8a5d642b5 Abel Vesa           2024-06-06  4631  							remote-endpoint = <&usb_1_ss0_qmpphy_dp_in>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4632  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4633  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4634  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4635  
1940c25eaa63f6 Abel Vesa           2024-01-29  4636  				mdss_dp0_opp_table: opp-table {
1940c25eaa63f6 Abel Vesa           2024-01-29  4637  					compatible = "operating-points-v2";
1940c25eaa63f6 Abel Vesa           2024-01-29  4638  
1940c25eaa63f6 Abel Vesa           2024-01-29  4639  					opp-160000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4640  						opp-hz = /bits/ 64 <160000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4641  						required-opps = <&rpmhpd_opp_low_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4642  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4643  
1940c25eaa63f6 Abel Vesa           2024-01-29  4644  					opp-270000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4645  						opp-hz = /bits/ 64 <270000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4646  						required-opps = <&rpmhpd_opp_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4647  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4648  
1940c25eaa63f6 Abel Vesa           2024-01-29  4649  					opp-540000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4650  						opp-hz = /bits/ 64 <540000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4651  						required-opps = <&rpmhpd_opp_svs_l1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4652  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4653  
1940c25eaa63f6 Abel Vesa           2024-01-29  4654  					opp-810000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4655  						opp-hz = /bits/ 64 <810000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4656  						required-opps = <&rpmhpd_opp_nom>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4657  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4658  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4659  			};
1940c25eaa63f6 Abel Vesa           2024-01-29  4660  
1940c25eaa63f6 Abel Vesa           2024-01-29  4661  			mdss_dp1: displayport-controller@ae98000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4662  				compatible = "qcom,x1e80100-dp";
27302c7d859099 Konrad Dybcio       2024-07-11  4663  				reg = <0 0x0ae98000 0 0x200>,
27302c7d859099 Konrad Dybcio       2024-07-11  4664  				      <0 0x0ae98200 0 0x200>,
27302c7d859099 Konrad Dybcio       2024-07-11  4665  				      <0 0x0ae98400 0 0x600>,
27302c7d859099 Konrad Dybcio       2024-07-11  4666  				      <0 0x0ae99000 0 0x400>,
27302c7d859099 Konrad Dybcio       2024-07-11  4667  				      <0 0x0ae99400 0 0x400>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4668  
1940c25eaa63f6 Abel Vesa           2024-01-29  4669  				interrupts-extended = <&mdss 13>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4670  
1940c25eaa63f6 Abel Vesa           2024-01-29  4671  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4672  					 <&dispcc DISP_CC_MDSS_DPTX1_AUX_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4673  					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4674  					 <&dispcc DISP_CC_MDSS_DPTX1_LINK_INTF_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4675  					 <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4676  				clock-names = "core_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4677  					      "core_aux",
1940c25eaa63f6 Abel Vesa           2024-01-29  4678  					      "ctrl_link",
1940c25eaa63f6 Abel Vesa           2024-01-29  4679  					      "ctrl_link_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4680  					      "stream_pixel";
1940c25eaa63f6 Abel Vesa           2024-01-29  4681  
1940c25eaa63f6 Abel Vesa           2024-01-29  4682  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX1_LINK_CLK_SRC>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4683  						  <&dispcc DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4684  				assigned-clock-parents = <&usb_1_ss1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4685  							 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4686  
1940c25eaa63f6 Abel Vesa           2024-01-29  4687  				operating-points-v2 = <&mdss_dp1_opp_table>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4688  
1940c25eaa63f6 Abel Vesa           2024-01-29  4689  				power-domains = <&rpmhpd RPMHPD_MMCX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4690  
1940c25eaa63f6 Abel Vesa           2024-01-29  4691  				phys = <&usb_1_ss1_qmpphy QMP_USB43DP_DP_PHY>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4692  				phy-names = "dp";
1940c25eaa63f6 Abel Vesa           2024-01-29  4693  
1940c25eaa63f6 Abel Vesa           2024-01-29  4694  				#sound-dai-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4695  
1940c25eaa63f6 Abel Vesa           2024-01-29  4696  				status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4697  
1940c25eaa63f6 Abel Vesa           2024-01-29  4698  				ports {
1940c25eaa63f6 Abel Vesa           2024-01-29  4699  					#address-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4700  					#size-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4701  
1940c25eaa63f6 Abel Vesa           2024-01-29  4702  					port@0 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4703  						reg = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4704  
1940c25eaa63f6 Abel Vesa           2024-01-29  4705  						mdss_dp1_in: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4706  							remote-endpoint = <&mdss_intf4_out>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4707  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4708  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4709  
1940c25eaa63f6 Abel Vesa           2024-01-29  4710  					port@1 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4711  						reg = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4712  
1940c25eaa63f6 Abel Vesa           2024-01-29  4713  						mdss_dp1_out: endpoint {
aa48a8a5d642b5 Abel Vesa           2024-06-06  4714  							remote-endpoint = <&usb_1_ss1_qmpphy_dp_in>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4715  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4716  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4717  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4718  
1940c25eaa63f6 Abel Vesa           2024-01-29  4719  				mdss_dp1_opp_table: opp-table {
1940c25eaa63f6 Abel Vesa           2024-01-29  4720  					compatible = "operating-points-v2";
1940c25eaa63f6 Abel Vesa           2024-01-29  4721  
1940c25eaa63f6 Abel Vesa           2024-01-29  4722  					opp-160000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4723  						opp-hz = /bits/ 64 <160000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4724  						required-opps = <&rpmhpd_opp_low_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4725  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4726  
1940c25eaa63f6 Abel Vesa           2024-01-29  4727  					opp-270000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4728  						opp-hz = /bits/ 64 <270000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4729  						required-opps = <&rpmhpd_opp_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4730  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4731  
1940c25eaa63f6 Abel Vesa           2024-01-29  4732  					opp-540000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4733  						opp-hz = /bits/ 64 <540000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4734  						required-opps = <&rpmhpd_opp_svs_l1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4735  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4736  
1940c25eaa63f6 Abel Vesa           2024-01-29  4737  					opp-810000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4738  						opp-hz = /bits/ 64 <810000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4739  						required-opps = <&rpmhpd_opp_nom>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4740  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4741  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4742  			};
1940c25eaa63f6 Abel Vesa           2024-01-29  4743  
1940c25eaa63f6 Abel Vesa           2024-01-29  4744  			mdss_dp2: displayport-controller@ae9a000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4745  				compatible = "qcom,x1e80100-dp";
27302c7d859099 Konrad Dybcio       2024-07-11  4746  				reg = <0 0x0ae9a000 0 0x200>,
27302c7d859099 Konrad Dybcio       2024-07-11  4747  				      <0 0x0ae9a200 0 0x200>,
27302c7d859099 Konrad Dybcio       2024-07-11  4748  				      <0 0x0ae9a400 0 0x600>,
27302c7d859099 Konrad Dybcio       2024-07-11  4749  				      <0 0x0ae9b000 0 0x400>,
27302c7d859099 Konrad Dybcio       2024-07-11  4750  				      <0 0x0ae9b400 0 0x400>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4751  
1940c25eaa63f6 Abel Vesa           2024-01-29  4752  				interrupts-extended = <&mdss 14>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4753  
1940c25eaa63f6 Abel Vesa           2024-01-29  4754  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4755  					 <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4756  					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4757  					 <&dispcc DISP_CC_MDSS_DPTX2_LINK_INTF_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4758  					 <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4759  				clock-names = "core_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4760  					      "core_aux",
1940c25eaa63f6 Abel Vesa           2024-01-29  4761  					      "ctrl_link",
1940c25eaa63f6 Abel Vesa           2024-01-29  4762  					      "ctrl_link_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4763  					      "stream_pixel";
1940c25eaa63f6 Abel Vesa           2024-01-29  4764  
1940c25eaa63f6 Abel Vesa           2024-01-29  4765  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX2_LINK_CLK_SRC>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4766  						  <&dispcc DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC>;
ba728bda663b0e Abel Vesa           2024-08-29  4767  				assigned-clock-parents = <&usb_1_ss2_qmpphy QMP_USB43DP_DP_LINK_CLK>,
ba728bda663b0e Abel Vesa           2024-08-29  4768  							 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4769  
1940c25eaa63f6 Abel Vesa           2024-01-29  4770  				operating-points-v2 = <&mdss_dp2_opp_table>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4771  
1940c25eaa63f6 Abel Vesa           2024-01-29  4772  				power-domains = <&rpmhpd RPMHPD_MMCX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4773  
ba728bda663b0e Abel Vesa           2024-08-29  4774  				phys = <&usb_1_ss2_qmpphy QMP_USB43DP_DP_PHY>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4775  				phy-names = "dp";
1940c25eaa63f6 Abel Vesa           2024-01-29  4776  
1940c25eaa63f6 Abel Vesa           2024-01-29  4777  				#sound-dai-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4778  
1940c25eaa63f6 Abel Vesa           2024-01-29  4779  				status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4780  
1940c25eaa63f6 Abel Vesa           2024-01-29  4781  				ports {
1940c25eaa63f6 Abel Vesa           2024-01-29  4782  					#address-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4783  					#size-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4784  
1940c25eaa63f6 Abel Vesa           2024-01-29  4785  					port@0 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4786  						reg = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4787  						mdss_dp2_in: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4788  							remote-endpoint = <&mdss_intf6_out>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4789  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4790  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4791  
1940c25eaa63f6 Abel Vesa           2024-01-29  4792  					port@1 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4793  						reg = <1>;
aa48a8a5d642b5 Abel Vesa           2024-06-06  4794  
aa48a8a5d642b5 Abel Vesa           2024-06-06  4795  						mdss_dp2_out: endpoint {
aa48a8a5d642b5 Abel Vesa           2024-06-06  4796  							remote-endpoint = <&usb_1_ss2_qmpphy_dp_in>;
aa48a8a5d642b5 Abel Vesa           2024-06-06  4797  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4798  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4799  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4800  
1940c25eaa63f6 Abel Vesa           2024-01-29  4801  				mdss_dp2_opp_table: opp-table {
1940c25eaa63f6 Abel Vesa           2024-01-29  4802  					compatible = "operating-points-v2";
1940c25eaa63f6 Abel Vesa           2024-01-29  4803  
1940c25eaa63f6 Abel Vesa           2024-01-29  4804  					opp-160000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4805  						opp-hz = /bits/ 64 <160000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4806  						required-opps = <&rpmhpd_opp_low_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4807  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4808  
1940c25eaa63f6 Abel Vesa           2024-01-29  4809  					opp-270000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4810  						opp-hz = /bits/ 64 <270000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4811  						required-opps = <&rpmhpd_opp_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4812  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4813  
1940c25eaa63f6 Abel Vesa           2024-01-29  4814  					opp-540000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4815  						opp-hz = /bits/ 64 <540000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4816  						required-opps = <&rpmhpd_opp_svs_l1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4817  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4818  
1940c25eaa63f6 Abel Vesa           2024-01-29  4819  					opp-810000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4820  						opp-hz = /bits/ 64 <810000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4821  						required-opps = <&rpmhpd_opp_nom>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4822  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4823  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4824  			};
1940c25eaa63f6 Abel Vesa           2024-01-29  4825  
1940c25eaa63f6 Abel Vesa           2024-01-29  4826  			mdss_dp3: displayport-controller@aea0000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4827  				compatible = "qcom,x1e80100-dp";
27302c7d859099 Konrad Dybcio       2024-07-11  4828  				reg = <0 0x0aea0000 0 0x200>,
27302c7d859099 Konrad Dybcio       2024-07-11  4829  				      <0 0x0aea0200 0 0x200>,
27302c7d859099 Konrad Dybcio       2024-07-11  4830  				      <0 0x0aea0400 0 0x600>,
27302c7d859099 Konrad Dybcio       2024-07-11  4831  				      <0 0x0aea1000 0 0x400>,
27302c7d859099 Konrad Dybcio       2024-07-11  4832  				      <0 0x0aea1400 0 0x400>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4833  
1940c25eaa63f6 Abel Vesa           2024-01-29  4834  				interrupts-extended = <&mdss 15>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4835  
1940c25eaa63f6 Abel Vesa           2024-01-29  4836  				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4837  					 <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4838  					 <&dispcc DISP_CC_MDSS_DPTX3_LINK_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4839  					 <&dispcc DISP_CC_MDSS_DPTX3_LINK_INTF_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4840  					 <&dispcc DISP_CC_MDSS_DPTX3_PIXEL0_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4841  				clock-names = "core_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4842  					      "core_aux",
1940c25eaa63f6 Abel Vesa           2024-01-29  4843  					      "ctrl_link",
1940c25eaa63f6 Abel Vesa           2024-01-29  4844  					      "ctrl_link_iface",
1940c25eaa63f6 Abel Vesa           2024-01-29  4845  					      "stream_pixel";
1940c25eaa63f6 Abel Vesa           2024-01-29  4846  
1940c25eaa63f6 Abel Vesa           2024-01-29  4847  				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX3_LINK_CLK_SRC>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4848  						  <&dispcc DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4849  				assigned-clock-parents = <&mdss_dp3_phy 0>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4850  							 <&mdss_dp3_phy 1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4851  
1940c25eaa63f6 Abel Vesa           2024-01-29  4852  				operating-points-v2 = <&mdss_dp3_opp_table>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4853  
1940c25eaa63f6 Abel Vesa           2024-01-29  4854  				power-domains = <&rpmhpd RPMHPD_MMCX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4855  
1940c25eaa63f6 Abel Vesa           2024-01-29  4856  				phys = <&mdss_dp3_phy>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4857  				phy-names = "dp";
1940c25eaa63f6 Abel Vesa           2024-01-29  4858  
1940c25eaa63f6 Abel Vesa           2024-01-29  4859  				#sound-dai-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4860  
1940c25eaa63f6 Abel Vesa           2024-01-29  4861  				status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4862  
1940c25eaa63f6 Abel Vesa           2024-01-29  4863  				ports {
1940c25eaa63f6 Abel Vesa           2024-01-29  4864  					#address-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4865  					#size-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4866  
1940c25eaa63f6 Abel Vesa           2024-01-29  4867  					port@0 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4868  						reg = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4869  
1940c25eaa63f6 Abel Vesa           2024-01-29  4870  						mdss_dp3_in: endpoint {
1940c25eaa63f6 Abel Vesa           2024-01-29  4871  							remote-endpoint = <&mdss_intf5_out>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4872  						};
1940c25eaa63f6 Abel Vesa           2024-01-29  4873  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4874  
1940c25eaa63f6 Abel Vesa           2024-01-29  4875  					port@1 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4876  						reg = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4877  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4878  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4879  
1940c25eaa63f6 Abel Vesa           2024-01-29  4880  				mdss_dp3_opp_table: opp-table {
1940c25eaa63f6 Abel Vesa           2024-01-29  4881  					compatible = "operating-points-v2";
1940c25eaa63f6 Abel Vesa           2024-01-29  4882  
1940c25eaa63f6 Abel Vesa           2024-01-29  4883  					opp-160000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4884  						opp-hz = /bits/ 64 <160000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4885  						required-opps = <&rpmhpd_opp_low_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4886  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4887  
1940c25eaa63f6 Abel Vesa           2024-01-29  4888  					opp-270000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4889  						opp-hz = /bits/ 64 <270000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4890  						required-opps = <&rpmhpd_opp_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4891  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4892  
1940c25eaa63f6 Abel Vesa           2024-01-29  4893  					opp-540000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4894  						opp-hz = /bits/ 64 <540000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4895  						required-opps = <&rpmhpd_opp_svs_l1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4896  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4897  
1940c25eaa63f6 Abel Vesa           2024-01-29  4898  					opp-810000000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4899  						opp-hz = /bits/ 64 <810000000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4900  						required-opps = <&rpmhpd_opp_nom>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4901  					};
1940c25eaa63f6 Abel Vesa           2024-01-29  4902  				};
1940c25eaa63f6 Abel Vesa           2024-01-29  4903  			};
1940c25eaa63f6 Abel Vesa           2024-01-29  4904  
1940c25eaa63f6 Abel Vesa           2024-01-29  4905  		};
1940c25eaa63f6 Abel Vesa           2024-01-29  4906  
1940c25eaa63f6 Abel Vesa           2024-01-29  4907  		mdss_dp2_phy: phy@aec2a00 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4908  			compatible = "qcom,x1e80100-dp-phy";
1940c25eaa63f6 Abel Vesa           2024-01-29  4909  			reg = <0 0x0aec2a00 0 0x19c>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4910  			      <0 0x0aec2200 0 0xec>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4911  			      <0 0x0aec2600 0 0xec>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4912  			      <0 0x0aec2000 0 0x1c8>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4913  
1940c25eaa63f6 Abel Vesa           2024-01-29  4914  			clocks = <&dispcc DISP_CC_MDSS_DPTX2_AUX_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4915  				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4916  			clock-names = "aux",
1940c25eaa63f6 Abel Vesa           2024-01-29  4917  				      "cfg_ahb";
1940c25eaa63f6 Abel Vesa           2024-01-29  4918  
1940c25eaa63f6 Abel Vesa           2024-01-29  4919  			power-domains = <&rpmhpd RPMHPD_MX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4920  
1940c25eaa63f6 Abel Vesa           2024-01-29  4921  			#clock-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4922  			#phy-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4923  
1940c25eaa63f6 Abel Vesa           2024-01-29  4924  			status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4925  		};
1940c25eaa63f6 Abel Vesa           2024-01-29  4926  
1940c25eaa63f6 Abel Vesa           2024-01-29  4927  		mdss_dp3_phy: phy@aec5a00 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4928  			compatible = "qcom,x1e80100-dp-phy";
1940c25eaa63f6 Abel Vesa           2024-01-29  4929  			reg = <0 0x0aec5a00 0 0x19c>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4930  			      <0 0x0aec5200 0 0xec>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4931  			      <0 0x0aec5600 0 0xec>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4932  			      <0 0x0aec5000 0 0x1c8>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4933  
1940c25eaa63f6 Abel Vesa           2024-01-29  4934  			clocks = <&dispcc DISP_CC_MDSS_DPTX3_AUX_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4935  				 <&dispcc DISP_CC_MDSS_AHB_CLK>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4936  			clock-names = "aux",
1940c25eaa63f6 Abel Vesa           2024-01-29  4937  				      "cfg_ahb";
1940c25eaa63f6 Abel Vesa           2024-01-29  4938  
1940c25eaa63f6 Abel Vesa           2024-01-29  4939  			power-domains = <&rpmhpd RPMHPD_MX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4940  
1940c25eaa63f6 Abel Vesa           2024-01-29  4941  			#clock-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4942  			#phy-cells = <0>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4943  
1940c25eaa63f6 Abel Vesa           2024-01-29  4944  			status = "disabled";
1940c25eaa63f6 Abel Vesa           2024-01-29  4945  		};
1940c25eaa63f6 Abel Vesa           2024-01-29  4946  
1940c25eaa63f6 Abel Vesa           2024-01-29  4947  		dispcc: clock-controller@af00000 {
1940c25eaa63f6 Abel Vesa           2024-01-29  4948  			compatible = "qcom,x1e80100-dispcc";
1940c25eaa63f6 Abel Vesa           2024-01-29  4949  			reg = <0 0x0af00000 0 0x20000>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4950  			clocks = <&bi_tcxo_div2>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4951  				 <&bi_tcxo_ao_div2>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4952  				 <&gcc GCC_DISP_AHB_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4953  				 <&sleep_clk>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4954  				 <0>, /* dsi0 */
1940c25eaa63f6 Abel Vesa           2024-01-29  4955  				 <0>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4956  				 <0>, /* dsi1 */
1940c25eaa63f6 Abel Vesa           2024-01-29  4957  				 <0>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4958  				 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp0 */
1940c25eaa63f6 Abel Vesa           2024-01-29  4959  				 <&usb_1_ss0_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4960  				 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp1 */
1940c25eaa63f6 Abel Vesa           2024-01-29  4961  				 <&usb_1_ss1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
ba728bda663b0e Abel Vesa           2024-08-29  4962  				 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_LINK_CLK>, /* dp2 */
ba728bda663b0e Abel Vesa           2024-08-29  4963  				 <&usb_1_ss2_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>,
1940c25eaa63f6 Abel Vesa           2024-01-29  4964  				 <&mdss_dp3_phy 0>, /* dp3 */
1940c25eaa63f6 Abel Vesa           2024-01-29  4965  				 <&mdss_dp3_phy 1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4966  			power-domains = <&rpmhpd RPMHPD_MMCX>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4967  			required-opps = <&rpmhpd_opp_low_svs>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4968  			#clock-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4969  			#reset-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4970  			#power-domain-cells = <1>;
1940c25eaa63f6 Abel Vesa           2024-01-29  4971  		};
1940c25eaa63f6 Abel Vesa           2024-01-29  4972  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4973  		pdc: interrupt-controller@b220000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  4974  			compatible = "qcom,x1e80100-pdc", "qcom,pdc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  4975  			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4976  
af16b00578a7a1 Rajendra Nayak      2023-12-05  4977  			qcom,pdc-ranges = <0 480 42>, <42 251 5>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  4978  					  <47 522 52>, <99 609 32>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  4979  					  <131 717 12>, <143 816 19>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4980  			#interrupt-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4981  			interrupt-parent = <&intc>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4982  			interrupt-controller;
af16b00578a7a1 Rajendra Nayak      2023-12-05  4983  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  4984  
2661646f5934c9 Sibi Sankar         2024-01-29  4985  		aoss_qmp: power-management@c300000 {
2661646f5934c9 Sibi Sankar         2024-01-29  4986  			compatible = "qcom,x1e80100-aoss-qmp", "qcom,aoss-qmp";
2661646f5934c9 Sibi Sankar         2024-01-29  4987  			reg = <0 0x0c300000 0 0x400>;
2661646f5934c9 Sibi Sankar         2024-01-29  4988  			interrupt-parent = <&ipcc>;
2661646f5934c9 Sibi Sankar         2024-01-29  4989  			interrupts-extended = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP
2661646f5934c9 Sibi Sankar         2024-01-29  4990  						     IRQ_TYPE_EDGE_RISING>;
2661646f5934c9 Sibi Sankar         2024-01-29  4991  			mboxes = <&ipcc IPCC_CLIENT_AOP IPCC_MPROC_SIGNAL_GLINK_QMP>;
2661646f5934c9 Sibi Sankar         2024-01-29  4992  
2661646f5934c9 Sibi Sankar         2024-01-29  4993  			#clock-cells = <0>;
2661646f5934c9 Sibi Sankar         2024-01-29  4994  		};
2661646f5934c9 Sibi Sankar         2024-01-29  4995  
40e9327a80362d Rajendra Nayak      2024-07-23  4996  		sram@c3f0000 {
40e9327a80362d Rajendra Nayak      2024-07-23  4997  			compatible = "qcom,rpmh-stats";
40e9327a80362d Rajendra Nayak      2024-07-23  4998  			reg = <0 0x0c3f0000 0 0x400>;
40e9327a80362d Rajendra Nayak      2024-07-23  4999  		};
40e9327a80362d Rajendra Nayak      2024-07-23  5000  
53fdae5e086b69 Abel Vesa           2024-02-22  5001  		spmi: arbiter@c400000 {
53fdae5e086b69 Abel Vesa           2024-02-22  5002  			compatible = "qcom,x1e80100-spmi-pmic-arb";
53fdae5e086b69 Abel Vesa           2024-02-22  5003  			reg = <0 0x0c400000 0 0x3000>,
53fdae5e086b69 Abel Vesa           2024-02-22  5004  			      <0 0x0c500000 0 0x400000>,
53fdae5e086b69 Abel Vesa           2024-02-22  5005  			      <0 0x0c440000 0 0x80000>;
53fdae5e086b69 Abel Vesa           2024-02-22  5006  			reg-names = "core", "chnls", "obsrvr";
53fdae5e086b69 Abel Vesa           2024-02-22  5007  
53fdae5e086b69 Abel Vesa           2024-02-22  5008  			qcom,ee = <0>;
53fdae5e086b69 Abel Vesa           2024-02-22  5009  			qcom,channel = <0>;
53fdae5e086b69 Abel Vesa           2024-02-22  5010  
53fdae5e086b69 Abel Vesa           2024-02-22  5011  			#address-cells = <2>;
53fdae5e086b69 Abel Vesa           2024-02-22  5012  			#size-cells = <2>;
53fdae5e086b69 Abel Vesa           2024-02-22  5013  			ranges;
53fdae5e086b69 Abel Vesa           2024-02-22  5014  
53fdae5e086b69 Abel Vesa           2024-02-22  5015  			spmi_bus0: spmi@c42d000 {
53fdae5e086b69 Abel Vesa           2024-02-22  5016  				reg = <0 0x0c42d000 0 0x4000>,
53fdae5e086b69 Abel Vesa           2024-02-22  5017  				      <0 0x0c4c0000 0 0x10000>;
53fdae5e086b69 Abel Vesa           2024-02-22  5018  				reg-names = "cnfg", "intr";
53fdae5e086b69 Abel Vesa           2024-02-22  5019  
53fdae5e086b69 Abel Vesa           2024-02-22  5020  				interrupt-names = "periph_irq";
53fdae5e086b69 Abel Vesa           2024-02-22  5021  				interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
53fdae5e086b69 Abel Vesa           2024-02-22  5022  				interrupt-controller;
53fdae5e086b69 Abel Vesa           2024-02-22  5023  				#interrupt-cells = <4>;
53fdae5e086b69 Abel Vesa           2024-02-22  5024  
53fdae5e086b69 Abel Vesa           2024-02-22  5025  				#address-cells = <2>;
53fdae5e086b69 Abel Vesa           2024-02-22  5026  				#size-cells = <0>;
53fdae5e086b69 Abel Vesa           2024-02-22  5027  			};
53fdae5e086b69 Abel Vesa           2024-02-22  5028  
53fdae5e086b69 Abel Vesa           2024-02-22  5029  			spmi_bus1: spmi@c432000 {
53fdae5e086b69 Abel Vesa           2024-02-22  5030  				reg = <0 0x0c432000 0 0x4000>,
53fdae5e086b69 Abel Vesa           2024-02-22  5031  				      <0 0x0c4d0000 0 0x10000>;
53fdae5e086b69 Abel Vesa           2024-02-22  5032  				reg-names = "cnfg", "intr";
53fdae5e086b69 Abel Vesa           2024-02-22  5033  
53fdae5e086b69 Abel Vesa           2024-02-22  5034  				interrupt-names = "periph_irq";
53fdae5e086b69 Abel Vesa           2024-02-22  5035  				interrupts-extended = <&pdc 3 IRQ_TYPE_LEVEL_HIGH>;
53fdae5e086b69 Abel Vesa           2024-02-22  5036  				interrupt-controller;
53fdae5e086b69 Abel Vesa           2024-02-22  5037  				#interrupt-cells = <4>;
53fdae5e086b69 Abel Vesa           2024-02-22  5038  
53fdae5e086b69 Abel Vesa           2024-02-22  5039  				#address-cells = <2>;
53fdae5e086b69 Abel Vesa           2024-02-22  5040  				#size-cells = <0>;
53fdae5e086b69 Abel Vesa           2024-02-22  5041  			};
53fdae5e086b69 Abel Vesa           2024-02-22  5042  		};
2661646f5934c9 Sibi Sankar         2024-01-29  5043  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5044  		tlmm: pinctrl@f100000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5045  			compatible = "qcom,x1e80100-tlmm";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5046  			reg = <0 0x0f100000 0 0xf00000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5047  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5048  			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5049  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5050  			gpio-controller;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5051  			#gpio-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5052  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5053  			interrupt-controller;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5054  			#interrupt-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5055  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5056  			gpio-ranges = <&tlmm 0 0 239>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5057  			wakeup-parent = <&pdc>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5058  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5059  			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5060  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5061  				pins = "gpio0", "gpio1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5062  				function = "qup0_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5063  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5064  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5065  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5066  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5067  			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5068  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5069  				pins = "gpio4", "gpio5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5070  				function = "qup0_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5071  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5072  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5073  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5074  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5075  			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5076  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5077  				pins = "gpio8", "gpio9";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5078  				function = "qup0_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5079  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5080  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5081  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5082  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5083  			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5084  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5085  				pins = "gpio12", "gpio13";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5086  				function = "qup0_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5087  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5088  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5089  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5090  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5091  			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5092  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5093  				pins = "gpio16", "gpio17";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5094  				function = "qup0_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5095  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5096  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5097  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5098  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5099  			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5100  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5101  				pins = "gpio20", "gpio21";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5102  				function = "qup0_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5103  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5104  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5105  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5106  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5107  			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5108  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5109  				pins = "gpio24", "gpio25";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5110  				function = "qup0_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5111  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5112  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5113  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5114  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5115  			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5116  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5117  				pins = "gpio14", "gpio15";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5118  				function = "qup0_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5119  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5120  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5121  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5122  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5123  			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5124  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5125  				pins = "gpio32", "gpio33";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5126  				function = "qup1_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5127  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5128  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5129  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5130  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5131  			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5132  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5133  				pins = "gpio36", "gpio37";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5134  				function = "qup1_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5135  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5136  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5137  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5138  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5139  			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5140  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5141  				pins = "gpio40", "gpio41";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5142  				function = "qup1_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5143  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5144  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5145  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5146  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5147  			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5148  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5149  				pins = "gpio44", "gpio45";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5150  				function = "qup1_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5151  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5152  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5153  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5154  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5155  			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5156  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5157  				pins = "gpio48", "gpio49";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5158  				function = "qup1_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5159  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5160  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5161  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5162  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5163  			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5164  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5165  				pins = "gpio52", "gpio53";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5166  				function = "qup1_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5167  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5168  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5169  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5170  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5171  			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5172  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5173  				pins = "gpio56", "gpio57";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5174  				function = "qup1_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5175  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5176  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5177  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5178  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5179  			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5180  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5181  				pins = "gpio54", "gpio55";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5182  				function = "qup1_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5183  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5184  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5185  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5186  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5187  			qup_i2c16_data_clk: qup-i2c16-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5188  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5189  				pins = "gpio64", "gpio65";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5190  				function = "qup2_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5191  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5192  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5193  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5194  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5195  			qup_i2c17_data_clk: qup-i2c17-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5196  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5197  				pins = "gpio68", "gpio69";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5198  				function = "qup2_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5199  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5200  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5201  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5202  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5203  			qup_i2c18_data_clk: qup-i2c18-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5204  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5205  				pins = "gpio72", "gpio73";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5206  				function = "qup2_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5207  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5208  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5209  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5210  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5211  			qup_i2c19_data_clk: qup-i2c19-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5212  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5213  				pins = "gpio76", "gpio77";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5214  				function = "qup2_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5215  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5216  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5217  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5218  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5219  			qup_i2c20_data_clk: qup-i2c20-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5220  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5221  				pins = "gpio80", "gpio81";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5222  				function = "qup2_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5223  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5224  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5225  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5226  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5227  			qup_i2c21_data_clk: qup-i2c21-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5228  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5229  				pins = "gpio84", "gpio85";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5230  				function = "qup2_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5231  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5232  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5233  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5234  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5235  			qup_i2c22_data_clk: qup-i2c22-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5236  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5237  				pins = "gpio88", "gpio89";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5238  				function = "qup2_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5239  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5240  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5241  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5242  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5243  			qup_i2c23_data_clk: qup-i2c23-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5244  				/* SDA, SCL */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5245  				pins = "gpio86", "gpio87";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5246  				function = "qup2_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5247  				drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5248  				bias-pull-up = <2200>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5249  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5250  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5251  			qup_spi0_cs: qup-spi0-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5252  				pins = "gpio3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5253  				function = "qup0_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5254  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5255  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5256  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5257  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5258  			qup_spi0_data_clk: qup-spi0-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5259  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5260  				pins = "gpio0", "gpio1", "gpio2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5261  				function = "qup0_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5262  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5263  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5264  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5265  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5266  			qup_spi1_cs: qup-spi1-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5267  				pins = "gpio7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5268  				function = "qup0_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5269  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5270  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5271  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5272  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5273  			qup_spi1_data_clk: qup-spi1-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5274  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5275  				pins = "gpio4", "gpio5", "gpio6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5276  				function = "qup0_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5277  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5278  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5279  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5280  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5281  			qup_spi2_cs: qup-spi2-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5282  				pins = "gpio11";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5283  				function = "qup0_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5284  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5285  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5286  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5287  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5288  			qup_spi2_data_clk: qup-spi2-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5289  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5290  				pins = "gpio8", "gpio9", "gpio10";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5291  				function = "qup0_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5292  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5293  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5294  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5295  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5296  			qup_spi3_cs: qup-spi3-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5297  				pins = "gpio15";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5298  				function = "qup0_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5299  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5300  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5301  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5302  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5303  			qup_spi3_data_clk: qup-spi3-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5304  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5305  				pins = "gpio12", "gpio13", "gpio14";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5306  				function = "qup0_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5307  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5308  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5309  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5310  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5311  			qup_spi4_cs: qup-spi4-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5312  				pins = "gpio19";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5313  				function = "qup0_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5314  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5315  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5316  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5317  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5318  			qup_spi4_data_clk: qup-spi4-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5319  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5320  				pins = "gpio16", "gpio17", "gpio18";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5321  				function = "qup0_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5322  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5323  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5324  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5325  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5326  			qup_spi5_cs: qup-spi5-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5327  				pins = "gpio23";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5328  				function = "qup0_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5329  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5330  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5331  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5332  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5333  			qup_spi5_data_clk: qup-spi5-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5334  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5335  				pins = "gpio20", "gpio21", "gpio22";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5336  				function = "qup0_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5337  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5338  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5339  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5340  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5341  			qup_spi6_cs: qup-spi6-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5342  				pins = "gpio27";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5343  				function = "qup0_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5344  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5345  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5346  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5347  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5348  			qup_spi6_data_clk: qup-spi6-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5349  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5350  				pins = "gpio24", "gpio25", "gpio26";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5351  				function = "qup0_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5352  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5353  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5354  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5355  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5356  			qup_spi7_cs: qup-spi7-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5357  				pins = "gpio13";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5358  				function = "qup0_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5359  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5360  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5361  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5362  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5363  			qup_spi7_data_clk: qup-spi7-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5364  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5365  				pins = "gpio14", "gpio15", "gpio12";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5366  				function = "qup0_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5367  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5368  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5369  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5370  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5371  			qup_spi8_cs: qup-spi8-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5372  				pins = "gpio35";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5373  				function = "qup1_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5374  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5375  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5376  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5377  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5378  			qup_spi8_data_clk: qup-spi8-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5379  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5380  				pins = "gpio32", "gpio33", "gpio34";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5381  				function = "qup1_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5382  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5383  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5384  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5385  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5386  			qup_spi9_cs: qup-spi9-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5387  				pins = "gpio39";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5388  				function = "qup1_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5389  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5390  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5391  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5392  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5393  			qup_spi9_data_clk: qup-spi9-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5394  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5395  				pins = "gpio36", "gpio37", "gpio38";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5396  				function = "qup1_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5397  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5398  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5399  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5400  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5401  			qup_spi10_cs: qup-spi10-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5402  				pins = "gpio43";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5403  				function = "qup1_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5404  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5405  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5406  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5407  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5408  			qup_spi10_data_clk: qup-spi10-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5409  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5410  				pins = "gpio40", "gpio41", "gpio42";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5411  				function = "qup1_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5412  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5413  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5414  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5415  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5416  			qup_spi11_cs: qup-spi11-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5417  				pins = "gpio47";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5418  				function = "qup1_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5419  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5420  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5421  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5422  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5423  			qup_spi11_data_clk: qup-spi11-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5424  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5425  				pins = "gpio44", "gpio45", "gpio46";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5426  				function = "qup1_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5427  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5428  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5429  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5430  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5431  			qup_spi12_cs: qup-spi12-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5432  				pins = "gpio51";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5433  				function = "qup1_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5434  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5435  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5436  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5437  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5438  			qup_spi12_data_clk: qup-spi12-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5439  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5440  				pins = "gpio48", "gpio49", "gpio50";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5441  				function = "qup1_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5442  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5443  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5444  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5445  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5446  			qup_spi13_cs: qup-spi13-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5447  				pins = "gpio55";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5448  				function = "qup1_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5449  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5450  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5451  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5452  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5453  			qup_spi13_data_clk: qup-spi13-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5454  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5455  				pins = "gpio52", "gpio53", "gpio54";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5456  				function = "qup1_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5457  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5458  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5459  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5460  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5461  			qup_spi14_cs: qup-spi14-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5462  				pins = "gpio59";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5463  				function = "qup1_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5464  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5465  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5466  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5467  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5468  			qup_spi14_data_clk: qup-spi14-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5469  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5470  				pins = "gpio56", "gpio57", "gpio58";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5471  				function = "qup1_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5472  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5473  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5474  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5475  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5476  			qup_spi15_cs: qup-spi15-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5477  				pins = "gpio53";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5478  				function = "qup1_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5479  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5480  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5481  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5482  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5483  			qup_spi15_data_clk: qup-spi15-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5484  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5485  				pins = "gpio54", "gpio55", "gpio52";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5486  				function = "qup1_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5487  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5488  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5489  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5490  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5491  			qup_spi16_cs: qup-spi16-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5492  				pins = "gpio67";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5493  				function = "qup2_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5494  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5495  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5496  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5497  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5498  			qup_spi16_data_clk: qup-spi16-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5499  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5500  				pins = "gpio64", "gpio65", "gpio66";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5501  				function = "qup2_se0";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5502  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5503  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5504  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5505  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5506  			qup_spi17_cs: qup-spi17-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5507  				pins = "gpio71";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5508  				function = "qup2_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5509  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5510  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5511  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5512  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5513  			qup_spi17_data_clk: qup-spi17-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5514  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5515  				pins = "gpio68", "gpio69", "gpio70";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5516  				function = "qup2_se1";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5517  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5518  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5519  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5520  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5521  			qup_spi18_cs: qup-spi18-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5522  				pins = "gpio75";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5523  				function = "qup2_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5524  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5525  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5526  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5527  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5528  			qup_spi18_data_clk: qup-spi18-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5529  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5530  				pins = "gpio72", "gpio73", "gpio74";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5531  				function = "qup2_se2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5532  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5533  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5534  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5535  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5536  			qup_spi19_cs: qup-spi19-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5537  				pins = "gpio79";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5538  				function = "qup2_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5539  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5540  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5541  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5542  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5543  			qup_spi19_data_clk: qup-spi19-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5544  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5545  				pins = "gpio76", "gpio77", "gpio78";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5546  				function = "qup2_se3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5547  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5548  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5549  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5550  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5551  			qup_spi20_cs: qup-spi20-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5552  				pins = "gpio83";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5553  				function = "qup2_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5554  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5555  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5556  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5557  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5558  			qup_spi20_data_clk: qup-spi20-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5559  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5560  				pins = "gpio80", "gpio81", "gpio82";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5561  				function = "qup2_se4";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5562  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5563  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5564  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5565  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5566  			qup_spi21_cs: qup-spi21-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5567  				pins = "gpio87";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5568  				function = "qup2_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5569  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5570  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5571  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5572  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5573  			qup_spi21_data_clk: qup-spi21-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5574  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5575  				pins = "gpio84", "gpio85", "gpio86";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5576  				function = "qup2_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5577  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5578  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5579  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5580  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5581  			qup_spi22_cs: qup-spi22-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5582  				pins = "gpio91";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5583  				function = "qup2_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5584  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5585  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5586  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5587  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5588  			qup_spi22_data_clk: qup-spi22-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5589  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5590  				pins = "gpio88", "gpio89", "gpio90";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5591  				function = "qup2_se6";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5592  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5593  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5594  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5595  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5596  			qup_spi23_cs: qup-spi23-cs-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5597  				pins = "gpio85";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5598  				function = "qup2_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5599  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5600  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5601  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5602  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5603  			qup_spi23_data_clk: qup-spi23-data-clk-state {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5604  				/* MISO, MOSI, CLK */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5605  				pins = "gpio86", "gpio87", "gpio84";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5606  				function = "qup2_se7";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5607  				drive-strength = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5608  				bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5609  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5610  
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5611  			qup_uart2_default: qup-uart2-default-state {
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5612  				cts-pins {
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5613  					pins = "gpio8";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5614  					function = "qup0_se2";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5615  					drive-strength = <2>;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5616  					bias-disable;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5617  				};
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5618  
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5619  				rts-pins {
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5620  					pins = "gpio9";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5621  					function = "qup0_se2";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5622  					drive-strength = <2>;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5623  					bias-disable;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5624  				};
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5625  
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5626  				tx-pins {
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5627  					pins = "gpio10";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5628  					function = "qup0_se2";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5629  					drive-strength = <2>;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5630  					bias-disable;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5631  				};
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5632  
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5633  				rx-pins {
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5634  					pins = "gpio11";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5635  					function = "qup0_se2";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5636  					drive-strength = <2>;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5637  					bias-disable;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5638  				};
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5639  			};
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5640  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5641  			qup_uart21_default: qup-uart21-default-state {
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5642  				tx-pins {
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5643  					pins = "gpio86";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5644  					function = "qup2_se5";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5645  					drive-strength = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5646  					bias-disable;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5647  				};
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5648  
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5649  				rx-pins {
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5650  					pins = "gpio87";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5651  					function = "qup2_se5";
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5652  					drive-strength = <2>;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5653  					bias-disable;
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5654  				};
ecbdce2041ee09 Konrad Dybcio       2024-08-26  5655  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5656  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5657  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5658  		apps_smmu: iommu@15000000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5659  			compatible = "qcom,x1e80100-smmu-500", "qcom,smmu-500", "arm,mmu-500";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5660  			reg = <0 0x15000000 0 0x100000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5661  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5662  			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5663  				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5664  				     <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5665  				     <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5666  				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5667  				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5668  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5669  				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5670  				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5671  				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5672  				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5673  				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5674  				     <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5675  				     <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5676  				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5677  				     <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5678  				     <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5679  				     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5680  				     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5681  				     <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5682  				     <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5683  				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5684  				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5685  				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5686  				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5687  				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5688  				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5689  				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5690  				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5691  				     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5692  				     <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5693  				     <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5694  				     <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5695  				     <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5696  				     <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5697  				     <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5698  				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5699  				     <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5700  				     <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5701  				     <GIC_SPI 319 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5702  				     <GIC_SPI 320 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5703  				     <GIC_SPI 321 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5704  				     <GIC_SPI 322 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5705  				     <GIC_SPI 323 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5706  				     <GIC_SPI 324 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5707  				     <GIC_SPI 325 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5708  				     <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5709  				     <GIC_SPI 327 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5710  				     <GIC_SPI 328 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5711  				     <GIC_SPI 329 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5712  				     <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5713  				     <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5714  				     <GIC_SPI 332 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5715  				     <GIC_SPI 333 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5716  				     <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5717  				     <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5718  				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5719  				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5720  				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5721  				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5722  				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5723  				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5724  				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5725  				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5726  				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5727  				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5728  				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5729  				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5730  				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5731  				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5732  				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5733  				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5734  				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5735  				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5736  				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5737  				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5738  				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5739  				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5740  				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5741  				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5742  				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5743  				     <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5744  				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5745  				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5746  				     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5747  				     <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5748  				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5749  				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5750  				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5751  				     <GIC_SPI 690 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5752  				     <GIC_SPI 691 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5753  				     <GIC_SPI 692 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5754  				     <GIC_SPI 693 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5755  				     <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5756  				     <GIC_SPI 695 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5757  				     <GIC_SPI 696 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5758  				     <GIC_SPI 697 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5759  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5760  			#iommu-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5761  			#global-interrupts = <1>;
5207d9c75f18db Konrad Dybcio       2024-09-19  5762  
5207d9c75f18db Konrad Dybcio       2024-09-19  5763  			dma-coherent;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5764  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5765  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5766  		intc: interrupt-controller@17000000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5767  			compatible = "arm,gic-v3";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5768  			reg = <0 0x17000000 0 0x10000>,     /* GICD */
9ed1a2b8784262 Sibi Sankar         2024-06-12  5769  			      <0 0x17080000 0 0x300000>;    /* GICR * 12 */
af16b00578a7a1 Rajendra Nayak      2023-12-05  5770  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5771  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5772  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5773  			#interrupt-cells = <3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5774  			interrupt-controller;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5775  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5776  			#redistributor-regions = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5777  			redistributor-stride = <0x0 0x40000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5778  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5779  			#address-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5780  			#size-cells = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5781  			ranges;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5782  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5783  			gic_its: msi-controller@17040000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5784  				compatible = "arm,gic-v3-its";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5785  				reg = <0 0x17040000 0 0x40000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5786  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5787  				msi-controller;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5788  				#msi-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5789  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5790  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5791  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5792  		apps_rsc: rsc@17500000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5793  			compatible = "qcom,rpmh-rsc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5794  			reg = <0 0x17500000 0 0x10000>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5795  			      <0 0x17510000 0 0x10000>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5796  			      <0 0x17520000 0 0x10000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5797  			reg-names = "drv-0", "drv-1", "drv-2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5798  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5799  			interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5800  				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5801  				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5802  			qcom,tcs-offset = <0xd00>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5803  			qcom,drv-id = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5804  			qcom,tcs-config = <ACTIVE_TCS    3>, <SLEEP_TCS     2>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5805  					  <WAKE_TCS      2>, <CONTROL_TCS   0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5806  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5807  			label = "apps_rsc";
6a3649903ccd95 Krzysztof Kozlowski 2024-10-22  5808  			power-domains = <&system_pd>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5809  
48ef8eb6460101 Abel Vesa           2024-11-09  5810  			#address-cells = <1>;
48ef8eb6460101 Abel Vesa           2024-11-09  5811  			#size-cells = <0>;
48ef8eb6460101 Abel Vesa           2024-11-09  5812  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5813  			apps_bcm_voter: bcm-voter {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5814  				compatible = "qcom,bcm-voter";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5815  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5816  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5817  			rpmhcc: clock-controller {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5818  				compatible = "qcom,x1e80100-rpmh-clk";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5819  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5820  				clocks = <&xo_board>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5821  				clock-names = "xo";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5822  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5823  				#clock-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5824  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5825  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5826  			rpmhpd: power-controller {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5827  				compatible = "qcom,x1e80100-rpmhpd";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5828  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5829  				operating-points-v2 = <&rpmhpd_opp_table>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5830  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5831  				#power-domain-cells = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5832  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5833  				rpmhpd_opp_table: opp-table {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5834  					compatible = "operating-points-v2";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5835  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5836  					rpmhpd_opp_ret: opp-16 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5837  						opp-level = <RPMH_REGULATOR_LEVEL_RETENTION>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5838  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5839  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5840  					rpmhpd_opp_min_svs: opp-48 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5841  						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5842  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5843  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5844  					rpmhpd_opp_low_svs_d2: opp-52 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5845  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5846  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5847  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5848  					rpmhpd_opp_low_svs_d1: opp-56 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5849  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5850  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5851  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5852  					rpmhpd_opp_low_svs_d0: opp-60 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5853  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5854  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5855  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5856  					rpmhpd_opp_low_svs: opp-64 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5857  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5858  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5859  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5860  					rpmhpd_opp_low_svs_l1: opp-80 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5861  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5862  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5863  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5864  					rpmhpd_opp_svs: opp-128 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5865  						opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5866  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5867  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5868  					rpmhpd_opp_svs_l0: opp-144 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5869  						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5870  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5871  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5872  					rpmhpd_opp_svs_l1: opp-192 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5873  						opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5874  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5875  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5876  					rpmhpd_opp_nom: opp-256 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5877  						opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5878  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5879  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5880  					rpmhpd_opp_nom_l1: opp-320 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5881  						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5882  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5883  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5884  					rpmhpd_opp_nom_l2: opp-336 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5885  						opp-level = <RPMH_REGULATOR_LEVEL_NOM_L2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5886  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5887  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5888  					rpmhpd_opp_turbo: opp-384 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5889  						opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5890  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5891  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5892  					rpmhpd_opp_turbo_l1: opp-416 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5893  						opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5894  					};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5895  				};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5896  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5897  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5898  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5899  		timer@17800000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  5900  			compatible = "arm,armv7-timer-mem";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5901  			reg = <0 0x17800000 0 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5902  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5903  			#address-cells = <2>;
d336355492e4ab Krzysztof Kozlowski 2023-12-18  5904  			#size-cells = <1>;
d336355492e4ab Krzysztof Kozlowski 2023-12-18  5905  			ranges = <0 0 0 0 0x20000000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5906  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5907  			frame@17801000 {
d336355492e4ab Krzysztof Kozlowski 2023-12-18  5908  				reg = <0 0x17801000 0x1000>,
d336355492e4ab Krzysztof Kozlowski 2023-12-18  5909  				      <0 0x17802000 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5910  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5911  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  5912  					     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5913  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5914  				frame-number = <0>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5915  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5916  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5917  			frame@17803000 {
d336355492e4ab Krzysztof Kozlowski 2023-12-18  5918  				reg = <0 0x17803000 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5919  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5920  				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5921  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5922  				frame-number = <1>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5923  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5924  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5925  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5926  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5927  			frame@17805000 {
d336355492e4ab Krzysztof Kozlowski 2023-12-18  5928  				reg = <0 0x17805000 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5929  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5930  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5931  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5932  				frame-number = <2>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5933  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5934  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5935  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5936  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5937  			frame@17807000 {
d336355492e4ab Krzysztof Kozlowski 2023-12-18  5938  				reg = <0 0x17807000 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5939  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5940  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5941  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5942  				frame-number = <3>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5943  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5944  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5945  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5946  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5947  			frame@17809000 {
d336355492e4ab Krzysztof Kozlowski 2023-12-18  5948  				reg = <0 0x17809000 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5949  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5950  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5951  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5952  				frame-number = <4>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5953  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5954  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5955  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5956  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5957  			frame@1780b000 {
d336355492e4ab Krzysztof Kozlowski 2023-12-18  5958  				reg = <0 0x1780b000 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5959  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5960  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5961  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5962  				frame-number = <5>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5963  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5964  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5965  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5966  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5967  			frame@1780d000 {
d336355492e4ab Krzysztof Kozlowski 2023-12-18  5968  				reg = <0 0x1780d000 0x1000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5969  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5970  				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5971  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5972  				frame-number = <6>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  5973  
af16b00578a7a1 Rajendra Nayak      2023-12-05  5974  				status = "disabled";
af16b00578a7a1 Rajendra Nayak      2023-12-05  5975  			};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5976  		};
af16b00578a7a1 Rajendra Nayak      2023-12-05  5977  
740bc669605277 Sibi Sankar         2024-06-24  5978  		pmu@24091000 {
740bc669605277 Sibi Sankar         2024-06-24  5979  			compatible = "qcom,x1e80100-llcc-bwmon", "qcom,sc7280-llcc-bwmon";
740bc669605277 Sibi Sankar         2024-06-24  5980  			reg = <0 0x24091000 0 0x1000>;
740bc669605277 Sibi Sankar         2024-06-24  5981  
740bc669605277 Sibi Sankar         2024-06-24  5982  			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
740bc669605277 Sibi Sankar         2024-06-24  5983  
740bc669605277 Sibi Sankar         2024-06-24  5984  			interconnects = <&mc_virt MASTER_LLCC QCOM_ICC_TAG_ACTIVE_ONLY
740bc669605277 Sibi Sankar         2024-06-24  5985  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
740bc669605277 Sibi Sankar         2024-06-24  5986  
740bc669605277 Sibi Sankar         2024-06-24  5987  			operating-points-v2 = <&llcc_bwmon_opp_table>;
740bc669605277 Sibi Sankar         2024-06-24  5988  
740bc669605277 Sibi Sankar         2024-06-24  5989  			llcc_bwmon_opp_table: opp-table {
740bc669605277 Sibi Sankar         2024-06-24  5990  				compatible = "operating-points-v2";
740bc669605277 Sibi Sankar         2024-06-24  5991  
740bc669605277 Sibi Sankar         2024-06-24  5992  				opp-0 {
740bc669605277 Sibi Sankar         2024-06-24  5993  					opp-peak-kBps = <800000>;
740bc669605277 Sibi Sankar         2024-06-24  5994  				};
740bc669605277 Sibi Sankar         2024-06-24  5995  
740bc669605277 Sibi Sankar         2024-06-24  5996  				opp-1 {
740bc669605277 Sibi Sankar         2024-06-24  5997  					opp-peak-kBps = <2188000>;
740bc669605277 Sibi Sankar         2024-06-24  5998  				};
740bc669605277 Sibi Sankar         2024-06-24  5999  
740bc669605277 Sibi Sankar         2024-06-24  6000  				opp-2 {
740bc669605277 Sibi Sankar         2024-06-24  6001  					opp-peak-kBps = <3072000>;
740bc669605277 Sibi Sankar         2024-06-24  6002  				};
740bc669605277 Sibi Sankar         2024-06-24  6003  
740bc669605277 Sibi Sankar         2024-06-24  6004  				opp-3 {
740bc669605277 Sibi Sankar         2024-06-24  6005  					opp-peak-kBps = <6220800>;
740bc669605277 Sibi Sankar         2024-06-24  6006  				};
740bc669605277 Sibi Sankar         2024-06-24  6007  
740bc669605277 Sibi Sankar         2024-06-24  6008  				opp-4 {
740bc669605277 Sibi Sankar         2024-06-24  6009  					opp-peak-kBps = <6835200>;
740bc669605277 Sibi Sankar         2024-06-24  6010  				};
740bc669605277 Sibi Sankar         2024-06-24  6011  
740bc669605277 Sibi Sankar         2024-06-24  6012  				opp-5 {
740bc669605277 Sibi Sankar         2024-06-24  6013  					opp-peak-kBps = <8371200>;
740bc669605277 Sibi Sankar         2024-06-24  6014  				};
740bc669605277 Sibi Sankar         2024-06-24  6015  
740bc669605277 Sibi Sankar         2024-06-24  6016  				opp-6 {
740bc669605277 Sibi Sankar         2024-06-24  6017  					opp-peak-kBps = <10944000>;
740bc669605277 Sibi Sankar         2024-06-24  6018  				};
740bc669605277 Sibi Sankar         2024-06-24  6019  
740bc669605277 Sibi Sankar         2024-06-24  6020  				opp-7 {
740bc669605277 Sibi Sankar         2024-06-24  6021  					opp-peak-kBps = <12748800>;
740bc669605277 Sibi Sankar         2024-06-24  6022  				};
740bc669605277 Sibi Sankar         2024-06-24  6023  
740bc669605277 Sibi Sankar         2024-06-24  6024  				opp-8 {
740bc669605277 Sibi Sankar         2024-06-24  6025  					opp-peak-kBps = <14745600>;
740bc669605277 Sibi Sankar         2024-06-24  6026  				};
740bc669605277 Sibi Sankar         2024-06-24  6027  
740bc669605277 Sibi Sankar         2024-06-24  6028  				opp-9 {
740bc669605277 Sibi Sankar         2024-06-24  6029  					opp-peak-kBps = <16896000>;
740bc669605277 Sibi Sankar         2024-06-24  6030  				};
740bc669605277 Sibi Sankar         2024-06-24  6031  			};
740bc669605277 Sibi Sankar         2024-06-24  6032  		};
740bc669605277 Sibi Sankar         2024-06-24  6033  
740bc669605277 Sibi Sankar         2024-06-24  6034  		/* cluster0 */
740bc669605277 Sibi Sankar         2024-06-24  6035  		pmu@240b3400 {
740bc669605277 Sibi Sankar         2024-06-24  6036  			compatible = "qcom,x1e80100-cpu-bwmon", "qcom,sdm845-bwmon";
740bc669605277 Sibi Sankar         2024-06-24  6037  			reg = <0 0x240b3400 0 0x600>;
740bc669605277 Sibi Sankar         2024-06-24  6038  
740bc669605277 Sibi Sankar         2024-06-24  6039  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
740bc669605277 Sibi Sankar         2024-06-24  6040  
740bc669605277 Sibi Sankar         2024-06-24  6041  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
740bc669605277 Sibi Sankar         2024-06-24  6042  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
740bc669605277 Sibi Sankar         2024-06-24  6043  
740bc669605277 Sibi Sankar         2024-06-24  6044  			operating-points-v2 = <&cpu_bwmon_opp_table>;
740bc669605277 Sibi Sankar         2024-06-24  6045  
740bc669605277 Sibi Sankar         2024-06-24  6046  			cpu_bwmon_opp_table: opp-table {
740bc669605277 Sibi Sankar         2024-06-24  6047  				compatible = "operating-points-v2";
740bc669605277 Sibi Sankar         2024-06-24  6048  
740bc669605277 Sibi Sankar         2024-06-24  6049  				opp-0 {
740bc669605277 Sibi Sankar         2024-06-24  6050  					opp-peak-kBps = <4800000>;
740bc669605277 Sibi Sankar         2024-06-24  6051  				};
740bc669605277 Sibi Sankar         2024-06-24  6052  
740bc669605277 Sibi Sankar         2024-06-24  6053  				opp-1 {
740bc669605277 Sibi Sankar         2024-06-24  6054  					opp-peak-kBps = <7464000>;
740bc669605277 Sibi Sankar         2024-06-24  6055  				};
740bc669605277 Sibi Sankar         2024-06-24  6056  
740bc669605277 Sibi Sankar         2024-06-24  6057  				opp-2 {
740bc669605277 Sibi Sankar         2024-06-24  6058  					opp-peak-kBps = <9600000>;
740bc669605277 Sibi Sankar         2024-06-24  6059  				};
740bc669605277 Sibi Sankar         2024-06-24  6060  
740bc669605277 Sibi Sankar         2024-06-24  6061  				opp-3 {
740bc669605277 Sibi Sankar         2024-06-24  6062  					opp-peak-kBps = <12896000>;
740bc669605277 Sibi Sankar         2024-06-24  6063  				};
740bc669605277 Sibi Sankar         2024-06-24  6064  
740bc669605277 Sibi Sankar         2024-06-24  6065  				opp-4 {
740bc669605277 Sibi Sankar         2024-06-24  6066  					opp-peak-kBps = <14928000>;
740bc669605277 Sibi Sankar         2024-06-24  6067  				};
740bc669605277 Sibi Sankar         2024-06-24  6068  
740bc669605277 Sibi Sankar         2024-06-24  6069  				opp-5 {
740bc669605277 Sibi Sankar         2024-06-24  6070  					opp-peak-kBps = <17064000>;
740bc669605277 Sibi Sankar         2024-06-24  6071  				};
740bc669605277 Sibi Sankar         2024-06-24  6072  			};
740bc669605277 Sibi Sankar         2024-06-24  6073  		};
740bc669605277 Sibi Sankar         2024-06-24  6074  
740bc669605277 Sibi Sankar         2024-06-24  6075  		/* cluster2 */
740bc669605277 Sibi Sankar         2024-06-24  6076  		pmu@240b5400 {
740bc669605277 Sibi Sankar         2024-06-24  6077  			compatible = "qcom,x1e80100-cpu-bwmon", "qcom,sdm845-bwmon";
740bc669605277 Sibi Sankar         2024-06-24  6078  			reg = <0 0x240b5400 0 0x600>;
740bc669605277 Sibi Sankar         2024-06-24  6079  
740bc669605277 Sibi Sankar         2024-06-24  6080  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
740bc669605277 Sibi Sankar         2024-06-24  6081  
740bc669605277 Sibi Sankar         2024-06-24  6082  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
740bc669605277 Sibi Sankar         2024-06-24  6083  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
740bc669605277 Sibi Sankar         2024-06-24  6084  
740bc669605277 Sibi Sankar         2024-06-24  6085  			operating-points-v2 = <&cpu_bwmon_opp_table>;
740bc669605277 Sibi Sankar         2024-06-24  6086  		};
740bc669605277 Sibi Sankar         2024-06-24  6087  
740bc669605277 Sibi Sankar         2024-06-24  6088  		/* cluster1 */
740bc669605277 Sibi Sankar         2024-06-24  6089  		pmu@240b6400 {
740bc669605277 Sibi Sankar         2024-06-24  6090  			compatible = "qcom,x1e80100-cpu-bwmon", "qcom,sdm845-bwmon";
740bc669605277 Sibi Sankar         2024-06-24  6091  			reg = <0 0x240b6400 0 0x600>;
740bc669605277 Sibi Sankar         2024-06-24  6092  
740bc669605277 Sibi Sankar         2024-06-24  6093  			interrupts = <GIC_SPI 581 IRQ_TYPE_LEVEL_HIGH>;
740bc669605277 Sibi Sankar         2024-06-24  6094  
740bc669605277 Sibi Sankar         2024-06-24  6095  			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
740bc669605277 Sibi Sankar         2024-06-24  6096  					 &gem_noc SLAVE_LLCC QCOM_ICC_TAG_ACTIVE_ONLY>;
740bc669605277 Sibi Sankar         2024-06-24  6097  
740bc669605277 Sibi Sankar         2024-06-24  6098  			operating-points-v2 = <&cpu_bwmon_opp_table>;
740bc669605277 Sibi Sankar         2024-06-24  6099  		};
740bc669605277 Sibi Sankar         2024-06-24  6100  
af16b00578a7a1 Rajendra Nayak      2023-12-05  6101  		system-cache-controller@25000000 {
af16b00578a7a1 Rajendra Nayak      2023-12-05  6102  			compatible = "qcom,x1e80100-llcc";
af16b00578a7a1 Rajendra Nayak      2023-12-05  6103  			reg = <0 0x25000000 0 0x200000>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  6104  			      <0 0x25200000 0 0x200000>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  6105  			      <0 0x25400000 0 0x200000>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  6106  			      <0 0x25600000 0 0x200000>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  6107  			      <0 0x25800000 0 0x200000>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  6108  			      <0 0x25a00000 0 0x200000>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  6109  			      <0 0x25c00000 0 0x200000>,
af16b00578a7a1 Rajendra Nayak      2023-12-05  6110  			      <0 0x25e00000 0 0x200000>,
80fe25fcc60520 Abel Vesa           2024-10-14  6111  			      <0 0x26000000 0 0x200000>,
80fe25fcc60520 Abel Vesa           2024-10-14  6112  			      <0 0x26200000 0 0x200000>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  6113  			reg-names = "llcc0_base",
af16b00578a7a1 Rajendra Nayak      2023-12-05  6114  				    "llcc1_base",
af16b00578a7a1 Rajendra Nayak      2023-12-05  6115  				    "llcc2_base",
af16b00578a7a1 Rajendra Nayak      2023-12-05  6116  				    "llcc3_base",
af16b00578a7a1 Rajendra Nayak      2023-12-05  6117  				    "llcc4_base",
af16b00578a7a1 Rajendra Nayak      2023-12-05  6118  				    "llcc5_base",
af16b00578a7a1 Rajendra Nayak      2023-12-05  6119  				    "llcc6_base",
af16b00578a7a1 Rajendra Nayak      2023-12-05  6120  				    "llcc7_base",
80fe25fcc60520 Abel Vesa           2024-10-14  6121  				    "llcc_broadcast_base",
80fe25fcc60520 Abel Vesa           2024-10-14  6122  				    "llcc_broadcast_and_base";
af16b00578a7a1 Rajendra Nayak      2023-12-05  6123  			interrupts = <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>;
af16b00578a7a1 Rajendra Nayak      2023-12-05  6124  		};
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6125  
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6126  		remoteproc_adsp: remoteproc@30000000 {
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6127  			compatible = "qcom,x1e80100-adsp-pas";
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6128  			reg = <0 0x30000000 0 0x100>;
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6129  
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6130  			interrupts-extended = <&pdc 6 IRQ_TYPE_EDGE_RISING>,
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6131  					      <&smp2p_adsp_in 0 IRQ_TYPE_EDGE_RISING>,
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6132  					      <&smp2p_adsp_in 1 IRQ_TYPE_EDGE_RISING>,
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6133  					      <&smp2p_adsp_in 2 IRQ_TYPE_EDGE_RISING>,
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6134  					      <&smp2p_adsp_in 3 IRQ_TYPE_EDGE_RISING>;
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6135  			interrupt-names = "wdog",
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6136  					  "fatal",
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6137  					  "ready",
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6138  					  "handover",
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6139  					  "stop-ack";
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6140  
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6141  			clocks = <&rpmhcc RPMH_CXO_CLK>;
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6142  			clock-names = "xo";
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6143  
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6144  			power-domains = <&rpmhpd RPMHPD_LCX>,
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6145  					<&rpmhpd RPMHPD_LMX>;
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6146  			power-domain-names = "lcx",
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6147  					     "lmx";
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6148  
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6149  			interconnects = <&lpass_lpicx_noc MASTER_LPASS_PROC QCOM_ICC_TAG_ALWAYS
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6150  					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6151  
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6152  			memory-region = <&adspslpi_mem>,
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6153  					<&q6_adsp_dtb_mem>;
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6154  
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6155  			qcom,qmp = <&aoss_qmp>;
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6156  
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6157  			qcom,smem-states = <&smp2p_adsp_out 0>;
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6158  			qcom,smem-state-names = "stop";
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6159  
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6160  			status = "disabled";
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6161  
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6162  			glink-edge {
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6163  				interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6164  							     IPCC_MPROC_SIGNAL_GLINK_QMP
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6165  							     IRQ_TYPE_EDGE_RISING>;
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6166  				mboxes = <&ipcc IPCC_CLIENT_LPASS
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6167  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6168  
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6169  				label = "lpass";
5f2a9cd4b1042a Sibi Sankar         2024-01-29  6170  				qcom,remote-pid = <2>;
99f63aea9149e0 Krzysztof Kozlowski 2023-12-12  6171  
653f0a1e7d6123 Sibi Sankar         2024-06-24  6172  				fastrpc {
653f0a1e7d6123 Sibi Sankar         2024-06-24  6173  					compatible = "qcom,fastrpc";
653f0a1e7d6123 Sibi Sankar         2024-06-24  6174  					qcom,glink-channels = "fastrpcglink-apps-dsp";
653f0a1e7d6123 Sibi Sankar         2024-06-24  6175  					label = "adsp";
653f0a1e7d6123 Sibi Sankar         2024-06-24  6176  					qcom,non-secure-domain;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6177  					#address-cells = <1>;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6178  					#size-cells = <0>;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6179  
653f0a1e7d6123 Sibi Sankar         2024-06-24  6180  					compute-cb@3 {
653f0a1e7d6123 Sibi Sankar         2024-06-24  6181  						compatible = "qcom,fastrpc-compute-cb";
653f0a1e7d6123 Sibi Sankar         2024-06-24  6182  						reg = <3>;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6183  						iommus = <&apps_smmu 0x1003 0x80>,
653f0a1e7d6123 Sibi Sankar         2024-06-24  6184  							 <&apps_smmu 0x1063 0x0>;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6185  						dma-coherent;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6186  					};
653f0a1e7d6123 Sibi Sankar         2024-06-24  6187  
653f0a1e7d6123 Sibi Sankar         2024-06-24  6188  					compute-cb@4 {
653f0a1e7d6123 Sibi Sankar         2024-06-24  6189  						compatible = "qcom,fastrpc-compute-cb";
653f0a1e7d6123 Sibi Sankar         2024-06-24  6190  						reg = <4>;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6191  						iommus = <&apps_smmu 0x1004 0x80>,
653f0a1e7d6123 Sibi Sankar         2024-06-24  6192  							 <&apps_smmu 0x1064 0x0>;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6193  						dma-coherent;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6194  					};
653f0a1e7d6123 Sibi Sankar         2024-06-24  6195  
653f0a1e7d6123 Sibi Sankar         2024-06-24  6196  					compute-cb@5 {
653f0a1e7d6123 Sibi Sankar         2024-06-24  6197  						compatible = "qcom,fastrpc-compute-cb";
653f0a1e7d6123 Sibi Sankar         2024-06-24  6198  						reg = <5>;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6199  						iommus = <&apps_smmu 0x1005 0x80>,
653f0a1e7d6123 Sibi Sankar         2024-06-24  6200  							 <&apps_smmu 0x1065 0x0>;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6201  						dma-coherent;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6202  					};
653f0a1e7d6123 Sibi Sankar         2024-06-24  6203  
653f0a1e7d6123 Sibi Sankar         2024-06-24  6204  					compute-cb@6 {
653f0a1e7d6123 Sibi Sankar         2024-06-24  6205  						compatible = "qcom,fastrpc-compute-cb";
653f0a1e7d6123 Sibi Sankar         2024-06-24  6206  						reg = <6>;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6207  						iommus = <&apps_smmu 0x1006 0x80>,
653f0a1e7d6123 Sibi Sankar         2024-06-24  6208  							 <&apps_smmu 0x1066 0x0>;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6209  						dma-coherent;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6210  					};
653f0a1e7d6123 Sibi Sankar         2024-06-24  6211  
653f0a1e7d6123 Sibi Sankar         2024-06-24  6212  					compute-cb@7 {
653f0a1e7d6123 Sibi Sankar         2024-06-24  6213  						compatible = "qcom,fastrpc-compute-cb";
653f0a1e7d6123 Sibi Sankar         2024-06-24  6214  						reg = <7>;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6215  						iommus = <&apps_smmu 0x1007 0x80>,
653f0a1e7d6123 Sibi Sankar         2024-06-24  6216  							 <&apps_smmu 0x1067 0x0>;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6217  						dma-coherent;
653f0a1e7d6123 Sibi Sankar         2024-06-24  6218  					};
653f0a1e7d6123 Sibi Sankar         2024-06-24  6219  				};
653f0a1e7d6123 Sibi Sankar         2024-06-24  6220  
99f63aea9149e0 Krzysztof Kozlowski 2023-12-12  6221  				gpr {
99f63aea9149e0 Krzysztof Kozlowski 2023-12-12  6222  					compatible = "qcom,gpr";
99f63aea9149e0 Krzysztof Kozlowski 2023-12-12  6223  					qcom,glink-channels = "adsp_apps";
99f63aea9149e0 Krzysztof Kozlowski 2023-12-12  6224  					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
99f63aea9149e0 Krzysztof Kozlowski 2023-12-12  6225  					qcom,intents = <512 20>;
99f63aea9149e0 Krzysztof Kozlowski 2023-12-12  6226  					#address-cells = <1>;
99f63aea9149e0 Krzysztof Kozlowski 2023-12-12  6227  					#size-cells = <0>;
99f63aea9149e0 Krzysztof Kozlowski 2023-12-12  6228  
99f63aea9149e0 Krzysztof Kozlowski 2023-12-12 @6229  					q6apm: service@1 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
