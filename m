Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A601A08BC
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 22:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731970298; cv=none; b=m34gLD1VTbpoTFXTu05dk+3m8NJxYFKyNgS/ilhq0GHiIqUFzzavweCbZVE3lcmpvoRCfJzUOgK6K7EF87tlWs29kwMt/Yr7Tg5vJGjSGvTXShM353H83qrWUvIvcMSQXE+KYiWFCJ1K8CbG38Dxan2UO5C3XsdCg1/1hL5in+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731970298; c=relaxed/simple;
	bh=WUYlBmxoOetG/BUU8AX/Ha/vNGuRnK+IrcBrin2s2FM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pWD6/g/uyPuLWz/yQCmy7//MovE9VTULWJnibseDjtjhLuQ244EdTaa85Na8g/5CXaJzhPibBKKMLBJdOH9FYd7wxuVbCtXZ5+Ib0QSRCg3rMnsw0hvpFj8zxv4x5jWCHYpd/jzPOnrpV2IXu0cofx5ejdJc3czVYYKtvvIVm9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ot5Kkh6l; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ot5Kkh6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731970295; x=1763506295;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WUYlBmxoOetG/BUU8AX/Ha/vNGuRnK+IrcBrin2s2FM=;
  b=Ot5Kkh6l/LJAMYVj+36wCh+BuDTCxPE2pVbwqbvETn/WCYOlBr+E+a1n
   LjOYbxZChaISxGZpXSwaUnks3kYsCblA0HwvwutzRLuOW+3xKwyfDNLq6
   DDxqsaHVp7+vwLLnRqmamxAgbbGRKgS0kAEucM4ufgKMAkZb2nJy2hGID
   YWACvYGuEMDDv1WJG+J2DKn4WLzVyUa9yWEGPrYSxbugCG80RRQBCek/8
   OkFmai3Rtv6Jbv2WVsZaMi9xPzO1TvCll7wJIzEgWl7U+wTewCDZDnfkF
   tnRSDbGwkviMiAvPPAzgR0aXIi5vdrTFmE2xrmhFdusLWtHxv9c1ln8G6
   A==;
X-CSE-ConnectionGUID: GjvodtlISLq6xQn1+VUnMQ==
X-CSE-MsgGUID: /julQe8mTumivU5kfH0X3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31874742"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="31874742"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 14:51:35 -0800
X-CSE-ConnectionGUID: sU/hcUWUS8O2QSYZbSHlGg==
X-CSE-MsgGUID: vWTwoKJ3QoyJld3n1NhovA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; 
   d="scan'208";a="89789990"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2024 14:51:34 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDAah-0002gH-1A;
	Mon, 18 Nov 2024 22:51:31 +0000
Date: Tue, 19 Nov 2024 06:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 6/187]
 arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38: compatible:0:
 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
Message-ID: <202411190630.HMyaKlbN-lkp@intel.com>
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
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   323d77b0bf173729bb2a5aa2f4bd1c13796720a8
commit: 7f3c43dbcb976ae8db2b12955055c795e384d3c8 [6/187] arm64: dts: apple: t8112*: Put in audio nodes
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-051-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190630.HMyaKlbN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190630.HMyaKlbN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411190630.HMyaKlbN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112-j413.dts:133.14-152.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j413.dts:154.14-163.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:658.28-734.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/t8112.dtsi:698.43-701.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@38: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@235014000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@39: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@235014000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3b: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@23501c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: codec@3c: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@23501c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/i2c@23501c000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d0d9300/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: wifi@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any schema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /sound: failed to match any schema with compatible: ['apple,j413-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112-j473.dts:103.14-112.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j473.dts:114.14-123.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:658.28-734.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/t8112.dtsi:698.43-701.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: codec@38: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/i2c@235014000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/i2c@235014000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d0d9300/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /sound: failed to match any schema with compatible: ['apple,j473-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /sound: failed to match any schema with compatible: ['apple,j473-macaudio', 'apple,macaudio']
--
   arch/arm64/boot/dts/apple/t8112-j493.dts:122.14-141.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j493.dts:143.14-152.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:658.28-734.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/t8112.dtsi:698.43-701.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@38: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/i2c@235014000/codec@38: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@39: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/i2c@235014000/codec@39: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3b: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/i2c@23501c000/codec@3b: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c: compatible:0: 'ti,sn012776' is not one of ['ti,tas2764', 'ti,tas2780']
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c: compatible: ['ti,sn012776', 'ti,tas2764'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: codec@3c: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas27xx.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/i2c@23501c000/codec@3c: failed to match any schema with compatible: ['ti,sn012776', 'ti,tas2764']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/i2c@23501c000/codec@4b: failed to match any schema with compatible: ['cirrus,cs42l84']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spi@23510c000: failed to match any schema with compatible: ['apple,t8112-spi', 'apple,spi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8112-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e: failed to match any schema with compatible: ['apple,stowe-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d0d9300/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: wifi@0,0: Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /sound: failed to match any schema with compatible: ['apple,j493-macaudio', 'apple,macaudio']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /sound: failed to match any schema with compatible: ['apple,j493-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
