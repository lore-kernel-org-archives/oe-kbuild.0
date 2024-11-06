Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B844D1922DF
	for <oe-kbuild@lists.linux.dev>; Wed,  6 Nov 2024 06:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730873396; cv=none; b=dV7j6qeO+XQh3RWmfqJnYgRvGjDZXQ73Q6XHcGN1NduUtig8AEjuqEOeLJr8nDikZ2QK6JDqB6IoXMsyxOusiEZffOJLGa41S2z/KCQ9W0hTwkJY+qJUXMBxF30bOvIAn16WfCNyer4Um5p68iQu+0hcRkJDz+pWPRiSmYBYt+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730873396; c=relaxed/simple;
	bh=nu6lhR2AXM19lI7hFcfxudTrLSL1TBwxyv2cP9eTkFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pQwLH55NeuIt6DYDX4PolQui9tEzERPc+f/RslhlTCTU3twYYuJ80zONApCzEhLU+Km1k8Y2PHjtBWMnqlRyjkn27DtsjzzHB/bDBRsbcrQ+lwQ6+PbbDU5Z6Mudh1s1O4pBJ+iw1TsTBurmoy5xGvJTneT/yxD2gMU6CfXnYJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8VJ+7bE; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8VJ+7bE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730873394; x=1762409394;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nu6lhR2AXM19lI7hFcfxudTrLSL1TBwxyv2cP9eTkFc=;
  b=D8VJ+7bEXqH09UiR31RDVtGshY8B1mQSA9FDLJswB1fjia5wleKqYE9R
   L2B9qqWRUttHQF0lOUm8o/s0RQwaBnQD/KwoI1EHTT9WONa2SScZsBwvF
   541HtC7dd6kLIbTvXrm7XrWQIai2N4Smi8+IUgMUCMXRtnShGo5jl0knY
   W0bJqdF967ABjA2aEGDUXRZTEECsMuDk8Xgu5nJrrTmrQuM0Tg6LgnuNY
   nPV0lmrc+mSv1p8vjJ/9cJtNMUSiIkyBn8bE/pG6RnjW6b+9mn6k8pml3
   DHJatbkYnKGQFgFupama6sajjuKCbSTuhUx2YK9jrAHmdDf48LBgMC3VT
   w==;
X-CSE-ConnectionGUID: RKSGfKy8QWWDV+3Kgkg3nQ==
X-CSE-MsgGUID: rlERnvnPTTeY94+giqlbnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="30082567"
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="30082567"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 22:09:53 -0800
X-CSE-ConnectionGUID: F1PktAqZSBat3EwnH7jfuA==
X-CSE-MsgGUID: gwC1+nqBSn2R59gDdbgZHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,262,1725346800"; 
   d="scan'208";a="83891846"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2024 22:03:09 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Z8F-000myg-0s;
	Wed, 06 Nov 2024 06:03:07 +0000
Date: Wed, 6 Nov 2024 14:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH RESEND v13 11/12] arm64: dts: Add DTS for Marvell PXA1908
 and samsung,coreprimevelte
Message-ID: <202411061210.aKwIm9XW-lkp@intel.com>
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
In-Reply-To: <20241104-pxa1908-lkml-v13-11-e050609b8d6c@skole.hr>
References: <20241104-pxa1908-lkml-v13-11-e050609b8d6c@skole.hr>
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

url:    https://github.com/intel-lab-lkp/linux/commits/Duje-Mihanovi-via-B4-Relay/clk-mmp-Switch-to-use-struct-u32_fract-instead-of-custom-one/20241105-010102
base:   9852d85ec9d492ebef56dc5f229416c925758edc
patch link:    https://lore.kernel.org/r/20241104-pxa1908-lkml-v13-11-e050609b8d6c%40skole.hr
patch subject: [PATCH RESEND v13 11/12] arm64: dts: Add DTS for Marvell PXA1908 and samsung,coreprimevelte
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241106/202411061210.aKwIm9XW-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 639a7ac648f1e50ccd2556e17d401c04f9cce625)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241106/202411061210.aKwIm9XW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411061210.aKwIm9XW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts:38.9-41.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name

vim +38 arch/arm64/boot/dts/marvell/pxa1908-samsung-coreprimevelte.dts

c9edd4a6daf4b9 Duje Mihanović 2024-11-04    5  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04    6  / {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04    7  	model = "Samsung Galaxy Core Prime VE LTE";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04    8  	compatible = "samsung,coreprimevelte", "marvell,pxa1908";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04    9  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   10  	aliases {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   11  		mmc0 = &sdh2; /* eMMC */
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   12  		mmc1 = &sdh0; /* SD card */
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   13  		serial0 = &uart0;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   14  	};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   15  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   16  	chosen {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   17  		#address-cells = <2>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   18  		#size-cells = <2>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   19  		ranges;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   20  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   21  		stdout-path = "serial0:115200n8";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   22  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   23  		/* S-Boot places the initramfs here */
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   24  		linux,initrd-start = <0x4d70000>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   25  		linux,initrd-end = <0x5000000>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   26  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   27  		fb0: framebuffer@17177000 {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   28  			compatible = "simple-framebuffer";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   29  			reg = <0 0x17177000 0 (480 * 800 * 4)>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   30  			width = <480>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   31  			height = <800>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   32  			stride = <(480 * 4)>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   33  			format = "a8r8g8b8";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   34  		};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   35  	};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   36  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   37  	/* Bootloader fills this in */
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  @38  	memory {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   39  		device_type = "memory";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   40  		reg = <0 0 0 0>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   41  	};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   42  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   43  	reserved-memory {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   44  		#address-cells = <2>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   45  		#size-cells = <2>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   46  		ranges;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   47  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   48  		framebuffer@17000000 {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   49  			reg = <0 0x17000000 0 0x1800000>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   50  			no-map;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   51  		};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   52  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   53  		gpu@9000000 {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   54  			reg = <0 0x9000000 0 0x1000000>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   55  		};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   56  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   57  		/* Communications processor, aka modem */
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   58  		cp@5000000 {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   59  			reg = <0 0x5000000 0 0x3000000>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   60  		};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   61  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   62  		cm3@a000000 {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   63  			reg = <0 0xa000000 0 0x80000>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   64  		};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   65  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   66  		seclog@8000000 {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   67  			reg = <0 0x8000000 0 0x100000>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   68  		};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   69  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   70  		ramoops@8100000 {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   71  			compatible = "ramoops";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   72  			reg = <0 0x8100000 0 0x40000>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   73  			record-size = <0x8000>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   74  			console-size = <0x20000>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   75  			max-reason = <5>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   76  		};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   77  	};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   78  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   79  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   80  	i2c-muic {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   81  		compatible = "i2c-gpio";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   82  		sda-gpios = <&gpio 30 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   83  		scl-gpios = <&gpio 29 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   84  		i2c-gpio,delay-us = <3>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   85  		i2c-gpio,timeout-ms = <100>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   86  		#address-cells = <1>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   87  		#size-cells = <0>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   88  		pinctrl-names = "default";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   89  		pinctrl-0 = <&i2c_muic_pins>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   90  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   91  		muic: extcon@14 {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   92  			compatible = "siliconmitus,sm5504-muic";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   93  			reg = <0x14>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   94  			interrupt-parent = <&gpio>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   95  			interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   96  		};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   97  	};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   98  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04   99  	gpio-keys {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  100  		compatible = "gpio-keys";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  101  		pinctrl-names = "default";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  102  		pinctrl-0 = <&gpio_keys_pins>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  103  		autorepeat;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  104  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  105  		key-home {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  106  			label = "Home";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  107  			linux,code = <KEY_HOME>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  108  			gpios = <&gpio 50 GPIO_ACTIVE_LOW>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  109  		};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  110  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  111  		key-volup {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  112  			label = "Volume Up";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  113  			linux,code = <KEY_VOLUMEUP>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  114  			gpios = <&gpio 16 GPIO_ACTIVE_LOW>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  115  		};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  116  
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  117  		key-voldown {
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  118  			label = "Volume Down";
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  119  			linux,code = <KEY_VOLUMEDOWN>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  120  			gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  121  		};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  122  	};
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  123  };
c9edd4a6daf4b9 Duje Mihanović 2024-11-04  124  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
