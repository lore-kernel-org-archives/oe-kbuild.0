Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795241593;
	b=ifxb5T3ziMX6Me3UT23hP7TIagIY2uNtonRmkrSGaOAoEWc7xVsbMlcFatGP+oknIX8R
	 6+yk9hq2xV/lkO9V4kAelV5aQeC3rxxBbCI5jpmxbN6EPN/oashcf6Aev3J1mWB3qAdTN
	 LWwdYr8xrYmFnBQf6fwtPAMz6pX//gY/h29SudoZFuHiJOnamI4TLVaV8r/ix2Rusc0ES
	 3EbkN28FfGOyHlbyh4EfTnPsqdb27hGcMkuEAZTyzJMtlH3iB2J/i8slxM1XTmC73fVvv
	 egC9deirzBQ8YAwLrEW0avT5TkVN0JFCEnzjujiFS6WMszl+qRdWf8oYiqmNJn3kQVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795241593;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Vy03bDrMhyy+HHt3VMZCK+gj1gR+fhN0otYPqrXw2tY=;
	b=T9dSzV5QeHNOssupbiyhLHhfnk/IFTrXbL18r9v/vHwjeb9BjPEiQZ4WFQRsR5TBNh5N
	 14bcIZJZiQBiixF5YZHbk2dT0BVQsUFy5S4VlgX2VJ3rLHIGWqEhKd8np822wbHS2fPzO
	 LYRCoDKOvrgZIlQ+g+cI9/LKyajU2SHVEg/h4lvdcva98uYlryT11cIWrqUrlemJdOXnV
	 oC8Phij3jWu+HIgzl5qSibGC1dmO3B33uelGPl4YDyDEZ8I7RSl1x+P7SKItzKe2fv4B9
	 JFPnDgvpb4HmblAYPuPeDzFI0spbTGJdHd83ESFoG4v0rpQhCj1tSwp/QDVdzLJ2OnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bKIsT6fk;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E68E606A331
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 06:13:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E68E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=bKIsT6fk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795241591; x=1826777591;
  h=date:from:to:cc:subject:message-id;
  bh=Iqvuq5Cejom5lUkRj+pSoa/BjpjFjCTe3+PmWgfG9NI=;
  b=bKIsT6fksZohU9lzW87vNDZ1L2W24HHP6pV4Luv2SBj3SIb0tVDM6876
   UHnSeiMKMKvnda3ITTeNwooaupsbW9prDYPOh0QKRXcOHtaUcM0hcU4rR
   kPj/pgpQqzIG96jEAkWgR3fFn6NsDOwlFUftL13gLGRNIPxcXsZYBHAcS
   ZxRE+9KgKvLsLXACNTSpkvbF5mXQVDyvcTYsHokUkeLedJcGDz70vHlFd
   g7EFbqlyf2PrIXep7VugtdtNqzgbMpPfjXarVjCkIkFrV+LI7FNvCLpFa
   nFPwJ5Y6FL1gZXLWcogsC8RvA8A1UN+OxegVK/F13TzBfYQeQGckB4Sxq
   A==;
X-CSE-ConnectionGUID: CBXRZb/URHe2THyznq+ZBA==
X-CSE-MsgGUID: kA49hCcQTFet9jyitob2Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4005363"
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="4005363"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 22:13:10 -0800
X-CSE-ConnectionGUID: 7KBBByJrQRaMk9RE9oTMXw==
X-CSE-MsgGUID: A7e0ImvuRIqhwf0njiPLNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,224,1787036400"; 
   d="scan'208";a="10805638"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 20 Nov 2026 22:13:09 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUeLT-000000004FN-1ycj;
	Sat, 21 Nov 2026 06:13:07 +0000
Date: Sat, 21 Nov 2026 07:12:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cixtech-mainline:cix/dt 2/2]
 arch/arm64/boot/dts/cix/sky1-orion-o6.dtb: /soc@0/phy@1414c000: failed to
 match any schema with compatible: ['cix,sky1-dp-phy']
Message-ID: <20261121070442.7PO7RoO9-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Luo Liu <Luo.Liu@cixtech.com>
CC: Gary Yang <gary.yang@cixtech.com>

tree:   https://github.com/cixtech/linux-mainline cix/dt
head:   2e0b451c1659139f5daf7780beabc1d7748696f8
commit: 2e0b451c1659139f5daf7780beabc1d7748696f8 [2/2] arm64: dts: cix: Add Sky1 DP PHY node
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261121/20261121070442.7PO7RoO9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121070442.7PO7RoO9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121070442.7PO7RoO9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/cix/sky1-orion-o6.dtb: /soc@0/phy@1414c000: failed to match any schema with compatible: ['cix,sky1-dp-phy']
--
>> arch/arm64/boot/dts/cix/sky1-xcp.dtb: /soc@0/phy@1414c000: failed to match any schema with compatible: ['cix,sky1-dp-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
