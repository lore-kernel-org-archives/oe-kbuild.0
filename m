Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3040127281E
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 12:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779541191; cv=none; b=F4+RuP4HOQNT2WZYEAdVWn5/Z/uPf2d6h1gUtZecxsE5BBO3GBxun8wvz2aSCqQN40apskiJt2w1icT8RaCjxojyvBhTzFq+QZ6BikVrEGA5cEGK4gdO1LcZTMRyq2yL9S33HMAv40p85pgVBgwe67eC8uJHId2Af8Ld+QigANI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779541191; c=relaxed/simple;
	bh=lqTvwbT8BNnSVFHdmv3uh2VvKw+Om9ZyTwWs5DfiDOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZMdtLZlnxEhxo27FkMAYIR4aL0fRIkQFshxEkp27V30U0B2CoWQPavAUeaSh7u2HtfQELlmwkZMn7wn85LijHH5TS8FDkJAku6IWmNA2ob5zPDa8FOzPKBHdy2s0iBCwnul74PiAvblHO8m4FsRqBKAhkuNNeasFFSzfNKsGUMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6o+AuGc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6o+AuGc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779541188; x=1811077188;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lqTvwbT8BNnSVFHdmv3uh2VvKw+Om9ZyTwWs5DfiDOQ=;
  b=R6o+AuGcwbYrZH/XH3814SL8YK65d3zmMfjEDN8PAei8RIrTCRhqA6CW
   DW8gVje6oxIQd678Z1v/pN4lJWDtuEf7vsTNtUaqa5bgJaO593ZwRJj8K
   YwKCfIGCJOVKyryjfm9U8RBuBwJ0yP4gzh+/uc8HL+Wh9IPKe395tXUEs
   lFMNh/peXIvJzYD57mno1mRCFbjj7D2L8FQtyuEAqZs+di3gKdLs7an6P
   cCKril2hWfqKqHWQTsaG4ropXNQ0StcPTRX8ZM2rZWhTZtJYPO/Cdo+9S
   oc5VKWxnREY2I9WTIL4e0auvnjxANH/LVArtYmmpIjDklQ96VdXhufihs
   A==;
X-CSE-ConnectionGUID: u9fFEntUTqGvXKzDX97iSg==
X-CSE-MsgGUID: ByeEhXp7TvO3ZOTPmOi4Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80480202"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="80480202"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 05:59:48 -0700
X-CSE-ConnectionGUID: Na7UzZOASryHlzLJCJeO3g==
X-CSE-MsgGUID: ND/c5emmRWyL0MuaNuz2gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="234800624"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 23 May 2026 05:59:46 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQlxA-00000000Bez-17IS;
	Sat, 23 May 2026 12:59:44 +0000
Date: Sat, 23 May 2026 14:58:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure
 eMMC/SDHI pins
Message-ID: <202605231452.WHmzzelK-lkp@intel.com>
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
In-Reply-To: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
References: <20260514210220.7616-1-fabrizio.castro.jz@renesas.com>
TO: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
CC: linux-renesas-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Biju Das <biju.das.jz@bp.renesas.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Fabrizio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on next-20260522]
[cannot apply to linus/master v6.16-rc1]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabrizio-Castro/arm64-dts-renesas-rzt2h-n2h-evk-Configure-eMMC-SDHI-pins/20260515-065927
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20260514210220.7616-1-fabrizio.castro.jz%40renesas.com
patch subject: [PATCH v2] arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI pins
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: arm64-randconfig-2055-20260522 (https://download.01.org/0day-ci/archive/20260523/202605231452.WHmzzelK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605231452.WHmzzelK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605231452.WHmzzelK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-group:cmd-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-emmc-group:rst-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-sd-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-sd-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd0-sd-group:ctrl-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): sd1-group:ctrl-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g077-pinctrl): Unevaluated properties are not allowed ('sd0-emmc-group-uhs', 'sd0-sd-group-uhs', 'sd1-group-uhs' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
--
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-group:cmd-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-emmc-group:rst-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-sd-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-sd-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd0-sd-group:ctrl-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-group:data-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-group:clk-pins:drive-strength-microamp: [9000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): sd1-group:ctrl-pins:drive-strength-microamp: [5000] is not one of [2500, 5000, 9000, 11800]
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml
>> arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dtb: pinctrl@802c0000 (renesas,r9a09g087-pinctrl): Unevaluated properties are not allowed ('sd0-emmc-group-uhs', 'sd0-sd-group-uhs', 'sd1-group-uhs' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pinctrl/renesas,r9a09g077-pinctrl.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
