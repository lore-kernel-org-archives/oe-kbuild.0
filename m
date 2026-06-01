Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE983BF667
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Jun 2026 14:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780325419; cv=none; b=tyNW5n/Djkvcy5RYJODFaGz3QganP9p9GdDqg6tCWEzT1sTfXlnkyfvDI6gO47kHQbNRRwiDBViFt8R16IO4HFIskkPrEBNM0tt+88nqXUUqmdPTJiSEvDkMPtXrUhpVbk86RV0+ZbOAMUAOnaSTzCfhihBfUyLgD9NS5LJEP2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780325419; c=relaxed/simple;
	bh=Paiuoz/rqjP3ZedTGxcnoRfIvXToFzcHeJDVTTDj2nA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=g4aMayZXV/yE6iYhh7ymM78u7dxXyIX4f/TWSI4A0s27S51iKKx9I1UxCobLbSil0wpqcddGq5wA7VyHaqzH5DTGlh6zfOrDyiNcwYB6glaUSVII7KIWKqen2gqo6NL9rq/lZYP/B9NUnt6wRTQFR7Y13hgUho/1h4aFmHZGUjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E48XVzge; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E48XVzge"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780325416; x=1811861416;
  h=date:from:to:cc:subject:message-id;
  bh=Paiuoz/rqjP3ZedTGxcnoRfIvXToFzcHeJDVTTDj2nA=;
  b=E48XVzgePjRyd9sEqh1cdjKmusz7HUJlUgAXZpPNOTDENpFIUWAnq+KR
   SkTb2YHOTUvm1nM0XxR6sqt+OHcdkfGopD7EYkFihd+uvwslRWHypAkHp
   PAGDznb/V+9mTasLg9SHidpjDF2l9cJ+QyGYezNI9UbO6TMD3mpyU8TXX
   28ZzB764h4snt9ecoWMR61Kj6J0o6h91A3H/yFBJI9uyH9m49gcZZvCIc
   mMaxqwmGq2nsqDFI70S3HLoMnWLB5e3/GAX1FBy+VEZTyhgf30rhWkSR0
   esLmbilKMUuZboWBHI0NAy/l2NDltBxJCCQ5wpuzSKxtUSIYEAIUMPtCe
   w==;
X-CSE-ConnectionGUID: 6HVP8INoTjCnB8zEE+jM9g==
X-CSE-MsgGUID: V/FzVQ1MQ3ORMzL9sMQinw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="91766386"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="91766386"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 07:50:16 -0700
X-CSE-ConnectionGUID: rq/RJGUQQoebYPVEuyPdsQ==
X-CSE-MsgGUID: ++uyKUkNQEmO9CzQVXBhGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="239421667"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jun 2026 07:50:16 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU3y1-000000001bh-1yO6;
	Mon, 01 Jun 2026 14:50:13 +0000
Date: Mon, 01 Jun 2026 16:50:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:gemini-dts-for-soc 6/8]
 arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb:
 /soc/syscon@40000000: failed to match any schema with compatible:
 ['cortina,gemini-syscon', 'syscon', 'simple-mfd']
Message-ID: <202606011654.XDI0vXI1-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-2055-20260528 (https://download.01.org/0day-ci/archive/20260601/202606011654.XDI0vXI1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260601/202606011654.XDI0vXI1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606011654.XDI0vXI1-lkp@intel.com/

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
