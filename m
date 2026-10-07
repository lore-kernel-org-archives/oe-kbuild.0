Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2023392C46
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Oct 2026 22:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791410861; cv=none; b=IiV58WOAdHNErQAaTX/4mDw0e9igL69rJpNqQqMxHqiI8Mn4GUTLwHjRsbRvi3dDgRvHXaTRoA1n1JwMTnyLnWKI1jISKkBQdwU3pb0CdJ3na93nk1o+57zValOSIN64pm2L2L86nFdxhf4VzpiY3yhMHF4pxAChEiJA1eChUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791410861; c=relaxed/simple;
	bh=vSR2YnlWtRIJ+YlO4nZQoNWvR6hSI/qmhm6Q5vvu8uI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A2M74fKC7s4QLmCV6GCWFOYrQgkFqfDLaGybJaJiOaPBIv5n4RrypAB20HzHaZouPmStShn1KNcjXI83RQVuD3VZzVRvM+BvSlyuqaeLWL3KU0dV28FLh2NTBx20LsnFkdE7TKqIYT9q7fCrW+fYISD4tWKJCxb2yAQmaOn/xA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LrEQ28RN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LrEQ28RN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791410859; x=1822946859;
  h=date:from:to:cc:subject:message-id;
  bh=vSR2YnlWtRIJ+YlO4nZQoNWvR6hSI/qmhm6Q5vvu8uI=;
  b=LrEQ28RNxrOUprPQSyr1CI6WAgNhmdazngrGgW6KsfV4T9HKoJfbffbb
   7OY3mE/n7Y5IYfdfvbs3pM6iWmos7lKMvw8wT0Exk3aJ807697HxKFXep
   YL61gg5XKnU4ckon/MReeIM1EvLeXj67Nn/SMsJEa3u6Jb6jwpzH185mj
   rbMZWbD/F4AHmf84mNDJ+c8lXjCuLGrTqsgR/pMbbsHGe3wvOkMGu70De
   qtedJogazEP2mNNLbmT4FHmh20TSQQmxhCG62htyJnSLznEcE5Pf/du41
   T2kJQSlJSBY+oInfng8Cs8345OvL5RoW1EOC9heWDuSgQJ544eT0n3eTY
   A==;
X-CSE-ConnectionGUID: L/vi/bhLSuebRVGFIng0CQ==
X-CSE-MsgGUID: WWKizCwMRTOdHa1Bd6omPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="66426"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="66426"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 15:07:38 -0700
X-CSE-ConnectionGUID: e8Tzpi3sSx244D+fNI1GvQ==
X-CSE-MsgGUID: GBZiJLWiRX+SQj9WKU3MSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="277687862"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 07 Oct 2026 15:07:37 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEZnT-00000000491-0Kva;
	Wed, 07 Oct 2026 22:07:35 +0000
Date: Thu, 08 Oct 2026 00:06:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/locks.o: warning: objtool: locks_get_lock_context+0x154:
 unreachable instruction
Message-ID: <202610072303.hoXVt4mS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mateusz Guzik <mjguzik@gmail.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Jeff Layton <jlayton@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b63ef2d55f24519e7e9e5f4d15dbea03f126e40
commit: 887e97745ec336c2f49b6c0af3c4cc00a5df3211 fs: track the inode having file locks with a flag in ->i_opflags
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r2105-20261007 (https://download.01.org/0day-ci/archive/20261007/202610072303.hoXVt4mS-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072303.hoXVt4mS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 887e97745ec3 ("fs: track the inode having file locks with a flag in ->i_opflags")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610072303.hoXVt4mS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/locks.o: warning: objtool: locks_get_lock_context+0x154: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
