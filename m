Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794293165;
	b=oYw45QurY5cttpjp9KK2+3KCq5HcVEOkRK+90WdMBS++liFKUh10JSJXm2FHrgP4A0fi
	 U9gmwNoaXHVEX8IHNL3cvyVK+VXYQqYMr4kpVS6C+G8Mjue6l8zaF9Psw2oarEMc9KYLU
	 BiBIOV7jvlIzmxcw0KX5R/HDlYZNCDcJEv7YMpQ0rIAlO99VFzvRAHWUY88MQJ4sAwzAF
	 eFUswOpz+A1ASogqH+qKzatfCvzn8e3GdtlfRbysuxVMOpu4dFvG3TLU51uB2tCNlIbsy
	 Plw8xDS6g4HNm76yz2k+Kd/51LUAYBxuJMrkFDtXgfHwXPIVHy4bh5knYuhQdqaC9lQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794293165;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wMrIF3DDytGvLd4hJXSvzRilXyGQkLvC6ibHDQ5pEEU=;
	b=NZWAAIlY9VARprkW6NvKidUjLFvXJBiyvP40vSDaXjzOITM1/owEwDZVihACLx/cul2+
	 WBu/CCFt7UUmgYlRCH2McmUDwDjT6gfg6Hxia2nj+R3K9OB3dxfS9k7WehVyq8RB5Nqcq
	 40hoDZRftarctW/C7kYgXbxZXpD2W7n7j/PA+w+YRR6JoQtC3PVwnj+vHYmxiAmwY/GCs
	 HXDSXOVD0Ae8xDiDzFMWqTGdNIXddeRsNCGQ26gaS+//F8Hi79vU1JwzfEkgyJD2jvQwN
	 eFfrRVZu55aKyM2GPlnoCFm/OIJrad65mXTE7Xmb+MmJeoPk5g/uNFm6ShGcQtPlv+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c5671r7q;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8699D606A641
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Nov 2026 06:46:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8699D606A641
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c5671r7q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794293165; x=1825829165;
  h=date:from:to:cc:subject:message-id;
  bh=fJj17TApV7RK5AlgRcyavCV+dp9Trw470Y3/ejjPSgs=;
  b=c5671r7qPya7SCGVG4CP0SBBts0uWgpiHZ5nvQus24ISIEOtzfZv0VY8
   hMeCidzp9xPSPbYaVuRXSPKwp8Ra2xvoWNKyOORdHlQ2/0kEkrH4R0ZtX
   d/O9UsFNUqBpWSnjUeYD7fn/XirgFAjri8jgZqjCmh62t7yuYuesNuvlj
   zF8LvygbHTcWaPmMZ+TlJeahGJSRkv+T40gz1NjaGGLdiOZDmhmFZYt8F
   i4iPkT4uoRf4C3N1TP3JR3FhlQgLe0qiXL+PSLQUUHDLq+UUub84X4k87
   qtO1LZYo6cq2yBFwJ0eJbXmRvlm/OEn+8al84DSdEfATgAeGUkPuY9YWn
   w==;
X-CSE-ConnectionGUID: VMdAU4PbRZyELbRAljgdZA==
X-CSE-MsgGUID: 3/EnZ+D8SnKj4lOOF90fjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3023747"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3023747"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 22:46:04 -0800
X-CSE-ConnectionGUID: 95L/WQvzRVuogS3d6fDG6g==
X-CSE-MsgGUID: hJuWahz/TYGF3Blvmp1cow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7945467"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 09 Nov 2026 22:46:02 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQfcG-000000000D5-2kmk;
	Tue, 10 Nov 2026 06:46:00 +0000
Date: Tue, 10 Nov 2026 07:45:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 82/242]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e20c000
 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202611100701.7SfrVWGr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   c46abf5713fa41e1574fb50c462f53392d6f5cd7
commit: 3e2114629f945662e8f83d3d3db1eba2f8a9db2b [82/242] DROP_v7.4: arm64: dts: apple: t600x: Add legacy "apple,dcs-min-ps" property
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261110/202611100701.7SfrVWGr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611100701.7SfrVWGr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611100701.7SfrVWGr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
--
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e20c000 (apple,t6000-pmgr-misc): 'apple,dcs-min-ps' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/apple/apple,t6000-pmgr-misc.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: power-management@28e080000 (apple,t6000-pmgr): 'reset-controller@1a034' does not match any of the regexes: '^pinctrl-[0-9]+$', 'power-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/apple/apple,pmgr.yaml
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@2200000000/power-management@28e080000/reset-controller@1a034: failed to match any schema with compatible: ['apple,t6000-cio-reset']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
