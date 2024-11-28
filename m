Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259391C2DA2
	for <oe-kbuild@lists.linux.dev>; Thu, 28 Nov 2024 20:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732826246; cv=none; b=MU1+T+zw9SxTGEov7jWFf3bIhJ5X4OYBr4KtA1KxPmHSHAAPVK1rm+hKcZuYGzT2NzRAaibzHRM2iYZSlcJD0+1gUlDsil56B2z1utZ/OW7NWGIu580AqWrpLw1NhG/wXAKMWEB3kAazoDWaU86vzPdqm4pbF8PoVdEXQJ0LUrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732826246; c=relaxed/simple;
	bh=W2U4kTzuNTir05/Ejd4TBtqpWEc3mrJtbIy6O+RFaVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dfWIp0P5Imlq/TJs5wGFHfGs5hhgcohPkDc1p6Jrt0aDILlzljc3tACfEeQykEu2rQnVan7aOCwxdLsxiby/879JzjEtlcvWxh5YIBptPluxP6a3WHJA+VXZM/O0DUFqeTLFCS94i3M7TN/YjkOey5GLtv9pDTmE/HI22DsgbC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dkeNAFoZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dkeNAFoZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732826243; x=1764362243;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=W2U4kTzuNTir05/Ejd4TBtqpWEc3mrJtbIy6O+RFaVs=;
  b=dkeNAFoZwdmBSSmdMP1BKp6h+eGiw+nxsT3dM8l/F5BLp4bAwoETyeVN
   bXFlaoJE6P9/1khkOiT0VNzE89K417S/F97NJK3Ci21bHr4KeFtFvHiBO
   r8dHmWfndvkBbgERGpD7F2bXsy6UsE8oINE9egY9ZFhJYxZeYNkT3Brq+
   wnMHnVcvwSAtyAYI+Ipxd6KSbIN70PdCbmPEpsyMR5ZKIVjVb6yR+OJVW
   P9QD/5Ss2vyeesTuG0Lj1aCPEQ0OWefariuKTWUDx3lmrPmQ9YFDDwGtz
   rSMaOLcFLb/rShHD1MExB0CdHhk1n0OKkt1+s8hHQPudaC05acQFQOwqJ
   w==;
X-CSE-ConnectionGUID: GWJiNCXzTHeroGUoEfpvSA==
X-CSE-MsgGUID: QIFLaJbdQbOL+SBFeVgAJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="33197099"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="33197099"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 12:37:21 -0800
X-CSE-ConnectionGUID: sMpuKFCHTV6JjOx6hPORXA==
X-CSE-MsgGUID: xfUmBVrSRzivAc0t5Ycyzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="97078557"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Nov 2024 12:37:19 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGlGH-0009zT-1a;
	Thu, 28 Nov 2024 20:37:17 +0000
Date: Fri, 29 Nov 2024 04:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/5] arm64: dts: apple: Add touchbar screen nodes
Message-ID: <202411290447.QxG3UgvA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241126-adpdrm-v2-4-c90485336c09@gmail.com>
References: <20241126-adpdrm-v2-4-c90485336c09@gmail.com>
TO: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
TO: Hector Martin <marcan@marcan.st>
TO: Sven Peter <sven@svenpeter.dev>
TO: Alyssa Rosenzweig <alyssa@rosenzweig.io>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Jessica Zhang <quic_jesszhan@quicinc.com>
TO: asahi@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: dri-devel@lists.freedesktop.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Sasha Finkelstein <fnkl.kernel@gmail.com>
CC: Janne Grunau <j@jannau.net>

Hi Sasha,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9f16d5e6f220661f73b36a4be1b21575651d8833]

url:    https://github.com/intel-lab-lkp/linux/commits/Sasha-Finkelstein-via-B4-Relay/dt-bindings-display-Add-Apple-pre-DCP-display-controller-bindings/20241128-102147
base:   9f16d5e6f220661f73b36a4be1b21575651d8833
patch link:    https://lore.kernel.org/r/20241126-adpdrm-v2-4-c90485336c09%40gmail.com
patch subject: [PATCH v2 4/5] arm64: dts: apple: Add touchbar screen nodes
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241129/202411290447.QxG3UgvA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290447.QxG3UgvA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411290447.QxG3UgvA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103.dtsi:401.25-410.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:412.26-416.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/apple/t8103.dtsi:389.34-418.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t8103.dtsi:401.25-410.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/apple/t8112.dtsi:425.25-434.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8112.dtsi:436.26-440.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/apple/t8112.dtsi:412.34-442.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@228600000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/apple/t8112.dtsi:425.25-434.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +401 arch/arm64/boot/dts/apple/t8103.dtsi

7d2d16ccf15d8e Hector Martin     2021-02-04   14  
7d2d16ccf15d8e Hector Martin     2021-02-04   15  / {
7d2d16ccf15d8e Hector Martin     2021-02-04   16  	compatible = "apple,t8103", "apple,arm-platform";
7d2d16ccf15d8e Hector Martin     2021-02-04   17  
7d2d16ccf15d8e Hector Martin     2021-02-04   18  	#address-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04   19  	#size-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04   20  
7d2d16ccf15d8e Hector Martin     2021-02-04   21  	cpus {
7d2d16ccf15d8e Hector Martin     2021-02-04   22  		#address-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04   23  		#size-cells = <0>;
7d2d16ccf15d8e Hector Martin     2021-02-04   24  
3e895a6460ec38 Hector Martin     2022-05-03   25  		cpu-map {
3e895a6460ec38 Hector Martin     2022-05-03   26  			cluster0 {
3e895a6460ec38 Hector Martin     2022-05-03   27  				core0 {
3e895a6460ec38 Hector Martin     2022-05-03   28  					cpu = <&cpu_e0>;
3e895a6460ec38 Hector Martin     2022-05-03   29  				};
3e895a6460ec38 Hector Martin     2022-05-03   30  				core1 {
3e895a6460ec38 Hector Martin     2022-05-03   31  					cpu = <&cpu_e1>;
3e895a6460ec38 Hector Martin     2022-05-03   32  				};
3e895a6460ec38 Hector Martin     2022-05-03   33  				core2 {
3e895a6460ec38 Hector Martin     2022-05-03   34  					cpu = <&cpu_e2>;
3e895a6460ec38 Hector Martin     2022-05-03   35  				};
3e895a6460ec38 Hector Martin     2022-05-03   36  				core3 {
3e895a6460ec38 Hector Martin     2022-05-03   37  					cpu = <&cpu_e3>;
3e895a6460ec38 Hector Martin     2022-05-03   38  				};
3e895a6460ec38 Hector Martin     2022-05-03   39  			};
3e895a6460ec38 Hector Martin     2022-05-03   40  
3e895a6460ec38 Hector Martin     2022-05-03   41  			cluster1 {
3e895a6460ec38 Hector Martin     2022-05-03   42  				core0 {
3e895a6460ec38 Hector Martin     2022-05-03   43  					cpu = <&cpu_p0>;
3e895a6460ec38 Hector Martin     2022-05-03   44  				};
3e895a6460ec38 Hector Martin     2022-05-03   45  				core1 {
3e895a6460ec38 Hector Martin     2022-05-03   46  					cpu = <&cpu_p1>;
3e895a6460ec38 Hector Martin     2022-05-03   47  				};
3e895a6460ec38 Hector Martin     2022-05-03   48  				core2 {
3e895a6460ec38 Hector Martin     2022-05-03   49  					cpu = <&cpu_p2>;
3e895a6460ec38 Hector Martin     2022-05-03   50  				};
3e895a6460ec38 Hector Martin     2022-05-03   51  				core3 {
3e895a6460ec38 Hector Martin     2022-05-03   52  					cpu = <&cpu_p3>;
3e895a6460ec38 Hector Martin     2022-05-03   53  				};
3e895a6460ec38 Hector Martin     2022-05-03   54  			};
3e895a6460ec38 Hector Martin     2022-05-03   55  		};
3e895a6460ec38 Hector Martin     2022-05-03   56  
3e895a6460ec38 Hector Martin     2022-05-03   57  		cpu_e0: cpu@0 {
7d2d16ccf15d8e Hector Martin     2021-02-04   58  			compatible = "apple,icestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04   59  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04   60  			reg = <0x0 0x0>;
7d2d16ccf15d8e Hector Martin     2021-02-04   61  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04   62  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03   63  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03   64  			capacity-dmips-mhz = <714>;
3e895a6460ec38 Hector Martin     2022-05-03   65  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   66  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   67  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   68  			d-cache-size = <0x10000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   69  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   70  
3e895a6460ec38 Hector Martin     2022-05-03   71  		cpu_e1: cpu@1 {
7d2d16ccf15d8e Hector Martin     2021-02-04   72  			compatible = "apple,icestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04   73  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04   74  			reg = <0x0 0x1>;
7d2d16ccf15d8e Hector Martin     2021-02-04   75  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04   76  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03   77  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03   78  			capacity-dmips-mhz = <714>;
3e895a6460ec38 Hector Martin     2022-05-03   79  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   80  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   81  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   82  			d-cache-size = <0x10000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   83  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   84  
3e895a6460ec38 Hector Martin     2022-05-03   85  		cpu_e2: cpu@2 {
7d2d16ccf15d8e Hector Martin     2021-02-04   86  			compatible = "apple,icestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04   87  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04   88  			reg = <0x0 0x2>;
7d2d16ccf15d8e Hector Martin     2021-02-04   89  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04   90  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03   91  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03   92  			capacity-dmips-mhz = <714>;
3e895a6460ec38 Hector Martin     2022-05-03   93  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   94  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   95  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06   96  			d-cache-size = <0x10000>;
7d2d16ccf15d8e Hector Martin     2021-02-04   97  		};
7d2d16ccf15d8e Hector Martin     2021-02-04   98  
3e895a6460ec38 Hector Martin     2022-05-03   99  		cpu_e3: cpu@3 {
7d2d16ccf15d8e Hector Martin     2021-02-04  100  			compatible = "apple,icestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04  101  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04  102  			reg = <0x0 0x3>;
7d2d16ccf15d8e Hector Martin     2021-02-04  103  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04  104  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03  105  			operating-points-v2 = <&ecluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03  106  			capacity-dmips-mhz = <714>;
3e895a6460ec38 Hector Martin     2022-05-03  107  			performance-domains = <&cpufreq_e>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  108  			next-level-cache = <&l2_cache_0>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  109  			i-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  110  			d-cache-size = <0x10000>;
7d2d16ccf15d8e Hector Martin     2021-02-04  111  		};
7d2d16ccf15d8e Hector Martin     2021-02-04  112  
3e895a6460ec38 Hector Martin     2022-05-03  113  		cpu_p0: cpu@10100 {
7d2d16ccf15d8e Hector Martin     2021-02-04  114  			compatible = "apple,firestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04  115  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04  116  			reg = <0x0 0x10100>;
7d2d16ccf15d8e Hector Martin     2021-02-04  117  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04  118  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03  119  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03  120  			capacity-dmips-mhz = <1024>;
3e895a6460ec38 Hector Martin     2022-05-03  121  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  122  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  123  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  124  			d-cache-size = <0x20000>;
7d2d16ccf15d8e Hector Martin     2021-02-04  125  		};
7d2d16ccf15d8e Hector Martin     2021-02-04  126  
3e895a6460ec38 Hector Martin     2022-05-03  127  		cpu_p1: cpu@10101 {
7d2d16ccf15d8e Hector Martin     2021-02-04  128  			compatible = "apple,firestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04  129  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04  130  			reg = <0x0 0x10101>;
7d2d16ccf15d8e Hector Martin     2021-02-04  131  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04  132  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03  133  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03  134  			capacity-dmips-mhz = <1024>;
3e895a6460ec38 Hector Martin     2022-05-03  135  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  136  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  137  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  138  			d-cache-size = <0x20000>;
7d2d16ccf15d8e Hector Martin     2021-02-04  139  		};
7d2d16ccf15d8e Hector Martin     2021-02-04  140  
3e895a6460ec38 Hector Martin     2022-05-03  141  		cpu_p2: cpu@10102 {
7d2d16ccf15d8e Hector Martin     2021-02-04  142  			compatible = "apple,firestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04  143  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04  144  			reg = <0x0 0x10102>;
7d2d16ccf15d8e Hector Martin     2021-02-04  145  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04  146  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03  147  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03  148  			capacity-dmips-mhz = <1024>;
3e895a6460ec38 Hector Martin     2022-05-03  149  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  150  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  151  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  152  			d-cache-size = <0x20000>;
7d2d16ccf15d8e Hector Martin     2021-02-04  153  		};
7d2d16ccf15d8e Hector Martin     2021-02-04  154  
3e895a6460ec38 Hector Martin     2022-05-03  155  		cpu_p3: cpu@10103 {
7d2d16ccf15d8e Hector Martin     2021-02-04  156  			compatible = "apple,firestorm";
7d2d16ccf15d8e Hector Martin     2021-02-04  157  			device_type = "cpu";
7d2d16ccf15d8e Hector Martin     2021-02-04  158  			reg = <0x0 0x10103>;
7d2d16ccf15d8e Hector Martin     2021-02-04  159  			enable-method = "spin-table";
7d2d16ccf15d8e Hector Martin     2021-02-04  160  			cpu-release-addr = <0 0>; /* To be filled by loader */
3e895a6460ec38 Hector Martin     2022-05-03  161  			operating-points-v2 = <&pcluster_opp>;
3e895a6460ec38 Hector Martin     2022-05-03  162  			capacity-dmips-mhz = <1024>;
3e895a6460ec38 Hector Martin     2022-05-03  163  			performance-domains = <&cpufreq_p>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  164  			next-level-cache = <&l2_cache_1>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  165  			i-cache-size = <0x30000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  166  			d-cache-size = <0x20000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  167  		};
9ecb7a4b8ac67c Janne Grunau      2022-12-06  168  
9ecb7a4b8ac67c Janne Grunau      2022-12-06  169  		l2_cache_0: l2-cache-0 {
9ecb7a4b8ac67c Janne Grunau      2022-12-06  170  			compatible = "cache";
9ecb7a4b8ac67c Janne Grunau      2022-12-06  171  			cache-level = <2>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  172  			cache-unified;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  173  			cache-size = <0x400000>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  174  		};
9ecb7a4b8ac67c Janne Grunau      2022-12-06  175  
9ecb7a4b8ac67c Janne Grunau      2022-12-06  176  		l2_cache_1: l2-cache-1 {
9ecb7a4b8ac67c Janne Grunau      2022-12-06  177  			compatible = "cache";
9ecb7a4b8ac67c Janne Grunau      2022-12-06  178  			cache-level = <2>;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  179  			cache-unified;
9ecb7a4b8ac67c Janne Grunau      2022-12-06  180  			cache-size = <0xc00000>;
3e895a6460ec38 Hector Martin     2022-05-03  181  		};
3e895a6460ec38 Hector Martin     2022-05-03  182  	};
3e895a6460ec38 Hector Martin     2022-05-03  183  
3e895a6460ec38 Hector Martin     2022-05-03  184  	ecluster_opp: opp-table-0 {
3e895a6460ec38 Hector Martin     2022-05-03  185  		compatible = "operating-points-v2";
3e895a6460ec38 Hector Martin     2022-05-03  186  
3e895a6460ec38 Hector Martin     2022-05-03  187  		opp01 {
3e895a6460ec38 Hector Martin     2022-05-03  188  			opp-hz = /bits/ 64 <600000000>;
3e895a6460ec38 Hector Martin     2022-05-03  189  			opp-level = <1>;
3e895a6460ec38 Hector Martin     2022-05-03  190  			clock-latency-ns = <7500>;
7d2d16ccf15d8e Hector Martin     2021-02-04  191  		};
3e895a6460ec38 Hector Martin     2022-05-03  192  		opp02 {
3e895a6460ec38 Hector Martin     2022-05-03  193  			opp-hz = /bits/ 64 <972000000>;
3e895a6460ec38 Hector Martin     2022-05-03  194  			opp-level = <2>;
3e895a6460ec38 Hector Martin     2022-05-03  195  			clock-latency-ns = <22000>;
3e895a6460ec38 Hector Martin     2022-05-03  196  		};
3e895a6460ec38 Hector Martin     2022-05-03  197  		opp03 {
3e895a6460ec38 Hector Martin     2022-05-03  198  			opp-hz = /bits/ 64 <1332000000>;
3e895a6460ec38 Hector Martin     2022-05-03  199  			opp-level = <3>;
3e895a6460ec38 Hector Martin     2022-05-03  200  			clock-latency-ns = <27000>;
3e895a6460ec38 Hector Martin     2022-05-03  201  		};
3e895a6460ec38 Hector Martin     2022-05-03  202  		opp04 {
3e895a6460ec38 Hector Martin     2022-05-03  203  			opp-hz = /bits/ 64 <1704000000>;
3e895a6460ec38 Hector Martin     2022-05-03  204  			opp-level = <4>;
3e895a6460ec38 Hector Martin     2022-05-03  205  			clock-latency-ns = <33000>;
3e895a6460ec38 Hector Martin     2022-05-03  206  		};
3e895a6460ec38 Hector Martin     2022-05-03  207  		opp05 {
3e895a6460ec38 Hector Martin     2022-05-03  208  			opp-hz = /bits/ 64 <2064000000>;
3e895a6460ec38 Hector Martin     2022-05-03  209  			opp-level = <5>;
3e895a6460ec38 Hector Martin     2022-05-03  210  			clock-latency-ns = <50000>;
3e895a6460ec38 Hector Martin     2022-05-03  211  		};
3e895a6460ec38 Hector Martin     2022-05-03  212  	};
3e895a6460ec38 Hector Martin     2022-05-03  213  
3e895a6460ec38 Hector Martin     2022-05-03  214  	pcluster_opp: opp-table-1 {
3e895a6460ec38 Hector Martin     2022-05-03  215  		compatible = "operating-points-v2";
3e895a6460ec38 Hector Martin     2022-05-03  216  
3e895a6460ec38 Hector Martin     2022-05-03  217  		opp01 {
3e895a6460ec38 Hector Martin     2022-05-03  218  			opp-hz = /bits/ 64 <600000000>;
3e895a6460ec38 Hector Martin     2022-05-03  219  			opp-level = <1>;
3e895a6460ec38 Hector Martin     2022-05-03  220  			clock-latency-ns = <8000>;
3e895a6460ec38 Hector Martin     2022-05-03  221  		};
3e895a6460ec38 Hector Martin     2022-05-03  222  		opp02 {
3e895a6460ec38 Hector Martin     2022-05-03  223  			opp-hz = /bits/ 64 <828000000>;
3e895a6460ec38 Hector Martin     2022-05-03  224  			opp-level = <2>;
3e895a6460ec38 Hector Martin     2022-05-03  225  			clock-latency-ns = <19000>;
3e895a6460ec38 Hector Martin     2022-05-03  226  		};
3e895a6460ec38 Hector Martin     2022-05-03  227  		opp03 {
3e895a6460ec38 Hector Martin     2022-05-03  228  			opp-hz = /bits/ 64 <1056000000>;
3e895a6460ec38 Hector Martin     2022-05-03  229  			opp-level = <3>;
3e895a6460ec38 Hector Martin     2022-05-03  230  			clock-latency-ns = <21000>;
3e895a6460ec38 Hector Martin     2022-05-03  231  		};
3e895a6460ec38 Hector Martin     2022-05-03  232  		opp04 {
3e895a6460ec38 Hector Martin     2022-05-03  233  			opp-hz = /bits/ 64 <1284000000>;
3e895a6460ec38 Hector Martin     2022-05-03  234  			opp-level = <4>;
3e895a6460ec38 Hector Martin     2022-05-03  235  			clock-latency-ns = <23000>;
3e895a6460ec38 Hector Martin     2022-05-03  236  		};
3e895a6460ec38 Hector Martin     2022-05-03  237  		opp05 {
3e895a6460ec38 Hector Martin     2022-05-03  238  			opp-hz = /bits/ 64 <1500000000>;
3e895a6460ec38 Hector Martin     2022-05-03  239  			opp-level = <5>;
3e895a6460ec38 Hector Martin     2022-05-03  240  			clock-latency-ns = <24000>;
3e895a6460ec38 Hector Martin     2022-05-03  241  		};
3e895a6460ec38 Hector Martin     2022-05-03  242  		opp06 {
3e895a6460ec38 Hector Martin     2022-05-03  243  			opp-hz = /bits/ 64 <1728000000>;
3e895a6460ec38 Hector Martin     2022-05-03  244  			opp-level = <6>;
3e895a6460ec38 Hector Martin     2022-05-03  245  			clock-latency-ns = <29000>;
3e895a6460ec38 Hector Martin     2022-05-03  246  		};
3e895a6460ec38 Hector Martin     2022-05-03  247  		opp07 {
3e895a6460ec38 Hector Martin     2022-05-03  248  			opp-hz = /bits/ 64 <1956000000>;
3e895a6460ec38 Hector Martin     2022-05-03  249  			opp-level = <7>;
3e895a6460ec38 Hector Martin     2022-05-03  250  			clock-latency-ns = <31000>;
3e895a6460ec38 Hector Martin     2022-05-03  251  		};
3e895a6460ec38 Hector Martin     2022-05-03  252  		opp08 {
3e895a6460ec38 Hector Martin     2022-05-03  253  			opp-hz = /bits/ 64 <2184000000>;
3e895a6460ec38 Hector Martin     2022-05-03  254  			opp-level = <8>;
3e895a6460ec38 Hector Martin     2022-05-03  255  			clock-latency-ns = <34000>;
3e895a6460ec38 Hector Martin     2022-05-03  256  		};
3e895a6460ec38 Hector Martin     2022-05-03  257  		opp09 {
3e895a6460ec38 Hector Martin     2022-05-03  258  			opp-hz = /bits/ 64 <2388000000>;
3e895a6460ec38 Hector Martin     2022-05-03  259  			opp-level = <9>;
3e895a6460ec38 Hector Martin     2022-05-03  260  			clock-latency-ns = <36000>;
3e895a6460ec38 Hector Martin     2022-05-03  261  		};
3e895a6460ec38 Hector Martin     2022-05-03  262  		opp10 {
3e895a6460ec38 Hector Martin     2022-05-03  263  			opp-hz = /bits/ 64 <2592000000>;
3e895a6460ec38 Hector Martin     2022-05-03  264  			opp-level = <10>;
3e895a6460ec38 Hector Martin     2022-05-03  265  			clock-latency-ns = <51000>;
3e895a6460ec38 Hector Martin     2022-05-03  266  		};
3e895a6460ec38 Hector Martin     2022-05-03  267  		opp11 {
3e895a6460ec38 Hector Martin     2022-05-03  268  			opp-hz = /bits/ 64 <2772000000>;
3e895a6460ec38 Hector Martin     2022-05-03  269  			opp-level = <11>;
3e895a6460ec38 Hector Martin     2022-05-03  270  			clock-latency-ns = <54000>;
3e895a6460ec38 Hector Martin     2022-05-03  271  		};
3e895a6460ec38 Hector Martin     2022-05-03  272  		opp12 {
3e895a6460ec38 Hector Martin     2022-05-03  273  			opp-hz = /bits/ 64 <2988000000>;
3e895a6460ec38 Hector Martin     2022-05-03  274  			opp-level = <12>;
3e895a6460ec38 Hector Martin     2022-05-03  275  			clock-latency-ns = <55000>;
3e895a6460ec38 Hector Martin     2022-05-03  276  		};
3e895a6460ec38 Hector Martin     2022-05-03  277  #if 0
3e895a6460ec38 Hector Martin     2022-05-03  278  		/* Not available until CPU deep sleep is implemented */
3e895a6460ec38 Hector Martin     2022-05-03  279  		opp13 {
3e895a6460ec38 Hector Martin     2022-05-03  280  			opp-hz = /bits/ 64 <3096000000>;
3e895a6460ec38 Hector Martin     2022-05-03  281  			opp-level = <13>;
3e895a6460ec38 Hector Martin     2022-05-03  282  			clock-latency-ns = <55000>;
3e895a6460ec38 Hector Martin     2022-05-03  283  			turbo-mode;
3e895a6460ec38 Hector Martin     2022-05-03  284  		};
3e895a6460ec38 Hector Martin     2022-05-03  285  		opp14 {
3e895a6460ec38 Hector Martin     2022-05-03  286  			opp-hz = /bits/ 64 <3144000000>;
3e895a6460ec38 Hector Martin     2022-05-03  287  			opp-level = <14>;
3e895a6460ec38 Hector Martin     2022-05-03  288  			clock-latency-ns = <56000>;
3e895a6460ec38 Hector Martin     2022-05-03  289  			turbo-mode;
3e895a6460ec38 Hector Martin     2022-05-03  290  		};
3e895a6460ec38 Hector Martin     2022-05-03  291  		opp15 {
3e895a6460ec38 Hector Martin     2022-05-03  292  			opp-hz = /bits/ 64 <3204000000>;
3e895a6460ec38 Hector Martin     2022-05-03  293  			opp-level = <15>;
3e895a6460ec38 Hector Martin     2022-05-03  294  			clock-latency-ns = <56000>;
3e895a6460ec38 Hector Martin     2022-05-03  295  			turbo-mode;
3e895a6460ec38 Hector Martin     2022-05-03  296  		};
3e895a6460ec38 Hector Martin     2022-05-03  297  #endif
7d2d16ccf15d8e Hector Martin     2021-02-04  298  	};
7d2d16ccf15d8e Hector Martin     2021-02-04  299  
7d2d16ccf15d8e Hector Martin     2021-02-04  300  	timer {
7d2d16ccf15d8e Hector Martin     2021-02-04  301  		compatible = "arm,armv8-timer";
7d2d16ccf15d8e Hector Martin     2021-02-04  302  		interrupt-parent = <&aic>;
7d2d16ccf15d8e Hector Martin     2021-02-04  303  		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
7d2d16ccf15d8e Hector Martin     2021-02-04  304  		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
7d2d16ccf15d8e Hector Martin     2021-02-04  305  			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
7d2d16ccf15d8e Hector Martin     2021-02-04  306  			     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
7d2d16ccf15d8e Hector Martin     2021-02-04  307  			     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
7d2d16ccf15d8e Hector Martin     2021-02-04  308  	};
7d2d16ccf15d8e Hector Martin     2021-02-04  309  
0f522efcd79634 Marc Zyngier      2021-11-02  310  	pmu-e {
0f522efcd79634 Marc Zyngier      2021-11-02  311  		compatible = "apple,icestorm-pmu";
0f522efcd79634 Marc Zyngier      2021-11-02  312  		interrupt-parent = <&aic>;
0f522efcd79634 Marc Zyngier      2021-11-02  313  		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
0f522efcd79634 Marc Zyngier      2021-11-02  314  	};
0f522efcd79634 Marc Zyngier      2021-11-02  315  
0f522efcd79634 Marc Zyngier      2021-11-02  316  	pmu-p {
0f522efcd79634 Marc Zyngier      2021-11-02  317  		compatible = "apple,firestorm-pmu";
0f522efcd79634 Marc Zyngier      2021-11-02  318  		interrupt-parent = <&aic>;
0f522efcd79634 Marc Zyngier      2021-11-02  319  		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
0f522efcd79634 Marc Zyngier      2021-11-02  320  	};
0f522efcd79634 Marc Zyngier      2021-11-02  321  
57337b25244212 Hector Martin     2021-10-05  322  	clkref: clock-ref {
7d2d16ccf15d8e Hector Martin     2021-02-04  323  		compatible = "fixed-clock";
7d2d16ccf15d8e Hector Martin     2021-02-04  324  		#clock-cells = <0>;
7d2d16ccf15d8e Hector Martin     2021-02-04  325  		clock-frequency = <24000000>;
57337b25244212 Hector Martin     2021-10-05  326  		clock-output-names = "clkref";
7d2d16ccf15d8e Hector Martin     2021-02-04  327  	};
7d2d16ccf15d8e Hector Martin     2021-02-04  328  
8a3df85ad87d2e Martin Povišer    2022-09-16  329  	/*
8a3df85ad87d2e Martin Povišer    2022-09-16  330  	 * This is a fabulated representation of the input clock
8a3df85ad87d2e Martin Povišer    2022-09-16  331  	 * to NCO since we don't know the true clock tree.
8a3df85ad87d2e Martin Povišer    2022-09-16  332  	 */
8a3df85ad87d2e Martin Povišer    2022-09-16  333  	nco_clkref: clock-ref-nco {
8a3df85ad87d2e Martin Povišer    2022-09-16  334  		compatible = "fixed-clock";
8a3df85ad87d2e Martin Povišer    2022-09-16  335  		#clock-cells = <0>;
8a3df85ad87d2e Martin Povišer    2022-09-16  336  		clock-output-names = "nco_ref";
8a3df85ad87d2e Martin Povišer    2022-09-16  337  	};
8a3df85ad87d2e Martin Povišer    2022-09-16  338  
7d2d16ccf15d8e Hector Martin     2021-02-04  339  	soc {
7d2d16ccf15d8e Hector Martin     2021-02-04  340  		compatible = "simple-bus";
7d2d16ccf15d8e Hector Martin     2021-02-04  341  		#address-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04  342  		#size-cells = <2>;
7d2d16ccf15d8e Hector Martin     2021-02-04  343  
7d2d16ccf15d8e Hector Martin     2021-02-04  344  		ranges;
7d2d16ccf15d8e Hector Martin     2021-02-04  345  		nonposted-mmio;
7d2d16ccf15d8e Hector Martin     2021-02-04  346  
3e895a6460ec38 Hector Martin     2022-05-03  347  		cpufreq_e: performance-controller@210e20000 {
3e895a6460ec38 Hector Martin     2022-05-03  348  			compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
3e895a6460ec38 Hector Martin     2022-05-03  349  			reg = <0x2 0x10e20000 0 0x1000>;
3e895a6460ec38 Hector Martin     2022-05-03  350  			#performance-domain-cells = <0>;
3e895a6460ec38 Hector Martin     2022-05-03  351  		};
3e895a6460ec38 Hector Martin     2022-05-03  352  
3e895a6460ec38 Hector Martin     2022-05-03  353  		cpufreq_p: performance-controller@211e20000 {
3e895a6460ec38 Hector Martin     2022-05-03  354  			compatible = "apple,t8103-cluster-cpufreq", "apple,cluster-cpufreq";
3e895a6460ec38 Hector Martin     2022-05-03  355  			reg = <0x2 0x11e20000 0 0x1000>;
3e895a6460ec38 Hector Martin     2022-05-03  356  			#performance-domain-cells = <0>;
3e895a6460ec38 Hector Martin     2022-05-03  357  		};
3e895a6460ec38 Hector Martin     2022-05-03  358  
3cd147b8495e1f Sasha Finkelstein 2024-11-26  359  		display_dfr: display-pipe@228200000 {
3cd147b8495e1f Sasha Finkelstein 2024-11-26  360  			compatible = "apple,t8103-display-pipe", "apple,h7-display-pipe";
3cd147b8495e1f Sasha Finkelstein 2024-11-26  361  			reg-names = "be", "fe";
3cd147b8495e1f Sasha Finkelstein 2024-11-26  362  			reg = <0x2 0x28200000 0x0 0xc000>,
3cd147b8495e1f Sasha Finkelstein 2024-11-26  363  				<0x2 0x28400000 0x0 0x4000>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  364  			power-domains = <&ps_dispdfr_fe>, <&ps_dispdfr_be>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  365  			interrupt-parent = <&aic>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  366  			interrupts = <AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>,
3cd147b8495e1f Sasha Finkelstein 2024-11-26  367  				<AIC_IRQ 506 IRQ_TYPE_LEVEL_HIGH>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  368  			interrupt-names = "be", "fe";
3cd147b8495e1f Sasha Finkelstein 2024-11-26  369  			iommus = <&displaydfr_dart 0>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  370  			status = "disabled";
3cd147b8495e1f Sasha Finkelstein 2024-11-26  371  
3cd147b8495e1f Sasha Finkelstein 2024-11-26  372  			port {
3cd147b8495e1f Sasha Finkelstein 2024-11-26  373  				dfr_adp_out_mipi: endpoint {
3cd147b8495e1f Sasha Finkelstein 2024-11-26  374  					remote-endpoint = <&dfr_mipi_in_adp>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  375  				};
3cd147b8495e1f Sasha Finkelstein 2024-11-26  376  			};
3cd147b8495e1f Sasha Finkelstein 2024-11-26  377  		};
3cd147b8495e1f Sasha Finkelstein 2024-11-26  378  
3cd147b8495e1f Sasha Finkelstein 2024-11-26  379  		displaydfr_dart: iommu@228304000 {
3cd147b8495e1f Sasha Finkelstein 2024-11-26  380  			compatible = "apple,t8103-dart";
3cd147b8495e1f Sasha Finkelstein 2024-11-26  381  			reg = <0x2 0x28304000 0x0 0x4000>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  382  			interrupt-parent = <&aic>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  383  			interrupts = <AIC_IRQ 504 IRQ_TYPE_LEVEL_HIGH>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  384  			#iommu-cells = <1>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  385  			power-domains = <&ps_dispdfr_fe>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  386  			status = "disabled";
3cd147b8495e1f Sasha Finkelstein 2024-11-26  387  		};
3cd147b8495e1f Sasha Finkelstein 2024-11-26  388  
3cd147b8495e1f Sasha Finkelstein 2024-11-26 @389  		displaydfr_mipi: dsi@228600000 {
3cd147b8495e1f Sasha Finkelstein 2024-11-26  390  			compatible = "apple,t8103-display-pipe-mipi", "apple,h7-display-pipe-mipi";
3cd147b8495e1f Sasha Finkelstein 2024-11-26  391  			reg-names = "mipi";
3cd147b8495e1f Sasha Finkelstein 2024-11-26  392  			reg = <0x2 0x28600000 0x0 0x100000>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  393  			power-domains = <&ps_mipi_dsi>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  394  			#address-cells = <1>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  395  			#size-cells = <0>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  396  			status = "disabled";
3cd147b8495e1f Sasha Finkelstein 2024-11-26  397  			ports {
3cd147b8495e1f Sasha Finkelstein 2024-11-26  398  				#address-cells = <1>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  399  				#size-cells = <0>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  400  
3cd147b8495e1f Sasha Finkelstein 2024-11-26 @401  				dfr_mipi_in: port@0 {
3cd147b8495e1f Sasha Finkelstein 2024-11-26  402  					#address-cells = <1>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  403  					#size-cells = <0>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  404  					reg = <0>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  405  
3cd147b8495e1f Sasha Finkelstein 2024-11-26  406  					dfr_mipi_in_adp: endpoint@0 {
3cd147b8495e1f Sasha Finkelstein 2024-11-26  407  						reg = <0>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  408  						remote-endpoint = <&dfr_adp_out_mipi>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  409  					};
3cd147b8495e1f Sasha Finkelstein 2024-11-26  410  				};
3cd147b8495e1f Sasha Finkelstein 2024-11-26  411  
3cd147b8495e1f Sasha Finkelstein 2024-11-26  412  				dfr_mipi_out: port@1 {
3cd147b8495e1f Sasha Finkelstein 2024-11-26  413  					#address-cells = <1>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  414  					#size-cells = <0>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  415  					reg = <1>;
3cd147b8495e1f Sasha Finkelstein 2024-11-26  416  				};
3cd147b8495e1f Sasha Finkelstein 2024-11-26  417  			};
3cd147b8495e1f Sasha Finkelstein 2024-11-26  418  		};
3cd147b8495e1f Sasha Finkelstein 2024-11-26  419  
63bf0b66ddfa67 Hector Martin     2022-12-05  420  		sio_dart: iommu@235004000 {
8a3df85ad87d2e Martin Povišer    2022-09-16  421  			compatible = "apple,t8103-dart";
8a3df85ad87d2e Martin Povišer    2022-09-16  422  			reg = <0x2 0x35004000 0x0 0x4000>;
8a3df85ad87d2e Martin Povišer    2022-09-16  423  			interrupt-parent = <&aic>;
8a3df85ad87d2e Martin Povišer    2022-09-16  424  			interrupts = <AIC_IRQ 635 IRQ_TYPE_LEVEL_HIGH>;
8a3df85ad87d2e Martin Povišer    2022-09-16  425  			#iommu-cells = <1>;
8a3df85ad87d2e Martin Povišer    2022-09-16  426  			power-domains = <&ps_sio_cpu>;
8a3df85ad87d2e Martin Povišer    2022-09-16  427  		};
8a3df85ad87d2e Martin Povišer    2022-09-16  428  
90458f6eec42aa Janne Grunau      2021-11-23  429  		i2c0: i2c@235010000 {
90458f6eec42aa Janne Grunau      2021-11-23  430  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23  431  			reg = <0x2 0x35010000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05  432  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23  433  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23  434  			interrupts = <AIC_IRQ 627 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23  435  			pinctrl-0 = <&i2c0_pins>;
90458f6eec42aa Janne Grunau      2021-11-23  436  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23  437  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23  438  			#size-cells = <0x0>;
106ba3b48a35dd Hector Martin     2021-11-24  439  			power-domains = <&ps_i2c0>;
90458f6eec42aa Janne Grunau      2021-11-23  440  		};
90458f6eec42aa Janne Grunau      2021-11-23  441  
90458f6eec42aa Janne Grunau      2021-11-23  442  		i2c1: i2c@235014000 {
90458f6eec42aa Janne Grunau      2021-11-23  443  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23  444  			reg = <0x2 0x35014000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05  445  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23  446  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23  447  			interrupts = <AIC_IRQ 628 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23  448  			pinctrl-0 = <&i2c1_pins>;
90458f6eec42aa Janne Grunau      2021-11-23  449  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23  450  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23  451  			#size-cells = <0x0>;
106ba3b48a35dd Hector Martin     2021-11-24  452  			power-domains = <&ps_i2c1>;
90458f6eec42aa Janne Grunau      2021-11-23  453  		};
90458f6eec42aa Janne Grunau      2021-11-23  454  
90458f6eec42aa Janne Grunau      2021-11-23  455  		i2c2: i2c@235018000 {
90458f6eec42aa Janne Grunau      2021-11-23  456  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23  457  			reg = <0x2 0x35018000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05  458  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23  459  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23  460  			interrupts = <AIC_IRQ 629 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23  461  			pinctrl-0 = <&i2c2_pins>;
90458f6eec42aa Janne Grunau      2021-11-23  462  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23  463  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23  464  			#size-cells = <0x0>;
90458f6eec42aa Janne Grunau      2021-11-23  465  			status = "disabled"; /* not used in all devices */
106ba3b48a35dd Hector Martin     2021-11-24  466  			power-domains = <&ps_i2c2>;
90458f6eec42aa Janne Grunau      2021-11-23  467  		};
90458f6eec42aa Janne Grunau      2021-11-23  468  
90458f6eec42aa Janne Grunau      2021-11-23  469  		i2c3: i2c@23501c000 {
90458f6eec42aa Janne Grunau      2021-11-23  470  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23  471  			reg = <0x2 0x3501c000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05  472  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23  473  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23  474  			interrupts = <AIC_IRQ 630 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23  475  			pinctrl-0 = <&i2c3_pins>;
90458f6eec42aa Janne Grunau      2021-11-23  476  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23  477  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23  478  			#size-cells = <0x0>;
106ba3b48a35dd Hector Martin     2021-11-24  479  			power-domains = <&ps_i2c3>;
90458f6eec42aa Janne Grunau      2021-11-23  480  		};
90458f6eec42aa Janne Grunau      2021-11-23  481  
90458f6eec42aa Janne Grunau      2021-11-23  482  		i2c4: i2c@235020000 {
90458f6eec42aa Janne Grunau      2021-11-23  483  			compatible = "apple,t8103-i2c", "apple,i2c";
90458f6eec42aa Janne Grunau      2021-11-23  484  			reg = <0x2 0x35020000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05  485  			clocks = <&clkref>;
90458f6eec42aa Janne Grunau      2021-11-23  486  			interrupt-parent = <&aic>;
90458f6eec42aa Janne Grunau      2021-11-23  487  			interrupts = <AIC_IRQ 631 IRQ_TYPE_LEVEL_HIGH>;
90458f6eec42aa Janne Grunau      2021-11-23  488  			pinctrl-0 = <&i2c4_pins>;
90458f6eec42aa Janne Grunau      2021-11-23  489  			pinctrl-names = "default";
90458f6eec42aa Janne Grunau      2021-11-23  490  			#address-cells = <0x1>;
90458f6eec42aa Janne Grunau      2021-11-23  491  			#size-cells = <0x0>;
106ba3b48a35dd Hector Martin     2021-11-24  492  			power-domains = <&ps_i2c4>;
90458f6eec42aa Janne Grunau      2021-11-23  493  			status = "disabled"; /* only used in J293 */
90458f6eec42aa Janne Grunau      2021-11-23  494  		};
90458f6eec42aa Janne Grunau      2021-11-23  495  
348981c783b985 Sasha Finkelstein 2023-04-03  496  		fpwm1: pwm@235044000 {
348981c783b985 Sasha Finkelstein 2023-04-03  497  			compatible = "apple,t8103-fpwm", "apple,s5l-fpwm";
348981c783b985 Sasha Finkelstein 2023-04-03  498  			reg = <0x2 0x35044000 0x0 0x4000>;
348981c783b985 Sasha Finkelstein 2023-04-03  499  			power-domains = <&ps_fpwm1>;
348981c783b985 Sasha Finkelstein 2023-04-03  500  			clocks = <&clkref>;
348981c783b985 Sasha Finkelstein 2023-04-03  501  			#pwm-cells = <2>;
348981c783b985 Sasha Finkelstein 2023-04-03  502  			status = "disabled";
348981c783b985 Sasha Finkelstein 2023-04-03  503  		};
348981c783b985 Sasha Finkelstein 2023-04-03  504  
7d2d16ccf15d8e Hector Martin     2021-02-04  505  		serial0: serial@235200000 {
7d2d16ccf15d8e Hector Martin     2021-02-04  506  			compatible = "apple,s5l-uart";
7d2d16ccf15d8e Hector Martin     2021-02-04  507  			reg = <0x2 0x35200000 0x0 0x1000>;
7d2d16ccf15d8e Hector Martin     2021-02-04  508  			reg-io-width = <4>;
7d2d16ccf15d8e Hector Martin     2021-02-04  509  			interrupt-parent = <&aic>;
7d2d16ccf15d8e Hector Martin     2021-02-04  510  			interrupts = <AIC_IRQ 605 IRQ_TYPE_LEVEL_HIGH>;
7d2d16ccf15d8e Hector Martin     2021-02-04  511  			/*
7d2d16ccf15d8e Hector Martin     2021-02-04  512  			 * TODO: figure out the clocking properly, there may
7d2d16ccf15d8e Hector Martin     2021-02-04  513  			 * be a third selectable clock.
7d2d16ccf15d8e Hector Martin     2021-02-04  514  			 */
57337b25244212 Hector Martin     2021-10-05  515  			clocks = <&clkref>, <&clkref>;
7d2d16ccf15d8e Hector Martin     2021-02-04  516  			clock-names = "uart", "clk_uart_baud0";
106ba3b48a35dd Hector Martin     2021-11-24  517  			power-domains = <&ps_uart0>;
7d2d16ccf15d8e Hector Martin     2021-02-04  518  			status = "disabled";
7d2d16ccf15d8e Hector Martin     2021-02-04  519  		};
7d2d16ccf15d8e Hector Martin     2021-02-04  520  
2ba22cfeda4456 Hector Martin     2021-09-20  521  		serial2: serial@235208000 {
2ba22cfeda4456 Hector Martin     2021-09-20  522  			compatible = "apple,s5l-uart";
2ba22cfeda4456 Hector Martin     2021-09-20  523  			reg = <0x2 0x35208000 0x0 0x1000>;
2ba22cfeda4456 Hector Martin     2021-09-20  524  			reg-io-width = <4>;
2ba22cfeda4456 Hector Martin     2021-09-20  525  			interrupt-parent = <&aic>;
2ba22cfeda4456 Hector Martin     2021-09-20  526  			interrupts = <AIC_IRQ 607 IRQ_TYPE_LEVEL_HIGH>;
57337b25244212 Hector Martin     2021-10-05  527  			clocks = <&clkref>, <&clkref>;
7d2d16ccf15d8e Hector Martin     2021-02-04  528  			clock-names = "uart", "clk_uart_baud0";
2ba22cfeda4456 Hector Martin     2021-09-20  529  			power-domains = <&ps_uart2>;
7d2d16ccf15d8e Hector Martin     2021-02-04  530  			status = "disabled";
7d2d16ccf15d8e Hector Martin     2021-02-04  531  		};
7d2d16ccf15d8e Hector Martin     2021-02-04  532  
8a3df85ad87d2e Martin Povišer    2022-09-16  533  		admac: dma-controller@238200000 {
8a3df85ad87d2e Martin Povišer    2022-09-16  534  			compatible = "apple,t8103-admac", "apple,admac";
8a3df85ad87d2e Martin Povišer    2022-09-16  535  			reg = <0x2 0x38200000 0x0 0x34000>;
8a3df85ad87d2e Martin Povišer    2022-09-16  536  			dma-channels = <24>;
8a3df85ad87d2e Martin Povišer    2022-09-16  537  			interrupts-extended = <0>,
8a3df85ad87d2e Martin Povišer    2022-09-16  538  					      <&aic AIC_IRQ 626 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16  539  					      <0>,
8a3df85ad87d2e Martin Povišer    2022-09-16  540  					      <0>;
8a3df85ad87d2e Martin Povišer    2022-09-16  541  			#dma-cells = <1>;
63bf0b66ddfa67 Hector Martin     2022-12-05  542  			iommus = <&sio_dart 2>;
8a3df85ad87d2e Martin Povišer    2022-09-16  543  			power-domains = <&ps_sio_adma>;
56fed763f6b2dc Martin Povišer    2022-09-18  544  			resets = <&ps_audio_p>;
8a3df85ad87d2e Martin Povišer    2022-09-16  545  		};
8a3df85ad87d2e Martin Povišer    2022-09-16  546  
8a3df85ad87d2e Martin Povišer    2022-09-16  547  		mca: i2s@238400000 {
8a3df85ad87d2e Martin Povišer    2022-09-16  548  			compatible = "apple,t8103-mca", "apple,mca";
8a3df85ad87d2e Martin Povišer    2022-09-16  549  			reg = <0x2 0x38400000 0x0 0x18000>,
8a3df85ad87d2e Martin Povišer    2022-09-16  550  			      <0x2 0x38300000 0x0 0x30000>;
8a3df85ad87d2e Martin Povišer    2022-09-16  551  
8a3df85ad87d2e Martin Povišer    2022-09-16  552  			interrupt-parent = <&aic>;
8a3df85ad87d2e Martin Povišer    2022-09-16  553  			interrupts = <AIC_IRQ 619 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16  554  				     <AIC_IRQ 620 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16  555  				     <AIC_IRQ 621 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16  556  				     <AIC_IRQ 622 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16  557  				     <AIC_IRQ 623 IRQ_TYPE_LEVEL_HIGH>,
8a3df85ad87d2e Martin Povišer    2022-09-16  558  				     <AIC_IRQ 624 IRQ_TYPE_LEVEL_HIGH>;
8a3df85ad87d2e Martin Povišer    2022-09-16  559  
8a3df85ad87d2e Martin Povišer    2022-09-16  560  			resets = <&ps_audio_p>;
8a3df85ad87d2e Martin Povišer    2022-09-16  561  			clocks = <&nco 0>, <&nco 1>, <&nco 2>,
8a3df85ad87d2e Martin Povišer    2022-09-16  562  				 <&nco 3>, <&nco 4>, <&nco 4>;
8a3df85ad87d2e Martin Povišer    2022-09-16  563  			power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
8a3df85ad87d2e Martin Povišer    2022-09-16  564  					<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
8a3df85ad87d2e Martin Povišer    2022-09-16  565  			dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
8a3df85ad87d2e Martin Povišer    2022-09-16  566  			       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
8a3df85ad87d2e Martin Povišer    2022-09-16  567  			       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
8a3df85ad87d2e Martin Povišer    2022-09-16  568  			       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
8a3df85ad87d2e Martin Povišer    2022-09-16  569  			       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
8a3df85ad87d2e Martin Povišer    2022-09-16  570  			       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
8a3df85ad87d2e Martin Povišer    2022-09-16  571  			dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
8a3df85ad87d2e Martin Povišer    2022-09-16  572  				"tx1a", "rx1a", "tx1b", "rx1b",
8a3df85ad87d2e Martin Povišer    2022-09-16  573  				"tx2a", "rx2a", "tx2b", "rx2b",
8a3df85ad87d2e Martin Povišer    2022-09-16  574  				"tx3a", "rx3a", "tx3b", "rx3b",
8a3df85ad87d2e Martin Povišer    2022-09-16  575  				"tx4a", "rx4a", "tx4b", "rx4b",
8a3df85ad87d2e Martin Povišer    2022-09-16  576  				"tx5a", "rx5a", "tx5b", "rx5b";
8a3df85ad87d2e Martin Povišer    2022-09-16  577  
8a3df85ad87d2e Martin Povišer    2022-09-16  578  			#sound-dai-cells = <1>;
8a3df85ad87d2e Martin Povišer    2022-09-16  579  		};
8a3df85ad87d2e Martin Povišer    2022-09-16  580  
8a3df85ad87d2e Martin Povišer    2022-09-16  581  		nco: clock-controller@23b044000 {
8a3df85ad87d2e Martin Povišer    2022-09-16  582  			compatible = "apple,t8103-nco", "apple,nco";
8a3df85ad87d2e Martin Povišer    2022-09-16  583  			reg = <0x2 0x3b044000 0x0 0x14000>;
8a3df85ad87d2e Martin Povišer    2022-09-16  584  			clocks = <&nco_clkref>;
8a3df85ad87d2e Martin Povišer    2022-09-16  585  			#clock-cells = <1>;
8a3df85ad87d2e Martin Povišer    2022-09-16  586  		};
8a3df85ad87d2e Martin Povišer    2022-09-16  587  
7d2d16ccf15d8e Hector Martin     2021-02-04  588  		aic: interrupt-controller@23b100000 {
7d2d16ccf15d8e Hector Martin     2021-02-04  589  			compatible = "apple,t8103-aic", "apple,aic";
7d2d16ccf15d8e Hector Martin     2021-02-04  590  			#interrupt-cells = <3>;
7d2d16ccf15d8e Hector Martin     2021-02-04  591  			interrupt-controller;
7d2d16ccf15d8e Hector Martin     2021-02-04  592  			reg = <0x2 0x3b100000 0x0 0x8000>;
106ba3b48a35dd Hector Martin     2021-11-24  593  			power-domains = <&ps_aic>;
1852e22b318b8d Marc Zyngier      2021-12-14  594  
1852e22b318b8d Marc Zyngier      2021-12-14  595  			affinities {
1852e22b318b8d Marc Zyngier      2021-12-14  596  				e-core-pmu-affinity {
1852e22b318b8d Marc Zyngier      2021-12-14  597  					apple,fiq-index = <AIC_CPU_PMU_E>;
3e895a6460ec38 Hector Martin     2022-05-03  598  					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
1852e22b318b8d Marc Zyngier      2021-12-14  599  				};
1852e22b318b8d Marc Zyngier      2021-12-14  600  
1852e22b318b8d Marc Zyngier      2021-12-14  601  				p-core-pmu-affinity {
1852e22b318b8d Marc Zyngier      2021-12-14  602  					apple,fiq-index = <AIC_CPU_PMU_P>;
3e895a6460ec38 Hector Martin     2022-05-03  603  					cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
1852e22b318b8d Marc Zyngier      2021-12-14  604  				};
1852e22b318b8d Marc Zyngier      2021-12-14  605  			};
106ba3b48a35dd Hector Martin     2021-11-24  606  		};
106ba3b48a35dd Hector Martin     2021-11-24  607  
106ba3b48a35dd Hector Martin     2021-11-24  608  		pmgr: power-management@23b700000 {
106ba3b48a35dd Hector Martin     2021-11-24  609  			compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
106ba3b48a35dd Hector Martin     2021-11-24  610  			#address-cells = <1>;
106ba3b48a35dd Hector Martin     2021-11-24  611  			#size-cells = <1>;
106ba3b48a35dd Hector Martin     2021-11-24  612  			reg = <0x2 0x3b700000 0 0x14000>;
7d2d16ccf15d8e Hector Martin     2021-02-04  613  		};
0a8282b831196b Mark Kettenis     2021-10-25  614  
0a8282b831196b Mark Kettenis     2021-10-25  615  		pinctrl_ap: pinctrl@23c100000 {
0a8282b831196b Mark Kettenis     2021-10-25  616  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
0a8282b831196b Mark Kettenis     2021-10-25  617  			reg = <0x2 0x3c100000 0x0 0x100000>;
106ba3b48a35dd Hector Martin     2021-11-24  618  			power-domains = <&ps_gpio>;
0a8282b831196b Mark Kettenis     2021-10-25  619  
0a8282b831196b Mark Kettenis     2021-10-25  620  			gpio-controller;
0a8282b831196b Mark Kettenis     2021-10-25  621  			#gpio-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25  622  			gpio-ranges = <&pinctrl_ap 0 0 212>;
0a8282b831196b Mark Kettenis     2021-10-25  623  			apple,npins = <212>;
0a8282b831196b Mark Kettenis     2021-10-25  624  
0a8282b831196b Mark Kettenis     2021-10-25  625  			interrupt-controller;
0668639eaf1481 Janne Grunau      2021-11-22  626  			#interrupt-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25  627  			interrupt-parent = <&aic>;
0a8282b831196b Mark Kettenis     2021-10-25  628  			interrupts = <AIC_IRQ 190 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  629  				     <AIC_IRQ 191 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  630  				     <AIC_IRQ 192 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  631  				     <AIC_IRQ 193 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  632  				     <AIC_IRQ 194 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  633  				     <AIC_IRQ 195 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  634  				     <AIC_IRQ 196 IRQ_TYPE_LEVEL_HIGH>;
0a8282b831196b Mark Kettenis     2021-10-25  635  
90458f6eec42aa Janne Grunau      2021-11-23  636  			i2c0_pins: i2c0-pins {
90458f6eec42aa Janne Grunau      2021-11-23  637  				pinmux = <APPLE_PINMUX(192, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23  638  					 <APPLE_PINMUX(188, 1)>;
0a8282b831196b Mark Kettenis     2021-10-25  639  			};
90458f6eec42aa Janne Grunau      2021-11-23  640  
90458f6eec42aa Janne Grunau      2021-11-23  641  			i2c1_pins: i2c1-pins {
90458f6eec42aa Janne Grunau      2021-11-23  642  				pinmux = <APPLE_PINMUX(201, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23  643  					 <APPLE_PINMUX(199, 1)>;
0a8282b831196b Mark Kettenis     2021-10-25  644  			};
0a8282b831196b Mark Kettenis     2021-10-25  645  
90458f6eec42aa Janne Grunau      2021-11-23  646  			i2c2_pins: i2c2-pins {
90458f6eec42aa Janne Grunau      2021-11-23  647  				pinmux = <APPLE_PINMUX(163, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23  648  					 <APPLE_PINMUX(162, 1)>;
90458f6eec42aa Janne Grunau      2021-11-23  649  			};
0a8282b831196b Mark Kettenis     2021-10-25  650  
90458f6eec42aa Janne Grunau      2021-11-23  651  			i2c3_pins: i2c3-pins {
90458f6eec42aa Janne Grunau      2021-11-23  652  				pinmux = <APPLE_PINMUX(73, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23  653  					 <APPLE_PINMUX(72, 1)>;
90458f6eec42aa Janne Grunau      2021-11-23  654  			};
0a8282b831196b Mark Kettenis     2021-10-25  655  
90458f6eec42aa Janne Grunau      2021-11-23  656  			i2c4_pins: i2c4-pins {
90458f6eec42aa Janne Grunau      2021-11-23  657  				pinmux = <APPLE_PINMUX(135, 1)>,
90458f6eec42aa Janne Grunau      2021-11-23  658  					 <APPLE_PINMUX(134, 1)>;
90458f6eec42aa Janne Grunau      2021-11-23  659  			};
90458f6eec42aa Janne Grunau      2021-11-23  660  
0a8282b831196b Mark Kettenis     2021-10-25  661  			pcie_pins: pcie-pins {
0a8282b831196b Mark Kettenis     2021-10-25  662  				pinmux = <APPLE_PINMUX(150, 1)>,
0a8282b831196b Mark Kettenis     2021-10-25  663  					 <APPLE_PINMUX(151, 1)>,
0a8282b831196b Mark Kettenis     2021-10-25  664  					 <APPLE_PINMUX(32, 1)>;
0a8282b831196b Mark Kettenis     2021-10-25  665  			};
0a8282b831196b Mark Kettenis     2021-10-25  666  		};
0a8282b831196b Mark Kettenis     2021-10-25  667  
0a8282b831196b Mark Kettenis     2021-10-25  668  		pinctrl_nub: pinctrl@23d1f0000 {
0a8282b831196b Mark Kettenis     2021-10-25  669  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
0a8282b831196b Mark Kettenis     2021-10-25  670  			reg = <0x2 0x3d1f0000 0x0 0x4000>;
106ba3b48a35dd Hector Martin     2021-11-24  671  			power-domains = <&ps_nub_gpio>;
0a8282b831196b Mark Kettenis     2021-10-25  672  
0a8282b831196b Mark Kettenis     2021-10-25  673  			gpio-controller;
0a8282b831196b Mark Kettenis     2021-10-25  674  			#gpio-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25  675  			gpio-ranges = <&pinctrl_nub 0 0 23>;
0a8282b831196b Mark Kettenis     2021-10-25  676  			apple,npins = <23>;
0a8282b831196b Mark Kettenis     2021-10-25  677  
0a8282b831196b Mark Kettenis     2021-10-25  678  			interrupt-controller;
0668639eaf1481 Janne Grunau      2021-11-22  679  			#interrupt-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25  680  			interrupt-parent = <&aic>;
0a8282b831196b Mark Kettenis     2021-10-25  681  			interrupts = <AIC_IRQ 330 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  682  				     <AIC_IRQ 331 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  683  				     <AIC_IRQ 332 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  684  				     <AIC_IRQ 333 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  685  				     <AIC_IRQ 334 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  686  				     <AIC_IRQ 335 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  687  				     <AIC_IRQ 336 IRQ_TYPE_LEVEL_HIGH>;
0a8282b831196b Mark Kettenis     2021-10-25  688  		};
0a8282b831196b Mark Kettenis     2021-10-25  689  
8adf987ce08275 Hector Martin     2021-12-12  690  		pmgr_mini: power-management@23d280000 {
8adf987ce08275 Hector Martin     2021-12-12  691  			compatible = "apple,t8103-pmgr", "apple,pmgr", "syscon", "simple-mfd";
8adf987ce08275 Hector Martin     2021-12-12  692  			#address-cells = <1>;
8adf987ce08275 Hector Martin     2021-12-12  693  			#size-cells = <1>;
8adf987ce08275 Hector Martin     2021-12-12  694  			reg = <0x2 0x3d280000 0 0x4000>;
8adf987ce08275 Hector Martin     2021-12-12  695  		};
8adf987ce08275 Hector Martin     2021-12-12  696  
b4d11106d751a4 Sven Peter        2021-12-11  697  		wdt: watchdog@23d2b0000 {
b4d11106d751a4 Sven Peter        2021-12-11  698  			compatible = "apple,t8103-wdt", "apple,wdt";
b4d11106d751a4 Sven Peter        2021-12-11  699  			reg = <0x2 0x3d2b0000 0x0 0x4000>;
57337b25244212 Hector Martin     2021-10-05  700  			clocks = <&clkref>;
b4d11106d751a4 Sven Peter        2021-12-11  701  			interrupt-parent = <&aic>;
b4d11106d751a4 Sven Peter        2021-12-11  702  			interrupts = <AIC_IRQ 338 IRQ_TYPE_LEVEL_HIGH>;
b4d11106d751a4 Sven Peter        2021-12-11  703  		};
b4d11106d751a4 Sven Peter        2021-12-11  704  
0a8282b831196b Mark Kettenis     2021-10-25  705  		pinctrl_smc: pinctrl@23e820000 {
0a8282b831196b Mark Kettenis     2021-10-25  706  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
0a8282b831196b Mark Kettenis     2021-10-25  707  			reg = <0x2 0x3e820000 0x0 0x4000>;
0a8282b831196b Mark Kettenis     2021-10-25  708  
0a8282b831196b Mark Kettenis     2021-10-25  709  			gpio-controller;
0a8282b831196b Mark Kettenis     2021-10-25  710  			#gpio-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25  711  			gpio-ranges = <&pinctrl_smc 0 0 16>;
0a8282b831196b Mark Kettenis     2021-10-25  712  			apple,npins = <16>;
0a8282b831196b Mark Kettenis     2021-10-25  713  
0a8282b831196b Mark Kettenis     2021-10-25  714  			interrupt-controller;
0668639eaf1481 Janne Grunau      2021-11-22  715  			#interrupt-cells = <2>;
0a8282b831196b Mark Kettenis     2021-10-25  716  			interrupt-parent = <&aic>;
0a8282b831196b Mark Kettenis     2021-10-25  717  			interrupts = <AIC_IRQ 391 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  718  				     <AIC_IRQ 392 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  719  				     <AIC_IRQ 393 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  720  				     <AIC_IRQ 394 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  721  				     <AIC_IRQ 395 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  722  				     <AIC_IRQ 396 IRQ_TYPE_LEVEL_HIGH>,
0a8282b831196b Mark Kettenis     2021-10-25  723  				     <AIC_IRQ 397 IRQ_TYPE_LEVEL_HIGH>;
0a8282b831196b Mark Kettenis     2021-10-25  724  		};
ff2a8d91d80c54 Mark Kettenis     2021-10-25  725  
8adf987ce08275 Hector Martin     2021-12-12  726  		pinctrl_aop: pinctrl@24a820000 {
8adf987ce08275 Hector Martin     2021-12-12  727  			compatible = "apple,t8103-pinctrl", "apple,pinctrl";
8adf987ce08275 Hector Martin     2021-12-12  728  			reg = <0x2 0x4a820000 0x0 0x4000>;
8adf987ce08275 Hector Martin     2021-12-12  729  
8adf987ce08275 Hector Martin     2021-12-12  730  			gpio-controller;
8adf987ce08275 Hector Martin     2021-12-12  731  			#gpio-cells = <2>;
8adf987ce08275 Hector Martin     2021-12-12  732  			gpio-ranges = <&pinctrl_aop 0 0 42>;
8adf987ce08275 Hector Martin     2021-12-12  733  			apple,npins = <42>;
8adf987ce08275 Hector Martin     2021-12-12  734  
8adf987ce08275 Hector Martin     2021-12-12  735  			interrupt-controller;
8adf987ce08275 Hector Martin     2021-12-12  736  			#interrupt-cells = <2>;
8adf987ce08275 Hector Martin     2021-12-12  737  			interrupt-parent = <&aic>;
8adf987ce08275 Hector Martin     2021-12-12  738  			interrupts = <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12  739  				     <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12  740  				     <AIC_IRQ 270 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12  741  				     <AIC_IRQ 271 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12  742  				     <AIC_IRQ 272 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12  743  				     <AIC_IRQ 273 IRQ_TYPE_LEVEL_HIGH>,
8adf987ce08275 Hector Martin     2021-12-12  744  				     <AIC_IRQ 274 IRQ_TYPE_LEVEL_HIGH>;
8adf987ce08275 Hector Martin     2021-12-12  745  		};
8adf987ce08275 Hector Martin     2021-12-12  746  
5316d73ba81b5d Sven Peter        2022-06-02  747  		ans_mbox: mbox@277408000 {
5316d73ba81b5d Sven Peter        2022-06-02  748  			compatible = "apple,t8103-asc-mailbox", "apple,asc-mailbox-v4";
5316d73ba81b5d Sven Peter        2022-06-02  749  			reg = <0x2 0x77408000 0x0 0x4000>;
5316d73ba81b5d Sven Peter        2022-06-02  750  			interrupt-parent = <&aic>;
5316d73ba81b5d Sven Peter        2022-06-02  751  			interrupts = <AIC_IRQ 583 IRQ_TYPE_LEVEL_HIGH>,
5316d73ba81b5d Sven Peter        2022-06-02  752  				<AIC_IRQ 584 IRQ_TYPE_LEVEL_HIGH>,
5316d73ba81b5d Sven Peter        2022-06-02  753  				<AIC_IRQ 585 IRQ_TYPE_LEVEL_HIGH>,
5316d73ba81b5d Sven Peter        2022-06-02  754  				<AIC_IRQ 586 IRQ_TYPE_LEVEL_HIGH>;
5316d73ba81b5d Sven Peter        2022-06-02  755  			interrupt-names = "send-empty", "send-not-empty",
5316d73ba81b5d Sven Peter        2022-06-02  756  				"recv-empty", "recv-not-empty";
5316d73ba81b5d Sven Peter        2022-06-02  757  			#mbox-cells = <0>;
5316d73ba81b5d Sven Peter        2022-06-02  758  			power-domains = <&ps_ans2>;
5316d73ba81b5d Sven Peter        2022-06-02  759  		};
5316d73ba81b5d Sven Peter        2022-06-02  760  
5316d73ba81b5d Sven Peter        2022-06-02  761  		sart: iommu@27bc50000 {
5316d73ba81b5d Sven Peter        2022-06-02  762  			compatible = "apple,t8103-sart";
5316d73ba81b5d Sven Peter        2022-06-02  763  			reg = <0x2 0x7bc50000 0x0 0x10000>;
5316d73ba81b5d Sven Peter        2022-06-02  764  			power-domains = <&ps_ans2>;
5316d73ba81b5d Sven Peter        2022-06-02  765  		};
5316d73ba81b5d Sven Peter        2022-06-02  766  
5316d73ba81b5d Sven Peter        2022-06-02  767  		nvme@27bcc0000 {
5316d73ba81b5d Sven Peter        2022-06-02  768  			compatible = "apple,t8103-nvme-ans2", "apple,nvme-ans2";
5316d73ba81b5d Sven Peter        2022-06-02  769  			reg = <0x2 0x7bcc0000 0x0 0x40000>,
5316d73ba81b5d Sven Peter        2022-06-02  770  				<0x2 0x77400000 0x0 0x4000>;
5316d73ba81b5d Sven Peter        2022-06-02  771  			reg-names = "nvme", "ans";
5316d73ba81b5d Sven Peter        2022-06-02  772  			interrupt-parent = <&aic>;
5316d73ba81b5d Sven Peter        2022-06-02  773  			interrupts = <AIC_IRQ 590 IRQ_TYPE_LEVEL_HIGH>;
5316d73ba81b5d Sven Peter        2022-06-02  774  			mboxes = <&ans_mbox>;
5316d73ba81b5d Sven Peter        2022-06-02  775  			apple,sart = <&sart>;
5316d73ba81b5d Sven Peter        2022-06-02  776  			power-domains = <&ps_ans2>, <&ps_apcie_st>;
5316d73ba81b5d Sven Peter        2022-06-02  777  			power-domain-names = "ans", "apcie0";
5316d73ba81b5d Sven Peter        2022-06-02  778  			resets = <&ps_ans2>;
5316d73ba81b5d Sven Peter        2022-06-02  779  		};
5316d73ba81b5d Sven Peter        2022-06-02  780  
56d32c51dffac8 Janne Grunau      2022-12-06  781  		pcie0_dart_0: iommu@681008000 {
3c866bb79577ed Marc Zyngier      2021-10-25  782  			compatible = "apple,t8103-dart";
3c866bb79577ed Marc Zyngier      2021-10-25  783  			reg = <0x6 0x81008000 0x0 0x4000>;
3c866bb79577ed Marc Zyngier      2021-10-25  784  			#iommu-cells = <1>;
3c866bb79577ed Marc Zyngier      2021-10-25  785  			interrupt-parent = <&aic>;
3c866bb79577ed Marc Zyngier      2021-10-25  786  			interrupts = <AIC_IRQ 696 IRQ_TYPE_LEVEL_HIGH>;
106ba3b48a35dd Hector Martin     2021-11-24  787  			power-domains = <&ps_apcie_gp>;
3c866bb79577ed Marc Zyngier      2021-10-25  788  		};
3c866bb79577ed Marc Zyngier      2021-10-25  789  
56d32c51dffac8 Janne Grunau      2022-12-06  790  		pcie0_dart_1: iommu@682008000 {
3c866bb79577ed Marc Zyngier      2021-10-25  791  			compatible = "apple,t8103-dart";
3c866bb79577ed Marc Zyngier      2021-10-25  792  			reg = <0x6 0x82008000 0x0 0x4000>;
3c866bb79577ed Marc Zyngier      2021-10-25  793  			#iommu-cells = <1>;
3c866bb79577ed Marc Zyngier      2021-10-25  794  			interrupt-parent = <&aic>;
3c866bb79577ed Marc Zyngier      2021-10-25  795  			interrupts = <AIC_IRQ 699 IRQ_TYPE_LEVEL_HIGH>;
106ba3b48a35dd Hector Martin     2021-11-24  796  			power-domains = <&ps_apcie_gp>;
a0189fdfb73dac Janne Grunau      2023-02-14  797  			status = "disabled";
3c866bb79577ed Marc Zyngier      2021-10-25  798  		};
3c866bb79577ed Marc Zyngier      2021-10-25  799  
56d32c51dffac8 Janne Grunau      2022-12-06  800  		pcie0_dart_2: iommu@683008000 {
3c866bb79577ed Marc Zyngier      2021-10-25  801  			compatible = "apple,t8103-dart";
3c866bb79577ed Marc Zyngier      2021-10-25  802  			reg = <0x6 0x83008000 0x0 0x4000>;
3c866bb79577ed Marc Zyngier      2021-10-25  803  			#iommu-cells = <1>;
3c866bb79577ed Marc Zyngier      2021-10-25  804  			interrupt-parent = <&aic>;
3c866bb79577ed Marc Zyngier      2021-10-25  805  			interrupts = <AIC_IRQ 702 IRQ_TYPE_LEVEL_HIGH>;
106ba3b48a35dd Hector Martin     2021-11-24  806  			power-domains = <&ps_apcie_gp>;
a0189fdfb73dac Janne Grunau      2023-02-14  807  			status = "disabled";
3c866bb79577ed Marc Zyngier      2021-10-25  808  		};
3c866bb79577ed Marc Zyngier      2021-10-25  809  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  810  		pcie0: pcie@690000000 {
ff2a8d91d80c54 Mark Kettenis     2021-10-25  811  			compatible = "apple,t8103-pcie", "apple,pcie";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  812  			device_type = "pci";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  813  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  814  			reg = <0x6 0x90000000 0x0 0x1000000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  815  			      <0x6 0x80000000 0x0 0x100000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  816  			      <0x6 0x81000000 0x0 0x4000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  817  			      <0x6 0x82000000 0x0 0x4000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  818  			      <0x6 0x83000000 0x0 0x4000>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  819  			reg-names = "config", "rc", "port0", "port1", "port2";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  820  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  821  			interrupt-parent = <&aic>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  822  			interrupts = <AIC_IRQ 695 IRQ_TYPE_LEVEL_HIGH>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  823  				     <AIC_IRQ 698 IRQ_TYPE_LEVEL_HIGH>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  824  				     <AIC_IRQ 701 IRQ_TYPE_LEVEL_HIGH>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  825  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  826  			msi-controller;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  827  			msi-parent = <&pcie0>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  828  			msi-ranges = <&aic AIC_IRQ 704 IRQ_TYPE_EDGE_RISING 32>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  829  
3c866bb79577ed Marc Zyngier      2021-10-25  830  
3c866bb79577ed Marc Zyngier      2021-10-25  831  			iommu-map = <0x100 &pcie0_dart_0 1 1>,
3c866bb79577ed Marc Zyngier      2021-10-25  832  				    <0x200 &pcie0_dart_1 1 1>,
3c866bb79577ed Marc Zyngier      2021-10-25  833  				    <0x300 &pcie0_dart_2 1 1>;
3c866bb79577ed Marc Zyngier      2021-10-25  834  			iommu-map-mask = <0xff00>;
3c866bb79577ed Marc Zyngier      2021-10-25  835  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  836  			bus-range = <0 3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  837  			#address-cells = <3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  838  			#size-cells = <2>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  839  			ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
ff2a8d91d80c54 Mark Kettenis     2021-10-25  840  				 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  841  
106ba3b48a35dd Hector Martin     2021-11-24  842  			power-domains = <&ps_apcie_gp>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  843  			pinctrl-0 = <&pcie_pins>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  844  			pinctrl-names = "default";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  845  
128888a6fdb695 Marc Zyngier      2021-10-25  846  			port00: pci@0,0 {
ff2a8d91d80c54 Mark Kettenis     2021-10-25  847  				device_type = "pci";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  848  				reg = <0x0 0x0 0x0 0x0 0x0>;
5b970dfcfee9e0 Marc Zyngier      2021-11-23  849  				reset-gpios = <&pinctrl_ap 152 GPIO_ACTIVE_LOW>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  850  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  851  				#address-cells = <3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  852  				#size-cells = <2>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  853  				ranges;
128888a6fdb695 Marc Zyngier      2021-10-25  854  
128888a6fdb695 Marc Zyngier      2021-10-25  855  				interrupt-controller;
128888a6fdb695 Marc Zyngier      2021-10-25  856  				#interrupt-cells = <1>;
128888a6fdb695 Marc Zyngier      2021-10-25  857  
128888a6fdb695 Marc Zyngier      2021-10-25  858  				interrupt-map-mask = <0 0 0 7>;
128888a6fdb695 Marc Zyngier      2021-10-25  859  				interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
128888a6fdb695 Marc Zyngier      2021-10-25  860  						<0 0 0 2 &port00 0 0 0 1>,
128888a6fdb695 Marc Zyngier      2021-10-25  861  						<0 0 0 3 &port00 0 0 0 2>,
128888a6fdb695 Marc Zyngier      2021-10-25  862  						<0 0 0 4 &port00 0 0 0 3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  863  			};
ff2a8d91d80c54 Mark Kettenis     2021-10-25  864  
128888a6fdb695 Marc Zyngier      2021-10-25  865  			port01: pci@1,0 {
ff2a8d91d80c54 Mark Kettenis     2021-10-25  866  				device_type = "pci";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  867  				reg = <0x800 0x0 0x0 0x0 0x0>;
5b970dfcfee9e0 Marc Zyngier      2021-11-23  868  				reset-gpios = <&pinctrl_ap 153 GPIO_ACTIVE_LOW>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  869  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  870  				#address-cells = <3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  871  				#size-cells = <2>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  872  				ranges;
128888a6fdb695 Marc Zyngier      2021-10-25  873  
128888a6fdb695 Marc Zyngier      2021-10-25  874  				interrupt-controller;
128888a6fdb695 Marc Zyngier      2021-10-25  875  				#interrupt-cells = <1>;
128888a6fdb695 Marc Zyngier      2021-10-25  876  
128888a6fdb695 Marc Zyngier      2021-10-25  877  				interrupt-map-mask = <0 0 0 7>;
128888a6fdb695 Marc Zyngier      2021-10-25  878  				interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
128888a6fdb695 Marc Zyngier      2021-10-25  879  						<0 0 0 2 &port01 0 0 0 1>,
128888a6fdb695 Marc Zyngier      2021-10-25  880  						<0 0 0 3 &port01 0 0 0 2>,
128888a6fdb695 Marc Zyngier      2021-10-25  881  						<0 0 0 4 &port01 0 0 0 3>;
a0189fdfb73dac Janne Grunau      2023-02-14  882  				status = "disabled";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  883  			};
ff2a8d91d80c54 Mark Kettenis     2021-10-25  884  
128888a6fdb695 Marc Zyngier      2021-10-25  885  			port02: pci@2,0 {
ff2a8d91d80c54 Mark Kettenis     2021-10-25  886  				device_type = "pci";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  887  				reg = <0x1000 0x0 0x0 0x0 0x0>;
5b970dfcfee9e0 Marc Zyngier      2021-11-23  888  				reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  889  
ff2a8d91d80c54 Mark Kettenis     2021-10-25  890  				#address-cells = <3>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  891  				#size-cells = <2>;
ff2a8d91d80c54 Mark Kettenis     2021-10-25  892  				ranges;
128888a6fdb695 Marc Zyngier      2021-10-25  893  
128888a6fdb695 Marc Zyngier      2021-10-25  894  				interrupt-controller;
128888a6fdb695 Marc Zyngier      2021-10-25  895  				#interrupt-cells = <1>;
128888a6fdb695 Marc Zyngier      2021-10-25  896  
128888a6fdb695 Marc Zyngier      2021-10-25  897  				interrupt-map-mask = <0 0 0 7>;
128888a6fdb695 Marc Zyngier      2021-10-25  898  				interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
128888a6fdb695 Marc Zyngier      2021-10-25  899  						<0 0 0 2 &port02 0 0 0 1>,
128888a6fdb695 Marc Zyngier      2021-10-25  900  						<0 0 0 3 &port02 0 0 0 2>,
128888a6fdb695 Marc Zyngier      2021-10-25  901  						<0 0 0 4 &port02 0 0 0 3>;
a0189fdfb73dac Janne Grunau      2023-02-14  902  				status = "disabled";
ff2a8d91d80c54 Mark Kettenis     2021-10-25  903  			};
ff2a8d91d80c54 Mark Kettenis     2021-10-25  904  		};
7d2d16ccf15d8e Hector Martin     2021-02-04  905  	};
7d2d16ccf15d8e Hector Martin     2021-02-04  906  };
106ba3b48a35dd Hector Martin     2021-11-24  907  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
