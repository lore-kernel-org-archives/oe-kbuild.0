Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D5822D79D
	for <oe-kbuild@lists.linux.dev>; Thu,  1 May 2025 01:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746064236; cv=none; b=sIUIFNxIc230CAfr6aKZING8Gsfdhpt9d15ejQG+TV5W8KAc0UOt325xpRa7jYJPncJl+FsEbFcFAFSWJ5+4j5GAWBSDn8tRRzGtE8i7SpOQTROJAkhu42cWbvjCK8ktWLjwJweCIfGCkRr4xYjvSOiP3kiDCED0Suoifeg+Bzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746064236; c=relaxed/simple;
	bh=c9xiqcTxVe5faLZokF6lxw8pOGZ5jx1pNRieW/fOxv4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=neID1eNeDQUa0eeQ9/xEWk8pYgBL4aJB3G/TNySPQE/hDgxuu6y9jlCsz0agN8I+jv3YUjQHt2eJ1HXSxE32Hm++oSW7kqPk1w8RBwNqdNeNAuXAeWFfAM8SiGftwnp+SrKw4PplXuMY9xe/IRUA0jwcfzxTNRycztaBS5LQNho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m+Q6QWmM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m+Q6QWmM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746064233; x=1777600233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c9xiqcTxVe5faLZokF6lxw8pOGZ5jx1pNRieW/fOxv4=;
  b=m+Q6QWmMBKZ9gL+rKDvgmNzEfZfW7FOppHEpD/yJBT5Mu2kCKlhgNVQF
   l6qM3kdiR3BEBhXf1P6dmOvzetWSEmNpKZNdb/+e6JVcNzLCb01T/FkDD
   MCu8oYYxahhNLY7/4D3A/9NfyBQhQiVQwh72QtmG2UADTG0C3nSq9drFc
   9CLhvM5JfgbWTaf8DNck4AQLxRaJ7xDiVG2qDK7CUE0IWEnrmLPzZ6peD
   euel5tZonAItwGHyk/VhJkWE20KjcyDa5QbjuLv1CmoRT6bqZUEiBoIqw
   r29nGWtnmPgGsTzGHyE3QrBNUy/62/M4dyr0JrQ5yrrKo4vdS6VhVuDGs
   Q==;
X-CSE-ConnectionGUID: scRmm6pmTPSXa+h5A17FGA==
X-CSE-MsgGUID: HgaCRzb9T823ylpHED0Zxg==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="50401731"
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="50401731"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 18:50:33 -0700
X-CSE-ConnectionGUID: aU/FKMELQga7lI6VOiaPZQ==
X-CSE-MsgGUID: bCtrzWTJQL+zMdkpLqFICw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,253,1739865600"; 
   d="scan'208";a="139425560"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Apr 2025 18:50:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAJ4H-0003td-1C;
	Thu, 01 May 2025 01:50:29 +0000
Date: Thu, 1 May 2025 09:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 02/10] ARM: dts: exynos: Add rtc clock definitions for
 MAX77686 PMIC for Exynos4412 Odroid
Message-ID: <202505010934.ucJLL8xG-lkp@intel.com>
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
In-Reply-To: <20250425132727.5160-3-linux.amoon@gmail.com>
References: <20250425132727.5160-3-linux.amoon@gmail.com>
TO: Anand Moon <linux.amoon@gmail.com>
TO: Chanwoo Choi <cw00.choi@samsung.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: linux-kernel@vger.kernel.org
TO: linux-clk@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Anand Moon <linux.amoon@gmail.com>

Hi Anand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 02ddfb981de88a2c15621115dd7be2431252c568]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/dt-bindings-clock-Add-RTC-clock-binding-for-Maxim-MAX77686/20250425-213549
base:   02ddfb981de88a2c15621115dd7be2431252c568
patch link:    https://lore.kernel.org/r/20250425132727.5160-3-linux.amoon%40gmail.com
patch subject: [PATCH v1 02/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos4412 Odroid
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-052-20250429 (https://download.01.org/0day-ci/archive/20250501/202505010934.ucJLL8xG-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250501/202505010934.ucJLL8xG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505010934.ucJLL8xG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/samsung/exynos4412-odroidu3.dtb: pmic@9 (maxim,max77686): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77686.yaml#
--
>> arch/arm/boot/dts/samsung/exynos4412-odroidx.dtb: pmic@9 (maxim,max77686): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77686.yaml#
--
>> arch/arm/boot/dts/samsung/exynos4412-odroidx2.dtb: pmic@9 (maxim,max77686): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77686.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
