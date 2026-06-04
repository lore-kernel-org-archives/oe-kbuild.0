Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D563EFD13
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jun 2026 08:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780563422; cv=none; b=soZKc12sYBKcnXzYa4KBa+ltgWmT31OxpwoRpPaXJWqZuA6q9SpOyjMfJYkrSvZLJyETf9/89o62iBwxYnW6YaLZ3yklw5/5waRH/brEsG9vh06kBwtvJGgVqshdrP1yH/vsPROHigtGiP9N3/lmDDyTATqXdKiqnvEegqz22Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780563422; c=relaxed/simple;
	bh=EQyOoTBfeXNuCO5MwC/gk7ot8hgGHE7Xch2n8MvPsMY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=usISsxcsnNpsOganADZAKPw9QTQEl2aUwFcKekmNJ+MnfRMLb96UUlR888rV8tTJ6IM37oVyAeqAckQUkpmVk7F6AU8QXXnIUvUmYpnGznV1B/SbkG9fRS1/fI4u7hsyHPpZmC0FUKKHOCsrhECBH1AM0184R75xLb8x4o3WwRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijlzczi/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijlzczi/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780563421; x=1812099421;
  h=date:from:to:cc:subject:message-id;
  bh=EQyOoTBfeXNuCO5MwC/gk7ot8hgGHE7Xch2n8MvPsMY=;
  b=ijlzczi//CBC5t9qFVZ8YjJJ8ZaazVSCGnKCUluR3lZx936jWfJY3705
   NZrRpBTDLYpTKjarRBoB/WmqlI90OGKg3mmuULBOywHa/43H+KROp3Y2F
   rhsSA89oI8TC/qMPoIJZ8iOyyr4gVjBlQTSjotm2/rIIvr2DKywFrBkHq
   TbUWXU4PDvoQZp9AGdB7MybjAF+2o6J1YVeaHGTFY5GHAovZQKaOVkTHW
   0LAvKsr3Wsna0a2dZKxMjtqVZRAGbgUMSjVLoOeLvwGBq82hjT8vKCfne
   mb/MbRYnhJAeMm1d2rxywSXOoePs56IxQxByE5vZv3CkYfii+LWk13Z8L
   w==;
X-CSE-ConnectionGUID: Wk3l5raeRA+RWVu9V1bYDQ==
X-CSE-MsgGUID: +QP5CJwUS+Kv4xc79Y1r+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="85275795"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="85275795"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 01:57:00 -0700
X-CSE-ConnectionGUID: BEXzDNxDRci+qtb/1xU+Fw==
X-CSE-MsgGUID: V5u6Je3eRIaA4qhd19beWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="241990529"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jun 2026 01:56:59 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV3sm-000000002JV-3onJ;
	Thu, 04 Jun 2026 08:56:56 +0000
Date: Thu, 04 Jun 2026 10:56:21 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:gemini-dts-for-soc 6/8]
 arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb:
 /soc/syscon@40000000: failed to match any schema with compatible:
 ['cortina,gemini-syscon', 'syscon', 'simple-mfd']
Message-ID: <202606041033.st83pVuw-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git gemini-dts-for-soc
head:   dce8e0cb88fb12d068459b75f299ff2242172257
commit: ccd7118d30488d69561e4c7a7e2062a367825719 [6/8] ARM: dts: Add a Verbatim Gigabit NAS DTS
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-2055-20260528 (https://download.01.org/0day-ci/archive/20260604/202606041033.st83pVuw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606041033.st83pVuw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606041033.st83pVuw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: /soc/syscon@40000000: failed to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', 'simple-mfd']
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: /soc/syscon@40000000/pinctrl: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: timer@43000000 (faraday,fttmr010): False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.yaml
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
