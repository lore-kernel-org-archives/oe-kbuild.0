Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0637A1D5CFE
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Jul 2026 23:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785454368; cv=none; b=kP/Jra7Nq18zdmpMUlwD2Mw9owC7LbwM3gYVPFzH0UQvbaWWTtm2CgHflUYwiUXurBLa3UUVVrQueieEBIE2hZUuF/gkQ/3gsvCYdH4fXQ0nfM1D/CDSEjJUVoG3PvAgaNQf60RwPBH9ECfd4bDnWtOdhmnC5ZbOZCQREnC+iWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785454368; c=relaxed/simple;
	bh=izjyYS/37gStpMSUeFxwhhKlgTfsX5DP3E9FLWVCAQ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BGybRf7B/qI34qn2ov4cWkiyOlyot2tCmmb9CRD2y2LF+zJ1fZxlEnnhpcw8Lm6YRvVZBEE8pAopxDFWMJkx+tWdtjqKUL8DA7TVuv/ZiumYzZpBuf3alFu5WNxpdKm8+x7B1uEyjvWtkQgGpvc3ryNQNVr6t3c6mYO4EGRhR+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjabdObx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjabdObx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785454365; x=1816990365;
  h=date:from:to:cc:subject:message-id;
  bh=izjyYS/37gStpMSUeFxwhhKlgTfsX5DP3E9FLWVCAQ8=;
  b=TjabdObxIIm05OWZ9wqwJTypATBZHbZoxAHQGxWExnauAm8Ne0SLgY9m
   WfpuGuB3et3lQVd+CHlOKyJ8kTUh3TJQhGmiZflROrOs2NSpd2WV5KEVb
   GEHtVKf/3I9XsUbio0c/L/LmhWT8GB65EvnW6er8xYi0I0RRwnQsiEi8X
   F6LX5GIRP6tGx379BENrvQbZWE9DBpcMyJPMa/mCTVcgFsXyHbxudyYNG
   c8o7HpRqy6K0kP3y/TTx75ABBtAoeEPgLjhrbd/l5KczSEdw8iUApDAVg
   NQtjvEMolVbKzZ1OWKyWbVWBHdmZUQh34d0+a4IgFhgy9W80lMvtl/Ho8
   Q==;
X-CSE-ConnectionGUID: X7gtxlnaSi6H5Hjd46w8TQ==
X-CSE-MsgGUID: DW3msc3CTEWBUYDItAerwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86097879"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="86097879"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 16:32:44 -0700
X-CSE-ConnectionGUID: QdhiUcBgSmuFZnYpZJxkzA==
X-CSE-MsgGUID: 2j1seDKPTOaZ5/AzBuMcBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="261042320"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 Jul 2026 16:32:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpaEz-00000000hhZ-2cGo;
	Thu, 30 Jul 2026 23:32:41 +0000
Date: Fri, 31 Jul 2026 07:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: og0ve1b.c:undefined reference to `__aeabi_ldivmod'
Message-ID: <202607310715.iSRLdi9k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Wenmeng-Liu/dt-bindings-media-i2c-og0ve1b-Add-OmniVision-OG0VA1B-camera-sensor/20260730-165146, commit: 168839e90295cc189be153bc4a0a6d7f7362ff49"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>
CC: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

tree:   https://github.com/intel-lab-lkp/linux/commits/Wenmeng-Liu/dt-bindings-media-i2c-og0ve1b-Add-OmniVision-OG0VA1B-camera-sensor/20260730-165146
head:   1a0c84403aa373a1df3a42ef86d07a881f24e9ca
commit: 168839e90295cc189be153bc4a0a6d7f7362ff49 media: i2c: og0ve1b: Introduce per-sensor data structure
date:   14 hours ago
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: arm-randconfig-002-20260730 (https://download.01.org/0day-ci/archive/20260731/202607310715.iSRLdi9k-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310715.iSRLdi9k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607310715.iSRLdi9k-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/media/i2c/og0ve1b.o: in function `og0ve1b_init_controls':
>> og0ve1b.c:(.text+0x404): undefined reference to `__aeabi_ldivmod'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
