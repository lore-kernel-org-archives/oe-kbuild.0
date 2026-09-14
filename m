Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C1F416878
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 09:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789376942; cv=none; b=FFDhf4nrnoT5mprAggNf42Gvi8QkC56MTJzGzWRCvDO7XFfLXZq3CiMIHeMqjErCiEkEz5Kcy2Yb+M0+6JdLqd7xBRz5bTXL/xtQrSc/WzFsAvZKUm+YI4z7cyQwRAalkm0Fn/uMUQJw/Fq3r8thqoYf/hmTj6cPpDcwqLSRHi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789376942; c=relaxed/simple;
	bh=t8PRw62W/R8n/vyj1LrtB78BDMI4BkkwvcK7FioPYzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uop20dLF0HsEQDBS09u1VP+jFVCdL1ONXuvoNp3W5Y3/AseJuK99l4TMrpUjPtnvNS9gFpqtrhvOVfcDOA4fYRHCq2XMw2iKIR/kOS4nQmEo+GYdBWNr0luNs74YVO9GLZnm26eYefghmTiOToFaRqLX0oA5m54E3zbiiJf4WIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5Zn9dMY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5Zn9dMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789376940; x=1820912940;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=t8PRw62W/R8n/vyj1LrtB78BDMI4BkkwvcK7FioPYzw=;
  b=Q5Zn9dMY+0/45XyEevda42fKJcu5aDlp+ojunghVtJWPjndiIe2EFr95
   VF4pUQ+pGD0O1punbWuszqDKD5v3N4oqMV+KDWqUni3PpcpoL520j+83s
   BtJLZIwVFkaTGktASBP3MF1eMfRGtbwI9S2xlIrluoR/D9qxnPiHjYity
   tG4P6kCK57Pveu8Iu0SQ1fng3zhWokJ0m8sTaExJV9J/yanItnEIMgCEl
   5yl8og72gTw65hie4pEWBEe6Q4mlxh2yQ8kNIB3zV9UoRdv99dW4e5ee3
   q7o2VAQ2Bon6evOV7txiRx/KOhl65nH3BKtLnqTB9xoREO2t7m7i7qDpa
   g==;
X-CSE-ConnectionGUID: SOARGoExQZCAAIdn81Na+A==
X-CSE-MsgGUID: 5/LZrTgUSleZvOpVMRMMuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="88667294"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="88667294"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 02:08:59 -0700
X-CSE-ConnectionGUID: t7sB5rtzQm2/Q4fKTFtFsg==
X-CSE-MsgGUID: Z3HLbStbQcKZsuRgWHHgTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="989739"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 14 Sep 2026 02:08:58 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x62gK-00000000083-1F7a;
	Mon, 14 Sep 2026 09:08:56 +0000
Date: Mon, 14 Sep 2026 11:08:19 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [stefandoesinger-zx297520:dlink 25/132]
 arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/spi@140a000: failed
 to match any schema with compatible: ['zte,zx29-spi']
Message-ID: <202609141009.5cQIRO0w-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Stefan D=C3=B6singer" <stefandoesinger@gmail.com>

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   ac919b52585145716ddb9d8154ca104ff2ea271b
commit: 4a5d36f608ba5459e4da4c800e5dc04be6c974fb [25/132] ARM: zte: Add som=
e notes about a (non-flash) SPI controller.
:::::: branch date: 11 days ago
:::::: commit date: 3 weeks ago
config: arm-randconfig-2054-20260909 (https://download.01.org/0day-ci/archi=
ve/20260914/202609141009.5cQIRO0w-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
dtschema: 2026.7.dev16+g39602f98e
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260914/202609141009.5cQIRO0w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609141009.5cQIRO0w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/zte/zx297520v3-dlink-dwr932m.dtb: /soc/spi@140a000: fa=
iled to match any schema with compatible: ['zte,zx29-spi']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
