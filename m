Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6965B18991E
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jun 2025 17:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750180929; cv=none; b=MVSjEEwl+p/E9IOlYTdho+JhfrUmKj7vpws2mlz/YmMO+SruU5t5HZuxYlE/iA3rxRJxwesIja8pHcmZLjMZEEif8IfdvV7bOp1EBxR3wKwlrg+T3v2SgIvOwSD3IJXJC4VyqVb2iY57QAIPHLwa0dI9iYe1+xNf2Sl53Atit8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750180929; c=relaxed/simple;
	bh=5chStAcYXcgz0Ttu9/xMGrdiZEi7ARH+KLVV/iGEpvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XPm2Cb+DhcpITExr8EjHEukg1QtT/QQzQY38cd4sD8tznk5lUeOAnh5WSsD/y+hrmu7eA6+gi4FvseqRWyMVssnafu4yugJlV68N8EFmos1DYLqctz3FMKWzzj680wasaCaXrz7u8WTmyG2WuaL3GqILrU1qIoiHh2Zuds3oOpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aKNgOARA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aKNgOARA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750180928; x=1781716928;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5chStAcYXcgz0Ttu9/xMGrdiZEi7ARH+KLVV/iGEpvk=;
  b=aKNgOARAOLMvmSH6HOk+GdLDEK57YpviNNONpjhelIT73y8Ei2qJ/GWy
   nEqW1Vq6EBJOOJoPmhm70dCpq+nKt7UeGYtSV/mmwb/1NHqoYuAkeWFEb
   33b/j5rKz7k/XiNHIzHFHdCe1MzdFq0XUd68JKRkhqjp0U65i7FpKhffy
   7sP5OFtjjHk/xASDnvcBCtTKIeVkamoMstyUL7+Q/KIa5vuGjwxkKPrhd
   F5QHXMhBMqatjUx3FheAOMBGQsnSNUlsYQcBsBk3SnMWAmNoVDTQe+wUU
   8IpRI0jiW1v5DUleae2MGYwOq/718BoWZmNBNdbbjdlCAkSOqrAfMxYmO
   g==;
X-CSE-ConnectionGUID: CbBagsZOTlCKJXzuYMXeSg==
X-CSE-MsgGUID: /VITGpgxTLe7CTPl7osBBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52465809"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="52465809"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 10:22:07 -0700
X-CSE-ConnectionGUID: 9/krz4STQUOPCKuY8YlxNQ==
X-CSE-MsgGUID: oI7iaCT/TeGVM5bXL4QXRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="153750929"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jun 2025 10:22:06 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRa0Z-000Hwu-2W;
	Tue, 17 Jun 2025 17:22:03 +0000
Date: Wed, 18 Jun 2025 01:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi M5
 support
Message-ID: <202506180130.7BmHQuxC-lkp@intel.com>
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
In-Reply-To: <20250616212214.139585-3-inindev@gmail.com>
References: <20250616212214.139585-3-inindev@gmail.com>
TO: John Clark <inindev@gmail.com>
TO: heiko@sntech.de
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: John Clark <inindev@gmail.com>

Hi John,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rockchip/for-next]
[also build test WARNING on next-20250617]
[cannot apply to robh/for-next arm64/for-next/core clk/clk-next kvmarm/next shawnguo/for-next soc/for-next linus/master v6.16-rc2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/John-Clark/dt-bindings-arm-rockchip-add-FriendlyElec-NanoPi-M5-board/20250617-052437
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git for-next
patch link:    https://lore.kernel.org/r/20250616212214.139585-3-inindev%40gmail.com
patch subject: [PATCH v1 2/2] arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: arm64-randconfig-001-20250617 (https://download.01.org/0day-ci/archive/20250618/202506180130.7BmHQuxC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180130.7BmHQuxC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506180130.7BmHQuxC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts:36.12-42.5: Warning (unit_address_vs_reg): /gpio-keys/button@1: node has a unit name, but no reg or ranges property

vim +36 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts

46aa99340101af John Clark 2025-06-16   17  
46aa99340101af John Clark 2025-06-16   18  / {
46aa99340101af John Clark 2025-06-16   19  	model = "FriendlyElec NanoPi M5";
46aa99340101af John Clark 2025-06-16   20  	compatible = "friendlyarm,nanopi-m5", "rockchip,rk3576";
46aa99340101af John Clark 2025-06-16   21  
46aa99340101af John Clark 2025-06-16   22  	aliases {
46aa99340101af John Clark 2025-06-16   23  		ethernet0 = &gmac0;
46aa99340101af John Clark 2025-06-16   24  		ethernet1 = &gmac1;
46aa99340101af John Clark 2025-06-16   25  	};
46aa99340101af John Clark 2025-06-16   26  
46aa99340101af John Clark 2025-06-16   27  	chosen {
46aa99340101af John Clark 2025-06-16   28  		stdout-path = "serial0:1500000n8";
46aa99340101af John Clark 2025-06-16   29  	};
46aa99340101af John Clark 2025-06-16   30  
46aa99340101af John Clark 2025-06-16   31  	gpio_keys: gpio-keys {
46aa99340101af John Clark 2025-06-16   32  		compatible = "gpio-keys";
46aa99340101af John Clark 2025-06-16   33  		pinctrl-names = "default";
46aa99340101af John Clark 2025-06-16   34  		pinctrl-0 = <&key1_pin>;
46aa99340101af John Clark 2025-06-16   35  
46aa99340101af John Clark 2025-06-16  @36  		button@1 {
46aa99340101af John Clark 2025-06-16   37  			debounce-interval = <50>;
46aa99340101af John Clark 2025-06-16   38  			gpios = <&gpio1 RK_PA0 GPIO_ACTIVE_LOW>;
46aa99340101af John Clark 2025-06-16   39  			label = "K1";
46aa99340101af John Clark 2025-06-16   40  			linux,code = <BTN_1>;
46aa99340101af John Clark 2025-06-16   41  			wakeup-source;
46aa99340101af John Clark 2025-06-16   42  		};
46aa99340101af John Clark 2025-06-16   43  	};
46aa99340101af John Clark 2025-06-16   44  
46aa99340101af John Clark 2025-06-16   45  	gpio_leds: gpio-leds {
46aa99340101af John Clark 2025-06-16   46  		compatible = "gpio-leds";
46aa99340101af John Clark 2025-06-16   47  
46aa99340101af John Clark 2025-06-16   48  		sys_led: led-0 {
46aa99340101af John Clark 2025-06-16   49  			gpios = <&gpio2 RK_PB3 GPIO_ACTIVE_HIGH>;
46aa99340101af John Clark 2025-06-16   50  			label = "sys_led";
46aa99340101af John Clark 2025-06-16   51  			linux,default-trigger = "heartbeat";
46aa99340101af John Clark 2025-06-16   52  			pinctrl-names = "default";
46aa99340101af John Clark 2025-06-16   53  			pinctrl-0 = <&sys_led_pin>;
46aa99340101af John Clark 2025-06-16   54  		};
46aa99340101af John Clark 2025-06-16   55  
46aa99340101af John Clark 2025-06-16   56  		lan_led: led-1 {
46aa99340101af John Clark 2025-06-16   57  			gpios = <&gpio2 RK_PB0 GPIO_ACTIVE_HIGH>;
46aa99340101af John Clark 2025-06-16   58  			label = "lan_led";
46aa99340101af John Clark 2025-06-16   59  			pinctrl-names = "default";
46aa99340101af John Clark 2025-06-16   60  			pinctrl-0 = <&lan_led_pin>;
46aa99340101af John Clark 2025-06-16   61  		};
46aa99340101af John Clark 2025-06-16   62  
46aa99340101af John Clark 2025-06-16   63  		wan_led: led-2 {
46aa99340101af John Clark 2025-06-16   64  			gpios = <&gpio4 RK_PC5 GPIO_ACTIVE_HIGH>;
46aa99340101af John Clark 2025-06-16   65  			label = "wan_led";
46aa99340101af John Clark 2025-06-16   66  			pinctrl-names = "default";
46aa99340101af John Clark 2025-06-16   67  			pinctrl-0 = <&wan_led_pin>;
46aa99340101af John Clark 2025-06-16   68  		};
46aa99340101af John Clark 2025-06-16   69  	};
46aa99340101af John Clark 2025-06-16   70  
46aa99340101af John Clark 2025-06-16   71  	hdmi-con {
46aa99340101af John Clark 2025-06-16   72  		compatible = "hdmi-connector";
46aa99340101af John Clark 2025-06-16   73  		hdmi-pwr-supply = <&vcc_5v0_hdmi>;
46aa99340101af John Clark 2025-06-16   74  		type = "a";
46aa99340101af John Clark 2025-06-16   75  
46aa99340101af John Clark 2025-06-16   76  		port {
46aa99340101af John Clark 2025-06-16   77  			hdmi_con_in: endpoint {
46aa99340101af John Clark 2025-06-16   78  				remote-endpoint = <&hdmi_out_con>;
46aa99340101af John Clark 2025-06-16   79  			};
46aa99340101af John Clark 2025-06-16   80  		};
46aa99340101af John Clark 2025-06-16   81  	};
46aa99340101af John Clark 2025-06-16   82  
46aa99340101af John Clark 2025-06-16   83  	sound {
46aa99340101af John Clark 2025-06-16   84  		compatible = "simple-audio-card";
46aa99340101af John Clark 2025-06-16   85  		pinctrl-names = "default";
46aa99340101af John Clark 2025-06-16   86  		pinctrl-0 = <&hp_det>;
46aa99340101af John Clark 2025-06-16   87  
46aa99340101af John Clark 2025-06-16   88  		simple-audio-card,format = "i2s";
46aa99340101af John Clark 2025-06-16   89  		simple-audio-card,hp-det-gpios = <&gpio2 RK_PD6 GPIO_ACTIVE_LOW>;
46aa99340101af John Clark 2025-06-16   90  		simple-audio-card,mclk-fs = <256>;
46aa99340101af John Clark 2025-06-16   91  		simple-audio-card,name = "realtek,rt5616-codec";
46aa99340101af John Clark 2025-06-16   92  
46aa99340101af John Clark 2025-06-16   93  		simple-audio-card,routing =
46aa99340101af John Clark 2025-06-16   94  			"Headphones", "HPOL",
46aa99340101af John Clark 2025-06-16   95  			"Headphones", "HPOR",
46aa99340101af John Clark 2025-06-16   96  			"IN1P", "Microphone Jack";
46aa99340101af John Clark 2025-06-16   97  		simple-audio-card,widgets =
46aa99340101af John Clark 2025-06-16   98  			"Headphone", "Headphone Jack",
46aa99340101af John Clark 2025-06-16   99  			"Microphone", "Microphone Jack";
46aa99340101af John Clark 2025-06-16  100  
46aa99340101af John Clark 2025-06-16  101  		simple-audio-card,codec {
46aa99340101af John Clark 2025-06-16  102  			sound-dai = <&rt5616>;
46aa99340101af John Clark 2025-06-16  103  		};
46aa99340101af John Clark 2025-06-16  104  
46aa99340101af John Clark 2025-06-16  105  		simple-audio-card,cpu {
46aa99340101af John Clark 2025-06-16  106  			sound-dai = <&sai2>;
46aa99340101af John Clark 2025-06-16  107  		};
46aa99340101af John Clark 2025-06-16  108  	};
46aa99340101af John Clark 2025-06-16  109  
46aa99340101af John Clark 2025-06-16  110  	vcc_12v_dcin: regulator-vcc-12v-dcin {
46aa99340101af John Clark 2025-06-16  111  		compatible = "regulator-fixed";
46aa99340101af John Clark 2025-06-16  112  		regulator-always-on;
46aa99340101af John Clark 2025-06-16  113  		regulator-boot-on;
46aa99340101af John Clark 2025-06-16  114  		regulator-min-microvolt = <12000000>;
46aa99340101af John Clark 2025-06-16  115  		regulator-max-microvolt = <12000000>;
46aa99340101af John Clark 2025-06-16  116  		regulator-name = "vcc_12v_dcin";
46aa99340101af John Clark 2025-06-16  117  		regulator-state-mem {
46aa99340101af John Clark 2025-06-16  118  			regulator-on-in-suspend;
46aa99340101af John Clark 2025-06-16  119  		};
46aa99340101af John Clark 2025-06-16  120  	};
46aa99340101af John Clark 2025-06-16  121  
46aa99340101af John Clark 2025-06-16  122  	vcc_1v1_nldo_s3: regulator-vcc-1v1-nldo-s3 {
46aa99340101af John Clark 2025-06-16  123  		compatible = "regulator-fixed";
46aa99340101af John Clark 2025-06-16  124  		regulator-boot-on;
46aa99340101af John Clark 2025-06-16  125  		regulator-always-on;
46aa99340101af John Clark 2025-06-16  126  		regulator-min-microvolt = <1100000>;
46aa99340101af John Clark 2025-06-16  127  		regulator-max-microvolt = <1100000>;
46aa99340101af John Clark 2025-06-16  128  		regulator-name = "vcc_1v1_nldo_s3";
46aa99340101af John Clark 2025-06-16  129  		vin-supply = <&vcc_5v0_sys>;
46aa99340101af John Clark 2025-06-16  130  		regulator-state-mem {
46aa99340101af John Clark 2025-06-16  131  			regulator-off-in-suspend;
46aa99340101af John Clark 2025-06-16  132  		};
46aa99340101af John Clark 2025-06-16  133  	};
46aa99340101af John Clark 2025-06-16  134  
46aa99340101af John Clark 2025-06-16  135  	vcc_2v0_pldo_s3: regulator-vcc-2v0-pldo-s3 {
46aa99340101af John Clark 2025-06-16  136  		compatible = "regulator-fixed";
46aa99340101af John Clark 2025-06-16  137  		regulator-boot-on;
46aa99340101af John Clark 2025-06-16  138  		regulator-always-on;
46aa99340101af John Clark 2025-06-16  139  		regulator-min-microvolt = <2000000>;
46aa99340101af John Clark 2025-06-16  140  		regulator-max-microvolt = <2000000>;
46aa99340101af John Clark 2025-06-16  141  		regulator-name = "vcc_2v0_pldo_s3";
46aa99340101af John Clark 2025-06-16  142  		vin-supply = <&vcc_5v0_sys>;
46aa99340101af John Clark 2025-06-16  143  		regulator-state-mem {
46aa99340101af John Clark 2025-06-16  144  			regulator-off-in-suspend;
46aa99340101af John Clark 2025-06-16  145  		};
46aa99340101af John Clark 2025-06-16  146  	};
46aa99340101af John Clark 2025-06-16  147  
46aa99340101af John Clark 2025-06-16  148  	vcc_3v3_m2_keym: regulator-vcc-3v3-m2_keym {
46aa99340101af John Clark 2025-06-16  149  		compatible = "regulator-fixed";
46aa99340101af John Clark 2025-06-16  150  		enable-active-high;
46aa99340101af John Clark 2025-06-16  151  		gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_HIGH>;
46aa99340101af John Clark 2025-06-16  152  		pinctrl-names = "default";
46aa99340101af John Clark 2025-06-16  153  		pinctrl-0 = <&pcie_m2_pwren>;
46aa99340101af John Clark 2025-06-16  154  		regulator-min-microvolt = <3300000>;
46aa99340101af John Clark 2025-06-16  155  		regulator-max-microvolt = <3300000>;
46aa99340101af John Clark 2025-06-16  156  		regulator-name = "vcc_3v3_m2_keym";
46aa99340101af John Clark 2025-06-16  157  		vin-supply = <&vcc_5v0_sys>;
46aa99340101af John Clark 2025-06-16  158  		regulator-state-mem {
46aa99340101af John Clark 2025-06-16  159  			regulator-off-in-suspend;
46aa99340101af John Clark 2025-06-16  160  		};
46aa99340101af John Clark 2025-06-16  161  	};
46aa99340101af John Clark 2025-06-16  162  
46aa99340101af John Clark 2025-06-16  163  	vcc_3v3_s0: regulator-vcc-3v3-s0 {
46aa99340101af John Clark 2025-06-16  164  		compatible = "regulator-fixed";
46aa99340101af John Clark 2025-06-16  165  		regulator-always-on;
46aa99340101af John Clark 2025-06-16  166  		regulator-boot-on;
46aa99340101af John Clark 2025-06-16  167  		regulator-min-microvolt = <3300000>;
46aa99340101af John Clark 2025-06-16  168  		regulator-max-microvolt = <3300000>;
46aa99340101af John Clark 2025-06-16  169  		regulator-name = "vcc_3v3_s0";
46aa99340101af John Clark 2025-06-16  170  		vin-supply = <&vcc_3v3_s3>;
46aa99340101af John Clark 2025-06-16  171  		regulator-state-mem {
46aa99340101af John Clark 2025-06-16  172  			regulator-on-in-suspend;
46aa99340101af John Clark 2025-06-16  173  		};
46aa99340101af John Clark 2025-06-16  174  	};
46aa99340101af John Clark 2025-06-16  175  
46aa99340101af John Clark 2025-06-16  176  	vcc_3v3_sd_s0: regulator-vcc-3v3-sd-s0 {
46aa99340101af John Clark 2025-06-16  177  		compatible = "regulator-fixed";
46aa99340101af John Clark 2025-06-16  178  		enable-active-high;
46aa99340101af John Clark 2025-06-16  179  		gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_HIGH>;
46aa99340101af John Clark 2025-06-16  180  		pinctrl-names = "default";
46aa99340101af John Clark 2025-06-16  181  		pinctrl-0 = <&sd_s0_pwren>;
46aa99340101af John Clark 2025-06-16  182  		regulator-boot-on;
46aa99340101af John Clark 2025-06-16  183  		regulator-min-microvolt = <3000000>;
46aa99340101af John Clark 2025-06-16  184  		regulator-max-microvolt = <3000000>;
46aa99340101af John Clark 2025-06-16  185  		regulator-name = "vcc_3v3_sd_s0";
46aa99340101af John Clark 2025-06-16  186  		vin-supply = <&vcc_3v3_s3>;
46aa99340101af John Clark 2025-06-16  187  		regulator-state-mem {
46aa99340101af John Clark 2025-06-16  188  			regulator-on-in-suspend;
46aa99340101af John Clark 2025-06-16  189  		};
46aa99340101af John Clark 2025-06-16  190  	};
46aa99340101af John Clark 2025-06-16  191  
46aa99340101af John Clark 2025-06-16  192  	vcc_5v0_device: regulator-vcc-5v0-device {
46aa99340101af John Clark 2025-06-16  193  		compatible = "regulator-fixed";
46aa99340101af John Clark 2025-06-16  194  		regulator-always-on;
46aa99340101af John Clark 2025-06-16  195  		regulator-boot-on;
46aa99340101af John Clark 2025-06-16  196  		regulator-min-microvolt = <5000000>;
46aa99340101af John Clark 2025-06-16  197  		regulator-max-microvolt = <5000000>;
46aa99340101af John Clark 2025-06-16  198  		regulator-name = "vcc_5v0_device";
46aa99340101af John Clark 2025-06-16  199  		vin-supply = <&vcc_12v_dcin>;
46aa99340101af John Clark 2025-06-16  200  		regulator-state-mem {
46aa99340101af John Clark 2025-06-16  201  			regulator-on-in-suspend;
46aa99340101af John Clark 2025-06-16  202  		};
46aa99340101af John Clark 2025-06-16  203  	};
46aa99340101af John Clark 2025-06-16  204  
46aa99340101af John Clark 2025-06-16  205  	vcc_5v0_hdmi: regulator-vcc-5v0-hdmi {
46aa99340101af John Clark 2025-06-16  206  		compatible = "regulator-fixed";
46aa99340101af John Clark 2025-06-16  207  		enable-active-high;
46aa99340101af John Clark 2025-06-16  208  		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
46aa99340101af John Clark 2025-06-16  209  		pinctrl-names = "default";
46aa99340101af John Clark 2025-06-16  210  		pinctrl-0 = <&hdmi_con_en>;
46aa99340101af John Clark 2025-06-16  211  		regulator-min-microvolt = <5000000>;
46aa99340101af John Clark 2025-06-16  212  		regulator-max-microvolt = <5000000>;
46aa99340101af John Clark 2025-06-16  213  		regulator-name = "vcc_5v0_hdmi";
46aa99340101af John Clark 2025-06-16  214  		vin-supply = <&vcc_5v0_sys>;
46aa99340101af John Clark 2025-06-16  215  		regulator-state-mem {
46aa99340101af John Clark 2025-06-16  216  			regulator-off-in-suspend;
46aa99340101af John Clark 2025-06-16  217  		};
46aa99340101af John Clark 2025-06-16  218  	};
46aa99340101af John Clark 2025-06-16  219  
46aa99340101af John Clark 2025-06-16  220  	vcc_5v0_host: regulator-vcc-5v0-host {
46aa99340101af John Clark 2025-06-16  221  		compatible = "regulator-fixed";
46aa99340101af John Clark 2025-06-16  222  		enable-active-high;
46aa99340101af John Clark 2025-06-16  223  		gpios = <&gpio0 RK_PC7 GPIO_ACTIVE_HIGH>;
46aa99340101af John Clark 2025-06-16  224  		pinctrl-names = "default";
46aa99340101af John Clark 2025-06-16  225  		pinctrl-0 = <&usb_host_pwren>;
46aa99340101af John Clark 2025-06-16  226  		regulator-min-microvolt = <5000000>;
46aa99340101af John Clark 2025-06-16  227  		regulator-max-microvolt = <5000000>;
46aa99340101af John Clark 2025-06-16  228  		regulator-name = "vcc_5v0_host";
46aa99340101af John Clark 2025-06-16  229  		vin-supply = <&vcc_5v0_device>;
46aa99340101af John Clark 2025-06-16  230  		regulator-state-mem {
46aa99340101af John Clark 2025-06-16  231  			regulator-off-in-suspend;
46aa99340101af John Clark 2025-06-16  232  		};
46aa99340101af John Clark 2025-06-16  233  	};
46aa99340101af John Clark 2025-06-16  234  
46aa99340101af John Clark 2025-06-16  235  	vcc_5v0_otg: regulator-vcc-5v0-otg {
46aa99340101af John Clark 2025-06-16  236  		compatible = "regulator-fixed";
46aa99340101af John Clark 2025-06-16  237  		enable-active-high;
46aa99340101af John Clark 2025-06-16  238  		gpios = <&gpio0 RK_PD1 GPIO_ACTIVE_HIGH>;
46aa99340101af John Clark 2025-06-16  239  		pinctrl-names = "default";
46aa99340101af John Clark 2025-06-16  240  		pinctrl-0 = <&usb_otg0_pwren>;
46aa99340101af John Clark 2025-06-16  241  		regulator-min-microvolt = <5000000>;
46aa99340101af John Clark 2025-06-16  242  		regulator-max-microvolt = <5000000>;
46aa99340101af John Clark 2025-06-16  243  		regulator-name = "vcc_5v0_otg";
46aa99340101af John Clark 2025-06-16  244  		vin-supply = <&vcc_5v0_device>;
46aa99340101af John Clark 2025-06-16  245  		regulator-state-mem {
46aa99340101af John Clark 2025-06-16  246  			regulator-off-in-suspend;
46aa99340101af John Clark 2025-06-16  247  		};
46aa99340101af John Clark 2025-06-16  248  	};
46aa99340101af John Clark 2025-06-16  249  
46aa99340101af John Clark 2025-06-16  250  	vcc_5v0_sys: regulator-vcc-5v0-sys {
46aa99340101af John Clark 2025-06-16  251  		compatible = "regulator-fixed";
46aa99340101af John Clark 2025-06-16  252  		regulator-always-on;
46aa99340101af John Clark 2025-06-16  253  		regulator-boot-on;
46aa99340101af John Clark 2025-06-16  254  		regulator-min-microvolt = <5000000>;
46aa99340101af John Clark 2025-06-16  255  		regulator-max-microvolt = <5000000>;
46aa99340101af John Clark 2025-06-16  256  		regulator-name = "vcc_5v0_sys";
46aa99340101af John Clark 2025-06-16  257  		vin-supply = <&vcc_12v_dcin>;
46aa99340101af John Clark 2025-06-16  258  		regulator-state-mem {
46aa99340101af John Clark 2025-06-16  259  			regulator-on-in-suspend;
46aa99340101af John Clark 2025-06-16  260  		};
46aa99340101af John Clark 2025-06-16  261  	};
46aa99340101af John Clark 2025-06-16  262  };
46aa99340101af John Clark 2025-06-16  263  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
