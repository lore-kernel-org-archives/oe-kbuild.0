Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22242556E
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Nov 2024 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731173697; cv=none; b=XUsXTrhYOtWXClb6fkQDC5F0dFBy+IPixqdko9zTQvYjsb6iWmCMFAdkEjxZi0bc56ayT01NnfA+aSq2xuWlQHCJSIL/p5GkZX70gnF7JmoYvrbq6kD86jx3FIKxfvKh/X8nbj6vvemAdHsLgGWnJV8IFQGKnC/B1Vb8OvcTUho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731173697; c=relaxed/simple;
	bh=CoG53EF2y5w31nYPYo4lZR/uX1TyW6NtlsW6moWlxn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tI80VTjZFdhqvL6IUdl0NlS+psSiT0p8I2KlKfhJayPbmKgP9fPETrbAugJg0I6bWDuxHExZ4I5GNDCrU0rjo+K5FwgiNT71J+nK1g6JkxZ50oMl7MMkr5v2jv1QYk264HKuaqw+HV2HMo0qUyBUj+DL58BDbqBU4Ona/7VRXwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQZq5sGQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQZq5sGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731173695; x=1762709695;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CoG53EF2y5w31nYPYo4lZR/uX1TyW6NtlsW6moWlxn0=;
  b=XQZq5sGQZI5I3Tb7ojp2kiCEI6jLQ9Tgs5DWAHz/v02UUcbRvbynUejm
   acXw+dQhlrIvl0HRuzoge/O/I7JpiKGmI8wgKxCB45RoxOU+/9N7JH+BI
   zAWlURAXQNao4y+xBNkihSErbjE7DljAAEqkD5RfDr3ZGNFu99SoyOrqx
   rvqdmf+4zALApFQ64Esz5PyDols6XtPHhw/KfHWh/alwF44YwvLegjYuz
   37JbqLMmz8ebPZYfLoanpkaXpwRH8xsRaOYwPbT/YfXHfZjRxlYW8gyyw
   5QHGvLMeym0FyC/bMHnucAMdRL0BRFw9nWCQVyVgrXCdHIWbLyIPjZ080
   A==;
X-CSE-ConnectionGUID: 7HjHDX24SHibPPlJzSUcyg==
X-CSE-MsgGUID: xzLZwG3DQIad+6aLfTPRsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="34821571"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="34821571"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 09:34:54 -0800
X-CSE-ConnectionGUID: xbCpIUffQvaxL+IkGfZWfg==
X-CSE-MsgGUID: zCZF9+73S92d6OVHtlqwAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="90056846"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Nov 2024 09:34:52 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9pMI-000sVm-2J;
	Sat, 09 Nov 2024 17:34:50 +0000
Date: Sun, 10 Nov 2024 01:34:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: qcom: x1e80100-pmics: Add missing
 #address-cells/#size-cells to pmk8550_pon
Message-ID: <202411100116.TVXkFvKW-lkp@intel.com>
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
In-Reply-To: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-3-c1e173369657@linaro.org>
References: <20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-3-c1e173369657@linaro.org>
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
patch link:    https://lore.kernel.org/r/20241109-x1e80100-fix-address-size-cells-missing-warnings-v1-3-c1e173369657%40linaro.org
patch subject: [PATCH 3/3] arm64: dts: qcom: x1e80100-pmics: Add missing #address-cells/#size-cells to pmk8550_pon
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: arm64-randconfig-002-20241109 (https://download.01.org/0day-ci/archive/20241110/202411100116.TVXkFvKW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100116.TVXkFvKW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411100116.TVXkFvKW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi:203.25-222.5: Warning (avoid_unnecessary_addr_size): /soc@0/arbiter@c400000/spmi@c42d000/pmic@0/pon@1300: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi:203.25-222.5: Warning (avoid_unnecessary_addr_size): /soc@0/arbiter@c400000/spmi@c42d000/pmic@0/pon@1300: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi:203.25-222.5: Warning (avoid_unnecessary_addr_size): /soc@0/arbiter@c400000/spmi@c42d000/pmic@0/pon@1300: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi:203.25-222.5: Warning (avoid_unnecessary_addr_size): /soc@0/arbiter@c400000/spmi@c42d000/pmic@0/pon@1300: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi:203.25-222.5: Warning (avoid_unnecessary_addr_size): /soc@0/arbiter@c400000/spmi@c42d000/pmic@0/pon@1300: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi:203.25-222.5: Warning (avoid_unnecessary_addr_size): /soc@0/arbiter@c400000/spmi@c42d000/pmic@0/pon@1300: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi:203.25-222.5: Warning (avoid_unnecessary_addr_size): /soc@0/arbiter@c400000/spmi@c42d000/pmic@0/pon@1300: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:306.11-316.4: Warning (avoid_unnecessary_addr_size): /firmware: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi:203.25-222.5: Warning (avoid_unnecessary_addr_size): /soc@0/arbiter@c400000/spmi@c42d000/pmic@0/pon@1300: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:5792.26-5897.5: Warning (avoid_unnecessary_addr_size): /soc@0/rsc@17500000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6229.23-6248.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:6250.23-6262.8: Warning (avoid_unnecessary_addr_size): /soc@0/remoteproc@30000000/glink-edge/gpr/service@2: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4158.11-4168.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +203 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi

2559e61e7ef4ef Konrad Dybcio 2024-05-29  194  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  195  &spmi_bus0 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  196  	/* PMK8380 */
2559e61e7ef4ef Konrad Dybcio 2024-05-29  197  	pmk8550: pmic@0 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  198  		compatible = "qcom,pm8550", "qcom,spmi-pmic";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  199  		reg = <0x0 SPMI_USID>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  200  		#address-cells = <1>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  201  		#size-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  202  
2559e61e7ef4ef Konrad Dybcio 2024-05-29 @203  		pmk8550_pon: pon@1300 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  204  			compatible = "qcom,pmk8350-pon";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  205  			reg = <0x1300>, <0x800>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  206  			reg-names = "hlos", "pbs";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  207  
6f5cdfb51d862f Abel Vesa     2024-11-09  208  			#address-cells = <1>;
6f5cdfb51d862f Abel Vesa     2024-11-09  209  			#size-cells = <0>;
6f5cdfb51d862f Abel Vesa     2024-11-09  210  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  211  			pon_pwrkey: pwrkey {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  212  				compatible = "qcom,pmk8350-pwrkey";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  213  				interrupts = <0x0 0x13 0x7 IRQ_TYPE_EDGE_BOTH>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  214  				linux,code = <KEY_POWER>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  215  			};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  216  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  217  			pon_resin: resin {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  218  				compatible = "qcom,pmk8350-resin";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  219  				interrupts = <0x0 0x13 0x6 IRQ_TYPE_EDGE_BOTH>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  220  				status = "disabled";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  221  			};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  222  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  223  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  224  		pmk8550_rtc: rtc@6100 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  225  			compatible = "qcom,pmk8350-rtc";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  226  			reg = <0x6100>, <0x6200>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  227  			reg-names = "rtc", "alarm";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  228  			interrupts = <0x0 0x62 0x1 IRQ_TYPE_EDGE_RISING>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  229  			/* Not yet sure what blocks access */
2559e61e7ef4ef Konrad Dybcio 2024-05-29  230  			status = "reserved";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  231  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  232  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  233  		pmk8550_sdam_2: nvram@7100 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  234  			compatible = "qcom,spmi-sdam";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  235  			reg = <0x7100>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  236  			#address-cells = <1>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  237  			#size-cells = <1>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  238  			ranges = <0 0x7100 0x100>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  239  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  240  			reboot_reason: reboot-reason@48 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  241  				reg = <0x48 0x1>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  242  				bits = <1 7>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  243  			};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  244  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  245  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  246  		pmk8550_gpios: gpio@8800 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  247  			compatible = "qcom,pmk8550-gpio", "qcom,spmi-gpio";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  248  			reg = <0xb800>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  249  			gpio-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  250  			gpio-ranges = <&pmk8550_gpios 0 0 6>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  251  			#gpio-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  252  			interrupt-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  253  			#interrupt-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  254  		};
02a1bfb34ca860 Konrad Dybcio 2024-08-26  255  
02a1bfb34ca860 Konrad Dybcio 2024-08-26  256  		pmk8550_pwm: pwm {
02a1bfb34ca860 Konrad Dybcio 2024-08-26  257  			compatible = "qcom,pmk8550-pwm";
02a1bfb34ca860 Konrad Dybcio 2024-08-26  258  
02a1bfb34ca860 Konrad Dybcio 2024-08-26  259  			#pwm-cells = <2>;
02a1bfb34ca860 Konrad Dybcio 2024-08-26  260  
02a1bfb34ca860 Konrad Dybcio 2024-08-26  261  			status = "disabled";
02a1bfb34ca860 Konrad Dybcio 2024-08-26  262  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  263  	};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  264  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  265  	/* PMC8380C */
2559e61e7ef4ef Konrad Dybcio 2024-05-29  266  	pm8550: pmic@1 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  267  		compatible = "qcom,pm8550", "qcom,spmi-pmic";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  268  		reg = <0x1 SPMI_USID>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  269  		#address-cells = <1>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  270  		#size-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  271  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  272  		pm8550_temp_alarm: temp-alarm@a00 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  273  			compatible = "qcom,spmi-temp-alarm";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  274  			reg = <0xa00>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  275  			interrupts = <0x1 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  276  			#thermal-sensor-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  277  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  278  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  279  		pm8550_gpios: gpio@8800 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  280  			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  281  			reg = <0x8800>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  282  			gpio-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  283  			gpio-ranges = <&pm8550_gpios 0 0 12>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  284  			#gpio-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  285  			interrupt-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  286  			#interrupt-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  287  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  288  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  289  		pm8550_flash: led-controller@ee00 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  290  			compatible = "qcom,pm8550-flash-led", "qcom,spmi-flash-led";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  291  			reg = <0xee00>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  292  			status = "disabled";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  293  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  294  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  295  		pm8550_pwm: pwm {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  296  			compatible = "qcom,pm8550-pwm", "qcom,pm8350c-pwm";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  297  			#pwm-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  298  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  299  			status = "disabled";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  300  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  301  	};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  302  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  303  	/* PMC8380VE */
2559e61e7ef4ef Konrad Dybcio 2024-05-29  304  	pm8550ve_2: pmic@2 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  305  		compatible = "qcom,pm8550", "qcom,spmi-pmic";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  306  		reg = <0x2 SPMI_USID>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  307  		#address-cells = <1>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  308  		#size-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  309  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  310  		pm8550ve_2_temp_alarm: temp-alarm@a00 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  311  			compatible = "qcom,spmi-temp-alarm";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  312  			reg = <0xa00>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  313  			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  314  			#thermal-sensor-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  315  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  316  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  317  		pm8550ve_2_gpios: gpio@8800 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  318  			compatible = "qcom,pm8550ve-gpio", "qcom,spmi-gpio";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  319  			reg = <0x8800>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  320  			gpio-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  321  			gpio-ranges = <&pm8550ve_2_gpios 0 0 8>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  322  			#gpio-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  323  			interrupt-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  324  			#interrupt-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  325  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  326  	};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  327  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  328  	/* PMC8380 is actually not a PM8550 series rebrand */
2559e61e7ef4ef Konrad Dybcio 2024-05-29  329  	pmc8380_3: pmic@3 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  330  		compatible = "qcom,pmc8380", "qcom,spmi-pmic";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  331  		reg = <0x3 SPMI_USID>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  332  		#address-cells = <1>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  333  		#size-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  334  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  335  		pmc8380_3_temp_alarm: temp-alarm@a00 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  336  			compatible = "qcom,spmi-temp-alarm";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  337  			reg = <0xa00>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  338  			interrupts = <0x3 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  339  			#thermal-sensor-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  340  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  341  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  342  		pmc8380_3_gpios: gpio@8800 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  343  			compatible = "qcom,pmc8380-gpio", "qcom,spmi-gpio";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  344  			reg = <0x8800>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  345  			gpio-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  346  			gpio-ranges = <&pmc8380_3_gpios 0 0 10>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  347  			#gpio-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  348  			interrupt-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  349  			#interrupt-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  350  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  351  	};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  352  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  353  	pmc8380_4: pmic@4 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  354  		compatible = "qcom,pmc8380", "qcom,spmi-pmic";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  355  		reg = <0x4 SPMI_USID>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  356  		#address-cells = <1>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  357  		#size-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  358  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  359  		pmc8380_4_temp_alarm: temp-alarm@a00 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  360  			compatible = "qcom,spmi-temp-alarm";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  361  			reg = <0xa00>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  362  			interrupts = <0x4 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  363  			#thermal-sensor-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  364  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  365  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  366  		pmc8380_4_gpios: gpio@8800 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  367  			compatible = "qcom,pmc8380-gpio", "qcom,spmi-gpio";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  368  			reg = <0x8800>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  369  			gpio-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  370  			gpio-ranges = <&pmc8380_4_gpios 0 0 10>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  371  			#gpio-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  372  			interrupt-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  373  			#interrupt-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  374  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  375  	};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  376  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  377  	pmc8380_5: pmic@5 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  378  		compatible = "qcom,pmc8380", "qcom,spmi-pmic";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  379  		reg = <0x5 SPMI_USID>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  380  		#address-cells = <1>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  381  		#size-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  382  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  383  		pmc8380_5_temp_alarm: temp-alarm@a00 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  384  			compatible = "qcom,spmi-temp-alarm";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  385  			reg = <0xa00>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  386  			interrupts = <0x5 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  387  			#thermal-sensor-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  388  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  389  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  390  		pmc8380_5_gpios: gpio@8800 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  391  			compatible = "qcom,pmc8380-gpio", "qcom,spmi-gpio";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  392  			reg = <0x8800>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  393  			gpio-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  394  			gpio-ranges = <&pmc8380_5_gpios 0 0 10>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  395  			#gpio-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  396  			interrupt-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  397  			#interrupt-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  398  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  399  	};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  400  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  401  	pmc8380_6: pmic@6 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  402  		compatible = "qcom,pmc8380", "qcom,spmi-pmic";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  403  		reg = <0x6 SPMI_USID>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  404  		#address-cells = <1>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  405  		#size-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  406  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  407  		pmc8380_6_temp_alarm: temp-alarm@a00 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  408  			compatible = "qcom,spmi-temp-alarm";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  409  			reg = <0xa00>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  410  			interrupts = <0x6 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  411  			#thermal-sensor-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  412  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  413  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  414  		pmc8380_6_gpios: gpio@8800 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  415  			compatible = "qcom,pmc8380-gpio", "qcom,spmi-gpio";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  416  			reg = <0x8800>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  417  			gpio-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  418  			gpio-ranges = <&pmc8380_6_gpios 0 0 10>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  419  			#gpio-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  420  			interrupt-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  421  			#interrupt-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  422  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  423  	};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  424  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  425  	/* PMC8380VE */
2559e61e7ef4ef Konrad Dybcio 2024-05-29  426  	pm8550ve_8: pmic@8 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  427  		compatible = "qcom,pm8550", "qcom,spmi-pmic";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  428  		reg = <0x8 SPMI_USID>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  429  		#address-cells = <1>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  430  		#size-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  431  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  432  		pm8550ve_8_temp_alarm: temp-alarm@a00 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  433  			compatible = "qcom,spmi-temp-alarm";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  434  			reg = <0xa00>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  435  			interrupts = <0x8 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  436  			#thermal-sensor-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  437  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  438  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  439  		pm8550ve_8_gpios: gpio@8800 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  440  			compatible = "qcom,pm8550ve-gpio", "qcom,spmi-gpio";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  441  			reg = <0x8800>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  442  			gpio-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  443  			gpio-ranges = <&pm8550ve_8_gpios 0 0 8>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  444  			#gpio-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  445  			interrupt-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  446  			#interrupt-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  447  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  448  	};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  449  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  450  	/* PMC8380VE */
2559e61e7ef4ef Konrad Dybcio 2024-05-29  451  	pm8550ve_9: pmic@9 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  452  		compatible = "qcom,pm8550", "qcom,spmi-pmic";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  453  		reg = <0x9 SPMI_USID>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  454  		#address-cells = <1>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  455  		#size-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  456  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  457  		pm8550ve_9_temp_alarm: temp-alarm@a00 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  458  			compatible = "qcom,spmi-temp-alarm";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  459  			reg = <0xa00>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  460  			interrupts = <0x9 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  461  			#thermal-sensor-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  462  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  463  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  464  		pm8550ve_9_gpios: gpio@8800 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  465  			compatible = "qcom,pm8550ve-gpio", "qcom,spmi-gpio";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  466  			reg = <0x8800>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  467  			gpio-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  468  			gpio-ranges = <&pm8550ve_9_gpios 0 0 8>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  469  			#gpio-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  470  			interrupt-controller;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  471  			#interrupt-cells = <2>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  472  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  473  	};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  474  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  475  	pm8010: pmic@c {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  476  		compatible = "qcom,pm8010", "qcom,spmi-pmic";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  477  		reg = <0xc SPMI_USID>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  478  		#address-cells = <1>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  479  		#size-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  480  
2559e61e7ef4ef Konrad Dybcio 2024-05-29  481  		pm8010_temp_alarm: temp-alarm@2400 {
2559e61e7ef4ef Konrad Dybcio 2024-05-29  482  			compatible = "qcom,spmi-temp-alarm";
2559e61e7ef4ef Konrad Dybcio 2024-05-29  483  			reg = <0x2400>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  484  			interrupts = <0xc 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  485  			#thermal-sensor-cells = <0>;
2559e61e7ef4ef Konrad Dybcio 2024-05-29  486  		};
2559e61e7ef4ef Konrad Dybcio 2024-05-29  487  	};
3298d47894b0f3 Abel Vesa     2024-02-22  488  };
3298d47894b0f3 Abel Vesa     2024-02-22  489  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
