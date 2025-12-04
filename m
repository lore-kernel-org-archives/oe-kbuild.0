Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CAEEA59
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 00:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764807040; cv=none; b=N1dE7vkZFxHai1u+1q7HVascG/emieEAO8sLekqnhX0x5A8+VOZs9q+vQxIz02qDnI0QiKbVXm3wzCCiOwkxIsbLR/JXFDMUAf49z12KUu4wjRoLa0mD135bncODPvLJlHBmFlh7lmzTdg/SXZBgw5x0HeZ6+DDw0awwkyf6/qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764807040; c=relaxed/simple;
	bh=whILbnxD6RFxIBWxNK5OckLCLgYrkQ0O6JoS1CEtXiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=to9GCdh+oVhz6yFy8yWFIntZCgLsRrqhBBQ1IZm9PhvmOtfAIzAK72JAxdKK773KadfMdI4xasQYLi/9FMVPvuv3KdH3gSxQ4EBs/p203ZHLnmMrTNKqRNHttHpNQGDkS4Jfhcsto14sJrKtqs0kLpf8xWfvn4jzHYGBw871pSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDMZ4fOn; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDMZ4fOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764807039; x=1796343039;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=whILbnxD6RFxIBWxNK5OckLCLgYrkQ0O6JoS1CEtXiU=;
  b=kDMZ4fOnGj0XDu9QAW2OcDUKKNGiJykGFwoW29yhsXtACvr06uEqXfCS
   QQXsxO3EgBLbOGVMQUxMU/8xVtqsURYWwp/QyHIW5AVaTMpJCXZnhAvWX
   v0NkGN6IDybfm3Uhws3DrZcp8GYJ0C7cJU6prWGesa+lbfhGCcjM13Rod
   Eak8sLUc8ouoF9z4z69YJOnIFCWIR37fX9yUJK2b58MThn7Bc2Zh+6T/a
   BqjkZL2iybkje5PiJZovIBo9phUL0+mHepfdv8Xx32u8Er79SKz2BEBH0
   3oqMsnJ7TbfKcXaWM315/Bfg5e9fcnbx06jRkfl1R1dH/rgpXjKoxIxSM
   A==;
X-CSE-ConnectionGUID: N9vEI0OaQG6vnUBIGXAqsA==
X-CSE-MsgGUID: 00ZCpQTKQkSPlfM4KvPa8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84418780"
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="84418780"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 16:10:38 -0800
X-CSE-ConnectionGUID: ZW2A7e8FQemJ3DlhIIWtyw==
X-CSE-MsgGUID: EYjn/Q/LQo21iCddM+4vaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,247,1758610800"; 
   d="scan'208";a="194929058"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 03 Dec 2025 16:10:37 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQwvb-000000000ax-0MQe;
	Thu, 04 Dec 2025 00:10:35 +0000
Date: Thu, 4 Dec 2025 01:10:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12041/13147] liveupdate.c:21:10: fatal error:
 errno.h: No such file or directory
Message-ID: <202512040111.hIDiGHqK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Pratyush Yadav <pratyush@kernel.org>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b2c27842ba853508b0da00187a7508eb3a96c8f7
commit: 80bab43f6f235664fff2d3518b3901ba9c4ac5a3 [12041/13147] selftests/liveupdate: add userspace API selftests
:::::: branch date: 19 hours ago
:::::: commit date: 6 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251204/202512040111.hIDiGHqK-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251204/202512040111.hIDiGHqK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512040111.hIDiGHqK-lkp@intel.com/

Note: the linux-next/master HEAD b2c27842ba853508b0da00187a7508eb3a96c8f7 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> liveupdate.c:21:10: fatal error: errno.h: No such file or directory
      21 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
