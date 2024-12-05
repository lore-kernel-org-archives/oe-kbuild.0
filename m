Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE24C49627
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Dec 2024 23:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733442744; cv=none; b=rwVciz8teDs/opB5g/KOU1qd58KdPD6XgTpJny6lu9iy96DbuI1aGTKUp+P+NMre5+d/2EPy7FKGj0gwUHxvz7bW1nJdV8oEE0mLN9a34DUhl1+6qI7NhAwRjU7Xv61X4kZDSiGfUe0w76Y0b2kZZDA7yFE0yM2MhfxvekgZPOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733442744; c=relaxed/simple;
	bh=mXoGe7VkDqSxtaOPrb+6WED5bvl3Te27G6pZuj3oL1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NnTIqe/eTZ+JLq3NGbuWR+t7V/xxO5gnKRKm4o31R4EFZCpkZRp22WXmM14H2LW3Y1mIYPEYnmaUD6NTy21hU7jlkmMtgN9/DnabpSw0S4NHvk36ZWffNUPoJb1az1zySQzGnF/iXRqYh4wRT5wOJ4ZOSk5hidRj7PuqMNWWrVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8Mdkvn/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8Mdkvn/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733442738; x=1764978738;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=mXoGe7VkDqSxtaOPrb+6WED5bvl3Te27G6pZuj3oL1g=;
  b=m8Mdkvn/GVff0genhydNqeTbP7QEVPuvmqIYcWdY32jAPLc+aTVkDmor
   cVh3YDNd+iiYlpHE+eckfWiFKM+zy6Tmq4WfaA/KV7AS5hzALwwl7H+YO
   ueQwwx9jMqndFeLKAXCsMS7ppbQkonW1vIeU73slUHuP7vpl0lYz+PtNK
   hO0vJorwnR7dhC5A2e/kqp09rqqHq2HntC+bTQHs/9V7X33XHI37Pf2aR
   A5y+ueA7mBGrMaYnnKAifn9NCX+SnElZMyOlFIUpjg7Yb5W1iUXW/Fn1q
   TuwoTLvo4nvX77cR8EhYRaX8h/sbim2WQIcTtx+Kz2ontoDpV9Hj/jvJ5
   g==;
X-CSE-ConnectionGUID: DTeINUesTK61P73Ay4TpEg==
X-CSE-MsgGUID: oquH5EDpQAWY6RvfC/K4vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="59186366"
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="59186366"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 15:52:15 -0800
X-CSE-ConnectionGUID: i9k+pCUxSESk/b9lWeVYBA==
X-CSE-MsgGUID: sp3JV5xTTBGSYpp8uXfU2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,211,1728975600"; 
   d="scan'208";a="125083407"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 05 Dec 2024 15:52:14 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJLdj-0000Ud-09;
	Thu, 05 Dec 2024 23:52:11 +0000
Date: Fri, 6 Dec 2024 07:51:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 09/10] arm64: dts: renesas: r8a779h0: Add display
 support
Message-ID: <202412060726.2OCUB17h-lkp@intel.com>
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
In-Reply-To: <20241205-rcar-gh-dsi-v2-9-42471851df86@ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-9-42471851df86@ideasonboard.com>
TO: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
TO: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
TO: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
TO: Andrzej Hajda <andrzej.hajda@intel.com>
TO: Neil Armstrong <neil.armstrong@linaro.org>
TO: Robert Foss <rfoss@kernel.org>
TO: Jonas Karlman <jonas@kwiboo.se>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: LUU HOAI <hoai.luu.ub@renesas.com>
TO: Jagan Teki <jagan@amarulasolutions.com>
TO: Sam Ravnborg <sam@ravnborg.org>
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: dri-devel@lists.freedesktop.org
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Hi Tomi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on adc218676eef25575469234709c2d87185ca223a]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomi-Valkeinen/drm-rcar-du-dsi-Fix-PHY-lock-bit-check/20241205-220145
base:   adc218676eef25575469234709c2d87185ca223a
patch link:    https://lore.kernel.org/r/20241205-rcar-gh-dsi-v2-9-42471851df86%40ideasonboard.com
patch subject: [PATCH v2 09/10] arm64: dts: renesas: r8a779h0: Add display support
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-randconfig-002 (https://download.01.org/0day-ci/archive/20241206/202412060726.2OCUB17h-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412060726.2OCUB17h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412060726.2OCUB17h-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1056.12-1066.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1085.12-1095.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1114.12-1124.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1143.12-1153.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1172.12-1182.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1201.12-1211.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1230.12-1240.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1259.12-1269.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1862.10-1872.6: Warning (graph_child_address): /soc/display@feb00000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779h0.dtsi:1889.12-1899.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +1862 arch/arm64/boot/dts/renesas/r8a779h0.dtsi

227ec979581047b Hai Pham           2024-01-25    11  
227ec979581047b Hai Pham           2024-01-25    12  / {
227ec979581047b Hai Pham           2024-01-25    13  	compatible = "renesas,r8a779h0";
227ec979581047b Hai Pham           2024-01-25    14  	#address-cells = <2>;
227ec979581047b Hai Pham           2024-01-25    15  	#size-cells = <2>;
227ec979581047b Hai Pham           2024-01-25    16  
07e777318911d76 Kuninori Morimoto  2024-06-24    17  	/* External Audio clock - to be overridden by boards that provide it */
07e777318911d76 Kuninori Morimoto  2024-06-24    18  	audio_clkin: audio_clkin {
07e777318911d76 Kuninori Morimoto  2024-06-24    19  		compatible = "fixed-clock";
07e777318911d76 Kuninori Morimoto  2024-06-24    20  		#clock-cells = <0>;
07e777318911d76 Kuninori Morimoto  2024-06-24    21  		clock-frequency = <0>;
07e777318911d76 Kuninori Morimoto  2024-06-24    22  	};
07e777318911d76 Kuninori Morimoto  2024-06-24    23  
b3749d434ea48cc Duy Nguyen         2024-08-01    24  	/* External CAN clock - to be overridden by boards that provide it */
b3749d434ea48cc Duy Nguyen         2024-08-01    25  	can_clk: can-clk {
b3749d434ea48cc Duy Nguyen         2024-08-01    26  		compatible = "fixed-clock";
b3749d434ea48cc Duy Nguyen         2024-08-01    27  		#clock-cells = <0>;
b3749d434ea48cc Duy Nguyen         2024-08-01    28  		clock-frequency = <0>;
b3749d434ea48cc Duy Nguyen         2024-08-01    29  	};
b3749d434ea48cc Duy Nguyen         2024-08-01    30  
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    31  	cluster0_opp: opp-table-0 {
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    32  		compatible = "operating-points-v2";
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    33  
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    34  		opp-500000000 {
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    35  			opp-hz = /bits/ 64 <500000000>;
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    36  			opp-microvolt = <825000>;
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    37  			clock-latency-ns = <500000>;
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    38  		};
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    39  		opp-1000000000 {
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    40  			opp-hz = /bits/ 64 <1000000000>;
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    41  			opp-microvolt = <825000>;
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    42  			clock-latency-ns = <500000>;
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    43  		};
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    44  	};
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    45  
227ec979581047b Hai Pham           2024-01-25    46  	cpus {
227ec979581047b Hai Pham           2024-01-25    47  		#address-cells = <1>;
227ec979581047b Hai Pham           2024-01-25    48  		#size-cells = <0>;
227ec979581047b Hai Pham           2024-01-25    49  
5db13ece46d6948 Duy Nguyen         2024-02-01    50  		cpu-map {
5db13ece46d6948 Duy Nguyen         2024-02-01    51  			cluster0 {
5db13ece46d6948 Duy Nguyen         2024-02-01    52  				core0 {
5db13ece46d6948 Duy Nguyen         2024-02-01    53  					cpu = <&a76_0>;
5db13ece46d6948 Duy Nguyen         2024-02-01    54  				};
5db13ece46d6948 Duy Nguyen         2024-02-01    55  				core1 {
5db13ece46d6948 Duy Nguyen         2024-02-01    56  					cpu = <&a76_1>;
5db13ece46d6948 Duy Nguyen         2024-02-01    57  				};
5db13ece46d6948 Duy Nguyen         2024-02-01    58  				core2 {
5db13ece46d6948 Duy Nguyen         2024-02-01    59  					cpu = <&a76_2>;
5db13ece46d6948 Duy Nguyen         2024-02-01    60  				};
5db13ece46d6948 Duy Nguyen         2024-02-01    61  				core3 {
5db13ece46d6948 Duy Nguyen         2024-02-01    62  					cpu = <&a76_3>;
5db13ece46d6948 Duy Nguyen         2024-02-01    63  				};
5db13ece46d6948 Duy Nguyen         2024-02-01    64  			};
5db13ece46d6948 Duy Nguyen         2024-02-01    65  		};
5db13ece46d6948 Duy Nguyen         2024-02-01    66  
227ec979581047b Hai Pham           2024-01-25    67  		a76_0: cpu@0 {
227ec979581047b Hai Pham           2024-01-25    68  			compatible = "arm,cortex-a76";
227ec979581047b Hai Pham           2024-01-25    69  			reg = <0>;
227ec979581047b Hai Pham           2024-01-25    70  			device_type = "cpu";
227ec979581047b Hai Pham           2024-01-25    71  			power-domains = <&sysc R8A779H0_PD_A1E0D0C0>;
20a942d60b34719 Duy Nguyen         2024-02-01    72  			next-level-cache = <&L3_CA76>;
5db13ece46d6948 Duy Nguyen         2024-02-01    73  			enable-method = "psci";
ad761924be2b335 Duy Nguyen         2024-02-01    74  			cpu-idle-states = <&CPU_SLEEP_0>;
4c1fd23a220dcca Duy Nguyen         2024-02-01    75  			clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC0>;
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    76  			operating-points-v2 = <&cluster0_opp>;
5db13ece46d6948 Duy Nguyen         2024-02-01    77  		};
5db13ece46d6948 Duy Nguyen         2024-02-01    78  
5db13ece46d6948 Duy Nguyen         2024-02-01    79  		a76_1: cpu@100 {
5db13ece46d6948 Duy Nguyen         2024-02-01    80  			compatible = "arm,cortex-a76";
5db13ece46d6948 Duy Nguyen         2024-02-01    81  			reg = <0x100>;
5db13ece46d6948 Duy Nguyen         2024-02-01    82  			device_type = "cpu";
5db13ece46d6948 Duy Nguyen         2024-02-01    83  			power-domains = <&sysc R8A779H0_PD_A1E0D0C1>;
5db13ece46d6948 Duy Nguyen         2024-02-01    84  			next-level-cache = <&L3_CA76>;
5db13ece46d6948 Duy Nguyen         2024-02-01    85  			enable-method = "psci";
ad761924be2b335 Duy Nguyen         2024-02-01    86  			cpu-idle-states = <&CPU_SLEEP_0>;
4c1fd23a220dcca Duy Nguyen         2024-02-01    87  			clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC1>;
6bd8b0bc444eae5 Duy Nguyen         2024-02-01    88  			operating-points-v2 = <&cluster0_opp>;
5db13ece46d6948 Duy Nguyen         2024-02-01    89  		};
5db13ece46d6948 Duy Nguyen         2024-02-01    90  
5db13ece46d6948 Duy Nguyen         2024-02-01    91  		a76_2: cpu@200 {
5db13ece46d6948 Duy Nguyen         2024-02-01    92  			compatible = "arm,cortex-a76";
5db13ece46d6948 Duy Nguyen         2024-02-01    93  			reg = <0x200>;
5db13ece46d6948 Duy Nguyen         2024-02-01    94  			device_type = "cpu";
5db13ece46d6948 Duy Nguyen         2024-02-01    95  			power-domains = <&sysc R8A779H0_PD_A1E0D0C2>;
5db13ece46d6948 Duy Nguyen         2024-02-01    96  			next-level-cache = <&L3_CA76>;
5db13ece46d6948 Duy Nguyen         2024-02-01    97  			enable-method = "psci";
ad761924be2b335 Duy Nguyen         2024-02-01    98  			cpu-idle-states = <&CPU_SLEEP_0>;
4c1fd23a220dcca Duy Nguyen         2024-02-01    99  			clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC2>;
6bd8b0bc444eae5 Duy Nguyen         2024-02-01   100  			operating-points-v2 = <&cluster0_opp>;
5db13ece46d6948 Duy Nguyen         2024-02-01   101  		};
5db13ece46d6948 Duy Nguyen         2024-02-01   102  
5db13ece46d6948 Duy Nguyen         2024-02-01   103  		a76_3: cpu@300 {
5db13ece46d6948 Duy Nguyen         2024-02-01   104  			compatible = "arm,cortex-a76";
5db13ece46d6948 Duy Nguyen         2024-02-01   105  			reg = <0x300>;
5db13ece46d6948 Duy Nguyen         2024-02-01   106  			device_type = "cpu";
5db13ece46d6948 Duy Nguyen         2024-02-01   107  			power-domains = <&sysc R8A779H0_PD_A1E0D0C3>;
5db13ece46d6948 Duy Nguyen         2024-02-01   108  			next-level-cache = <&L3_CA76>;
5db13ece46d6948 Duy Nguyen         2024-02-01   109  			enable-method = "psci";
ad761924be2b335 Duy Nguyen         2024-02-01   110  			cpu-idle-states = <&CPU_SLEEP_0>;
4c1fd23a220dcca Duy Nguyen         2024-02-01   111  			clocks = <&cpg CPG_CORE R8A779H0_CLK_ZC3>;
6bd8b0bc444eae5 Duy Nguyen         2024-02-01   112  			operating-points-v2 = <&cluster0_opp>;
ad761924be2b335 Duy Nguyen         2024-02-01   113  		};
ad761924be2b335 Duy Nguyen         2024-02-01   114  
ad761924be2b335 Duy Nguyen         2024-02-01   115  		idle-states {
ad761924be2b335 Duy Nguyen         2024-02-01   116  			entry-method = "psci";
ad761924be2b335 Duy Nguyen         2024-02-01   117  
ad761924be2b335 Duy Nguyen         2024-02-01   118  			CPU_SLEEP_0: cpu-sleep-0 {
ad761924be2b335 Duy Nguyen         2024-02-01   119  				compatible = "arm,idle-state";
ad761924be2b335 Duy Nguyen         2024-02-01   120  				arm,psci-suspend-param = <0x0010000>;
ad761924be2b335 Duy Nguyen         2024-02-01   121  				local-timer-stop;
ad761924be2b335 Duy Nguyen         2024-02-01   122  				entry-latency-us = <400>;
ad761924be2b335 Duy Nguyen         2024-02-01   123  				exit-latency-us = <500>;
ad761924be2b335 Duy Nguyen         2024-02-01   124  				min-residency-us = <4000>;
ad761924be2b335 Duy Nguyen         2024-02-01   125  			};
20a942d60b34719 Duy Nguyen         2024-02-01   126  		};
20a942d60b34719 Duy Nguyen         2024-02-01   127  
20a942d60b34719 Duy Nguyen         2024-02-01   128  		L3_CA76: cache-controller {
20a942d60b34719 Duy Nguyen         2024-02-01   129  			compatible = "cache";
20a942d60b34719 Duy Nguyen         2024-02-01   130  			power-domains = <&sysc R8A779H0_PD_A2E0D0>;
20a942d60b34719 Duy Nguyen         2024-02-01   131  			cache-unified;
20a942d60b34719 Duy Nguyen         2024-02-01   132  			cache-level = <3>;
227ec979581047b Hai Pham           2024-01-25   133  		};
227ec979581047b Hai Pham           2024-01-25   134  	};
227ec979581047b Hai Pham           2024-01-25   135  
227ec979581047b Hai Pham           2024-01-25   136  	extal_clk: extal-clk {
227ec979581047b Hai Pham           2024-01-25   137  		compatible = "fixed-clock";
227ec979581047b Hai Pham           2024-01-25   138  		#clock-cells = <0>;
227ec979581047b Hai Pham           2024-01-25   139  		/* This value must be overridden by the board */
227ec979581047b Hai Pham           2024-01-25   140  		clock-frequency = <0>;
227ec979581047b Hai Pham           2024-01-25   141  	};
227ec979581047b Hai Pham           2024-01-25   142  
227ec979581047b Hai Pham           2024-01-25   143  	extalr_clk: extalr-clk {
227ec979581047b Hai Pham           2024-01-25   144  		compatible = "fixed-clock";
227ec979581047b Hai Pham           2024-01-25   145  		#clock-cells = <0>;
227ec979581047b Hai Pham           2024-01-25   146  		/* This value must be overridden by the board */
227ec979581047b Hai Pham           2024-01-25   147  		clock-frequency = <0>;
227ec979581047b Hai Pham           2024-01-25   148  	};
227ec979581047b Hai Pham           2024-01-25   149  
227ec979581047b Hai Pham           2024-01-25   150  	pmu-a76 {
227ec979581047b Hai Pham           2024-01-25   151  		compatible = "arm,cortex-a76-pmu";
227ec979581047b Hai Pham           2024-01-25   152  		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
227ec979581047b Hai Pham           2024-01-25   153  	};
227ec979581047b Hai Pham           2024-01-25   154  
5db13ece46d6948 Duy Nguyen         2024-02-01   155  	psci {
5db13ece46d6948 Duy Nguyen         2024-02-01   156  		compatible = "arm,psci-1.0", "arm,psci-0.2";
5db13ece46d6948 Duy Nguyen         2024-02-01   157  		method = "smc";
5db13ece46d6948 Duy Nguyen         2024-02-01   158  	};
5db13ece46d6948 Duy Nguyen         2024-02-01   159  
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   160  	/* External SCIF clocks - to be overridden by boards that provide them */
227ec979581047b Hai Pham           2024-01-25   161  	scif_clk: scif-clk {
227ec979581047b Hai Pham           2024-01-25   162  		compatible = "fixed-clock";
227ec979581047b Hai Pham           2024-01-25   163  		#clock-cells = <0>;
227ec979581047b Hai Pham           2024-01-25   164  		clock-frequency = <0>;
227ec979581047b Hai Pham           2024-01-25   165  	};
227ec979581047b Hai Pham           2024-01-25   166  
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   167  	scif_clk2: scif-clk2 {
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   168  		compatible = "fixed-clock";
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   169  		#clock-cells = <0>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   170  		clock-frequency = <0>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   171  	};
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   172  
227ec979581047b Hai Pham           2024-01-25   173  	soc: soc {
227ec979581047b Hai Pham           2024-01-25   174  		compatible = "simple-bus";
227ec979581047b Hai Pham           2024-01-25   175  		interrupt-parent = <&gic>;
227ec979581047b Hai Pham           2024-01-25   176  		#address-cells = <2>;
227ec979581047b Hai Pham           2024-01-25   177  		#size-cells = <2>;
227ec979581047b Hai Pham           2024-01-25   178  		ranges;
227ec979581047b Hai Pham           2024-01-25   179  
10c353c7a289a54 Minh Le            2024-02-01   180  		rwdt: watchdog@e6020000 {
10c353c7a289a54 Minh Le            2024-02-01   181  			compatible = "renesas,r8a779h0-wdt",
10c353c7a289a54 Minh Le            2024-02-01   182  				     "renesas,rcar-gen4-wdt";
10c353c7a289a54 Minh Le            2024-02-01   183  			reg = <0 0xe6020000 0 0x0c>;
10c353c7a289a54 Minh Le            2024-02-01   184  			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
10c353c7a289a54 Minh Le            2024-02-01   185  			clocks = <&cpg CPG_MOD 907>;
10c353c7a289a54 Minh Le            2024-02-01   186  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
10c353c7a289a54 Minh Le            2024-02-01   187  			resets = <&cpg 907>;
10c353c7a289a54 Minh Le            2024-02-01   188  			status = "disabled";
10c353c7a289a54 Minh Le            2024-02-01   189  		};
10c353c7a289a54 Minh Le            2024-02-01   190  
9a1442efd1f2711 Hai Pham           2024-01-26   191  		pfc: pinctrl@e6050000 {
9a1442efd1f2711 Hai Pham           2024-01-26   192  			compatible = "renesas,pfc-r8a779h0";
9a1442efd1f2711 Hai Pham           2024-01-26   193  			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
9a1442efd1f2711 Hai Pham           2024-01-26   194  			      <0 0xe6058000 0 0x16c>, <0 0xe6058800 0 0x16c>,
9a1442efd1f2711 Hai Pham           2024-01-26   195  			      <0 0xe6060000 0 0x16c>, <0 0xe6060800 0 0x16c>,
9a1442efd1f2711 Hai Pham           2024-01-26   196  			      <0 0xe6061000 0 0x16c>, <0 0xe6061800 0 0x16c>;
9a1442efd1f2711 Hai Pham           2024-01-26   197  		};
9a1442efd1f2711 Hai Pham           2024-01-26   198  
93e28f88710b2cb Cong Dang          2024-02-01   199  		gpio0: gpio@e6050180 {
93e28f88710b2cb Cong Dang          2024-02-01   200  			compatible = "renesas,gpio-r8a779h0",
93e28f88710b2cb Cong Dang          2024-02-01   201  				     "renesas,rcar-gen4-gpio";
93e28f88710b2cb Cong Dang          2024-02-01   202  			reg = <0 0xe6050180 0 0x54>;
93e28f88710b2cb Cong Dang          2024-02-01   203  			interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH>;
93e28f88710b2cb Cong Dang          2024-02-01   204  			#gpio-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   205  			gpio-controller;
93e28f88710b2cb Cong Dang          2024-02-01   206  			gpio-ranges = <&pfc 0 0 19>;
93e28f88710b2cb Cong Dang          2024-02-01   207  			#interrupt-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   208  			interrupt-controller;
93e28f88710b2cb Cong Dang          2024-02-01   209  			clocks = <&cpg CPG_MOD 915>;
93e28f88710b2cb Cong Dang          2024-02-01   210  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
93e28f88710b2cb Cong Dang          2024-02-01   211  			resets = <&cpg 915>;
93e28f88710b2cb Cong Dang          2024-02-01   212  		};
93e28f88710b2cb Cong Dang          2024-02-01   213  
93e28f88710b2cb Cong Dang          2024-02-01   214  		gpio1: gpio@e6050980 {
93e28f88710b2cb Cong Dang          2024-02-01   215  			compatible = "renesas,gpio-r8a779h0",
93e28f88710b2cb Cong Dang          2024-02-01   216  				     "renesas,rcar-gen4-gpio";
93e28f88710b2cb Cong Dang          2024-02-01   217  			reg = <0 0xe6050980 0 0x54>;
93e28f88710b2cb Cong Dang          2024-02-01   218  			interrupts = <GIC_SPI 623 IRQ_TYPE_LEVEL_HIGH>;
93e28f88710b2cb Cong Dang          2024-02-01   219  			#gpio-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   220  			gpio-controller;
93e28f88710b2cb Cong Dang          2024-02-01   221  			gpio-ranges = <&pfc 0 32 30>;
93e28f88710b2cb Cong Dang          2024-02-01   222  			#interrupt-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   223  			interrupt-controller;
93e28f88710b2cb Cong Dang          2024-02-01   224  			clocks = <&cpg CPG_MOD 915>;
93e28f88710b2cb Cong Dang          2024-02-01   225  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
93e28f88710b2cb Cong Dang          2024-02-01   226  			resets = <&cpg 915>;
93e28f88710b2cb Cong Dang          2024-02-01   227  		};
93e28f88710b2cb Cong Dang          2024-02-01   228  
93e28f88710b2cb Cong Dang          2024-02-01   229  		gpio2: gpio@e6058180 {
93e28f88710b2cb Cong Dang          2024-02-01   230  			compatible = "renesas,gpio-r8a779h0",
93e28f88710b2cb Cong Dang          2024-02-01   231  				     "renesas,rcar-gen4-gpio";
93e28f88710b2cb Cong Dang          2024-02-01   232  			reg = <0 0xe6058180 0 0x54>;
93e28f88710b2cb Cong Dang          2024-02-01   233  			interrupts = <GIC_SPI 627 IRQ_TYPE_LEVEL_HIGH>;
93e28f88710b2cb Cong Dang          2024-02-01   234  			#gpio-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   235  			gpio-controller;
93e28f88710b2cb Cong Dang          2024-02-01   236  			gpio-ranges = <&pfc 0 64 20>;
93e28f88710b2cb Cong Dang          2024-02-01   237  			#interrupt-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   238  			interrupt-controller;
93e28f88710b2cb Cong Dang          2024-02-01   239  			clocks = <&cpg CPG_MOD 916>;
93e28f88710b2cb Cong Dang          2024-02-01   240  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
93e28f88710b2cb Cong Dang          2024-02-01   241  			resets = <&cpg 916>;
93e28f88710b2cb Cong Dang          2024-02-01   242  		};
93e28f88710b2cb Cong Dang          2024-02-01   243  
93e28f88710b2cb Cong Dang          2024-02-01   244  		gpio3: gpio@e6058980 {
93e28f88710b2cb Cong Dang          2024-02-01   245  			compatible = "renesas,gpio-r8a779h0",
93e28f88710b2cb Cong Dang          2024-02-01   246  				     "renesas,rcar-gen4-gpio";
93e28f88710b2cb Cong Dang          2024-02-01   247  			reg = <0 0xe6058980 0 0x54>;
93e28f88710b2cb Cong Dang          2024-02-01   248  			interrupts = <GIC_SPI 631 IRQ_TYPE_LEVEL_HIGH>;
93e28f88710b2cb Cong Dang          2024-02-01   249  			#gpio-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   250  			gpio-controller;
93e28f88710b2cb Cong Dang          2024-02-01   251  			gpio-ranges = <&pfc 0 96 32>;
93e28f88710b2cb Cong Dang          2024-02-01   252  			#interrupt-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   253  			interrupt-controller;
93e28f88710b2cb Cong Dang          2024-02-01   254  			clocks = <&cpg CPG_MOD 916>;
93e28f88710b2cb Cong Dang          2024-02-01   255  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
93e28f88710b2cb Cong Dang          2024-02-01   256  			resets = <&cpg 916>;
93e28f88710b2cb Cong Dang          2024-02-01   257  		};
93e28f88710b2cb Cong Dang          2024-02-01   258  
93e28f88710b2cb Cong Dang          2024-02-01   259  		gpio4: gpio@e6060180 {
93e28f88710b2cb Cong Dang          2024-02-01   260  			compatible = "renesas,gpio-r8a779h0",
93e28f88710b2cb Cong Dang          2024-02-01   261  				     "renesas,rcar-gen4-gpio";
93e28f88710b2cb Cong Dang          2024-02-01   262  			reg = <0 0xe6060180 0 0x54>;
93e28f88710b2cb Cong Dang          2024-02-01   263  			interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH>;
93e28f88710b2cb Cong Dang          2024-02-01   264  			#gpio-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   265  			gpio-controller;
93e28f88710b2cb Cong Dang          2024-02-01   266  			gpio-ranges = <&pfc 0 128 25>;
93e28f88710b2cb Cong Dang          2024-02-01   267  			#interrupt-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   268  			interrupt-controller;
93e28f88710b2cb Cong Dang          2024-02-01   269  			clocks = <&cpg CPG_MOD 917>;
93e28f88710b2cb Cong Dang          2024-02-01   270  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
93e28f88710b2cb Cong Dang          2024-02-01   271  			resets = <&cpg 917>;
93e28f88710b2cb Cong Dang          2024-02-01   272  		};
93e28f88710b2cb Cong Dang          2024-02-01   273  
93e28f88710b2cb Cong Dang          2024-02-01   274  		gpio5: gpio@e6060980 {
93e28f88710b2cb Cong Dang          2024-02-01   275  			compatible = "renesas,gpio-r8a779h0",
93e28f88710b2cb Cong Dang          2024-02-01   276  				     "renesas,rcar-gen4-gpio";
93e28f88710b2cb Cong Dang          2024-02-01   277  			reg = <0 0xe6060980 0 0x54>;
93e28f88710b2cb Cong Dang          2024-02-01   278  			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>;
93e28f88710b2cb Cong Dang          2024-02-01   279  			#gpio-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   280  			gpio-controller;
93e28f88710b2cb Cong Dang          2024-02-01   281  			gpio-ranges = <&pfc 0 160 21>;
93e28f88710b2cb Cong Dang          2024-02-01   282  			#interrupt-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   283  			interrupt-controller;
93e28f88710b2cb Cong Dang          2024-02-01   284  			clocks = <&cpg CPG_MOD 917>;
93e28f88710b2cb Cong Dang          2024-02-01   285  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
93e28f88710b2cb Cong Dang          2024-02-01   286  			resets = <&cpg 917>;
93e28f88710b2cb Cong Dang          2024-02-01   287  		};
93e28f88710b2cb Cong Dang          2024-02-01   288  
93e28f88710b2cb Cong Dang          2024-02-01   289  		gpio6: gpio@e6061180 {
93e28f88710b2cb Cong Dang          2024-02-01   290  			compatible = "renesas,gpio-r8a779h0",
93e28f88710b2cb Cong Dang          2024-02-01   291  				     "renesas,rcar-gen4-gpio";
93e28f88710b2cb Cong Dang          2024-02-01   292  			reg = <0 0xe6061180 0 0x54>;
93e28f88710b2cb Cong Dang          2024-02-01   293  			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH>;
93e28f88710b2cb Cong Dang          2024-02-01   294  			#gpio-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   295  			gpio-controller;
93e28f88710b2cb Cong Dang          2024-02-01   296  			gpio-ranges = <&pfc 0 192 21>;
93e28f88710b2cb Cong Dang          2024-02-01   297  			#interrupt-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   298  			interrupt-controller;
93e28f88710b2cb Cong Dang          2024-02-01   299  			clocks = <&cpg CPG_MOD 917>;
93e28f88710b2cb Cong Dang          2024-02-01   300  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
93e28f88710b2cb Cong Dang          2024-02-01   301  			resets = <&cpg 917>;
93e28f88710b2cb Cong Dang          2024-02-01   302  		};
93e28f88710b2cb Cong Dang          2024-02-01   303  
93e28f88710b2cb Cong Dang          2024-02-01   304  		gpio7: gpio@e6061980 {
93e28f88710b2cb Cong Dang          2024-02-01   305  			compatible = "renesas,gpio-r8a779h0",
93e28f88710b2cb Cong Dang          2024-02-01   306  				     "renesas,rcar-gen4-gpio";
93e28f88710b2cb Cong Dang          2024-02-01   307  			reg = <0 0xe6061980 0 0x54>;
93e28f88710b2cb Cong Dang          2024-02-01   308  			interrupts = <GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH>;
93e28f88710b2cb Cong Dang          2024-02-01   309  			#gpio-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   310  			gpio-controller;
93e28f88710b2cb Cong Dang          2024-02-01   311  			gpio-ranges = <&pfc 0 224 21>;
93e28f88710b2cb Cong Dang          2024-02-01   312  			#interrupt-cells = <2>;
93e28f88710b2cb Cong Dang          2024-02-01   313  			interrupt-controller;
93e28f88710b2cb Cong Dang          2024-02-01   314  			clocks = <&cpg CPG_MOD 917>;
93e28f88710b2cb Cong Dang          2024-02-01   315  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
93e28f88710b2cb Cong Dang          2024-02-01   316  			resets = <&cpg 917>;
93e28f88710b2cb Cong Dang          2024-02-01   317  		};
93e28f88710b2cb Cong Dang          2024-02-01   318  
1552e6ab5ee5e68 Thanh Quan         2024-04-02   319  		cmt0: timer@e60f0000 {
1552e6ab5ee5e68 Thanh Quan         2024-04-02   320  			compatible = "renesas,r8a779h0-cmt0",
1552e6ab5ee5e68 Thanh Quan         2024-04-02   321  				     "renesas,rcar-gen4-cmt0";
1552e6ab5ee5e68 Thanh Quan         2024-04-02   322  			reg = <0 0xe60f0000 0 0x1004>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   323  			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   324  				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   325  			clocks = <&cpg CPG_MOD 910>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   326  			clock-names = "fck";
1552e6ab5ee5e68 Thanh Quan         2024-04-02   327  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   328  			resets = <&cpg 910>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   329  			status = "disabled";
1552e6ab5ee5e68 Thanh Quan         2024-04-02   330  		};
1552e6ab5ee5e68 Thanh Quan         2024-04-02   331  
1552e6ab5ee5e68 Thanh Quan         2024-04-02   332  		cmt1: timer@e6130000 {
1552e6ab5ee5e68 Thanh Quan         2024-04-02   333  			compatible = "renesas,r8a779h0-cmt1",
1552e6ab5ee5e68 Thanh Quan         2024-04-02   334  				     "renesas,rcar-gen4-cmt1";
1552e6ab5ee5e68 Thanh Quan         2024-04-02   335  			reg = <0 0xe6130000 0 0x1004>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   336  			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   337  				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   338  				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   339  				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   340  				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   341  				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   342  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   343  				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   344  			clocks = <&cpg CPG_MOD 911>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   345  			clock-names = "fck";
1552e6ab5ee5e68 Thanh Quan         2024-04-02   346  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   347  			resets = <&cpg 911>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   348  			status = "disabled";
1552e6ab5ee5e68 Thanh Quan         2024-04-02   349  		};
1552e6ab5ee5e68 Thanh Quan         2024-04-02   350  
1552e6ab5ee5e68 Thanh Quan         2024-04-02   351  		cmt2: timer@e6140000 {
1552e6ab5ee5e68 Thanh Quan         2024-04-02   352  			compatible = "renesas,r8a779h0-cmt1",
1552e6ab5ee5e68 Thanh Quan         2024-04-02   353  				     "renesas,rcar-gen4-cmt1";
1552e6ab5ee5e68 Thanh Quan         2024-04-02   354  			reg = <0 0xe6140000 0 0x1004>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   355  			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   356  				     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   357  				     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   358  				     <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   359  				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   360  				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   361  				     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   362  				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   363  			clocks = <&cpg CPG_MOD 912>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   364  			clock-names = "fck";
1552e6ab5ee5e68 Thanh Quan         2024-04-02   365  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   366  			resets = <&cpg 912>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   367  			status = "disabled";
1552e6ab5ee5e68 Thanh Quan         2024-04-02   368  		};
1552e6ab5ee5e68 Thanh Quan         2024-04-02   369  
1552e6ab5ee5e68 Thanh Quan         2024-04-02   370  		cmt3: timer@e6148000 {
1552e6ab5ee5e68 Thanh Quan         2024-04-02   371  			compatible = "renesas,r8a779h0-cmt1",
1552e6ab5ee5e68 Thanh Quan         2024-04-02   372  				     "renesas,rcar-gen4-cmt1";
1552e6ab5ee5e68 Thanh Quan         2024-04-02   373  			reg = <0 0xe6148000 0 0x1004>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   374  			interrupts = <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   375  				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   376  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   377  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   378  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   379  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   380  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
1552e6ab5ee5e68 Thanh Quan         2024-04-02   381  				     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   382  			clocks = <&cpg CPG_MOD 913>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   383  			clock-names = "fck";
1552e6ab5ee5e68 Thanh Quan         2024-04-02   384  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   385  			resets = <&cpg 913>;
1552e6ab5ee5e68 Thanh Quan         2024-04-02   386  			status = "disabled";
1552e6ab5ee5e68 Thanh Quan         2024-04-02   387  		};
1552e6ab5ee5e68 Thanh Quan         2024-04-02   388  
227ec979581047b Hai Pham           2024-01-25   389  		cpg: clock-controller@e6150000 {
227ec979581047b Hai Pham           2024-01-25   390  			compatible = "renesas,r8a779h0-cpg-mssr";
227ec979581047b Hai Pham           2024-01-25   391  			reg = <0 0xe6150000 0 0x4000>;
227ec979581047b Hai Pham           2024-01-25   392  			clocks = <&extal_clk>, <&extalr_clk>;
227ec979581047b Hai Pham           2024-01-25   393  			clock-names = "extal", "extalr";
227ec979581047b Hai Pham           2024-01-25   394  			#clock-cells = <2>;
227ec979581047b Hai Pham           2024-01-25   395  			#power-domain-cells = <0>;
227ec979581047b Hai Pham           2024-01-25   396  			#reset-cells = <1>;
227ec979581047b Hai Pham           2024-01-25   397  		};
227ec979581047b Hai Pham           2024-01-25   398  
227ec979581047b Hai Pham           2024-01-25   399  		rst: reset-controller@e6160000 {
227ec979581047b Hai Pham           2024-01-25   400  			compatible = "renesas,r8a779h0-rst";
227ec979581047b Hai Pham           2024-01-25   401  			reg = <0 0xe6160000 0 0x4000>;
227ec979581047b Hai Pham           2024-01-25   402  		};
227ec979581047b Hai Pham           2024-01-25   403  
227ec979581047b Hai Pham           2024-01-25   404  		sysc: system-controller@e6180000 {
227ec979581047b Hai Pham           2024-01-25   405  			compatible = "renesas,r8a779h0-sysc";
227ec979581047b Hai Pham           2024-01-25   406  			reg = <0 0xe6180000 0 0x4000>;
227ec979581047b Hai Pham           2024-01-25   407  			#power-domain-cells = <1>;
227ec979581047b Hai Pham           2024-01-25   408  		};
227ec979581047b Hai Pham           2024-01-25   409  
e4caa0ba29e235c Duy Nguyen         2024-03-06   410  		tsc: thermal@e6198000 {
e4caa0ba29e235c Duy Nguyen         2024-03-06   411  			compatible = "renesas,r8a779h0-thermal";
e4caa0ba29e235c Duy Nguyen         2024-03-06   412  			reg = <0 0xe6198000 0 0x200>,
e4caa0ba29e235c Duy Nguyen         2024-03-06   413  			      <0 0xe61a0000 0 0x200>;
e4caa0ba29e235c Duy Nguyen         2024-03-06   414  			clocks = <&cpg CPG_MOD 919>;
e4caa0ba29e235c Duy Nguyen         2024-03-06   415  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
e4caa0ba29e235c Duy Nguyen         2024-03-06   416  			resets = <&cpg 919>;
e4caa0ba29e235c Duy Nguyen         2024-03-06   417  			#thermal-sensor-cells = <1>;
e4caa0ba29e235c Duy Nguyen         2024-03-06   418  		};
e4caa0ba29e235c Duy Nguyen         2024-03-06   419  
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   420  		intc_ex: interrupt-controller@e61c0000 {
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   421  			compatible = "renesas,intc-ex-r8a779h0", "renesas,irqc";
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   422  			#interrupt-cells = <2>;
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   423  			interrupt-controller;
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   424  			reg = <0 0xe61c0000 0 0x200>;
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   425  			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   426  				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   427  				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   428  				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   429  				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   430  				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   431  			clocks = <&cpg CPG_MOD 611>;
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   432  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   433  			resets = <&cpg 611>;
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   434  		};
d28970ddd1b89eb Geert Uytterhoeven 2024-04-16   435  
fdaf6a67806d14a Thanh Quan         2024-04-02   436  		tmu0: timer@e61e0000 {
fdaf6a67806d14a Thanh Quan         2024-04-02   437  			compatible = "renesas,tmu-r8a779h0", "renesas,tmu";
fdaf6a67806d14a Thanh Quan         2024-04-02   438  			reg = <0 0xe61e0000 0 0x30>;
fdaf6a67806d14a Thanh Quan         2024-04-02   439  			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   440  				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   441  				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>;
fdaf6a67806d14a Thanh Quan         2024-04-02   442  			interrupt-names = "tuni0", "tuni1", "tuni2";
fdaf6a67806d14a Thanh Quan         2024-04-02   443  			clocks = <&cpg CPG_MOD 713>;
fdaf6a67806d14a Thanh Quan         2024-04-02   444  			clock-names = "fck";
fdaf6a67806d14a Thanh Quan         2024-04-02   445  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
fdaf6a67806d14a Thanh Quan         2024-04-02   446  			resets = <&cpg 713>;
fdaf6a67806d14a Thanh Quan         2024-04-02   447  			status = "disabled";
fdaf6a67806d14a Thanh Quan         2024-04-02   448  		};
fdaf6a67806d14a Thanh Quan         2024-04-02   449  
fdaf6a67806d14a Thanh Quan         2024-04-02   450  		tmu1: timer@e6fc0000 {
fdaf6a67806d14a Thanh Quan         2024-04-02   451  			compatible = "renesas,tmu-r8a779h0", "renesas,tmu";
fdaf6a67806d14a Thanh Quan         2024-04-02   452  			reg = <0 0xe6fc0000 0 0x30>;
fdaf6a67806d14a Thanh Quan         2024-04-02   453  			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   454  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   455  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   456  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>;
fdaf6a67806d14a Thanh Quan         2024-04-02   457  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
fdaf6a67806d14a Thanh Quan         2024-04-02   458  			clocks = <&cpg CPG_MOD 714>;
fdaf6a67806d14a Thanh Quan         2024-04-02   459  			clock-names = "fck";
fdaf6a67806d14a Thanh Quan         2024-04-02   460  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
fdaf6a67806d14a Thanh Quan         2024-04-02   461  			resets = <&cpg 714>;
fdaf6a67806d14a Thanh Quan         2024-04-02   462  			status = "disabled";
fdaf6a67806d14a Thanh Quan         2024-04-02   463  		};
fdaf6a67806d14a Thanh Quan         2024-04-02   464  
fdaf6a67806d14a Thanh Quan         2024-04-02   465  		tmu2: timer@e6fd0000 {
fdaf6a67806d14a Thanh Quan         2024-04-02   466  			compatible = "renesas,tmu-r8a779h0", "renesas,tmu";
fdaf6a67806d14a Thanh Quan         2024-04-02   467  			reg = <0 0xe6fd0000 0 0x30>;
fdaf6a67806d14a Thanh Quan         2024-04-02   468  			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   469  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   470  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   471  				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
fdaf6a67806d14a Thanh Quan         2024-04-02   472  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
fdaf6a67806d14a Thanh Quan         2024-04-02   473  			clocks = <&cpg CPG_MOD 715>;
fdaf6a67806d14a Thanh Quan         2024-04-02   474  			clock-names = "fck";
fdaf6a67806d14a Thanh Quan         2024-04-02   475  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
fdaf6a67806d14a Thanh Quan         2024-04-02   476  			resets = <&cpg 715>;
fdaf6a67806d14a Thanh Quan         2024-04-02   477  			status = "disabled";
fdaf6a67806d14a Thanh Quan         2024-04-02   478  		};
fdaf6a67806d14a Thanh Quan         2024-04-02   479  
fdaf6a67806d14a Thanh Quan         2024-04-02   480  		tmu3: timer@e6fe0000 {
fdaf6a67806d14a Thanh Quan         2024-04-02   481  			compatible = "renesas,tmu-r8a779h0", "renesas,tmu";
fdaf6a67806d14a Thanh Quan         2024-04-02   482  			reg = <0 0xe6fe0000 0 0x30>;
fdaf6a67806d14a Thanh Quan         2024-04-02   483  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   484  				     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   485  				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   486  				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>;
fdaf6a67806d14a Thanh Quan         2024-04-02   487  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
fdaf6a67806d14a Thanh Quan         2024-04-02   488  			clocks = <&cpg CPG_MOD 716>;
fdaf6a67806d14a Thanh Quan         2024-04-02   489  			clock-names = "fck";
fdaf6a67806d14a Thanh Quan         2024-04-02   490  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
fdaf6a67806d14a Thanh Quan         2024-04-02   491  			resets = <&cpg 716>;
fdaf6a67806d14a Thanh Quan         2024-04-02   492  			status = "disabled";
fdaf6a67806d14a Thanh Quan         2024-04-02   493  		};
fdaf6a67806d14a Thanh Quan         2024-04-02   494  
fdaf6a67806d14a Thanh Quan         2024-04-02   495  		tmu4: timer@ffc00000 {
fdaf6a67806d14a Thanh Quan         2024-04-02   496  			compatible = "renesas,tmu-r8a779h0", "renesas,tmu";
fdaf6a67806d14a Thanh Quan         2024-04-02   497  			reg = <0 0xffc00000 0 0x30>;
fdaf6a67806d14a Thanh Quan         2024-04-02   498  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   499  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   500  				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
fdaf6a67806d14a Thanh Quan         2024-04-02   501  				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
fdaf6a67806d14a Thanh Quan         2024-04-02   502  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
fdaf6a67806d14a Thanh Quan         2024-04-02   503  			clocks = <&cpg CPG_MOD 717>;
fdaf6a67806d14a Thanh Quan         2024-04-02   504  			clock-names = "fck";
fdaf6a67806d14a Thanh Quan         2024-04-02   505  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
fdaf6a67806d14a Thanh Quan         2024-04-02   506  			resets = <&cpg 717>;
fdaf6a67806d14a Thanh Quan         2024-04-02   507  			status = "disabled";
fdaf6a67806d14a Thanh Quan         2024-04-02   508  		};
fdaf6a67806d14a Thanh Quan         2024-04-02   509  
e3e7a865c4c7aa3 Hai Pham           2024-02-01   510  		i2c0: i2c@e6500000 {
e3e7a865c4c7aa3 Hai Pham           2024-02-01   511  			compatible = "renesas,i2c-r8a779h0",
e3e7a865c4c7aa3 Hai Pham           2024-02-01   512  				     "renesas,rcar-gen4-i2c";
e3e7a865c4c7aa3 Hai Pham           2024-02-01   513  			reg = <0 0xe6500000 0 0x40>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   514  			interrupts = <GIC_SPI 610 IRQ_TYPE_LEVEL_HIGH>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   515  			clocks = <&cpg CPG_MOD 518>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   516  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   517  			resets = <&cpg 518>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   518  			dmas = <&dmac1 0x91>, <&dmac1 0x90>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   519  			       <&dmac2 0x91>, <&dmac2 0x90>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   520  			dma-names = "tx", "rx", "tx", "rx";
e3e7a865c4c7aa3 Hai Pham           2024-02-01   521  			i2c-scl-internal-delay-ns = <110>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   522  			#address-cells = <1>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   523  			#size-cells = <0>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   524  			status = "disabled";
e3e7a865c4c7aa3 Hai Pham           2024-02-01   525  		};
e3e7a865c4c7aa3 Hai Pham           2024-02-01   526  
e3e7a865c4c7aa3 Hai Pham           2024-02-01   527  		i2c1: i2c@e6508000 {
e3e7a865c4c7aa3 Hai Pham           2024-02-01   528  			compatible = "renesas,i2c-r8a779h0",
e3e7a865c4c7aa3 Hai Pham           2024-02-01   529  				     "renesas,rcar-gen4-i2c";
e3e7a865c4c7aa3 Hai Pham           2024-02-01   530  			reg = <0 0xe6508000 0 0x40>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   531  			interrupts = <GIC_SPI 611 IRQ_TYPE_LEVEL_HIGH>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   532  			clocks = <&cpg CPG_MOD 519>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   533  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   534  			resets = <&cpg 519>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   535  			dmas = <&dmac1 0x93>, <&dmac1 0x92>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   536  			       <&dmac2 0x93>, <&dmac2 0x92>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   537  			dma-names = "tx", "rx", "tx", "rx";
e3e7a865c4c7aa3 Hai Pham           2024-02-01   538  			i2c-scl-internal-delay-ns = <110>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   539  			#address-cells = <1>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   540  			#size-cells = <0>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   541  			status = "disabled";
e3e7a865c4c7aa3 Hai Pham           2024-02-01   542  		};
e3e7a865c4c7aa3 Hai Pham           2024-02-01   543  
e3e7a865c4c7aa3 Hai Pham           2024-02-01   544  		i2c2: i2c@e6510000 {
e3e7a865c4c7aa3 Hai Pham           2024-02-01   545  			compatible = "renesas,i2c-r8a779h0",
e3e7a865c4c7aa3 Hai Pham           2024-02-01   546  				     "renesas,rcar-gen4-i2c";
e3e7a865c4c7aa3 Hai Pham           2024-02-01   547  			reg = <0 0xe6510000 0 0x40>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   548  			interrupts = <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   549  			clocks = <&cpg CPG_MOD 520>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   550  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   551  			resets = <&cpg 520>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   552  			dmas = <&dmac1 0x95>, <&dmac1 0x94>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   553  			       <&dmac2 0x95>, <&dmac2 0x94>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   554  			dma-names = "tx", "rx", "tx", "rx";
e3e7a865c4c7aa3 Hai Pham           2024-02-01   555  			i2c-scl-internal-delay-ns = <110>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   556  			#address-cells = <1>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   557  			#size-cells = <0>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   558  			status = "disabled";
e3e7a865c4c7aa3 Hai Pham           2024-02-01   559  		};
e3e7a865c4c7aa3 Hai Pham           2024-02-01   560  
e3e7a865c4c7aa3 Hai Pham           2024-02-01   561  		i2c3: i2c@e66d0000 {
e3e7a865c4c7aa3 Hai Pham           2024-02-01   562  			compatible = "renesas,i2c-r8a779h0",
e3e7a865c4c7aa3 Hai Pham           2024-02-01   563  				     "renesas,rcar-gen4-i2c";
e3e7a865c4c7aa3 Hai Pham           2024-02-01   564  			reg = <0 0xe66d0000 0 0x40>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   565  			interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   566  			clocks = <&cpg CPG_MOD 521>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   567  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   568  			resets = <&cpg 521>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   569  			dmas = <&dmac1 0x97>, <&dmac1 0x96>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   570  			       <&dmac2 0x97>, <&dmac2 0x96>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   571  			dma-names = "tx", "rx", "tx", "rx";
e3e7a865c4c7aa3 Hai Pham           2024-02-01   572  			i2c-scl-internal-delay-ns = <110>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   573  			#address-cells = <1>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   574  			#size-cells = <0>;
e3e7a865c4c7aa3 Hai Pham           2024-02-01   575  			status = "disabled";
e3e7a865c4c7aa3 Hai Pham           2024-02-01   576  		};
e3e7a865c4c7aa3 Hai Pham           2024-02-01   577  
227ec979581047b Hai Pham           2024-01-25   578  		hscif0: serial@e6540000 {
227ec979581047b Hai Pham           2024-01-25   579  			compatible = "renesas,hscif-r8a779h0",
227ec979581047b Hai Pham           2024-01-25   580  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
227ec979581047b Hai Pham           2024-01-25   581  			reg = <0 0xe6540000 0 0x60>;
227ec979581047b Hai Pham           2024-01-25   582  			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
227ec979581047b Hai Pham           2024-01-25   583  			clocks = <&cpg CPG_MOD 514>,
227ec979581047b Hai Pham           2024-01-25   584  				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
227ec979581047b Hai Pham           2024-01-25   585  				 <&scif_clk>;
227ec979581047b Hai Pham           2024-01-25   586  			clock-names = "fck", "brg_int", "scif_clk";
227ec979581047b Hai Pham           2024-01-25   587  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
227ec979581047b Hai Pham           2024-01-25   588  			resets = <&cpg 514>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   589  			dmas = <&dmac1 0x31>, <&dmac1 0x30>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   590  			       <&dmac2 0x31>, <&dmac2 0x30>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14   591  			dma-names = "tx", "rx", "tx", "rx";
227ec979581047b Hai Pham           2024-01-25   592  			status = "disabled";
227ec979581047b Hai Pham           2024-01-25   593  		};
227ec979581047b Hai Pham           2024-01-25   594  
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   595  		hscif1: serial@e6550000 {
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   596  			compatible = "renesas,hscif-r8a779h0",
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   597  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   598  			reg = <0 0xe6550000 0 0x60>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   599  			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   600  			clocks = <&cpg CPG_MOD 515>,
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   601  				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   602  				 <&scif_clk>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   603  			clock-names = "fck", "brg_int", "scif_clk";
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   604  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   605  			resets = <&cpg 515>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   606  			dmas = <&dmac1 0x33>, <&dmac1 0x32>,
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   607  			       <&dmac2 0x33>, <&dmac2 0x32>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   608  			dma-names = "tx", "rx", "tx", "rx";
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   609  			status = "disabled";
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   610  		};
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   611  
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   612  		hscif2: serial@e6560000 {
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   613  			compatible = "renesas,hscif-r8a779h0",
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   614  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   615  			reg = <0 0xe6560000 0 0x60>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   616  			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   617  			clocks = <&cpg CPG_MOD 516>,
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   618  				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   619  				 <&scif_clk2>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   620  			clock-names = "fck", "brg_int", "scif_clk";
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   621  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   622  			resets = <&cpg 516>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   623  			dmas = <&dmac1 0x35>, <&dmac1 0x34>,
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   624  			       <&dmac2 0x35>, <&dmac2 0x34>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   625  			dma-names = "tx", "rx", "tx", "rx";
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   626  			status = "disabled";
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   627  		};
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   628  
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   629  		hscif3: serial@e66a0000 {
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   630  			compatible = "renesas,hscif-r8a779h0",
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   631  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   632  			reg = <0 0xe66a0000 0 0x60>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   633  			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   634  			clocks = <&cpg CPG_MOD 517>,
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   635  				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   636  				 <&scif_clk>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   637  			clock-names = "fck", "brg_int", "scif_clk";
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   638  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   639  			resets = <&cpg 517>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   640  			dmas = <&dmac1 0x37>, <&dmac1 0x36>,
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   641  			       <&dmac2 0x37>, <&dmac2 0x36>;
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   642  			dma-names = "tx", "rx", "tx", "rx";
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   643  			status = "disabled";
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   644  		};
3cdce0b531fbf6a Geert Uytterhoeven 2024-03-12   645  
b3749d434ea48cc Duy Nguyen         2024-08-01   646  		canfd: can@e6660000 {
b3749d434ea48cc Duy Nguyen         2024-08-01   647  			compatible = "renesas,r8a779h0-canfd",
b3749d434ea48cc Duy Nguyen         2024-08-01   648  				     "renesas,rcar-gen4-canfd";
b3749d434ea48cc Duy Nguyen         2024-08-01   649  			reg = <0 0xe6660000 0 0x8500>;
b3749d434ea48cc Duy Nguyen         2024-08-01   650  			interrupts = <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
b3749d434ea48cc Duy Nguyen         2024-08-01   651  				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
b3749d434ea48cc Duy Nguyen         2024-08-01   652  			interrupt-names = "ch_int", "g_int";
b3749d434ea48cc Duy Nguyen         2024-08-01   653  			clocks = <&cpg CPG_MOD 328>,
b3749d434ea48cc Duy Nguyen         2024-08-01   654  				 <&cpg CPG_CORE R8A779H0_CLK_CANFD>,
b3749d434ea48cc Duy Nguyen         2024-08-01   655  				 <&can_clk>;
b3749d434ea48cc Duy Nguyen         2024-08-01   656  			clock-names = "fck", "canfd", "can_clk";
b3749d434ea48cc Duy Nguyen         2024-08-01   657  			assigned-clocks = <&cpg CPG_CORE R8A779H0_CLK_CANFD>;
b3749d434ea48cc Duy Nguyen         2024-08-01   658  			assigned-clock-rates = <80000000>;
b3749d434ea48cc Duy Nguyen         2024-08-01   659  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
b3749d434ea48cc Duy Nguyen         2024-08-01   660  			resets = <&cpg 328>;
b3749d434ea48cc Duy Nguyen         2024-08-01   661  			status = "disabled";
b3749d434ea48cc Duy Nguyen         2024-08-01   662  
b3749d434ea48cc Duy Nguyen         2024-08-01   663  			channel0 {
b3749d434ea48cc Duy Nguyen         2024-08-01   664  				status = "disabled";
b3749d434ea48cc Duy Nguyen         2024-08-01   665  			};
b3749d434ea48cc Duy Nguyen         2024-08-01   666  
b3749d434ea48cc Duy Nguyen         2024-08-01   667  			channel1 {
b3749d434ea48cc Duy Nguyen         2024-08-01   668  				status = "disabled";
b3749d434ea48cc Duy Nguyen         2024-08-01   669  			};
b3749d434ea48cc Duy Nguyen         2024-08-01   670  
b3749d434ea48cc Duy Nguyen         2024-08-01   671  			channel2 {
b3749d434ea48cc Duy Nguyen         2024-08-01   672  				status = "disabled";
b3749d434ea48cc Duy Nguyen         2024-08-01   673  			};
b3749d434ea48cc Duy Nguyen         2024-08-01   674  
b3749d434ea48cc Duy Nguyen         2024-08-01   675  			channel3 {
b3749d434ea48cc Duy Nguyen         2024-08-01   676  				status = "disabled";
b3749d434ea48cc Duy Nguyen         2024-08-01   677  			};
b3749d434ea48cc Duy Nguyen         2024-08-01   678  		};
b3749d434ea48cc Duy Nguyen         2024-08-01   679  
243066ecc0f114f Thanh Quan         2024-02-11   680  		avb0: ethernet@e6800000 {
243066ecc0f114f Thanh Quan         2024-02-11   681  			compatible = "renesas,etheravb-r8a779h0",
243066ecc0f114f Thanh Quan         2024-02-11   682  				     "renesas,etheravb-rcar-gen4";
243066ecc0f114f Thanh Quan         2024-02-11   683  			reg = <0 0xe6800000 0 0x1000>;
243066ecc0f114f Thanh Quan         2024-02-11   684  			interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   685  				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   686  				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   687  				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   688  				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   689  				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   690  				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   691  				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   692  				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   693  				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   694  				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   695  				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   696  				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   697  				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   698  				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   699  				     <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   700  				     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   701  				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   702  				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   703  				     <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   704  				     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   705  				     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   706  				     <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   707  				     <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   708  				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>;
243066ecc0f114f Thanh Quan         2024-02-11   709  			interrupt-names = "ch0", "ch1", "ch2", "ch3",
243066ecc0f114f Thanh Quan         2024-02-11   710  					  "ch4", "ch5", "ch6", "ch7",
243066ecc0f114f Thanh Quan         2024-02-11   711  					  "ch8", "ch9", "ch10", "ch11",
243066ecc0f114f Thanh Quan         2024-02-11   712  					  "ch12", "ch13", "ch14", "ch15",
243066ecc0f114f Thanh Quan         2024-02-11   713  					  "ch16", "ch17", "ch18", "ch19",
243066ecc0f114f Thanh Quan         2024-02-11   714  					  "ch20", "ch21", "ch22", "ch23",
243066ecc0f114f Thanh Quan         2024-02-11   715  					  "ch24";
243066ecc0f114f Thanh Quan         2024-02-11   716  			clocks = <&cpg CPG_MOD 211>;
243066ecc0f114f Thanh Quan         2024-02-11   717  			clock-names = "fck";
243066ecc0f114f Thanh Quan         2024-02-11   718  			power-domains = <&sysc R8A779H0_PD_C4>;
243066ecc0f114f Thanh Quan         2024-02-11   719  			resets = <&cpg 211>;
243066ecc0f114f Thanh Quan         2024-02-11   720  			phy-mode = "rgmii";
243066ecc0f114f Thanh Quan         2024-02-11   721  			rx-internal-delay-ps = <0>;
243066ecc0f114f Thanh Quan         2024-02-11   722  			tx-internal-delay-ps = <0>;
f026b6426603d25 Geert Uytterhoeven 2024-04-19   723  			iommus = <&ipmmu_hc 0>;
243066ecc0f114f Thanh Quan         2024-02-11   724  			#address-cells = <1>;
243066ecc0f114f Thanh Quan         2024-02-11   725  			#size-cells = <0>;
243066ecc0f114f Thanh Quan         2024-02-11   726  			status = "disabled";
243066ecc0f114f Thanh Quan         2024-02-11   727  		};
243066ecc0f114f Thanh Quan         2024-02-11   728  
243066ecc0f114f Thanh Quan         2024-02-11   729  		avb1: ethernet@e6810000 {
243066ecc0f114f Thanh Quan         2024-02-11   730  			compatible = "renesas,etheravb-r8a779h0",
243066ecc0f114f Thanh Quan         2024-02-11   731  				     "renesas,etheravb-rcar-gen4";
243066ecc0f114f Thanh Quan         2024-02-11   732  			reg = <0 0xe6810000 0 0x1000>;
243066ecc0f114f Thanh Quan         2024-02-11   733  			interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   734  				     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   735  				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   736  				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   737  				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   738  				     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   739  				     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   740  				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   741  				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   742  				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   743  				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   744  				     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   745  				     <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   746  				     <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   747  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   748  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   749  				     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   750  				     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   751  				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   752  				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   753  				     <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   754  				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   755  				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   756  				     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   757  				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
243066ecc0f114f Thanh Quan         2024-02-11   758  			interrupt-names = "ch0", "ch1", "ch2", "ch3",
243066ecc0f114f Thanh Quan         2024-02-11   759  					  "ch4", "ch5", "ch6", "ch7",
243066ecc0f114f Thanh Quan         2024-02-11   760  					  "ch8", "ch9", "ch10", "ch11",
243066ecc0f114f Thanh Quan         2024-02-11   761  					  "ch12", "ch13", "ch14", "ch15",
243066ecc0f114f Thanh Quan         2024-02-11   762  					  "ch16", "ch17", "ch18", "ch19",
243066ecc0f114f Thanh Quan         2024-02-11   763  					  "ch20", "ch21", "ch22", "ch23",
243066ecc0f114f Thanh Quan         2024-02-11   764  					  "ch24";
243066ecc0f114f Thanh Quan         2024-02-11   765  			clocks = <&cpg CPG_MOD 212>;
243066ecc0f114f Thanh Quan         2024-02-11   766  			clock-names = "fck";
243066ecc0f114f Thanh Quan         2024-02-11   767  			power-domains = <&sysc R8A779H0_PD_C4>;
243066ecc0f114f Thanh Quan         2024-02-11   768  			resets = <&cpg 212>;
243066ecc0f114f Thanh Quan         2024-02-11   769  			phy-mode = "rgmii";
243066ecc0f114f Thanh Quan         2024-02-11   770  			rx-internal-delay-ps = <0>;
243066ecc0f114f Thanh Quan         2024-02-11   771  			tx-internal-delay-ps = <0>;
cd0a847aa6c8a08 Geert Uytterhoeven 2024-07-08   772  			iommus = <&ipmmu_hc 1>;
243066ecc0f114f Thanh Quan         2024-02-11   773  			#address-cells = <1>;
243066ecc0f114f Thanh Quan         2024-02-11   774  			#size-cells = <0>;
243066ecc0f114f Thanh Quan         2024-02-11   775  			status = "disabled";
243066ecc0f114f Thanh Quan         2024-02-11   776  		};
243066ecc0f114f Thanh Quan         2024-02-11   777  
243066ecc0f114f Thanh Quan         2024-02-11   778  		avb2: ethernet@e6820000 {
243066ecc0f114f Thanh Quan         2024-02-11   779  			compatible = "renesas,etheravb-r8a779h0",
243066ecc0f114f Thanh Quan         2024-02-11   780  				     "renesas,etheravb-rcar-gen4";
243066ecc0f114f Thanh Quan         2024-02-11   781  			reg = <0 0xe6820000 0 0x1000>;
243066ecc0f114f Thanh Quan         2024-02-11   782  			interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   783  				     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   784  				     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   785  				     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   786  				     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   787  				     <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   788  				     <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   789  				     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   790  				     <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   791  				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   792  				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   793  				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   794  				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   795  				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   796  				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   797  				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   798  				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   799  				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   800  				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   801  				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   802  				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   803  				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   804  				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   805  				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
243066ecc0f114f Thanh Quan         2024-02-11   806  				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
243066ecc0f114f Thanh Quan         2024-02-11   807  			interrupt-names = "ch0", "ch1", "ch2", "ch3",
243066ecc0f114f Thanh Quan         2024-02-11   808  					  "ch4", "ch5", "ch6", "ch7",
243066ecc0f114f Thanh Quan         2024-02-11   809  					  "ch8", "ch9", "ch10", "ch11",
243066ecc0f114f Thanh Quan         2024-02-11   810  					  "ch12", "ch13", "ch14", "ch15",
243066ecc0f114f Thanh Quan         2024-02-11   811  					  "ch16", "ch17", "ch18", "ch19",
243066ecc0f114f Thanh Quan         2024-02-11   812  					  "ch20", "ch21", "ch22", "ch23",
243066ecc0f114f Thanh Quan         2024-02-11   813  					  "ch24";
243066ecc0f114f Thanh Quan         2024-02-11   814  			clocks = <&cpg CPG_MOD 213>;
243066ecc0f114f Thanh Quan         2024-02-11   815  			clock-names = "fck";
243066ecc0f114f Thanh Quan         2024-02-11   816  			power-domains = <&sysc R8A779H0_PD_C4>;
243066ecc0f114f Thanh Quan         2024-02-11   817  			resets = <&cpg 213>;
243066ecc0f114f Thanh Quan         2024-02-11   818  			phy-mode = "rgmii";
243066ecc0f114f Thanh Quan         2024-02-11   819  			rx-internal-delay-ps = <0>;
243066ecc0f114f Thanh Quan         2024-02-11   820  			tx-internal-delay-ps = <0>;
cd0a847aa6c8a08 Geert Uytterhoeven 2024-07-08   821  			iommus = <&ipmmu_hc 2>;
243066ecc0f114f Thanh Quan         2024-02-11   822  			#address-cells = <1>;
243066ecc0f114f Thanh Quan         2024-02-11   823  			#size-cells = <0>;
243066ecc0f114f Thanh Quan         2024-02-11   824  			status = "disabled";
243066ecc0f114f Thanh Quan         2024-02-11   825  		};
243066ecc0f114f Thanh Quan         2024-02-11   826  
ca999750b95caf4 Khanh Le           2024-07-25   827  		pwm0: pwm@e6e30000 {
ca999750b95caf4 Khanh Le           2024-07-25   828  			compatible = "renesas,pwm-r8a779h0", "renesas,pwm-rcar";
ca999750b95caf4 Khanh Le           2024-07-25   829  			reg = <0 0xe6e30000 0 0x10>;
ca999750b95caf4 Khanh Le           2024-07-25   830  			#pwm-cells = <2>;
ca999750b95caf4 Khanh Le           2024-07-25   831  			clocks = <&cpg CPG_MOD 628>;
ca999750b95caf4 Khanh Le           2024-07-25   832  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
ca999750b95caf4 Khanh Le           2024-07-25   833  			resets = <&cpg 628>;
ca999750b95caf4 Khanh Le           2024-07-25   834  			status = "disabled";
ca999750b95caf4 Khanh Le           2024-07-25   835  		};
ca999750b95caf4 Khanh Le           2024-07-25   836  
ca999750b95caf4 Khanh Le           2024-07-25   837  		pwm1: pwm@e6e31000 {
ca999750b95caf4 Khanh Le           2024-07-25   838  			compatible = "renesas,pwm-r8a779h0", "renesas,pwm-rcar";
ca999750b95caf4 Khanh Le           2024-07-25   839  			reg = <0 0xe6e31000 0 0x10>;
ca999750b95caf4 Khanh Le           2024-07-25   840  			#pwm-cells = <2>;
ca999750b95caf4 Khanh Le           2024-07-25   841  			clocks = <&cpg CPG_MOD 628>;
ca999750b95caf4 Khanh Le           2024-07-25   842  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
ca999750b95caf4 Khanh Le           2024-07-25   843  			resets = <&cpg 628>;
ca999750b95caf4 Khanh Le           2024-07-25   844  			status = "disabled";
ca999750b95caf4 Khanh Le           2024-07-25   845  		};
ca999750b95caf4 Khanh Le           2024-07-25   846  
ca999750b95caf4 Khanh Le           2024-07-25   847  		pwm2: pwm@e6e32000 {
ca999750b95caf4 Khanh Le           2024-07-25   848  			compatible = "renesas,pwm-r8a779h0", "renesas,pwm-rcar";
ca999750b95caf4 Khanh Le           2024-07-25   849  			reg = <0 0xe6e32000 0 0x10>;
ca999750b95caf4 Khanh Le           2024-07-25   850  			#pwm-cells = <2>;
ca999750b95caf4 Khanh Le           2024-07-25   851  			clocks = <&cpg CPG_MOD 628>;
ca999750b95caf4 Khanh Le           2024-07-25   852  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
ca999750b95caf4 Khanh Le           2024-07-25   853  			resets = <&cpg 628>;
ca999750b95caf4 Khanh Le           2024-07-25   854  			status = "disabled";
ca999750b95caf4 Khanh Le           2024-07-25   855  		};
ca999750b95caf4 Khanh Le           2024-07-25   856  
ca999750b95caf4 Khanh Le           2024-07-25   857  		pwm3: pwm@e6e33000 {
ca999750b95caf4 Khanh Le           2024-07-25   858  			compatible = "renesas,pwm-r8a779h0", "renesas,pwm-rcar";
ca999750b95caf4 Khanh Le           2024-07-25   859  			reg = <0 0xe6e33000 0 0x10>;
ca999750b95caf4 Khanh Le           2024-07-25   860  			#pwm-cells = <2>;
ca999750b95caf4 Khanh Le           2024-07-25   861  			clocks = <&cpg CPG_MOD 628>;
ca999750b95caf4 Khanh Le           2024-07-25   862  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
ca999750b95caf4 Khanh Le           2024-07-25   863  			resets = <&cpg 628>;
ca999750b95caf4 Khanh Le           2024-07-25   864  			status = "disabled";
ca999750b95caf4 Khanh Le           2024-07-25   865  		};
ca999750b95caf4 Khanh Le           2024-07-25   866  
ca999750b95caf4 Khanh Le           2024-07-25   867  		pwm4: pwm@e6e34000 {
ca999750b95caf4 Khanh Le           2024-07-25   868  			compatible = "renesas,pwm-r8a779h0", "renesas,pwm-rcar";
ca999750b95caf4 Khanh Le           2024-07-25   869  			reg = <0 0xe6e34000 0 0x10>;
ca999750b95caf4 Khanh Le           2024-07-25   870  			#pwm-cells = <2>;
ca999750b95caf4 Khanh Le           2024-07-25   871  			clocks = <&cpg CPG_MOD 628>;
ca999750b95caf4 Khanh Le           2024-07-25   872  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
ca999750b95caf4 Khanh Le           2024-07-25   873  			resets = <&cpg 628>;
ca999750b95caf4 Khanh Le           2024-07-25   874  			status = "disabled";
ca999750b95caf4 Khanh Le           2024-07-25   875  		};
ca999750b95caf4 Khanh Le           2024-07-25   876  
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   877  		scif0: serial@e6e60000 {
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   878  			compatible = "renesas,scif-r8a779h0",
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   879  				     "renesas,rcar-gen4-scif", "renesas,scif";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   880  			reg = <0 0xe6e60000 0 64>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   881  			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   882  			clocks = <&cpg CPG_MOD 702>,
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   883  				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   884  				 <&scif_clk>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   885  			clock-names = "fck", "brg_int", "scif_clk";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   886  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   887  			resets = <&cpg 702>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   888  			dmas = <&dmac1 0x51>, <&dmac1 0x50>,
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   889  			       <&dmac2 0x51>, <&dmac2 0x50>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   890  			dma-names = "tx", "rx", "tx", "rx";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   891  			status = "disabled";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   892  		};
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   893  
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   894  		scif1: serial@e6e68000 {
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   895  			compatible = "renesas,scif-r8a779h0",
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   896  				     "renesas,rcar-gen4-scif", "renesas,scif";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   897  			reg = <0 0xe6e68000 0 64>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   898  			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   899  			clocks = <&cpg CPG_MOD 703>,
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   900  				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   901  				 <&scif_clk>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   902  			clock-names = "fck", "brg_int", "scif_clk";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   903  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   904  			resets = <&cpg 703>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   905  			dmas = <&dmac1 0x53>, <&dmac1 0x52>,
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   906  			       <&dmac2 0x53>, <&dmac2 0x52>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   907  			dma-names = "tx", "rx", "tx", "rx";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   908  			status = "disabled";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   909  		};
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   910  
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   911  		scif3: serial@e6c50000 {
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   912  			compatible = "renesas,scif-r8a779h0",
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   913  				     "renesas,rcar-gen4-scif", "renesas,scif";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   914  			reg = <0 0xe6c50000 0 64>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   915  			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   916  			clocks = <&cpg CPG_MOD 704>,
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   917  				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   918  				 <&scif_clk>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   919  			clock-names = "fck", "brg_int", "scif_clk";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   920  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   921  			resets = <&cpg 704>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   922  			dmas = <&dmac1 0x57>, <&dmac1 0x56>,
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   923  			       <&dmac2 0x57>, <&dmac2 0x56>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   924  			dma-names = "tx", "rx", "tx", "rx";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   925  			status = "disabled";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   926  		};
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   927  
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   928  		scif4: serial@e6c40000 {
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   929  			compatible = "renesas,scif-r8a779h0",
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   930  				     "renesas,rcar-gen4-scif", "renesas,scif";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   931  			reg = <0 0xe6c40000 0 64>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   932  			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   933  			clocks = <&cpg CPG_MOD 705>,
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   934  				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   935  				 <&scif_clk2>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   936  			clock-names = "fck", "brg_int", "scif_clk";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   937  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   938  			resets = <&cpg 705>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   939  			dmas = <&dmac1 0x59>, <&dmac1 0x58>,
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   940  			       <&dmac2 0x59>, <&dmac2 0x58>;
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   941  			dma-names = "tx", "rx", "tx", "rx";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   942  			status = "disabled";
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   943  		};
0833ec2fc4b1f01 Geert Uytterhoeven 2024-03-12   944  
a6e140f174366e1 Thanh Quan         2024-04-16   945  		msiof0: spi@e6e90000 {
a6e140f174366e1 Thanh Quan         2024-04-16   946  			compatible = "renesas,msiof-r8a779h0",
a6e140f174366e1 Thanh Quan         2024-04-16   947  				     "renesas,rcar-gen4-msiof";
a6e140f174366e1 Thanh Quan         2024-04-16   948  			reg = <0 0xe6e90000 0 0x0064>;
a6e140f174366e1 Thanh Quan         2024-04-16   949  			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
a6e140f174366e1 Thanh Quan         2024-04-16   950  			clocks = <&cpg CPG_MOD 618>;
a6e140f174366e1 Thanh Quan         2024-04-16   951  			dmas = <&dmac1 0x41>, <&dmac1 0x40>,
a6e140f174366e1 Thanh Quan         2024-04-16   952  			       <&dmac2 0x41>, <&dmac2 0x40>;
a6e140f174366e1 Thanh Quan         2024-04-16   953  			dma-names = "tx", "rx", "tx", "rx";
a6e140f174366e1 Thanh Quan         2024-04-16   954  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
a6e140f174366e1 Thanh Quan         2024-04-16   955  			resets = <&cpg 618>;
a6e140f174366e1 Thanh Quan         2024-04-16   956  			#address-cells = <1>;
a6e140f174366e1 Thanh Quan         2024-04-16   957  			#size-cells = <0>;
a6e140f174366e1 Thanh Quan         2024-04-16   958  			status = "disabled";
a6e140f174366e1 Thanh Quan         2024-04-16   959  		};
a6e140f174366e1 Thanh Quan         2024-04-16   960  
a6e140f174366e1 Thanh Quan         2024-04-16   961  		msiof1: spi@e6ea0000 {
a6e140f174366e1 Thanh Quan         2024-04-16   962  			compatible = "renesas,msiof-r8a779h0",
a6e140f174366e1 Thanh Quan         2024-04-16   963  				     "renesas,rcar-gen4-msiof";
a6e140f174366e1 Thanh Quan         2024-04-16   964  			reg = <0 0xe6ea0000 0 0x0064>;
a6e140f174366e1 Thanh Quan         2024-04-16   965  			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
a6e140f174366e1 Thanh Quan         2024-04-16   966  			clocks = <&cpg CPG_MOD 619>;
a6e140f174366e1 Thanh Quan         2024-04-16   967  			dmas = <&dmac1 0x43>, <&dmac1 0x42>,
a6e140f174366e1 Thanh Quan         2024-04-16   968  			       <&dmac2 0x43>, <&dmac2 0x42>;
a6e140f174366e1 Thanh Quan         2024-04-16   969  			dma-names = "tx", "rx", "tx", "rx";
a6e140f174366e1 Thanh Quan         2024-04-16   970  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
a6e140f174366e1 Thanh Quan         2024-04-16   971  			resets = <&cpg 619>;
a6e140f174366e1 Thanh Quan         2024-04-16   972  			#address-cells = <1>;
a6e140f174366e1 Thanh Quan         2024-04-16   973  			#size-cells = <0>;
a6e140f174366e1 Thanh Quan         2024-04-16   974  			status = "disabled";
a6e140f174366e1 Thanh Quan         2024-04-16   975  		};
a6e140f174366e1 Thanh Quan         2024-04-16   976  
a6e140f174366e1 Thanh Quan         2024-04-16   977  		msiof2: spi@e6c00000 {
a6e140f174366e1 Thanh Quan         2024-04-16   978  			compatible = "renesas,msiof-r8a779h0",
a6e140f174366e1 Thanh Quan         2024-04-16   979  				     "renesas,rcar-gen4-msiof";
a6e140f174366e1 Thanh Quan         2024-04-16   980  			reg = <0 0xe6c00000 0 0x0064>;
a6e140f174366e1 Thanh Quan         2024-04-16   981  			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
a6e140f174366e1 Thanh Quan         2024-04-16   982  			clocks = <&cpg CPG_MOD 620>;
a6e140f174366e1 Thanh Quan         2024-04-16   983  			dmas = <&dmac1 0x45>, <&dmac1 0x44>,
a6e140f174366e1 Thanh Quan         2024-04-16   984  			       <&dmac2 0x45>, <&dmac2 0x44>;
a6e140f174366e1 Thanh Quan         2024-04-16   985  			dma-names = "tx", "rx", "tx", "rx";
a6e140f174366e1 Thanh Quan         2024-04-16   986  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
a6e140f174366e1 Thanh Quan         2024-04-16   987  			resets = <&cpg 620>;
a6e140f174366e1 Thanh Quan         2024-04-16   988  			#address-cells = <1>;
a6e140f174366e1 Thanh Quan         2024-04-16   989  			#size-cells = <0>;
a6e140f174366e1 Thanh Quan         2024-04-16   990  			status = "disabled";
a6e140f174366e1 Thanh Quan         2024-04-16   991  		};
a6e140f174366e1 Thanh Quan         2024-04-16   992  
a6e140f174366e1 Thanh Quan         2024-04-16   993  		msiof3: spi@e6c10000 {
a6e140f174366e1 Thanh Quan         2024-04-16   994  			compatible = "renesas,msiof-r8a779h0",
a6e140f174366e1 Thanh Quan         2024-04-16   995  				     "renesas,rcar-gen4-msiof";
a6e140f174366e1 Thanh Quan         2024-04-16   996  			reg = <0 0xe6c10000 0 0x0064>;
a6e140f174366e1 Thanh Quan         2024-04-16   997  			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
a6e140f174366e1 Thanh Quan         2024-04-16   998  			clocks = <&cpg CPG_MOD 621>;
a6e140f174366e1 Thanh Quan         2024-04-16   999  			dmas = <&dmac1 0x47>, <&dmac1 0x46>,
a6e140f174366e1 Thanh Quan         2024-04-16  1000  			       <&dmac2 0x47>, <&dmac2 0x46>;
a6e140f174366e1 Thanh Quan         2024-04-16  1001  			dma-names = "tx", "rx", "tx", "rx";
a6e140f174366e1 Thanh Quan         2024-04-16  1002  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
a6e140f174366e1 Thanh Quan         2024-04-16  1003  			resets = <&cpg 621>;
a6e140f174366e1 Thanh Quan         2024-04-16  1004  			#address-cells = <1>;
a6e140f174366e1 Thanh Quan         2024-04-16  1005  			#size-cells = <0>;
a6e140f174366e1 Thanh Quan         2024-04-16  1006  			status = "disabled";
a6e140f174366e1 Thanh Quan         2024-04-16  1007  		};
a6e140f174366e1 Thanh Quan         2024-04-16  1008  
a6e140f174366e1 Thanh Quan         2024-04-16  1009  		msiof4: spi@e6c20000 {
a6e140f174366e1 Thanh Quan         2024-04-16  1010  			compatible = "renesas,msiof-r8a779h0",
a6e140f174366e1 Thanh Quan         2024-04-16  1011  				     "renesas,rcar-gen4-msiof";
a6e140f174366e1 Thanh Quan         2024-04-16  1012  			reg = <0 0xe6c20000 0 0x0064>;
a6e140f174366e1 Thanh Quan         2024-04-16  1013  			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
a6e140f174366e1 Thanh Quan         2024-04-16  1014  			clocks = <&cpg CPG_MOD 622>;
a6e140f174366e1 Thanh Quan         2024-04-16  1015  			dmas = <&dmac1 0x49>, <&dmac1 0x48>,
a6e140f174366e1 Thanh Quan         2024-04-16  1016  			       <&dmac2 0x49>, <&dmac2 0x48>;
a6e140f174366e1 Thanh Quan         2024-04-16  1017  			dma-names = "tx", "rx", "tx", "rx";
a6e140f174366e1 Thanh Quan         2024-04-16  1018  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
a6e140f174366e1 Thanh Quan         2024-04-16  1019  			resets = <&cpg 622>;
a6e140f174366e1 Thanh Quan         2024-04-16  1020  			#address-cells = <1>;
a6e140f174366e1 Thanh Quan         2024-04-16  1021  			#size-cells = <0>;
a6e140f174366e1 Thanh Quan         2024-04-16  1022  			status = "disabled";
a6e140f174366e1 Thanh Quan         2024-04-16  1023  		};
a6e140f174366e1 Thanh Quan         2024-04-16  1024  
a6e140f174366e1 Thanh Quan         2024-04-16  1025  		msiof5: spi@e6c28000 {
a6e140f174366e1 Thanh Quan         2024-04-16  1026  			compatible = "renesas,msiof-r8a779h0",
a6e140f174366e1 Thanh Quan         2024-04-16  1027  				     "renesas,rcar-gen4-msiof";
a6e140f174366e1 Thanh Quan         2024-04-16  1028  			reg = <0 0xe6c28000 0 0x0064>;
a6e140f174366e1 Thanh Quan         2024-04-16  1029  			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
a6e140f174366e1 Thanh Quan         2024-04-16  1030  			clocks = <&cpg CPG_MOD 623>;
a6e140f174366e1 Thanh Quan         2024-04-16  1031  			dmas = <&dmac1 0x4b>, <&dmac1 0x4a>,
a6e140f174366e1 Thanh Quan         2024-04-16  1032  			       <&dmac2 0x4b>, <&dmac2 0x4a>;
a6e140f174366e1 Thanh Quan         2024-04-16  1033  			dma-names = "tx", "rx", "tx", "rx";
a6e140f174366e1 Thanh Quan         2024-04-16  1034  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
a6e140f174366e1 Thanh Quan         2024-04-16  1035  			resets = <&cpg 623>;
a6e140f174366e1 Thanh Quan         2024-04-16  1036  			#address-cells = <1>;
a6e140f174366e1 Thanh Quan         2024-04-16  1037  			#size-cells = <0>;
a6e140f174366e1 Thanh Quan         2024-04-16  1038  			status = "disabled";
a6e140f174366e1 Thanh Quan         2024-04-16  1039  		};
a6e140f174366e1 Thanh Quan         2024-04-16  1040  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1041  		vin00: video@e6ef0000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1042  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1043  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1044  			reg = <0 0xe6ef0000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1045  			interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1046  			clocks = <&cpg CPG_MOD 730>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1047  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1048  			resets = <&cpg 730>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1049  			renesas,id = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1050  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1051  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1052  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1053  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1054  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1055  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1056  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1057  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1058  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1059  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1060  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1061  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1062  					vin00isp0: endpoint@0 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1063  						reg = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1064  						remote-endpoint = <&isp0vin00>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1065  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1066  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1067  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1068  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1069  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1070  		vin01: video@e6ef1000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1071  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1072  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1073  			reg = <0 0xe6ef1000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1074  			interrupts = <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1075  			clocks = <&cpg CPG_MOD 731>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1076  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1077  			resets = <&cpg 731>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1078  			renesas,id = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1079  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1080  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1081  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1082  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1083  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1084  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1085  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1086  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1087  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1088  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1089  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1090  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1091  					vin01isp0: endpoint@0 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1092  						reg = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1093  						remote-endpoint = <&isp0vin01>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1094  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1095  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1096  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1097  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1098  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1099  		vin02: video@e6ef2000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1100  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1101  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1102  			reg = <0 0xe6ef2000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1103  			interrupts = <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1104  			clocks = <&cpg CPG_MOD 800>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1105  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1106  			resets = <&cpg 800>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1107  			renesas,id = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1108  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1109  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1110  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1111  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1112  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1113  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1114  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1115  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1116  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1117  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1118  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1119  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1120  					vin02isp0: endpoint@0 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1121  						reg = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1122  						remote-endpoint = <&isp0vin02>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1123  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1124  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1125  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1126  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1127  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1128  		vin03: video@e6ef3000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1129  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1130  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1131  			reg = <0 0xe6ef3000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1132  			interrupts = <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1133  			clocks = <&cpg CPG_MOD 801>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1134  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1135  			resets = <&cpg 801>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1136  			renesas,id = <3>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1137  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1138  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1139  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1140  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1141  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1142  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1143  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1144  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1145  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1146  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1147  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1148  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1149  					vin03isp0: endpoint@0 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1150  						reg = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1151  						remote-endpoint = <&isp0vin03>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1152  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1153  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1154  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1155  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1156  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1157  		vin04: video@e6ef4000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1158  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1159  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1160  			reg = <0 0xe6ef4000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1161  			interrupts = <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1162  			clocks = <&cpg CPG_MOD 802>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1163  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1164  			resets = <&cpg 802>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1165  			renesas,id = <4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1166  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1167  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1168  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1169  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1170  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1171  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1172  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1173  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1174  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1175  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1176  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1177  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1178  					vin04isp0: endpoint@0 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1179  						reg = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1180  						remote-endpoint = <&isp0vin04>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1181  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1182  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1183  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1184  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1185  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1186  		vin05: video@e6ef5000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1187  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1188  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1189  			reg = <0 0xe6ef5000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1190  			interrupts = <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1191  			clocks = <&cpg CPG_MOD 803>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1192  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1193  			resets = <&cpg 803>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1194  			renesas,id = <5>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1195  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1196  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1197  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1198  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1199  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1200  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1201  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1202  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1203  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1204  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1205  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1206  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1207  					vin05isp0: endpoint@0 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1208  						reg = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1209  						remote-endpoint = <&isp0vin05>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1210  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1211  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1212  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1213  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1214  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1215  		vin06: video@e6ef6000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1216  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1217  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1218  			reg = <0 0xe6ef6000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1219  			interrupts = <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1220  			clocks = <&cpg CPG_MOD 804>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1221  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1222  			resets = <&cpg 804>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1223  			renesas,id = <6>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1224  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1225  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1226  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1227  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1228  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1229  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1230  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1231  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1232  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1233  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1234  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1235  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1236  					vin06isp0: endpoint@0 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1237  						reg = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1238  						remote-endpoint = <&isp0vin06>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1239  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1240  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1241  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1242  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1243  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1244  		vin07: video@e6ef7000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1245  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1246  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1247  			reg = <0 0xe6ef7000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1248  			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1249  			clocks = <&cpg CPG_MOD 805>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1250  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1251  			resets = <&cpg 805>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1252  			renesas,id = <7>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1253  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1254  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1255  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1256  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1257  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1258  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1259  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1260  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1261  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1262  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1263  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1264  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1265  					vin07isp0: endpoint@0 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1266  						reg = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1267  						remote-endpoint = <&isp0vin07>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1268  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1269  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1270  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1271  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1272  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1273  		vin08: video@e6ef8000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1274  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1275  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1276  			reg = <0 0xe6ef8000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1277  			interrupts = <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1278  			clocks = <&cpg CPG_MOD 806>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1279  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1280  			resets = <&cpg 806>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1281  			renesas,id = <8>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1282  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1283  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1284  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1285  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1286  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1287  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1288  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1289  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1290  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1291  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1292  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1293  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1294  					vin08isp1: endpoint@1 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1295  						reg = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1296  						remote-endpoint = <&isp1vin08>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1297  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1298  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1299  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1300  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1301  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1302  		vin09: video@e6ef9000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1303  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1304  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1305  			reg = <0 0xe6ef9000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1306  			interrupts = <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1307  			clocks = <&cpg CPG_MOD 807>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1308  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1309  			resets = <&cpg 807>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1310  			renesas,id = <9>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1311  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1312  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1313  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1314  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1315  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1316  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1317  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1318  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1319  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1320  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1321  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1322  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1323  					vin09isp1: endpoint@1 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1324  						reg = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1325  						remote-endpoint = <&isp1vin09>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1326  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1327  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1328  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1329  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1330  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1331  		vin10: video@e6efa000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1332  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1333  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1334  			reg = <0 0xe6efa000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1335  			interrupts = <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1336  			clocks = <&cpg CPG_MOD 808>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1337  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1338  			resets = <&cpg 808>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1339  			renesas,id = <10>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1340  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1341  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1342  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1343  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1344  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1345  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1346  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1347  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1348  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1349  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1350  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1351  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1352  					vin10isp1: endpoint@1 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1353  						reg = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1354  						remote-endpoint = <&isp1vin10>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1355  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1356  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1357  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1358  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1359  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1360  		vin11: video@e6efb000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1361  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1362  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1363  			reg = <0 0xe6efb000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1364  			interrupts = <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1365  			clocks = <&cpg CPG_MOD 809>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1366  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1367  			resets = <&cpg 809>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1368  			renesas,id = <11>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1369  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1370  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1371  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1372  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1373  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1374  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1375  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1376  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1377  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1378  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1379  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1380  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1381  					vin11isp1: endpoint@1 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1382  						reg = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1383  						remote-endpoint = <&isp1vin11>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1384  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1385  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1386  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1387  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1388  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1389  		vin12: video@e6efc000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1390  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1391  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1392  			reg = <0 0xe6efc000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1393  			interrupts = <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1394  			clocks = <&cpg CPG_MOD 810>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1395  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1396  			resets = <&cpg 810>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1397  			renesas,id = <12>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1398  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1399  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1400  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1401  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1402  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1403  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1404  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1405  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1406  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1407  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1408  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1409  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1410  					vin12isp1: endpoint@1 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1411  						reg = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1412  						remote-endpoint = <&isp1vin12>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1413  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1414  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1415  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1416  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1417  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1418  		vin13: video@e6efd000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1419  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1420  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1421  			reg = <0 0xe6efd000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1422  			interrupts = <GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1423  			clocks = <&cpg CPG_MOD 811>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1424  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1425  			resets = <&cpg 811>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1426  			renesas,id = <13>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1427  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1428  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1429  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1430  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1431  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1432  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1433  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1434  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1435  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1436  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1437  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1438  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1439  					vin13isp1: endpoint@1 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1440  						reg = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1441  						remote-endpoint = <&isp1vin13>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1442  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1443  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1444  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1445  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1446  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1447  		vin14: video@e6efe000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1448  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1449  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1450  			reg = <0 0xe6efe000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1451  			interrupts = <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1452  			clocks = <&cpg CPG_MOD 812>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1453  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1454  			resets = <&cpg 812>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1455  			renesas,id = <14>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1456  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1457  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1458  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1459  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1460  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1461  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1462  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1463  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1464  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1465  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1466  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1467  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1468  					vin14isp1: endpoint@1 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1469  						reg = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1470  						remote-endpoint = <&isp1vin14>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1471  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1472  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1473  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1474  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1475  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1476  		vin15: video@e6eff000 {
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1477  			compatible = "renesas,vin-r8a779h0",
c92be7b6b3559d5 Niklas Söderlund   2024-07-04  1478  				     "renesas,rcar-gen4-vin";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1479  			reg = <0 0xe6eff000 0 0x1000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1480  			interrupts = <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1481  			clocks = <&cpg CPG_MOD 813>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1482  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1483  			resets = <&cpg 813>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1484  			renesas,id = <15>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1485  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1486  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1487  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1488  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1489  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1490  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1491  				port@2 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1492  					#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1493  					#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1494  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1495  					reg = <2>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1496  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1497  					vin15isp1: endpoint@1 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1498  						reg = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1499  						remote-endpoint = <&isp1vin15>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1500  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1501  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1502  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1503  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1504  
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1505  		dmac1: dma-controller@e7350000 {
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1506  			compatible = "renesas,dmac-r8a779h0",
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1507  				     "renesas,rcar-gen4-dmac";
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1508  			reg = <0 0xe7350000 0 0x1000>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1509  			      <0 0xe7300000 0 0x10000>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1510  			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1511  				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1512  				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1513  				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1514  				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1515  				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1516  				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1517  				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1518  				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1519  				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1520  				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1521  				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1522  				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1523  				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1524  				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1525  				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1526  				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1527  			interrupt-names = "error",
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1528  					  "ch0", "ch1", "ch2", "ch3", "ch4",
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1529  					  "ch5", "ch6", "ch7", "ch8", "ch9",
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1530  					  "ch10", "ch11", "ch12", "ch13",
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1531  					  "ch14", "ch15";
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1532  			clocks = <&cpg CPG_MOD 709>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1533  			clock-names = "fck";
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1534  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1535  			resets = <&cpg 709>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1536  			#dma-cells = <1>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1537  			dma-channels = <16>;
f026b6426603d25 Geert Uytterhoeven 2024-04-19  1538  			iommus = <&ipmmu_ds0 0>, <&ipmmu_ds0 1>,
f026b6426603d25 Geert Uytterhoeven 2024-04-19  1539  				 <&ipmmu_ds0 2>, <&ipmmu_ds0 3>,
f026b6426603d25 Geert Uytterhoeven 2024-04-19  1540  				 <&ipmmu_ds0 4>, <&ipmmu_ds0 5>,
f026b6426603d25 Geert Uytterhoeven 2024-04-19  1541  				 <&ipmmu_ds0 6>, <&ipmmu_ds0 7>,
f026b6426603d25 Geert Uytterhoeven 2024-04-19  1542  				 <&ipmmu_ds0 8>, <&ipmmu_ds0 9>,
f026b6426603d25 Geert Uytterhoeven 2024-04-19  1543  				 <&ipmmu_ds0 10>, <&ipmmu_ds0 11>,
f026b6426603d25 Geert Uytterhoeven 2024-04-19  1544  				 <&ipmmu_ds0 12>, <&ipmmu_ds0 13>,
f026b6426603d25 Geert Uytterhoeven 2024-04-19  1545  				 <&ipmmu_ds0 14>, <&ipmmu_ds0 15>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1546  		};
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1547  
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1548  		dmac2: dma-controller@e7351000 {
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1549  			compatible = "renesas,dmac-r8a779h0",
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1550  				     "renesas,rcar-gen4-dmac";
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1551  			reg = <0 0xe7351000 0 0x1000>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1552  			      <0 0xe7310000 0 0x10000>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1553  			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1554  				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1555  				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1556  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1557  				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1558  				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1559  				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1560  				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1561  				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1562  			interrupt-names = "error",
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1563  					  "ch0", "ch1", "ch2", "ch3", "ch4",
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1564  					  "ch5", "ch6", "ch7";
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1565  			clocks = <&cpg CPG_MOD 710>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1566  			clock-names = "fck";
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1567  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1568  			resets = <&cpg 710>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1569  			#dma-cells = <1>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1570  			dma-channels = <8>;
f026b6426603d25 Geert Uytterhoeven 2024-04-19  1571  			iommus = <&ipmmu_ds0 16>, <&ipmmu_ds0 17>,
f026b6426603d25 Geert Uytterhoeven 2024-04-19  1572  				 <&ipmmu_ds0 18>, <&ipmmu_ds0 19>,
f026b6426603d25 Geert Uytterhoeven 2024-04-19  1573  				 <&ipmmu_ds0 20>, <&ipmmu_ds0 21>,
f026b6426603d25 Geert Uytterhoeven 2024-04-19  1574  				 <&ipmmu_ds0 22>, <&ipmmu_ds0 23>;
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1575  		};
7a7db3d1d7942a2 Geert Uytterhoeven 2024-02-14  1576  
07e777318911d76 Kuninori Morimoto  2024-06-24  1577  		rcar_sound: sound@ec400000 {
07e777318911d76 Kuninori Morimoto  2024-06-24  1578  			compatible = "renesas,rcar_sound-r8a779h0", "renesas,rcar_sound-gen4";
07e777318911d76 Kuninori Morimoto  2024-06-24  1579  			reg = <0 0xec400000 0 0x40000>,
07e777318911d76 Kuninori Morimoto  2024-06-24  1580  			      <0 0xec540000 0 0x1000>,
07e777318911d76 Kuninori Morimoto  2024-06-24  1581  			      <0 0xec541000 0 0x050>,
07e777318911d76 Kuninori Morimoto  2024-06-24  1582  			      <0 0xec5a0000 0 0x020>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1583  			reg-names = "sdmc", "ssiu", "ssi", "adg";
07e777318911d76 Kuninori Morimoto  2024-06-24  1584  			clocks = <&cpg CPG_MOD 2926>, <&cpg CPG_MOD 2927>, <&audio_clkin>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1585  			clock-names = "ssiu.0", "ssi.0", "clkin";
07e777318911d76 Kuninori Morimoto  2024-06-24  1586  			/* #clock-cells is fixed */
07e777318911d76 Kuninori Morimoto  2024-06-24  1587  			#clock-cells = <0>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1588  			/* #sound-dai-cells is fixed */
07e777318911d76 Kuninori Morimoto  2024-06-24  1589  			#sound-dai-cells = <0>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1590  
07e777318911d76 Kuninori Morimoto  2024-06-24  1591  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1592  			resets = <&cpg 2926>, <&cpg 2927>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1593  			reset-names = "ssiu.0", "ssi.0";
07e777318911d76 Kuninori Morimoto  2024-06-24  1594  			status = "disabled";
07e777318911d76 Kuninori Morimoto  2024-06-24  1595  
07e777318911d76 Kuninori Morimoto  2024-06-24  1596  			rcar_sound,ssiu {
07e777318911d76 Kuninori Morimoto  2024-06-24  1597  				ssiu00: ssiu-0 {
07e777318911d76 Kuninori Morimoto  2024-06-24  1598  					dmas = <&dmac1 0x6e>, <&dmac1 0x6f>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1599  					dma-names = "tx", "rx";
07e777318911d76 Kuninori Morimoto  2024-06-24  1600  				};
07e777318911d76 Kuninori Morimoto  2024-06-24  1601  				ssiu01: ssiu-1 {
07e777318911d76 Kuninori Morimoto  2024-06-24  1602  					dmas = <&dmac1 0x6c>, <&dmac1 0x6d>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1603  					dma-names = "tx", "rx";
07e777318911d76 Kuninori Morimoto  2024-06-24  1604  				};
07e777318911d76 Kuninori Morimoto  2024-06-24  1605  				ssiu02: ssiu-2 {
07e777318911d76 Kuninori Morimoto  2024-06-24  1606  					dmas = <&dmac1 0x6a>, <&dmac1 0x6b>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1607  					dma-names = "tx", "rx";
07e777318911d76 Kuninori Morimoto  2024-06-24  1608  				};
07e777318911d76 Kuninori Morimoto  2024-06-24  1609  				ssiu03: ssiu-3 {
07e777318911d76 Kuninori Morimoto  2024-06-24  1610  					dmas = <&dmac1 0x68>, <&dmac1 0x69>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1611  					dma-names = "tx", "rx";
07e777318911d76 Kuninori Morimoto  2024-06-24  1612  				};
07e777318911d76 Kuninori Morimoto  2024-06-24  1613  				ssiu04: ssiu-4 {
07e777318911d76 Kuninori Morimoto  2024-06-24  1614  					dmas = <&dmac1 0x66>, <&dmac1 0x67>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1615  					dma-names = "tx", "rx";
07e777318911d76 Kuninori Morimoto  2024-06-24  1616  				};
07e777318911d76 Kuninori Morimoto  2024-06-24  1617  				ssiu05: ssiu-5 {
07e777318911d76 Kuninori Morimoto  2024-06-24  1618  					dmas = <&dmac1 0x64>, <&dmac1 0x65>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1619  					dma-names = "tx", "rx";
07e777318911d76 Kuninori Morimoto  2024-06-24  1620  				};
07e777318911d76 Kuninori Morimoto  2024-06-24  1621  				ssiu06: ssiu-6 {
07e777318911d76 Kuninori Morimoto  2024-06-24  1622  					dmas = <&dmac1 0x62>, <&dmac1 0x63>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1623  					dma-names = "tx", "rx";
07e777318911d76 Kuninori Morimoto  2024-06-24  1624  				};
07e777318911d76 Kuninori Morimoto  2024-06-24  1625  				ssiu07: ssiu-7 {
07e777318911d76 Kuninori Morimoto  2024-06-24  1626  					dmas = <&dmac1 0x60>, <&dmac1 0x61>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1627  					dma-names = "tx", "rx";
07e777318911d76 Kuninori Morimoto  2024-06-24  1628  				};
07e777318911d76 Kuninori Morimoto  2024-06-24  1629  			};
07e777318911d76 Kuninori Morimoto  2024-06-24  1630  
07e777318911d76 Kuninori Morimoto  2024-06-24  1631  			rcar_sound,ssi {
07e777318911d76 Kuninori Morimoto  2024-06-24  1632  				ssi0: ssi-0 {
07e777318911d76 Kuninori Morimoto  2024-06-24  1633  					interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>;
07e777318911d76 Kuninori Morimoto  2024-06-24  1634  				};
07e777318911d76 Kuninori Morimoto  2024-06-24  1635  			};
07e777318911d76 Kuninori Morimoto  2024-06-24  1636  		};
07e777318911d76 Kuninori Morimoto  2024-06-24  1637  
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1638  		mmc0: mmc@ee140000 {
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1639  			compatible = "renesas,sdhi-r8a779h0",
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1640  				     "renesas,rcar-gen4-sdhi";
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1641  			reg = <0 0xee140000 0 0x2000>;
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1642  			interrupts = <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>;
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1643  			clocks = <&cpg CPG_MOD 706>,
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1644  				 <&cpg CPG_CORE R8A779H0_CLK_SD0H>;
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1645  			clock-names = "core", "clkh";
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1646  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1647  			resets = <&cpg 706>;
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1648  			max-frequency = <200000000>;
f026b6426603d25 Geert Uytterhoeven 2024-04-19  1649  			iommus = <&ipmmu_ds0 32>;
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1650  			status = "disabled";
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1651  		};
a0ac5b9d980a0a5 Cong Dang          2024-02-14  1652  
4cd9289b70e54a9 Cong Dang          2024-02-19  1653  		rpc: spi@ee200000 {
4cd9289b70e54a9 Cong Dang          2024-02-19  1654  			compatible = "renesas,r8a779h0-rpc-if",
4cd9289b70e54a9 Cong Dang          2024-02-19  1655  				     "renesas,rcar-gen4-rpc-if";
4cd9289b70e54a9 Cong Dang          2024-02-19  1656  			reg = <0 0xee200000 0 0x200>,
4cd9289b70e54a9 Cong Dang          2024-02-19  1657  			      <0 0x08000000 0 0x04000000>,
4cd9289b70e54a9 Cong Dang          2024-02-19  1658  			      <0 0xee208000 0 0x100>;
4cd9289b70e54a9 Cong Dang          2024-02-19  1659  			reg-names = "regs", "dirmap", "wbuf";
4cd9289b70e54a9 Cong Dang          2024-02-19  1660  			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
4cd9289b70e54a9 Cong Dang          2024-02-19  1661  			clocks = <&cpg CPG_MOD 629>;
4cd9289b70e54a9 Cong Dang          2024-02-19  1662  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
4cd9289b70e54a9 Cong Dang          2024-02-19  1663  			resets = <&cpg 629>;
4cd9289b70e54a9 Cong Dang          2024-02-19  1664  			#address-cells = <1>;
4cd9289b70e54a9 Cong Dang          2024-02-19  1665  			#size-cells = <0>;
4cd9289b70e54a9 Cong Dang          2024-02-19  1666  			status = "disabled";
4cd9289b70e54a9 Cong Dang          2024-02-19  1667  		};
4cd9289b70e54a9 Cong Dang          2024-02-19  1668  
5bd21a000969701 Thanh Le           2024-04-19  1669  		ipmmu_rt0: iommu@ee480000 {
5bd21a000969701 Thanh Le           2024-04-19  1670  			compatible = "renesas,ipmmu-r8a779h0",
5bd21a000969701 Thanh Le           2024-04-19  1671  				     "renesas,rcar-gen4-ipmmu-vmsa";
5bd21a000969701 Thanh Le           2024-04-19  1672  			reg = <0 0xee480000 0 0x20000>;
5bd21a000969701 Thanh Le           2024-04-19  1673  			renesas,ipmmu-main = <&ipmmu_mm>;
5bd21a000969701 Thanh Le           2024-04-19  1674  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
5bd21a000969701 Thanh Le           2024-04-19  1675  			#iommu-cells = <1>;
5bd21a000969701 Thanh Le           2024-04-19  1676  		};
5bd21a000969701 Thanh Le           2024-04-19  1677  
5bd21a000969701 Thanh Le           2024-04-19  1678  		ipmmu_rt1: iommu@ee4c0000 {
5bd21a000969701 Thanh Le           2024-04-19  1679  			compatible = "renesas,ipmmu-r8a779h0",
5bd21a000969701 Thanh Le           2024-04-19  1680  				     "renesas,rcar-gen4-ipmmu-vmsa";
5bd21a000969701 Thanh Le           2024-04-19  1681  			reg = <0 0xee4c0000 0 0x20000>;
5bd21a000969701 Thanh Le           2024-04-19  1682  			renesas,ipmmu-main = <&ipmmu_mm>;
5bd21a000969701 Thanh Le           2024-04-19  1683  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
5bd21a000969701 Thanh Le           2024-04-19  1684  			#iommu-cells = <1>;
5bd21a000969701 Thanh Le           2024-04-19  1685  		};
5bd21a000969701 Thanh Le           2024-04-19  1686  
5bd21a000969701 Thanh Le           2024-04-19  1687  		ipmmu_ds0: iommu@eed00000 {
5bd21a000969701 Thanh Le           2024-04-19  1688  			compatible = "renesas,ipmmu-r8a779h0",
5bd21a000969701 Thanh Le           2024-04-19  1689  				     "renesas,rcar-gen4-ipmmu-vmsa";
5bd21a000969701 Thanh Le           2024-04-19  1690  			reg = <0 0xeed00000 0 0x20000>;
5bd21a000969701 Thanh Le           2024-04-19  1691  			renesas,ipmmu-main = <&ipmmu_mm>;
5bd21a000969701 Thanh Le           2024-04-19  1692  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
5bd21a000969701 Thanh Le           2024-04-19  1693  			#iommu-cells = <1>;
5bd21a000969701 Thanh Le           2024-04-19  1694  		};
5bd21a000969701 Thanh Le           2024-04-19  1695  
5bd21a000969701 Thanh Le           2024-04-19  1696  		ipmmu_hc: iommu@eed40000 {
5bd21a000969701 Thanh Le           2024-04-19  1697  			compatible = "renesas,ipmmu-r8a779h0",
5bd21a000969701 Thanh Le           2024-04-19  1698  				     "renesas,rcar-gen4-ipmmu-vmsa";
5bd21a000969701 Thanh Le           2024-04-19  1699  			reg = <0 0xeed40000 0 0x20000>;
5bd21a000969701 Thanh Le           2024-04-19  1700  			renesas,ipmmu-main = <&ipmmu_mm>;
5bd21a000969701 Thanh Le           2024-04-19  1701  			power-domains = <&sysc R8A779H0_PD_C4>;
5bd21a000969701 Thanh Le           2024-04-19  1702  			#iommu-cells = <1>;
5bd21a000969701 Thanh Le           2024-04-19  1703  		};
5bd21a000969701 Thanh Le           2024-04-19  1704  
5bd21a000969701 Thanh Le           2024-04-19  1705  		ipmmu_ir: iommu@eed80000 {
5bd21a000969701 Thanh Le           2024-04-19  1706  			compatible = "renesas,ipmmu-r8a779h0",
5bd21a000969701 Thanh Le           2024-04-19  1707  				     "renesas,rcar-gen4-ipmmu-vmsa";
5bd21a000969701 Thanh Le           2024-04-19  1708  			reg = <0 0xeed80000 0 0x20000>;
5bd21a000969701 Thanh Le           2024-04-19  1709  			renesas,ipmmu-main = <&ipmmu_mm>;
5bd21a000969701 Thanh Le           2024-04-19  1710  			power-domains = <&sysc R8A779H0_PD_C4>;
5bd21a000969701 Thanh Le           2024-04-19  1711  			#iommu-cells = <1>;
5bd21a000969701 Thanh Le           2024-04-19  1712  		};
5bd21a000969701 Thanh Le           2024-04-19  1713  
5bd21a000969701 Thanh Le           2024-04-19  1714  		ipmmu_vc: iommu@eedc0000 {
5bd21a000969701 Thanh Le           2024-04-19  1715  			compatible = "renesas,ipmmu-r8a779h0",
5bd21a000969701 Thanh Le           2024-04-19  1716  				     "renesas,rcar-gen4-ipmmu-vmsa";
5bd21a000969701 Thanh Le           2024-04-19  1717  			reg = <0 0xeedc0000 0 0x20000>;
5bd21a000969701 Thanh Le           2024-04-19  1718  			renesas,ipmmu-main = <&ipmmu_mm>;
5bd21a000969701 Thanh Le           2024-04-19  1719  			power-domains = <&sysc R8A779H0_PD_C4>;
5bd21a000969701 Thanh Le           2024-04-19  1720  			#iommu-cells = <1>;
5bd21a000969701 Thanh Le           2024-04-19  1721  		};
5bd21a000969701 Thanh Le           2024-04-19  1722  
5bd21a000969701 Thanh Le           2024-04-19  1723  		ipmmu_3dg: iommu@eee00000 {
5bd21a000969701 Thanh Le           2024-04-19  1724  			compatible = "renesas,ipmmu-r8a779h0",
5bd21a000969701 Thanh Le           2024-04-19  1725  				     "renesas,rcar-gen4-ipmmu-vmsa";
5bd21a000969701 Thanh Le           2024-04-19  1726  			reg = <0 0xeee00000 0 0x20000>;
5bd21a000969701 Thanh Le           2024-04-19  1727  			renesas,ipmmu-main = <&ipmmu_mm>;
5bd21a000969701 Thanh Le           2024-04-19  1728  			power-domains = <&sysc R8A779H0_PD_C4>;
5bd21a000969701 Thanh Le           2024-04-19  1729  			#iommu-cells = <1>;
5bd21a000969701 Thanh Le           2024-04-19  1730  		};
5bd21a000969701 Thanh Le           2024-04-19  1731  
5bd21a000969701 Thanh Le           2024-04-19  1732  		ipmmu_vi0: iommu@eee80000 {
5bd21a000969701 Thanh Le           2024-04-19  1733  			compatible = "renesas,ipmmu-r8a779h0",
5bd21a000969701 Thanh Le           2024-04-19  1734  				     "renesas,rcar-gen4-ipmmu-vmsa";
5bd21a000969701 Thanh Le           2024-04-19  1735  			reg = <0 0xeee80000 0 0x20000>;
5bd21a000969701 Thanh Le           2024-04-19  1736  			renesas,ipmmu-main = <&ipmmu_mm>;
5bd21a000969701 Thanh Le           2024-04-19  1737  			power-domains = <&sysc R8A779H0_PD_C4>;
5bd21a000969701 Thanh Le           2024-04-19  1738  			#iommu-cells = <1>;
5bd21a000969701 Thanh Le           2024-04-19  1739  		};
5bd21a000969701 Thanh Le           2024-04-19  1740  
5bd21a000969701 Thanh Le           2024-04-19  1741  		ipmmu_vi1: iommu@eeec0000 {
5bd21a000969701 Thanh Le           2024-04-19  1742  			compatible = "renesas,ipmmu-r8a779h0",
5bd21a000969701 Thanh Le           2024-04-19  1743  				     "renesas,rcar-gen4-ipmmu-vmsa";
5bd21a000969701 Thanh Le           2024-04-19  1744  			reg = <0 0xeeec0000 0 0x20000>;
5bd21a000969701 Thanh Le           2024-04-19  1745  			renesas,ipmmu-main = <&ipmmu_mm>;
5bd21a000969701 Thanh Le           2024-04-19  1746  			power-domains = <&sysc R8A779H0_PD_C4>;
5bd21a000969701 Thanh Le           2024-04-19  1747  			#iommu-cells = <1>;
5bd21a000969701 Thanh Le           2024-04-19  1748  		};
5bd21a000969701 Thanh Le           2024-04-19  1749  
5bd21a000969701 Thanh Le           2024-04-19  1750  		ipmmu_vip0: iommu@eef00000 {
5bd21a000969701 Thanh Le           2024-04-19  1751  			compatible = "renesas,ipmmu-r8a779h0",
5bd21a000969701 Thanh Le           2024-04-19  1752  				     "renesas,rcar-gen4-ipmmu-vmsa";
5bd21a000969701 Thanh Le           2024-04-19  1753  			reg = <0 0xeef00000 0 0x20000>;
5bd21a000969701 Thanh Le           2024-04-19  1754  			renesas,ipmmu-main = <&ipmmu_mm>;
5bd21a000969701 Thanh Le           2024-04-19  1755  			power-domains = <&sysc R8A779H0_PD_C4>;
5bd21a000969701 Thanh Le           2024-04-19  1756  			#iommu-cells = <1>;
5bd21a000969701 Thanh Le           2024-04-19  1757  		};
5bd21a000969701 Thanh Le           2024-04-19  1758  
5bd21a000969701 Thanh Le           2024-04-19  1759  		ipmmu_mm: iommu@eefc0000 {
5bd21a000969701 Thanh Le           2024-04-19  1760  			compatible = "renesas,ipmmu-r8a779h0",
5bd21a000969701 Thanh Le           2024-04-19  1761  				     "renesas,rcar-gen4-ipmmu-vmsa";
5bd21a000969701 Thanh Le           2024-04-19  1762  			reg = <0 0xeefc0000 0 0x20000>;
5bd21a000969701 Thanh Le           2024-04-19  1763  			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
5bd21a000969701 Thanh Le           2024-04-19  1764  				     <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
5bd21a000969701 Thanh Le           2024-04-19  1765  			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
5bd21a000969701 Thanh Le           2024-04-19  1766  			#iommu-cells = <1>;
5bd21a000969701 Thanh Le           2024-04-19  1767  		};
5bd21a000969701 Thanh Le           2024-04-19  1768  
227ec979581047b Hai Pham           2024-01-25  1769  		gic: interrupt-controller@f1000000 {
227ec979581047b Hai Pham           2024-01-25  1770  			compatible = "arm,gic-v3";
227ec979581047b Hai Pham           2024-01-25  1771  			#interrupt-cells = <3>;
227ec979581047b Hai Pham           2024-01-25  1772  			#address-cells = <0>;
227ec979581047b Hai Pham           2024-01-25  1773  			interrupt-controller;
227ec979581047b Hai Pham           2024-01-25  1774  			reg = <0x0 0xf1000000 0 0x20000>,
227ec979581047b Hai Pham           2024-01-25  1775  			      <0x0 0xf1060000 0 0x110000>;
227ec979581047b Hai Pham           2024-01-25  1776  			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
227ec979581047b Hai Pham           2024-01-25  1777  		};
227ec979581047b Hai Pham           2024-01-25  1778  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1779  		csi40: csi2@fe500000 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1780  			compatible = "renesas,r8a779h0-csi2";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1781  			reg = <0 0xfe500000 0 0x40000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1782  			interrupts = <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1783  			clocks = <&cpg CPG_MOD 331>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1784  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1785  			resets = <&cpg 331>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1786  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1787  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1788  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1789  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1790  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1791  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1792  				port@0 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1793  					reg = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1794  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1795  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1796  				port@1 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1797  					reg = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1798  					csi40isp0: endpoint {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1799  						remote-endpoint = <&isp0csi40>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1800  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1801  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1802  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1803  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1804  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1805  		csi41: csi2@fe540000 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1806  			compatible = "renesas,r8a779h0-csi2";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1807  			reg = <0 0xfe540000 0 0x40000>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1808  			interrupts = <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1809  			clocks = <&cpg CPG_MOD 400>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1810  			power-domains = <&sysc R8A779H0_PD_C4>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1811  			resets = <&cpg 400>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1812  			status = "disabled";
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1813  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1814  			ports {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1815  				#address-cells = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1816  				#size-cells = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1817  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1818  				port@0 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1819  					reg = <0>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1820  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1821  
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1822  				port@1 {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1823  					reg = <1>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1824  					csi41isp1: endpoint {
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1825  						remote-endpoint = <&isp1csi41>;
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1826  					};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1827  				};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1828  			};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1829  		};
2bb78d9fb7c997f Niklas Söderlund   2024-05-27  1830  
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1831  		fcpvd0: fcp@fea10000 {
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1832  			compatible = "renesas,fcpv";
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1833  			reg = <0 0xfea10000 0 0x200>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1834  			clocks = <&cpg CPG_MOD 508>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1835  			power-domains = <&sysc R8A779H0_PD_C4>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1836  			resets = <&cpg 508>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1837  		};
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1838  
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1839  		vspd0: vsp@fea20000 {
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1840  			compatible = "renesas,vsp2";
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1841  			reg = <0 0xfea20000 0 0x8000>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1842  			interrupts = <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1843  			clocks = <&cpg CPG_MOD 830>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1844  			power-domains = <&sysc R8A779H0_PD_C4>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1845  			resets = <&cpg 830>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1846  			renesas,fcp = <&fcpvd0>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1847  		};
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1848  
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1849  		du: display@feb00000 {
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1850  			compatible = "renesas,du-r8a779h0";
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1851  			reg = <0 0xfeb00000 0 0x40000>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1852  			interrupts = <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1853  			clocks = <&cpg CPG_MOD 411>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1854  			clock-names = "du.0";
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1855  			power-domains = <&sysc R8A779H0_PD_C4>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1856  			resets = <&cpg 411>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1857  			reset-names = "du.0";
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1858  			renesas,vsps = <&vspd0 0>;
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1859  
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1860  			status = "disabled";
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05  1861  
9ee7e85e9b65e74 Tomi Valkeinen     2024-12-05 @1862  			ports {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
