Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC99621FF23
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 01:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766453454; cv=none; b=ZZRDp1/OQkkdr/wDRyLt/jjb6B+84VTsgeWoFOWkFZgPc9Ch4jNNFjrLISyYLiB6delOGJNxVLLP9Apv5eHHh9qFN1qwtgde5VtOG1opTAMXiZuoiB/EfwuzypJMhpce3Cj9c20zbyW7MJaSE1ucFCRauSb0ViyktNOMnPX9q+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766453454; c=relaxed/simple;
	bh=JKrKCu2JinKechpmviPrYgj6JmCsu6XQB/lZ7qk1W4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YsTQQCTRzjEFnmCZMp8Ttu3ZFsEq51KDR6OHpUzBRq0Fx34fEFpZe8/wy7KX+soXuJt0mhT3sasCeQY/b5YjP1YlX4qojpgKcRnBGu3IB+QYQyIFgdFE7lhOM7zdlMuoJR8a5NARCOUTTTfTdLKdAgEcElda8tooPU3nRFvCSoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DeOaDFxC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DeOaDFxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766453452; x=1797989452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JKrKCu2JinKechpmviPrYgj6JmCsu6XQB/lZ7qk1W4A=;
  b=DeOaDFxCa5/rWT6u+9/8cGPiB4uhIByYJhDiH9YM/sGjdy5dZvNIYfEM
   9bP5toaI8TygWqy02xR+WiThEcaRoQWKyEh3lCtiNpEJEDAx5K/i+KuLg
   gkkSVba2Y+1x0GKgKtAYyrOc//5l4ykqALLmRXn5ICy6muj0sexX5Ugx+
   RQH+bP6R1FQuBhhxeHLS8Qn/ZbL9RpwEImtFDdOlwyWL7h6aUnsBjk9Us
   L63CnCyLpzxldffo4q6o6I84kfqa4sv28OkK2ivc4K9RS1/x1KANcBkzE
   lhip6/YbZRgfsGPT/G0F1FR+etHSEhELqbafLc20fxYJZLdCGBOcaZzTU
   w==;
X-CSE-ConnectionGUID: yeIEg/QBSCeKDED23cK/nQ==
X-CSE-MsgGUID: Xh8T00qFRVmrO88jx8HsAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="85721039"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="85721039"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 17:30:52 -0800
X-CSE-ConnectionGUID: qS5IxxX8Tsy8gspu6zWviA==
X-CSE-MsgGUID: aHi2bCGlR2KMf6lpNTth1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="203792551"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Dec 2025 17:30:50 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXrEe-000000001IP-061l;
	Tue, 23 Dec 2025 01:30:48 +0000
Date: Tue, 23 Dec 2025 09:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] regulator: Add TPS65185 driver
Message-ID: <202512230921.lu1gQUjB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/regulator/tps65185.c:656:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251222-tps65185-submit-v1-2-34986b504d5f@kemnade.info>
References: <20251222-tps65185-submit-v1-2-34986b504d5f@kemnade.info>
TO: Andreas Kemnade <andreas@kemnade.info>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Guenter Roeck <linux@roeck-us.net>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-hwmon@vger.kernel.org
CC: Andreas Kemnade <andreas@kemnade.info>

Hi Andreas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/dt-bindings-regulator-Add-TI-TPS65185/20251222-202246
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20251222-tps65185-submit-v1-2-34986b504d5f%40kemnade.info
patch subject: [PATCH 2/2] regulator: Add TPS65185 driver
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: loongarch-randconfig-r133-20251223 (https://download.01.org/0day-ci/archive/20251223/202512230921.lu1gQUjB-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230921.lu1gQUjB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512230921.lu1gQUjB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/tps65185.c:656:1: sparse: sparse: bad integer constant expression
   drivers/regulator/tps65185.c:656:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/regulator/tps65185.c:657:1: sparse: sparse: bad integer constant expression
   drivers/regulator/tps65185.c:657:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/regulator/tps65185.c:657:1: sparse: sparse: bad integer constant expression
   drivers/regulator/tps65185.c:657:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +656 drivers/regulator/tps65185.c

b1c1b1530b174ad Andreas Kemnade 2025-12-22  654  
b1c1b1530b174ad Andreas Kemnade 2025-12-22  655  /* Module information */
b1c1b1530b174ad Andreas Kemnade 2025-12-22 @656  MODULE_DESCRIPTION("TPS65185 regulator driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
