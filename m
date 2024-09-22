Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1751EB46
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 07:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726990127; cv=none; b=eiz2tvfcaN6e58Y/cs+WIBBbp07yQyK5AJ6535ZG4YhQxl38ptGSueXz5UZzKFv8pv9CbWqGSYhwMiYg22hWfQrmj9S7zWFw8G6xtdG4VQqLOQNSPkIkSrB9H/qxiEsq+ayXcIt7vbexNQLD+27dDrvYgpUxCI+7DntFyTYZ7Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726990127; c=relaxed/simple;
	bh=XDdR1PAoE3IQVMKBYB1qEBYZjubNuZ4WJ1jtCsv6jVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c7UItbw499nANgKKmQgdMUbr2u6uCdl4PyY1ODimFbUQWLyvXgeU2F433q9AYVyOkPtEKVg9nRWbqIce6upAnrcqylK79M2Mu65VerQWc6qZWxEz74aukfCPJWxYsL2HQGoNFQ0p/PDdhuQDJiJYC4Wv3R2bvZusP23v/MqyzRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqNQ4LJY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqNQ4LJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726990125; x=1758526125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XDdR1PAoE3IQVMKBYB1qEBYZjubNuZ4WJ1jtCsv6jVM=;
  b=TqNQ4LJYIE7IfYQPLSlSkd9gtPhkVYMAXaQcR5/+LJ6AIeMMoPdVtzrc
   e+La/NRx22n9lu4tVv6zYKo5g3HOGgPlHzSc7wJiDa02QmShXET9XBaQ2
   G5utVPih+8h+CiAEQwFlM7XHvkD0Gf0auKwa9e4PVNFY25A/7jX73ZaJf
   WflauFitfoZ48Y5hBLCut9WYPwsPR+KUKhnuHnGjBZ4AHgZo+KrLa5Zxh
   +Upyz8tj951b9rrC6c2jD8CvvXBPRCWCfM2EskUFr7Em+IhamqaZnHckX
   99O+/Xo/dyO5c5zuLJ4tqrjszuVvIIBtI5nVYEI9Hud4hGSopFIkrM0HK
   g==;
X-CSE-ConnectionGUID: 0AmmNy8UQIKouaIOjSm7JA==
X-CSE-MsgGUID: H6IGnMbJQvac4q43XhjHMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="36522896"
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="36522896"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 00:28:44 -0700
X-CSE-ConnectionGUID: zPaq2CNCRV2zD1lpPgZ1hw==
X-CSE-MsgGUID: riIK5N6RQxSvDf8RNI58bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,249,1719903600"; 
   d="scan'208";a="70739748"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Sep 2024 00:28:42 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssH1M-000G7X-0a;
	Sun, 22 Sep 2024 07:28:40 +0000
Date: Sun, 22 Sep 2024 15:28:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: sc8280xp-wdk2023: dt definition
 for WDK2023
Message-ID: <202409221504.strjBoNH-lkp@intel.com>
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
In-Reply-To: <20240920-jg-blackrock-for-upstream-v2-1-9bf2f1b2191c@oldschoolsolutions.biz>
References: <20240920-jg-blackrock-for-upstream-v2-1-9bf2f1b2191c@oldschoolsolutions.biz>
TO: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
CC: Merck Hung <merckhung@gmail.com>

Hi Jens,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 98f7e32f20d28ec452afb208f9cffc08448a2652]

url:    https://github.com/intel-lab-lkp/linux/commits/Jens-Glathe-via-B4-Relay/arm64-dts-qcom-sc8280xp-wdk2023-dt-definition-for-WDK2023/20240921-014845
base:   98f7e32f20d28ec452afb208f9cffc08448a2652
patch link:    https://lore.kernel.org/r/20240920-jg-blackrock-for-upstream-v2-1-9bf2f1b2191c%40oldschoolsolutions.biz
patch subject: [PATCH v2 1/2] arm64: dts: qcom: sc8280xp-wdk2023: dt definition for WDK2023
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240922/202409221504.strjBoNH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409221504.strjBoNH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409221504.strjBoNH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts:141.18-155.4: Warning (unit_address_vs_reg): /dp1-connector@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/qcom/sc8280xp.dtsi:786.13-5874.4: Warning (unique_unit_address_if_enabled): /soc@0: duplicate unit-address (also used in node /dp1-connector@0)

vim +141 arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts

e3cfda260b02b4 Jens Glathe 2024-09-20   17  
e3cfda260b02b4 Jens Glathe 2024-09-20   18  / {
e3cfda260b02b4 Jens Glathe 2024-09-20   19  	model = "Windows Dev Kit 2023";
e3cfda260b02b4 Jens Glathe 2024-09-20   20  	compatible = "microsoft,blackrock", "qcom,sc8280xp";
e3cfda260b02b4 Jens Glathe 2024-09-20   21  
e3cfda260b02b4 Jens Glathe 2024-09-20   22  	aliases {
e3cfda260b02b4 Jens Glathe 2024-09-20   23  		i2c4 = &i2c4;
e3cfda260b02b4 Jens Glathe 2024-09-20   24  		i2c21 = &i2c21;
e3cfda260b02b4 Jens Glathe 2024-09-20   25  		serial1 = &uart2;
e3cfda260b02b4 Jens Glathe 2024-09-20   26  	};
e3cfda260b02b4 Jens Glathe 2024-09-20   27  
e3cfda260b02b4 Jens Glathe 2024-09-20   28  	wcd938x: audio-codec {
e3cfda260b02b4 Jens Glathe 2024-09-20   29  		compatible = "qcom,wcd9380-codec";
e3cfda260b02b4 Jens Glathe 2024-09-20   30  
e3cfda260b02b4 Jens Glathe 2024-09-20   31  		pinctrl-names = "default";
e3cfda260b02b4 Jens Glathe 2024-09-20   32  		pinctrl-0 = <&wcd_default>;
e3cfda260b02b4 Jens Glathe 2024-09-20   33  
e3cfda260b02b4 Jens Glathe 2024-09-20   34  		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
e3cfda260b02b4 Jens Glathe 2024-09-20   35  
e3cfda260b02b4 Jens Glathe 2024-09-20   36  		vdd-buck-supply = <&vreg_s10b>;
e3cfda260b02b4 Jens Glathe 2024-09-20   37  		vdd-rxtx-supply = <&vreg_s10b>;
e3cfda260b02b4 Jens Glathe 2024-09-20   38  		vdd-io-supply = <&vreg_s10b>;
e3cfda260b02b4 Jens Glathe 2024-09-20   39  		vdd-mic-bias-supply = <&vreg_bob>;
e3cfda260b02b4 Jens Glathe 2024-09-20   40  
e3cfda260b02b4 Jens Glathe 2024-09-20   41  		qcom,micbias1-microvolt = <1800000>;
e3cfda260b02b4 Jens Glathe 2024-09-20   42  		qcom,micbias2-microvolt = <1800000>;
e3cfda260b02b4 Jens Glathe 2024-09-20   43  		qcom,micbias3-microvolt = <1800000>;
e3cfda260b02b4 Jens Glathe 2024-09-20   44  		qcom,micbias4-microvolt = <1800000>;
e3cfda260b02b4 Jens Glathe 2024-09-20   45  		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
e3cfda260b02b4 Jens Glathe 2024-09-20   46  		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
e3cfda260b02b4 Jens Glathe 2024-09-20   47  		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
e3cfda260b02b4 Jens Glathe 2024-09-20   48  		qcom,rx-device = <&wcd_rx>;
e3cfda260b02b4 Jens Glathe 2024-09-20   49  		qcom,tx-device = <&wcd_tx>;
e3cfda260b02b4 Jens Glathe 2024-09-20   50  
e3cfda260b02b4 Jens Glathe 2024-09-20   51  		#sound-dai-cells = <1>;
e3cfda260b02b4 Jens Glathe 2024-09-20   52  	};
e3cfda260b02b4 Jens Glathe 2024-09-20   53  
e3cfda260b02b4 Jens Glathe 2024-09-20   54  	firmware {
e3cfda260b02b4 Jens Glathe 2024-09-20   55  		qseecom {
e3cfda260b02b4 Jens Glathe 2024-09-20   56  			compatible = "qcom,qseecom-sc8280xp", "qcom,qseecom";
e3cfda260b02b4 Jens Glathe 2024-09-20   57  			qcom,scm = <&scm>;
e3cfda260b02b4 Jens Glathe 2024-09-20   58  		};
e3cfda260b02b4 Jens Glathe 2024-09-20   59  	};
e3cfda260b02b4 Jens Glathe 2024-09-20   60  
e3cfda260b02b4 Jens Glathe 2024-09-20   61  	pmic-glink {
e3cfda260b02b4 Jens Glathe 2024-09-20   62  		compatible = "qcom,sc8280xp-pmic-glink", "qcom,pmic-glink";
e3cfda260b02b4 Jens Glathe 2024-09-20   63  
e3cfda260b02b4 Jens Glathe 2024-09-20   64  		#address-cells = <1>;
e3cfda260b02b4 Jens Glathe 2024-09-20   65  		#size-cells = <0>;
e3cfda260b02b4 Jens Glathe 2024-09-20   66  		orientation-gpios = <&tlmm 166 GPIO_ACTIVE_HIGH>,
e3cfda260b02b4 Jens Glathe 2024-09-20   67  				    <&tlmm 49 GPIO_ACTIVE_HIGH>;
e3cfda260b02b4 Jens Glathe 2024-09-20   68  
e3cfda260b02b4 Jens Glathe 2024-09-20   69  		connector@0 {
e3cfda260b02b4 Jens Glathe 2024-09-20   70  			compatible = "usb-c-connector";
e3cfda260b02b4 Jens Glathe 2024-09-20   71  			reg = <0>;
e3cfda260b02b4 Jens Glathe 2024-09-20   72  			power-role = "source";
e3cfda260b02b4 Jens Glathe 2024-09-20   73  			data-role = "dual";
e3cfda260b02b4 Jens Glathe 2024-09-20   74  
e3cfda260b02b4 Jens Glathe 2024-09-20   75  			ports {
e3cfda260b02b4 Jens Glathe 2024-09-20   76  				#address-cells = <1>;
e3cfda260b02b4 Jens Glathe 2024-09-20   77  				#size-cells = <0>;
e3cfda260b02b4 Jens Glathe 2024-09-20   78  
e3cfda260b02b4 Jens Glathe 2024-09-20   79  				port@0 {
e3cfda260b02b4 Jens Glathe 2024-09-20   80  					reg = <0>;
e3cfda260b02b4 Jens Glathe 2024-09-20   81  
e3cfda260b02b4 Jens Glathe 2024-09-20   82  					pmic_glink_con0_hs: endpoint {
e3cfda260b02b4 Jens Glathe 2024-09-20   83  						remote-endpoint = <&usb_0_dwc3_hs>;
e3cfda260b02b4 Jens Glathe 2024-09-20   84  					};
e3cfda260b02b4 Jens Glathe 2024-09-20   85  				};
e3cfda260b02b4 Jens Glathe 2024-09-20   86  
e3cfda260b02b4 Jens Glathe 2024-09-20   87  				port@1 {
e3cfda260b02b4 Jens Glathe 2024-09-20   88  					reg = <1>;
e3cfda260b02b4 Jens Glathe 2024-09-20   89  
e3cfda260b02b4 Jens Glathe 2024-09-20   90  					pmic_glink_con0_ss: endpoint {
e3cfda260b02b4 Jens Glathe 2024-09-20   91  						remote-endpoint = <&usb_0_qmpphy_out>;
e3cfda260b02b4 Jens Glathe 2024-09-20   92  					};
e3cfda260b02b4 Jens Glathe 2024-09-20   93  				};
e3cfda260b02b4 Jens Glathe 2024-09-20   94  
e3cfda260b02b4 Jens Glathe 2024-09-20   95  				port@2 {
e3cfda260b02b4 Jens Glathe 2024-09-20   96  					reg = <2>;
e3cfda260b02b4 Jens Glathe 2024-09-20   97  
e3cfda260b02b4 Jens Glathe 2024-09-20   98  					pmic_glink_con0_sbu: endpoint {
e3cfda260b02b4 Jens Glathe 2024-09-20   99  						remote-endpoint = <&usb0_sbu_mux>;
e3cfda260b02b4 Jens Glathe 2024-09-20  100  					};
e3cfda260b02b4 Jens Glathe 2024-09-20  101  				};
e3cfda260b02b4 Jens Glathe 2024-09-20  102  			};
e3cfda260b02b4 Jens Glathe 2024-09-20  103  		};
e3cfda260b02b4 Jens Glathe 2024-09-20  104  
e3cfda260b02b4 Jens Glathe 2024-09-20  105  		connector@1 {
e3cfda260b02b4 Jens Glathe 2024-09-20  106  			compatible = "usb-c-connector";
e3cfda260b02b4 Jens Glathe 2024-09-20  107  			reg = <1>;
e3cfda260b02b4 Jens Glathe 2024-09-20  108  			power-role = "source";
e3cfda260b02b4 Jens Glathe 2024-09-20  109  			data-role = "dual";
e3cfda260b02b4 Jens Glathe 2024-09-20  110  
e3cfda260b02b4 Jens Glathe 2024-09-20  111  			ports {
e3cfda260b02b4 Jens Glathe 2024-09-20  112  				#address-cells = <1>;
e3cfda260b02b4 Jens Glathe 2024-09-20  113  				#size-cells = <0>;
e3cfda260b02b4 Jens Glathe 2024-09-20  114  				port@0 {
e3cfda260b02b4 Jens Glathe 2024-09-20  115  					reg = <0>;
e3cfda260b02b4 Jens Glathe 2024-09-20  116  
e3cfda260b02b4 Jens Glathe 2024-09-20  117  					pmic_glink_con1_hs: endpoint {
e3cfda260b02b4 Jens Glathe 2024-09-20  118  						remote-endpoint = <&usb_1_dwc3_hs>;
e3cfda260b02b4 Jens Glathe 2024-09-20  119  					};
e3cfda260b02b4 Jens Glathe 2024-09-20  120  				};
e3cfda260b02b4 Jens Glathe 2024-09-20  121  
e3cfda260b02b4 Jens Glathe 2024-09-20  122  				port@1 {
e3cfda260b02b4 Jens Glathe 2024-09-20  123  					reg = <1>;
e3cfda260b02b4 Jens Glathe 2024-09-20  124  
e3cfda260b02b4 Jens Glathe 2024-09-20  125  					pmic_glink_con1_ss: endpoint {
e3cfda260b02b4 Jens Glathe 2024-09-20  126  						remote-endpoint = <&usb_1_qmpphy_out>;
e3cfda260b02b4 Jens Glathe 2024-09-20  127  					};
e3cfda260b02b4 Jens Glathe 2024-09-20  128  				};
e3cfda260b02b4 Jens Glathe 2024-09-20  129  
e3cfda260b02b4 Jens Glathe 2024-09-20  130  				port@2 {
e3cfda260b02b4 Jens Glathe 2024-09-20  131  					reg = <2>;
e3cfda260b02b4 Jens Glathe 2024-09-20  132  
e3cfda260b02b4 Jens Glathe 2024-09-20  133  					pmic_glink_con1_sbu: endpoint {
e3cfda260b02b4 Jens Glathe 2024-09-20  134  						remote-endpoint = <&usb1_sbu_mux>;
e3cfda260b02b4 Jens Glathe 2024-09-20  135  					};
e3cfda260b02b4 Jens Glathe 2024-09-20  136  				};
e3cfda260b02b4 Jens Glathe 2024-09-20  137  			};
e3cfda260b02b4 Jens Glathe 2024-09-20  138  		};
e3cfda260b02b4 Jens Glathe 2024-09-20  139  	};
e3cfda260b02b4 Jens Glathe 2024-09-20  140  
e3cfda260b02b4 Jens Glathe 2024-09-20 @141  	dp1-connector@0 {
e3cfda260b02b4 Jens Glathe 2024-09-20  142  		compatible = "dp-connector";
e3cfda260b02b4 Jens Glathe 2024-09-20  143  		label = "DP1";
e3cfda260b02b4 Jens Glathe 2024-09-20  144  		type = "mini";
e3cfda260b02b4 Jens Glathe 2024-09-20  145  
e3cfda260b02b4 Jens Glathe 2024-09-20  146  		dp-pwr-supply = <&vreg_misc_3p3>;
e3cfda260b02b4 Jens Glathe 2024-09-20  147  
e3cfda260b02b4 Jens Glathe 2024-09-20  148  		//hpd-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
e3cfda260b02b4 Jens Glathe 2024-09-20  149  
e3cfda260b02b4 Jens Glathe 2024-09-20  150  		port {
e3cfda260b02b4 Jens Glathe 2024-09-20  151  			dp1_connector_in: endpoint {
e3cfda260b02b4 Jens Glathe 2024-09-20  152  				remote-endpoint = <&mdss0_dp2_phy_out>;
e3cfda260b02b4 Jens Glathe 2024-09-20  153  			};
e3cfda260b02b4 Jens Glathe 2024-09-20  154  		};
e3cfda260b02b4 Jens Glathe 2024-09-20  155  	};
e3cfda260b02b4 Jens Glathe 2024-09-20  156  
e3cfda260b02b4 Jens Glathe 2024-09-20  157  	vreg_misc_3p3: regulator-misc-3p3 {
e3cfda260b02b4 Jens Glathe 2024-09-20  158  		compatible = "regulator-fixed";
e3cfda260b02b4 Jens Glathe 2024-09-20  159  
e3cfda260b02b4 Jens Glathe 2024-09-20  160  		regulator-name = "VCC3B";
e3cfda260b02b4 Jens Glathe 2024-09-20  161  		regulator-min-microvolt = <3300000>;
e3cfda260b02b4 Jens Glathe 2024-09-20  162  		regulator-max-microvolt = <3300000>;
e3cfda260b02b4 Jens Glathe 2024-09-20  163  
e3cfda260b02b4 Jens Glathe 2024-09-20  164  		gpio = <&pmc8280_1_gpios 1 GPIO_ACTIVE_HIGH>;
e3cfda260b02b4 Jens Glathe 2024-09-20  165  		enable-active-high;
e3cfda260b02b4 Jens Glathe 2024-09-20  166  
e3cfda260b02b4 Jens Glathe 2024-09-20  167  		pinctrl-names = "default";
e3cfda260b02b4 Jens Glathe 2024-09-20  168  		pinctrl-0 = <&misc_3p3_reg_en>;
e3cfda260b02b4 Jens Glathe 2024-09-20  169  
e3cfda260b02b4 Jens Glathe 2024-09-20  170  		regulator-boot-on;
e3cfda260b02b4 Jens Glathe 2024-09-20  171  		regulator-always-on;
e3cfda260b02b4 Jens Glathe 2024-09-20  172  	};
e3cfda260b02b4 Jens Glathe 2024-09-20  173  
e3cfda260b02b4 Jens Glathe 2024-09-20  174  	vreg_nvme: regulator-nvme {
e3cfda260b02b4 Jens Glathe 2024-09-20  175  		compatible = "regulator-fixed";
e3cfda260b02b4 Jens Glathe 2024-09-20  176  
e3cfda260b02b4 Jens Glathe 2024-09-20  177  		regulator-name = "VCC3_SSD";
e3cfda260b02b4 Jens Glathe 2024-09-20  178  		regulator-min-microvolt = <3300000>;
e3cfda260b02b4 Jens Glathe 2024-09-20  179  		regulator-max-microvolt = <3300000>;
e3cfda260b02b4 Jens Glathe 2024-09-20  180  
e3cfda260b02b4 Jens Glathe 2024-09-20  181  		gpio = <&tlmm 135 GPIO_ACTIVE_HIGH>;
e3cfda260b02b4 Jens Glathe 2024-09-20  182  		enable-active-high;
e3cfda260b02b4 Jens Glathe 2024-09-20  183  
e3cfda260b02b4 Jens Glathe 2024-09-20  184  		pinctrl-names = "default";
e3cfda260b02b4 Jens Glathe 2024-09-20  185  		pinctrl-0 = <&nvme_reg_en>;
e3cfda260b02b4 Jens Glathe 2024-09-20  186  
e3cfda260b02b4 Jens Glathe 2024-09-20  187  		regulator-boot-on;
e3cfda260b02b4 Jens Glathe 2024-09-20  188  	};
e3cfda260b02b4 Jens Glathe 2024-09-20  189  
e3cfda260b02b4 Jens Glathe 2024-09-20  190  	vreg_vph_pwr: regulator-vph-pwr {
e3cfda260b02b4 Jens Glathe 2024-09-20  191  		compatible = "regulator-fixed";
e3cfda260b02b4 Jens Glathe 2024-09-20  192  
e3cfda260b02b4 Jens Glathe 2024-09-20  193  		regulator-name = "VPH_VCC3R9";
e3cfda260b02b4 Jens Glathe 2024-09-20  194  		regulator-min-microvolt = <3900000>;
e3cfda260b02b4 Jens Glathe 2024-09-20  195  		regulator-max-microvolt = <3900000>;
e3cfda260b02b4 Jens Glathe 2024-09-20  196  
e3cfda260b02b4 Jens Glathe 2024-09-20  197  		regulator-always-on;
e3cfda260b02b4 Jens Glathe 2024-09-20  198  	};
e3cfda260b02b4 Jens Glathe 2024-09-20  199  
e3cfda260b02b4 Jens Glathe 2024-09-20  200  	vreg_wlan: regulator-wlan {
e3cfda260b02b4 Jens Glathe 2024-09-20  201  		compatible = "regulator-fixed";
e3cfda260b02b4 Jens Glathe 2024-09-20  202  
e3cfda260b02b4 Jens Glathe 2024-09-20  203  		regulator-name = "VCC_WLAN_3R9";
e3cfda260b02b4 Jens Glathe 2024-09-20  204  		regulator-min-microvolt = <3900000>;
e3cfda260b02b4 Jens Glathe 2024-09-20  205  		regulator-max-microvolt = <3900000>;
e3cfda260b02b4 Jens Glathe 2024-09-20  206  
e3cfda260b02b4 Jens Glathe 2024-09-20  207  		gpio = <&pmr735a_gpios 1 GPIO_ACTIVE_HIGH>;
e3cfda260b02b4 Jens Glathe 2024-09-20  208  		enable-active-high;
e3cfda260b02b4 Jens Glathe 2024-09-20  209  
e3cfda260b02b4 Jens Glathe 2024-09-20  210  		pinctrl-names = "default";
e3cfda260b02b4 Jens Glathe 2024-09-20  211  		pinctrl-0 = <&hastings_reg_en>;
e3cfda260b02b4 Jens Glathe 2024-09-20  212  
e3cfda260b02b4 Jens Glathe 2024-09-20  213  		regulator-boot-on;
e3cfda260b02b4 Jens Glathe 2024-09-20  214  	};
e3cfda260b02b4 Jens Glathe 2024-09-20  215  
e3cfda260b02b4 Jens Glathe 2024-09-20  216  	vreg_wwan: regulator-wwan {
e3cfda260b02b4 Jens Glathe 2024-09-20  217  		compatible = "regulator-fixed";
e3cfda260b02b4 Jens Glathe 2024-09-20  218  
e3cfda260b02b4 Jens Glathe 2024-09-20  219  		regulator-name = "VCC3B_WAN";
e3cfda260b02b4 Jens Glathe 2024-09-20  220  		regulator-min-microvolt = <3300000>;
e3cfda260b02b4 Jens Glathe 2024-09-20  221  		regulator-max-microvolt = <3300000>;
e3cfda260b02b4 Jens Glathe 2024-09-20  222  
e3cfda260b02b4 Jens Glathe 2024-09-20  223  		gpio = <&pmc8280_2_gpios 1 GPIO_ACTIVE_HIGH>;
e3cfda260b02b4 Jens Glathe 2024-09-20  224  		enable-active-high;
e3cfda260b02b4 Jens Glathe 2024-09-20  225  
e3cfda260b02b4 Jens Glathe 2024-09-20  226  		pinctrl-names = "default";
e3cfda260b02b4 Jens Glathe 2024-09-20  227  		pinctrl-0 = <&wwan_sw_en>;
e3cfda260b02b4 Jens Glathe 2024-09-20  228  
e3cfda260b02b4 Jens Glathe 2024-09-20  229  		regulator-boot-on;
e3cfda260b02b4 Jens Glathe 2024-09-20  230  	};
e3cfda260b02b4 Jens Glathe 2024-09-20  231  
e3cfda260b02b4 Jens Glathe 2024-09-20  232  	reserved-memory {
e3cfda260b02b4 Jens Glathe 2024-09-20  233  		gpu_mem: gpu-mem@8bf00000 {
e3cfda260b02b4 Jens Glathe 2024-09-20  234  			reg = <0 0x8bf00000 0 0x2000>;
e3cfda260b02b4 Jens Glathe 2024-09-20  235  			no-map;
e3cfda260b02b4 Jens Glathe 2024-09-20  236  		};
e3cfda260b02b4 Jens Glathe 2024-09-20  237  
e3cfda260b02b4 Jens Glathe 2024-09-20  238  		linux,cma {
e3cfda260b02b4 Jens Glathe 2024-09-20  239  			compatible = "shared-dma-pool";
e3cfda260b02b4 Jens Glathe 2024-09-20  240  			size = <0x0 0x8000000>;
e3cfda260b02b4 Jens Glathe 2024-09-20  241  			reusable;
e3cfda260b02b4 Jens Glathe 2024-09-20  242  			linux,cma-default;
e3cfda260b02b4 Jens Glathe 2024-09-20  243  		};
e3cfda260b02b4 Jens Glathe 2024-09-20  244  	};
e3cfda260b02b4 Jens Glathe 2024-09-20  245  
e3cfda260b02b4 Jens Glathe 2024-09-20  246  	usb0-sbu-mux {
e3cfda260b02b4 Jens Glathe 2024-09-20  247  		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
e3cfda260b02b4 Jens Glathe 2024-09-20  248  
e3cfda260b02b4 Jens Glathe 2024-09-20  249  		enable-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
e3cfda260b02b4 Jens Glathe 2024-09-20  250  		select-gpios = <&tlmm 164 GPIO_ACTIVE_HIGH>;
e3cfda260b02b4 Jens Glathe 2024-09-20  251  
e3cfda260b02b4 Jens Glathe 2024-09-20  252  		pinctrl-names = "default";
e3cfda260b02b4 Jens Glathe 2024-09-20  253  		pinctrl-0 = <&usb0_sbu_default>;
e3cfda260b02b4 Jens Glathe 2024-09-20  254  
e3cfda260b02b4 Jens Glathe 2024-09-20  255  		mode-switch;
e3cfda260b02b4 Jens Glathe 2024-09-20  256  		orientation-switch;
e3cfda260b02b4 Jens Glathe 2024-09-20  257  
e3cfda260b02b4 Jens Glathe 2024-09-20  258  		port {
e3cfda260b02b4 Jens Glathe 2024-09-20  259  			usb0_sbu_mux: endpoint {
e3cfda260b02b4 Jens Glathe 2024-09-20  260  				remote-endpoint = <&pmic_glink_con0_sbu>;
e3cfda260b02b4 Jens Glathe 2024-09-20  261  			};
e3cfda260b02b4 Jens Glathe 2024-09-20  262  		};
e3cfda260b02b4 Jens Glathe 2024-09-20  263  	};
e3cfda260b02b4 Jens Glathe 2024-09-20  264  
e3cfda260b02b4 Jens Glathe 2024-09-20  265  	usb1-sbu-mux {
e3cfda260b02b4 Jens Glathe 2024-09-20  266  		compatible = "pericom,pi3usb102", "gpio-sbu-mux";
e3cfda260b02b4 Jens Glathe 2024-09-20  267  
e3cfda260b02b4 Jens Glathe 2024-09-20  268  		enable-gpios = <&tlmm 48 GPIO_ACTIVE_LOW>;
e3cfda260b02b4 Jens Glathe 2024-09-20  269  		select-gpios = <&tlmm 47 GPIO_ACTIVE_HIGH>;
e3cfda260b02b4 Jens Glathe 2024-09-20  270  
e3cfda260b02b4 Jens Glathe 2024-09-20  271  		pinctrl-names = "default";
e3cfda260b02b4 Jens Glathe 2024-09-20  272  		pinctrl-0 = <&usb1_sbu_default>;
e3cfda260b02b4 Jens Glathe 2024-09-20  273  
e3cfda260b02b4 Jens Glathe 2024-09-20  274  		mode-switch;
e3cfda260b02b4 Jens Glathe 2024-09-20  275  		orientation-switch;
e3cfda260b02b4 Jens Glathe 2024-09-20  276  
e3cfda260b02b4 Jens Glathe 2024-09-20  277  		port {
e3cfda260b02b4 Jens Glathe 2024-09-20  278  			usb1_sbu_mux: endpoint {
e3cfda260b02b4 Jens Glathe 2024-09-20  279  				remote-endpoint = <&pmic_glink_con1_sbu>;
e3cfda260b02b4 Jens Glathe 2024-09-20  280  			};
e3cfda260b02b4 Jens Glathe 2024-09-20  281  		};
e3cfda260b02b4 Jens Glathe 2024-09-20  282  	};
e3cfda260b02b4 Jens Glathe 2024-09-20  283  };
e3cfda260b02b4 Jens Glathe 2024-09-20  284  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
