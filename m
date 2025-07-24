Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1B0E571
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Jul 2025 21:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753393218; cv=none; b=AINUUoHTBkYlRnmAaZ6AdTlyoLkc4zGqsh21bO5eDYzKFF92KCORsQjX6Q50TTbYXMNVUgX/MwQ5OGNEmY7xt8ZK7h52Q4gEoRzRVkHG9vX0fTP2OUEyfmnZw4iRN7M4jhwLkfVbSMOYCnVSnSgcJb4nBjzwl3Cex0hyXxxQOBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753393218; c=relaxed/simple;
	bh=vINkOlBY1BjbA7PdDMU1A1zOge2V/5qtyZfiy1yQSC8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IHMyvBfJlAwS1D07iLDfdGNyT6fws6xIWDE6VAdrtY+c93ZDcXCDPWl/OjHSniEy99Ogz72Jhw+5bueJxs9uNz7VSW+BySeTr+N/Va7ycqTJNk7paWO73eXvqw+GWMZGPuIDioaFhfmItlEo/aeCMxQzbXIKJc59t6FWtaf+TN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOWk63TG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOWk63TG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753393216; x=1784929216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vINkOlBY1BjbA7PdDMU1A1zOge2V/5qtyZfiy1yQSC8=;
  b=eOWk63TGeDnZw5U6WoTvSVtQO8wpDCvHHxqHlSTjgQDhLFqhdU3u+6o+
   DIT/t1mtgImaxVTN8RVl/okRnioEWKMh3qNQ9qQBZgFNe7zN7yOnsWBzX
   ad009AJM4qxBv720aj28Nz10HeeG66w6V46otI8krSN8O5fwwpDyHojbS
   9VjUfC6CC7L6fDBfw9F/2qj9BdamKPMJTS+Dkoz9Gr2FJyqe/9rqOy952
   X9u4ZPV5bfPTR159CKy7DGVz2/zbSfYnkIhP1mWnYUdzU4gzKtRn6ySj7
   TfSrFf0lbPkl2szo3IhsSTfQz/MhsKhSuUnHGALAnf62X0Z4ZPlciINT2
   g==;
X-CSE-ConnectionGUID: F0kqCVDESjSiKh8G5k31MQ==
X-CSE-MsgGUID: YGH4x2MOR6aRZ/AaIYbyTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55874995"
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="55874995"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 14:40:12 -0700
X-CSE-ConnectionGUID: 4uiWljqQTXmLRDmVRboMqA==
X-CSE-MsgGUID: tmH9S1h4S9GVg0UV9Jvk6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,337,1744095600"; 
   d="scan'208";a="161188944"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jul 2025 14:40:11 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uf3fd-000Kqb-18;
	Thu, 24 Jul 2025 21:40:09 +0000
Date: Fri, 25 Jul 2025 05:39:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 2/4] riscv: dts: starfive: add Milk-V Mars CM
 system-on-module
Message-ID: <202507250524.oLFlPUQz-lkp@intel.com>
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
In-Reply-To: <20250724094912.253723-3-e@freeshell.de>
References: <20250724094912.253723-3-e@freeshell.de>
TO: E Shattow <e@freeshell.de>
TO: Conor Dooley <conor@kernel.org>
TO: Emil Renner Berthing <kernel@esmil.dk>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Paul Walmsley <paul.walmsley@sifive.com>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: E Shattow <e@freeshell.de>
CC: linux-riscv@lists.infradead.org

Hi Shattow,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 28fa0dcb571ab8f3be4d919f0e20e01d4e44bcb1]

url:    https://github.com/intel-lab-lkp/linux/commits/E-Shattow/dt-bindings-riscv-starfive-add-milkv-marscm-emmc/20250724-175339
base:   28fa0dcb571ab8f3be4d919f0e20e01d4e44bcb1
patch link:    https://lore.kernel.org/r/20250724094912.253723-3-e%40freeshell.de
patch subject: [PATCH v1 2/4] riscv: dts: starfive: add Milk-V Mars CM system-on-module
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-randconfig-052-20250725 (https://download.01.org/0day-ci/archive/20250725/202507250524.oLFlPUQz-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250725/202507250524.oLFlPUQz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507250524.oLFlPUQz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dtb: pinctrl@13040000 (starfive,jh7110-sys-pinctrl): 'wifi-host-wake-irq' does not match any of the regexes: '-[0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/starfive,jh7110-sys-pinctrl.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
