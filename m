Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE89B1DC986
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Dec 2024 11:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733828989; cv=none; b=pOdTT9uhEskZLtxpu2u2bWq4O9cVIWnT+vz5itD5/tONHFhVNACxkzaaBp3JQbYVZEoUJtwZE2RTdXCAgmZYpSKsUux1hfy5/C8Bu4ttCIWh9NfhF6CqLMJGIvjA9m4LsaYtt/1gMmAMrafmPUqw3sIPc4Bq607vUzrAye2+RMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733828989; c=relaxed/simple;
	bh=pMKlfHYhPmOwcGk+9RyNg+sSTEiOk5iKhHdqGoAsiJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OyTBQc/h3SlYX/PmrsZzcXnUesj/lFhfzlS5yUVoop/9U10I1CJuD0tgMe33HzKEWD8iXIopJxRgyeg7nQBnNfMrV/E2bObeI+mIcP3dEPa9EuaeOO9NIJDBHTUCM1J8vThWy8HV1dOmSwYep6kue6GXAgSqFYtmYBomPwbLZxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IkrqLYJh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IkrqLYJh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733828987; x=1765364987;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pMKlfHYhPmOwcGk+9RyNg+sSTEiOk5iKhHdqGoAsiJc=;
  b=IkrqLYJhvMo0tsxwBawyXESHhfl7ru4tX7m3MyOwZA0+igcg858U2yKe
   EJaZ74JhguzXLvnENYUOHG2tVNohciAmZcQ5PbFRTEQVg68ppsR+m8Yau
   7Ir0DG32uk8M8NISLSbPiDmrgyUZuEpM8Ah3WjN8COy8PA0pWkd392pJe
   X0ZPrzZjGqIGH2mXRBgBWfRldoqSJjd4JmOcmRnsmEHRLMYTUdQlkmHiW
   9zV6ZGdRSmjpIXwq92JAWqGejcVUptX6BscRx2DQ5bgGEkxXorWgCBJI2
   ay1cnSq5iyH9ZywMZU59+bn7M8Pfhm7m+mIyQi2XmEy7XWOEQMAyAYKs6
   g==;
X-CSE-ConnectionGUID: fjbHySZUQTaiF3NoTXjhgQ==
X-CSE-MsgGUID: gKZSF0jqSsGS+cG5koM+qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="59558676"
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="59558676"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 03:09:46 -0800
X-CSE-ConnectionGUID: t/pGEQM2SVCEWh1WxFCX7Q==
X-CSE-MsgGUID: 6mvEEq1LQpWq252fO2hIXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,222,1728975600"; 
   d="scan'208";a="99864559"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 10 Dec 2024 03:09:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKy7b-0005SD-01;
	Tue, 10 Dec 2024 11:09:43 +0000
Date: Tue, 10 Dec 2024 19:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 09/14] arm64: dts: qcom: sdm845-starqltechn: add
 max77705 PMIC
Message-ID: <202412101848.jAceE9WH-lkp@intel.com>
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
In-Reply-To: <20241209-starqltechn_integration_upstream-v8-9-ec604481d691@gmail.com>
References: <20241209-starqltechn_integration_upstream-v8-9-ec604481d691@gmail.com>
TO: Dzmitry Sankouski <dsankouski@gmail.com>
TO: cros-qcom-dts-watchers@chromium.org
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Takashi Iwai <tiwai@suse.com>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-sound@vger.kernel.org
CC: Dzmitry Sankouski <dsankouski@gmail.com>

Hi Dzmitry,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d1486dca38afd08ca279ae94eb3a397f10737824]

url:    https://github.com/intel-lab-lkp/linux/commits/Dzmitry-Sankouski/ASoC-dt-bindings-Add-bindings-for-WCD934x-DAIs/20241209-201427
base:   d1486dca38afd08ca279ae94eb3a397f10737824
patch link:    https://lore.kernel.org/r/20241209-starqltechn_integration_upstream-v8-9-ec604481d691%40gmail.com
patch subject: [PATCH v8 09/14] arm64: dts: qcom: sdm845-starqltechn: add max77705 PMIC
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-003-20241210 (https://download.01.org/0day-ci/archive/20241210/202412101848.jAceE9WH-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412101848.jAceE9WH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412101848.jAceE9WH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts:434.10-488.4: Warning (avoid_unnecessary_addr_size): /soc@0/geniqup@ac0000/i2c@a98000/pmic@66: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4686.27-4737.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4758.27-4809.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1221.44-1224.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)

vim +434 arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts

d711b22eee55ce Dzmitry Sankouski 2022-10-12  430  
15bfffff5a361d Dzmitry Sankouski 2024-12-09  431  &i2c14 {
15bfffff5a361d Dzmitry Sankouski 2024-12-09  432  	status = "okay";
15bfffff5a361d Dzmitry Sankouski 2024-12-09  433  
15bfffff5a361d Dzmitry Sankouski 2024-12-09 @434  	pmic@66 {
15bfffff5a361d Dzmitry Sankouski 2024-12-09  435  		compatible = "maxim,max77705";
15bfffff5a361d Dzmitry Sankouski 2024-12-09  436  		reg = <0x66>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  437  		interrupt-parent = <&pm8998_gpios>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  438  		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  439  		pinctrl-0 = <&pmic_int_default>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  440  		pinctrl-names = "default";
15bfffff5a361d Dzmitry Sankouski 2024-12-09  441  		#address-cells = <1>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  442  		#size-cells = <0>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  443  
15bfffff5a361d Dzmitry Sankouski 2024-12-09  444  		leds {
15bfffff5a361d Dzmitry Sankouski 2024-12-09  445  			compatible = "maxim,max77705-rgb";
15bfffff5a361d Dzmitry Sankouski 2024-12-09  446  
15bfffff5a361d Dzmitry Sankouski 2024-12-09  447  			multi-led {
15bfffff5a361d Dzmitry Sankouski 2024-12-09  448  				color = <LED_COLOR_ID_RGB>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  449  				function = LED_FUNCTION_STATUS;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  450  				#address-cells = <1>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  451  				#size-cells = <0>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  452  
15bfffff5a361d Dzmitry Sankouski 2024-12-09  453  				led@1 {
15bfffff5a361d Dzmitry Sankouski 2024-12-09  454  					reg = <1>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  455  					color = <LED_COLOR_ID_RED>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  456  				};
15bfffff5a361d Dzmitry Sankouski 2024-12-09  457  
15bfffff5a361d Dzmitry Sankouski 2024-12-09  458  				led@2 {
15bfffff5a361d Dzmitry Sankouski 2024-12-09  459  					reg = <2>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  460  					color = <LED_COLOR_ID_GREEN>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  461  				};
15bfffff5a361d Dzmitry Sankouski 2024-12-09  462  
15bfffff5a361d Dzmitry Sankouski 2024-12-09  463  				led@3 {
15bfffff5a361d Dzmitry Sankouski 2024-12-09  464  					reg = <3>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  465  					color = <LED_COLOR_ID_BLUE>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  466  				};
15bfffff5a361d Dzmitry Sankouski 2024-12-09  467  			};
15bfffff5a361d Dzmitry Sankouski 2024-12-09  468  		};
15bfffff5a361d Dzmitry Sankouski 2024-12-09  469  
15bfffff5a361d Dzmitry Sankouski 2024-12-09  470  		max77705_charger: charger {
15bfffff5a361d Dzmitry Sankouski 2024-12-09  471  			compatible = "maxim,max77705-charger";
15bfffff5a361d Dzmitry Sankouski 2024-12-09  472  			monitored-battery = <&battery>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  473  		};
15bfffff5a361d Dzmitry Sankouski 2024-12-09  474  
15bfffff5a361d Dzmitry Sankouski 2024-12-09  475  		fuel-gauge {
15bfffff5a361d Dzmitry Sankouski 2024-12-09  476  			compatible = "maxim,max77705-battery";
15bfffff5a361d Dzmitry Sankouski 2024-12-09  477  			power-supplies = <&max77705_charger>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  478  			maxim,rsns-microohm = <5000>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  479  			interrupt-parent = <&pm8998_gpios>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  480  			interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  481  		};
15bfffff5a361d Dzmitry Sankouski 2024-12-09  482  
15bfffff5a361d Dzmitry Sankouski 2024-12-09  483  		haptic {
15bfffff5a361d Dzmitry Sankouski 2024-12-09  484  			compatible = "maxim,max77705-haptic";
15bfffff5a361d Dzmitry Sankouski 2024-12-09  485  			haptic-supply = <&vib_regulator>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  486  			pwms = <&vib_pwm 0 100000>;
15bfffff5a361d Dzmitry Sankouski 2024-12-09  487  		};
15bfffff5a361d Dzmitry Sankouski 2024-12-09  488  	};
15bfffff5a361d Dzmitry Sankouski 2024-12-09  489  };
15bfffff5a361d Dzmitry Sankouski 2024-12-09  490  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
