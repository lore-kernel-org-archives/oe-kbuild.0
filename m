Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7429119412A
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Oct 2024 21:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727904882; cv=none; b=GYTNkbOSdBXMmmi1R2Eec5zEVaRMgK1mab/BaiBH7qWFMCHccJRA90slyYv9CPFvWt/Szw0e6hhQqTnSQf6R2UU3yCdVQQc2ROjo4sSsB9p+o9DNnt9CIGi9vVgca3tLZqOwXL7Y2U+DgCy8S1I1ClXmeqUag05LFu7mOy/kYIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727904882; c=relaxed/simple;
	bh=4ofg//4sKw8ytsierNg/ieB5O6e72BMQT+x/vz+8l0E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zqgj0d8KJEm+IbTQSH07ZGqA2qwq84JnqMgXiey1uVQd+DKgnQRvs0iK1Bf8/UyNJNzZpOsPPFN+2nbd67c/6I07e2QQkvxHZDcONeYfc/MCUiOK4q+7KkNZh0een6t4eZp/azUwufamkCficV4ChSOX/8Or0EX+lG/oBo6fvaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JdEdOxGF; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JdEdOxGF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727904880; x=1759440880;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4ofg//4sKw8ytsierNg/ieB5O6e72BMQT+x/vz+8l0E=;
  b=JdEdOxGFtI3nMlHaknrtFCgOG58+9ImUeIb0ZXhZ2zGMPWON71wfxEZt
   6u2fCGpdioyyvBqhFSg2v8e8zGIBUWjzp9qH2+E5vTEzMrK1UcCGN4aMf
   nxI+o7C0sZY45+e6RZZhmzJbctkX1bh1JXJgge7ekyZAaK87FPfhNTUTu
   q8Vk8cPYA1yyZYi9HsehOJtKauwBaBV8Czj1Xp5dYyatZ7AjEAW9hXIRO
   Go/VUuLJBhJqJg1FTeTsXgkNNOeiVM0ODjDh9hN9tVzRWKLlYr2iWp/Li
   RoGARFpZ4hQCfodXJ+6vAYCwth/rgGXJsgZdgL984IDGjtmzFr/hjkrMy
   w==;
X-CSE-ConnectionGUID: ni/WvNENQUO58M3VwvsnlQ==
X-CSE-MsgGUID: CrmRaLLCQ92IuLOQtVoDIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27214283"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="27214283"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 14:34:39 -0700
X-CSE-ConnectionGUID: Nb456cHoRG+DN00Hgb9LxQ==
X-CSE-MsgGUID: FDu6z8/YQ6Cih/NgCbnRDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="97471884"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 02 Oct 2024 14:34:38 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw6zT-000Uad-1e;
	Wed, 02 Oct 2024 21:34:35 +0000
Date: Thu, 3 Oct 2024 05:33:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v13 11/12] arm64: dts: Add DTS for Marvell PXA1908 and
 samsung,coreprimevelte
Message-ID: <202410030558.DS7FHmFF-lkp@intel.com>
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
In-Reply-To: <20241001-pxa1908-lkml-v13-11-6b9a7f64f9ae@skole.hr>
References: <20241001-pxa1908-lkml-v13-11-6b9a7f64f9ae@skole.hr>
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

[auto build test WARNING on 9852d85ec9d492ebef56dc5f229416c925758edc]

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi-via-B4-Relay/clk-mmp-Switch-to-use-struct-u32_fract-instead-of-custom-one/20241001-224233
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241001-pxa1908-lkml-v13-11-6b9a7f64f9ae%40skole.hr
patch subject: [PATCH v13 11/12] arm64: dts: Add DTS for Marvell PXA1908 and samsung,coreprimevelte
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-003-20241002 (https://download.01.org/0day-ci/archive/20241003/202410030558.DS7FHmFF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030558.DS7FHmFF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410030558.DS7FHmFF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts:38.9-41.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name

vim +38 arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts

933ec548cd9d0b Duje Mihanović 2024-10-01    5  
933ec548cd9d0b Duje Mihanović 2024-10-01    6  / {
933ec548cd9d0b Duje Mihanović 2024-10-01    7  	model = "Samsung Galaxy Core Prime VE LTE";
933ec548cd9d0b Duje Mihanović 2024-10-01    8  	compatible = "samsung,coreprimevelte", "marvell,pxa1908";
933ec548cd9d0b Duje Mihanović 2024-10-01    9  
933ec548cd9d0b Duje Mihanović 2024-10-01   10  	aliases {
933ec548cd9d0b Duje Mihanović 2024-10-01   11  		mmc0 = &sdh2; /* eMMC */
933ec548cd9d0b Duje Mihanović 2024-10-01   12  		mmc1 = &sdh0; /* SD card */
933ec548cd9d0b Duje Mihanović 2024-10-01   13  		serial0 = &uart0;
933ec548cd9d0b Duje Mihanović 2024-10-01   14  	};
933ec548cd9d0b Duje Mihanović 2024-10-01   15  
933ec548cd9d0b Duje Mihanović 2024-10-01   16  	chosen {
933ec548cd9d0b Duje Mihanović 2024-10-01   17  		#address-cells = <2>;
933ec548cd9d0b Duje Mihanović 2024-10-01   18  		#size-cells = <2>;
933ec548cd9d0b Duje Mihanović 2024-10-01   19  		ranges;
933ec548cd9d0b Duje Mihanović 2024-10-01   20  
933ec548cd9d0b Duje Mihanović 2024-10-01   21  		stdout-path = "serial0:115200n8";
933ec548cd9d0b Duje Mihanović 2024-10-01   22  
933ec548cd9d0b Duje Mihanović 2024-10-01   23  		/* S-Boot places the initramfs here */
933ec548cd9d0b Duje Mihanović 2024-10-01   24  		linux,initrd-start = <0x4d70000>;
933ec548cd9d0b Duje Mihanović 2024-10-01   25  		linux,initrd-end = <0x5000000>;
933ec548cd9d0b Duje Mihanović 2024-10-01   26  
933ec548cd9d0b Duje Mihanović 2024-10-01   27  		fb0: framebuffer@17177000 {
933ec548cd9d0b Duje Mihanović 2024-10-01   28  			compatible = "simple-framebuffer";
933ec548cd9d0b Duje Mihanović 2024-10-01   29  			reg = <0 0x17177000 0 (480 * 800 * 4)>;
933ec548cd9d0b Duje Mihanović 2024-10-01   30  			width = <480>;
933ec548cd9d0b Duje Mihanović 2024-10-01   31  			height = <800>;
933ec548cd9d0b Duje Mihanović 2024-10-01   32  			stride = <(480 * 4)>;
933ec548cd9d0b Duje Mihanović 2024-10-01   33  			format = "a8r8g8b8";
933ec548cd9d0b Duje Mihanović 2024-10-01   34  		};
933ec548cd9d0b Duje Mihanović 2024-10-01   35  	};
933ec548cd9d0b Duje Mihanović 2024-10-01   36  
933ec548cd9d0b Duje Mihanović 2024-10-01   37  	/* Bootloader fills this in */
933ec548cd9d0b Duje Mihanović 2024-10-01  @38  	memory {
933ec548cd9d0b Duje Mihanović 2024-10-01   39  		device_type = "memory";
933ec548cd9d0b Duje Mihanović 2024-10-01   40  		reg = <0 0 0 0>;
933ec548cd9d0b Duje Mihanović 2024-10-01   41  	};
933ec548cd9d0b Duje Mihanović 2024-10-01   42  
933ec548cd9d0b Duje Mihanović 2024-10-01   43  	reserved-memory {
933ec548cd9d0b Duje Mihanović 2024-10-01   44  		#address-cells = <2>;
933ec548cd9d0b Duje Mihanović 2024-10-01   45  		#size-cells = <2>;
933ec548cd9d0b Duje Mihanović 2024-10-01   46  		ranges;
933ec548cd9d0b Duje Mihanović 2024-10-01   47  
933ec548cd9d0b Duje Mihanović 2024-10-01   48  		framebuffer@17000000 {
933ec548cd9d0b Duje Mihanović 2024-10-01   49  			reg = <0 0x17000000 0 0x1800000>;
933ec548cd9d0b Duje Mihanović 2024-10-01   50  			no-map;
933ec548cd9d0b Duje Mihanović 2024-10-01   51  		};
933ec548cd9d0b Duje Mihanović 2024-10-01   52  
933ec548cd9d0b Duje Mihanović 2024-10-01   53  		gpu@9000000 {
933ec548cd9d0b Duje Mihanović 2024-10-01   54  			reg = <0 0x9000000 0 0x1000000>;
933ec548cd9d0b Duje Mihanović 2024-10-01   55  		};
933ec548cd9d0b Duje Mihanović 2024-10-01   56  
933ec548cd9d0b Duje Mihanović 2024-10-01   57  		/* Communications processor, aka modem */
933ec548cd9d0b Duje Mihanović 2024-10-01   58  		cp@5000000 {
933ec548cd9d0b Duje Mihanović 2024-10-01   59  			reg = <0 0x5000000 0 0x3000000>;
933ec548cd9d0b Duje Mihanović 2024-10-01   60  		};
933ec548cd9d0b Duje Mihanović 2024-10-01   61  
933ec548cd9d0b Duje Mihanović 2024-10-01   62  		cm3@a000000 {
933ec548cd9d0b Duje Mihanović 2024-10-01   63  			reg = <0 0xa000000 0 0x80000>;
933ec548cd9d0b Duje Mihanović 2024-10-01   64  		};
933ec548cd9d0b Duje Mihanović 2024-10-01   65  
933ec548cd9d0b Duje Mihanović 2024-10-01   66  		seclog@8000000 {
933ec548cd9d0b Duje Mihanović 2024-10-01   67  			reg = <0 0x8000000 0 0x100000>;
933ec548cd9d0b Duje Mihanović 2024-10-01   68  		};
933ec548cd9d0b Duje Mihanović 2024-10-01   69  
933ec548cd9d0b Duje Mihanović 2024-10-01   70  		ramoops@8100000 {
933ec548cd9d0b Duje Mihanović 2024-10-01   71  			compatible = "ramoops";
933ec548cd9d0b Duje Mihanović 2024-10-01   72  			reg = <0 0x8100000 0 0x40000>;
933ec548cd9d0b Duje Mihanović 2024-10-01   73  			record-size = <0x8000>;
933ec548cd9d0b Duje Mihanović 2024-10-01   74  			console-size = <0x20000>;
933ec548cd9d0b Duje Mihanović 2024-10-01   75  			max-reason = <5>;
933ec548cd9d0b Duje Mihanović 2024-10-01   76  		};
933ec548cd9d0b Duje Mihanović 2024-10-01   77  	};
933ec548cd9d0b Duje Mihanović 2024-10-01   78  
933ec548cd9d0b Duje Mihanović 2024-10-01   79  
933ec548cd9d0b Duje Mihanović 2024-10-01   80  	i2c-muic {
933ec548cd9d0b Duje Mihanović 2024-10-01   81  		compatible = "i2c-gpio";
933ec548cd9d0b Duje Mihanović 2024-10-01   82  		sda-gpios = <&gpio 30 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
933ec548cd9d0b Duje Mihanović 2024-10-01   83  		scl-gpios = <&gpio 29 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
933ec548cd9d0b Duje Mihanović 2024-10-01   84  		i2c-gpio,delay-us = <3>;
933ec548cd9d0b Duje Mihanović 2024-10-01   85  		i2c-gpio,timeout-ms = <100>;
933ec548cd9d0b Duje Mihanović 2024-10-01   86  		#address-cells = <1>;
933ec548cd9d0b Duje Mihanović 2024-10-01   87  		#size-cells = <0>;
933ec548cd9d0b Duje Mihanović 2024-10-01   88  		pinctrl-names = "default";
933ec548cd9d0b Duje Mihanović 2024-10-01   89  		pinctrl-0 = <&i2c_muic_pins>;
933ec548cd9d0b Duje Mihanović 2024-10-01   90  
933ec548cd9d0b Duje Mihanović 2024-10-01   91  		muic: extcon@14 {
933ec548cd9d0b Duje Mihanović 2024-10-01   92  			compatible = "siliconmitus,sm5504-muic";
933ec548cd9d0b Duje Mihanović 2024-10-01   93  			reg = <0x14>;
933ec548cd9d0b Duje Mihanović 2024-10-01   94  			interrupt-parent = <&gpio>;
933ec548cd9d0b Duje Mihanović 2024-10-01   95  			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
933ec548cd9d0b Duje Mihanović 2024-10-01   96  		};
933ec548cd9d0b Duje Mihanović 2024-10-01   97  	};
933ec548cd9d0b Duje Mihanović 2024-10-01   98  
933ec548cd9d0b Duje Mihanović 2024-10-01   99  	gpio-keys {
933ec548cd9d0b Duje Mihanović 2024-10-01  100  		compatible = "gpio-keys";
933ec548cd9d0b Duje Mihanović 2024-10-01  101  		pinctrl-names = "default";
933ec548cd9d0b Duje Mihanović 2024-10-01  102  		pinctrl-0 = <&gpio_keys_pins>;
933ec548cd9d0b Duje Mihanović 2024-10-01  103  		autorepeat;
933ec548cd9d0b Duje Mihanović 2024-10-01  104  
933ec548cd9d0b Duje Mihanović 2024-10-01  105  		key-home {
933ec548cd9d0b Duje Mihanović 2024-10-01  106  			label = "Home";
933ec548cd9d0b Duje Mihanović 2024-10-01  107  			linux,code = <KEY_HOME>;
933ec548cd9d0b Duje Mihanović 2024-10-01  108  			gpios = <&gpio 50 GPIO_ACTIVE_LOW>;
933ec548cd9d0b Duje Mihanović 2024-10-01  109  		};
933ec548cd9d0b Duje Mihanović 2024-10-01  110  
933ec548cd9d0b Duje Mihanović 2024-10-01  111  		key-volup {
933ec548cd9d0b Duje Mihanović 2024-10-01  112  			label = "Volume Up";
933ec548cd9d0b Duje Mihanović 2024-10-01  113  			linux,code = <KEY_VOLUMEUP>;
933ec548cd9d0b Duje Mihanović 2024-10-01  114  			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
933ec548cd9d0b Duje Mihanović 2024-10-01  115  		};
933ec548cd9d0b Duje Mihanović 2024-10-01  116  
933ec548cd9d0b Duje Mihanović 2024-10-01  117  		key-voldown {
933ec548cd9d0b Duje Mihanović 2024-10-01  118  			label = "Volume Down";
933ec548cd9d0b Duje Mihanović 2024-10-01  119  			linux,code = <KEY_VOLUMEDOWN>;
933ec548cd9d0b Duje Mihanović 2024-10-01  120  			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
933ec548cd9d0b Duje Mihanović 2024-10-01  121  		};
933ec548cd9d0b Duje Mihanović 2024-10-01  122  	};
933ec548cd9d0b Duje Mihanović 2024-10-01  123  };
933ec548cd9d0b Duje Mihanović 2024-10-01  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
