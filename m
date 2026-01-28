Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9475D36BCCF
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 15:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769613656; cv=none; b=JA8FRANC4VPkLxKMYBqYnlwCLtrSLW42lLAnyCbdT6L/ebpxYEC3lain26KASLAbAUFrn7gXFeJvTZUazFS7XiARV9KqwhJxOGUANoGQh9cAhuxPcGShHmv1IVbvp1x5bqSBDkwhh/C900vk7J9POiEyRg3OfI/EijlJWfj1aSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769613656; c=relaxed/simple;
	bh=Wwrky0yeC8Wm9yGxZiMby7BlS0/7gAMMh/4lcRNg0po=;
	h=Date:From:To:Subject:Message-ID; b=CelrOqcYxila0lAdVNi9rMCJ1l/P9GZ9n8Vsis7JVsx+EOJ6HdjO9+U972y8HDxwW0SZ8UCqPKA7Oa5mP8VRvSt8kDD6SI3ItsZfVtMYanLb5sWudDMUVbU+crI9N36BIXEQiuWIF6vvP8Jk0ULggPnYBYfRYR42tnOZpT+ouCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMCPuEcz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMCPuEcz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769613652; x=1801149652;
  h=date:from:to:subject:message-id;
  bh=Wwrky0yeC8Wm9yGxZiMby7BlS0/7gAMMh/4lcRNg0po=;
  b=nMCPuEcz7GmozoIBaZ3zk78hNUayYfSQ1517dLAl96ITCXcYmkFupvaF
   9r29bYwwnTKgdBkrznhYSFnlX4nH/csFDZu7Vnx2cRJaks38yEBvoAsNI
   k/JjZZmh9nA+xyLbGIO8/mCwtzz2pSlFtDEiOc5G5fEr+wjyIadytgeik
   MqCjtsfwVKx+i1grGn4BrcE9134idTTi9UqECcYjz06cMjJ3p0s0PwhcP
   3ttUHDQnXKKLN3+5UlDB7xo1liIwZDJYtysr7svs9EoIwJ0HawbPHZntV
   /norjEuHjzvlFRjmbnTgW9f5PveVYqXMZ3iasMOpl5lJht6mNPYg/oIxF
   A==;
X-CSE-ConnectionGUID: X5+i8JMHT7O/6DyFSYCLCw==
X-CSE-MsgGUID: z0UAdBumQfCsuf+9ORWuTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70724072"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="70724072"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 07:20:48 -0800
X-CSE-ConnectionGUID: LX+uUo71SwuXoDCSM7CawQ==
X-CSE-MsgGUID: EK/ZBkCMRiWuVjubPAuiaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="213263998"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 28 Jan 2026 07:20:47 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl7LY-0000000024r-3lFm
	for oe-kbuild@lists.linux.dev;
	Wed, 28 Jan 2026 15:20:44 +0000
Date: Wed, 28 Jan 2026 16:19:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [pdx86-platform-drivers-x86:review-ilpo-fixes 51/51]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'in'
Message-ID: <202601281632.wc3aNMeE-lkp@intel.com>
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
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-fixes
head:   fe747d7112283f47169e9c16e751179a9b38611e
commit: fe747d7112283f47169e9c16e751179a9b38611e [51/51] platform/x86: classmate-laptop: Add missing NULL pointer checks
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260128/202601281632.wc3aNMeE-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'in'
#18: 
call in in cmpc_accel_sensitivity_store_v4() returns NULL which

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
