Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9CB1F0E49
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Apr 2025 10:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317758; cv=none; b=c3VQ0iroRG6GNhS8uljUBoikiNbYQO+Q3XmjHVP6r4bzFhZYHbT24voCU4ftra6fid6hiJwwBHs6LF2eCzNj2KWfqZMpAGFWP/ZFlFifq+s5OYLsK0ns/iC6yidF6LUbGF/8KUKCkSs2Kp5XXSN/h7Stxqf0zOc3Hp0x0NV02NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317758; c=relaxed/simple;
	bh=+JqgFTcErstTUfiHu8CeikaceP03FyTZGGGJh90ePOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJoe8nW+P7Q4cdrYwTIkvxqNs46qm1cpDIQAcyvMiYONviMRGr9JWAxztfyyxXYxZVklgU09CoXv9q+QM0WsXXbXGaW5wGIzpRtJA03FyZFflv9alWQ39Bn9PowRq4L1IoMcBhEhg/r7ZB3Pnvu6p1bKjrfkQQhZ0X3vQzMJA64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=anAEQUli; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="anAEQUli"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745317756; x=1776853756;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+JqgFTcErstTUfiHu8CeikaceP03FyTZGGGJh90ePOI=;
  b=anAEQUlijjArg5XH7XNcgyiubZTfslD1uOs8dWxE8WbrLyPK6EJY15ul
   NwXKqcUTa69aEjyHIdRimdjzAzSZPkwKTL4jREQkJ3QFdurf8Psj3GmDS
   4bmdjj25vvMR7yF6/LSrSFBJlxxd5UqqM3Utl+ykgNNW5IBPRLCTtQJaD
   Qvb8Zy3X/u1B5A2wfZy3DXZ/X+C4gQl2K66nITsJLeufS8I2NJGqRUwAD
   mQHgDCTJNLmASLvxRJR85eV0CDkxWSVcs52NGBzcoJsoSeNb2UErCFNov
   TRG3/hilbmEkMG3GGxIwxk/QwoqKX5itrnztfdWner9j2UaNF7iZYGZ0F
   w==;
X-CSE-ConnectionGUID: SDITo2vSS8OIXiyRTsjrPA==
X-CSE-MsgGUID: wcPG9a8MS1meqw61AZg0Fg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="50533219"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="50533219"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 03:29:15 -0700
X-CSE-ConnectionGUID: aVpZvXEJQYu0Y3vwTXaMVw==
X-CSE-MsgGUID: eIgCIyhrRzW/1CWK5n6MFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="136970710"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 22 Apr 2025 03:29:14 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7AsJ-0000rf-2w;
	Tue, 22 Apr 2025 10:29:11 +0000
Date: Tue, 22 Apr 2025 18:28:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/6] arm64: dts: allwinner: A523: Add SID controller node
Message-ID: <202504221800.CJcUJpeO-lkp@intel.com>
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
In-Reply-To: <20250411003827.782544-5-iuncuim@gmail.com>
References: <20250411003827.782544-5-iuncuim@gmail.com>
TO: iuncuim <iuncuim@gmail.com>
TO: Vasily Khoruzhick <anarsoul@gmail.com>
TO: Yangtao Li <tiny.windzz@gmail.com>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Andre Przywara <andre.przywara@arm.com>
CC: "Rafael J . Wysocki" <rafael@kernel.org>
CC: Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Zhang Rui <rui.zhang@intel.com>
CC: Lukasz Luba <lukasz.luba@arm.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>
CC: linux-pm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>

Hi iuncuim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on next-20250417]
[cannot apply to rafael-pm/thermal linus/master v6.15-rc3]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/iuncuim/thermal-drivers-sun8i-add-gpadc-clock/20250411-084240
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250411003827.782544-5-iuncuim%40gmail.com
patch subject: [PATCH 4/6] arm64: dts: allwinner: A523: Add SID controller node
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: arm64-randconfig-052-20250422 (https://download.01.org/0day-ci/archive/20250422/202504221800.CJcUJpeO-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504221800.CJcUJpeO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504221800.CJcUJpeO-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'allwinner,sun8i-a83t-sid' was expected
   	'allwinner,sun8i-h3-sid' was expected
   	'allwinner,sun20i-d1-sid' was expected
   	'allwinner,sun50i-a64-sid' was expected
   	'allwinner,sun50i-a523-sid' is not one of ['allwinner,sun50i-a100-sid', 'allwinner,sun50i-h616-sid']
   	'allwinner,sun50i-h5-sid' was expected
   	'allwinner,sun50i-h6-sid' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dtb: efuse@3006000 (allwinner,sun50i-a523-sid): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dtb: /soc/efuse@3006000: failed to match any schema with compatible: ['allwinner,sun50i-a523-sid', 'allwinner,sun50i-a64-sid']
--
   	'allwinner,sun8i-a83t-sid' was expected
   	'allwinner,sun8i-h3-sid' was expected
   	'allwinner,sun20i-d1-sid' was expected
   	'allwinner,sun50i-a64-sid' was expected
   	'allwinner,sun50i-a523-sid' is not one of ['allwinner,sun50i-a100-sid', 'allwinner,sun50i-h616-sid']
   	'allwinner,sun50i-h5-sid' was expected
   	'allwinner,sun50i-h6-sid' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: efuse@3006000 (allwinner,sun50i-a523-sid): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: /soc/efuse@3006000: failed to match any schema with compatible: ['allwinner,sun50i-a523-sid', 'allwinner,sun50i-a64-sid']
--
   	'allwinner,sun8i-a83t-sid' was expected
   	'allwinner,sun8i-h3-sid' was expected
   	'allwinner,sun20i-d1-sid' was expected
   	'allwinner,sun50i-a64-sid' was expected
   	'allwinner,sun50i-a523-sid' is not one of ['allwinner,sun50i-a100-sid', 'allwinner,sun50i-h616-sid']
   	'allwinner,sun50i-h5-sid' was expected
   	'allwinner,sun50i-h6-sid' was expected
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: efuse@3006000 (allwinner,sun50i-a523-sid): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/allwinner,sun4i-a10-sid.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: /soc/efuse@3006000: failed to match any schema with compatible: ['allwinner,sun50i-a523-sid', 'allwinner,sun50i-a64-sid']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
