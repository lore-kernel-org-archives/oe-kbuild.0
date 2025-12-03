Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FF72B9BA
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Dec 2025 03:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764730895; cv=none; b=sC4I8lbqPie7THzjPMKKWXqeuuZ1dWGkMo1hsFbfWPJP4LOdzG4iVwb4RkEI0ukLRk9pUmsotSlW5HOwVudn0Tvcr2Uuki6wEA+kN/zKN3syk5MWc8YhRCwug+Cb5UX/AK3Cxw7VZKykAOgkVQGXdBOXS1Jtp0SJhgiDXh+x81I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764730895; c=relaxed/simple;
	bh=hGOxV9lBFeUQTlv4n23f4/eknSIcjm0KCC/x6kAlyGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r0hg+gkBJ7/xUUMydVh6i6rP5Q31Z9DAkXZ9uPopXr/HDfSwuOSLOcDoqc1K0q/dThjl3bIqTYbpaUR5zBAm+zk4YMXxdFm77/wL+GHrvkfzPaJh7e9C+wRagOZ3ybQkG1s4VVlFq9BUGVhoMo6acz/34qOKXyZ6MMqTmcjKQB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEsSjvzW; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEsSjvzW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764730894; x=1796266894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hGOxV9lBFeUQTlv4n23f4/eknSIcjm0KCC/x6kAlyGE=;
  b=aEsSjvzWlZZzojGeZ1pZviUw9usgH/WirfA+2+8D4WshPX0LxbygusdN
   POxgWGciym1jZd6wnCr5HgRf6dF5wcLtbujHmqSo6wBcixwoF01wAYilr
   pSde96BYJub2xXJg1Qz2yJiRxYMWLJJBIA09VUByK5OuF+jF4hpftMEMq
   rIY7omPMhBPhkxKhPYrhLg5rwAj6mfXV6v68Ec8YCZdBCMbKayxkiUSbF
   SRm1ed9jQSavzPKScDPSrP+3/hZ+rfKoRU/4/tbXwrOoH7eNB9yI0wElr
   o4oAGCEDy51sTiHTajxyIAcUkzI39QTu/kvMA/gtKA7IQpjB9SAbkBz2b
   Q==;
X-CSE-ConnectionGUID: wtBqtuwzSAGqR0B+al362A==
X-CSE-MsgGUID: DKeUNMeWQtiUUc0KKaScUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66437913"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="66437913"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 19:01:32 -0800
X-CSE-ConnectionGUID: 4ttsJLZJT96XNogjJF816Q==
X-CSE-MsgGUID: V9kkrUKgR76iCWOpJf3mUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194780622"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Dec 2025 19:01:07 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQd73-00000000ATl-26sQ;
	Wed, 03 Dec 2025 03:01:05 +0000
Date: Wed, 3 Dec 2025 11:00:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12114/13055] luo_test_utils.c:10:10: fatal error:
 stdio.h: No such file or directory
Message-ID: <202512031038.YRJMfnW5-lkp@intel.com>
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
CC: Zhu Yanjun <yanjun.zhu@linux.dev>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47b7b5e32bb7264b51b89186043e1ada4090b558
commit: a003bdb9ec4e12c869b9c8641dd9bebf90ac0389 [12114/13055] selftests/liveupdate: add simple kexec-based selftest for LUO
:::::: branch date: 21 hours ago
:::::: commit date: 5 days ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251203/202512031038.YRJMfnW5-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031038.YRJMfnW5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512031038.YRJMfnW5-lkp@intel.com/

Note: the linux-next/master HEAD 47b7b5e32bb7264b51b89186043e1ada4090b558 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> luo_test_utils.c:10:10: fatal error: stdio.h: No such file or directory
      10 | #include <stdio.h>
         |          ^~~~~~~~~
   compilation terminated.
--
   In file included from luo_kexec_simple.c:11:
>> luo_test_utils.h:13:10: fatal error: errno.h: No such file or directory
      13 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
