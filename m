Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358CB28504A
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Jul 2025 17:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752774196; cv=none; b=G7bDXgcGK0qiB5xRgU9d/PWAUhus68rCJV0jO9x2EYWTxt9AQ7V/NQV1qexgpQCKMySni5czfimSCvFfFD1hlargapvkcClLJDRMjSxVIC+DfTtmGA+uEFrzdSk2j8iVaoiQu8dpAd5O+wPeRSq/wA5zQknFKMO9Wzuylz2jzYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752774196; c=relaxed/simple;
	bh=z9pcaMIxmJ5wMqhkc7g204gswSzjlsOXVXIlwd/7npA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a1jN4tRLS7bbLoaJAugUICWo8uFShDDUkbVJo7+ga7BDbfkOK8cG8s0yGl+DJIJSl372Gvol/hjStQd52t3hQ2qsQn8c+SKjiMrfAmStKMGWRslu5MNxwhaREpSMolftwFx5OaOnv3RfNvoOXqIe4NW/mw5VS/9hM7iwHWLeSNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtVfe+dh; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtVfe+dh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752774195; x=1784310195;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z9pcaMIxmJ5wMqhkc7g204gswSzjlsOXVXIlwd/7npA=;
  b=JtVfe+dhBM4fGXkRIXi+Ebk220EIBWbiEReVNN+Q0w1U9IbX6CHGIZDG
   al+a8UKBI0h72an0ovKEi7gf2kv2ccSUZpNZumKPIXo1yJIw2ay4CSaNE
   DEs78RaPT+yIyOkZNj5hWeKMwVF7FBwml8nERAtFmqCM55CVjq2m0/Y8S
   zu7dpzJLe0fYIwHiysaGSI3kvqIQbro3ITwo75VadyjWRe7DRt08Y3bWY
   LLCpjXmQa4dkeplo7EwpuOyrUIDEQwNeqk59NvDxCFacZGHD/DR+3z5Mp
   /kA1XEQ14w9+7oCoRAZBwbkC83cDc+SSX4RauL9V3pO7KLQPI+xRlzNzT
   Q==;
X-CSE-ConnectionGUID: jlJxOqzRR9acYBJc8SsYwA==
X-CSE-MsgGUID: n5ER0e2cQsCLMG+teS8wIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="55207236"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="55207236"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 10:43:15 -0700
X-CSE-ConnectionGUID: TBKlyrbFTuGVYkoOhb9Uwg==
X-CSE-MsgGUID: eptUsffXSdSjL4qMpsEvzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="194990280"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jul 2025 10:43:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucSdR-000DtR-30;
	Thu, 17 Jul 2025 17:43:09 +0000
Date: Fri, 18 Jul 2025 01:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 13/16] ARM: dts: stm32: add ddrperfm on stm32mp151
Message-ID: <202507180138.Cgb0SFVW-lkp@intel.com>
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
In-Reply-To: <20250711-ddrperfm-upstream-v2-13-cdece720348f@foss.st.com>
References: <20250711-ddrperfm-upstream-v2-13-cdece720348f@foss.st.com>
TO: "Clément Le Goffic" <clement.legoffic@foss.st.com>
TO: Will Deacon <will@kernel.org>
TO: Mark Rutland <mark.rutland@arm.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Maxime Coquelin <mcoquelin.stm32@gmail.com>
TO: Alexandre Torgue <alexandre.torgue@foss.st.com>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Gatien Chevallier <gatien.chevallier@foss.st.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
TO: Le Goffic <legoffic.clement@gmail.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-perf-users@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-kernel@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: "Clément Le Goffic" <clement.legoffic@foss.st.com>

Hi Clément,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d7b8f8e20813f0179d8ef519541a3527e7661d3a]

url:    https://github.com/intel-lab-lkp/linux/commits/Cl-ment-Le-Goffic/bus-firewall-move-stm32_firewall-header-file-in-include-folder/20250712-030518
base:   d7b8f8e20813f0179d8ef519541a3527e7661d3a
patch link:    https://lore.kernel.org/r/20250711-ddrperfm-upstream-v2-13-cdece720348f%40foss.st.com
patch subject: [PATCH v2 13/16] ARM: dts: stm32: add ddrperfm on stm32mp151
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-051-20250712 (https://download.01.org/0day-ci/archive/20250718/202507180138.Cgb0SFVW-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180138.Cgb0SFVW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507180138.Cgb0SFVW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/st/stm32mp151a-prtt1a.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
   arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: switch@0 (nxp,sja1105q): Unevaluated properties are not allowed ('clocks', 'reset-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/nxp,sja1105.yaml#
   arch/arm/boot/dts/st/stm32mp151a-prtt1c.dtb: mmc@1 (prt,prtt1c-wfm200): $nodename:0: 'mmc@1' does not match '^wifi(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/net/wireless/silabs,wfx.yaml#
--
>> arch/arm/boot/dts/st/stm32mp151a-prtt1s.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp151a-dhcor-testbench.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp151c-mect1s.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
   arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: audio-controller@44004000 (st,stm32h7-i2s): port:endpoint: Unevaluated properties are not allowed ('format' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/st,stm32-i2s.yaml#
   arch/arm/boot/dts/st/stm32mp151c-plyaqm.dtb: audio-controller@44004000 (st,stm32h7-i2s): Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/st,stm32-i2s.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-dhcom-drc02.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-dhcor-drc-compact.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-avenger96.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-dhcor-avenger96.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-dk1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-dk1-scmi.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): cts-gpios: False schema does not allow [[31, 15, 1]]
   	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml#
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): rts-gpios: False schema does not allow [[32, 0, 1]]
   	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml#
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): Unevaluated properties are not allowed ('bluetooth', 'uart-has-rtscts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/st,stm32-uart.yaml#
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): cts-gpios: False schema does not allow [[31, 15, 1]]
   	from schema $id: http://devicetree.org/schemas/serial/serial.yaml#
   arch/arm/boot/dts/st/stm32mp157a-iot-box.dtb: serial@40010000 (st,stm32h7-uart): rts-gpios: False schema does not allow [[32, 0, 1]]
--
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-microgea-stm32mp1-microdev2.0-of7.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-ctouch2-of10.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-icore-stm32mp1-edimm2.2.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157a-stinger96.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-pdk2.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-dhcom-picoitx.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-dk2.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-dk2-scmi.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ed1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ed1-scmi.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
   arch/arm/boot/dts/st/stm32mp157c-emsbc-argon.dtb: m4@10000000 (st,stm32mp1-m4): 'interrupt-names', 'recovery' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/remoteproc/st,stm32-rproc.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ev1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ev1-scmi.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
   arch/arm/boot/dts/st/stm32mp157c-lxa-mc1.dtb: /soc/bus@5c007000/i2c@40015000/touchscreen@38: failed to match any schema with compatible: ['edt,edt-ft5x06']
--
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen1.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-lxa-tac-gen2.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-odyssey.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-osd32mp1-red.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#
   arch/arm/boot/dts/st/stm32mp157c-phycore-stm32mp1-3.dtb: touch@44 (st,stmpe811): touchscreen: Unevaluated properties are not allowed ('st,adc-freq', 'st,mod-12b', 'st,ref-sel', 'st,sample-time' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/st,stmpe.yaml#
--
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: perf@5a007000 (st,stm32mp151-ddr-pmu): compatible: ['st,stm32mp151-ddr-pmu', 'st,stm32mp131-ddr-pmu'] is too long
   	from schema $id: http://devicetree.org/schemas/perf/st,stm32-ddr-pmu.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
