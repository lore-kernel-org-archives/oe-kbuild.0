Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45A82DFA4A
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Aug 2026 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105541; cv=none; b=cTF4kZbK0gmXp91GvCrQzI6K/9APX3q3cLhyy75DoLreHVC2fEZA8b62nYs1f8fnDNLGl/3vsPv0ypYLcA2jkuJcpic8yJY3qrwRVsyCX26spuQwqhpG9GLO8AAY9GvEypgUbL95d0f5N1Lb+xyD5R5vUB11pPSIErw9Kmi5I1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105541; c=relaxed/simple;
	bh=iyOKEGh6AvnQmxYg9h1mWEvusUJEfo+KIZGundBI6rk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UnKS/fD4ZbtM+9+eCFUsIV37MeUIbTKdFUVe3gyXmB+MzC+31jsMXG22pdklZLL02eLBk0jWRd7LYuAOour+ULlZWPROYO33LVwOlfcBaRnI6IfUfQZ8f73CYLu5rqjrKJ8MZvZS14tVOTQoUljN6pqvibfm/F1NoDnhufjHxIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7iNaALM; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7iNaALM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788105540; x=1819641540;
  h=date:from:to:cc:subject:message-id;
  bh=iyOKEGh6AvnQmxYg9h1mWEvusUJEfo+KIZGundBI6rk=;
  b=E7iNaALMi35Pez/vyGwbw5wal6GL9SQ/9eCDaQcTnBgRQYaeXDPgmZKQ
   o2rJk7q5yWxT3btVTKvZNaKl1jd/r2ln9z5KJfUrDw4ygmbqSFETIq1M/
   cygL/ke7wPBKGxPEq7rTQhB3ozjxGSbHrup0PpQUInls2VJbKDTXOSqgg
   XVhL3UMcAE7HLjZ4yMsULGbWzitx4XsTjPWhGHPyOcrLkCLcTbsGgAq7p
   jvKX2cdVKg4TkNGXKDjC3YM35D4wQpXctnlJSkN4xUgXFqD03amxcmMOG
   uKk0+FEV+MwaBDuZ+2XRZ8rZtTWpAss9CHgrkcC7eyQn8UvLGFaZO82+j
   g==;
X-CSE-ConnectionGUID: woBUwQ9TTpyQPV+KoO8upQ==
X-CSE-MsgGUID: fkEDQw4mQbqHI1vteY7/7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99191825"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99191825"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 08:58:59 -0700
X-CSE-ConnectionGUID: +7tjJC2ASWWtH3u//QhSsA==
X-CSE-MsgGUID: lOopkCXZSCS5xS+4qETEwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="270522050"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 30 Aug 2026 08:58:57 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0hvr-0000000009v-2wBX;
	Sun, 30 Aug 2026 15:58:55 +0000
Date: Sun, 30 Aug 2026 17:58:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: nolibc-test.c:1543:15: error: implicit declaration of
 function 'sendfile'
Message-ID: <202608301704.LzKdiEDV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Palmer <daniel@thingy.jp>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Daniel-Palmer/tools-nolibc-Add-sendfile/20260828-193204
head:   89dfe1bb90b6b8ee0de6f320cc97fa18aff2d6f0
commit: 89dfe1bb90b6b8ee0de6f320cc97fa18aff2d6f0 selftests/nolibc: Add basic test for sendfile()
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260830/202608301704.LzKdiEDV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608301704.LzKdiEDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608301704.LzKdiEDV-lkp@intel.com/

All errors (new ones prefixed by >>):

   nolibc-test.c: In function 'test_sendfile':
>> nolibc-test.c:1543:15: error: implicit declaration of function 'sendfile' [-Wimplicit-function-declaration]
    1543 |         ret = sendfile(out_fd, in_fd, NULL, data_sz);
         |               ^~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
