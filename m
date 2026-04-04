Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACE524466C
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Apr 2026 17:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775323799; cv=none; b=EDwltWnvcOLUyqFABsczXnJGpZp9ieW+zND0S39ryglMZURyhHxlNs43zjRV4TlLAKzUYLMjaE8k0wWN6JfYMX6wxyeMm6a1liluSCuieTuAZJkId5LzolY2kGgxKRXEVgnBQUKjP0eluuSfyRAdn8WoRs+vNhQEFGyagsiDH0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775323799; c=relaxed/simple;
	bh=XcIWd9M+WAZNifZh7Hxgej5xwpnV/3xkOn9gNZpABtE=;
	h=Date:From:To:Subject:Message-ID; b=qdTRAoqrlgTrZ/X3o9j7c0qKQ+3zO6DOMm67z6FJ9RUVo4KGvShXCZD0sFRoJbQ7dbfFHZZ3MIQvq+Rh76p1hRr1H/y4NC56luslmJAyP8XvbdR+CeCUVOUaEOxI3RELphXr7wLkY6OV94kUbmE9EQFWqSGO3Z1jQ7NcEWrBUXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O8b9ZuVE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O8b9ZuVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775323797; x=1806859797;
  h=date:from:to:subject:message-id;
  bh=XcIWd9M+WAZNifZh7Hxgej5xwpnV/3xkOn9gNZpABtE=;
  b=O8b9ZuVE+q/8EkjK0/n6bHerTjBsj7Pb2hxdff9DPsd0h+9E8tTtY+g4
   Ku64jX7n9kZPWSsO2B9PoP5whL8a63o8YbWDddOnLwhNwz4Y2LfDrDaFF
   IpIVkF2luNHVoS5fScEfEuPaRS5dFlHus+YjqiVCx8ULoTmVHWFo19GVJ
   S2KDlW4wW8/IJ/1/SiTe7sk1hHYNPZTpt2UwQc2xOAMqcYbSuyHlDbJBk
   ziDs7qX7atKKvSmaj6WodUvzDoRxS3taDxddm+yiRO938ELGY4naPkWM6
   FIIuV2jJs1rMXDNRz8aPxgorIPgdPFdtRs24OKxiTgfq59nxveEogahSb
   g==;
X-CSE-ConnectionGUID: BOmNTsiTSma7ZwLPzA3/Xg==
X-CSE-MsgGUID: BOOhiY5YTgOaom5JNOjQnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11749"; a="79948176"
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="79948176"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 10:29:56 -0700
X-CSE-ConnectionGUID: DZgO8DTVSOi2JnAbQ8dLvA==
X-CSE-MsgGUID: kQTWUQxaTzmUp2T0LQjmOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,160,1770624000"; 
   d="scan'208";a="226516959"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 04 Apr 2026 10:29:56 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w94oj-000000009c1-2Oqc
	for oe-kbuild@lists.linux.dev;
	Sat, 04 Apr 2026 17:29:53 +0000
Date: Sat, 04 Apr 2026 19:29:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:timers/hrtimer 1/12] checkpatch: WARNING:MINMAX:
 min() should probably be min_t(int64_t, delta, dev->max_delta_ns)
Message-ID: <202604041943.O7Xp95oM-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/hrtimer
head:   6f59dda29da1be390b7328e8d9d82bb838f4fe20
commit: c6d0fcee8d9a361f9f19a94ef7fbc3a3596ff4ac [1/12] clockevents: Prevent timer interrupt starvation
:::::: branch date: 29 minutes ago
:::::: commit date: 29 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260404/202604041943.O7Xp95oM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(int64_t, delta, dev->max_delta_ns)
#152: FILE: kernel/time/clockevents.c:332:
+		delta = min(delta, (int64_t) dev->max_delta_ns);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
