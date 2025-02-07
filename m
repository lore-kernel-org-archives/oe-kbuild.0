Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BC01DE8BE
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Feb 2025 06:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738908736; cv=none; b=J9TGYlHUs7OCt8s3zHONYdIJmFDV2sKXVWXHX+Ws49E9VAaKfQ+Hy/fiXg4FrOvyo7CRy8ewVI+bubJKB477686NVFkzb4e3XYgjhMuv/Ij+SKJjZ+6xhjVFn0geZjKGYHPjuqkb7tYFOMfzIL3jzzb5deqKDj5rzimzPfWv5Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738908736; c=relaxed/simple;
	bh=1HO+kIxNjp6pGnGK1LvUV7/JmfCNOWD27FRWwzcrwp8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Df5GCrjmPD84L/gfMx1AnupCUFlkS+4ET+sxIbIWfbAnEs+1UFdM+4GsTIXEJ/P+4o2pqRzbOzTjBDxwNeQdxwPUCWXCC9/3DO6RiOr6hBpbFC08os4Ua4GshUCmfHFi6lIrV5rPqDckkysQMqAqjBwyh63tB2flD/+pZIWYdQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TcwAjH+n; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TcwAjH+n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738908735; x=1770444735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1HO+kIxNjp6pGnGK1LvUV7/JmfCNOWD27FRWwzcrwp8=;
  b=TcwAjH+nBajjJo86gtAcB5qGd0xH6BDfeQoQisKm1YbI/2U03jqnGptE
   U8E//EGLTgii1S0zBTN4ndzNRK25LyOw5JhB4gEMyHpE31qMDqIK9pSCy
   GjIinvOWkwNE7nty1xMm3Cn0CZUw7X55LzarTqAEne/3ne8Ljzvb+vu2p
   PMeFSncvaZGSXXOhytoz4YMEc3Y193DaP8KsLFl6XnNY5ny3ZQshb2w2h
   flskeBuWEl8dY5KS1yhgOA2pCvUmm1X6nPQ6pPjwz82QF3E0HJ111sGOd
   Rp0B348jF3RYbGCz6QgIcpHdWICrHEIAm+cPvrSyUdxuD4p/qCwIyYn7r
   Q==;
X-CSE-ConnectionGUID: qkqpbWE1S0e7vTb9otlB5g==
X-CSE-MsgGUID: CbQYhzSqTT+5XfAAOca27Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39656642"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39656642"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 22:12:14 -0800
X-CSE-ConnectionGUID: 5nPVBYoMSlCqFL9An3Gwkw==
X-CSE-MsgGUID: ngnn6H6gSSi7BpjL9eZshA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116049411"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2025 22:12:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgHaz-000xod-0W;
	Fri, 07 Feb 2025 06:12:09 +0000
Date: Fri, 7 Feb 2025 14:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sc7180-trogdor: Wire up USB to
 usb-c-connectors
Message-ID: <202502071322.hWsz0XWw-lkp@intel.com>
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
In-Reply-To: <20250205233016.1600517-3-swboyd@chromium.org>
References: <20250205233016.1600517-3-swboyd@chromium.org>
TO: Stephen Boyd <swboyd@chromium.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: patches@lists.linux.dev
CC: cros-qcom-dts-watchers@chromium.org
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: devicetree@vger.kernel.org
CC: "Pin-yen Lin" <treapking@chromium.org>

Hi Stephen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Stephen-Boyd/dt-bindings-chrome-Add-binding-for-ChromeOS-Pogo-pin-connector/20250206-073318
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250205233016.1600517-3-swboyd%40chromium.org
patch subject: [PATCH v2 2/2] arm64: dts: qcom: sc7180-trogdor: Wire up USB to usb-c-connectors
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-052-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071322.hWsz0XWw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250207/202502071322.hWsz0XWw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502071322.hWsz0XWw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1002.21-1042.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1045.21-1086.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3265.27-3336.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1002.21-1042.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1045.21-1086.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3265.27-3336.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm6150.dtsi:135.30-143.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@0/adc-tm@3500: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1002.21-1042.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1045.21-1086.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3265.27-3336.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1002.21-1042.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1045.21-1086.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3265.27-3336.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1002.21-1042.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1045.21-1086.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3265.27-3336.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1002.21-1042.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1045.21-1086.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3265.27-3336.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1002.21-1042.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1045.21-1086.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180.dtsi:3265.27-3336.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1002.21-1042.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1045.21-1086.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1002.21-1042.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1045.21-1086.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-quackingstick-r0-lte.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1002.21-1042.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1045.21-1086.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1002.21-1042.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1045.21-1086.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1002.21-1042.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1045.21-1086.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1002.21-1042.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi:1045.21-1086.4: Warning (avoid_unnecessary_addr_size): /soc@0/usb@a6f8800/usb@a600000/hub@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#

vim +1002 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi

7ec3e67307f861 Rob Clark         2020-08-28   995  
7ec3e67307f861 Rob Clark         2020-08-28   996  &usb_1_dwc3 {
7ec3e67307f861 Rob Clark         2020-08-28   997  	dr_mode = "host";
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22   998  	#address-cells = <1>;
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22   999  	#size-cells = <0>;
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1000  
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1001  	/* 2.x hub on port 1 */
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22 @1002  	usb_hub_2_x: hub@1 {
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1003  		compatible = "usbbda,5411";
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1004  		reg = <1>;
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1005  		vdd-supply = <&pp3300_hub>;
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1006  		peer-hub = <&usb_hub_3_x>;
736131f7d7617a Stephen Boyd      2025-02-05  1007  
736131f7d7617a Stephen Boyd      2025-02-05  1008  		#address-cells = <1>;
736131f7d7617a Stephen Boyd      2025-02-05  1009  		#size-cells = <0>;
736131f7d7617a Stephen Boyd      2025-02-05  1010  
736131f7d7617a Stephen Boyd      2025-02-05  1011  		usb_hub_2_x_ports: ports {
736131f7d7617a Stephen Boyd      2025-02-05  1012  			#address-cells = <1>;
736131f7d7617a Stephen Boyd      2025-02-05  1013  			#size-cells = <0>;
736131f7d7617a Stephen Boyd      2025-02-05  1014  
736131f7d7617a Stephen Boyd      2025-02-05  1015  			port@1 {
736131f7d7617a Stephen Boyd      2025-02-05  1016  				reg = <1>;
736131f7d7617a Stephen Boyd      2025-02-05  1017  				usb_hub_dfp1_hs: endpoint {
736131f7d7617a Stephen Boyd      2025-02-05  1018  					/* Endpoint filled in by board */
736131f7d7617a Stephen Boyd      2025-02-05  1019  				};
736131f7d7617a Stephen Boyd      2025-02-05  1020  			};
736131f7d7617a Stephen Boyd      2025-02-05  1021  			port@2 {
736131f7d7617a Stephen Boyd      2025-02-05  1022  				reg = <2>;
736131f7d7617a Stephen Boyd      2025-02-05  1023  				usb_hub_dfp2_hs: endpoint {
736131f7d7617a Stephen Boyd      2025-02-05  1024  					/* Endpoint filled in by board */
736131f7d7617a Stephen Boyd      2025-02-05  1025  				};
736131f7d7617a Stephen Boyd      2025-02-05  1026  			};
736131f7d7617a Stephen Boyd      2025-02-05  1027  
736131f7d7617a Stephen Boyd      2025-02-05  1028  			port@3 {
736131f7d7617a Stephen Boyd      2025-02-05  1029  				reg = <3>;
736131f7d7617a Stephen Boyd      2025-02-05  1030  				usb_hub_dfp3_hs: endpoint {
736131f7d7617a Stephen Boyd      2025-02-05  1031  					/* Endpoint filled in by board */
736131f7d7617a Stephen Boyd      2025-02-05  1032  				};
736131f7d7617a Stephen Boyd      2025-02-05  1033  			};
736131f7d7617a Stephen Boyd      2025-02-05  1034  
736131f7d7617a Stephen Boyd      2025-02-05  1035  			port@4 {
736131f7d7617a Stephen Boyd      2025-02-05  1036  				reg = <4>;
736131f7d7617a Stephen Boyd      2025-02-05  1037  				usb_hub_dfp4_hs: endpoint {
736131f7d7617a Stephen Boyd      2025-02-05  1038  					/* Endpoint filled in by board */
736131f7d7617a Stephen Boyd      2025-02-05  1039  				};
736131f7d7617a Stephen Boyd      2025-02-05  1040  			};
736131f7d7617a Stephen Boyd      2025-02-05  1041  		};
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1042  	};
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1043  
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1044  	/* 3.x hub on port 2 */
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1045  	usb_hub_3_x: hub@2 {
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1046  		compatible = "usbbda,411";
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1047  		reg = <2>;
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1048  		vdd-supply = <&pp3300_hub>;
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1049  		peer-hub = <&usb_hub_2_x>;
736131f7d7617a Stephen Boyd      2025-02-05  1050  
736131f7d7617a Stephen Boyd      2025-02-05  1051  		#address-cells = <1>;
736131f7d7617a Stephen Boyd      2025-02-05  1052  		#size-cells = <0>;
736131f7d7617a Stephen Boyd      2025-02-05  1053  
736131f7d7617a Stephen Boyd      2025-02-05  1054  		usb_hub_3_x_ports: ports {
736131f7d7617a Stephen Boyd      2025-02-05  1055  			#address-cells = <1>;
736131f7d7617a Stephen Boyd      2025-02-05  1056  			#size-cells = <0>;
736131f7d7617a Stephen Boyd      2025-02-05  1057  
736131f7d7617a Stephen Boyd      2025-02-05  1058  			port@1 {
736131f7d7617a Stephen Boyd      2025-02-05  1059  				reg = <1>;
736131f7d7617a Stephen Boyd      2025-02-05  1060  				usb_hub_dfp1_ss: endpoint {
736131f7d7617a Stephen Boyd      2025-02-05  1061  					/* Endpoint filled in by board */
736131f7d7617a Stephen Boyd      2025-02-05  1062  				};
736131f7d7617a Stephen Boyd      2025-02-05  1063  			};
736131f7d7617a Stephen Boyd      2025-02-05  1064  
736131f7d7617a Stephen Boyd      2025-02-05  1065  			port@2 {
736131f7d7617a Stephen Boyd      2025-02-05  1066  				reg = <2>;
736131f7d7617a Stephen Boyd      2025-02-05  1067  				usb_hub_dfp2_ss: endpoint {
736131f7d7617a Stephen Boyd      2025-02-05  1068  					/* Endpoint filled in by board */
736131f7d7617a Stephen Boyd      2025-02-05  1069  				};
736131f7d7617a Stephen Boyd      2025-02-05  1070  			};
736131f7d7617a Stephen Boyd      2025-02-05  1071  
736131f7d7617a Stephen Boyd      2025-02-05  1072  			port@3 {
736131f7d7617a Stephen Boyd      2025-02-05  1073  				reg = <3>;
736131f7d7617a Stephen Boyd      2025-02-05  1074  				usb_hub_dfp3_ss: endpoint {
736131f7d7617a Stephen Boyd      2025-02-05  1075  					/* Endpoint filled in by board */
736131f7d7617a Stephen Boyd      2025-02-05  1076  				};
736131f7d7617a Stephen Boyd      2025-02-05  1077  			};
736131f7d7617a Stephen Boyd      2025-02-05  1078  
736131f7d7617a Stephen Boyd      2025-02-05  1079  			port@4 {
736131f7d7617a Stephen Boyd      2025-02-05  1080  				reg = <4>;
736131f7d7617a Stephen Boyd      2025-02-05  1081  				usb_hub_dfp4_ss: endpoint {
736131f7d7617a Stephen Boyd      2025-02-05  1082  					/* Endpoint filled in by board */
736131f7d7617a Stephen Boyd      2025-02-05  1083  				};
736131f7d7617a Stephen Boyd      2025-02-05  1084  			};
736131f7d7617a Stephen Boyd      2025-02-05  1085  		};
a73dd03bb2e028 Matthias Kaehlcke 2022-07-22  1086  	};
7ec3e67307f861 Rob Clark         2020-08-28  1087  };
7ec3e67307f861 Rob Clark         2020-08-28  1088  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
