Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975371EA90
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Aug 2024 14:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723127939; cv=none; b=swTXpWucw/e/ly03Cm2pLisBD2JYi9BVvrkA4L0fzw5OD0Ibh0uT3ShWMbGoLalXGqzpjcDj0kUEGkQmrdFTr3a1Apg/qeYxdpTMoLChFvykqyBzRfpYAHYgPBh2f7UTpK83JZFZl+6HigsOI5yWDf7C7KRj0Jlsh0DBE6yeyGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723127939; c=relaxed/simple;
	bh=5GV+wPNaLr6362mMgBk/CKYVU5pjD6yRfdoFJqtJdho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U+M8yEPwbCy2SoYDCCfTZaQxjMffx7+yjvGHgKhhRebfZbMUoFoZanNcvGKeWJJYEbbn7E3Ic6b6aEmyN9WPAjnfARON8+FrbQmk+whFFIERscmENy/84i3U1emkSuA+x4fz44qjokLmxSN2WA/Jbjcu/TFSE0AFrDMFkXwoDf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H/4B+EFn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H/4B+EFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723127937; x=1754663937;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5GV+wPNaLr6362mMgBk/CKYVU5pjD6yRfdoFJqtJdho=;
  b=H/4B+EFncw9QXizJDlXe/Ex/WdqtKYv9LYC3mdlqw+vZIJKtDIWvpUhk
   kVFhO6C1OKtknqodkKdUx28R49+JPDp8M7d5y9ZmprVbpt5WGaZ5m5Dga
   1kas0BGsQJ9sjxtuPJ4ASFOyuepFnL7R67OMK+BE7l9S1fMqgkO5eT1zs
   Pxuqz/rzbrt48KBH1wWHpqA+2z0GV01L2758m8bZz2cYuO/p69DmINAJ/
   bwOwTyyIOGpOqxJirsYqlWQwueB3a1rP04bJOiRLzQI8QASefC/jNxwKQ
   XEmSSfz/ssK6HHpMlbGP+YrgmNhuaeAOcDThDM1HNd+++4rP2zcahmwi3
   Q==;
X-CSE-ConnectionGUID: LtUpvYHPQ4mwRAvse2SZHw==
X-CSE-MsgGUID: PewVQUKsRiu6QVbMR4ap1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21425362"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="21425362"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 07:38:54 -0700
X-CSE-ConnectionGUID: LTjaZpJvRUaj/xnQGPLwDA==
X-CSE-MsgGUID: etcCnTvsQxyERFBgCt3ntA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="62180892"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2024 07:38:52 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc4Hx-0006F3-2y;
	Thu, 08 Aug 2024 14:38:49 +0000
Date: Thu, 8 Aug 2024 22:38:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 10/10] arm64: dts: exynos: Add initial support for
 Samsung Galaxy S8
Message-ID: <202408082209.b9lYcqXL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240807090858.356366-11-ivo.ivanov.ivanov1@gmail.com>
References: <20240807090858.356366-11-ivo.ivanov.ivanov1@gmail.com>
TO: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Sylwester Nawrocki <s.nawrocki@samsung.com>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Rob Herring <robh+dt@kernel.org>
CC: linux-samsung-soc@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Ivaylo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on pinctrl-samsung/for-next krzk-dt/for-next krzk-=
mem-ctrl/for-next linus/master v6.11-rc2 next-20240808]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bin=
dings-arm-cpus-Add-Samsung-Mongoose-M2/20240807-171253
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-=
next
patch link:    https://lore.kernel.org/r/20240807090858.356366-11-ivo.ivano=
v.ivanov1%40gmail.com
patch subject: [PATCH v2 10/10] arm64: dts: exynos: Add initial support for=
 Samsung Galaxy S8
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-051-20240807 (https://download.01.org/0day-ci/arch=
ive/20240808/202408082209.b9lYcqXL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20240808/202408082209.b9lYcqXL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408082209.b9lYcqXL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynos8895.dtsi:179.38-190.5: Warning (simple=
_bus_reg): /soc@0/interrupt-controller@10200000: simple-bus unit address fo=
rmat error, expected "10201000"
>> arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@164b0000: 'b=
t-hostwake', 'gpa0', 'gpa1', 'gpa2', 'gpa3', 'gpa4', 'key-power', 'key-vold=
own', 'key-volup', 'key-wink', 'pcie_wake', 'uart1-btsleep', 'uart1-bus', '=
uart1-default', 'wlan_host_wake' do not match any of the regexes: '^(initia=
l|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl=
-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.=
yaml#
>> arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@13e60000: 'g=
ph0', 'gph1', 'gph3' do not match any of the regexes: '^(initial|sleep)-sta=
te$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.=
yaml#
>> arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@14080000: 'g=
ph2' does not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-=
9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.=
yaml#
>> arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@11050000: 'g=
pi0', 'gpi1', 'ufs-refclk-out', 'ufs-rst-n' do not match any of the regexes=
: '^(initial|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$=
', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.=
yaml#
>> arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@11430000: 'b=
t-btwake', 'bt-en', 'cfg-wlanen', 'gpj0', 'gpj1', 'pcie0_clkreq', 'pcie0_cl=
kreq_output', 'pcie0_perst', 'pcie1_clkreq', 'pcie1_clkreq_output', 'pcie1_=
perst', 'sd2-bus-width1', 'sd2-bus-width4', 'sd2-clk', 'sd2-clk_fast_slew_r=
ate_1x', 'sd2-clk_fast_slew_rate_2x', 'sd2-clk_fast_slew_rate_3x', 'sd2-clk=
_fast_slew_rate_4x', 'sd2-cmd' do not match any of the regexes: '^(initial|=
sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[=
0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.=
yaml#
>> arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@15a30000: 'g=
pb2', 'hsi2c0-bus', 'speedy-bus' do not match any of the regexes: '^(initia=
l|sleep)-state$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl=
-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.=
yaml#
>> arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@104d0000: 'g=
pb1', 'gpd0', 'gpd1', 'gpd2', 'gpd3', 'gpe7', 'gpf1', 'hs-i2c14-bus', 'hsi2=
c10-bus', 'hsi2c11-bus', 'hsi2c12-bus', 'hsi2c5-bus', 'hsi2c6-bus', 'hsi2c7=
-bus', 'hsi2c8-bus', 'hsi2c9-bus', 'motor_mode', 'motor_rst_n', 'pwm-tout1'=
, 'spi2-bus', 'spi2-cs', 'spi2-cs-func', 'spi3-bus', 'spi3-cs', 'spi3-cs-fu=
nc', 'spi4-bus', 'spi4-cs', 'spi4-cs-func', 'spi5-bus', 'spi5-cs', 'spi5-cs=
-func', 'uart0-bus', 'uart2-bus-dual', 'uart2-bus-single', 'uart3-bus-dual'=
, 'uart3-bus-single', 'uart4-bus-dual', 'uart4-bus-single', 'uart5-bus-dual=
', 'uart5-bus-single' do not match any of the regexes: '^(initial|sleep)-st=
ate$', '^[a-z0-9-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.=
yaml#
   arch/arm64/boot/dts/exynos/exynos8895-dreamlte.dtb: pinctrl@10980000: 'd=
econ_f_te_off', 'decon_f_te_on', 'gpb0', 'gpc0', 'gpc1', 'gpc2', 'gpc3', 'g=
pe1', 'gpe2', 'gpe3', 'gpe4', 'gpe5', 'gpe6', 'gpf0', 'gpg0', 'gpk0', 'hrm-=
irq', 'hrm-irqidle', 'hrm-irqsleep', 'hsi2c1-bus', 'hsi2c1-bus-in', 'hsi2c1=
3-bus', 'hsi2c14-bus', 'hsi2c15-bus', 'hsi2c16-bus', 'hsi2c17-bus', 'hsi2c1=
8-bus', 'hsi2c19-bus', 'hsi2c2-bus', 'hsi2c2-bus-in', 'hsi2c20-bus', 'hsi2c=
21-bus', 'hsi2c22-bus', 'hsi2c23-bus', 'hsi2c24-bus', 'hsi2c25-bus', 'hsi2c=
26-bus', 'hsi2c27-bus', 'hsi2c27-bus-in', 'hsi2c28-bus', 'hsi2c28-bus-in', =
'hsi2c29-bus', 'hsi2c3-bus', 'hsi2c3-bus-in', 'hsi2c30-bus', 'hsi2c31-bus',=
 'hsi2c32-bus', 'hsi2c4-bus', 'hsi2c4-bus-in', 'spi0-bus', 'spi0-cs', 'spi0=
-cs-func', 'spi1-bus', 'spi1-cs', 'spi1-cs-func', 'spi10-bus', 'spi10-cs', =
'spi10-cs-func', 'spi11-bus', 'spi11-cs', 'spi11-cs-func', 'spi12-bus', 'sp=
i12-cs', 'spi12-cs-func', 'spi13-bus', 'spi13-cs', 'spi13-cs-func', 'spi14-=
bus', 'spi14-cs', 'spi14-cs-func', 'spi15-bus', 'spi15-cs', 'spi15-cs-func'=
, 'spi6-bus', 'spi6-cs', 'spi6-cs-func', 'spi7-bus', 'spi7-cs', 'spi7-cs-fu=
nc', 'spi8-bus', 'spi8-bus-suspend', 'spi8-cs', 'spi8-cs-func', 'spi8-cs-fu=
nc-suspend', 'spi9-bus', 'spi9-cs', 'spi9-cs-func', 'spi9-idle', 'uart10-bu=
s-dual', 'uart10-bus-single', 'uart11-bus-dual', 'uart11-bus-single', 'uart=
12-bus-dual', 'uart12-bus-single', 'uart13-bus-dual', 'uart13-bus-single', =
'uart14-bus-dual', 'uart14-bus-single', 'uart15-bus-dual', 'uart15-bus-sing=
le', 'uart6-bus-dual', 'uart6-bus-single', 'uart7-bus-dual', 'uart7-bus-sin=
gle', 'uart8-bus-dual', 'uart8-bus-single', 'uart9-bus-dual', 'uart9-bus-si=
ngle' do not match any of the regexes: '^(initial|sleep)-state$', '^[a-z0-9=
-]+-pins$', '^[a-z]+[0-9]*-gpio-bank$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/samsung,pinctrl.=
yaml#

vim +/10201000 +179 arch/arm64/boot/dts/exynos/exynos8895.dtsi

4605ca96f34171 Ivaylo Ivanov 2024-08-07    9 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07   10  / {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   11  	compatible =3D "samsung,exyn=
os8895";
4605ca96f34171 Ivaylo Ivanov 2024-08-07   12  	#address-cells =3D <2>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   13  	#size-cells =3D <1>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   14 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07   15  	interrupt-parent =3D <&gic>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   16 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07   17  	aliases {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   18  		pinctrl0 =3D &pinctrl_alive;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   19  		pinctrl1 =3D &pinctrl_abox;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   20  		pinctrl2 =3D &pinctrl_vts;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   21  		pinctrl3 =3D &pinctrl_fsys0;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   22  		pinctrl4 =3D &pinctrl_fsys1;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   23  		pinctrl5 =3D &pinctrl_busc;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   24  		pinctrl6 =3D &pinctrl_peric=
0;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   25  		pinctrl7 =3D &pinctrl_peric=
1;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   26  	};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   27 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07   28  	arm-a53-pmu {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   29  		compatible =3D "arm,cortex-=
a53-pmu";
4605ca96f34171 Ivaylo Ivanov 2024-08-07   30  		interrupts =3D <GIC_SPI 24 =
IRQ_TYPE_LEVEL_HIGH>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   31  			     <GIC_SPI 25 IRQ_TYPE_=
LEVEL_HIGH>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   32  			     <GIC_SPI 26 IRQ_TYPE_=
LEVEL_HIGH>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   33  			     <GIC_SPI 27 IRQ_TYPE_=
LEVEL_HIGH>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   34  			     <GIC_SPI 40 IRQ_TYPE_=
LEVEL_HIGH>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   35  			     <GIC_SPI 41 IRQ_TYPE_=
LEVEL_HIGH>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   36  			     <GIC_SPI 42 IRQ_TYPE_=
LEVEL_HIGH>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   37  			     <GIC_SPI 43 IRQ_TYPE_=
LEVEL_HIGH>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   38  		interrupt-affinity =3D <&cp=
u0>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   39  				     <&cpu1>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   40  				     <&cpu2>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   41  				     <&cpu3>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   42  				     <&cpu4>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   43  				     <&cpu5>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   44  				     <&cpu6>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07   45  				     <&cpu7>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   46  	};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   47 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07   48  	cpus {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   49  		#address-cells =3D <1>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   50  		#size-cells =3D <0>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   51 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07   52  		cpu-map {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   53  			cluster0 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   54  				core0 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   55  					cpu =3D <&cpu0>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   56  				};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   57  				core1 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   58  					cpu =3D <&cpu1>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   59  				};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   60  				core2 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   61  					cpu =3D <&cpu2>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   62  				};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   63  				core3 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   64  					cpu =3D <&cpu3>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   65  				};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   66  			};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   67 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07   68  			cluster1 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   69  				core0 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   70  					cpu =3D <&cpu4>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   71  				};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   72  				core1 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   73  					cpu =3D <&cpu5>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   74  				};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   75  				core2 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   76  					cpu =3D <&cpu6>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   77  				};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   78  				core3 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   79  					cpu =3D <&cpu7>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   80  				};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   81  			};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   82  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   83 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07   84  		cpu0: cpu@100 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   85  			device_type =3D "cpu";
4605ca96f34171 Ivaylo Ivanov 2024-08-07   86  			compatible =3D "arm,cortex=
-a53";
4605ca96f34171 Ivaylo Ivanov 2024-08-07   87  			reg =3D <0x100>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   88  			enable-method =3D "psci";
4605ca96f34171 Ivaylo Ivanov 2024-08-07   89  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   90 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07   91  		cpu1: cpu@101 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   92  			device_type =3D "cpu";
4605ca96f34171 Ivaylo Ivanov 2024-08-07   93  			compatible =3D "arm,cortex=
-a53";
4605ca96f34171 Ivaylo Ivanov 2024-08-07   94  			reg =3D <0x101>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07   95  			enable-method =3D "psci";
4605ca96f34171 Ivaylo Ivanov 2024-08-07   96  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07   97 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07   98  		cpu2: cpu@102 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07   99  			device_type =3D "cpu";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  100  			compatible =3D "arm,cortex=
-a53";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  101  			reg =3D <0x102>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  102  			enable-method =3D "psci";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  103  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  104 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  105  		cpu3: cpu@103 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  106  			device_type =3D "cpu";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  107  			compatible =3D "arm,cortex=
-a53";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  108  			reg =3D <0x103>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  109  			enable-method =3D "psci";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  110  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  111 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  112  		cpu4: cpu@0 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  113  			device_type =3D "cpu";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  114  			compatible =3D "samsung,mo=
ngoose-m2";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  115  			reg =3D <0x0>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  116  			enable-method =3D "psci";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  117  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  118 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  119  		cpu5: cpu@1 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  120  			device_type =3D "cpu";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  121  			compatible =3D "samsung,mo=
ngoose-m2";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  122  			reg =3D <0x1>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  123  			enable-method =3D "psci";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  124  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  125 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  126  		cpu6: cpu@2 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  127  			device_type =3D "cpu";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  128  			compatible =3D "samsung,mo=
ngoose-m2";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  129  			reg =3D <0x2>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  130  			enable-method =3D "psci";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  131  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  132 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  133  		cpu7: cpu@3 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  134  			device_type =3D "cpu";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  135  			compatible =3D "samsung,mo=
ngoose-m2";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  136  			reg =3D <0x3>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  137  			enable-method =3D "psci";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  138  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  139  	};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  140 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  141  	psci {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  142  		compatible =3D "arm,psci";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  143  		method =3D "smc";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  144  		cpu_suspend =3D <0xc4000001=
>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  145  		cpu_off =3D <0x84000002>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  146  		cpu_on =3D <0xc4000003>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  147  	};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  148 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  149  	timer {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  150  		compatible =3D "arm,armv8-t=
imer";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  151  		/* Hypervisor Virtual Timer=
 interrupt is not wired to GIC */
4605ca96f34171 Ivaylo Ivanov 2024-08-07  152  		interrupts =3D <GIC_PPI 13 =
(GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07  153  			     <GIC_PPI 14 (GIC_CPU_=
MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07  154  			     <GIC_PPI 11 (GIC_CPU_=
MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07  155  			     <GIC_PPI 10 (GIC_CPU_=
MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  156  		clock-frequency =3D <260000=
00>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  157  	};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  158 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  159  	fixed-rate-clocks {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  160  		oscclk: osc-clock {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  161  			compatible =3D "fixed-cloc=
k";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  162  			#clock-cells =3D <0>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  163  			clock-output-names =3D "os=
cclk";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  164  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  165  	};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  166 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  167  	soc: soc@0 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  168  		compatible =3D "simple-bus";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  169  		#address-cells =3D <1>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  170  		#size-cells =3D <1>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  171  		ranges =3D <0x0 0x0 0x0 0x2=
0000000>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  172 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  173  		chipid@10000000 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  174  			compatible =3D "samsung,ex=
ynos8895-chipid",
4605ca96f34171 Ivaylo Ivanov 2024-08-07  175  				     "samsung,exynos850-c=
hipid";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  176  			reg =3D <0x10000000 0x24>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  177  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  178 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07 @179  		gic: interrupt-controller@1=
0200000 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  180  			compatible =3D "arm,gic-40=
0";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  181  			#interrupt-cells =3D <3>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  182  			#address-cells =3D <0>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  183  			interrupt-controller;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  184  			reg =3D <0x10201000 0x1000=
>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07  185  			      <0x10202000 0x1000>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07  186  			      <0x10204000 0x2000>,
4605ca96f34171 Ivaylo Ivanov 2024-08-07  187  			      <0x10206000 0x2000>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  188  			interrupts =3D <GIC_PPI 9 =
(GIC_CPU_MASK_SIMPLE(8) |
4605ca96f34171 Ivaylo Ivanov 2024-08-07  189  						 IRQ_TYPE_LEVEL_HIGH)>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  190  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  191 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  192  		pinctrl_alive: pinctrl@164b=
0000 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  193  			compatible =3D "samsung,ex=
ynos8895-pinctrl";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  194  			reg =3D <0x164b0000 0x1000=
>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  195 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  196  			wakeup-interrupt-controlle=
r {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  197  				compatible =3D "samsung,e=
xynos8895-wakeup-eint",
4605ca96f34171 Ivaylo Ivanov 2024-08-07  198  					     "samsung,exynos7-wa=
keup-eint";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  199  				interrupt-parent =3D <&gi=
c>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  200  				interrupts =3D <GIC_SPI 1=
6 IRQ_TYPE_LEVEL_HIGH>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  201  			};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  202  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  203 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  204  		pinctrl_abox: pinctrl@13e60=
000 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  205  			compatible =3D "samsung,ex=
ynos8895-pinctrl";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  206  			reg =3D <0x13e60000 0x1000=
>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  207  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  208 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  209  		pinctrl_vts: pinctrl@140800=
00 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  210  			compatible =3D "samsung,ex=
ynos8895-pinctrl";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  211  			reg =3D <0x14080000 0x1000=
>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  212  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  213 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  214  		pinctrl_fsys0: pinctrl@1105=
0000 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  215  			compatible =3D "samsung,ex=
ynos8895-pinctrl";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  216  			reg =3D <0x11050000 0x1000=
>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  217  			interrupts =3D <GIC_SPI 33=
5 IRQ_TYPE_LEVEL_HIGH>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  218  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  219 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  220  		pinctrl_fsys1: pinctrl@1143=
0000 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  221  			compatible =3D "samsung,ex=
ynos8895-pinctrl";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  222  			reg =3D <0x11430000 0x1000=
>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  223  			interrupts =3D <GIC_SPI 34=
2 IRQ_TYPE_LEVEL_HIGH>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  224  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  225 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  226  		pinctrl_busc: pinctrl@15a30=
000 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  227  			compatible =3D "samsung,ex=
ynos8895-pinctrl";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  228  			reg =3D <0x15a30000 0x1000=
>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  229  			interrupts =3D <GIC_SPI 10=
3 IRQ_TYPE_LEVEL_HIGH>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  230  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  231 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  232  		pinctrl_peric0: pinctrl@104=
d0000 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  233  			compatible =3D "samsung,ex=
ynos8895-pinctrl";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  234  			reg =3D <0x104d0000 0x1000=
>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  235  			interrupts =3D <GIC_SPI 38=
6 IRQ_TYPE_LEVEL_HIGH>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  236  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  237 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  238  		pinctrl_peric1: pinctrl@109=
80000 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  239  			compatible =3D "samsung,ex=
ynos8895-pinctrl";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  240  			reg =3D <0x10980000 0x1000=
>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  241  			interrupts =3D <GIC_SPI 43=
0 IRQ_TYPE_LEVEL_HIGH>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  242  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  243 =20
4605ca96f34171 Ivaylo Ivanov 2024-08-07  244  		pmu_system_controller: syst=
em-controller@16480000 {
4605ca96f34171 Ivaylo Ivanov 2024-08-07  245  			compatible =3D "samsung,ex=
ynos8895-pmu",
4605ca96f34171 Ivaylo Ivanov 2024-08-07  246  				     "samsung,exynos7-pmu=
", "syscon";
4605ca96f34171 Ivaylo Ivanov 2024-08-07  247  			reg =3D <0x16480000 0x1000=
0>;
4605ca96f34171 Ivaylo Ivanov 2024-08-07  248  		};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  249  	};
4605ca96f34171 Ivaylo Ivanov 2024-08-07  250  };
4605ca96f34171 Ivaylo Ivanov 2024-08-07  251 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
