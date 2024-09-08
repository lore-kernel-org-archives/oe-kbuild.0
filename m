Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1071954670
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Sep 2024 09:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725789368; cv=none; b=AGK9Ax7v5a5RfLX0l2jyHx8wQFWDvbzlN4N5JoLWNHLJQ9xsQGYkL1WxiLitcPdsRuUq5zMy6ThAJHA2G03BwhxJzAgKhGX1nC56m5rK+0M4HfqX4YX+THtTJ2MrxnHVV5jpTCchgftAE2e1DifN4eZwbSiHn10/kqQLCgawtRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725789368; c=relaxed/simple;
	bh=ucnf5Ash6Rl5LJWQwJIB2izXrq+vOBQt20FC3U7hIoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LmHTf0xUUp/IlbgxBONGwkegEfD9jif4vRi+K4BwumSarOuoclJzY1NxZ75O97u6JstnNZ9XMcrb8f3OQRi5i2wS9+ld1u5/HFBIjzOpCbzXZfTg+1wj4zD7z3EYiY6rN2qWlRKFA3sXkBJxbN/2enE0AyqCWZ6Gf9pyO4r10oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RR320q7N; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RR320q7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725789366; x=1757325366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ucnf5Ash6Rl5LJWQwJIB2izXrq+vOBQt20FC3U7hIoo=;
  b=RR320q7NMlTMIFedk9u8aedc0sCwH30rcBUdVL8Tiuy9HDLuZFTzJW7R
   Tud+1ISgI7do5rhlg3xq3c18uQ0ktsaimXvTTFbd5HKl/urqynEyS+UvA
   xYysqwuy6pguTek+9zNV2eQIBfb3Gv/lTIAPROl0UaqbEFJayKkuCrZ8L
   S3sJr5i9tS8Bj5Nr97PyPFBtcI7moLuY+Wlr78ZWIMaOIJgLhA5oMnfEr
   wzkTeZgwXAEFfiL5gVLUEJaC1tZg+G2OG3LrGBxlr3xRCskLnserEIxmb
   AkpiYiY3Bb+rxC9Q6uJltUmZkggbLe8E8NYR/YR7+u1rMOLtFDcu6aYFO
   A==;
X-CSE-ConnectionGUID: ehVAWntaRRyDYg/gkSwjSw==
X-CSE-MsgGUID: Xo0dnbeyQtSVBGMZrJDK2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="49904873"
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="49904873"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2024 02:56:05 -0700
X-CSE-ConnectionGUID: XcPU21R8QGWTrpgbhg5LJw==
X-CSE-MsgGUID: 19P8PrYISE6b1ohfUABEhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,212,1719903600"; 
   d="scan'208";a="66179326"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Sep 2024 02:56:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snEeH-000DQD-2Q;
	Sun, 08 Sep 2024 09:56:01 +0000
Date: Sun, 8 Sep 2024 17:55:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hverkuil-media-tree:hdmi-dbg 13/25]
 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts:278.22-294.4: Warning
 (interrupt_provider): /soc/i2c@7e804000/pca9554@38: '#interrupt-cells'
 found, but node is not an interrupt provider
Message-ID: <202409081731.62f7Vwcu-lkp@intel.com>
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
TO: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git hdmi-dbg
head:   9535a1e414c095de7b7222b3e7e8fbf9bccf789a
commit: 78e065c6e2a57012bcdd1a41be1c8e16ac8d36ce [13/25] bcm2711-rpi-4-b.dts: adjust for HDMI debug shield
:::::: branch date: 4 days ago
:::::: commit date: 6 weeks ago
config: arm-defconfig (https://download.01.org/0day-ci/archive/20240908/202409081731.62f7Vwcu-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409081731.62f7Vwcu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409081731.62f7Vwcu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/broadcom/bcm283x.dtsi:64.6-502.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/broadcom/bcm2711.dtsi:418.21-433.4: Warning (unit_address_vs_reg): /emmc2bus: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/broadcom/bcm2711.dtsi:547.6-631.4: Warning (unit_address_vs_reg): /scb: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi:5.22-13.5: Warning (simple_bus_reg): /soc/firmware: missing or empty reg/ranges property
   arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi:15.16-19.5: Warning (simple_bus_reg): /soc/power: missing or empty reg/ranges property
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts:278.22-294.4: Warning (interrupt_provider): /soc/i2c@7e804000/pca9554@38: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-400.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
--
   arch/arm/boot/dts/broadcom/bcm283x.dtsi:64.6-502.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/broadcom/bcm2711.dtsi:418.21-433.4: Warning (unit_address_vs_reg): /emmc2bus: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/broadcom/bcm2711.dtsi:547.6-631.4: Warning (unit_address_vs_reg): /scb: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi:5.22-13.5: Warning (simple_bus_reg): /soc/firmware: missing or empty reg/ranges property
   arch/arm/boot/dts/broadcom/bcm2835-rpi.dtsi:15.16-19.5: Warning (simple_bus_reg): /soc/power: missing or empty reg/ranges property
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts:278.22-294.4: Warning (interrupt_provider): /soc/i2c@7e804000/pca9554@38: '#interrupt-cells' found, but node is not an interrupt provider
>> arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'

vim +278 arch/arm/boot/dts/broadcom/bcm2711-rpi-4-b.dts

78e065c6e2a570 Hans Verkuil 2020-05-27  257  
78e065c6e2a570 Hans Verkuil 2020-05-27  258  &i2c1 {
78e065c6e2a570 Hans Verkuil 2020-05-27  259  	ds1307@68 {
78e065c6e2a570 Hans Verkuil 2020-05-27  260  		compatible = "dallas,ds1307";
78e065c6e2a570 Hans Verkuil 2020-05-27  261  		reg = <0x68>;
78e065c6e2a570 Hans Verkuil 2020-05-27  262  		status = "okay";
78e065c6e2a570 Hans Verkuil 2020-05-27  263  	};
78e065c6e2a570 Hans Verkuil 2020-05-27  264  
78e065c6e2a570 Hans Verkuil 2020-05-27  265  	ds4424@10 {
78e065c6e2a570 Hans Verkuil 2020-05-27  266  		compatible = "maxim,ds4424";
78e065c6e2a570 Hans Verkuil 2020-05-27  267  		reg = <0x10>;
78e065c6e2a570 Hans Verkuil 2020-05-27  268  		status = "okay";
78e065c6e2a570 Hans Verkuil 2020-05-27  269  	};
78e065c6e2a570 Hans Verkuil 2020-05-27  270  
78e065c6e2a570 Hans Verkuil 2020-05-27  271  	ads7128@17 {
78e065c6e2a570 Hans Verkuil 2020-05-27  272  		compatible = "ti,ads7128";
78e065c6e2a570 Hans Verkuil 2020-05-27  273  		reg = <0x17>;
78e065c6e2a570 Hans Verkuil 2020-05-27  274  		vref-supply = <&vref_5v0_reg>;
78e065c6e2a570 Hans Verkuil 2020-05-27  275  		status = "okay";
78e065c6e2a570 Hans Verkuil 2020-05-27  276  	};
78e065c6e2a570 Hans Verkuil 2020-05-27  277  
78e065c6e2a570 Hans Verkuil 2020-05-27 @278  	pca9554: pca9554@38 {
78e065c6e2a570 Hans Verkuil 2020-05-27  279  		compatible = "nxp,pca9554";
78e065c6e2a570 Hans Verkuil 2020-05-27  280  		reg = <0x38>;
78e065c6e2a570 Hans Verkuil 2020-05-27  281  		gpio-controller;
78e065c6e2a570 Hans Verkuil 2020-05-27  282  		gpio-line-names =
78e065c6e2a570 Hans Verkuil 2020-05-27  283  			"SWITCH_5V",
78e065c6e2a570 Hans Verkuil 2020-05-27  284  			"SWITCH_HPD",
78e065c6e2a570 Hans Verkuil 2020-05-27  285  			"SWITCH_DDC",
78e065c6e2a570 Hans Verkuil 2020-05-27  286  			"SWITCH_CEC",
78e065c6e2a570 Hans Verkuil 2020-05-27  287  			"EN_SINK_HPD",
78e065c6e2a570 Hans Verkuil 2020-05-27  288  			"EN_SOURCE_5V",
78e065c6e2a570 Hans Verkuil 2020-05-27  289  			"ADC_ON",
78e065c6e2a570 Hans Verkuil 2020-05-27  290  			"EDID_EEPROM_SEL";
78e065c6e2a570 Hans Verkuil 2020-05-27  291  		#gpio-cells = <2>;
78e065c6e2a570 Hans Verkuil 2020-05-27  292  		#interrupt-cells = <2>;
78e065c6e2a570 Hans Verkuil 2020-05-27  293  		status = "okay";
78e065c6e2a570 Hans Verkuil 2020-05-27  294  	};
78e065c6e2a570 Hans Verkuil 2020-05-27  295  
78e065c6e2a570 Hans Verkuil 2020-05-27  296  	cat24c208: cat24c208@31 {
78e065c6e2a570 Hans Verkuil 2020-05-27  297  		compatible = "onnn,cat24c208";
78e065c6e2a570 Hans Verkuil 2020-05-27  298  		reg = <0x31>;
78e065c6e2a570 Hans Verkuil 2020-05-27  299  		status = "okay";
78e065c6e2a570 Hans Verkuil 2020-05-27  300  		input-connector = <&hdmi_in_node>;
78e065c6e2a570 Hans Verkuil 2020-05-27  301  	};
78e065c6e2a570 Hans Verkuil 2020-05-27  302  
78e065c6e2a570 Hans Verkuil 2020-05-27  303  	oled@3c {
78e065c6e2a570 Hans Verkuil 2020-05-27  304  		compatible = "solomon,ssd1306fb-i2c";
78e065c6e2a570 Hans Verkuil 2020-05-27  305  		reg = <0x3c>;
78e065c6e2a570 Hans Verkuil 2020-05-27  306  		solomon,height = <64>;
78e065c6e2a570 Hans Verkuil 2020-05-27  307  		solomon,width = <128>;
78e065c6e2a570 Hans Verkuil 2020-05-27  308  		solomon,page-offset = <0>;
78e065c6e2a570 Hans Verkuil 2020-05-27  309  		solomon,dclk-frq = <8>;
78e065c6e2a570 Hans Verkuil 2020-05-27  310  		solomon,com-invdir;
78e065c6e2a570 Hans Verkuil 2020-05-27  311  		status = "okay";
78e065c6e2a570 Hans Verkuil 2020-05-27  312  	};
78e065c6e2a570 Hans Verkuil 2020-05-27  313  
78e065c6e2a570 Hans Verkuil 2020-05-27  314  	pca9685@40 {
78e065c6e2a570 Hans Verkuil 2020-05-27  315  		compatible = "nxp,pca9685-pwm";
78e065c6e2a570 Hans Verkuil 2020-05-27  316  		#pwm-cells = <2>;
78e065c6e2a570 Hans Verkuil 2020-05-27  317  		reg = <0x40>;
78e065c6e2a570 Hans Verkuil 2020-05-27  318  		status = "okay";
78e065c6e2a570 Hans Verkuil 2020-05-27  319  	};
78e065c6e2a570 Hans Verkuil 2020-05-27  320  };
78e065c6e2a570 Hans Verkuil 2020-05-27  321  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
