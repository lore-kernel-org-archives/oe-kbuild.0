Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C457CF3F
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Feb 2024 21:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706909470; cv=none; b=uThffz9McfX7yrVAX/KYpr0Pi40Rn66lo26e6bxjIe6Pg5nTK+ADVcj1c25INsBuB4WnX6SSEZCaNCzYR2UDKg/G0pcFkFseCIxZg0jwJ8XOLdogxO2rQRvp7z6mkDgjVU4KQLtrtVin7VQZudBdDjiKtPhW4oK5KDQ5mS9QgHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706909470; c=relaxed/simple;
	bh=EbmluR5Eqc4wrWi9D7p7gbImOwe0p86HF8zIlW3eqnY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UquwmRS+smaGofEfriLxQr+hQKsSAOq/lrWuIy5FyoHT+uJASwJcbosYABbP3YQ1W2SC824nA+S0Gy+S/XAejDEZ8fNhaHaHpExGelsjOd8l3iJueLg8ffcyLt4jqN7u7VPNy26TyrV5MulBAR0Yi1qvYjmDLhvi4GLoZlo580w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fdAcIVPy; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fdAcIVPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706909468; x=1738445468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EbmluR5Eqc4wrWi9D7p7gbImOwe0p86HF8zIlW3eqnY=;
  b=fdAcIVPyKfQhl2ZvDevseAN2NU7ShfL+w4FSTbzleTc0/iHPRLyBOqD6
   A35GZEJdBj28VUDH2i09Dde5j0AoFUS1ZFSWp69ZbLl89GbGURE86qco/
   amN4WVlMSymA2JHJ22bxGFA6HijKeqrSInILX1K//BDkRmzPgPwRrglgb
   k+05pXrTJ+vC7LTti5TyuUnDuS1ll4s1kgj85a+jt2JiZUJo7lrKYdHkd
   E+iMkD0gCR5EbGKA/2XZ+1Y65JaCN6M+qrHa1LeggLIiCci3btq7Z5WGn
   yaG09ArxNObrlqAxvUbDGkwf0zUh82/gcN3MTP4DP9xZwh5Gnj/jwlzEI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="17659907"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="17659907"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 13:31:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="186008"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 02 Feb 2024 13:31:06 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW17n-0004HG-1z;
	Fri, 02 Feb 2024 21:31:03 +0000
Date: Sat, 3 Feb 2024 05:30:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] regulator: dt-bindings: gpio-regulator: Fix
 {gpios-,}states limits
Message-ID: <202402030523.nRt30f9t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: Documentation/devicetree/bindings/regulator/gpio-regulator.yaml: properties:states:minItems: 0 is less than the minimum of 1"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <b20aab137058c02ab5af9aaa1280729a02c6ea49.1706802756.git.geert+renesas@glider.be>
References: <b20aab137058c02ab5af9aaa1280729a02c6ea49.1706802756.git.geert+renesas@glider.be>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Rob Herring <robh+dt@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Marek Szyprowski <m.szyprowski@samsung.com>
CC: devicetree@vger.kernel.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Geert Uytterhoeven <geert+renesas@glider.be>

Hi Geert,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on robh/for-next linus/master v6.8-rc2 next-20240202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Geert-Uytterhoeven/regulator-dt-bindings-gpio-regulator-Fix-gpios-states-limits/20240202-001009
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/b20aab137058c02ab5af9aaa1280729a02c6ea49.1706802756.git.geert%2Brenesas%40glider.be
patch subject: [PATCH 1/2] regulator: dt-bindings: gpio-regulator: Fix {gpios-,}states limits
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240203/202402030523.nRt30f9t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202402030523.nRt30f9t-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/regulator/gpio-regulator.yaml: properties:states:minItems: 0 is less than the minimum of 1
   	hint: An array property has at least 1 item or is not present
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
