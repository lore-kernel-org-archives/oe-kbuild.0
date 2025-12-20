Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDCE2D0C82
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 14:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766242756; cv=none; b=gg0e3m2j9SAN6pADcvS+x9l2S5CxUMlAo5uE5/cSMGIKmEo5YT2lBYXpVTXF48wq2vsnWg7RI5P6BCcyNQrug7J4H9K/1i8E10Tn5fqbeTtSigEmzEXX+fa02Gbnqse7pLXWD2C3jMGKUtTJ/NAxGclSgTEANKIwe1jXgwAuGtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766242756; c=relaxed/simple;
	bh=r+jWuFei9IaRJVrtHLQJhMtCIrIT7RnIMTIxJpQ6zHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HdhRXYxTcIvmP/Amr1IHGEucO7H3ThFlT0CK89fkg10wtmWXY9e9/y4v3F1Z/jlXuw/BeEbfciqREk9O34gbQVSAWbTCxIW9jsDF49h9nT/gFFP9w4LT7S+4JOu6JwMgELr0/596KKx6wtWnEr1tQ4j7fQhoXuxMyXTr8+OPNaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TbSBXRur; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TbSBXRur"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766242755; x=1797778755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r+jWuFei9IaRJVrtHLQJhMtCIrIT7RnIMTIxJpQ6zHQ=;
  b=TbSBXRur/N5CiAHlNBY28t8HLQk4R0f0FMjhKNioGSkasJiiemSf9Qex
   qUgVZan1yRl81JczZNZkU3zcbLP5smt3H89Z25Ruott271kOlMn28fiX4
   TonzwMOtuP4I1tdIuZQpwC3YgdVQvWfTnPb1Lbd9uwPWFR9dMPUd0Fiof
   MBCMB58khT8wVOkqJwN3SknMq6yAcoeJqH/CvQw2qFqlGHDPidgFBXj1A
   Fanc/eTomct1jf2BUBVuh7PwRpUeANQVxrkDNYbq2wSd8QxDFK09uVYT4
   I0kuBAqCB+cmi1VMINYwMVhBvjR4ch+MwNQk59QSvjbrz03tl6+Hs/2tM
   w==;
X-CSE-ConnectionGUID: xE/YWygvTyK6h2L3ay0bCw==
X-CSE-MsgGUID: l7vp9MEMTpiBaNbNIxG0bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78493909"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78493909"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:59:13 -0800
X-CSE-ConnectionGUID: h82jNZICQOS4ewfk8ZuQqg==
X-CSE-MsgGUID: 4vSgD9KwSkK8u+W+gF/sFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203639810"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Dec 2025 06:59:12 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyQG-000000004hJ-3lXe;
	Sat, 20 Dec 2025 14:59:08 +0000
Date: Sat, 20 Dec 2025 22:59:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 3/5] hwmon: (altr-hwmon): Add initial support for
 SoCFPGA
Message-ID: <202512202238.4Ew9j5DG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hwmon/altr-hwmon.c:425:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251216064926.15817-4-muhammadamirulasyraf.mohamadjamian@altera.com>
References: <20251216064926.15817-4-muhammadamirulasyraf.mohamadjamian@altera.com>
TO: muhammadamirulasyraf.mohamadjamian@altera.com
TO: Guenter Roeck <linux@roeck-us.net>
TO: linux-hwmon@vger.kernel.org
TO: Dinh Nguyen <dinguyen@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: Ang Tien Sung <tien.sung.ang@altera.com>
TO: Khairul Anuar Romli <khairul.anuar.romli@altera.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on c6bb982894b51c0ebaf94bbeb55ccbd1d4145a22]

url:    https://github.com/intel-lab-lkp/linux/commits/muhammadamirulasyraf-mohamadjamian-altera-com/dt-bindings-hwmon-add-altr-socfpga-hwmon-yaml-binding/20251216-145542
base:   c6bb982894b51c0ebaf94bbeb55ccbd1d4145a22
patch link:    https://lore.kernel.org/r/20251216064926.15817-4-muhammadamirulasyraf.mohamadjamian%40altera.com
patch subject: [PATCH v1 3/5] hwmon: (altr-hwmon): Add initial support for SoCFPGA
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r133-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202238.4Ew9j5DG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202238.4Ew9j5DG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512202238.4Ew9j5DG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hwmon/altr-hwmon.c:425:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/altr-hwmon.c:425:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hwmon/altr-hwmon.c:426:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/altr-hwmon.c:426:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hwmon/altr-hwmon.c:427:1: sparse: sparse: bad integer constant expression
   drivers/hwmon/altr-hwmon.c:427:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +425 drivers/hwmon/altr-hwmon.c

5877755fe075fa Muhammad Amirul Asyraf Mohamad Jamian 2025-12-15  424  
5877755fe075fa Muhammad Amirul Asyraf Mohamad Jamian 2025-12-15 @425  MODULE_AUTHOR("Altera Corporation");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
