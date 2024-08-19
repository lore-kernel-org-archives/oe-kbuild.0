Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7BD5C613
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Aug 2024 23:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724110270; cv=none; b=e8l9a8zqGwdxiTqBU/sx+4wboqMRQoMF0btaJ18XNYmNJ2yphD4fEc6wFcmLCJsUu3Vuod2pcy4MyTKsjjr6O5FH/wbdyQ7jzmVCKGSnwzxtCMWWZMeRv/jK8KuVBB+y3R+A7M0WiyT3c8AUiTw84dsszsvRLAyAhtl2EvSdAcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724110270; c=relaxed/simple;
	bh=mKFInIInvJUhP2OCyaEEaD8vYwWXTE8pL8/BWH0G+Zc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJGfgbeW+9/en0ADECgIz8lG1AI5LFxrARn+X2Ip3VLdjuU5J8Zc9h1F3FxbOZK325xzqvsO2tmkswO/EAvJRV+5MJ3LV3H+xo39VFO4EvjWfhXh3/hAhPgxCoUgzCYiVdh+VpZrHvM4b23+Yya2vPl8RGZ8q6uDKvDXyxHMgVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YiJLpobP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YiJLpobP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724110269; x=1755646269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mKFInIInvJUhP2OCyaEEaD8vYwWXTE8pL8/BWH0G+Zc=;
  b=YiJLpobPgL/khvN6K3yyT+CgZHAtTy8EYB5lKJc5ZVUbTnWNmSPZ5f3b
   VSwAGUj5AVnCv92m2Rg9w3LvFwceq8M+a6BR0asn0luaP+jIBlM+6QiuO
   d3vM4WVpRGK9A5LON2QbbNb88FYmA1vipHm5qLq2B3wcYCDdmDfTgie+q
   kvdyYrANGKoh15gH2tItMii3MutE6jPtKP/Uj2NijOpuIR0QMnFBf/gBY
   Fu4OHfT17eQ/9196pweRSd4okc/QFmXlH6vWti15XNfH8Gb0Y8dV6gH59
   xVLKPblgLc1t8UkEj3AK5zglfRufvikOqFb5Lv/7Y4k1rghh5fNqTj46J
   Q==;
X-CSE-ConnectionGUID: wlGRxCkxRi+o8UxKxV9WwA==
X-CSE-MsgGUID: F4PPrVjvQcWxM/jTvVvV9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22560195"
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="22560195"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 16:31:08 -0700
X-CSE-ConnectionGUID: ZXPeuUgPQbmDiYjlY8z9xA==
X-CSE-MsgGUID: vKvQEWiLQXmIKLdxmOY8LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,160,1719903600"; 
   d="scan'208";a="91292701"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Aug 2024 16:31:07 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgBq5-0009Wq-0G;
	Mon, 19 Aug 2024 23:31:05 +0000
Date: Tue, 20 Aug 2024 07:30:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RESEND PATCH v2 2/2] arm64: dts: mediatek: mt8183-pumpkin: add
 HDMI support
Message-ID: <202408200703.MYO1s3Ne-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:138.27-169.4: ERROR (phandle_references): /soc/i2c@11005000/hdmitx@4c: Reference to non-existent node or label "mt6358_vcn33_wifi_reg""
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240819120735.1508789-2-treapking@chromium.org>
References: <20240819120735.1508789-2-treapking@chromium.org>
TO: "Pin-yen Lin" <treapking@chromium.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: devicetree@vger.kernel.org
CC: Fabien Parent <fparent@baylibre.com>
CC: "Pin-yen Lin" <treapking@chromium.org>

Hi Pin-yen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next linus/master v6.11-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pin-yen-Lin/arm64-dts-mediatek-mt8183-pumpkin-add-HDMI-support/20240819-201052
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20240819120735.1508789-2-treapking%40chromium.org
patch subject: [RESEND PATCH v2 2/2] arm64: dts: mediatek: mt8183-pumpkin: add HDMI support
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-001-20240820 (https://download.01.org/0day-ci/archive/20240820/202408200703.MYO1s3Ne-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200703.MYO1s3Ne-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408200703.MYO1s3Ne-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts:138.27-169.4: ERROR (phandle_references): /soc/i2c@11005000/hdmitx@4c: Reference to non-existent node or label "mt6358_vcn33_wifi_reg"

vim +/mt6358_vcn33_wifi_reg +138 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts

19b6403f1e2a6c Fabien Parent 2021-02-17  129  
19b6403f1e2a6c Fabien Parent 2021-02-17  130  &i2c6 {
19b6403f1e2a6c Fabien Parent 2021-02-17  131  	pinctrl-names = "default";
19b6403f1e2a6c Fabien Parent 2021-02-17  132  	pinctrl-0 = <&i2c6_pins>;
19b6403f1e2a6c Fabien Parent 2021-02-17  133  	status = "okay";
19b6403f1e2a6c Fabien Parent 2021-02-17  134  	clock-frequency = <100000>;
7ce117785043b0 Fabien Parent 2024-08-19  135  	#address-cells = <1>;
7ce117785043b0 Fabien Parent 2024-08-19  136  	#size-cells = <0>;
7ce117785043b0 Fabien Parent 2024-08-19  137  
7ce117785043b0 Fabien Parent 2024-08-19 @138  	it66121hdmitx: hdmitx@4c {
7ce117785043b0 Fabien Parent 2024-08-19  139  		compatible = "ite,it66121";
7ce117785043b0 Fabien Parent 2024-08-19  140  		pinctrl-names = "default";
7ce117785043b0 Fabien Parent 2024-08-19  141  		pinctrl-0 = <&ite_pins>;
7ce117785043b0 Fabien Parent 2024-08-19  142  		vcn33-supply = <&mt6358_vcn33_wifi_reg>;
7ce117785043b0 Fabien Parent 2024-08-19  143  		vcn18-supply = <&mt6358_vcn18_reg>;
7ce117785043b0 Fabien Parent 2024-08-19  144  		vrf12-supply = <&mt6358_vrf12_reg>;
7ce117785043b0 Fabien Parent 2024-08-19  145  		reset-gpios = <&pio 160 GPIO_ACTIVE_LOW>;
7ce117785043b0 Fabien Parent 2024-08-19  146  		interrupt-parent = <&pio>;
7ce117785043b0 Fabien Parent 2024-08-19  147  		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
7ce117785043b0 Fabien Parent 2024-08-19  148  		reg = <0x4c>;
7ce117785043b0 Fabien Parent 2024-08-19  149  
7ce117785043b0 Fabien Parent 2024-08-19  150  		ports {
7ce117785043b0 Fabien Parent 2024-08-19  151  			#address-cells = <1>;
7ce117785043b0 Fabien Parent 2024-08-19  152  			#size-cells = <0>;
7ce117785043b0 Fabien Parent 2024-08-19  153  
7ce117785043b0 Fabien Parent 2024-08-19  154  			port@0 {
7ce117785043b0 Fabien Parent 2024-08-19  155  				reg = <0>;
7ce117785043b0 Fabien Parent 2024-08-19  156  				it66121_in: endpoint {
7ce117785043b0 Fabien Parent 2024-08-19  157  					bus-width = <12>;
7ce117785043b0 Fabien Parent 2024-08-19  158  					remote-endpoint = <&dpi_out>;
7ce117785043b0 Fabien Parent 2024-08-19  159  				};
7ce117785043b0 Fabien Parent 2024-08-19  160  			};
7ce117785043b0 Fabien Parent 2024-08-19  161  
7ce117785043b0 Fabien Parent 2024-08-19  162  			port@1 {
7ce117785043b0 Fabien Parent 2024-08-19  163  				reg = <1>;
7ce117785043b0 Fabien Parent 2024-08-19  164  				hdmi_connector_out: endpoint {
7ce117785043b0 Fabien Parent 2024-08-19  165  					remote-endpoint = <&hdmi_connector_in>;
7ce117785043b0 Fabien Parent 2024-08-19  166  				};
7ce117785043b0 Fabien Parent 2024-08-19  167  			};
7ce117785043b0 Fabien Parent 2024-08-19  168  		};
7ce117785043b0 Fabien Parent 2024-08-19  169  	};
19b6403f1e2a6c Fabien Parent 2021-02-17  170  };
19b6403f1e2a6c Fabien Parent 2021-02-17  171  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
