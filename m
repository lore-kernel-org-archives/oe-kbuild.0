Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3986088F
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Sep 2024 13:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725717468; cv=none; b=Kt6k9CCLuCBRdwcb6j7f9AYDFVwO65vTrZaOnFmB9GacFqhofNW3VbnM7bFMBtJhgrWtOmQTKt6yMfy0txusQsMkuJXA9tUGr9tYKV/l3JYomfWcGn9qOB43EaO0c8bYxfUksYbYFydQfosFCq46N12h8pSuwdf8tZaFEJ0WqVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725717468; c=relaxed/simple;
	bh=CW+DjKfKewUbZWPFcT6GoyprPbIJCqlf9alZZbz0i0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S3tczKqo0LeIE7Ouw65g6UH4bJI0e6LI8PkMHeqWjOrvoZpsymoQM1b0H5PWwl+bycKLOFAKGmg8pwPVUrzvu6IJLH7jjI5N/wer1Zcqt1kuHVPleta9n6zwnLHNfHgb5k0OGFFCROA7LiliCkkgt5Udd3WSMgc9zVZ1tNpNTao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q2jma9su; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q2jma9su"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725717466; x=1757253466;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CW+DjKfKewUbZWPFcT6GoyprPbIJCqlf9alZZbz0i0k=;
  b=Q2jma9sua76v0NVaRinkUWko6U8psnMzS1i4uaU+trP6gCWEuqV51dSx
   F5Dj6BGyBJYcjxCBAolACf05DDlVngYRkw6K8ubug3wyL3OlSb7hsUTwX
   gRy+je7u3OSk7dDhiEiWOSyvui/K1Esn79MvLhh/cPSO1kJ1lTahUIXHC
   d5ZkmaV4nDWs3waMa0ZPBjXQ6y8FZEdQP3Rjuc2iWrEKXJ2WX1MOKEwCC
   KWSGhSsaLJ/xnqjbnQhFuwwX4tJ1/eX1LzOa44Xs6vCi10zx9+iZMIDK+
   Pcjk70mPdTckYZYFpqO+X5v/BgtXHTDEfSYwYpUvtInegFMWmZqVLsnNT
   Q==;
X-CSE-ConnectionGUID: /6XpMKx5RiS0gfCIKZ3l/w==
X-CSE-MsgGUID: 6nfXJfG7Sg+k6L9UhXTXZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="41973933"
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="41973933"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 06:57:45 -0700
X-CSE-ConnectionGUID: rV6oupoiTcS4LLsN41D5Qw==
X-CSE-MsgGUID: gJ1u/V1qQz6fAQC06TFI5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,210,1719903600"; 
   d="scan'208";a="66440483"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Sep 2024 06:57:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smvwc-000Cbz-26;
	Sat, 07 Sep 2024 13:57:42 +0000
Date: Sat, 7 Sep 2024 21:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.6 86/93]
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:456.11-465.7: Warning
 (graph_child_address):
 /soc/i2c@1100f000/dp-bridge@5c/switches/switch@0/ports: graph node has
 single child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202409072102.a5nGTDvx-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   9160bf23e2a5e493e48977aaf614963966e2784f
commit: 8d1afcec79f28ed381a4187e49c22a15f62f25a7 [86/93] CHROMIUM: arm64: dts: mt8186-corsola: Enable external display
:::::: branch date: 22 hours ago
:::::: commit date: 25 hours ago
config: arm64-randconfig-003-20240907 (https://download.01.org/0day-ci/archive/20240907/202409072102.a5nGTDvx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240907/202409072102.a5nGTDvx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409072102.a5nGTDvx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:456.11-465.7: Warning (graph_child_address): /soc/i2c@1100f000/dp-bridge@5c/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:473.11-482.7: Warning (graph_child_address): /soc/i2c@1100f000/dp-bridge@5c/switches/switch@1/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +456 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi

55a526935aeae0 Chen-Yu Tsai 2024-01-26  409  
55a526935aeae0 Chen-Yu Tsai 2024-01-26  410  &i2c3 {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  411  	pinctrl-names = "default";
55a526935aeae0 Chen-Yu Tsai 2024-01-26  412  	pinctrl-0 = <&i2c3_pins>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  413  	clock-frequency = <100000>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  414  	status = "okay";
55a526935aeae0 Chen-Yu Tsai 2024-01-26  415  
55a526935aeae0 Chen-Yu Tsai 2024-01-26  416  	it6505dptx: dp-bridge@5c {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  417  		compatible = "ite,it6505";
55a526935aeae0 Chen-Yu Tsai 2024-01-26  418  		reg = <0x5c>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  419  		interrupts-extended = <&pio 8 IRQ_TYPE_LEVEL_LOW>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  420  		pinctrl-names = "default";
55a526935aeae0 Chen-Yu Tsai 2024-01-26  421  		pinctrl-0 = <&it6505_pins>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  422  		#sound-dai-cells = <0>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  423  		ovdd-supply = <&mt6366_vsim2_reg>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  424  		pwr18-supply = <&pp1800_dpbrdg_dx>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  425  		reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  426  
55a526935aeae0 Chen-Yu Tsai 2024-01-26  427  		ports {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  428  			#address-cells = <1>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  429  			#size-cells = <0>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  430  
55a526935aeae0 Chen-Yu Tsai 2024-01-26  431  			port@0 {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  432  				reg = <0>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  433  
55a526935aeae0 Chen-Yu Tsai 2024-01-26  434  				it6505_in: endpoint {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  435  					link-frequencies = /bits/ 64 <150000000>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  436  					remote-endpoint = <&dpi_out>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  437  				};
55a526935aeae0 Chen-Yu Tsai 2024-01-26  438  			};
55a526935aeae0 Chen-Yu Tsai 2024-01-26  439  
55a526935aeae0 Chen-Yu Tsai 2024-01-26  440  			port@1 {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  441  				reg = <1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  442  				it6505_out: endpoint {
8d1afcec79f28e Pin-yen Lin  2024-08-27  443  					data-lanes = <0 1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  444  				};
8d1afcec79f28e Pin-yen Lin  2024-08-27  445  			};
8d1afcec79f28e Pin-yen Lin  2024-08-27  446  		};
8d1afcec79f28e Pin-yen Lin  2024-08-27  447  
8d1afcec79f28e Pin-yen Lin  2024-08-27  448  		switches {
8d1afcec79f28e Pin-yen Lin  2024-08-27  449  			#address-cells = <1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  450  			#size-cells = <0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  451  			switch@0 {
8d1afcec79f28e Pin-yen Lin  2024-08-27  452  				compatible = "typec-switch";
8d1afcec79f28e Pin-yen Lin  2024-08-27  453  				reg = <0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  454  				mode-switch;
8d1afcec79f28e Pin-yen Lin  2024-08-27  455  
8d1afcec79f28e Pin-yen Lin  2024-08-27 @456  				ports {
8d1afcec79f28e Pin-yen Lin  2024-08-27  457  					#address-cells = <1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  458  					#size-cells = <0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  459  					port@0 {
8d1afcec79f28e Pin-yen Lin  2024-08-27  460  						reg = <0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  461  						ite_typec0: endpoint {
8d1afcec79f28e Pin-yen Lin  2024-08-27  462  							remote-endpoint = <&typec_port0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  463  						};
8d1afcec79f28e Pin-yen Lin  2024-08-27  464  					};
8d1afcec79f28e Pin-yen Lin  2024-08-27  465  				};
8d1afcec79f28e Pin-yen Lin  2024-08-27  466  			};
8d1afcec79f28e Pin-yen Lin  2024-08-27  467  
8d1afcec79f28e Pin-yen Lin  2024-08-27  468  			switch@1 {
8d1afcec79f28e Pin-yen Lin  2024-08-27  469  				compatible = "typec-switch";
8d1afcec79f28e Pin-yen Lin  2024-08-27  470  				reg = <1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  471  				mode-switch;
8d1afcec79f28e Pin-yen Lin  2024-08-27  472  
8d1afcec79f28e Pin-yen Lin  2024-08-27  473  				ports {
8d1afcec79f28e Pin-yen Lin  2024-08-27  474  					#address-cells = <1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  475  					#size-cells = <0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  476  					port@0 {
8d1afcec79f28e Pin-yen Lin  2024-08-27  477  						reg = <0>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  478  						ite_typec1: endpoint {
8d1afcec79f28e Pin-yen Lin  2024-08-27  479  							remote-endpoint = <&typec_port1>;
8d1afcec79f28e Pin-yen Lin  2024-08-27  480  						};
8d1afcec79f28e Pin-yen Lin  2024-08-27  481  					};
8d1afcec79f28e Pin-yen Lin  2024-08-27  482  				};
55a526935aeae0 Chen-Yu Tsai 2024-01-26  483  			};
55a526935aeae0 Chen-Yu Tsai 2024-01-26  484  		};
55a526935aeae0 Chen-Yu Tsai 2024-01-26  485  	};
55a526935aeae0 Chen-Yu Tsai 2024-01-26  486  };
55a526935aeae0 Chen-Yu Tsai 2024-01-26  487  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
