Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA619288B5
	for <oe-kbuild@lists.linux.dev>; Sun, 13 Oct 2024 11:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728817668; cv=none; b=Qxhe0UhzWmEfyjacYrhtyIcmU8W5kNKapZ9JuvMYGb/9pok5WhSC2MpcmOid2Iv8tUwJh4nrt+50ZG2kRGhzKAVY/vyalpKhVOzTcJduu2xg6XT6dVk0yoLgng/MTtR1D5dUaGKE/aU1rH82wAH/U9j1QjNFdSls2Dkmi1aFLDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728817668; c=relaxed/simple;
	bh=AMgaHT5swHHwDePUcCnfG0JTTf03GTI9OI14h/mTFxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ulo2qBC2odFtiZhKFGE8l6L7oxBWXq5yF6vG2nsjRYv8Qjb5DuehDa8zAuKKF8pdNPN2Mi8GY6+J0cb8Rd2ADvJ3e+nwXSkve/efyhyPZczXxA8Lw0rbIIbNA10/yE770DsTfU0vwzRF1Hnodyz5PbydjTn6TNyeddQH8vwQbqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxbSVE4c; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxbSVE4c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728817666; x=1760353666;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AMgaHT5swHHwDePUcCnfG0JTTf03GTI9OI14h/mTFxI=;
  b=MxbSVE4cfGILdpto+AtYyUq8tbwFS6V6J3QmkE17PkPWAZxuYpu7kSPP
   uCwgZoAiTXWW/uZpGN2tStJuulHyLcRMsQG6I22B4URPfyywMhEWaaRgQ
   dgKS8Dpl1u+dA4ClxvhBleaEpM0laOxbvAaD08oZKscug96qPE1kFexTN
   Q7VVIdDGE1jEFpglJjxsTk78NPT4D7HFEo6dUyNfKzMw8kVCr8ZZ+5QUV
   BBUP2o5zNwHCmdjMLUkNT+tvDHiYBkvnMbyFycNTUj/m7rR4kvac8gKA0
   N3sSYMbJ1eAy1UmaeGLp5TAh0CMRGsUiejMPYZ6K9lQbhWM0addKp231/
   w==;
X-CSE-ConnectionGUID: oA0M5o0qSCiS/1iy06l+uw==
X-CSE-MsgGUID: PRawqUkvQim7evjOLUnVAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="38729802"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="38729802"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 04:07:45 -0700
X-CSE-ConnectionGUID: V2iycZjwQDW9Zc4bKlt+kA==
X-CSE-MsgGUID: yxd3RDDnQIGLSTCVzysQsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="114767802"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Oct 2024 04:07:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szwRq-000EJT-0G;
	Sun, 13 Oct 2024 11:07:42 +0000
Date: Sun, 13 Oct 2024 19:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android11-5.4 8842/30000]
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:671.28-673.7: Warning
 (unit_address_vs_reg): /soc/i2c@ffd72000/adv7533@39/ports/port@0/endpoint@0:
 node has a unit name, but no reg property
Message-ID: <202410131820.1lgBNo5d-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   171355878e09938c06396498f584662e3eddcdbc
commit: 1d65a4b7a6b467a77712051466b33ba4a1c0cc8e [8842/30000] ANDROID: dts: hi3660: Fix duplicate adv7533 nodes
:::::: branch date: 3 days ago
:::::: commit date: 4 years, 1 month ago
config: arm64-randconfig-001-20241013 (https://download.01.org/0day-ci/archive/20241013/202410131820.1lgBNo5d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131820.1lgBNo5d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410131820.1lgBNo5d-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:671.28-673.7: Warning (unit_address_vs_reg): /soc/i2c@ffd72000/adv7533@39/ports/port@0/endpoint@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1136.30-1140.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1142.27-1146.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@1: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:52.34-57.5: Warning (unit_address_vs_reg): /reserved-memory/fastboot-cma-mem: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:59.20-62.5: Warning (unit_address_vs_reg): /reserved-memory/uefi-reboot-mode: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:64.8-67.5: Warning (unit_address_vs_reg): /reserved-memory/bl31: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:78.13-83.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:253.19-262.4: Warning (unit_address_vs_reg): /hi3660_i2s: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:345.31-349.5: Warning (simple_bus_reg): /soc/crg_rst_controller: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:376.10-381.5: Warning (simple_bus_reg): /soc/reboot: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:390.20-394.5: Warning (simple_bus_reg): /soc/reset: missing or empty reg/ranges property

vim +671 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts

5f8a3b77a7cd4e Zhangfei Gao    2017-06-15  607  
5f8a3b77a7cd4e Zhangfei Gao    2017-06-15  608  &i2c1 {
5f8a3b77a7cd4e Zhangfei Gao    2017-06-15  609  	status = "okay";
5f8a3b77a7cd4e Zhangfei Gao    2017-06-15  610  
1794dc2e499205 Yu Chen         2019-04-20  611  	rt1711h: rt1711h@4e {
1794dc2e499205 Yu Chen         2019-04-20  612  		compatible = "richtek,rt1711h";
1794dc2e499205 Yu Chen         2019-04-20  613  		reg = <0x4e>;
1794dc2e499205 Yu Chen         2019-04-20  614  		status = "ok";
1794dc2e499205 Yu Chen         2019-04-20  615  		interrupt-parent = <&gpio27>;
1794dc2e499205 Yu Chen         2019-04-20  616  		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
1794dc2e499205 Yu Chen         2019-04-20  617  		pinctrl-names = "default";
1794dc2e499205 Yu Chen         2019-04-20  618  		pinctrl-0 = <&usb_cfg_func>;
1794dc2e499205 Yu Chen         2019-04-20  619  
1794dc2e499205 Yu Chen         2019-04-20  620  		usb_con: connector {
1794dc2e499205 Yu Chen         2019-04-20  621  			compatible = "usb-c-connector";
1794dc2e499205 Yu Chen         2019-04-20  622  			label = "USB-C";
1794dc2e499205 Yu Chen         2019-04-20  623  			data-role = "dual";
1794dc2e499205 Yu Chen         2019-04-20  624  			power-role = "dual";
1794dc2e499205 Yu Chen         2019-04-20  625  			try-power-role = "sink";
1794dc2e499205 Yu Chen         2019-04-20  626  			source-pdos = <PDO_FIXED(5000, 500, PDO_FIXED_USB_COMM)>;
1794dc2e499205 Yu Chen         2019-04-20  627  			sink-pdos = <PDO_FIXED(5000, 500, PDO_FIXED_USB_COMM)
1794dc2e499205 Yu Chen         2019-04-20  628  				PDO_VAR(5000, 5000, 1000)>;
1794dc2e499205 Yu Chen         2019-04-20  629  			op-sink-microwatt = <10000000>;
1794dc2e499205 Yu Chen         2019-04-20  630  
1794dc2e499205 Yu Chen         2019-04-20  631  			ports {
1794dc2e499205 Yu Chen         2019-04-20  632  				#address-cells = <1>;
1794dc2e499205 Yu Chen         2019-04-20  633  				#size-cells = <0>;
1794dc2e499205 Yu Chen         2019-04-20  634  				port@1 {
1794dc2e499205 Yu Chen         2019-04-20  635  					reg = <1>;
1794dc2e499205 Yu Chen         2019-04-20  636  					usb_con_ss: endpoint {
1794dc2e499205 Yu Chen         2019-04-20  637  						remote-endpoint = <&dwc3_ss>;
1794dc2e499205 Yu Chen         2019-04-20  638  					};
1794dc2e499205 Yu Chen         2019-04-20  639  				};
1794dc2e499205 Yu Chen         2019-04-20  640  			};
1794dc2e499205 Yu Chen         2019-04-20  641  		};
1794dc2e499205 Yu Chen         2019-04-20  642  		port {
1794dc2e499205 Yu Chen         2019-04-20  643  			#address-cells = <1>;
1794dc2e499205 Yu Chen         2019-04-20  644  			#size-cells = <0>;
1794dc2e499205 Yu Chen         2019-04-20  645  
1794dc2e499205 Yu Chen         2019-04-20  646  			rt1711h_ep: endpoint@0 {
1794dc2e499205 Yu Chen         2019-04-20  647  				reg = <0>;
1794dc2e499205 Yu Chen         2019-04-20  648  				remote-endpoint = <&hikey_usb_ep1>;
1794dc2e499205 Yu Chen         2019-04-20  649  			};
1794dc2e499205 Yu Chen         2019-04-20  650  		};
1794dc2e499205 Yu Chen         2019-04-20  651  	};
1794dc2e499205 Yu Chen         2019-04-20  652  
5f8a3b77a7cd4e Zhangfei Gao    2017-06-15  653  	adv7533: adv7533@39 {
5f8a3b77a7cd4e Zhangfei Gao    2017-06-15  654  		status = "ok";
5f8a3b77a7cd4e Zhangfei Gao    2017-06-15  655  		compatible = "adi,adv7533";
5f8a3b77a7cd4e Zhangfei Gao    2017-06-15  656  		reg = <0x39>;
1d65a4b7a6b467 John Stultz     2020-08-25  657  		v1p2-supply = <&ldo3>;
1d65a4b7a6b467 John Stultz     2020-08-25  658  		vdd-supply = <&ldo3>;
1d65a4b7a6b467 John Stultz     2020-08-25  659  		interrupt-parent = <&gpio1>;
1d65a4b7a6b467 John Stultz     2020-08-25  660  		interrupts = <1 2>;
1d65a4b7a6b467 John Stultz     2020-08-25  661  		pd-gpio = <&gpio5 1 0>;
1d65a4b7a6b467 John Stultz     2020-08-25  662  		sel-gpio = <&gpio2 4 0>;
274f4e9c575ab6 Ricardo Cañuelo 2020-06-01  663  		adi,dsi-lanes = <4>;
1d65a4b7a6b467 John Stultz     2020-08-25  664  		adi,disable-timing-generator;
1d65a4b7a6b467 John Stultz     2020-08-25  665  		#sound-dai-cells = <0>;
274f4e9c575ab6 Ricardo Cañuelo 2020-06-01  666  		ports {
274f4e9c575ab6 Ricardo Cañuelo 2020-06-01  667  			#address-cells = <1>;
274f4e9c575ab6 Ricardo Cañuelo 2020-06-01  668  			#size-cells = <0>;
274f4e9c575ab6 Ricardo Cañuelo 2020-06-01  669  			port@0 {
274f4e9c575ab6 Ricardo Cañuelo 2020-06-01  670  				reg = <0>;
1d65a4b7a6b467 John Stultz     2020-08-25 @671  				adv7533_in: endpoint@0 {
1d65a4b7a6b467 John Stultz     2020-08-25  672  					remote-endpoint = <&dsi_out0>;
1d65a4b7a6b467 John Stultz     2020-08-25  673  				};
274f4e9c575ab6 Ricardo Cañuelo 2020-06-01  674  			};
274f4e9c575ab6 Ricardo Cañuelo 2020-06-01  675  			port@1 {
274f4e9c575ab6 Ricardo Cañuelo 2020-06-01  676  				reg = <1>;
274f4e9c575ab6 Ricardo Cañuelo 2020-06-01  677  			};
274f4e9c575ab6 Ricardo Cañuelo 2020-06-01  678  		};
5f8a3b77a7cd4e Zhangfei Gao    2017-06-15  679  	};
08e75f387281b1 Youlin Wang     2019-02-28  680  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
