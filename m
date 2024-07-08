Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8E3146D4D
	for <oe-kbuild@lists.linux.dev>; Mon,  8 Jul 2024 16:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720457796; cv=none; b=AI3I8ZEDVGij1iL1IxN3C7qPiWb3hPYG8Iqu1D3UY7ac8vBJpZszPxX/sfHaRlszB9UQQlexn2XkFxyYPJaHIjBZR4y2+0CfWhRiwWGeqbfEaIkNBlManZmnCP0Td4m4QpC93NK3z5tLP8YdoNPyNtKlBOJfJSSjPZ4RR4rNCrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720457796; c=relaxed/simple;
	bh=xbeX8Z08NdPk4T7vbSEixGY/QBDjrRokifpqMdQGf2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A7wF6muLhk7y3GDM5SiJf6wXGevHoepq8P8bRr3zufefBSWCUQbcqSqXvH8OgN7gbM3RmJSppEkC2LgyYo/n5PTw7VVvjs8GezisMvS2g9PboS2WTU1G8ZCibhely8ys2tDhbgYiT7atddzCA8cG8Hu3hDRJEVsuHosI2ckM6tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G77NUm91; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G77NUm91"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720457794; x=1751993794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xbeX8Z08NdPk4T7vbSEixGY/QBDjrRokifpqMdQGf2M=;
  b=G77NUm91GIdH5ml48a5QfHOxkvx30kYYBoy3PuGuyvJGsLKzAShMNoHb
   quVMjC0pq5P+kZHpmWsuwdS28QKO2Uu8B3+dedgsuyc16W5diClNzyBF2
   cCnn7d56R09Dc4GOnlfAqJZCAxAGxgwggKawcPmpID0GwptbCsrFa/jDK
   QdrkCSE0qeJWsr7Jd0IfL4yNdVZB5usWLmGRtWLxlmJuMcaqn1qbyzl49
   0Ywxy2iiwZe1417ffIctQvF+HsaK5tPOjOAYRJxbFxe8GAANe0nMRlxsh
   qSQ/BnU4+2LzfN4w1JAUtQnK66ef2YwPRFy8G8PqvTzxT3qKOYZgzO2dv
   Q==;
X-CSE-ConnectionGUID: dGuACOV1RWya1KViNYeawA==
X-CSE-MsgGUID: 1edVrnX2RRaMN4F71TFMqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="20573958"
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="20573958"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 09:56:33 -0700
X-CSE-ConnectionGUID: ucBHQdMURs+kMDCNMgyLpg==
X-CSE-MsgGUID: Jg5fMF+bT/OWfpIl9GZ5ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,192,1716274800"; 
   d="scan'208";a="47441382"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Jul 2024 09:56:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQrfC-000Vt4-1C;
	Mon, 08 Jul 2024 16:56:30 +0000
Date: Tue, 9 Jul 2024 00:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:sunxi/dt 15/16]
 arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb:
 syscon@3000000: 'regulators@3000150' does not match any of the regexes:
 '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
Message-ID: <202407090021.1UvDrJwQ-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: "Chen-Yu Tsai" <wens@csie.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git sunxi/dt
head:   0ce1d34678e5d214746ee4887f9f7714c39e331f
commit: 8f2cf4442b49365031f62f7d97484989251b0707 [15/16] riscv: dts: allwinner: d1s-t113: Add system LDOs
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: riscv-randconfig-051-20240708 (https://download.01.org/0day-ci/archive/20240709/202407090021.1UvDrJwQ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407090021.1UvDrJwQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407090021.1UvDrJwQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/allwinner/sun20i-d1-dongshan-nezha-stu.dtb: syscon@3000000: 'regulators@3000150' does not match any of the regexes: '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-480p.dtb: syscon@3000000: 'regulators@3000150' does not match any of the regexes: '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-86-panel-720p.dtb: syscon@3000000: 'regulators@3000150' does not match any of the regexes: '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv-dock.dtb: syscon@3000000: 'regulators@3000150' does not match any of the regexes: '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-lichee-rv.dtb: syscon@3000000: 'regulators@3000150' does not match any of the regexes: '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-mangopi-mq-pro.dtb: syscon@3000000: 'regulators@3000150' does not match any of the regexes: '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1-nezha.dtb: syscon@3000000: 'regulators@3000150' does not match any of the regexes: '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#
--
>> arch/riscv/boot/dts/allwinner/sun20i-d1s-mangopi-mq.dtb: syscon@3000000: 'regulators@3000150' does not match any of the regexes: '^sram@[a-f0-9]+', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sram/allwinner,sun4i-a10-system-control.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
