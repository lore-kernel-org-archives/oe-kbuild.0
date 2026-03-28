Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C794033F5AF
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 19:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774727952; cv=none; b=s8XMTjDgr4jjHpWnpZfng7L84dr58x5hnYCifp1hLSTrXIeEB5BQALsMo7Iv0msK8AooS4/nzti6rpoNjhUCB3Ndi1Y5YX7GSzqr0Y5KQNmeM4WTKvXo09ofzfPR1ZH9Qa95N09wU9sRa1FJ6raMbp1g7bdL2vaZz5zRGctARM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774727952; c=relaxed/simple;
	bh=9IbAOemgRyICJZ+Gic0V+aM1CRl21RD0NiecbZJwmDo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C9P/Ihgy4lHjGZUXbEt3Zw37hf7NrSB6njYYN9U5NZq9CLQ4CC7y1TFmpzIkTAuMBQ7cwpu3SbhjMgvqilwwKe13xJQPl+8rYQ33Bi34Bm00QVoGuh4gByEAOUvsXii+bZH3Mqju2KfMa4oWadpKnbcFsn1FRwucfWmRxz6+h6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IJNLX1Cu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IJNLX1Cu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774727951; x=1806263951;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9IbAOemgRyICJZ+Gic0V+aM1CRl21RD0NiecbZJwmDo=;
  b=IJNLX1CuBqG4LQYENR6/lcdtuNvygkjBPIA/xiH4vfiku6GZLdkhOJ4V
   moW3wSREgmHyolq26uHF4iBd5w4VselIOtGh62HOTf9AvbWoKO8mAPdjr
   D16O6bhZ8E2of+2yG+ag50i9uBqlrZRX2kvfqaZuTTyc6g1EAboP4609c
   f38J03lEWhlK2ZyMz7l2SbvvSR3LJSvPPxD4x+WnDIgTmwgj8VAzaLgma
   raXKbPB33lD15wnubx4eV2uMw5vZeMhGCBEvZGqvCgNiQhvQb7sUiKTzN
   tcBy1XzDDp3HHKLnFAFneljwLKaf2XRz/GPeRHqzmc/guQHio40rsppmj
   A==;
X-CSE-ConnectionGUID: QqVQLl45Soq7Djkxf+GaAw==
X-CSE-MsgGUID: uAQdFzS1Ql6UPgWOV0TpfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75741420"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="75741420"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 12:59:08 -0700
X-CSE-ConnectionGUID: etNU1uoQRSyfindsbQZQoA==
X-CSE-MsgGUID: wNJVahd1QsmCiWYPWKYotA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="263569019"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Mar 2026 12:59:07 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6ZoG-000000007jJ-36Kr
	for oe-kbuild@lists.linux.dev;
	Sat, 28 Mar 2026 19:59:04 +0000
Date: Sat, 28 Mar 2026 20:58:25 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 15/20] drbd: rework request processing for DRBD 9
 multi-peer IO
Message-ID: <202603282036.R7U7mIhz-lkp@intel.com>
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
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260327223820.2244227-16-christoph.boehmwalder@linbit.com>
References: <20260327223820.2244227-16-christoph.boehmwalder@linbit.com>
TO: "Christoph Böhmwalder" <christoph.boehmwalder@linbit.com>
TO: Jens Axboe <axboe@kernel.dk>

Hi Christoph,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 67807fbaf12719fca46a622d759484652b79c7c3]

url:    https://github.com/intel-lab-lkp/linux/commits/Christoph-B-hmwalder/drbd-mark-as-BROKEN-during-DRBD-9-rework/20260328-153634
base:   67807fbaf12719fca46a622d759484652b79c7c3
patch link:    https://lore.kernel.org/r/20260327223820.2244227-16-christoph.boehmwalder%40linbit.com
patch subject: [PATCH 15/20] drbd: rework request processing for DRBD 9 multi-peer IO
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260328/202603282036.R7U7mIhz-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'ok'
#752: FILE: drivers/block/drbd/drbd_req.c:613:
+		/* any net ok ok local ok is good enough to complete this bio as OK */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
