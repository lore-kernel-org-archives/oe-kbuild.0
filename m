Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1E51BF54
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Jul 2024 21:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721683988; cv=none; b=uyAzFSNjlBW4+wMibgah0m1zgujAM7Ns4X1YsYtvGukPEjBNH6Tkf+e9g/pxde1hHXbZFQrsA0l+VhmrKMDnJXCjnoti0np3Lxd2hZcCC+tEJJNpyL6bZd0DNr8t0k+EekPB5Ajag7pYWZ1hv4VmqUbh5Z/3oCplaAbg9kONYSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721683988; c=relaxed/simple;
	bh=y+3n+rREuvkRsatuyybKok9YI41fuEysIT6Z21xqy3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/YZU7huwQg+Hbf9NQlSlGeYQGPLO9TCAmXNQyc7pSlkkAJUurA7i07/blNHwGcxL5KbRMeUKgkWO0gQniq2EV3uxExi+bPBibA9I4V6872i+lxBMDNhs1MkdxOWboDDsGQaY3QYVCPhU7ENuRfXcv/LL/hDRVQJPKIDo8zY4Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5NaRX2L; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5NaRX2L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721683987; x=1753219987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y+3n+rREuvkRsatuyybKok9YI41fuEysIT6Z21xqy3c=;
  b=I5NaRX2Lsn+Jz1PuToaha+v4sZstt4LdVhoxamiUy2tnw9WVRMmjRAHc
   18dN0wGNTG3sFwEoSJG8ZlPHJFXipkFMTomPNnABMCD5CTf6gW4LAXwod
   fmBYALgTWoWHNrsjv/yJyK/JB3BLOjHfTu83Hr14YsZSgNnvGRMrf8zdR
   TLecforuqZyMcIYJvJHjuYbryHOO3agTf1d5PB1o+PMY4zcCLK51tT7i1
   MaOeQkf5eOBdKyfVAlKiPvKJmYrVBNG3zwrjD5BPxIVuFue6i5VpMICTN
   2/AhnFAWpowqz4s8gqkllgiZ5Qi8vf2BkBlK3/wkxR+G56Cp6PetaRv65
   Q==;
X-CSE-ConnectionGUID: Js0lqxljTvClv8RK8d3iyg==
X-CSE-MsgGUID: VksjPngrQyuU6Q/OW9/URQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29894447"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="29894447"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 14:33:06 -0700
X-CSE-ConnectionGUID: VOYIQ+bSSCS1FFb7ya2keA==
X-CSE-MsgGUID: uHRQeBHKRO2/A1J22i2DsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="51662149"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 Jul 2024 14:33:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW0eQ-000lQ0-2U;
	Mon, 22 Jul 2024 21:32:58 +0000
Date: Tue, 23 Jul 2024 05:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 10/12] arm64: dts: qcom: sm6115-pro1x: Enable RGB LED
Message-ID: <202407230526.zgGB2VsT-lkp@intel.com>
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
In-Reply-To: <20240722-qx1050-feature-expansion-v1-10-c4d486435b96@riseup.net>
References: <20240722-qx1050-feature-expansion-v1-10-c4d486435b96@riseup.net>
TO: Dang Huynh <danct12@riseup.net>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konrad.dybcio@linaro.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: phone-devel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Dang Huynh <danct12@riseup.net>

Hi Dang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 41c196e567fb1ea97f68a2ffb7faab451cd90854]

url:    https://github.com/intel-lab-lkp/linux/commits/Dang-Huynh/arm64-dts-qcom-sm6115-pro1x-Add-Hall-Switch-and-Camera-Button/20240722-152151
base:   41c196e567fb1ea97f68a2ffb7faab451cd90854
patch link:    https://lore.kernel.org/r/20240722-qx1050-feature-expansion-v1-10-c4d486435b96%40riseup.net
patch subject: [PATCH 10/12] arm64: dts: qcom: sm6115-pro1x: Enable RGB LED
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-003-20240722 (https://download.01.org/0day-ci/archive/20240723/202407230526.zgGB2VsT-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407230526.zgGB2VsT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407230526.zgGB2VsT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/pmi632.dtsi:189.19-201.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@1c40000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1881.11-1891.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +189 arch/arm64/boot/dts/qcom/pmi632.dtsi

a1f0f2ebb044c7 Luca Weiss       2023-05-23   39  
a1f0f2ebb044c7 Luca Weiss       2023-05-23   40  &spmi_bus {
a1f0f2ebb044c7 Luca Weiss       2023-05-23   41  	pmic@2 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23   42  		compatible = "qcom,pmi632", "qcom,spmi-pmic";
a1f0f2ebb044c7 Luca Weiss       2023-05-23   43  		reg = <0x2 SPMI_USID>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23   44  		#address-cells = <1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23   45  		#size-cells = <0>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23   46  
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   47  		pmi632_vbus: usb-vbus-regulator@1100 {
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   48  			compatible = "qcom,pmi632-vbus-reg", "qcom,pm8150b-vbus-reg";
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   49  			reg = <0x1100>;
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   50  			status = "disabled";
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   51  		};
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   52  
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   53  		pmi632_typec: typec@1500 {
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   54  			compatible = "qcom,pmi632-typec";
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   55  			reg = <0x1500>;
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   56  			interrupts = <0x2 0x15 0x00 IRQ_TYPE_EDGE_RISING>,
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   57  				     <0x2 0x15 0x01 IRQ_TYPE_EDGE_BOTH>,
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   58  				     <0x2 0x15 0x02 IRQ_TYPE_EDGE_RISING>,
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   59  				     <0x2 0x15 0x03 IRQ_TYPE_EDGE_BOTH>,
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   60  				     <0x2 0x15 0x04 IRQ_TYPE_EDGE_RISING>,
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   61  				     <0x2 0x15 0x05 IRQ_TYPE_EDGE_RISING>,
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   62  				     <0x2 0x15 0x06 IRQ_TYPE_EDGE_BOTH>,
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   63  				     <0x2 0x15 0x07 IRQ_TYPE_EDGE_RISING>;
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   64  			interrupt-names = "or-rid-detect-change",
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   65  					  "vpd-detect",
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   66  					  "cc-state-change",
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   67  					  "vconn-oc",
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   68  					  "vbus-change",
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   69  					  "attach-detach",
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   70  					  "legacy-cable-detect",
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   71  					  "try-snk-src-detect";
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   72  			vdd-vbus-supply = <&pmi632_vbus>;
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   73  
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   74  			status = "disabled";
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   75  		};
f69b3e40f46e8c Dmitry Baryshkov 2024-01-30   76  
a1f0f2ebb044c7 Luca Weiss       2023-05-23   77  		pmi632_temp: temp-alarm@2400 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23   78  			compatible = "qcom,spmi-temp-alarm";
a1f0f2ebb044c7 Luca Weiss       2023-05-23   79  			reg = <0x2400>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23   80  			interrupts = <0x2 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23   81  			#thermal-sensor-cells = <0>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23   82  		};
a1f0f2ebb044c7 Luca Weiss       2023-05-23   83  
a1f0f2ebb044c7 Luca Weiss       2023-05-23   84  		pmi632_adc: adc@3100 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23   85  			compatible = "qcom,spmi-adc5";
a1f0f2ebb044c7 Luca Weiss       2023-05-23   86  			reg = <0x3100>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23   87  			#address-cells = <1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23   88  			#size-cells = <0>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23   89  			#io-channel-cells = <1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23   90  			interrupts = <0x2 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23   91  
a1f0f2ebb044c7 Luca Weiss       2023-05-23   92  			channel@0 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23   93  				reg = <ADC5_REF_GND>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23   94  				qcom,pre-scaling = <1 1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23   95  				label = "ref_gnd";
a1f0f2ebb044c7 Luca Weiss       2023-05-23   96  			};
a1f0f2ebb044c7 Luca Weiss       2023-05-23   97  
a1f0f2ebb044c7 Luca Weiss       2023-05-23   98  			channel@1 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23   99  				reg = <ADC5_1P25VREF>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  100  				qcom,pre-scaling = <1 1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  101  				label = "vref_1p25";
a1f0f2ebb044c7 Luca Weiss       2023-05-23  102  			};
a1f0f2ebb044c7 Luca Weiss       2023-05-23  103  
a1f0f2ebb044c7 Luca Weiss       2023-05-23  104  			channel@6 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23  105  				reg = <ADC5_DIE_TEMP>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  106  				qcom,pre-scaling = <1 1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  107  				label = "die_temp";
a1f0f2ebb044c7 Luca Weiss       2023-05-23  108  			};
a1f0f2ebb044c7 Luca Weiss       2023-05-23  109  
a1f0f2ebb044c7 Luca Weiss       2023-05-23  110  			channel@7 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23  111  				reg = <ADC5_USB_IN_I>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  112  				qcom,pre-scaling = <1 1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  113  				label = "usb_in_i_uv";
a1f0f2ebb044c7 Luca Weiss       2023-05-23  114  			};
a1f0f2ebb044c7 Luca Weiss       2023-05-23  115  
a1f0f2ebb044c7 Luca Weiss       2023-05-23  116  			channel@8 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23  117  				reg = <ADC5_USB_IN_V_16>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  118  				qcom,pre-scaling = <1 16>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  119  				label = "usb_in_v_div_16";
a1f0f2ebb044c7 Luca Weiss       2023-05-23  120  			};
a1f0f2ebb044c7 Luca Weiss       2023-05-23  121  
a1f0f2ebb044c7 Luca Weiss       2023-05-23  122  			channel@9 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23  123  				reg = <ADC5_CHG_TEMP>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  124  				qcom,pre-scaling = <1 1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  125  				label = "chg_temp";
a1f0f2ebb044c7 Luca Weiss       2023-05-23  126  			};
a1f0f2ebb044c7 Luca Weiss       2023-05-23  127  
a1f0f2ebb044c7 Luca Weiss       2023-05-23  128  			channel@4b {
a1f0f2ebb044c7 Luca Weiss       2023-05-23  129  				reg = <ADC5_BAT_ID_100K_PU>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  130  				qcom,hw-settle-time = <200>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  131  				qcom,pre-scaling = <1 1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  132  				qcom,ratiometric;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  133  				label = "bat_id";
a1f0f2ebb044c7 Luca Weiss       2023-05-23  134  			};
a1f0f2ebb044c7 Luca Weiss       2023-05-23  135  
a1f0f2ebb044c7 Luca Weiss       2023-05-23  136  			channel@83 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23  137  				reg = <ADC5_VPH_PWR>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  138  				qcom,pre-scaling = <1 3>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  139  				label = "vph_pwr";
a1f0f2ebb044c7 Luca Weiss       2023-05-23  140  			};
a1f0f2ebb044c7 Luca Weiss       2023-05-23  141  
a1f0f2ebb044c7 Luca Weiss       2023-05-23  142  			channel@84 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23  143  				reg = <ADC5_VBAT_SNS>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  144  				qcom,pre-scaling = <1 3>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  145  				label = "vbat_sns";
a1f0f2ebb044c7 Luca Weiss       2023-05-23  146  			};
a1f0f2ebb044c7 Luca Weiss       2023-05-23  147  		};
a1f0f2ebb044c7 Luca Weiss       2023-05-23  148  
a1f0f2ebb044c7 Luca Weiss       2023-05-23  149  		pmi632_adc_tm: adc-tm@3500 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23  150  			compatible = "qcom,spmi-adc-tm5";
a1f0f2ebb044c7 Luca Weiss       2023-05-23  151  			reg = <0x3500>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  152  			interrupts = <0x2 0x35 0x0 IRQ_TYPE_EDGE_RISING>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  153  			#thermal-sensor-cells = <1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  154  			#address-cells = <1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  155  			#size-cells = <0>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  156  			status = "disabled";
a1f0f2ebb044c7 Luca Weiss       2023-05-23  157  		};
a1f0f2ebb044c7 Luca Weiss       2023-05-23  158  
dc14578426fdb4 Luca Weiss       2024-02-05  159  		pmi632_pbs_client3: pbs@7400 {
dc14578426fdb4 Luca Weiss       2024-02-05  160  			compatible = "qcom,pmi632-pbs", "qcom,pbs";
dc14578426fdb4 Luca Weiss       2024-02-05  161  			reg = <0x7400>;
dc14578426fdb4 Luca Weiss       2024-02-05  162  		};
dc14578426fdb4 Luca Weiss       2024-02-05  163  
a1f0f2ebb044c7 Luca Weiss       2023-05-23  164  		pmi632_sdam_7: nvram@b600 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23  165  			compatible = "qcom,spmi-sdam";
a1f0f2ebb044c7 Luca Weiss       2023-05-23  166  			reg = <0xb600>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  167  			#address-cells = <1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  168  			#size-cells = <1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  169  			ranges = <0 0xb600 0x100>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  170  		};
a1f0f2ebb044c7 Luca Weiss       2023-05-23  171  
a1f0f2ebb044c7 Luca Weiss       2023-05-23  172  		pmi632_gpios: gpio@c000 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23  173  			compatible = "qcom,pmi632-gpio", "qcom,spmi-gpio";
a1f0f2ebb044c7 Luca Weiss       2023-05-23  174  			reg = <0xc000>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  175  			gpio-controller;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  176  			gpio-ranges = <&pmi632_gpios 0 0 8>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  177  			#gpio-cells = <2>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  178  			interrupt-controller;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  179  			#interrupt-cells = <2>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  180  		};
a1f0f2ebb044c7 Luca Weiss       2023-05-23  181  	};
a1f0f2ebb044c7 Luca Weiss       2023-05-23  182  
a1f0f2ebb044c7 Luca Weiss       2023-05-23  183  	pmic@3 {
a1f0f2ebb044c7 Luca Weiss       2023-05-23  184  		compatible = "qcom,pmi632", "qcom,spmi-pmic";
a1f0f2ebb044c7 Luca Weiss       2023-05-23  185  		reg = <0x3 SPMI_USID>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  186  		#address-cells = <1>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  187  		#size-cells = <0>;
a1f0f2ebb044c7 Luca Weiss       2023-05-23  188  
a1f0f2ebb044c7 Luca Weiss       2023-05-23 @189  		pmi632_lpg: pwm {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
