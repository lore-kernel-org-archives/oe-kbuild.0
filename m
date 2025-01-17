Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A8A1F76D6
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jan 2025 09:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737106041; cv=none; b=Xy6Grhi9EaLwm4ssF1LHkh01xVUGnKMaZw3+aqaIsiL+eevLH+nJTQBFEgbhMLztrpfnDuIe8Oc3cZy0fhKCro/OUMfhzIKlAPEmUlBY6qD24n5BYrGaUjHivO1eKCt3ECxSp98rYv5FCtUs2Af9zdHliEVooBq9UvFGHkqUFGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737106041; c=relaxed/simple;
	bh=c86hN/5i+o4v27ca29wtRSgHamkLL/m0XIa4JF3rBTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XjzJDEeoU6nQpCAJUM38nY0htyduwiu3kq2wLGORN7ObVAr5uYw8VPV1m1oTh++uaZV2tqrNMle8r8uF4GUE83q3cU7p07w2xUHB35tu4199s7wJlW76OGrQYNWOzGTxDmuCi4pu3XAVI+GpQ9Hwp6ZdzrHMRjH84qDtdANPnzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mUh9Xp1O; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mUh9Xp1O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737106040; x=1768642040;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=c86hN/5i+o4v27ca29wtRSgHamkLL/m0XIa4JF3rBTo=;
  b=mUh9Xp1OsZX8s49CaOslVNcrL2OcsO9UKqL3/MFskDkkSZ0YfuPWp2W2
   ofwj0LbYwXvVMZQ5xnDhuiMAuCv5ZcVmy/pbLENnwaUNz2nOSDbLgReK8
   J+8Da0la/dZMdymMeALlPt71O5IhyYxVHRaCrYA3w3+vnBJKldCTOMvUD
   97luPjOgZyHBFnFtNMlW6TfdLd9Pazq9rawgrZQtpYcwfJRnCVSRXAgG3
   t7odQgwq+gt0pweNQ0KrDXoCu9ckQNui2/1N5ALOPbUqAWIQbz/5rrz7I
   Q8Zg/18W9w9E+K84MTbMXq5Cu4FwaWJLLS+mO1tPPer9x6CRjNIIUrvvv
   Q==;
X-CSE-ConnectionGUID: 1hvBmBscQK+KlYA/n3I0iw==
X-CSE-MsgGUID: CZzRCLZ8SwyzXCYwZYVjgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="37445331"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="37445331"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 01:27:19 -0800
X-CSE-ConnectionGUID: /Sbp37GnRIW/rT00khBSbw==
X-CSE-MsgGUID: WtuoUyGrSCGPJ59JEiTi0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110868001"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Jan 2025 01:27:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYidH-000T1L-0B;
	Fri, 17 Jan 2025 09:27:15 +0000
Date: Fri, 17 Jan 2025 17:26:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v14 3/4] arm64: dts: Add DTS for Marvell PXA1908 and
 samsung,coreprimevelte
Message-ID: <202501171715.Z0K1nG2H-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250115-pxa1908-lkml-v14-3-847d24f3665a@skole.hr>
References: <20250115-pxa1908-lkml-v14-3-847d24f3665a@skole.hr>
TO: "Duje Mihanović via B4 Relay" <devnull+duje.mihanovic.skole.hr@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Lubomir Rintel <lkundrak@v3.sk>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Gregory Clement <gregory.clement@bootlin.com>
TO: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
TO: Kees Cook <kees@kernel.org>
TO: Tony Luck <tony.luck@intel.com>
TO: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
CC: David Wronek <david@mainlining.org>
CC: Karel Balej <balejk@matfyz.cz>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-hardening@vger.kernel.org
CC: phone-devel@vger.kernel.org
CC: ~postmarketos/upstreaming@lists.sr.ht
CC: "Duje Mihanović" <duje.mihanovic@skole.hr>

Hi Duje,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5bc55a333a2f7316b58edc7573e8e893f7acb532]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi-via-B4-Relay/dt-bindings-marvell-Document-PXA1908-SoC-and-samsung-coreprimevelte/20250116-044350
base:   5bc55a333a2f7316b58edc7573e8e893f7acb532
patch link:    https://lore.kernel.org/r/20250115-pxa1908-lkml-v14-3-847d24f3665a%40skole.hr
patch subject: [PATCH v14 3/4] arm64: dts: Add DTS for Marvell PXA1908 and samsung,coreprimevelte
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250117 (https://download.01.org/0day-ci/archive/20250117/202501171715.Z0K1nG2H-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171715.Z0K1nG2H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501171715.Z0K1nG2H-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts:38.9-41.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 0, 0, 0]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: mmc@80000: pinctrl-names: ['default'] is too short
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#
   arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dtb: mmc@80000: Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-pxa.yaml#

vim +38 arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts

18ca12ba8252a2 Duje Mihanović 2025-01-15    5  
18ca12ba8252a2 Duje Mihanović 2025-01-15    6  / {
18ca12ba8252a2 Duje Mihanović 2025-01-15    7  	model = "Samsung Galaxy Core Prime VE LTE";
18ca12ba8252a2 Duje Mihanović 2025-01-15    8  	compatible = "samsung,coreprimevelte", "marvell,pxa1908";
18ca12ba8252a2 Duje Mihanović 2025-01-15    9  
18ca12ba8252a2 Duje Mihanović 2025-01-15   10  	aliases {
18ca12ba8252a2 Duje Mihanović 2025-01-15   11  		mmc0 = &sdh2; /* eMMC */
18ca12ba8252a2 Duje Mihanović 2025-01-15   12  		mmc1 = &sdh0; /* SD card */
18ca12ba8252a2 Duje Mihanović 2025-01-15   13  		serial0 = &uart0;
18ca12ba8252a2 Duje Mihanović 2025-01-15   14  	};
18ca12ba8252a2 Duje Mihanović 2025-01-15   15  
18ca12ba8252a2 Duje Mihanović 2025-01-15   16  	chosen {
18ca12ba8252a2 Duje Mihanović 2025-01-15   17  		#address-cells = <2>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   18  		#size-cells = <2>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   19  		ranges;
18ca12ba8252a2 Duje Mihanović 2025-01-15   20  
18ca12ba8252a2 Duje Mihanović 2025-01-15   21  		stdout-path = "serial0:115200n8";
18ca12ba8252a2 Duje Mihanović 2025-01-15   22  
18ca12ba8252a2 Duje Mihanović 2025-01-15   23  		/* S-Boot places the initramfs here */
18ca12ba8252a2 Duje Mihanović 2025-01-15   24  		linux,initrd-start = <0x4d70000>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   25  		linux,initrd-end = <0x5000000>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   26  
18ca12ba8252a2 Duje Mihanović 2025-01-15   27  		fb0: framebuffer@17177000 {
18ca12ba8252a2 Duje Mihanović 2025-01-15   28  			compatible = "simple-framebuffer";
18ca12ba8252a2 Duje Mihanović 2025-01-15   29  			reg = <0 0x17177000 0 (480 * 800 * 4)>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   30  			width = <480>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   31  			height = <800>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   32  			stride = <(480 * 4)>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   33  			format = "a8r8g8b8";
18ca12ba8252a2 Duje Mihanović 2025-01-15   34  		};
18ca12ba8252a2 Duje Mihanović 2025-01-15   35  	};
18ca12ba8252a2 Duje Mihanović 2025-01-15   36  
18ca12ba8252a2 Duje Mihanović 2025-01-15   37  	/* Bootloader fills this in */
18ca12ba8252a2 Duje Mihanović 2025-01-15  @38  	memory {
18ca12ba8252a2 Duje Mihanović 2025-01-15   39  		device_type = "memory";
18ca12ba8252a2 Duje Mihanović 2025-01-15   40  		reg = <0 0 0 0>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   41  	};
18ca12ba8252a2 Duje Mihanović 2025-01-15   42  
18ca12ba8252a2 Duje Mihanović 2025-01-15   43  	reserved-memory {
18ca12ba8252a2 Duje Mihanović 2025-01-15   44  		#address-cells = <2>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   45  		#size-cells = <2>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   46  		ranges;
18ca12ba8252a2 Duje Mihanović 2025-01-15   47  
18ca12ba8252a2 Duje Mihanović 2025-01-15   48  		framebuffer@17000000 {
18ca12ba8252a2 Duje Mihanović 2025-01-15   49  			reg = <0 0x17000000 0 0x1800000>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   50  			no-map;
18ca12ba8252a2 Duje Mihanović 2025-01-15   51  		};
18ca12ba8252a2 Duje Mihanović 2025-01-15   52  
18ca12ba8252a2 Duje Mihanović 2025-01-15   53  		gpu@9000000 {
18ca12ba8252a2 Duje Mihanović 2025-01-15   54  			reg = <0 0x9000000 0 0x1000000>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   55  		};
18ca12ba8252a2 Duje Mihanović 2025-01-15   56  
18ca12ba8252a2 Duje Mihanović 2025-01-15   57  		/* Communications processor, aka modem */
18ca12ba8252a2 Duje Mihanović 2025-01-15   58  		cp@5000000 {
18ca12ba8252a2 Duje Mihanović 2025-01-15   59  			reg = <0 0x5000000 0 0x3000000>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   60  		};
18ca12ba8252a2 Duje Mihanović 2025-01-15   61  
18ca12ba8252a2 Duje Mihanović 2025-01-15   62  		cm3@a000000 {
18ca12ba8252a2 Duje Mihanović 2025-01-15   63  			reg = <0 0xa000000 0 0x80000>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   64  		};
18ca12ba8252a2 Duje Mihanović 2025-01-15   65  
18ca12ba8252a2 Duje Mihanović 2025-01-15   66  		seclog@8000000 {
18ca12ba8252a2 Duje Mihanović 2025-01-15   67  			reg = <0 0x8000000 0 0x100000>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   68  		};
18ca12ba8252a2 Duje Mihanović 2025-01-15   69  
18ca12ba8252a2 Duje Mihanović 2025-01-15   70  		ramoops@8100000 {
18ca12ba8252a2 Duje Mihanović 2025-01-15   71  			compatible = "ramoops";
18ca12ba8252a2 Duje Mihanović 2025-01-15   72  			reg = <0 0x8100000 0 0x40000>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   73  			record-size = <0x8000>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   74  			console-size = <0x20000>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   75  			max-reason = <5>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   76  		};
18ca12ba8252a2 Duje Mihanović 2025-01-15   77  	};
18ca12ba8252a2 Duje Mihanović 2025-01-15   78  
18ca12ba8252a2 Duje Mihanović 2025-01-15   79  
18ca12ba8252a2 Duje Mihanović 2025-01-15   80  	i2c-muic {
18ca12ba8252a2 Duje Mihanović 2025-01-15   81  		compatible = "i2c-gpio";
18ca12ba8252a2 Duje Mihanović 2025-01-15   82  		sda-gpios = <&gpio 30 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   83  		scl-gpios = <&gpio 29 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   84  		i2c-gpio,delay-us = <3>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   85  		i2c-gpio,timeout-ms = <100>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   86  		#address-cells = <1>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   87  		#size-cells = <0>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   88  		pinctrl-names = "default";
18ca12ba8252a2 Duje Mihanović 2025-01-15   89  		pinctrl-0 = <&i2c_muic_pins>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   90  
18ca12ba8252a2 Duje Mihanović 2025-01-15   91  		muic: extcon@14 {
18ca12ba8252a2 Duje Mihanović 2025-01-15   92  			compatible = "siliconmitus,sm5504-muic";
18ca12ba8252a2 Duje Mihanović 2025-01-15   93  			reg = <0x14>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   94  			interrupt-parent = <&gpio>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   95  			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
18ca12ba8252a2 Duje Mihanović 2025-01-15   96  		};
18ca12ba8252a2 Duje Mihanović 2025-01-15   97  	};
18ca12ba8252a2 Duje Mihanović 2025-01-15   98  
18ca12ba8252a2 Duje Mihanović 2025-01-15   99  	gpio-keys {
18ca12ba8252a2 Duje Mihanović 2025-01-15  100  		compatible = "gpio-keys";
18ca12ba8252a2 Duje Mihanović 2025-01-15  101  		pinctrl-names = "default";
18ca12ba8252a2 Duje Mihanović 2025-01-15  102  		pinctrl-0 = <&gpio_keys_pins>;
18ca12ba8252a2 Duje Mihanović 2025-01-15  103  		autorepeat;
18ca12ba8252a2 Duje Mihanović 2025-01-15  104  
18ca12ba8252a2 Duje Mihanović 2025-01-15  105  		key-home {
18ca12ba8252a2 Duje Mihanović 2025-01-15  106  			label = "Home";
18ca12ba8252a2 Duje Mihanović 2025-01-15  107  			linux,code = <KEY_HOME>;
18ca12ba8252a2 Duje Mihanović 2025-01-15  108  			gpios = <&gpio 50 GPIO_ACTIVE_LOW>;
18ca12ba8252a2 Duje Mihanović 2025-01-15  109  		};
18ca12ba8252a2 Duje Mihanović 2025-01-15  110  
18ca12ba8252a2 Duje Mihanović 2025-01-15  111  		key-volup {
18ca12ba8252a2 Duje Mihanović 2025-01-15  112  			label = "Volume Up";
18ca12ba8252a2 Duje Mihanović 2025-01-15  113  			linux,code = <KEY_VOLUMEUP>;
18ca12ba8252a2 Duje Mihanović 2025-01-15  114  			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
18ca12ba8252a2 Duje Mihanović 2025-01-15  115  		};
18ca12ba8252a2 Duje Mihanović 2025-01-15  116  
18ca12ba8252a2 Duje Mihanović 2025-01-15  117  		key-voldown {
18ca12ba8252a2 Duje Mihanović 2025-01-15  118  			label = "Volume Down";
18ca12ba8252a2 Duje Mihanović 2025-01-15  119  			linux,code = <KEY_VOLUMEDOWN>;
18ca12ba8252a2 Duje Mihanović 2025-01-15  120  			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
18ca12ba8252a2 Duje Mihanović 2025-01-15  121  		};
18ca12ba8252a2 Duje Mihanović 2025-01-15  122  	};
18ca12ba8252a2 Duje Mihanović 2025-01-15  123  };
18ca12ba8252a2 Duje Mihanović 2025-01-15  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
