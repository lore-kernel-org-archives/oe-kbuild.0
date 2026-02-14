Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A33F13AA2F
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Feb 2026 15:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771083843; cv=none; b=aSKcolMDX2Fl3p+P5LFwbkSemf18f99UmO+Dw7ckgZBVsGxPCfeh1HL5bd4X5AN/oC1T99AvDo38TYRSf5thqzY3tJ/kJ6H3UUCfGQ9M8GpjNCZiec05cqyzXqNjC8kM9nGqr0l2HvQIt6USDlPQOaG0ZeKuSrSuB8p9vzVMBWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771083843; c=relaxed/simple;
	bh=jmdd73cVs3j4+BjJg1+iWJhUk8sU4oT7JGX1iR2cfvo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rf7W7H8SzE2WbZqO+ly9oFceJZRmywasVlhIMtyg6sx9Yz6YGL6mp+LXoxXuW7N8veXAbYKWfED36ABbtQSLB4lsL37Gap0be8SlY7r4dnZVyeFcoTofv8DTwQdqPppP8Tn367Cypw70FehuUCCTXq0gaJWXSBrlQfNgls31zc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKQe52yD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKQe52yD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771083841; x=1802619841;
  h=date:from:to:cc:subject:message-id;
  bh=jmdd73cVs3j4+BjJg1+iWJhUk8sU4oT7JGX1iR2cfvo=;
  b=MKQe52yDYuWjMmIoA3qj8k5OGeoRIhsIiwgC4LiIT4XsWqUZjzlOowcV
   3Lavr1OXmKClI/EMd83AFjTS/TJtm+LDf6sbSa8/Qpd6ymafVmiFDS8YU
   PUm0vv7WbMAkUDtR3R0LHyYpjlqmfD10SFa6uhR2Yx75Gm5zlFOzYpBcM
   givutBmyQ0oGwnD8fKVW2+gbG90o7naOaSBZ32KeAJfssetRQhT5LK1Gb
   Hb7hshGrK4BLr+cV4HqMbP+NColiBZXwv6IQSCqZtF8uHCpcLBbx8OCh9
   PY1xQRmlaK1LEKexdb3km3ZXHJwTaKjXclmiBJDH/eiY7hsirERq6KORk
   g==;
X-CSE-ConnectionGUID: 8VTg+guGQXCux+SQ1mBm3Q==
X-CSE-MsgGUID: qTESSxHaSUKOwO4AHnoOCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="83607093"
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="83607093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 07:44:01 -0800
X-CSE-ConnectionGUID: 8hd5R7WDQlqh/YEiocmOjw==
X-CSE-MsgGUID: 9phdWM8NRhiO17lyLUbAyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,290,1763452800"; 
   d="scan'208";a="236175655"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 14 Feb 2026 07:43:59 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrHoL-000000001sf-2jkc;
	Sat, 14 Feb 2026 15:43:57 +0000
Date: Sat, 14 Feb 2026 16:43:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/gemini-dts 8/9]
 arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb:
 /soc/syscon@40000000: failed to match any schema with compatible:
 ['cortina,gemini-syscon', 'syscon', 'simple-mfd']
Message-ID: <202602141647.quk8RVoW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/gemini-dts
head:   160ad0192bce8da45120e7213e9828b0c06fb525
commit: 591099edfbd691e5302e9235b42a835d9941ae7d [8/9] ARM: dts: Add a Verbatim Gigabit NAS DTS
:::::: branch date: 3 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-2051-20260212 (https://download.01.org/0day-ci/archive/20260214/202602141647.quk8RVoW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602141647.quk8RVoW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602141647.quk8RVoW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: /soc/syscon@40000000: failed to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', 'simple-mfd']
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: /soc/syscon@40000000/pinctrl: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: timer@43000000 (faraday,fttmr010): False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.yaml
   arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: /soc/spi@4a000000: failed to match any schema with compatible: ['faraday,ftssp010']
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: /soc/power-controller@4b000000: failed to match any schema with compatible: ['cortina,gemini-power-controller']
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: power-controller@4b000000 (cortina,gemini-power-controller): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: ide@63000000 (cortina,gemini-pata): ide-port@0: '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: ide@63000000 (cortina,gemini-pata): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'ide-port@0', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: ide@63000000 (cortina,gemini-pata): ide-port@0: '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/pata-common.yaml
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: ide@63400000 (cortina,gemini-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
