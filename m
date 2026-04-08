Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B916E349AFF
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Apr 2026 16:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775666689; cv=none; b=JI0Hmlyy/XUaj64gtQG+om4FUL5JyWjrdHhjVUYsdNpQdjZO6A2WkfHjoHPnxecED3TDdt3JF32DY3X3ZX527lHK+d58KGo+b86Sp7+iVqqUmsoL6+VCKq4rcZlHBaO/U1gg2TdnyOhKEWyItZXwsTxPN5gRhd+oeNoLIE3wWmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775666689; c=relaxed/simple;
	bh=UbBbuuFxLFyNVgOFv54mhlBPqX1kE4ls8iUOFJflcWo=;
	h=Date:From:To:Subject:Message-ID; b=lpdx5228e+XwKObm4GDDAIjEsXBO+82d0t8NfRfJ/HCnJ2r0wKn9raXFT37EbM+D/lzuWw0jHb+tPrI2W2wr2cmsCrlBY0S1Ph7j3oatvE1OUr236qbFIHyt14xU7kKy3FRXyH+OgR5lLkTNxRHrkifoNbOqtw3y2S2A8hNZ4/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F4BvbNXC; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F4BvbNXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775666688; x=1807202688;
  h=date:from:to:subject:message-id;
  bh=UbBbuuFxLFyNVgOFv54mhlBPqX1kE4ls8iUOFJflcWo=;
  b=F4BvbNXCjk11GAHVQceiU0J1HVBMJDeq1cHA9yYGr9Jn1ZE79bsCsDqB
   G4M8HgbY6ublxoIabDWDvI9n3nL3RlhLntYeugVGQVNX9D/RGForVUGvJ
   PRuig1Qbt3H74ZD5Jne2CxIA7l3rjE8w6ZwrPjBZPbXN1BwKjtgAYvCI3
   cZgODahhtcOHWcgor+x/LjiRcX/cLjZALETMW6sOb9ExrNcUjYW3xzpHi
   2q1bHNLnYhHchsBfnB9fQhf/Uqt+4b3TIuW6Goxunf2bH0pUULw6YY1kK
   CaAdvPBZqAXVFkBpAUF6OkXmxztikQKhRLjHL0/AEJbZzL2zQvBD1zIiR
   A==;
X-CSE-ConnectionGUID: hsuKM7sERpqX6zPT/JymmA==
X-CSE-MsgGUID: Q6MUHip6Qv+vPQshuSSPIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="94044125"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="94044125"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 09:44:48 -0700
X-CSE-ConnectionGUID: rMNhgw0rT9mSRNztFwJ02g==
X-CSE-MsgGUID: mOH9H/tyTXqCiDGuAadrUA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 08 Apr 2026 09:44:47 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAW1F-00000000ATp-1QsC
	for oe-kbuild@lists.linux.dev;
	Wed, 08 Apr 2026 16:44:45 +0000
Date: Wed, 08 Apr 2026 18:43:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tip:timers/urgent 2/2] checkpatch: WARNING:MINMAX: min()
 should probably be min_t(int64_t, delta, dev->max_delta_ns)
Message-ID: <202604081844.Y6QwnNQb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
head:   1c2eabb8805d9fd79a19de5c76d4a64c9ad3cdf4
commit: 1c2eabb8805d9fd79a19de5c76d4a64c9ad3cdf4 [2/2] clockevents: Prevent timer interrupt starvation
:::::: branch date: 89 minutes ago
:::::: commit date: 89 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260408/202604081844.Y6QwnNQb-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(int64_t, delta, dev->max_delta_ns)
#103: FILE: kernel/time/clockevents.c:333:
+		delta = min(delta, (int64_t) dev->max_delta_ns);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
