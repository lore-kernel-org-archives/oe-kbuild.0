Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEABF3F0A99
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jun 2026 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780416631; cv=none; b=IZAcw9wSUgXJyrcUE6FrZTPIjt83ScyQqi+luWqlp8+WHLJzjsfc/ssr6b8cjwwt1zq6QvRZkbyKR9pItfITb9GAL3F/SKzqf6JFA1671bx6yXRLGsr7oBhqMwxl5XJ5pi3xzdIg2lG6742zC67R4joJMCZRRvT+0M4E2upF2xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780416631; c=relaxed/simple;
	bh=8I9LL/cqK3HDk9eoNjTpwqDQ0qMVweLwFAYwtWw/Tjk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uz4x1M5qgZrDJsWpSHn/ZQViJmkr5c4zzdEzip3sYAqzRX1btqYR/1O+LJjpn00rnkYpe8HAsQYgz3/ZkbheS4SNrz2DM6N1OwuylBMgfGODeQ9GZ0a31Nk3f0wx2sdbtTs34FRNI6n6c5hautTVJM/P/mNWoDAxyPB6mDMt/LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4cuhoMg; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4cuhoMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780416630; x=1811952630;
  h=date:from:to:cc:subject:message-id;
  bh=8I9LL/cqK3HDk9eoNjTpwqDQ0qMVweLwFAYwtWw/Tjk=;
  b=O4cuhoMgwYI6RvAIQ5fBqRejxoEiWfBM0VthiVm3tJU9JqaHzLycap0r
   ozlAgUWFXK6oQpcJP0c/Mvbm3FwSPGsAsr8FufllCFMTJ5Zmug667bZdt
   iQS+RvKY8SaVRUMutdhcwdJqGA8z8953EPOMs5SJihrtFbK8OXXrrjF/B
   NZUN2DRis5CxUDhbXgspSbg3VUiJpbtw6MQ3nzxdoBOLosMQWroZuuI3c
   S4WVUw/6oH7ZKXxhU6QW2OfjUoxs/bFh5R0QXz+bLgwBltH2dvS78FLKg
   VEQ+8qtvQV36vbB8X5CM4G8fv57puCV2cwFMHyG82byNwngVVj0wopvfj
   g==;
X-CSE-ConnectionGUID: H3Z1P2zWSAyCvyq1ON/qhg==
X-CSE-MsgGUID: ypfQ/9UsSzuROE9I58dXMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="92693921"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="92693921"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 09:10:30 -0700
X-CSE-ConnectionGUID: tH1o3tJJThS7LDdaDAaBnA==
X-CSE-MsgGUID: wzn34/NkQ9G74Qu16q6fUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="244039698"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 02 Jun 2026 09:10:29 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wURhC-000000001pB-2q4f;
	Tue, 02 Jun 2026 16:10:26 +0000
Date: Tue, 02 Jun 2026 18:10:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:gemini-dts-for-soc 7/8]
 arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: /soc/syscon@40000000: failed to
 match any schema with compatible: ['cortina,gemini-syscon', 'syscon',
 'simple-mfd']
Message-ID: <202606021830.mekzQ496-lkp@intel.com>
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
commit: 0b6084ebde381d808c80bf42364298e2ae326175 [7/8] ARM: dts: Add a Raidsonic IB-4210-B DTS
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm-randconfig-2055-20260528 (https://download.01.org/0day-ci/archive/20260602/202606021830.mekzQ496-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606021830.mekzQ496-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606021830.mekzQ496-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: /soc/syscon@40000000: failed to match any schema with compatible: ['cortina,gemini-syscon', 'syscon', 'simple-mfd']
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: /soc/syscon@40000000/pinctrl: failed to match any schema with compatible: ['cortina,gemini-pinctrl']
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: timer@43000000 (faraday,fttmr010): False schema does not allow [[2]]
   	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.yaml
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: power-controller@4b000000 (cortina,gemini-power-controller): '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml
>> arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: ide@63000000 (cortina,gemini-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml
   arch/arm/boot/dts/gemini/gemini-nas4210b.dtb: ide@63400000 (cortina,gemini-pata): Unevaluated properties are not allowed ('resets' was unexpected)
   	from schema $id: http://devicetree.org/schemas/ata/faraday,ftide010.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
