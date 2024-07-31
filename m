Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50F04A31
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Jul 2024 00:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722386530; cv=none; b=ppYndgAGvIuQDgl2WSKc10aKOjN4iRkXEyiFLotUf3eXr+NunaMbiir3B3Mf7vKZBFvL2SfcXA/fIWz4XO3cX3zXhdev50k7YixPExtV173asBWA8BXNjB1sMI9IedyYDPqxelDNI4iI0PyGE9CcwEz1hYt1Raz+5ddkt4PrSxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722386530; c=relaxed/simple;
	bh=ozkmAyBaVBiap/5gYOAVeIk+Iba8IE74ToEqm1Z20+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q21ctu0fT3tArHUcyGexiIAS4LhUms29j4473a4FkevWY3O3hKQ8OIK/ug1HpnDrY7JrxopY9Wv3DdDPHEVoo/tyGa9XhjnDzXuCkHijyci7C5SAeIun6X9x5p6wIFt+yRB/B0xUiUJsREaSI9biV2d3k7cbPfqv7ZSQlpICkAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KO/2Q3uh; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KO/2Q3uh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722386529; x=1753922529;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ozkmAyBaVBiap/5gYOAVeIk+Iba8IE74ToEqm1Z20+k=;
  b=KO/2Q3uhPnUxpLhzJ08iBWi4yCKZy3WoFOM5zAU3NAfx4X4Y8UJ4UBd+
   o/W+L2rYd9UhAweezms1fTDSP+PmxUFabLPZhcfcl15LpwNbxRJtyBXAo
   ma2ubIcb5gwZuAc5FE4Li+kYkRdW/d+gl1gD1SaZ7PA6kS7m4iqmlU1OE
   FELF0IaHd9TkkkF/pmcBUrTwLD0JCguJNHyngINnK4QxPkV0ZOAGgWsRX
   gVT6wn0uA8/sH4RTywx2DbWKVumntbYYFT1JNJKnb9kPe9qzhAbaZDrJz
   qR70NTTCkfZFeGnZzsaSBF36eEKb0KXrxb1m1sqGiyhW3+/02BrBT8UzS
   w==;
X-CSE-ConnectionGUID: yWOtEgZERVyja8cO0W5e1Q==
X-CSE-MsgGUID: Ur1gvlqHRO6wms5owRoiig==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="20366622"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="20366622"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 17:42:07 -0700
X-CSE-ConnectionGUID: GJJLXKrLREKBJ0nUEIXVBA==
X-CSE-MsgGUID: tdqFhg6HRoCRzIde3nJGaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54205835"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Jul 2024 17:42:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYxPo-000tXm-0c;
	Wed, 31 Jul 2024 00:42:04 +0000
Date: Wed, 31 Jul 2024 08:41:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v11 11/12] arm64: dts: Add DTS for Marvell PXA1908 and
 samsung,coreprimevelte
Message-ID: <202407310812.ZU5Qo7nO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240730-pxa1908-lkml-v11-11-21dbb3e28793@skole.hr>
References: <20240730-pxa1908-lkml-v11-11-21dbb3e28793@skole.hr>
TO: "Duje Mihanović via B4 Relay" <devnull+duje.mihanovic.skole.hr@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Tony Lindgren <tony@atomide.com>
TO: Haojian Zhuang <haojian.zhuang@linaro.org>
TO: "Duje Mihanović" <duje.mihanovic@skole.hr>
TO: Lubomir Rintel <lkundrak@v3.sk>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
CC: phone-devel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: Karel Balej <balejk@matfyz.cz>
CC: David Wronek <david@mainlining.org>
CC: linux-clk@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org

Hi Duje,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8400291e289ee6b2bf9779ff1c83a291501f017b]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi-via-B4-Relay/clk-mmp-Switch-to-use-struct-u32_fract-instead-of-custom-one/20240730-204129
base:   8400291e289ee6b2bf9779ff1c83a291501f017b
patch link:    https://lore.kernel.org/r/20240730-pxa1908-lkml-v11-11-21dbb3e28793%40skole.hr
patch subject: [PATCH v11 11/12] arm64: dts: Add DTS for Marvell PXA1908 and samsung,coreprimevelte
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-001-20240731 (https://download.01.org/0day-ci/archive/20240731/202407310812.ZU5Qo7nO-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310812.ZU5Qo7nO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407310812.ZU5Qo7nO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts:38.9-41.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name

vim +38 arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts

024144f05857ed Duje Mihanović 2024-07-30    5  
024144f05857ed Duje Mihanović 2024-07-30    6  / {
024144f05857ed Duje Mihanović 2024-07-30    7  	model = "Samsung Galaxy Core Prime VE LTE";
024144f05857ed Duje Mihanović 2024-07-30    8  	compatible = "samsung,coreprimevelte", "marvell,pxa1908";
024144f05857ed Duje Mihanović 2024-07-30    9  
024144f05857ed Duje Mihanović 2024-07-30   10  	aliases {
024144f05857ed Duje Mihanović 2024-07-30   11  		mmc0 = &sdh2; /* eMMC */
024144f05857ed Duje Mihanović 2024-07-30   12  		mmc1 = &sdh0; /* SD card */
024144f05857ed Duje Mihanović 2024-07-30   13  		serial0 = &uart0;
024144f05857ed Duje Mihanović 2024-07-30   14  	};
024144f05857ed Duje Mihanović 2024-07-30   15  
024144f05857ed Duje Mihanović 2024-07-30   16  	chosen {
024144f05857ed Duje Mihanović 2024-07-30   17  		#address-cells = <2>;
024144f05857ed Duje Mihanović 2024-07-30   18  		#size-cells = <2>;
024144f05857ed Duje Mihanović 2024-07-30   19  		ranges;
024144f05857ed Duje Mihanović 2024-07-30   20  
024144f05857ed Duje Mihanović 2024-07-30   21  		stdout-path = "serial0:115200n8";
024144f05857ed Duje Mihanović 2024-07-30   22  
024144f05857ed Duje Mihanović 2024-07-30   23  		/* S-Boot places the initramfs here */
024144f05857ed Duje Mihanović 2024-07-30   24  		linux,initrd-start = <0x4d70000>;
024144f05857ed Duje Mihanović 2024-07-30   25  		linux,initrd-end = <0x5000000>;
024144f05857ed Duje Mihanović 2024-07-30   26  
024144f05857ed Duje Mihanović 2024-07-30   27  		fb0: framebuffer@17177000 {
024144f05857ed Duje Mihanović 2024-07-30   28  			compatible = "simple-framebuffer";
024144f05857ed Duje Mihanović 2024-07-30   29  			reg = <0 0x17177000 0 (480 * 800 * 4)>;
024144f05857ed Duje Mihanović 2024-07-30   30  			width = <480>;
024144f05857ed Duje Mihanović 2024-07-30   31  			height = <800>;
024144f05857ed Duje Mihanović 2024-07-30   32  			stride = <(480 * 4)>;
024144f05857ed Duje Mihanović 2024-07-30   33  			format = "a8r8g8b8";
024144f05857ed Duje Mihanović 2024-07-30   34  		};
024144f05857ed Duje Mihanović 2024-07-30   35  	};
024144f05857ed Duje Mihanović 2024-07-30   36  
024144f05857ed Duje Mihanović 2024-07-30   37  	/* Bootloader fills this in */
024144f05857ed Duje Mihanović 2024-07-30  @38  	memory {
024144f05857ed Duje Mihanović 2024-07-30   39  		device_type = "memory";
024144f05857ed Duje Mihanović 2024-07-30   40  		reg = <0 0 0 0>;
024144f05857ed Duje Mihanović 2024-07-30   41  	};
024144f05857ed Duje Mihanović 2024-07-30   42  
024144f05857ed Duje Mihanović 2024-07-30   43  	reserved-memory {
024144f05857ed Duje Mihanović 2024-07-30   44  		#address-cells = <2>;
024144f05857ed Duje Mihanović 2024-07-30   45  		#size-cells = <2>;
024144f05857ed Duje Mihanović 2024-07-30   46  		ranges;
024144f05857ed Duje Mihanović 2024-07-30   47  
024144f05857ed Duje Mihanović 2024-07-30   48  		framebuffer@17000000 {
024144f05857ed Duje Mihanović 2024-07-30   49  			reg = <0 0x17000000 0 0x1800000>;
024144f05857ed Duje Mihanović 2024-07-30   50  			no-map;
024144f05857ed Duje Mihanović 2024-07-30   51  		};
024144f05857ed Duje Mihanović 2024-07-30   52  
024144f05857ed Duje Mihanović 2024-07-30   53  		gpu@9000000 {
024144f05857ed Duje Mihanović 2024-07-30   54  			reg = <0 0x9000000 0 0x1000000>;
024144f05857ed Duje Mihanović 2024-07-30   55  		};
024144f05857ed Duje Mihanović 2024-07-30   56  
024144f05857ed Duje Mihanović 2024-07-30   57  		/* Communications processor, aka modem */
024144f05857ed Duje Mihanović 2024-07-30   58  		cp@5000000 {
024144f05857ed Duje Mihanović 2024-07-30   59  			reg = <0 0x5000000 0 0x3000000>;
024144f05857ed Duje Mihanović 2024-07-30   60  		};
024144f05857ed Duje Mihanović 2024-07-30   61  
024144f05857ed Duje Mihanović 2024-07-30   62  		cm3@a000000 {
024144f05857ed Duje Mihanović 2024-07-30   63  			reg = <0 0xa000000 0 0x80000>;
024144f05857ed Duje Mihanović 2024-07-30   64  		};
024144f05857ed Duje Mihanović 2024-07-30   65  
024144f05857ed Duje Mihanović 2024-07-30   66  		seclog@8000000 {
024144f05857ed Duje Mihanović 2024-07-30   67  			reg = <0 0x8000000 0 0x100000>;
024144f05857ed Duje Mihanović 2024-07-30   68  		};
024144f05857ed Duje Mihanović 2024-07-30   69  
024144f05857ed Duje Mihanović 2024-07-30   70  		ramoops@8100000 {
024144f05857ed Duje Mihanović 2024-07-30   71  			compatible = "ramoops";
024144f05857ed Duje Mihanović 2024-07-30   72  			reg = <0 0x8100000 0 0x40000>;
024144f05857ed Duje Mihanović 2024-07-30   73  			record-size = <0x8000>;
024144f05857ed Duje Mihanović 2024-07-30   74  			console-size = <0x20000>;
024144f05857ed Duje Mihanović 2024-07-30   75  			max-reason = <5>;
024144f05857ed Duje Mihanović 2024-07-30   76  		};
024144f05857ed Duje Mihanović 2024-07-30   77  	};
024144f05857ed Duje Mihanović 2024-07-30   78  
024144f05857ed Duje Mihanović 2024-07-30   79  
024144f05857ed Duje Mihanović 2024-07-30   80  	i2c-muic {
024144f05857ed Duje Mihanović 2024-07-30   81  		compatible = "i2c-gpio";
024144f05857ed Duje Mihanović 2024-07-30   82  		sda-gpios = <&gpio 30 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
024144f05857ed Duje Mihanović 2024-07-30   83  		scl-gpios = <&gpio 29 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
024144f05857ed Duje Mihanović 2024-07-30   84  		i2c-gpio,delay-us = <3>;
024144f05857ed Duje Mihanović 2024-07-30   85  		i2c-gpio,timeout-ms = <100>;
024144f05857ed Duje Mihanović 2024-07-30   86  		#address-cells = <1>;
024144f05857ed Duje Mihanović 2024-07-30   87  		#size-cells = <0>;
024144f05857ed Duje Mihanović 2024-07-30   88  		pinctrl-names = "default";
024144f05857ed Duje Mihanović 2024-07-30   89  		pinctrl-0 = <&i2c_muic_pins>;
024144f05857ed Duje Mihanović 2024-07-30   90  
024144f05857ed Duje Mihanović 2024-07-30   91  		muic: extcon@14 {
024144f05857ed Duje Mihanović 2024-07-30   92  			compatible = "siliconmitus,sm5504-muic";
024144f05857ed Duje Mihanović 2024-07-30   93  			reg = <0x14>;
024144f05857ed Duje Mihanović 2024-07-30   94  			interrupt-parent = <&gpio>;
024144f05857ed Duje Mihanović 2024-07-30   95  			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
024144f05857ed Duje Mihanović 2024-07-30   96  		};
024144f05857ed Duje Mihanović 2024-07-30   97  	};
024144f05857ed Duje Mihanović 2024-07-30   98  
024144f05857ed Duje Mihanović 2024-07-30   99  	gpio-keys {
024144f05857ed Duje Mihanović 2024-07-30  100  		compatible = "gpio-keys";
024144f05857ed Duje Mihanović 2024-07-30  101  		pinctrl-names = "default";
024144f05857ed Duje Mihanović 2024-07-30  102  		pinctrl-0 = <&gpio_keys_pins>;
024144f05857ed Duje Mihanović 2024-07-30  103  		autorepeat;
024144f05857ed Duje Mihanović 2024-07-30  104  
024144f05857ed Duje Mihanović 2024-07-30  105  		key-home {
024144f05857ed Duje Mihanović 2024-07-30  106  			label = "Home";
024144f05857ed Duje Mihanović 2024-07-30  107  			linux,code = <KEY_HOME>;
024144f05857ed Duje Mihanović 2024-07-30  108  			gpios = <&gpio 50 GPIO_ACTIVE_LOW>;
024144f05857ed Duje Mihanović 2024-07-30  109  		};
024144f05857ed Duje Mihanović 2024-07-30  110  
024144f05857ed Duje Mihanović 2024-07-30  111  		key-volup {
024144f05857ed Duje Mihanović 2024-07-30  112  			label = "Volume Up";
024144f05857ed Duje Mihanović 2024-07-30  113  			linux,code = <KEY_VOLUMEUP>;
024144f05857ed Duje Mihanović 2024-07-30  114  			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
024144f05857ed Duje Mihanović 2024-07-30  115  		};
024144f05857ed Duje Mihanović 2024-07-30  116  
024144f05857ed Duje Mihanović 2024-07-30  117  		key-voldown {
024144f05857ed Duje Mihanović 2024-07-30  118  			label = "Volume Down";
024144f05857ed Duje Mihanović 2024-07-30  119  			linux,code = <KEY_VOLUMEDOWN>;
024144f05857ed Duje Mihanović 2024-07-30  120  			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
024144f05857ed Duje Mihanović 2024-07-30  121  		};
024144f05857ed Duje Mihanović 2024-07-30  122  	};
024144f05857ed Duje Mihanović 2024-07-30  123  };
024144f05857ed Duje Mihanović 2024-07-30  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
