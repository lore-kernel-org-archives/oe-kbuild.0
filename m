Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A8926738C
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Feb 2025 15:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739547821; cv=none; b=G1/e/yzabDweyiRGc8DkTDndOWe6nTUFWGIOMkEsKnHVSR7fqyGq9/iU2ZuV927BZV3iOxzM4db4ox3qI99GSptDTgmejIT28t+xoW1Z+Ap0/h/ISMMlETfKv45HkWwlNsz8kQ7JwX0HySdh9zuJLRBNu0f0CfNwzzJpt3k08TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739547821; c=relaxed/simple;
	bh=XIWAdbZBYV2hPT03hF1EYQr+l9voLzNiXx0WuHErWCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T/lEwRa2zFAnj/fgnIfEbPbpGT/x5WtLEhtz1xFErymEFvYkroPhargQ0tO+/nPGaHXoBKlTMPH/3y1HM4bQhvz6FHjPnudcBeACAAptiX/RsWlbPk6pRTgkTgiwKNI7KHfYQwWpHqCugxSMOs7UAEcesvaCVjdeW6ZVgRiElGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTKl4P0j; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTKl4P0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739547819; x=1771083819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XIWAdbZBYV2hPT03hF1EYQr+l9voLzNiXx0WuHErWCs=;
  b=MTKl4P0jGEcNVwZfoMjmf/myptMP4wkvbVyHxSWWUxuICw2/YgCANrII
   JYLfj4a7gXE8dfV+5K8tHZCsVUsvbMmEtVZx3PMSbzwdufy6H941SPBoR
   7PeiXqvGV5UoNAMkOTM+sNBY8d0kqrWdTZupzyKNRGx/mx0ekOsVdo/w3
   WFOCaotJOFHsWgRvlSLt0oVo1AJlybQB67GVldb9S63v+dvaAxT9A+9Qg
   3fzOiGxnhqTOfOYLG9Il8Z9a9aH4E10uGFC+kY6uq1VhpQZEgmgyRSxgG
   vtKrxjHHZsEACsQVkgqNdhmL0sWf3HQu/Wldy9jL+DnPA4mgZeoW0ZNkF
   w==;
X-CSE-ConnectionGUID: 2vlCdtC2QnWfj+ZXQdt/lw==
X-CSE-MsgGUID: s5CVFDCISHqk1OF6kOcgag==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="40225770"
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="40225770"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 07:43:36 -0800
X-CSE-ConnectionGUID: 3kStSgewRBqC8fw2oOq7ag==
X-CSE-MsgGUID: 8ArRXVpvReW/tq3NzVaLRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,286,1732608000"; 
   d="scan'208";a="113685194"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2025 07:43:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tixqm-0019nX-32;
	Fri, 14 Feb 2025 15:43:32 +0000
Date: Fri, 14 Feb 2025 23:42:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/3] arm64: dts: imx: add imx95 dts for sof
Message-ID: <202502142351.4IjuMLiM-lkp@intel.com>
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
In-Reply-To: <20250211225808.3050-4-laurentiumihalcea111@gmail.com>
References: <20250211225808.3050-4-laurentiumihalcea111@gmail.com>
TO: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
TO: Sascha Hauer <s.hauer@pengutronix.de>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: linux-sound@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org

Hi Laurentiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on robh/for-next shawnguo/for-next linus/master v6.14-rc2 next-20250213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurentiu-Mihalcea/ASoC-dt-bindings-support-imx95-s-CM7-core/20250212-070024
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20250211225808.3050-4-laurentiumihalcea111%40gmail.com
patch subject: [PATCH v4 3/3] arm64: dts: imx: add imx95 dts for sof
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250214/202502142351.4IjuMLiM-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142351.4IjuMLiM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502142351.4IjuMLiM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:53.18-56.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)

vim +53 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts

ade1310d898589 Peng Fan 2024-10-12   19  
b8f771037e9e34 Peng Fan 2024-06-17   20  / {
b8f771037e9e34 Peng Fan 2024-06-17   21  	model = "NXP i.MX95 19X19 board";
b8f771037e9e34 Peng Fan 2024-06-17   22  	compatible = "fsl,imx95-19x19-evk", "fsl,imx95";
b8f771037e9e34 Peng Fan 2024-06-17   23  
b8f771037e9e34 Peng Fan 2024-06-17   24  	aliases {
025cf78938c22a Wei Fang 2024-12-19   25  		ethernet0 = &enetc_port0;
a4f58f88c093ab Peng Fan 2024-10-12   26  		gpio0 = &gpio1;
a4f58f88c093ab Peng Fan 2024-10-12   27  		gpio1 = &gpio2;
a4f58f88c093ab Peng Fan 2024-10-12   28  		gpio2 = &gpio3;
a4f58f88c093ab Peng Fan 2024-10-12   29  		gpio3 = &gpio4;
a4f58f88c093ab Peng Fan 2024-10-12   30  		gpio4 = &gpio5;
a4f58f88c093ab Peng Fan 2024-10-12   31  		i2c0 = &lpi2c1;
a4f58f88c093ab Peng Fan 2024-10-12   32  		i2c1 = &lpi2c2;
a4f58f88c093ab Peng Fan 2024-10-12   33  		i2c2 = &lpi2c3;
a4f58f88c093ab Peng Fan 2024-10-12   34  		i2c3 = &lpi2c4;
a4f58f88c093ab Peng Fan 2024-10-12   35  		i2c4 = &lpi2c5;
a4f58f88c093ab Peng Fan 2024-10-12   36  		i2c5 = &lpi2c6;
a4f58f88c093ab Peng Fan 2024-10-12   37  		i2c6 = &lpi2c7;
a4f58f88c093ab Peng Fan 2024-10-12   38  		i2c7 = &lpi2c8;
b8f771037e9e34 Peng Fan 2024-06-17   39  		mmc0 = &usdhc1;
b8f771037e9e34 Peng Fan 2024-06-17   40  		mmc1 = &usdhc2;
b8f771037e9e34 Peng Fan 2024-06-17   41  		serial0 = &lpuart1;
b8f771037e9e34 Peng Fan 2024-06-17   42  	};
b8f771037e9e34 Peng Fan 2024-06-17   43  
288c31c92f45fb Frank Li 2024-07-01   44  	bt_sco_codec: audio-codec-bt-sco {
288c31c92f45fb Frank Li 2024-07-01   45  		#sound-dai-cells = <1>;
288c31c92f45fb Frank Li 2024-07-01   46  		compatible = "linux,bt-sco";
288c31c92f45fb Frank Li 2024-07-01   47  	};
288c31c92f45fb Frank Li 2024-07-01   48  
b8f771037e9e34 Peng Fan 2024-06-17   49  	chosen {
b8f771037e9e34 Peng Fan 2024-06-17   50  		stdout-path = &lpuart1;
b8f771037e9e34 Peng Fan 2024-06-17   51  	};
b8f771037e9e34 Peng Fan 2024-06-17   52  
b8f771037e9e34 Peng Fan 2024-06-17  @53  	memory@80000000 {
b8f771037e9e34 Peng Fan 2024-06-17   54  		device_type = "memory";
b8f771037e9e34 Peng Fan 2024-06-17   55  		reg = <0x0 0x80000000 0 0x80000000>;
b8f771037e9e34 Peng Fan 2024-06-17   56  	};
b8f771037e9e34 Peng Fan 2024-06-17   57  
7500e5b3706e4f Frank Li 2024-07-01   58  	fan0: pwm-fan {
7500e5b3706e4f Frank Li 2024-07-01   59  		compatible = "pwm-fan";
7500e5b3706e4f Frank Li 2024-07-01   60  		#cooling-cells = <2>;
7500e5b3706e4f Frank Li 2024-07-01   61  		pwms = <&tpm6 2 4000000 PWM_POLARITY_INVERTED>;
7500e5b3706e4f Frank Li 2024-07-01   62  		cooling-levels = <64 128 192 255>;
7500e5b3706e4f Frank Li 2024-07-01   63  	};
7500e5b3706e4f Frank Li 2024-07-01   64  
b8f771037e9e34 Peng Fan 2024-06-17   65  	reserved-memory {
b8f771037e9e34 Peng Fan 2024-06-17   66  		#address-cells = <2>;
b8f771037e9e34 Peng Fan 2024-06-17   67  		#size-cells = <2>;
b8f771037e9e34 Peng Fan 2024-06-17   68  		ranges;
b8f771037e9e34 Peng Fan 2024-06-17   69  
b8f771037e9e34 Peng Fan 2024-06-17   70  		linux_cma: linux,cma {
b8f771037e9e34 Peng Fan 2024-06-17   71  			compatible = "shared-dma-pool";
b8f771037e9e34 Peng Fan 2024-06-17   72  			alloc-ranges = <0 0x80000000 0 0x7f000000>;
b8f771037e9e34 Peng Fan 2024-06-17   73  			size = <0 0x3c000000>;
b8f771037e9e34 Peng Fan 2024-06-17   74  			linux,cma-default;
b8f771037e9e34 Peng Fan 2024-06-17   75  			reusable;
b8f771037e9e34 Peng Fan 2024-06-17   76  		};
b8f771037e9e34 Peng Fan 2024-06-17   77  	};
b8f771037e9e34 Peng Fan 2024-06-17   78  
288c31c92f45fb Frank Li 2024-07-01   79  	reg_3p3v: regulator-3p3v {
288c31c92f45fb Frank Li 2024-07-01   80  		compatible = "regulator-fixed";
288c31c92f45fb Frank Li 2024-07-01   81  		regulator-max-microvolt = <3300000>;
288c31c92f45fb Frank Li 2024-07-01   82  		regulator-min-microvolt = <3300000>;
288c31c92f45fb Frank Li 2024-07-01   83  		regulator-name = "+V3.3_SW";
288c31c92f45fb Frank Li 2024-07-01   84  	};
288c31c92f45fb Frank Li 2024-07-01   85  
288c31c92f45fb Frank Li 2024-07-01   86  	reg_audio_pwr: regulator-audio-pwr {
288c31c92f45fb Frank Li 2024-07-01   87  		compatible = "regulator-fixed";
288c31c92f45fb Frank Li 2024-07-01   88  		regulator-name = "audio-pwr";
288c31c92f45fb Frank Li 2024-07-01   89  		regulator-min-microvolt = <3300000>;
288c31c92f45fb Frank Li 2024-07-01   90  		regulator-max-microvolt = <3300000>;
288c31c92f45fb Frank Li 2024-07-01   91  		gpio = <&i2c4_gpio_expander_21 1 GPIO_ACTIVE_HIGH>;
288c31c92f45fb Frank Li 2024-07-01   92  		enable-active-high;
288c31c92f45fb Frank Li 2024-07-01   93  		regulator-always-on;
288c31c92f45fb Frank Li 2024-07-01   94  	};
288c31c92f45fb Frank Li 2024-07-01   95  
288c31c92f45fb Frank Li 2024-07-01   96  	reg_audio_slot: regulator-audio-slot {
288c31c92f45fb Frank Li 2024-07-01   97  		compatible = "regulator-fixed";
288c31c92f45fb Frank Li 2024-07-01   98  		regulator-name = "audio-wm8962";
288c31c92f45fb Frank Li 2024-07-01   99  		regulator-min-microvolt = <3300000>;
288c31c92f45fb Frank Li 2024-07-01  100  		regulator-max-microvolt = <3300000>;
288c31c92f45fb Frank Li 2024-07-01  101  		gpio = <&i2c4_gpio_expander_21 7 GPIO_ACTIVE_HIGH>;
288c31c92f45fb Frank Li 2024-07-01  102  		enable-active-high;
288c31c92f45fb Frank Li 2024-07-01  103  		regulator-always-on;
288c31c92f45fb Frank Li 2024-07-01  104  		status = "disabled";
288c31c92f45fb Frank Li 2024-07-01  105  	};
288c31c92f45fb Frank Li 2024-07-01  106  
418ecfca8b1159 Frank Li 2024-06-20  107  	reg_m2_pwr: regulator-m2-pwr {
418ecfca8b1159 Frank Li 2024-06-20  108  		compatible = "regulator-fixed";
418ecfca8b1159 Frank Li 2024-06-20  109  		regulator-name = "M.2-power";
418ecfca8b1159 Frank Li 2024-06-20  110  		regulator-min-microvolt = <3300000>;
418ecfca8b1159 Frank Li 2024-06-20  111  		regulator-max-microvolt = <3300000>;
418ecfca8b1159 Frank Li 2024-06-20  112  		gpio = <&i2c7_pcal6524 20 GPIO_ACTIVE_HIGH>;
418ecfca8b1159 Frank Li 2024-06-20  113  		enable-active-high;
418ecfca8b1159 Frank Li 2024-06-20  114  	};
418ecfca8b1159 Frank Li 2024-06-20  115  
418ecfca8b1159 Frank Li 2024-06-20  116  	reg_pcie0: regulator-pcie {
418ecfca8b1159 Frank Li 2024-06-20  117  		compatible = "regulator-fixed";
418ecfca8b1159 Frank Li 2024-06-20  118  		regulator-name = "PCIE_WLAN_EN";
418ecfca8b1159 Frank Li 2024-06-20  119  		regulator-min-microvolt = <3300000>;
418ecfca8b1159 Frank Li 2024-06-20  120  		regulator-max-microvolt = <3300000>;
418ecfca8b1159 Frank Li 2024-06-20  121  		vin-supply = <&reg_m2_pwr>;
418ecfca8b1159 Frank Li 2024-06-20  122  		gpio = <&i2c7_pcal6524 6 GPIO_ACTIVE_HIGH>;
418ecfca8b1159 Frank Li 2024-06-20  123  		enable-active-high;
418ecfca8b1159 Frank Li 2024-06-20  124  	};
418ecfca8b1159 Frank Li 2024-06-20  125  
418ecfca8b1159 Frank Li 2024-06-20  126  	reg_slot_pwr: regulator-slot-pwr {
418ecfca8b1159 Frank Li 2024-06-20  127  		compatible = "regulator-fixed";
418ecfca8b1159 Frank Li 2024-06-20  128  		regulator-name = "PCIe slot-power";
418ecfca8b1159 Frank Li 2024-06-20  129  		regulator-min-microvolt = <3300000>;
418ecfca8b1159 Frank Li 2024-06-20  130  		regulator-max-microvolt = <3300000>;
418ecfca8b1159 Frank Li 2024-06-20  131  		gpio = <&i2c7_pcal6524 14 GPIO_ACTIVE_HIGH>;
418ecfca8b1159 Frank Li 2024-06-20  132  		enable-active-high;
418ecfca8b1159 Frank Li 2024-06-20  133  	};
418ecfca8b1159 Frank Li 2024-06-20  134  
b8f771037e9e34 Peng Fan 2024-06-17  135  	reg_usdhc2_vmmc: regulator-usdhc2 {
b8f771037e9e34 Peng Fan 2024-06-17  136  		compatible = "regulator-fixed";
b8f771037e9e34 Peng Fan 2024-06-17  137  		pinctrl-names = "default";
b8f771037e9e34 Peng Fan 2024-06-17  138  		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
b8f771037e9e34 Peng Fan 2024-06-17  139  		regulator-name = "VDD_SD2_3V3";
b8f771037e9e34 Peng Fan 2024-06-17  140  		regulator-min-microvolt = <3300000>;
b8f771037e9e34 Peng Fan 2024-06-17  141  		regulator-max-microvolt = <3300000>;
b8f771037e9e34 Peng Fan 2024-06-17  142  		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
b8f771037e9e34 Peng Fan 2024-06-17  143  		enable-active-high;
b8f771037e9e34 Peng Fan 2024-06-17  144  		off-on-delay-us = <12000>;
b8f771037e9e34 Peng Fan 2024-06-17  145  	};
288c31c92f45fb Frank Li 2024-07-01  146  
288c31c92f45fb Frank Li 2024-07-01  147  	sound-bt-sco {
288c31c92f45fb Frank Li 2024-07-01  148  		compatible = "simple-audio-card";
288c31c92f45fb Frank Li 2024-07-01  149  		simple-audio-card,name = "bt-sco-audio";
288c31c92f45fb Frank Li 2024-07-01  150  		simple-audio-card,format = "dsp_a";
288c31c92f45fb Frank Li 2024-07-01  151  		simple-audio-card,bitclock-inversion;
288c31c92f45fb Frank Li 2024-07-01  152  		simple-audio-card,frame-master = <&btcpu>;
288c31c92f45fb Frank Li 2024-07-01  153  		simple-audio-card,bitclock-master = <&btcpu>;
288c31c92f45fb Frank Li 2024-07-01  154  
288c31c92f45fb Frank Li 2024-07-01  155  		btcpu: simple-audio-card,cpu {
288c31c92f45fb Frank Li 2024-07-01  156  			sound-dai = <&sai1>;
288c31c92f45fb Frank Li 2024-07-01  157  			dai-tdm-slot-num = <2>;
288c31c92f45fb Frank Li 2024-07-01  158  			dai-tdm-slot-width = <16>;
288c31c92f45fb Frank Li 2024-07-01  159  		};
288c31c92f45fb Frank Li 2024-07-01  160  
288c31c92f45fb Frank Li 2024-07-01  161  		simple-audio-card,codec {
288c31c92f45fb Frank Li 2024-07-01  162  			sound-dai = <&bt_sco_codec 1>;
288c31c92f45fb Frank Li 2024-07-01  163  		};
288c31c92f45fb Frank Li 2024-07-01  164  	};
288c31c92f45fb Frank Li 2024-07-01  165  
288c31c92f45fb Frank Li 2024-07-01  166  	sound-micfil {
288c31c92f45fb Frank Li 2024-07-01  167  		compatible = "fsl,imx-audio-card";
288c31c92f45fb Frank Li 2024-07-01  168  		model = "micfil-audio";
288c31c92f45fb Frank Li 2024-07-01  169  
288c31c92f45fb Frank Li 2024-07-01  170  		pri-dai-link {
288c31c92f45fb Frank Li 2024-07-01  171  			link-name = "micfil hifi";
288c31c92f45fb Frank Li 2024-07-01  172  			format = "i2s";
288c31c92f45fb Frank Li 2024-07-01  173  			cpu {
288c31c92f45fb Frank Li 2024-07-01  174  				sound-dai = <&micfil>;
288c31c92f45fb Frank Li 2024-07-01  175  			};
288c31c92f45fb Frank Li 2024-07-01  176  		};
288c31c92f45fb Frank Li 2024-07-01  177  	};
288c31c92f45fb Frank Li 2024-07-01  178  
288c31c92f45fb Frank Li 2024-07-01  179  	sound-wm8962 {
288c31c92f45fb Frank Li 2024-07-01  180  		compatible = "fsl,imx-audio-wm8962";
288c31c92f45fb Frank Li 2024-07-01  181  		pinctrl-names = "default";
288c31c92f45fb Frank Li 2024-07-01  182  		pinctrl-0 = <&pinctrl_hp>;
288c31c92f45fb Frank Li 2024-07-01  183  		model = "wm8962-audio";
288c31c92f45fb Frank Li 2024-07-01  184  		audio-cpu = <&sai3>;
288c31c92f45fb Frank Li 2024-07-01  185  		audio-codec = <&wm8962>;
288c31c92f45fb Frank Li 2024-07-01  186  		hp-det-gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
288c31c92f45fb Frank Li 2024-07-01  187  		audio-routing = "Headphone Jack", "HPOUTL",
288c31c92f45fb Frank Li 2024-07-01  188  				"Headphone Jack", "HPOUTR",
288c31c92f45fb Frank Li 2024-07-01  189  				"Ext Spk", "SPKOUTL",
288c31c92f45fb Frank Li 2024-07-01  190  				"Ext Spk", "SPKOUTR",
288c31c92f45fb Frank Li 2024-07-01  191  				"AMIC", "MICBIAS",
288c31c92f45fb Frank Li 2024-07-01  192  				"IN3R", "AMIC",
288c31c92f45fb Frank Li 2024-07-01  193  				"IN1R", "AMIC";
288c31c92f45fb Frank Li 2024-07-01  194  	};
288c31c92f45fb Frank Li 2024-07-01  195  };
288c31c92f45fb Frank Li 2024-07-01  196  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
