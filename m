Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5AD21CC48
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 06:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754632812; cv=none; b=oicAJmLjKVze7SvRnK3JSvE3YwlV6GMYZR4YXFIEl8kKgmTIBpVokGsuORM0uXKGQWNjv0RDJId2dg6poEnSgM6iVOHHVM5kassQd8roeRUpg+49ukGG/3UeUVH3mB6Cye6KMRq7RK/p87sLRhZTf0q+ZOMpZZ8ygP60eilE+b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754632812; c=relaxed/simple;
	bh=7I9flkzPAN9e+dIlwqRO/wRCZGWWieHeMfIx9TICr0w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=syQbgsoR8qSg4wc6gAFozmG/1LASfgYqqU5wa0ytPY9YbrHxHDTbnKJIiwpCA5F1FGMkb/2mwq6ez9cHNmPxsZupySXoOAKKVFNvYRjbLyk0cCe7/XGKI5dZ4cewzwwYlBb0sDBLM41buo73qGsrQAaFDvGN8IZlRiZ/C1dJH74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbtOYqkz; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbtOYqkz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754632811; x=1786168811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7I9flkzPAN9e+dIlwqRO/wRCZGWWieHeMfIx9TICr0w=;
  b=kbtOYqkz4zIr4UPbCUudELCUF9g4JVEcUfSG/nwkD/uU1XWirS4uocWI
   cN4e+IrVPV/zNmiGVtk9gBRxNbm1UQmbEs+HeCT4kejWgt7oa+1YT2xvE
   gDalc68ARdDNy1CZolgv5z5xKxqB7Nj8uJmEiQPat+KSxAq4I0r/RJoHh
   u0AwzojjkASbSLzugJp0zLDpnaOwFBWijE8kM5bk4j1bh9LKZ3s6C/fmp
   T4zHyFi8mlMz74YE5pTSYHMnthzevcx+K0NWfi/VnsTrPKbQda9zBGTbU
   vB5MQJK2hXkQQOrJ3SZLkyiLsQ5hmBE0wSlDpukjOicn2JgbUGLoVu5yJ
   Q==;
X-CSE-ConnectionGUID: Ln/hcmzdTB2wowQbY6nJzQ==
X-CSE-MsgGUID: GH2HZzvlSBKKewVnR33vtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="60784763"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="60784763"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 23:00:10 -0700
X-CSE-ConnectionGUID: aS6xgnajQqiPS8dLaBsSdQ==
X-CSE-MsgGUID: eTDzLip2QI634QjmTlO03A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="196076830"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 07 Aug 2025 23:00:09 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukG99-0003aU-01;
	Fri, 08 Aug 2025 06:00:07 +0000
Date: Fri, 8 Aug 2025 13:59:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 204/801]
 arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: infiniband@c4000000
 (hisilicon,hns-roce-v1): interrupts: [[722, 1], [723, 1], [724, 1], [725,
 1], [726, 1], [727, 1], [728, 1], [729, 1], [730, 1], [731, 1], [732, 1],
 [733, 1], [734, 1], [735, 1], [736, 1], [7...
Message-ID: <202508081326.5Vh3F80x-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: e044c64d931db12342e8987ed67171ff0353de23 [204/801] dt-bindings: infiniband: Convert hisilicon,hns-roce-v1 to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250807 (https://download.01.org/0day-ci/archive/20250808/202508081326.5Vh3F80x-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508081326.5Vh3F80x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508081326.5Vh3F80x-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/mdio@603c0000: failed to match any schema with compatible: ['hisilicon,hns-mdio']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/dsa@c5000000: failed to match any schema with compatible: ['hisilicon,hns-dsaf-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@0: mc-mac-mask: b'\xff\xf0\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@1: mc-mac-mask: b'\xff\xf0\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@4: mc-mac-mask: b'\xff\xf0\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: port@5: mc-mac-mask: b'\xff\xf0\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
>> arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: infiniband@c4000000 (hisilicon,hns-roce-v1): interrupts: [[722, 1], [723, 1], [724, 1], [725, 1], [726, 1], [727, 1], [728, 1], [729, 1], [730, 1], [731, 1], [732, 1], [733, 1], [734, 1], [735, 1], [736, 1], [737, 1], [738, 1], [739, 1], [740, 1], [741, 1], [742, 1], [743, 1], [744, 1], [745, 1], [746, 1], [747, 1], [748, 1], [749, 1], [750, 1], [751, 1], [752, 1], [753, 1], [785, 1], [754, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/infiniband/hisilicon,hns-roce-v1.yaml#
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/sas@c3000000: failed to match any schema with compatible: ['hisilicon,hip07-sas-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/sas@a2000000: failed to match any schema with compatible: ['hisilicon,hip07-sas-v2']
   arch/arm64/boot/dts/hisilicon/hip07-d05.dtb: /soc/sas@a3000000: failed to match any schema with compatible: ['hisilicon,hip07-sas-v2']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
