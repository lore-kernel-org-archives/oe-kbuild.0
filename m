Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C3D268
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 05:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729401745; cv=none; b=NBczDqUugHWrNLB8vHz6rw/1a9HISrIJnFLa+2KhjEQ7aqt32yYZnnqfXNtS1mGiMyUPhn7yNXhC4+wWmNy9QJY0iH2ye1gtA+dsJSaaBQbxa6n8STMBBRksRBLDXWAIe1mzUjnVlHH8rfyxrFJ/6tKdcZ1D+XAAeVE84dIn4xM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729401745; c=relaxed/simple;
	bh=zx+hxq38BedNTlJDR/14BYD1ZhBzYWqCSOXhNmEE0Cg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JYg5tPKHuo0N+gpERgzdrhkyUR0PvN7CZOgXnz2SBJmDTMM7mH1uXgoKrAdPbq2SRjHtBAHqPzWoI84ETPbQ4HjNjl9NV3I6NH43MOIrAtF9srXKjOUBwAAH2RkKeBaP+nSq96Nk2ynaTo/BT6XtnNdxw8BtsIQc/OD9L+iLK1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgcggmHo; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgcggmHo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729401741; x=1760937741;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zx+hxq38BedNTlJDR/14BYD1ZhBzYWqCSOXhNmEE0Cg=;
  b=IgcggmHoOhJzcdD/2JKbbhYDUgFwMSsshjty/fT2aGZO5C1RHp0VvVZz
   pO80DsPlSq2GTOXuyodxyb4NueztCqmSQIo9e9SdaoYyXPXQ9A6ryQuC/
   Pqx8tlU3X9Is272yqi+fPwrzhLJjenIlwky6JLj1DtAWLSSqKoE2RWwKd
   DUDYzTnOg4lJvAXp+RTYRKcugOUrMF+cr6S60ZKv1pIBcJ07QTEDubehA
   s291gQyUIzLgGYCHkwgrFmkiSKmMeICL0ylsFgiRyXKj1XreawUhkCIcZ
   OCia6nrgSM5MP1GzFbzeSWxUxQtLsBoX3iJAht/jab75hiIV+DXqRV7FE
   g==;
X-CSE-ConnectionGUID: 8x2MnjQ9SRyl+/pAWt1XcA==
X-CSE-MsgGUID: z1g8d0fuQjG2DGdbP3EuLA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40024332"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40024332"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 22:22:20 -0700
X-CSE-ConnectionGUID: 9R5PtxuPQP2TVm/IyXadMg==
X-CSE-MsgGUID: D2MQy+vtQM+q9vjMiZ0qoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; 
   d="scan'208";a="79231432"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Oct 2024 22:22:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2OON-000PvX-2q;
	Sun, 20 Oct 2024 05:22:15 +0000
Date: Sun, 20 Oct 2024 13:21:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 05/12] ARM: dts: imx53: Align pin config nodes with
 bindings
Message-ID: <202410201341.58CbiVQ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241017211241.170861-5-marex@denx.de>
References: <20241017211241.170861-5-marex@denx.de>
TO: Marek Vasut <marex@denx.de>
TO: linux-arm-kernel@lists.infradead.org
CC: Marek Vasut <marex@denx.de>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Dong Aisheng <aisheng.dong@nxp.com>
CC: Fabio Estevam <festevam@gmail.com>
CC: Jacky Bai <ping.bai@nxp.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Rob Herring <robh@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Stefan Wahren <wahrenst@gmx.net>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: kernel@dh-electronics.com
CC: linux-gpio@vger.kernel.org

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on linusw-pinctrl/devel linusw-pinctrl/for-next arm64/for-next/core clk/clk-next kvmarm/next rockchip/for-next soc/for-next arm/for-next arm/fixes linus/master v6.12-rc3 next-20241018]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/ARM-dts-imx35-Align-pin-config-nodes-with-bindings/20241018-051446
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20241017211241.170861-5-marex%40denx.de
patch subject: [PATCH v3 05/12] ARM: dts: imx53: Align pin config nodes with bindings
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-002-20241019 (https://download.01.org/0day-ci/archive/20241020/202410201341.58CbiVQ7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241020/202410201341.58CbiVQ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410201341.58CbiVQ7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)
--
>> arch/arm/boot/dts/nxp/imx/imx53.dtsi:461.29-464.6: Warning (unique_unit_address_if_enabled): /soc/bus@50000000/pinctrl@53fa8000: duplicate unit-address (also used in node /soc/bus@50000000/iomuxc-gpr@53fa8000)

vim +461 arch/arm/boot/dts/nxp/imx/imx53.dtsi

73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   11  
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   12  / {
7f107887d1995c arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2016-11-12   13  	#address-cells = <1>;
7f107887d1995c arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2016-11-12   14  	#size-cells = <1>;
a971c5545c3d45 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-01-23   15  	/*
a971c5545c3d45 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-01-23   16  	 * The decompressor and also some bootloaders rely on a
a971c5545c3d45 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-01-23   17  	 * pre-existing /chosen node to be available to insert the
a971c5545c3d45 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-01-23   18  	 * command line and merge other ATAGS info.
a971c5545c3d45 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-01-23   19  	 */
a971c5545c3d45 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-01-23   20  	chosen {};
7f107887d1995c arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2016-11-12   21  
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   22  	aliases {
22970070e027cb arch/arm/boot/dts/imx53.dtsi         Marek Vasut               2014-02-28   23  		ethernet0 = &fec;
5230f8fe9ad870 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-08-05   24  		gpio0 = &gpio1;
5230f8fe9ad870 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-08-05   25  		gpio1 = &gpio2;
5230f8fe9ad870 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-08-05   26  		gpio2 = &gpio3;
5230f8fe9ad870 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-08-05   27  		gpio3 = &gpio4;
5230f8fe9ad870 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-08-05   28  		gpio4 = &gpio5;
5230f8fe9ad870 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-08-05   29  		gpio5 = &gpio6;
5230f8fe9ad870 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-08-05   30  		gpio6 = &gpio7;
c60dc1d1bf1cbe arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2013-04-09   31  		i2c0 = &i2c1;
c60dc1d1bf1cbe arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2013-04-09   32  		i2c1 = &i2c2;
c60dc1d1bf1cbe arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2013-04-09   33  		i2c2 = &i2c3;
e5ad32308eb5e1 arch/arm/boot/dts/imx53.dtsi         Steve Longerbeam          2019-05-20   34  		ipu0 = &ipu;
c63d06dedb5f64 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2014-01-16   35  		mmc0 = &esdhc1;
c63d06dedb5f64 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2014-01-16   36  		mmc1 = &esdhc2;
c63d06dedb5f64 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2014-01-16   37  		mmc2 = &esdhc3;
c63d06dedb5f64 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2014-01-16   38  		mmc3 = &esdhc4;
cf4e577e98832e arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-06-25   39  		serial0 = &uart1;
cf4e577e98832e arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-06-25   40  		serial1 = &uart2;
cf4e577e98832e arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-06-25   41  		serial2 = &uart3;
cf4e577e98832e arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-06-25   42  		serial3 = &uart4;
cf4e577e98832e arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-06-25   43  		serial4 = &uart5;
cf4e577e98832e arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-06-25   44  		spi0 = &ecspi1;
cf4e577e98832e arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-06-25   45  		spi1 = &ecspi2;
cf4e577e98832e arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-06-25   46  		spi2 = &cspi;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   47  	};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   48  
070bd7e49171d1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2013-07-07   49  	cpus {
070bd7e49171d1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2013-07-07   50  		#address-cells = <1>;
070bd7e49171d1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2013-07-07   51  		#size-cells = <0>;
791f416608a5b7 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2014-09-26   52  		cpu0: cpu@0 {
070bd7e49171d1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2013-07-07   53  			device_type = "cpu";
070bd7e49171d1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2013-07-07   54  			compatible = "arm,cortex-a8";
070bd7e49171d1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2013-07-07   55  			reg = <0x0>;
791f416608a5b7 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2014-09-26   56  			clocks = <&clks IMX5_CLK_ARM>;
791f416608a5b7 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2014-09-26   57  			clock-latency = <61036>;
791f416608a5b7 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2014-09-26   58  			voltage-tolerance = <5>;
791f416608a5b7 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2014-09-26   59  			operating-points = <
791f416608a5b7 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2014-09-26   60  				/* kHz */
791f416608a5b7 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2014-09-26   61  				 166666  850000
791f416608a5b7 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2014-09-26   62  				 400000  900000
791f416608a5b7 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2014-09-26   63  				 800000 1050000
791f416608a5b7 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2014-09-26   64  				1000000 1200000
791f416608a5b7 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2014-09-26   65  				1200000 1300000
791f416608a5b7 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2014-09-26   66  			>;
070bd7e49171d1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2013-07-07   67  		};
070bd7e49171d1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2013-07-07   68  	};
070bd7e49171d1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2013-07-07   69  
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05   70  	display-subsystem {
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05   71  		compatible = "fsl,imx-display-subsystem";
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05   72  		ports = <&ipu_di0>, <&ipu_di1>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05   73  	};
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05   74  
e5ad32308eb5e1 arch/arm/boot/dts/imx53.dtsi         Steve Longerbeam          2019-05-20   75  	capture_subsystem {
e5ad32308eb5e1 arch/arm/boot/dts/imx53.dtsi         Steve Longerbeam          2019-05-20   76  		compatible = "fsl,imx-capture-subsystem";
e5ad32308eb5e1 arch/arm/boot/dts/imx53.dtsi         Steve Longerbeam          2019-05-20   77  		ports = <&ipu_csi0>, <&ipu_csi1>;
e5ad32308eb5e1 arch/arm/boot/dts/imx53.dtsi         Steve Longerbeam          2019-05-20   78  	};
e5ad32308eb5e1 arch/arm/boot/dts/imx53.dtsi         Steve Longerbeam          2019-05-20   79  
8dccafaa281aa1 arch/arm/boot/dts/imx53.dtsi         Rob Herring               2017-10-13   80  	tzic: tz-interrupt-controller@fffc000 {
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   81  		compatible = "fsl,imx53-tzic", "fsl,tzic";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   82  		interrupt-controller;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   83  		#interrupt-cells = <1>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   84  		reg = <0x0fffc000 0x4000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   85  	};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   86  
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   87  	clocks {
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   88  		ckil {
ac0894359ecfd8 arch/arm/boot/dts/imx53.dtsi         Giulio Benetti            2021-12-03   89  			compatible = "fixed-clock";
4b2b404309f90e arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2014-04-11   90  			#clock-cells = <0>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   91  			clock-frequency = <32768>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   92  		};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   93  
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   94  		ckih1 {
917fee9c6f7b7d arch/arm/boot/dts/imx53.dtsi         Giulio Benetti            2021-12-03   95  			compatible = "fixed-clock";
4b2b404309f90e arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2014-04-11   96  			#clock-cells = <0>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   97  			clock-frequency = <22579200>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   98  		};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17   99  
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  100  		ckih2 {
4ce956128d4352 arch/arm/boot/dts/imx53.dtsi         Giulio Benetti            2021-12-03  101  			compatible = "fixed-clock";
4b2b404309f90e arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2014-04-11  102  			#clock-cells = <0>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  103  			clock-frequency = <0>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  104  		};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  105  
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  106  		osc {
39cd25fe2e1d10 arch/arm/boot/dts/imx53.dtsi         Giulio Benetti            2021-12-03  107  			compatible = "fixed-clock";
4b2b404309f90e arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2014-04-11  108  			#clock-cells = <0>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  109  			clock-frequency = <24000000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  110  		};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  111  	};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  112  
4a2190aa2e92ba arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2018-07-10  113  	pmu: pmu {
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  114  		compatible = "arm,cortex-a8-pmu";
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  115  		interrupt-parent = <&tzic>;
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  116  		interrupts = <77>;
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  117  	};
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  118  
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  119  	usbphy0: usbphy-0 {
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  120  		compatible = "usb-nop-xceiv";
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  121  		clocks = <&clks IMX5_CLK_USB_PHY1_GATE>;
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  122  		clock-names = "main_clk";
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  123  		#phy-cells = <0>;
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  124  		status = "okay";
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  125  	};
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  126  
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  127  	usbphy1: usbphy-1 {
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  128  		compatible = "usb-nop-xceiv";
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  129  		clocks = <&clks IMX5_CLK_USB_PHY2_GATE>;
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  130  		clock-names = "main_clk";
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  131  		#phy-cells = <0>;
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  132  		status = "okay";
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  133  	};
5b2327446c81a1 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2017-11-29  134  
8e82a523151164 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2022-06-14  135  	soc: soc {
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  136  		#address-cells = <1>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  137  		#size-cells = <1>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  138  		compatible = "simple-bus";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  139  		interrupt-parent = <&tzic>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  140  		ranges;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  141  
7affee43c69510 arch/arm/boot/dts/imx53.dtsi         Marek Vasut               2013-11-22  142  		sata: sata@10000000 {
7affee43c69510 arch/arm/boot/dts/imx53.dtsi         Marek Vasut               2013-11-22  143  			compatible = "fsl,imx53-ahci";
7affee43c69510 arch/arm/boot/dts/imx53.dtsi         Marek Vasut               2013-11-22  144  			reg = <0x10000000 0x1000>;
7affee43c69510 arch/arm/boot/dts/imx53.dtsi         Marek Vasut               2013-11-22  145  			interrupts = <28>;
7affee43c69510 arch/arm/boot/dts/imx53.dtsi         Marek Vasut               2013-11-22  146  			clocks = <&clks IMX5_CLK_SATA_GATE>,
7affee43c69510 arch/arm/boot/dts/imx53.dtsi         Marek Vasut               2013-11-22  147  				 <&clks IMX5_CLK_SATA_REF>,
7affee43c69510 arch/arm/boot/dts/imx53.dtsi         Marek Vasut               2013-11-22  148  				 <&clks IMX5_CLK_AHB>;
025781539a3ccf arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2014-07-08  149  			clock-names = "sata", "sata_ref", "ahb";
7affee43c69510 arch/arm/boot/dts/imx53.dtsi         Marek Vasut               2013-11-22  150  			status = "disabled";
7affee43c69510 arch/arm/boot/dts/imx53.dtsi         Marek Vasut               2013-11-22  151  		};
7affee43c69510 arch/arm/boot/dts/imx53.dtsi         Marek Vasut               2013-11-22  152  
abed9a6bf2bb79 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2012-06-05  153  		ipu: ipu@18000000 {
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  154  			#address-cells = <1>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  155  			#size-cells = <0>;
abed9a6bf2bb79 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2012-06-05  156  			compatible = "fsl,imx53-ipu";
6d66da89bf4422 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2014-05-06  157  			reg = <0x18000000 0x08000000>;
abed9a6bf2bb79 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2012-06-05  158  			interrupts = <11 10>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  159  			clocks = <&clks IMX5_CLK_IPU_GATE>,
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  160  				 <&clks IMX5_CLK_IPU_DI0_GATE>,
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  161  				 <&clks IMX5_CLK_IPU_DI1_GATE>;
4438a6a1cc7401 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2013-03-27  162  			clock-names = "bus", "di0", "di1";
8d84c3740fb0c9 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2013-03-28  163  			resets = <&src 2>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  164  
2a8e583c09c841 arch/arm/boot/dts/imx53.dtsi         Fabien Lahoudere          2016-08-04  165  			ipu_csi0: port@0 {
2a8e583c09c841 arch/arm/boot/dts/imx53.dtsi         Fabien Lahoudere          2016-08-04  166  				reg = <0>;
e5ad32308eb5e1 arch/arm/boot/dts/imx53.dtsi         Steve Longerbeam          2019-05-20  167  
e5ad32308eb5e1 arch/arm/boot/dts/imx53.dtsi         Steve Longerbeam          2019-05-20  168  				ipu_csi0_from_parallel_sensor: endpoint {
e5ad32308eb5e1 arch/arm/boot/dts/imx53.dtsi         Steve Longerbeam          2019-05-20  169  				};
2a8e583c09c841 arch/arm/boot/dts/imx53.dtsi         Fabien Lahoudere          2016-08-04  170  			};
2a8e583c09c841 arch/arm/boot/dts/imx53.dtsi         Fabien Lahoudere          2016-08-04  171  
2a8e583c09c841 arch/arm/boot/dts/imx53.dtsi         Fabien Lahoudere          2016-08-04  172  			ipu_csi1: port@1 {
2a8e583c09c841 arch/arm/boot/dts/imx53.dtsi         Fabien Lahoudere          2016-08-04  173  				reg = <1>;
e5ad32308eb5e1 arch/arm/boot/dts/imx53.dtsi         Steve Longerbeam          2019-05-20  174  
e5ad32308eb5e1 arch/arm/boot/dts/imx53.dtsi         Steve Longerbeam          2019-05-20  175  				ipu_csi1_from_parallel_sensor: endpoint {
e5ad32308eb5e1 arch/arm/boot/dts/imx53.dtsi         Steve Longerbeam          2019-05-20  176  				};
2a8e583c09c841 arch/arm/boot/dts/imx53.dtsi         Fabien Lahoudere          2016-08-04  177  			};
2a8e583c09c841 arch/arm/boot/dts/imx53.dtsi         Fabien Lahoudere          2016-08-04  178  
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  179  			ipu_di0: port@2 {
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  180  				#address-cells = <1>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  181  				#size-cells = <0>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  182  				reg = <2>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  183  
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  184  				ipu_di0_disp0: endpoint@0 {
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  185  					reg = <0>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  186  				};
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  187  
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  188  				ipu_di0_lvds0: endpoint@1 {
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  189  					reg = <1>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  190  					remote-endpoint = <&lvds0_in>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  191  				};
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  192  			};
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  193  
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  194  			ipu_di1: port@3 {
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  195  				#address-cells = <1>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  196  				#size-cells = <0>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  197  				reg = <3>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  198  
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  199  				ipu_di1_disp1: endpoint@0 {
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  200  					reg = <0>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  201  				};
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  202  
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  203  				ipu_di1_lvds1: endpoint@1 {
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  204  					reg = <1>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  205  					remote-endpoint = <&lvds1_in>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  206  				};
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  207  
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  208  				ipu_di1_tve: endpoint@2 {
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  209  					reg = <2>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  210  					remote-endpoint = <&tve_in>;
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  211  				};
e05c8c9a790a06 arch/arm/boot/dts/imx53.dtsi         Philipp Zabel             2014-03-05  212  			};
abed9a6bf2bb79 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2012-06-05  213  		};
abed9a6bf2bb79 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2012-06-05  214  
006303d6ba8edd arch/arm/boot/dts/imx53.dtsi         Jonathan Marek            2018-12-04  215  		gpu: gpu@30000000 {
006303d6ba8edd arch/arm/boot/dts/imx53.dtsi         Jonathan Marek            2018-12-04  216  			compatible = "amd,imageon-200.0", "amd,imageon";
006303d6ba8edd arch/arm/boot/dts/imx53.dtsi         Jonathan Marek            2018-12-04  217  			reg = <0x30000000 0x20000>;
006303d6ba8edd arch/arm/boot/dts/imx53.dtsi         Jonathan Marek            2018-12-04  218  			reg-names = "kgsl_3d0_reg_memory";
006303d6ba8edd arch/arm/boot/dts/imx53.dtsi         Jonathan Marek            2018-12-04  219  			interrupts = <12>;
006303d6ba8edd arch/arm/boot/dts/imx53.dtsi         Jonathan Marek            2018-12-04  220  			interrupt-names = "kgsl_3d0_irq";
006303d6ba8edd arch/arm/boot/dts/imx53.dtsi         Jonathan Marek            2018-12-04  221  			clocks = <&clks IMX5_CLK_GPU3D_GATE>, <&clks IMX5_CLK_GARB_GATE>;
006303d6ba8edd arch/arm/boot/dts/imx53.dtsi         Jonathan Marek            2018-12-04  222  			clock-names = "core_clk", "mem_iface_clk";
006303d6ba8edd arch/arm/boot/dts/imx53.dtsi         Jonathan Marek            2018-12-04  223  		};
006303d6ba8edd arch/arm/boot/dts/imx53.dtsi         Jonathan Marek            2018-12-04  224  
e56d3274770e07 arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2022-06-14  225  		aips1: bus@50000000 { /* AIPS1 */
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  226  			compatible = "fsl,aips-bus", "simple-bus";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  227  			#address-cells = <1>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  228  			#size-cells = <1>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  229  			reg = <0x50000000 0x10000000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  230  			ranges;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  231  
b357ffd8604ae4 arch/arm/boot/dts/imx53.dtsi         Adam Ford                 2021-12-02  232  			spba-bus@50000000 {
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  233  				compatible = "fsl,spba-bus", "simple-bus";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  234  				#address-cells = <1>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  235  				#size-cells = <1>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  236  				reg = <0x50000000 0x40000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  237  				ranges;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  238  
7e4cd9d8f7ba42 arch/arm/boot/dts/imx53.dtsi         Anson Huang               2020-06-02  239  				esdhc1: mmc@50004000 {
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  240  					compatible = "fsl,imx53-esdhc";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  241  					reg = <0x50004000 0x4000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  242  					interrupts = <1>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  243  					clocks = <&clks IMX5_CLK_ESDHC1_IPG_GATE>,
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  244  						 <&clks IMX5_CLK_DUMMY>,
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  245  						 <&clks IMX5_CLK_ESDHC1_PER_GATE>;
f40f38d1dc8dee arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2012-11-21  246  					clock-names = "ipg", "ahb", "per";
c104b6a2ed2721 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2012-09-25  247  					bus-width = <4>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  248  					status = "disabled";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  249  				};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  250  
7e4cd9d8f7ba42 arch/arm/boot/dts/imx53.dtsi         Anson Huang               2020-06-02  251  				esdhc2: mmc@50008000 {
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  252  					compatible = "fsl,imx53-esdhc";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  253  					reg = <0x50008000 0x4000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  254  					interrupts = <2>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  255  					clocks = <&clks IMX5_CLK_ESDHC2_IPG_GATE>,
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  256  						 <&clks IMX5_CLK_DUMMY>,
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  257  						 <&clks IMX5_CLK_ESDHC2_PER_GATE>;
f40f38d1dc8dee arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2012-11-21  258  					clock-names = "ipg", "ahb", "per";
c104b6a2ed2721 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2012-09-25  259  					bus-width = <4>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  260  					status = "disabled";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  261  				};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  262  
0c456cfa7ef3f0 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-04-02  263  				uart3: serial@5000c000 {
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  264  					compatible = "fsl,imx53-uart", "fsl,imx21-uart";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  265  					reg = <0x5000c000 0x4000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  266  					interrupts = <33>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  267  					clocks = <&clks IMX5_CLK_UART3_IPG_GATE>,
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  268  						 <&clks IMX5_CLK_UART3_PER_GATE>;
f40f38d1dc8dee arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2012-11-21  269  					clock-names = "ipg", "per";
d04eba90998fdf arch/arm/boot/dts/imx53.dtsi         Fabien Lahoudere          2016-08-04  270  					dmas = <&sdma 42 4 0>, <&sdma 43 4 0>;
d04eba90998fdf arch/arm/boot/dts/imx53.dtsi         Fabien Lahoudere          2016-08-04  271  					dma-names = "rx", "tx";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  272  					status = "disabled";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  273  				};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  274  
5a2ecf0de0d3d7 arch/arm/boot/dts/imx53.dtsi         Rob Herring               2018-09-13  275  				ecspi1: spi@50010000 {
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  276  					#address-cells = <1>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  277  					#size-cells = <0>;
51dd506ba6928c arch/arm/boot/dts/nxp/imx/imx53.dtsi Fabio Estevam             2023-09-24  278  					compatible = "fsl,imx53-ecspi";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  279  					reg = <0x50010000 0x4000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  280  					interrupts = <36>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  281  					clocks = <&clks IMX5_CLK_ECSPI1_IPG_GATE>,
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  282  						 <&clks IMX5_CLK_ECSPI1_PER_GATE>;
f40f38d1dc8dee arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2012-11-21  283  					clock-names = "ipg", "per";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  284  					status = "disabled";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  285  				};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  286  
ffc505c0b99d6c arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-05-11  287  				ssi2: ssi@50014000 {
6ff7f51ef9d34a arch/arm/boot/dts/imx53.dtsi         Alexander Shiyan          2014-08-19  288  					#sound-dai-cells = <0>;
28f93d0bbe171c arch/arm/boot/dts/imx53.dtsi         Markus Schneider-Pargmann 2014-01-17  289  					compatible = "fsl,imx53-ssi",
28f93d0bbe171c arch/arm/boot/dts/imx53.dtsi         Markus Schneider-Pargmann 2014-01-17  290  							"fsl,imx51-ssi",
28f93d0bbe171c arch/arm/boot/dts/imx53.dtsi         Markus Schneider-Pargmann 2014-01-17  291  							"fsl,imx21-ssi";
ffc505c0b99d6c arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-05-11  292  					reg = <0x50014000 0x4000>;
ffc505c0b99d6c arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-05-11  293  					interrupts = <30>;
685570aba0078e arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2014-09-18  294  					clocks = <&clks IMX5_CLK_SSI2_IPG_GATE>,
685570aba0078e arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2014-09-18  295  						 <&clks IMX5_CLK_SSI2_ROOT_GATE>;
685570aba0078e arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2014-09-18  296  					clock-names = "ipg", "baud";
5da826abe90611 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2013-07-17  297  					dmas = <&sdma 24 1 0>,
5da826abe90611 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2013-07-17  298  					       <&sdma 25 1 0>;
5da826abe90611 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2013-07-17  299  					dma-names = "rx", "tx";
ffc505c0b99d6c arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-05-11  300  					fsl,fifo-depth = <15>;
ffc505c0b99d6c arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-05-11  301  					status = "disabled";
ffc505c0b99d6c arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-05-11  302  				};
ffc505c0b99d6c arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-05-11  303  
7e4cd9d8f7ba42 arch/arm/boot/dts/imx53.dtsi         Anson Huang               2020-06-02  304  				esdhc3: mmc@50020000 {
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  305  					compatible = "fsl,imx53-esdhc";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  306  					reg = <0x50020000 0x4000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  307  					interrupts = <3>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  308  					clocks = <&clks IMX5_CLK_ESDHC3_IPG_GATE>,
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  309  						 <&clks IMX5_CLK_DUMMY>,
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  310  						 <&clks IMX5_CLK_ESDHC3_PER_GATE>;
f40f38d1dc8dee arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2012-11-21  311  					clock-names = "ipg", "ahb", "per";
c104b6a2ed2721 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2012-09-25  312  					bus-width = <4>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  313  					status = "disabled";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  314  				};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  315  
7e4cd9d8f7ba42 arch/arm/boot/dts/imx53.dtsi         Anson Huang               2020-06-02  316  				esdhc4: mmc@50024000 {
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  317  					compatible = "fsl,imx53-esdhc";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  318  					reg = <0x50024000 0x4000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  319  					interrupts = <4>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  320  					clocks = <&clks IMX5_CLK_ESDHC4_IPG_GATE>,
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  321  						 <&clks IMX5_CLK_DUMMY>,
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  322  						 <&clks IMX5_CLK_ESDHC4_PER_GATE>;
f40f38d1dc8dee arch/arm/boot/dts/imx53.dtsi         Fabio Estevam             2012-11-21  323  					clock-names = "ipg", "ahb", "per";
c104b6a2ed2721 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2012-09-25  324  					bus-width = <4>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  325  					status = "disabled";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  326  				};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  327  			};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  328  
ac08281ed63c7f arch/arm/boot/dts/imx53.dtsi         Steffen Trumtrar          2014-06-25  329  			aipstz1: bridge@53f00000 {
ac08281ed63c7f arch/arm/boot/dts/imx53.dtsi         Steffen Trumtrar          2014-06-25  330  				compatible = "fsl,imx53-aipstz";
ac08281ed63c7f arch/arm/boot/dts/imx53.dtsi         Steffen Trumtrar          2014-06-25  331  				reg = <0x53f00000 0x60>;
ac08281ed63c7f arch/arm/boot/dts/imx53.dtsi         Steffen Trumtrar          2014-06-25  332  			};
ac08281ed63c7f arch/arm/boot/dts/imx53.dtsi         Steffen Trumtrar          2014-06-25  333  
7b7d6727344a2a arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2012-11-15  334  			usbotg: usb@53f80000 {
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  335  				compatible = "fsl,imx53-usb", "fsl,imx27-usb";
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  336  				reg = <0x53f80000 0x0200>;
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  337  				interrupts = <18>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  338  				clocks = <&clks IMX5_CLK_USBOH3_GATE>;
a57350216d5d54 arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2013-04-11  339  				fsl,usbmisc = <&usbmisc 0>;
a79025c4835496 arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2013-04-11  340  				fsl,usbphy = <&usbphy0>;
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  341  				status = "disabled";
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  342  			};
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  343  
7b7d6727344a2a arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2012-11-15  344  			usbh1: usb@53f80200 {
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  345  				compatible = "fsl,imx53-usb", "fsl,imx27-usb";
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  346  				reg = <0x53f80200 0x0200>;
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  347  				interrupts = <14>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  348  				clocks = <&clks IMX5_CLK_USBOH3_GATE>;
a57350216d5d54 arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2013-04-11  349  				fsl,usbmisc = <&usbmisc 1>;
a79025c4835496 arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2013-04-11  350  				fsl,usbphy = <&usbphy1>;
3ec481ed05a5d4 arch/arm/boot/dts/imx53.dtsi         Matt Porter               2015-02-27  351  				dr_mode = "host";
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  352  				status = "disabled";
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  353  			};
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  354  
7b7d6727344a2a arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2012-11-15  355  			usbh2: usb@53f80400 {
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  356  				compatible = "fsl,imx53-usb", "fsl,imx27-usb";
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  357  				reg = <0x53f80400 0x0200>;
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  358  				interrupts = <16>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  359  				clocks = <&clks IMX5_CLK_USBOH3_GATE>;
a57350216d5d54 arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2013-04-11  360  				fsl,usbmisc = <&usbmisc 2>;
3ec481ed05a5d4 arch/arm/boot/dts/imx53.dtsi         Matt Porter               2015-02-27  361  				dr_mode = "host";
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  362  				status = "disabled";
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  363  			};
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  364  
7b7d6727344a2a arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2012-11-15  365  			usbh3: usb@53f80600 {
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  366  				compatible = "fsl,imx53-usb", "fsl,imx27-usb";
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  367  				reg = <0x53f80600 0x0200>;
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  368  				interrupts = <17>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  369  				clocks = <&clks IMX5_CLK_USBOH3_GATE>;
a57350216d5d54 arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2013-04-11  370  				fsl,usbmisc = <&usbmisc 3>;
3ec481ed05a5d4 arch/arm/boot/dts/imx53.dtsi         Matt Porter               2015-02-27  371  				dr_mode = "host";
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  372  				status = "disabled";
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  373  			};
212d0b8327b21d arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2012-08-23  374  
a57350216d5d54 arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2013-04-11  375  			usbmisc: usbmisc@53f80800 {
a57350216d5d54 arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2013-04-11  376  				#index-cells = <1>;
a57350216d5d54 arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2013-04-11  377  				compatible = "fsl,imx53-usbmisc";
a57350216d5d54 arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2013-04-11  378  				reg = <0x53f80800 0x200>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  379  				clocks = <&clks IMX5_CLK_USBOH3_GATE>;
a57350216d5d54 arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2013-04-11  380  			};
a57350216d5d54 arch/arm/boot/dts/imx53.dtsi         Michael Grzeschik         2013-04-11  381  
4d191868a658a5 arch/arm/boot/dts/imx53.dtsi         Richard Zhao              2011-12-14  382  			gpio1: gpio@53f84000 {
aeb27748e3bc1e arch/arm/boot/dts/imx53.dtsi         Benoît Thébaudeau         2012-06-22  383  				compatible = "fsl,imx53-gpio", "fsl,imx35-gpio";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  384  				reg = <0x53f84000 0x4000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  385  				interrupts = <50 51>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  386  				gpio-controller;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  387  				#gpio-cells = <2>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  388  				interrupt-controller;
88cde8b78f6914 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-07-06  389  				#interrupt-cells = <2>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  390  			};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  391  
4d191868a658a5 arch/arm/boot/dts/imx53.dtsi         Richard Zhao              2011-12-14  392  			gpio2: gpio@53f88000 {
aeb27748e3bc1e arch/arm/boot/dts/imx53.dtsi         Benoît Thébaudeau         2012-06-22  393  				compatible = "fsl,imx53-gpio", "fsl,imx35-gpio";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  394  				reg = <0x53f88000 0x4000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  395  				interrupts = <52 53>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  396  				gpio-controller;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  397  				#gpio-cells = <2>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  398  				interrupt-controller;
88cde8b78f6914 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-07-06  399  				#interrupt-cells = <2>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  400  			};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  401  
4d191868a658a5 arch/arm/boot/dts/imx53.dtsi         Richard Zhao              2011-12-14  402  			gpio3: gpio@53f8c000 {
aeb27748e3bc1e arch/arm/boot/dts/imx53.dtsi         Benoît Thébaudeau         2012-06-22  403  				compatible = "fsl,imx53-gpio", "fsl,imx35-gpio";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  404  				reg = <0x53f8c000 0x4000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  405  				interrupts = <54 55>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  406  				gpio-controller;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  407  				#gpio-cells = <2>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  408  				interrupt-controller;
88cde8b78f6914 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-07-06  409  				#interrupt-cells = <2>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  410  			};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  411  
4d191868a658a5 arch/arm/boot/dts/imx53.dtsi         Richard Zhao              2011-12-14  412  			gpio4: gpio@53f90000 {
aeb27748e3bc1e arch/arm/boot/dts/imx53.dtsi         Benoît Thébaudeau         2012-06-22  413  				compatible = "fsl,imx53-gpio", "fsl,imx35-gpio";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  414  				reg = <0x53f90000 0x4000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  415  				interrupts = <56 57>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  416  				gpio-controller;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  417  				#gpio-cells = <2>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  418  				interrupt-controller;
88cde8b78f6914 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2012-07-06  419  				#interrupt-cells = <2>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  420  			};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  421  
675e4d0325464b arch/arm/boot/dts/imx53.dtsi         Rostislav Lisovy          2013-10-22  422  			kpp: kpp@53f94000 {
675e4d0325464b arch/arm/boot/dts/imx53.dtsi         Rostislav Lisovy          2013-10-22  423  				compatible = "fsl,imx53-kpp", "fsl,imx21-kpp";
675e4d0325464b arch/arm/boot/dts/imx53.dtsi         Rostislav Lisovy          2013-10-22  424  				reg = <0x53f94000 0x4000>;
675e4d0325464b arch/arm/boot/dts/imx53.dtsi         Rostislav Lisovy          2013-10-22  425  				interrupts = <60>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  426  				clocks = <&clks IMX5_CLK_DUMMY>;
675e4d0325464b arch/arm/boot/dts/imx53.dtsi         Rostislav Lisovy          2013-10-22  427  				status = "disabled";
675e4d0325464b arch/arm/boot/dts/imx53.dtsi         Rostislav Lisovy          2013-10-22  428  			};
675e4d0325464b arch/arm/boot/dts/imx53.dtsi         Rostislav Lisovy          2013-10-22  429  
cec12cd8d1861a arch/arm/boot/dts/imx53.dtsi         Krzysztof Kozlowski       2020-09-26  430  			wdog1: watchdog@53f98000 {
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  431  				compatible = "fsl,imx53-wdt", "fsl,imx21-wdt";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  432  				reg = <0x53f98000 0x4000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  433  				interrupts = <58>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  434  				clocks = <&clks IMX5_CLK_DUMMY>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  435  			};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  436  
cec12cd8d1861a arch/arm/boot/dts/imx53.dtsi         Krzysztof Kozlowski       2020-09-26  437  			wdog2: watchdog@53f9c000 {
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  438  				compatible = "fsl,imx53-wdt", "fsl,imx21-wdt";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  439  				reg = <0x53f9c000 0x4000>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  440  				interrupts = <59>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  441  				clocks = <&clks IMX5_CLK_DUMMY>;
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  442  				status = "disabled";
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  443  			};
73d2b4cdfc09a7 arch/arm/boot/dts/imx53.dtsi         Shawn Guo                 2011-10-17  444  
cc8aae9bc6b326 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-03-14  445  			gpt: timer@53fa0000 {
cc8aae9bc6b326 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-03-14  446  				compatible = "fsl,imx53-gpt", "fsl,imx31-gpt";
cc8aae9bc6b326 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-03-14  447  				reg = <0x53fa0000 0x4000>;
cc8aae9bc6b326 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-03-14  448  				interrupts = <39>;
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  449  				clocks = <&clks IMX5_CLK_GPT_IPG_GATE>,
564695dde92a06 arch/arm/boot/dts/imx53.dtsi         Lucas Stach               2013-11-14  450  					 <&clks IMX5_CLK_GPT_HF_GATE>;
cc8aae9bc6b326 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-03-14  451  				clock-names = "ipg", "per";
cc8aae9bc6b326 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-03-14  452  			};
cc8aae9bc6b326 arch/arm/boot/dts/imx53.dtsi         Sascha Hauer              2013-03-14  453  
3473a3a1251930 arch/arm/boot/dts/imx53.dtsi         Patrick Bruenn            2017-12-18  454  			srtc: rtc@53fa4000 {
3473a3a1251930 arch/arm/boot/dts/imx53.dtsi         Patrick Bruenn            2017-12-18  455  				compatible = "fsl,imx53-rtc";
3473a3a1251930 arch/arm/boot/dts/imx53.dtsi         Patrick Bruenn            2017-12-18  456  				reg = <0x53fa4000 0x4000>;
3473a3a1251930 arch/arm/boot/dts/imx53.dtsi         Patrick Bruenn            2017-12-18  457  				interrupts = <24>;
3473a3a1251930 arch/arm/boot/dts/imx53.dtsi         Patrick Bruenn            2017-12-18  458  				clocks = <&clks IMX5_CLK_SRTC_GATE>;
3473a3a1251930 arch/arm/boot/dts/imx53.dtsi         Patrick Bruenn            2017-12-18  459  			};
3473a3a1251930 arch/arm/boot/dts/imx53.dtsi         Patrick Bruenn            2017-12-18  460  
333c311e6d8281 arch/arm/boot/dts/nxp/imx/imx53.dtsi Marek Vasut               2024-10-17 @461  			iomuxc: pinctrl@53fa8000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
