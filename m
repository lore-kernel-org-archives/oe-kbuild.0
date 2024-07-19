Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AE322071
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jul 2024 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721406338; cv=none; b=WdxiD+H4Mvl81XT64GnQbW8Hblw/4v81CSTQL/+FnZF9hwyw6jsRQfhmWKJXtmzmnuypXQbXdmL0l4eGBq9zm0gvlJ6RSdCvuKy8eoAVFIwXryW6xu3zvwDSxg5wKRgV3pt9Yypfgm8/+nPx1kGFeczRFSVO1AwoCBFLdliuD3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721406338; c=relaxed/simple;
	bh=z/1x+64UsDLTEBruseiNxeKSQaUlAKutkVojryjAWKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNYtrn8/dxIsWtOjnVxz7piNL6LgItVPB4GsT1DmUBow2cYxsasAGat9+/4+JBBtU/iXlJOHm11BTnms4eApRxoMiEAp92vrrNKIC9WGKYxwxdfsR9FKdX8SyGK86RrkTp9fmjho6Gwr89FSyBNCskb6dsAcgJOQdv9vG7QgP+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qjou/GBv; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qjou/GBv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721406336; x=1752942336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z/1x+64UsDLTEBruseiNxeKSQaUlAKutkVojryjAWKU=;
  b=Qjou/GBv+o5Nj08C/BhSqomp+UBoMCAWyEp7kWW5PgrGOf7HCXHsz+LD
   jXPImRN2tZ1vOEyUW+lsjbjYNUB/EYtNZtfyV4cNG6gX5WHst1Bd7sOJ8
   QswwKpqJYdtg+2Eq8WLW8Y4FIP38ao1i3xLoacdOpI0rwYnHA3DwqZ02q
   AiVv0tQFV2xJuPnlyjTUKTQDwfSBosqWvLJpHtWUkVEp3KjRIMncrj092
   ZoHARuxSp5B3Yi8Kw41usgsS9fAhCEjnRfJIdylVERts5nj3edxAULGZQ
   ldOhSki5z+F83uf69G+NSojWjMsJAHhmtfIyMxUbPM/WtQWFa+znRFZ/j
   w==;
X-CSE-ConnectionGUID: 8HVfo+lTRCmTtXFKnYRjeA==
X-CSE-MsgGUID: IA4GRb4lS1umzSMGyNwxsw==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="18646145"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="18646145"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 09:25:34 -0700
X-CSE-ConnectionGUID: eWbvL0cuSdCrMW3FjSLRtw==
X-CSE-MsgGUID: qXxQgU9hTVOhnTZzDSDqPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="51778009"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jul 2024 09:25:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUqQD-000iNI-31;
	Fri, 19 Jul 2024 16:25:29 +0000
Date: Sat, 20 Jul 2024 00:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-5.15.y 21/204]
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi:37.10-42.4: Warning
 (unit_address_vs_reg): /gpiomem: node has a reg or ranges property, but no
 unit name
Message-ID: <202407200031.F47fTCMX-lkp@intel.com>
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
TO: Brian Kim <brian.kim@hardkernel.com>
CC: Dongjin Kim <tobetter@gmail.com>
CC: memeka <mihailescu2m@gmail.com>
CC: Yang Deokgyu <secugyu@gmail.com>

tree:   https://github.com/tobetter/linux odroid-5.15.y
head:   b0d4c043656bf74b39a6e723330a80bb53027d69
commit: 61f45d975621becb00c0aef303769f10428b9cd8 [21/204] ODROID-XU4: char: exynos: add /dev/gpiomem device for rootless user GPIO access
:::::: branch date: 2 days ago
:::::: commit date: 2 years, 9 months ago
config: arm-randconfig-002-20240719 (https://download.01.org/0day-ci/archive/20240720/202407200031.F47fTCMX-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200031.F47fTCMX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407200031.F47fTCMX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi:37.10-42.4: Warning (unit_address_vs_reg): /gpiomem: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/exynos54xx.dtsi:144.21-158.5: Warning (simple_bus_reg): /soc/usb3-0: missing or empty reg/ranges property
   arch/arm/boot/dts/exynos54xx.dtsi:166.21-179.5: Warning (simple_bus_reg): /soc/usb3-1: missing or empty reg/ranges property
   arch/arm/boot/dts/exynos5420.dtsi:598.24-602.5: Warning (simple_bus_reg): /soc/dp-video-phy: missing or empty reg/ranges property
   arch/arm/boot/dts/exynos5420.dtsi:604.28-608.5: Warning (simple_bus_reg): /soc/mipi-video-phy: missing or empty reg/ranges property
   arch/arm/boot/dts/exynos5420.dtsi:1080.24-1085.5: Warning (simple_bus_reg): /soc/bus-wcore: missing or empty reg/ranges property

vim +37 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi

3a7c01d75febd5 Krzysztof Kozlowski       2015-05-25   14  
3a7c01d75febd5 Krzysztof Kozlowski       2015-05-25   15  / {
77c91853a65f68 Krzysztof Kozlowski       2020-10-27   16  	gpio-keys {
227c23b5dee1c8 Brian Kim                 2017-09-12   17  		compatible = "gpio-keys";
227c23b5dee1c8 Brian Kim                 2017-09-12   18  		pinctrl-names = "default";
227c23b5dee1c8 Brian Kim                 2017-09-12   19  		pinctrl-0 = <&power_key>;
227c23b5dee1c8 Brian Kim                 2017-09-12   20  
77c91853a65f68 Krzysztof Kozlowski       2020-10-27   21  		power-key {
227c23b5dee1c8 Brian Kim                 2017-09-12   22  			/*
227c23b5dee1c8 Brian Kim                 2017-09-12   23  			 * The power button (SW2) is connected to the PWRON
227c23b5dee1c8 Brian Kim                 2017-09-12   24  			 * pin (active high) of the S2MPS11 PMIC, which acts
227c23b5dee1c8 Brian Kim                 2017-09-12   25  			 * as a 16ms debouce filter and signal inverter with
227c23b5dee1c8 Brian Kim                 2017-09-12   26  			 * output on ONOB pin (active low). ONOB PMIC pin is
227c23b5dee1c8 Brian Kim                 2017-09-12   27  			 * then connected to XEINT3 SoC pin.
227c23b5dee1c8 Brian Kim                 2017-09-12   28  			 */
227c23b5dee1c8 Brian Kim                 2017-09-12   29  			gpios = <&gpx0 3 GPIO_ACTIVE_LOW>;
227c23b5dee1c8 Brian Kim                 2017-09-12   30  			linux,code = <KEY_POWER>;
227c23b5dee1c8 Brian Kim                 2017-09-12   31  			label = "power key";
227c23b5dee1c8 Brian Kim                 2017-09-12   32  			debounce-interval = <0>;
227c23b5dee1c8 Brian Kim                 2017-09-12   33  			wakeup-source;
227c23b5dee1c8 Brian Kim                 2017-09-12   34  		};
227c23b5dee1c8 Brian Kim                 2017-09-12   35  	};
227c23b5dee1c8 Brian Kim                 2017-09-12   36  
61f45d975621be Brian Kim                 2017-01-10  @37  	gpiomem {
61f45d975621be Brian Kim                 2017-01-10   38  		compatible = "samsung,exynos-gpiomem";
61f45d975621be Brian Kim                 2017-01-10   39  		reg = <0x13400000 0x1000>,
61f45d975621be Brian Kim                 2017-01-10   40  		      <0x14010000 0x1000>;
61f45d975621be Brian Kim                 2017-01-10   41  		status = "okay";
61f45d975621be Brian Kim                 2017-01-10   42  	};
61f45d975621be Brian Kim                 2017-01-10   43  
3a7c01d75febd5 Krzysztof Kozlowski       2015-05-25   44  	emmc_pwrseq: pwrseq {
3a7c01d75febd5 Krzysztof Kozlowski       2015-05-25   45  		pinctrl-0 = <&emmc_nrst_pin>;
3a7c01d75febd5 Krzysztof Kozlowski       2015-05-25   46  		pinctrl-names = "default";
3a7c01d75febd5 Krzysztof Kozlowski       2015-05-25   47  		compatible = "mmc-pwrseq-emmc";
31b9903c233e83 Javier Martinez Canillas  2015-10-08   48  		reset-gpios = <&gpd1 0 GPIO_ACTIVE_LOW>;
3a7c01d75febd5 Krzysztof Kozlowski       2015-05-25   49  	};
3a7c01d75febd5 Krzysztof Kozlowski       2015-05-25   50  
b685d540cc265d Anand Moon                2015-06-15   51  	fan0: pwm-fan {
b685d540cc265d Anand Moon                2015-06-15   52  		compatible = "pwm-fan";
b685d540cc265d Anand Moon                2015-06-15   53  		pwms = <&pwm 0 20972 0>;
b685d540cc265d Anand Moon                2015-06-15   54  		#cooling-cells = <2>;
b685d540cc265d Anand Moon                2015-06-15   55  		cooling-levels = <0 130 170 230>;
b685d540cc265d Anand Moon                2015-06-15   56  	};
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   57  
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   58  	thermal-zones {
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   59  		cpu0_thermal: cpu0-thermal {
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   60  			thermal-sensors = <&tmu_cpu0 0>;
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   61  			polling-delay-passive = <250>;
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   62  			polling-delay = <0>;
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   63  			trips {
e740731dae9470 Willy Wolff               2017-09-07   64  				cpu0_alert0: cpu-alert-0 {
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   65  					temperature = <50000>; /* millicelsius */
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   66  					hysteresis = <5000>; /* millicelsius */
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   67  					type = "active";
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   68  				};
e740731dae9470 Willy Wolff               2017-09-07   69  				cpu0_alert1: cpu-alert-1 {
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   70  					temperature = <60000>; /* millicelsius */
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   71  					hysteresis = <5000>; /* millicelsius */
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   72  					type = "active";
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   73  				};
e740731dae9470 Willy Wolff               2017-09-07   74  				cpu0_alert2: cpu-alert-2 {
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   75  					temperature = <70000>; /* millicelsius */
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   76  					hysteresis = <5000>; /* millicelsius */
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   77  					type = "active";
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   78  				};
e740731dae9470 Willy Wolff               2017-09-07   79  				cpu0_crit0: cpu-crit-0 {
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   80  					temperature = <120000>; /* millicelsius */
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   81  					hysteresis = <0>; /* millicelsius */
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   82  					type = "critical";
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   83  				};
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   84  				/*
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   85  				 * Exynos542x supports only 4 trip-points
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   86  				 * so for these polling mode is required.
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   87  				 * Start polling at temperature level of last
e740731dae9470 Willy Wolff               2017-09-07   88  				 * interrupt-driven trip: cpu0_alert2
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   89  				 */
e740731dae9470 Willy Wolff               2017-09-07   90  				cpu0_alert3: cpu-alert-3 {
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   91  					temperature = <70000>; /* millicelsius */
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   92  					hysteresis = <10000>; /* millicelsius */
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   93  					type = "passive";
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   94  				};
e740731dae9470 Willy Wolff               2017-09-07   95  				cpu0_alert4: cpu-alert-4 {
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   96  					temperature = <85000>; /* millicelsius */
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   97  					hysteresis = <10000>; /* millicelsius */
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   98  					type = "passive";
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09   99  				};
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  100  			};
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  101  			cooling-maps {
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  102  				map0 {
e740731dae9470 Willy Wolff               2017-09-07  103  					trip = <&cpu0_alert0>;
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  104  					cooling-device = <&fan0 0 1>;
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  105  				};
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  106  				map1 {
e740731dae9470 Willy Wolff               2017-09-07  107  					trip = <&cpu0_alert1>;
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  108  					cooling-device = <&fan0 1 2>;
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  109  				};
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  110  				map2 {
e740731dae9470 Willy Wolff               2017-09-07  111  					trip = <&cpu0_alert2>;
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  112  					cooling-device = <&fan0 2 3>;
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  113  				};
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  114  				/*
e740731dae9470 Willy Wolff               2017-09-07  115  				 * When reaching cpu0_alert3, reduce CPU
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  116  				 * by 2 steps. On Exynos5422/5800 that would
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  117  				 * (usually) be: 1800 MHz and 1200 MHz.
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  118  				 */
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  119  				map3 {
e740731dae9470 Willy Wolff               2017-09-07  120  					trip = <&cpu0_alert3>;
670734f5581023 Viresh Kumar              2018-11-16  121  					cooling-device = <&cpu0 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  122  							 <&cpu1 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  123  							 <&cpu2 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  124  							 <&cpu3 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  125  							 <&cpu4 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  126  							 <&cpu5 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  127  							 <&cpu6 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  128  							 <&cpu7 0 2>;
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  129  				};
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  130  				/*
e740731dae9470 Willy Wolff               2017-09-07  131  				 * When reaching cpu0_alert4, reduce CPU
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  132  				 * further, down to 600 MHz (14 steps for big,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  133  				 * 8 steps for LITTLE).
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  134  				 */
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  135  				cpu0_cooling_map4: map4 {
e740731dae9470 Willy Wolff               2017-09-07  136  					trip = <&cpu0_alert4>;
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  137  					cooling-device = <&cpu0 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  138  							 <&cpu1 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  139  							 <&cpu2 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  140  							 <&cpu3 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  141  							 <&cpu4 3 14>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  142  							 <&cpu5 3 14>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  143  							 <&cpu6 3 14>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  144  							 <&cpu7 3 14>;
e740731dae9470 Willy Wolff               2017-09-07  145  				};
e740731dae9470 Willy Wolff               2017-09-07  146  			};
e740731dae9470 Willy Wolff               2017-09-07  147  		};
e740731dae9470 Willy Wolff               2017-09-07  148  		cpu1_thermal: cpu1-thermal {
e740731dae9470 Willy Wolff               2017-09-07  149  			thermal-sensors = <&tmu_cpu1 0>;
e740731dae9470 Willy Wolff               2017-09-07  150  			polling-delay-passive = <250>;
e740731dae9470 Willy Wolff               2017-09-07  151  			polling-delay = <0>;
e740731dae9470 Willy Wolff               2017-09-07  152  			trips {
e740731dae9470 Willy Wolff               2017-09-07  153  				cpu1_alert0: cpu-alert-0 {
e740731dae9470 Willy Wolff               2017-09-07  154  					temperature = <50000>;
e740731dae9470 Willy Wolff               2017-09-07  155  					hysteresis = <5000>;
e740731dae9470 Willy Wolff               2017-09-07  156  					type = "active";
e740731dae9470 Willy Wolff               2017-09-07  157  				};
e740731dae9470 Willy Wolff               2017-09-07  158  				cpu1_alert1: cpu-alert-1 {
e740731dae9470 Willy Wolff               2017-09-07  159  					temperature = <60000>;
e740731dae9470 Willy Wolff               2017-09-07  160  					hysteresis = <5000>;
e740731dae9470 Willy Wolff               2017-09-07  161  					type = "active";
e740731dae9470 Willy Wolff               2017-09-07  162  				};
e740731dae9470 Willy Wolff               2017-09-07  163  				cpu1_alert2: cpu-alert-2 {
e740731dae9470 Willy Wolff               2017-09-07  164  					temperature = <70000>;
e740731dae9470 Willy Wolff               2017-09-07  165  					hysteresis = <5000>;
e740731dae9470 Willy Wolff               2017-09-07  166  					type = "active";
e740731dae9470 Willy Wolff               2017-09-07  167  				};
e740731dae9470 Willy Wolff               2017-09-07  168  				cpu1_crit0: cpu-crit-0 {
e740731dae9470 Willy Wolff               2017-09-07  169  					temperature = <120000>;
e740731dae9470 Willy Wolff               2017-09-07  170  					hysteresis = <0>;
e740731dae9470 Willy Wolff               2017-09-07  171  					type = "critical";
e740731dae9470 Willy Wolff               2017-09-07  172  				};
e740731dae9470 Willy Wolff               2017-09-07  173  				cpu1_alert3: cpu-alert-3 {
e740731dae9470 Willy Wolff               2017-09-07  174  					temperature = <70000>;
e740731dae9470 Willy Wolff               2017-09-07  175  					hysteresis = <10000>;
e740731dae9470 Willy Wolff               2017-09-07  176  					type = "passive";
e740731dae9470 Willy Wolff               2017-09-07  177  				};
e740731dae9470 Willy Wolff               2017-09-07  178  				cpu1_alert4: cpu-alert-4 {
e740731dae9470 Willy Wolff               2017-09-07  179  					temperature = <85000>;
e740731dae9470 Willy Wolff               2017-09-07  180  					hysteresis = <10000>;
e740731dae9470 Willy Wolff               2017-09-07  181  					type = "passive";
e740731dae9470 Willy Wolff               2017-09-07  182  				};
e740731dae9470 Willy Wolff               2017-09-07  183  			};
e740731dae9470 Willy Wolff               2017-09-07  184  			cooling-maps {
e740731dae9470 Willy Wolff               2017-09-07  185  				map0 {
e740731dae9470 Willy Wolff               2017-09-07  186  					trip = <&cpu1_alert0>;
e740731dae9470 Willy Wolff               2017-09-07  187  					cooling-device = <&fan0 0 1>;
e740731dae9470 Willy Wolff               2017-09-07  188  				};
e740731dae9470 Willy Wolff               2017-09-07  189  				map1 {
e740731dae9470 Willy Wolff               2017-09-07  190  					trip = <&cpu1_alert1>;
e740731dae9470 Willy Wolff               2017-09-07  191  					cooling-device = <&fan0 1 2>;
e740731dae9470 Willy Wolff               2017-09-07  192  				};
e740731dae9470 Willy Wolff               2017-09-07  193  				map2 {
e740731dae9470 Willy Wolff               2017-09-07  194  					trip = <&cpu1_alert2>;
e740731dae9470 Willy Wolff               2017-09-07  195  					cooling-device = <&fan0 2 3>;
e740731dae9470 Willy Wolff               2017-09-07  196  				};
e740731dae9470 Willy Wolff               2017-09-07  197  				map3 {
e740731dae9470 Willy Wolff               2017-09-07  198  					trip = <&cpu1_alert3>;
670734f5581023 Viresh Kumar              2018-11-16  199  					cooling-device = <&cpu0 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  200  							 <&cpu1 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  201  							 <&cpu2 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  202  							 <&cpu3 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  203  							 <&cpu4 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  204  							 <&cpu5 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  205  							 <&cpu6 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  206  							 <&cpu7 0 2>;
e740731dae9470 Willy Wolff               2017-09-07  207  				};
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  208  				cpu1_cooling_map4: map4 {
e740731dae9470 Willy Wolff               2017-09-07  209  					trip = <&cpu1_alert4>;
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  210  					cooling-device = <&cpu0 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  211  							 <&cpu1 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  212  							 <&cpu2 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  213  							 <&cpu3 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  214  							 <&cpu4 3 14>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  215  							 <&cpu5 3 14>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  216  							 <&cpu6 3 14>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  217  							 <&cpu7 3 14>;
e740731dae9470 Willy Wolff               2017-09-07  218  				};
e740731dae9470 Willy Wolff               2017-09-07  219  			};
e740731dae9470 Willy Wolff               2017-09-07  220  		};
e740731dae9470 Willy Wolff               2017-09-07  221  		cpu2_thermal: cpu2-thermal {
e740731dae9470 Willy Wolff               2017-09-07  222  			thermal-sensors = <&tmu_cpu2 0>;
e740731dae9470 Willy Wolff               2017-09-07  223  			polling-delay-passive = <250>;
e740731dae9470 Willy Wolff               2017-09-07  224  			polling-delay = <0>;
e740731dae9470 Willy Wolff               2017-09-07  225  			trips {
e740731dae9470 Willy Wolff               2017-09-07  226  				cpu2_alert0: cpu-alert-0 {
e740731dae9470 Willy Wolff               2017-09-07  227  					temperature = <50000>;
e740731dae9470 Willy Wolff               2017-09-07  228  					hysteresis = <5000>;
e740731dae9470 Willy Wolff               2017-09-07  229  					type = "active";
e740731dae9470 Willy Wolff               2017-09-07  230  				};
e740731dae9470 Willy Wolff               2017-09-07  231  				cpu2_alert1: cpu-alert-1 {
e740731dae9470 Willy Wolff               2017-09-07  232  					temperature = <60000>;
e740731dae9470 Willy Wolff               2017-09-07  233  					hysteresis = <5000>;
e740731dae9470 Willy Wolff               2017-09-07  234  					type = "active";
e740731dae9470 Willy Wolff               2017-09-07  235  				};
e740731dae9470 Willy Wolff               2017-09-07  236  				cpu2_alert2: cpu-alert-2 {
e740731dae9470 Willy Wolff               2017-09-07  237  					temperature = <70000>;
e740731dae9470 Willy Wolff               2017-09-07  238  					hysteresis = <5000>;
e740731dae9470 Willy Wolff               2017-09-07  239  					type = "active";
e740731dae9470 Willy Wolff               2017-09-07  240  				};
e740731dae9470 Willy Wolff               2017-09-07  241  				cpu2_crit0: cpu-crit-0 {
e740731dae9470 Willy Wolff               2017-09-07  242  					temperature = <120000>;
e740731dae9470 Willy Wolff               2017-09-07  243  					hysteresis = <0>;
e740731dae9470 Willy Wolff               2017-09-07  244  					type = "critical";
e740731dae9470 Willy Wolff               2017-09-07  245  				};
e740731dae9470 Willy Wolff               2017-09-07  246  				cpu2_alert3: cpu-alert-3 {
e740731dae9470 Willy Wolff               2017-09-07  247  					temperature = <70000>;
e740731dae9470 Willy Wolff               2017-09-07  248  					hysteresis = <10000>;
e740731dae9470 Willy Wolff               2017-09-07  249  					type = "passive";
e740731dae9470 Willy Wolff               2017-09-07  250  				};
e740731dae9470 Willy Wolff               2017-09-07  251  				cpu2_alert4: cpu-alert-4 {
e740731dae9470 Willy Wolff               2017-09-07  252  					temperature = <85000>;
e740731dae9470 Willy Wolff               2017-09-07  253  					hysteresis = <10000>;
e740731dae9470 Willy Wolff               2017-09-07  254  					type = "passive";
e740731dae9470 Willy Wolff               2017-09-07  255  				};
e740731dae9470 Willy Wolff               2017-09-07  256  			};
e740731dae9470 Willy Wolff               2017-09-07  257  			cooling-maps {
e740731dae9470 Willy Wolff               2017-09-07  258  				map0 {
e740731dae9470 Willy Wolff               2017-09-07  259  					trip = <&cpu2_alert0>;
e740731dae9470 Willy Wolff               2017-09-07  260  					cooling-device = <&fan0 0 1>;
e740731dae9470 Willy Wolff               2017-09-07  261  				};
e740731dae9470 Willy Wolff               2017-09-07  262  				map1 {
e740731dae9470 Willy Wolff               2017-09-07  263  					trip = <&cpu2_alert1>;
e740731dae9470 Willy Wolff               2017-09-07  264  					cooling-device = <&fan0 1 2>;
e740731dae9470 Willy Wolff               2017-09-07  265  				};
e740731dae9470 Willy Wolff               2017-09-07  266  				map2 {
e740731dae9470 Willy Wolff               2017-09-07  267  					trip = <&cpu2_alert2>;
e740731dae9470 Willy Wolff               2017-09-07  268  					cooling-device = <&fan0 2 3>;
e740731dae9470 Willy Wolff               2017-09-07  269  				};
e740731dae9470 Willy Wolff               2017-09-07  270  				map3 {
e740731dae9470 Willy Wolff               2017-09-07  271  					trip = <&cpu2_alert3>;
670734f5581023 Viresh Kumar              2018-11-16  272  					cooling-device = <&cpu0 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  273  							 <&cpu1 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  274  							 <&cpu2 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  275  							 <&cpu3 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  276  							 <&cpu4 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  277  							 <&cpu5 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  278  							 <&cpu6 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  279  							 <&cpu7 0 2>;
e740731dae9470 Willy Wolff               2017-09-07  280  				};
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  281  				cpu2_cooling_map4: map4 {
e740731dae9470 Willy Wolff               2017-09-07  282  					trip = <&cpu2_alert4>;
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  283  					cooling-device = <&cpu0 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  284  							 <&cpu1 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  285  							 <&cpu2 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  286  							 <&cpu3 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  287  							 <&cpu4 3 14>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  288  							 <&cpu5 3 14>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  289  							 <&cpu6 3 14>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  290  							 <&cpu7 3 14>;
e740731dae9470 Willy Wolff               2017-09-07  291  				};
e740731dae9470 Willy Wolff               2017-09-07  292  			};
e740731dae9470 Willy Wolff               2017-09-07  293  		};
e740731dae9470 Willy Wolff               2017-09-07  294  		cpu3_thermal: cpu3-thermal {
e740731dae9470 Willy Wolff               2017-09-07  295  			thermal-sensors = <&tmu_cpu3 0>;
e740731dae9470 Willy Wolff               2017-09-07  296  			polling-delay-passive = <250>;
e740731dae9470 Willy Wolff               2017-09-07  297  			polling-delay = <0>;
e740731dae9470 Willy Wolff               2017-09-07  298  			trips {
e740731dae9470 Willy Wolff               2017-09-07  299  				cpu3_alert0: cpu-alert-0 {
e740731dae9470 Willy Wolff               2017-09-07  300  					temperature = <50000>;
e740731dae9470 Willy Wolff               2017-09-07  301  					hysteresis = <5000>;
e740731dae9470 Willy Wolff               2017-09-07  302  					type = "active";
e740731dae9470 Willy Wolff               2017-09-07  303  				};
e740731dae9470 Willy Wolff               2017-09-07  304  				cpu3_alert1: cpu-alert-1 {
e740731dae9470 Willy Wolff               2017-09-07  305  					temperature = <60000>;
e740731dae9470 Willy Wolff               2017-09-07  306  					hysteresis = <5000>;
e740731dae9470 Willy Wolff               2017-09-07  307  					type = "active";
e740731dae9470 Willy Wolff               2017-09-07  308  				};
e740731dae9470 Willy Wolff               2017-09-07  309  				cpu3_alert2: cpu-alert-2 {
e740731dae9470 Willy Wolff               2017-09-07  310  					temperature = <70000>;
e740731dae9470 Willy Wolff               2017-09-07  311  					hysteresis = <5000>;
e740731dae9470 Willy Wolff               2017-09-07  312  					type = "active";
e740731dae9470 Willy Wolff               2017-09-07  313  				};
e740731dae9470 Willy Wolff               2017-09-07  314  				cpu3_crit0: cpu-crit-0 {
e740731dae9470 Willy Wolff               2017-09-07  315  					temperature = <120000>;
e740731dae9470 Willy Wolff               2017-09-07  316  					hysteresis = <0>;
e740731dae9470 Willy Wolff               2017-09-07  317  					type = "critical";
e740731dae9470 Willy Wolff               2017-09-07  318  				};
e740731dae9470 Willy Wolff               2017-09-07  319  				cpu3_alert3: cpu-alert-3 {
e740731dae9470 Willy Wolff               2017-09-07  320  					temperature = <70000>;
e740731dae9470 Willy Wolff               2017-09-07  321  					hysteresis = <10000>;
e740731dae9470 Willy Wolff               2017-09-07  322  					type = "passive";
e740731dae9470 Willy Wolff               2017-09-07  323  				};
e740731dae9470 Willy Wolff               2017-09-07  324  				cpu3_alert4: cpu-alert-4 {
e740731dae9470 Willy Wolff               2017-09-07  325  					temperature = <85000>;
e740731dae9470 Willy Wolff               2017-09-07  326  					hysteresis = <10000>;
e740731dae9470 Willy Wolff               2017-09-07  327  					type = "passive";
e740731dae9470 Willy Wolff               2017-09-07  328  				};
e740731dae9470 Willy Wolff               2017-09-07  329  			};
e740731dae9470 Willy Wolff               2017-09-07  330  			cooling-maps {
e740731dae9470 Willy Wolff               2017-09-07  331  				map0 {
e740731dae9470 Willy Wolff               2017-09-07  332  					trip = <&cpu3_alert0>;
e740731dae9470 Willy Wolff               2017-09-07  333  					cooling-device = <&fan0 0 1>;
e740731dae9470 Willy Wolff               2017-09-07  334  				};
e740731dae9470 Willy Wolff               2017-09-07  335  				map1 {
e740731dae9470 Willy Wolff               2017-09-07  336  					trip = <&cpu3_alert1>;
e740731dae9470 Willy Wolff               2017-09-07  337  					cooling-device = <&fan0 1 2>;
e740731dae9470 Willy Wolff               2017-09-07  338  				};
e740731dae9470 Willy Wolff               2017-09-07  339  				map2 {
e740731dae9470 Willy Wolff               2017-09-07  340  					trip = <&cpu3_alert2>;
e740731dae9470 Willy Wolff               2017-09-07  341  					cooling-device = <&fan0 2 3>;
e740731dae9470 Willy Wolff               2017-09-07  342  				};
e740731dae9470 Willy Wolff               2017-09-07  343  				map3 {
e740731dae9470 Willy Wolff               2017-09-07  344  					trip = <&cpu3_alert3>;
670734f5581023 Viresh Kumar              2018-11-16  345  					cooling-device = <&cpu0 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  346  							 <&cpu1 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  347  							 <&cpu2 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  348  							 <&cpu3 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  349  							 <&cpu4 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  350  							 <&cpu5 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  351  							 <&cpu6 0 2>,
670734f5581023 Viresh Kumar              2018-11-16  352  							 <&cpu7 0 2>;
e740731dae9470 Willy Wolff               2017-09-07  353  				};
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  354  				cpu3_cooling_map4: map4 {
e740731dae9470 Willy Wolff               2017-09-07  355  					trip = <&cpu3_alert4>;
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  356  					cooling-device = <&cpu0 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  357  							 <&cpu1 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  358  							 <&cpu2 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  359  							 <&cpu3 3 8>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  360  							 <&cpu4 3 14>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  361  							 <&cpu5 3 14>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  362  							 <&cpu6 3 14>,
eaffc4de16c66c Bartlomiej Zolnierkiewicz 2019-12-10  363  							 <&cpu7 3 14>;
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  364  				};
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  365  			};
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  366  		};
1c651356f482ff Marek Szyprowski          2020-01-21  367  		gpu_thermal: gpu-thermal {
1c651356f482ff Marek Szyprowski          2020-01-21  368  			thermal-sensors = <&tmu_gpu 0>;
1c651356f482ff Marek Szyprowski          2020-01-21  369  			polling-delay-passive = <250>;
1c651356f482ff Marek Szyprowski          2020-01-21  370  			polling-delay = <0>;
1c651356f482ff Marek Szyprowski          2020-01-21  371  			trips {
1c651356f482ff Marek Szyprowski          2020-01-21  372  				gpu_alert0: gpu-alert-0 {
1c651356f482ff Marek Szyprowski          2020-01-21  373  					temperature = <50000>;
1c651356f482ff Marek Szyprowski          2020-01-21  374  					hysteresis = <5000>;
1c651356f482ff Marek Szyprowski          2020-01-21  375  					type = "active";
1c651356f482ff Marek Szyprowski          2020-01-21  376  				};
1c651356f482ff Marek Szyprowski          2020-01-21  377  				gpu_alert1: gpu-alert-1 {
1c651356f482ff Marek Szyprowski          2020-01-21  378  					temperature = <60000>;
1c651356f482ff Marek Szyprowski          2020-01-21  379  					hysteresis = <5000>;
1c651356f482ff Marek Szyprowski          2020-01-21  380  					type = "active";
1c651356f482ff Marek Szyprowski          2020-01-21  381  				};
1c651356f482ff Marek Szyprowski          2020-01-21  382  				gpu_alert2: gpu-alert-2 {
1c651356f482ff Marek Szyprowski          2020-01-21  383  					temperature = <70000>;
1c651356f482ff Marek Szyprowski          2020-01-21  384  					hysteresis = <5000>;
1c651356f482ff Marek Szyprowski          2020-01-21  385  					type = "active";
1c651356f482ff Marek Szyprowski          2020-01-21  386  				};
1c651356f482ff Marek Szyprowski          2020-01-21  387  				gpu_crit0: gpu-crit-0 {
1c651356f482ff Marek Szyprowski          2020-01-21  388  					temperature = <120000>;
1c651356f482ff Marek Szyprowski          2020-01-21  389  					hysteresis = <0>;
1c651356f482ff Marek Szyprowski          2020-01-21  390  					type = "critical";
1c651356f482ff Marek Szyprowski          2020-01-21  391  				};
1c651356f482ff Marek Szyprowski          2020-01-21  392  				gpu_alert3: gpu-alert-3 {
1c651356f482ff Marek Szyprowski          2020-01-21  393  					temperature = <70000>;
1c651356f482ff Marek Szyprowski          2020-01-21  394  					hysteresis = <10000>;
1c651356f482ff Marek Szyprowski          2020-01-21  395  					type = "passive";
1c651356f482ff Marek Szyprowski          2020-01-21  396  				};
1c651356f482ff Marek Szyprowski          2020-01-21  397  				gpu_alert4: gpu-alert-4 {
1c651356f482ff Marek Szyprowski          2020-01-21  398  					temperature = <85000>;
1c651356f482ff Marek Szyprowski          2020-01-21  399  					hysteresis = <10000>;
1c651356f482ff Marek Szyprowski          2020-01-21  400  					type = "passive";
1c651356f482ff Marek Szyprowski          2020-01-21  401  				};
1c651356f482ff Marek Szyprowski          2020-01-21  402  			};
1c651356f482ff Marek Szyprowski          2020-01-21  403  			cooling-maps {
1c651356f482ff Marek Szyprowski          2020-01-21  404  				map0 {
1c651356f482ff Marek Szyprowski          2020-01-21  405  					trip = <&gpu_alert0>;
1c651356f482ff Marek Szyprowski          2020-01-21  406  					cooling-device = <&fan0 0 1>;
1c651356f482ff Marek Szyprowski          2020-01-21  407  				};
1c651356f482ff Marek Szyprowski          2020-01-21  408  				map1 {
1c651356f482ff Marek Szyprowski          2020-01-21  409  					trip = <&gpu_alert1>;
1c651356f482ff Marek Szyprowski          2020-01-21  410  					cooling-device = <&fan0 1 2>;
1c651356f482ff Marek Szyprowski          2020-01-21  411  				};
1c651356f482ff Marek Szyprowski          2020-01-21  412  				map2 {
1c651356f482ff Marek Szyprowski          2020-01-21  413  					trip = <&gpu_alert2>;
1c651356f482ff Marek Szyprowski          2020-01-21  414  					cooling-device = <&fan0 2 3>;
1c651356f482ff Marek Szyprowski          2020-01-21  415  				};
1c651356f482ff Marek Szyprowski          2020-01-21  416  				map3 {
1c651356f482ff Marek Szyprowski          2020-01-21  417  					trip = <&gpu_alert3>;
1c651356f482ff Marek Szyprowski          2020-01-21  418  					cooling-device = <&gpu 0 2>;
1c651356f482ff Marek Szyprowski          2020-01-21  419  				};
1c651356f482ff Marek Szyprowski          2020-01-21  420  				map4 {
1c651356f482ff Marek Szyprowski          2020-01-21  421  					trip = <&gpu_alert4>;
1c651356f482ff Marek Szyprowski          2020-01-21  422  					cooling-device = <&gpu 3 6>;
1c651356f482ff Marek Szyprowski          2020-01-21  423  				};
1c651356f482ff Marek Szyprowski          2020-01-21  424  			};
1c651356f482ff Marek Szyprowski          2020-01-21  425  		};
f4715dc7eb89e1 Krzysztof Kozlowski       2016-05-09  426  	};
3a7c01d75febd5 Krzysztof Kozlowski       2015-05-25  427  };
3a7c01d75febd5 Krzysztof Kozlowski       2015-05-25  428  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
