Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC0C3596E5
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 12:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763555087; cv=none; b=bY95AwFgGMt3nUASMgrt5tkfil3w62bxxef8S33vKSbofi3oYDqMft6S+K5F8Yk7n1wBPGO760vhEUggqxecqYhuK2m4Dctvp8UQhjIc1T8PvIcia4BjW37GN/imnOEKMi0YTITkszL5sTu7V5h1nOqufJeto+/UKCs+GuAtBwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763555087; c=relaxed/simple;
	bh=A60E9LnPxiFCBGrz2sYvypCWIWgmac0vjPHWX/QpqzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RaruLyfPuRQkV2h7v9zRfqdZxtnwN5NaINRjjcamuBh12OElABgzuCoYy1Gj6Ib6d+FHqdKo0l05/CkQy0Nad+z1fBQ5zmJlckAhCfuQiDdkiQy7tNswNo+NmELJEX/JHpNDdmwujpVdfDinfiYiNYfd9pY3/IRFTQ1rWdQhwHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZqgBTmTZ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZqgBTmTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763555086; x=1795091086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A60E9LnPxiFCBGrz2sYvypCWIWgmac0vjPHWX/QpqzU=;
  b=ZqgBTmTZUbrSXPPojQEkyFGaVgz/xwnMdERI0cmz6Fct6P6H5g7MBwCv
   ouaTzO32dBVttDEDs0OvpHRBduEXfK7dVMRr8X0K46MbCqzTfTEJCm7vl
   sFE7h4mwYDIwmgOxevvlVWpQzFKhtJU1BYTln8bYgGhd049B8SVZb7bVl
   A4fVux1aGQQZEfeB+tqBvx9oKsYYT6kKgixA9+qqpE6NN0uOpCW5nGLma
   YbK/enOU4oXdbYolZkC42g1dB6qyL0cWL9fiskXHYtKH6wpKp4N5CrD8Q
   +XNqUiO+7luY+2Jcx8INdrPN4nBSXAZT962CBvH1AXARmHqaJDsptAdoB
   A==;
X-CSE-ConnectionGUID: ZxmxbH9xSN+Dp0XiIzC2Lw==
X-CSE-MsgGUID: ktqTSg1RQ+Cy8ha+9pLz4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65750161"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65750161"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 04:24:46 -0800
X-CSE-ConnectionGUID: vooE1pTsS/62nQ3gO4zfSg==
X-CSE-MsgGUID: fx4QTSSaQXGsnjO1nHCR6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="228383564"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Nov 2025 04:24:45 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLhEo-0002s9-0n;
	Wed, 19 Nov 2025 12:24:42 +0000
Date: Wed, 19 Nov 2025 20:23:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/f2fs/extent_cache.o: warning: objtool:
 __update_extent_tree_range+0x2ac: unreachable instruction
Message-ID: <202511192046.1ZrJUpzE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chao Yu <chao@kernel.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: wangzijie <wangzijie1@honor.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8b690556d8fe074b4f9835075050fba3fb180e93
commit: 45b70947a425fa121a8b9bcbb77472d9e35def6a f2fs: add sanity check on ei.len in __update_extent_tree_range()
date:   7 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 weeks ago
config: loongarch-randconfig-r071-20251118 (https://download.01.org/0day-ci/archive/20251119/202511192046.1ZrJUpzE-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511192046.1ZrJUpzE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511192046.1ZrJUpzE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/f2fs/extent_cache.o: warning: objtool: __update_extent_tree_range+0x2ac: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
