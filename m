Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD038287E
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Feb 2026 19:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771182917; cv=none; b=uDiUm3yNO8jDMLDeFjOpQsY9djLtCVF8nmstEtkXJyb9/FD3GQYweOZVBahTReuo05bSgOlphiim+hTUI3NZOL6C26ZeIH/xXGt+uiG2Ax263lPxGbXwAzE6e+pykcOOIBC2HSEThxmw9xpU5oabQ38l0qdWMQ7DcfHX4X/6jOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771182917; c=relaxed/simple;
	bh=n1GMs/CZtSUhUdagmCfCAf1kxIdvUBgaxSL/4DMircg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sGEnXZdKhpaixzXJH1nG/tY+91UwUX0NjRLE030UR5X4SgAWtIcBhdupCw3ctvDeryErqyvNyBVD7HWbQTnJ6o2FAQkJ552/0KQNejSADVBL9WCqbrYI5drmYbyB2IKQ56NWAezMzPajpsiFNJFiVjVsePu2k9rFVnU7hpnvZQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=llLV2W20; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="llLV2W20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771182916; x=1802718916;
  h=date:from:to:cc:subject:message-id;
  bh=n1GMs/CZtSUhUdagmCfCAf1kxIdvUBgaxSL/4DMircg=;
  b=llLV2W20LBaWz/VVDyiGJnK8ixmewEPq8975WEZz6ngbNQpJgyr8p4NQ
   rfH1hI/7X0lRRDwlNtADbuvzaK5n3T5k9YAWztBWxpNSSCVtu10fWUhez
   tK1QhA5eCsEBxXvvPFz1fcuf9TOfW8j49uVXIsV37nGu+EqBbLZUQnZQe
   fx5hJ2OIbPMeU696BLKj5AXfFDTcjS6TSvAR2lth+sAC/DY6IOulaeD+G
   E9Nc4eYSBuRs+bXLgdD4HJyRcwjPKHcNoW30z3bmNdgpjJm3JJODKm0OQ
   Gpz60JUTzp3L3eqWwH1F9dC5/Droo/bF/C5FPNH2+J13Bzsaw/I8GxvI8
   Q==;
X-CSE-ConnectionGUID: 4fA86EzST0SCIkykdmFasQ==
X-CSE-MsgGUID: uYoYdzpPQRKDhZaNCro0Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72377189"
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="72377189"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 11:15:15 -0800
X-CSE-ConnectionGUID: /ypk2PgdSSueltBvMdvj0A==
X-CSE-MsgGUID: 2aEbziCPRdCh58ZTFjKViw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,292,1763452800"; 
   d="scan'208";a="242617393"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 15 Feb 2026 11:15:15 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrhaK-000000002EL-3H7s;
	Sun, 15 Feb 2026 19:15:12 +0000
Date: Sun, 15 Feb 2026 20:14:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/gemini-dts 9/9]
 arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: /soc/syscon@40000000: failed to
 match any schema with compatible: ['cortina,gemini-syscon', 'syscon',
 'simple-mfd']
Message-ID: <202602152039.Y6xpVDYJ-lkp@intel.com>
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
commit: 160ad0192bce8da45120e7213e9828b0c06fb525 [9/9] ARM: dts: Add a Raidsonic IB-4210-B DTS
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-2051-20260212 (https://download.01.org/0day-ci/archive/20260215/202602152039.Y6xpVDYJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602152039.Y6xpVDYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602152039.Y6xpVDYJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: /soc/syscon@40000000: failed to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', 'simple-mfd']
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: /soc/syscon@40000000/pinctrl: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: timer@43000000 (faraday,fttmr010): False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.yaml
   arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: /soc/spi@4a000000: failed to match any schema with compatible: ['faraday,ftssp010']
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: /soc/power-controller@4b000000: failed to match any schema with compatible: ['cortina,gemini-power-controller']
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: power-controller@4b000000 (cortina,gemini-power-controller): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: ide@63000000 (cortina,gemini-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml
   arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: ide@63400000 (cortina,gemini-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
