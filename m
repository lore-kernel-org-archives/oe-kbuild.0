Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DE32472AE
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 15:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766244801; cv=none; b=PI4u6jxl9m0/hwgfOY0n9IUTLorLKAGrNaD/vCkOljgmdAJhv+Hz8yjlHUN1s7Tex/X1EdFI7aeJcdK86jbnVK5BTYUrQ1oZiMFvlaRy69BS+BNCQaedxSCjZUAP0AedfKHEhSJlMv4zEaA7UOZ0rLGQmpafvtl8N927xh6EUeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766244801; c=relaxed/simple;
	bh=qsNugKTjQ7Yf23uU56DXazM7uhGwd9zRdVSDumqg71U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Or8JbsJ+hU5w5vQ7/y8i+MZss8RcYb8LHa0i02MFpt7xGPOr/3ya7nZiE1FCO8ROpjmXRu5Mc0Otj5oSpCtEvuLgmFF74ZkO1vsPlpBUy4xK7nS3sbK+dOMHQ6NS0eHKQehe9BSYhlrfXEiZYGWA83/qUslJEv0zU+yOBJ7Ga9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BFLDkvz5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BFLDkvz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766244800; x=1797780800;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qsNugKTjQ7Yf23uU56DXazM7uhGwd9zRdVSDumqg71U=;
  b=BFLDkvz5R1E7FrbBr/q0ds54HSRqKX93P2k6eqhcxKf/yT8IzQd3L1Ty
   A5RPO1Eo5hQXnWp/r1F8KDogkmDZXoCntmoIEjWA8/7M/W2THNz/t2o9a
   UDm/fIAGJUwaMDaJjo/6KbA0VVwKauK60NeC7ydUq6I7QGc7dxMsv752b
   PywDAY7DG2WLmWoSunwYxUWS5pQGSA6CrGODQ5EK3YEyPeuLCyfk2UR2m
   uqiEWiNidbiKG+SuhcULNMCaKYmxbQnOvJPVpIede5PEQjTkexDqVmxIp
   FlUAa5UQlKGMg9hGqlI5XyffmGwSLNgugoV2vuaRPjVQtsLUf6u7g18D5
   Q==;
X-CSE-ConnectionGUID: jHwdiFJ6SHKBcfDWIOvDQA==
X-CSE-MsgGUID: hUpUowiBTaO050/7ip4T+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67927102"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67927102"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 07:33:18 -0800
X-CSE-ConnectionGUID: brZiGx0dR+a+jXcXv9UsPA==
X-CSE-MsgGUID: aLDA4JmJQ9iVHk5hQf+HxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203569345"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Dec 2025 07:33:16 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyxG-000000004kp-1MTx;
	Sat, 20 Dec 2025 15:33:14 +0000
Date: Sat, 20 Dec 2025 23:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v12 2/2] iio: magnetometer: Add mmc5633 sensor
Message-ID: <202512202355.0fawsSmn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/iio/magnetometer/mmc5633.c:583:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251215-i3c_ddr-v12-2-1ae31225b4d9@nxp.com>
References: <20251215-i3c_ddr-v12-2-1ae31225b4d9@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Alexandre Belloni <alexandre.belloni@bootlin.com>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Jonathan Cameron <jic23@kernel.org>
TO: David Lechner <dlechner@baylibre.com>
TO: "Nuno Sá" <nuno.sa@analog.com>
TO: Andy Shevchenko <andy@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: linux-i3c@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-iio@vger.kernel.org
CC: joshua.yeong@starfivetech.com
CC: devicetree@vger.kernel.org
CC: linux@roeck-us.net
CC: Frank Li <Frank.Li@nxp.com>
CC: Carlos Song <carlos.song@nxp.com>
CC: Adrian Fluturel <fluturel.adrian@gmail.com>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/dt-bindings-trivial-devices-add-MEMSIC-3-axis-magnetometer/20251216-010451
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251215-i3c_ddr-v12-2-1ae31225b4d9%40nxp.com
patch subject: [PATCH v12 2/2] iio: magnetometer: Add mmc5633 sensor
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: sparc64-randconfig-r122-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202355.0fawsSmn-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202355.0fawsSmn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512202355.0fawsSmn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/iio/magnetometer/mmc5633.c:583:1: sparse: sparse: bad integer constant expression
   drivers/iio/magnetometer/mmc5633.c:583:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/magnetometer/mmc5633.c:584:1: sparse: sparse: bad integer constant expression
   drivers/iio/magnetometer/mmc5633.c:584:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/magnetometer/mmc5633.c:585:1: sparse: sparse: bad integer constant expression
   drivers/iio/magnetometer/mmc5633.c:585:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/magnetometer/mmc5633.c:585:1: sparse: sparse: bad integer constant expression
   drivers/iio/magnetometer/mmc5633.c:585:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +583 drivers/iio/magnetometer/mmc5633.c

8b0eee16ad53ab Frank Li 2025-12-15  582  
8b0eee16ad53ab Frank Li 2025-12-15 @583  MODULE_AUTHOR("Frank Li <Frank.li@nxp.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
