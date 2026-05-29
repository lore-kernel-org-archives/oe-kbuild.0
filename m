Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFCC38A299
	for <oe-kbuild@lists.linux.dev>; Fri, 29 May 2026 22:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780092942; cv=none; b=TP7x8NEWLXubmXdqtLMuDpM/wUuv+FRqc+XZrk4z+1NhHo3nk1zkRebeOLuMkhPkPVCzJK2CK9dkxEdLq4gm9Xi1OifjMB/X9R0GGAbKD5qdvrgAGqwudafpnHbUO8psS3xoTmQrIyAHABbT1wFDwrYWTpOLPCQOgRg6XTs8PbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780092942; c=relaxed/simple;
	bh=paU5MTyzUh+OblW2SLS/JXdQ7M6a/a7u58mfIX8xtCE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q4zU/whCR170qzeoAS2enUzyDCdXW0j3d6I13yiQXGb9WJ6u8lWqSa/Ajt8wwhp9LevpODNix2hCyZ8Ql8306LAsEoHaK+QSdsMA9hC3G9FdoijVK2GC34TXmZ2Gbt2JFdmDNbOfu25CVgnlh6GuQpCcesXWL72NPa1erDLapA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4ULz+YG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4ULz+YG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780092941; x=1811628941;
  h=date:from:to:cc:subject:message-id;
  bh=paU5MTyzUh+OblW2SLS/JXdQ7M6a/a7u58mfIX8xtCE=;
  b=C4ULz+YGESGsubJV0zjcp2VU0AlELPE+g1DTMTdupEe0W9B/FQ/Oyoyy
   v3eKslWCDdVoLdZqXEKZXIPdtLCRXD48bWuEOJrZrfzRbkbivueltlkMA
   gIK6S3VzC4Yb0OqzLzxA//RIR7B/GWjCJpwwSqYTB9QhWDvoaxagBsE72
   Emh0WGfdcP2Gxo/ieoaMIS4lLdEv6+CroF7ks+qKY398VrkUo2xcxMg1q
   7PK6Z4tPj6WfVXOyOq3KRX8u5fybMDhmp2Mpnk2JMJtx/a2ERUXXw6LU7
   pbps7kkSAWcomxvd51o08EvZd8hOKemTtqVgBuUO/nlGougUpdQc4DTzO
   w==;
X-CSE-ConnectionGUID: 1PUPay/ET0GpfCJM0a/ODA==
X-CSE-MsgGUID: +mKCh9fkQGS57LnWAz/NpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="91634365"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="91634365"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 15:15:41 -0700
X-CSE-ConnectionGUID: FI0/HM6LST+lMBWnk8usjw==
X-CSE-MsgGUID: Zi4NRVSaSeqEr7q5ews32g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="239956758"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 29 May 2026 15:15:40 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT5UQ-000000000xR-0EAd;
	Fri, 29 May 2026 22:15:38 +0000
Date: Sat, 30 May 2026 00:14:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/gemini-verbatim-gigabit-nas 2/2]
 arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: /
 (verbatim,s08v1901-d1): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202605300026.Mx5pGyrP-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/gemini-verbatim-gigabit-nas
head:   aaae6fb08f2ef87b78c2aa641f9f5824ce390c75
commit: aaae6fb08f2ef87b78c2aa641f9f5824ce390c75 [2/2] ARM: dts: Add a Verbatim Gigabit NAS DTS
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2055-20260528 (https://download.01.org/0day-ci/archive/20260530/202605300026.Mx5pGyrP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300026.Mx5pGyrP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605300026.Mx5pGyrP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: / (verbatim,s08v1901-d1): compatible: 'oneOf' conditional failed, one must be fixed:
   	['verbatim,s08v1901-d1', 'cortina,gemini'] is too short
   	'storlink,gemini324' was expected
   	'dlink,dir-685' was expected
   	'dlink,dns-313' was expected
   	'edimax,ns-2502' was expected
   	'itian,sq201' was expected
   	'raidsonic,ib-4220-b' was expected
   	'ssi,1328' was expected
   	'teltonika,rut1xx' was expected
   	'wiligear,wiliboard-wbd111' was expected
   	'wiligear,wiliboard-wbd222' was expected
   	'wiliboard,wbd111' was expected
   	'wiliboard,wbd222' was expected
   	'storm,sl93512r' was expected
   	from schema $id: http://devicetree.org/schemas/arm/gemini.yaml
>> arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: /: failed to match any schema with compatible: ['verbatim,s08v1901-d1', 'cortina,gemini']
   arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: /soc/syscon@40000000: failed to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: /soc/syscon@40000000/pinctrl: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
   arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: timer@43000000 (faraday,fttmr010): False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.yaml
   arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: power-controller@4b000000 (cortina,gemini-power-controller): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
   arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: ide@63000000 (cortina,gemini-pata): ide-port@0: '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml
   arch/arm/boot/dts/gemini/gemini-verbatim-s08v1901-d1.dtb: ide@63000000 (cortina,gemini-pata): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'ide-port@0', 'resets' were unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
