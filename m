Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB38723D7CD
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 23:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766876866; cv=none; b=g1m4GwUeBueg6nJNaXC4PCdAmO+J40EWi/zF5+zLIw0863cKDjcocOq4PEh+B83wOwauxffY++CHMKZwytd0JfsO7C9V4Eq0ZGbhlX5TDsn9WA8bBCOX5yFzdjO41peyBK38dSwYxf+EsuZPWuWw1SHYwXWunVx6ruriPBXz7gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766876866; c=relaxed/simple;
	bh=686gXqzofrEtc+uV3n6TLgeOn98PdYXxq4RVz8ejVhQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mxAlmu7dbR8AQg77SZyKJ7Uj1E81N+2a5W84mqXbLRQdPAx4Trc86aOQ5OeO4rkFRseqo2KDzpcaKbiZsbFBfMM9t1+62C2izWLX07KUG5Rue4xSrDmzkYsTZxpjcTxaQLAuEm+pPHKL8UiWeix9FpUBIX6UeCBzG1QdUbQqg3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lX+3t3dY; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lX+3t3dY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766876864; x=1798412864;
  h=date:from:to:subject:message-id:mime-version;
  bh=686gXqzofrEtc+uV3n6TLgeOn98PdYXxq4RVz8ejVhQ=;
  b=lX+3t3dYlaToa061xV2cdprkF84zb8MhXACSzmgCEIGC5w2H+X6WTD6k
   3nWljpmDAYi6eg2t4867axu5NH/E5u4Jx8rudlf8YvbDq0J7IqZRQ2Hkn
   hw4g5fyyO/wSQ5KNNnSSIIo0EWFa3sZyzwHdvaQuOiCPvcCm7PFQfwIrS
   7LLl9Qb1lGLoP+oL9X1fOus8kaOwMcNVlgbyUSKelKJbVYe4uWnjGxp2l
   wFYYeLO2hpGyzOnk+s79QLCH7lgtEVw76qJF4vzAbB3W4VL19KkugoNWu
   vtFfwtb75UjL2DbYGltkHOJPj17GzuhHbVRbXOBCFqQh05g8Cedlm9qaa
   Q==;
X-CSE-ConnectionGUID: IYpv2gIpTpqfxIvz4w+zdQ==
X-CSE-MsgGUID: qwcP66MoSOS3ucM1vCJ2Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="72409035"
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="72409035"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 15:07:44 -0800
X-CSE-ConnectionGUID: T0VSyEQOSumOTTESASea6g==
X-CSE-MsgGUID: ri5jTOXCQzWOHATbNkTPoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="200527663"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 27 Dec 2025 15:07:43 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZdNt-000000007IS-2IYa
	for oe-kbuild@lists.linux.dev;
	Sat, 27 Dec 2025 23:07:41 +0000
Date: Sun, 28 Dec 2025 00:07:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [frederic-dynticks:timers/core 10/10] checkpatch: WARNING:MINMAX:
 min() should probably be min_t(u64, delta, kc->idle_irqtime)
Message-ID: <202512280030.XuHsBjiM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frederic Weisbecker <frederic@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   e2e8796db56999913bd1cf839e933af6e5d5b23e
commit: e2e8796db56999913bd1cf839e933af6e5d5b23e [10/10] sched/cputime: Handle idle irqtime gracefully
:::::: branch date: 35 minutes ago
:::::: commit date: 35 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251228/202512280030.XuHsBjiM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(u64, delta, kc->idle_irqtime)
#59: FILE: kernel/sched/cputime.c:422:
+	irqtime = min((u64)delta, kc->idle_irqtime);

WARNING:MINMAX: min() should probably be min_t(u64, delta, kc->idle_irqtime)
#141: FILE: kernel/sched/cputime.c:472:
+			delta -= min((u64)delta, kc->idle_irqtime);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
