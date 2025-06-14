Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18151C54AF
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 10:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749895947; cv=none; b=bFfwJ1MfpgwHtR/w+6Jqf102VNjojZ9zpVpdN8HM9RLq26x1x7K/IH5EoGI2XFMwmUrSdSmT/7bInLuKNi762OqFIQFhMj/G+qS4QKkuO0zCTQ7NxwjWgDmlltS90CX6Hg1Jw8/TuPqw2kHML2kqsf84x+NbdCFQ2565YKjddas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749895947; c=relaxed/simple;
	bh=ue+ZjDb7mry7zyzO72UhP+e1snYX9PO7q23QBkwLmvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jtJsXPsa4IaMm99ybqT+Q7klcNKKNXgpUBtpzSMQfMprfrQbjqGXH2GBHQNxU4bEQ/bJs9X1MJZE9nGsmSmwj0TfoN3J6449wq23aCFT0sSX2wpUcSHmg1QXwMldmXShWvJRRuexC7pbo1GZ0l1PB/L8wPKxQlWY4LjdP1yu/oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IyNbrUI8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IyNbrUI8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749895945; x=1781431945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ue+ZjDb7mry7zyzO72UhP+e1snYX9PO7q23QBkwLmvg=;
  b=IyNbrUI8M2UXwZOFHTCu8i+bLa6WGlY8n8rFQkpFPA+hkleoWbD0Tmvy
   th+4YUYiV0dQCBAREzq1mE6YD9n8BSo4oSmjsVxWpmluERerAHkkswuyC
   sdl5ELsD2YBDWWclk07lsJXl1vUqzqm1jYmg1QG0dNhlIlsSM9auOgykN
   p3xKHCLWBKbwTm6So1f6B0IW7iI7gzuQVfbtgSHV1GFcogkWNYV2IduBH
   Bq/5aym25g6rIw//ZxiRTvDsJYQuXVTC+/CoiNtjv6ckkHrzCE2VSlebO
   eWuLcWlR7kzSzniwLDzIyHSysvpoqWzVTgZB1LHHCLIqtb0Zt4FY/k9RG
   Q==;
X-CSE-ConnectionGUID: 1D2pJRXiS0SKE4bft4LP5w==
X-CSE-MsgGUID: /XEggEu9SMi9k8+8g0OhLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63139924"
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="63139924"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 03:12:25 -0700
X-CSE-ConnectionGUID: OW6ZNt/qRkiUw+42b3myHA==
X-CSE-MsgGUID: RGVOIpmdS7e6ZgCc6/K/kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,236,1744095600"; 
   d="scan'208";a="171229560"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jun 2025 03:12:24 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQNs4-000DQu-32;
	Sat, 14 Jun 2025 10:12:20 +0000
Date: Sat, 14 Jun 2025 18:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/6] riscv: dts: spacemit: enable the i2c8 adapter
Message-ID: <202506141800.wh6qYaSE-lkp@intel.com>
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
In-Reply-To: <20250613210150.1468845-5-elder@riscstar.com>
References: <20250613210150.1468845-5-elder@riscstar.com>
TO: Alex Elder <elder@riscstar.com>
TO: lee@kernel.org
TO: lgirdwood@gmail.com
TO: broonie@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: dlan@gentoo.org
CC: paul.walmsley@sifive.com
CC: palmer@dabbelt.com
CC: aou@eecs.berkeley.edu
CC: alex@ghiti.fr
CC: troymitchell988@gmail.com
CC: guodong@riscstar.com
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev
CC: linux-kernel@vger.kernel.org

Hi Alex,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Alex-Elder/dt-bindings-mfd-add-support-the-SpacmiT-P1-PMIC/20250614-050423
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250613210150.1468845-5-elder%40riscstar.com
patch subject: [PATCH 4/6] riscv: dts: spacemit: enable the i2c8 adapter
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: riscv-randconfig-052-20250614 (https://download.01.org/0day-ci/archive/20250614/202506141800.wh6qYaSE-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506141800.wh6qYaSE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506141800.wh6qYaSE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: i2c@d401d800 (spacemit,k1-i2c): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@41' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: serial@f0612000 (spacemit,k1-uart): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
