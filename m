Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80E71925A6
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 05:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730956500; cv=none; b=mFXKk8nmVVaxs+QefBprVWc5UBsFeHsmVEbDfLrczC6dRKojlQy8npSmtF5oDUEpd2jNHGDrQfECqBeWONRVuhpRWC3k4Lsl+7hrykTAwrkEZd7+sZNSddx3dFk2wwzDAYqgMVc6o75bulTlklvzxaAXsKVCWLvM/8No+YWfss0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730956500; c=relaxed/simple;
	bh=qWrQP+rQAZdeN1JxPhNWZgu0MQfCZUY5NZ6cQiCiAxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TQLH24LDjjGvn7g1mG0HoIsCSuhzc5zECq2IDWMDVrB9TLTNJkfyZNgev5csjb3z/t2qyD93EcEdOwtX3wbEfrrI77HH4QI6gX4BaIIbo/LLV8hR2qDuPFqUTeg5nLuDKT5BRuaJ/o1z4YsU2JGNxn5ZICEHg7D6jvLIjXo+YFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/NypI0P; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/NypI0P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730956497; x=1762492497;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qWrQP+rQAZdeN1JxPhNWZgu0MQfCZUY5NZ6cQiCiAxY=;
  b=P/NypI0Pi/PRso6wS2ITCqxWtydSK9dkvTrvbzlAl4B9P20ozsu0IvG0
   9BvTcNX8LoBtForMlU/HGKsKWmYhqPLdIt1PndBCmNa3VzWlb+7NZBVEc
   eD86IhhNnYYRmXSfEXSV7ri4bWMOAU1tR+x/yCQmiEiPBNXMnh8G2MwYW
   64iEUNn3HfgL0BkJ5OfeYfe7FecSIM3CoqEddfUX2kGsk38cse+j/gezN
   HVTKjA/5pIthhJ1BJYQ8IfpwRcnCjCmnroaQVZ7AdKqSCfOyIwHalXpNw
   1xqYCR35ZW19ttHj9kieebT6IXngRrE64/AiI8SjW9jv8ubjID3MMogF/
   w==;
X-CSE-ConnectionGUID: fA3+H35RSrm/UBcW+k0g9A==
X-CSE-MsgGUID: QszH8ToaR/GmeCeON9CJ4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30942948"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30942948"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 21:14:57 -0800
X-CSE-ConnectionGUID: K/o0qp6bRxuP9X/pSUP1YQ==
X-CSE-MsgGUID: sz7HZ30WQTmVxYJqtCSYDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="108201350"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2024 21:14:56 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8ur8-000pqG-0J;
	Thu, 07 Nov 2024 05:14:54 +0000
Date: Thu, 7 Nov 2024 13:14:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [pdp7:thead-dt-for-next 1/9]
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/pinctrl@ffe7f3c000:
 failed to match any schema with compatible: ['thead,th1520-pinctrl']
Message-ID: <202411071319.035bapZT-lkp@intel.com>
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
TO: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Drew Fustini <dfustini@tenstorrent.com>

tree:   https://github.com/pdp7/linux thead-dt-for-next
head:   7e756671a664b73b2a3c0cc37fd25abf6bcd851e
commit: 566ab427f827b0256d3e8ce0235d088e6a9c28bd [1/9] riscv: dts: thead: Add TH1520 pin control nodes
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: riscv-randconfig-051-20241107 (https://download.01.org/0day-ci/archive/20241107/202411071319.035bapZT-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241107/202411071319.035bapZT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411071319.035bapZT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/pinctrl@ffe7f3c000: failed to match any schema with compatible: ['thead,th1520-pinctrl']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/pinctrl@ffec007000: failed to match any schema with compatible: ['thead,th1520-pinctrl']
>> arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dtb: /soc/pinctrl@fffff4a000: failed to match any schema with compatible: ['thead,th1520-pinctrl']
--
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/pinctrl@ffe7f3c000: failed to match any schema with compatible: ['thead,th1520-pinctrl']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/pinctrl@ffec007000: failed to match any schema with compatible: ['thead,th1520-pinctrl']
>> arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dtb: /soc/pinctrl@fffff4a000: failed to match any schema with compatible: ['thead,th1520-pinctrl']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
