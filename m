Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989B825B662
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 06:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763535434; cv=none; b=LvW8w6YJxaOE/sMn1MjKckyjDBcKpjyvzxRAYIbcUHqzp4DF8EsfQTEca17Aleb4Sj/6i+o07IO3yLVaKadEQImWbuE9pmePtb2mI1cd2SY1twvEnuKjITiDEoAoPz6iUvXA7Te7Y4ol5MMIR5DTbe15l3lzkFrLPeG2CoFNhp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763535434; c=relaxed/simple;
	bh=w/uyofQja43icv7O8+VdI5wkMLwYBv7M2jykq1Rqn0k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hLpS0IL+UtiLgJHTMZ0LJ6HQ4SHOcas2nWC7SAQyxZwY/S94B9ZpkOWQd62GxF9+JhIWiawNDfVh1HO3y0i1ORwuAH/XXRy2jYguYGQJp8d7pBhZ0xK4eRSHmhBrNzViC7Q0War5HIoVmjepBNtvM+SqMZa4FPJ/+PFGeL9cYVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+eH2VNl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+eH2VNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763535433; x=1795071433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w/uyofQja43icv7O8+VdI5wkMLwYBv7M2jykq1Rqn0k=;
  b=A+eH2VNlCOKYxp8N4O+iam+21sVTrOsGn8nHFI5ruM2vyVJtJK4BXHRZ
   tJ7HRyGZiuGRhDoVoiX8NLoDerIc7kMabOiK2qfAeWG53N6AuMA3ekvLy
   2zoBi9urqrvNGeHlB/i6sDoFuiOZk15/ymo+6JAnCL0VN588gbQhLUDOM
   hFGFHoq1/CyzTnQ+Iu+gBYvUJpe47M5kCnNwK+5oUy6DehFOa8DBNzdmo
   L1j4cc9iZvyDe+eKGlPI+Cp0Ff+9Cb/8uX1V+CHQga8/dhYrldSZp6EPG
   qef2SqQa89rs7oyXrvej9dfoqd9ZOC1H2DRNFup9md0LvaLgIlRRE2wMg
   A==;
X-CSE-ConnectionGUID: e+YwslkeQf2rqAeboimvSQ==
X-CSE-MsgGUID: IBr2nFetThGJBOiOt4Nz7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65508425"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65508425"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 22:57:11 -0800
X-CSE-ConnectionGUID: hIwFuC8tRGm+tVUEvkvYYA==
X-CSE-MsgGUID: Yr0cB2brSdSUR3ZbjPHxSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191416996"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 18 Nov 2025 22:57:10 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLc7n-0002YR-35;
	Wed, 19 Nov 2025 06:57:07 +0000
Date: Wed, 19 Nov 2025 14:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bytedance:6.6-velinux 6063/6063] mm/vmscan.c:201 (null)() warn:
 (struct ctl_table)->procname cannot be NULL. Expression :
 proactive_swappiness_table[1]->procname
Message-ID: <202511191426.jFzo6Oku-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: jason.zeng@intel.com

tree:   https://github.com/bytedance/kernel.git 6.6-velinux
head:   e2ef091eb40492c4e4e49d523f807d3c4621fe39
commit: 33ac4e8eeeb07a752a2e32dff0908075c1624af3 [6063/6063] bytedance: mm: add /proc knob for proactive swappiness
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-161-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191426.jFzo6Oku-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511191426.jFzo6Oku-lkp@intel.com/

smatch warnings:
mm/vmscan.c:201 (null)() warn: (struct ctl_table)->procname cannot be NULL. Expression : proactive_swappiness_table[1]->procname
mm/vmscan.c:201 (null)() warn: (struct ctl_table)->proc_handler cannot be NULL. Expression : proactive_swappiness_table[1]->proc_handler

vim +201 mm/vmscan.c

33ac4e8eeeb07a Zhongkun He 2025-07-07  200  
33ac4e8eeeb07a Zhongkun He 2025-07-07 @201  static struct ctl_table proactive_swappiness_table[] = {
33ac4e8eeeb07a Zhongkun He 2025-07-07  202  	{
33ac4e8eeeb07a Zhongkun He 2025-07-07  203  		.procname       = "swappiness_proactive",
33ac4e8eeeb07a Zhongkun He 2025-07-07  204  		.data           = &proactive_swappiness_enabled,
33ac4e8eeeb07a Zhongkun He 2025-07-07  205  		.maxlen         = sizeof(bool),
33ac4e8eeeb07a Zhongkun He 2025-07-07  206  		.mode           = 0644,
33ac4e8eeeb07a Zhongkun He 2025-07-07  207  		.proc_handler   = proc_dobool,
33ac4e8eeeb07a Zhongkun He 2025-07-07  208  	},
33ac4e8eeeb07a Zhongkun He 2025-07-07  209  	{}
33ac4e8eeeb07a Zhongkun He 2025-07-07  210  };
33ac4e8eeeb07a Zhongkun He 2025-07-07  211  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
