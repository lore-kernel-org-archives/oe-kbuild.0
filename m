Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261072405FA
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Feb 2025 15:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199757; cv=none; b=VRbxdQRpHhfB/FcBVwLw8eZIGn0PJ4CVNJyO3qq558QUJDQWVHRq9K46tjFo1cNPhw7zDPR2F23MVMApPXSIfpA6gGvqu/FGOyA9Fq4sHAiHgVdxbLZ34mpqN9KgD+aFfdkrRd/3MuSbafdQA9ype7QPPEgHVkUv5zd+kqhdx/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199757; c=relaxed/simple;
	bh=QeVcK1GLXdLQsHUui86dIv648jVO0BONz1L6Z1jBw3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XaWW6FDRl3y+2EQAWlz8jZRpMBaGnf9b7//lgMEoZfRYDB+KzEr2MotG2rqJjD1SmFlhpn8bXSwsYDJdG0Dv9V8aWQkX1cSa3RZKK62aGOp4sn2w9sy+Mp3+Gr6I8urBQaRbyfVGauR0Aq/F6MAtjagme9vtzj+OrnLq7z1tOmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b+OYefk7; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b+OYefk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739199755; x=1770735755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QeVcK1GLXdLQsHUui86dIv648jVO0BONz1L6Z1jBw3k=;
  b=b+OYefk7vzb5v8c7u2+HuS26BYD+/sG1AmT/ctxlmwoNoFgHcUqabcaY
   jVcwmBezkUAAlX58AdJj7fF5HuLu09QSyEAnPdARgr42mauhx9x/K4cTJ
   jmCjDWuCh66SKXJ4QySBxWOEbYqeepLARd1KP6klvrlKN6a1uO4awye/x
   Saj42Um0Zz8DwSZtefc+7f1keZzGOpElgnbyub6/eL1TT8Zx7THgC/o3q
   0ieYz4Hq4MFSwL9fBRivpZmHfM4e53qjJuG1vP/RkKdfv4FoGX/xZa7+Z
   I3H4Kfb3j8+kHOC0fCzjtrS4RjK8a4SH6l3tfLGhc4TwM6niFV5+ircxI
   w==;
X-CSE-ConnectionGUID: h/5wBlGsS0KZIwQ3W2aCow==
X-CSE-MsgGUID: 9D0D539gQmyi0O8Xto1KWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39651005"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="39651005"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 07:02:33 -0800
X-CSE-ConnectionGUID: 1GtW/efrRgiTCYBROZhlSw==
X-CSE-MsgGUID: ZaKpzQfPSV2uhvnRCgjpvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135473624"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Feb 2025 07:02:32 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thVIs-0012vO-0b;
	Mon, 10 Feb 2025 15:02:30 +0000
Date: Mon, 10 Feb 2025 23:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.15 25/26]
 arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dtb: /: compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202502102213.imFUpSFy-lkp@intel.com>
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
CC: linux-renesas-soc@vger.kernel.org
TO: Julien Massot <julien.massot@collabora.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.15
head:   85172055debf4b3f261c60f5ef168ca9891b0efe
commit: fd323641874775f2018715cc7861ba1517e274a3 [25/26] arm64: dts: renesas: Add initial support for MYIR Remi Pi
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: arm64-randconfig-052-20250210 (https://download.01.org/0day-ci/archive/20250210/202502102213.imFUpSFy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502102213.imFUpSFy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502102213.imFUpSFy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:712.12-720.7: Warning (graph_child_address): /soc/video@10830000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:722.12-731.7: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g044.dtsi:757.12-766.7: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['myir,remi-pi', 'renesas,r9a07g044l2', 'renesas,r9a07g044'] is too long
>> 	arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   		['myir,remi-pi', 'renesas,r9a07g044l2', 'renesas,r9a07g044'] is too short
   		'shimafuji,kingfisher' was expected
   		'renesas,r9a07g044l2' is not one of ['renesas,h3ulcb', 'renesas,m3ulcb', 'renesas,m3nulcb']
   		'renesas,r9a07g044' is not one of ['renesas,r8a7795', 'renesas,r8a7796', 'renesas,r8a77961', 'renesas,r8a77965']
   		'renesas,r9a07g044' is not one of ['renesas,r8a779m0', 'renesas,r8a779m1', 'renesas,r8a779m2', 'renesas,r8a779m3', 'renesas,r8a779m4', 'renesas,r8a779m5', 'renesas,r8a779m8', 'renesas,r8a779mb']
   	'myir,remi-pi' is not one of ['renesas,kzm9d']
   	'myir,remi-pi' is not one of ['renesas,genmai', 'renesas,gr-peach', 'renesas,rskrza1']
   	'myir,remi-pi' is not one of ['renesas,rza2mevb']
   	'myir,remi-pi' is not one of ['renesas,kzm9g']
   	'myir,remi-pi' is not one of ['renesas,ape6evm']
--
   	'renesas,r9a08g045' was expected
   	'renesas,r9a08g045s33' was expected
   	'renesas,r9a09g011' was expected
   	'renesas,r9a07g044l2' is not one of ['renesas,rzg3e-smarcm']
   	'renesas,r9a07g044l2' is not one of ['renesas,r9a09g057h41', 'renesas,r9a09g057h42', 'renesas,r9a09g057h44']
   	'renesas,r9a07g043' was expected
   	'renesas,r9a07g054' was expected
   	'renesas,r9a07g044' is not one of ['renesas,r9a09g047e27', 'renesas,r9a09g047e28', 'renesas,r9a09g047e37', 'renesas,r9a09g047e38', 'renesas,r9a09g047e47', 'renesas,r9a09g047e48', 'renesas,r9a09g047e57', 'renesas,r9a09g047e58']
   	'renesas,r9a09g057' was expected
   	from schema $id: http://devicetree.org/schemas/soc/renesas/renesas.yaml#
>> arch/arm64/boot/dts/renesas/r9a07g044l2-remi-pi.dtb: /: failed to match any schema with compatible: ['myir,remi-pi', 'renesas,r9a07g044l2', 'renesas,r9a07g044']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
