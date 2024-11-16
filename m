Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F1519ABC6
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Nov 2024 21:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731794299; cv=none; b=L+xa7DB9RwxDi91vV2Al3siZnGj5L+tkQhY3hmK+n3fFROaDKKbICzjCwPJCi2U0MJo7agYiYH8+qX1eNDA5pHmnk9DsJgWIVCz6jk6cG5l0IrzUTVRjMHbBR+sf0Ft71eqbvU/Q28NIZ3ijSHeqiW5adqGKbbjInwR+sr38Noo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731794299; c=relaxed/simple;
	bh=ChnlX/D5Z6N5q5YbH8w6oQr2n2/pue5GeDZNYRvNOAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dQ66guwpo5paB4R+lCnWBjC4nB6EZzlpI4/y7iImbV4+eV6k1uCZd3YqdsY/KQzG8LfX+cLe6bd8NZyPgvatNEBMSNDqLoLBeUq7gOoXzfoxLM9B5eBFlgzVWG8n+T3xZv4UObKroUptozrgkVfLBP3rGPhUl2vXaXJv63wZpHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eLexAq5z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eLexAq5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731794297; x=1763330297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ChnlX/D5Z6N5q5YbH8w6oQr2n2/pue5GeDZNYRvNOAs=;
  b=eLexAq5z+ufiR/vU4xNFQf5A1HYcjJL6Bo9gVwHfNmTshuZfXpcIc7/y
   QU9oOnbrqUSh+a03agBt1BKJ0NsCaYnQrfkNqVQOsxtCSaDlBdF7X2G26
   CU9TkiBCwQCkk6VYrSzy4jbw5Go9xPb8PfAGokkJ23Px/QFAPTASlQNMQ
   M3pOCpkgpGeRFVorjUmop0fDt8knFYPRtEE6BvNtg7V99rH1/I7PqeymR
   IWeNubyFbmGREYvQLGRRbdL+r6MB1dsBvi+LslbxMHhL+gTCxmNSJ2LBG
   Wc0KD7Ei9cZl2gKxE3Zi8gBwZGCU2pi5R1YHMN3VKrpzgKNg+UfQsTWMs
   A==;
X-CSE-ConnectionGUID: oMHcdeHTR16VV06QkuJK1w==
X-CSE-MsgGUID: 2z+tFfYCTySDYpACxE7YCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="54280395"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="54280395"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 13:58:14 -0800
X-CSE-ConnectionGUID: /7VaGJqNRo62wmYC1eA3dw==
X-CSE-MsgGUID: 9U4i9K1CQT6iKmfv8mriaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="88976715"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Nov 2024 13:58:12 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCQny-00018j-0X;
	Sat, 16 Nov 2024 21:58:10 +0000
Date: Sun, 17 Nov 2024 05:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 5/5] arm64: dts: imx: add imx95 dts for sof
Message-ID: <202411170525.5japT80s-lkp@intel.com>
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
In-Reply-To: <20241113195240.3699-6-laurentiumihalcea111@gmail.com>
References: <20241113195240.3699-6-laurentiumihalcea111@gmail.com>
TO: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Daniel Baluta <daniel.baluta@nxp.com>
TO: Mark Brown <broonie@kernel.org>
TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
TO: Takashi Iwai <tiwai@suse.com>
TO: Bard Liao <yung-chuan.liao@linux.intel.com>
TO: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
TO: Jaroslav Kysela <perex@perex.cz>
TO: Frank Li <Frank.li@nxp.com>
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-sound@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-kernel@vger.kernel.org

Hi Laurentiu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next broonie-sound/for-next linus/master v6.12-rc7 next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Laurentiu-Mihalcea/ASoC-dt-bindings-add-common-binding-for-NXP-CPUs/20241114-035712
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241113195240.3699-6-laurentiumihalcea111%40gmail.com
patch subject: [PATCH v2 5/5] arm64: dts: imx: add imx95 dts for sof
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20241116 (https://download.01.org/0day-ci/archive/20241117/202411170525.5japT80s-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170525.5japT80s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411170525.5japT80s-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts:52.18-55.4: Warning (unique_unit_address_if_enabled): /memory@80000000: duplicate unit-address (also used in node /cm7-cpu@80000000)
   arch/arm64/boot/dts/freescale/imx95-19x19-evk-sof.dtb: scmi: Unevaluated properties are not allowed ('arm,max-rx-timeout-ms' was unexpected)
   from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   Traceback (most recent call last):
   File "/usr/local/lib/python3.11/dist-packages/jsonschema/validators.py", line 966, in resolve_fragment
   document = document[part]
   ~~~~~~~~^^^^^^
   KeyError: 'hp-det-gpios'

vim +52 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts

ade1310d898589 Peng Fan 2024-10-12   19  
b8f771037e9e34 Peng Fan 2024-06-17   20  / {
b8f771037e9e34 Peng Fan 2024-06-17   21  	model = "NXP i.MX95 19X19 board";
b8f771037e9e34 Peng Fan 2024-06-17   22  	compatible = "fsl,imx95-19x19-evk", "fsl,imx95";
b8f771037e9e34 Peng Fan 2024-06-17   23  
b8f771037e9e34 Peng Fan 2024-06-17   24  	aliases {
a4f58f88c093ab Peng Fan 2024-10-12   25  		gpio0 = &gpio1;
a4f58f88c093ab Peng Fan 2024-10-12   26  		gpio1 = &gpio2;
a4f58f88c093ab Peng Fan 2024-10-12   27  		gpio2 = &gpio3;
a4f58f88c093ab Peng Fan 2024-10-12   28  		gpio3 = &gpio4;
a4f58f88c093ab Peng Fan 2024-10-12   29  		gpio4 = &gpio5;
a4f58f88c093ab Peng Fan 2024-10-12   30  		i2c0 = &lpi2c1;
a4f58f88c093ab Peng Fan 2024-10-12   31  		i2c1 = &lpi2c2;
a4f58f88c093ab Peng Fan 2024-10-12   32  		i2c2 = &lpi2c3;
a4f58f88c093ab Peng Fan 2024-10-12   33  		i2c3 = &lpi2c4;
a4f58f88c093ab Peng Fan 2024-10-12   34  		i2c4 = &lpi2c5;
a4f58f88c093ab Peng Fan 2024-10-12   35  		i2c5 = &lpi2c6;
a4f58f88c093ab Peng Fan 2024-10-12   36  		i2c6 = &lpi2c7;
a4f58f88c093ab Peng Fan 2024-10-12   37  		i2c7 = &lpi2c8;
b8f771037e9e34 Peng Fan 2024-06-17   38  		mmc0 = &usdhc1;
b8f771037e9e34 Peng Fan 2024-06-17   39  		mmc1 = &usdhc2;
b8f771037e9e34 Peng Fan 2024-06-17   40  		serial0 = &lpuart1;
b8f771037e9e34 Peng Fan 2024-06-17   41  	};
b8f771037e9e34 Peng Fan 2024-06-17   42  
288c31c92f45fb Frank Li 2024-07-01   43  	bt_sco_codec: audio-codec-bt-sco {
288c31c92f45fb Frank Li 2024-07-01   44  		#sound-dai-cells = <1>;
288c31c92f45fb Frank Li 2024-07-01   45  		compatible = "linux,bt-sco";
288c31c92f45fb Frank Li 2024-07-01   46  	};
288c31c92f45fb Frank Li 2024-07-01   47  
b8f771037e9e34 Peng Fan 2024-06-17   48  	chosen {
b8f771037e9e34 Peng Fan 2024-06-17   49  		stdout-path = &lpuart1;
b8f771037e9e34 Peng Fan 2024-06-17   50  	};
b8f771037e9e34 Peng Fan 2024-06-17   51  
b8f771037e9e34 Peng Fan 2024-06-17  @52  	memory@80000000 {
b8f771037e9e34 Peng Fan 2024-06-17   53  		device_type = "memory";
b8f771037e9e34 Peng Fan 2024-06-17   54  		reg = <0x0 0x80000000 0 0x80000000>;
b8f771037e9e34 Peng Fan 2024-06-17   55  	};
b8f771037e9e34 Peng Fan 2024-06-17   56  
7500e5b3706e4f Frank Li 2024-07-01   57  	fan0: pwm-fan {
7500e5b3706e4f Frank Li 2024-07-01   58  		compatible = "pwm-fan";
7500e5b3706e4f Frank Li 2024-07-01   59  		#cooling-cells = <2>;
7500e5b3706e4f Frank Li 2024-07-01   60  		pwms = <&tpm6 2 4000000 PWM_POLARITY_INVERTED>;
7500e5b3706e4f Frank Li 2024-07-01   61  		cooling-levels = <64 128 192 255>;
7500e5b3706e4f Frank Li 2024-07-01   62  	};
7500e5b3706e4f Frank Li 2024-07-01   63  
b8f771037e9e34 Peng Fan 2024-06-17   64  	reserved-memory {
b8f771037e9e34 Peng Fan 2024-06-17   65  		#address-cells = <2>;
b8f771037e9e34 Peng Fan 2024-06-17   66  		#size-cells = <2>;
b8f771037e9e34 Peng Fan 2024-06-17   67  		ranges;
b8f771037e9e34 Peng Fan 2024-06-17   68  
b8f771037e9e34 Peng Fan 2024-06-17   69  		linux_cma: linux,cma {
b8f771037e9e34 Peng Fan 2024-06-17   70  			compatible = "shared-dma-pool";
b8f771037e9e34 Peng Fan 2024-06-17   71  			alloc-ranges = <0 0x80000000 0 0x7f000000>;
b8f771037e9e34 Peng Fan 2024-06-17   72  			size = <0 0x3c000000>;
b8f771037e9e34 Peng Fan 2024-06-17   73  			linux,cma-default;
b8f771037e9e34 Peng Fan 2024-06-17   74  			reusable;
b8f771037e9e34 Peng Fan 2024-06-17   75  		};
b8f771037e9e34 Peng Fan 2024-06-17   76  	};
b8f771037e9e34 Peng Fan 2024-06-17   77  
288c31c92f45fb Frank Li 2024-07-01   78  	reg_3p3v: regulator-3p3v {
288c31c92f45fb Frank Li 2024-07-01   79  		compatible = "regulator-fixed";
288c31c92f45fb Frank Li 2024-07-01   80  		regulator-max-microvolt = <3300000>;
288c31c92f45fb Frank Li 2024-07-01   81  		regulator-min-microvolt = <3300000>;
288c31c92f45fb Frank Li 2024-07-01   82  		regulator-name = "+V3.3_SW";
288c31c92f45fb Frank Li 2024-07-01   83  	};
288c31c92f45fb Frank Li 2024-07-01   84  
288c31c92f45fb Frank Li 2024-07-01   85  	reg_audio_pwr: regulator-audio-pwr {
288c31c92f45fb Frank Li 2024-07-01   86  		compatible = "regulator-fixed";
288c31c92f45fb Frank Li 2024-07-01   87  		regulator-name = "audio-pwr";
288c31c92f45fb Frank Li 2024-07-01   88  		regulator-min-microvolt = <3300000>;
288c31c92f45fb Frank Li 2024-07-01   89  		regulator-max-microvolt = <3300000>;
288c31c92f45fb Frank Li 2024-07-01   90  		gpio = <&i2c4_gpio_expander_21 1 GPIO_ACTIVE_HIGH>;
288c31c92f45fb Frank Li 2024-07-01   91  		enable-active-high;
288c31c92f45fb Frank Li 2024-07-01   92  		regulator-always-on;
288c31c92f45fb Frank Li 2024-07-01   93  	};
288c31c92f45fb Frank Li 2024-07-01   94  
288c31c92f45fb Frank Li 2024-07-01   95  	reg_audio_slot: regulator-audio-slot {
288c31c92f45fb Frank Li 2024-07-01   96  		compatible = "regulator-fixed";
288c31c92f45fb Frank Li 2024-07-01   97  		regulator-name = "audio-wm8962";
288c31c92f45fb Frank Li 2024-07-01   98  		regulator-min-microvolt = <3300000>;
288c31c92f45fb Frank Li 2024-07-01   99  		regulator-max-microvolt = <3300000>;
288c31c92f45fb Frank Li 2024-07-01  100  		gpio = <&i2c4_gpio_expander_21 7 GPIO_ACTIVE_HIGH>;
288c31c92f45fb Frank Li 2024-07-01  101  		enable-active-high;
288c31c92f45fb Frank Li 2024-07-01  102  		regulator-always-on;
288c31c92f45fb Frank Li 2024-07-01  103  		status = "disabled";
288c31c92f45fb Frank Li 2024-07-01  104  	};
288c31c92f45fb Frank Li 2024-07-01  105  
418ecfca8b1159 Frank Li 2024-06-20  106  	reg_m2_pwr: regulator-m2-pwr {
418ecfca8b1159 Frank Li 2024-06-20  107  		compatible = "regulator-fixed";
418ecfca8b1159 Frank Li 2024-06-20  108  		regulator-name = "M.2-power";
418ecfca8b1159 Frank Li 2024-06-20  109  		regulator-min-microvolt = <3300000>;
418ecfca8b1159 Frank Li 2024-06-20  110  		regulator-max-microvolt = <3300000>;
418ecfca8b1159 Frank Li 2024-06-20  111  		gpio = <&i2c7_pcal6524 20 GPIO_ACTIVE_HIGH>;
418ecfca8b1159 Frank Li 2024-06-20  112  		enable-active-high;
418ecfca8b1159 Frank Li 2024-06-20  113  	};
418ecfca8b1159 Frank Li 2024-06-20  114  
418ecfca8b1159 Frank Li 2024-06-20  115  	reg_pcie0: regulator-pcie {
418ecfca8b1159 Frank Li 2024-06-20  116  		compatible = "regulator-fixed";
418ecfca8b1159 Frank Li 2024-06-20  117  		regulator-name = "PCIE_WLAN_EN";
418ecfca8b1159 Frank Li 2024-06-20  118  		regulator-min-microvolt = <3300000>;
418ecfca8b1159 Frank Li 2024-06-20  119  		regulator-max-microvolt = <3300000>;
418ecfca8b1159 Frank Li 2024-06-20  120  		vin-supply = <&reg_m2_pwr>;
418ecfca8b1159 Frank Li 2024-06-20  121  		gpio = <&i2c7_pcal6524 6 GPIO_ACTIVE_HIGH>;
418ecfca8b1159 Frank Li 2024-06-20  122  		enable-active-high;
418ecfca8b1159 Frank Li 2024-06-20  123  	};
418ecfca8b1159 Frank Li 2024-06-20  124  
418ecfca8b1159 Frank Li 2024-06-20  125  	reg_slot_pwr: regulator-slot-pwr {
418ecfca8b1159 Frank Li 2024-06-20  126  		compatible = "regulator-fixed";
418ecfca8b1159 Frank Li 2024-06-20  127  		regulator-name = "PCIe slot-power";
418ecfca8b1159 Frank Li 2024-06-20  128  		regulator-min-microvolt = <3300000>;
418ecfca8b1159 Frank Li 2024-06-20  129  		regulator-max-microvolt = <3300000>;
418ecfca8b1159 Frank Li 2024-06-20  130  		gpio = <&i2c7_pcal6524 14 GPIO_ACTIVE_HIGH>;
418ecfca8b1159 Frank Li 2024-06-20  131  		enable-active-high;
418ecfca8b1159 Frank Li 2024-06-20  132  	};
418ecfca8b1159 Frank Li 2024-06-20  133  
b8f771037e9e34 Peng Fan 2024-06-17  134  	reg_usdhc2_vmmc: regulator-usdhc2 {
b8f771037e9e34 Peng Fan 2024-06-17  135  		compatible = "regulator-fixed";
b8f771037e9e34 Peng Fan 2024-06-17  136  		pinctrl-names = "default";
b8f771037e9e34 Peng Fan 2024-06-17  137  		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
b8f771037e9e34 Peng Fan 2024-06-17  138  		regulator-name = "VDD_SD2_3V3";
b8f771037e9e34 Peng Fan 2024-06-17  139  		regulator-min-microvolt = <3300000>;
b8f771037e9e34 Peng Fan 2024-06-17  140  		regulator-max-microvolt = <3300000>;
b8f771037e9e34 Peng Fan 2024-06-17  141  		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
b8f771037e9e34 Peng Fan 2024-06-17  142  		enable-active-high;
b8f771037e9e34 Peng Fan 2024-06-17  143  		off-on-delay-us = <12000>;
b8f771037e9e34 Peng Fan 2024-06-17  144  	};
288c31c92f45fb Frank Li 2024-07-01  145  
288c31c92f45fb Frank Li 2024-07-01  146  	sound-bt-sco {
288c31c92f45fb Frank Li 2024-07-01  147  		compatible = "simple-audio-card";
288c31c92f45fb Frank Li 2024-07-01  148  		simple-audio-card,name = "bt-sco-audio";
288c31c92f45fb Frank Li 2024-07-01  149  		simple-audio-card,format = "dsp_a";
288c31c92f45fb Frank Li 2024-07-01  150  		simple-audio-card,bitclock-inversion;
288c31c92f45fb Frank Li 2024-07-01  151  		simple-audio-card,frame-master = <&btcpu>;
288c31c92f45fb Frank Li 2024-07-01  152  		simple-audio-card,bitclock-master = <&btcpu>;
288c31c92f45fb Frank Li 2024-07-01  153  
288c31c92f45fb Frank Li 2024-07-01  154  		btcpu: simple-audio-card,cpu {
288c31c92f45fb Frank Li 2024-07-01  155  			sound-dai = <&sai1>;
288c31c92f45fb Frank Li 2024-07-01  156  			dai-tdm-slot-num = <2>;
288c31c92f45fb Frank Li 2024-07-01  157  			dai-tdm-slot-width = <16>;
288c31c92f45fb Frank Li 2024-07-01  158  		};
288c31c92f45fb Frank Li 2024-07-01  159  
288c31c92f45fb Frank Li 2024-07-01  160  		simple-audio-card,codec {
288c31c92f45fb Frank Li 2024-07-01  161  			sound-dai = <&bt_sco_codec 1>;
288c31c92f45fb Frank Li 2024-07-01  162  		};
288c31c92f45fb Frank Li 2024-07-01  163  	};
288c31c92f45fb Frank Li 2024-07-01  164  
288c31c92f45fb Frank Li 2024-07-01  165  	sound-micfil {
288c31c92f45fb Frank Li 2024-07-01  166  		compatible = "fsl,imx-audio-card";
288c31c92f45fb Frank Li 2024-07-01  167  		model = "micfil-audio";
288c31c92f45fb Frank Li 2024-07-01  168  
288c31c92f45fb Frank Li 2024-07-01  169  		pri-dai-link {
288c31c92f45fb Frank Li 2024-07-01  170  			link-name = "micfil hifi";
288c31c92f45fb Frank Li 2024-07-01  171  			format = "i2s";
288c31c92f45fb Frank Li 2024-07-01  172  			cpu {
288c31c92f45fb Frank Li 2024-07-01  173  				sound-dai = <&micfil>;
288c31c92f45fb Frank Li 2024-07-01  174  			};
288c31c92f45fb Frank Li 2024-07-01  175  		};
288c31c92f45fb Frank Li 2024-07-01  176  	};
288c31c92f45fb Frank Li 2024-07-01  177  
288c31c92f45fb Frank Li 2024-07-01  178  	sound-wm8962 {
288c31c92f45fb Frank Li 2024-07-01  179  		compatible = "fsl,imx-audio-wm8962";
288c31c92f45fb Frank Li 2024-07-01  180  		pinctrl-names = "default";
288c31c92f45fb Frank Li 2024-07-01  181  		pinctrl-0 = <&pinctrl_hp>;
288c31c92f45fb Frank Li 2024-07-01  182  		model = "wm8962-audio";
288c31c92f45fb Frank Li 2024-07-01  183  		audio-cpu = <&sai3>;
288c31c92f45fb Frank Li 2024-07-01  184  		audio-codec = <&wm8962>;
288c31c92f45fb Frank Li 2024-07-01  185  		hp-det-gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
288c31c92f45fb Frank Li 2024-07-01  186  		audio-routing = "Headphone Jack", "HPOUTL",
288c31c92f45fb Frank Li 2024-07-01  187  				"Headphone Jack", "HPOUTR",
288c31c92f45fb Frank Li 2024-07-01  188  				"Ext Spk", "SPKOUTL",
288c31c92f45fb Frank Li 2024-07-01  189  				"Ext Spk", "SPKOUTR",
288c31c92f45fb Frank Li 2024-07-01  190  				"AMIC", "MICBIAS",
288c31c92f45fb Frank Li 2024-07-01  191  				"IN3R", "AMIC",
288c31c92f45fb Frank Li 2024-07-01  192  				"IN1R", "AMIC";
288c31c92f45fb Frank Li 2024-07-01  193  	};
288c31c92f45fb Frank Li 2024-07-01  194  };
288c31c92f45fb Frank Li 2024-07-01  195  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
