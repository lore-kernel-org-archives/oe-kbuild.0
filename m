Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313B420E700
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 10:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612249; cv=none; b=oJPWdVlP/F0Vw0o6sSqDGq8Ex8YDXLfWeS0hnchyqwn3NbXPlFhuN/+EflsEea+p393vk6TOEjbScjOhogis4hDsRWNJVW0WiRSQ6CLOVUZxLavnaPGXiOZT7Qh8emPwU2MQMzlx7MVCgFGaeoLWFBAwAHkXNCkfqkf48JjHUus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612249; c=relaxed/simple;
	bh=R0knY3roEj+h8OswhK3R0Pk3gLhwJWthnXDrkWBRB0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cS+gNEjWw8lveuBXna6TFGp/+SVeDJY82ffqZRHmjZMywn1AEIypguqUGPjIE457sDEWZ39GwK4YfTDJmU+KDBX38HAHzj2qs4GtzSnB2hBJiGD85LX1/hdZHsNzxQeDsTkS8RFf4NlJn861Zz+EHfqEYCRRdsQdmE5B41n99kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asLzVCiY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asLzVCiY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746612247; x=1778148247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R0knY3roEj+h8OswhK3R0Pk3gLhwJWthnXDrkWBRB0Y=;
  b=asLzVCiYYsZBHBHJ7dQ8NvC78yw+ILzm/Ot6+d4AshdFOLbL7KcW0SzK
   q6So5lv5IuVdS4v45tY43Q4Vl+OEyM18XTjcaNAFeVMO7nXZtjp32b0Iv
   bNg9vVoo7jp5xf6joC7zahBaenYpqjteszMkiQ0Q1N4yO8wPsGQciQzrJ
   poesN7UyoRQw5gMWuIePHqLjHASEKIcL0NbptQ5/6uaUbbf3APQgFrQ06
   XOnp3REi9rbX7yUi0CL9yrE5z48+FU3CD5lgeHGnYPtFWJxoI+/ZJOZez
   YAvdZQRmfcJPwDyPKQI+KE/jJITWd0lNU+dHzQu5pKPD59A/J0mEDTD7a
   A==;
X-CSE-ConnectionGUID: WRJPuqBQTgmXRf6wRzlobg==
X-CSE-MsgGUID: ZSgbi7tKRgu8/FTz8ATXDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="59730192"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="59730192"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:04:05 -0700
X-CSE-ConnectionGUID: gkODfuB0S3ukrWs+nL6qBQ==
X-CSE-MsgGUID: cV4a46gMSM6zdZm8KtyPHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="135816376"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 May 2025 03:04:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbdC-0007Yq-1c;
	Wed, 07 May 2025 10:04:02 +0000
Date: Wed, 7 May 2025 18:03:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v4 3/4] arm64: dts: exynos: add initial support for
 Samsung Galaxy S22+
Message-ID: <202505071718.HNYhBnkf-lkp@intel.com>
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
In-Reply-To: <20250504145907.1728721-4-ivo.ivanov.ivanov1@gmail.com>
References: <20250504145907.1728721-4-ivo.ivanov.ivanov1@gmail.com>
TO: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
TO: Vinod Koul <vkoul@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-samsung-soc@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org

Hi Ivaylo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk/for-next]
[also build test WARNING on krzk-dt/for-next krzk-mem-ctrl/for-next pinctrl-samsung/for-next robh/for-next linus/master v6.15-rc5 next-20250506]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ivaylo-Ivanov/dt-bindings-arm-samsung-document-g0s-board-binding/20250505-121708
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git for-next
patch link:    https://lore.kernel.org/r/20250504145907.1728721-4-ivo.ivanov.ivanov1%40gmail.com
patch subject: [PATCH v4 3/4] arm64: dts: exynos: add initial support for Samsung Galaxy S22+
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250507 (https://download.01.org/0day-ci/archive/20250507/202505071718.HNYhBnkf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250507/202505071718.HNYhBnkf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505071718.HNYhBnkf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/phy@10aa0000: failed to match any schema with compatible: ['samsung,exynos2200-usb32drd-phy']
>> arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/phy@10ab0000: failed to match any schema with compatible: ['samsung,exynos2200-eusb2-phy']
   arch/arm64/boot/dts/exynos/exynos2200-g0s.dtb: /soc/usb@10b00000: failed to match any schema with compatible: ['samsung,exynos2200-dwusb3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
