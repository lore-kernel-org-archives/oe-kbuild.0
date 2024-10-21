Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584551E1027
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 23:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729553700; cv=none; b=FonDhAoPEX5OT5aVYyO/NPbo77bl63c21o4+oBX5yDKT/6aWxVfCtVRcFQojBG1DR+teXObkPAlLV0kA7wG4pxSiN3dc9Ih1RIQR1uJxS+4GuYWe9hcXkrZZUkQimcOcOc2MpRCoW/j7KCX4ebF6ohDH5YDzdKiqLDqCE8hA3/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729553700; c=relaxed/simple;
	bh=rT6S+q89Be7DqGfZUke/v4Dx+lZsxvYLlLqV5VBm60A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZJWFz9C4mfdL0IH5QBJsGwP9MHGU5z6GSXVOy44upAf3RruMYI3/thXinkOBoZvVxZrZ2+j4Vm8G3OG37/XTxI++eLPdJmqQYvb5XhEV5EVgc7gei0qZTdq1IdOo/sJDikbqDgJafnMsa+9n0UiBfK9C9EcGzgAIxl4V4vJBqEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwfoS/gv; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwfoS/gv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729553699; x=1761089699;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rT6S+q89Be7DqGfZUke/v4Dx+lZsxvYLlLqV5VBm60A=;
  b=IwfoS/gv6qEFuvdI958R1021VN47Zj84/Hw0u4vSaThztkH8pATffnax
   2OtgXuNdjVV+kWXipSyPPD9UZ5Ibm9VJGqd70BSX550aDKZaEInLxWZ/z
   doqAswTTPKlgJLs+Ggj5ngNII2hegmthqdGjrORbbeYvYw4RPryr7mr+E
   strK57vPiB26Oyr9l5Pg95Po43qHsruulAuvSGSlLCXcM2AL4QGxg99BK
   zQzDtg6k3WTlbDaGGmy28Rd3hqTW9yAmcsIO0oNFhxa/03Gk5Bnld1yvg
   DUANqgvYUKXZZ3ATuT5zzi4IFMOqcsTRdr+BuoJZJkV/nIspZJQUMIm3Z
   g==;
X-CSE-ConnectionGUID: d6wXjPLqStKWB1PEUcX7jA==
X-CSE-MsgGUID: aRmkK3egSPW5VVNTD9M5JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="39678711"
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="39678711"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 16:34:59 -0700
X-CSE-ConnectionGUID: amC5a25hTBeZ2QQDYEuv8g==
X-CSE-MsgGUID: fId5zZQZQYeKIqtWmr5mrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="110507093"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Oct 2024 16:34:57 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t31vK-000Sl8-2Q;
	Mon, 21 Oct 2024 23:34:54 +0000
Date: Tue, 22 Oct 2024 07:33:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1386/6324]
 drivers/gpu/drm/panthor/panthor_sched.c:2851
 panthor_fdinfo_gather_group_samples() warn: iterator 'i' not incremented
Message-ID: <202410220946.419WL4YJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Adrián Larumbe" <adrian.larumbe@collabora.com>
CC: Boris Brezillon <bbrezillon@kernel.org>
CC: Steven Price <steven.price@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   63b3ff03d91ae8f875fe8747c781a521f78cde17
commit: e16635d88fa07ba5801aa9e57ad7fe3c053234e4 [1386/6324] drm/panthor: add DRM fdinfo support
:::::: branch date: 20 hours ago
:::::: commit date: 3 weeks ago
config: alpha-randconfig-r072-20241020 (https://download.01.org/0day-ci/archive/20241022/202410220946.419WL4YJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410220946.419WL4YJ-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/panthor/panthor_sched.c:2851 panthor_fdinfo_gather_group_samples() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/gpu/drm/panthor/panthor_sched.c:3575 panthor_group_pool_destroy() warn: iterator 'i' not incremented

vim +/i +2851 drivers/gpu/drm/panthor/panthor_sched.c

e16635d88fa07b Adrián Larumbe 2024-09-24  2841  
e16635d88fa07b Adrián Larumbe 2024-09-24  2842  void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile)
e16635d88fa07b Adrián Larumbe 2024-09-24  2843  {
e16635d88fa07b Adrián Larumbe 2024-09-24  2844  	struct panthor_group_pool *gpool = pfile->groups;
e16635d88fa07b Adrián Larumbe 2024-09-24  2845  	struct panthor_group *group;
e16635d88fa07b Adrián Larumbe 2024-09-24  2846  	unsigned long i;
e16635d88fa07b Adrián Larumbe 2024-09-24  2847  
e16635d88fa07b Adrián Larumbe 2024-09-24  2848  	if (IS_ERR_OR_NULL(gpool))
e16635d88fa07b Adrián Larumbe 2024-09-24  2849  		return;
e16635d88fa07b Adrián Larumbe 2024-09-24  2850  
e16635d88fa07b Adrián Larumbe 2024-09-24 @2851  	xa_for_each(&gpool->xa, i, group) {
e16635d88fa07b Adrián Larumbe 2024-09-24  2852  		mutex_lock(&group->fdinfo.lock);
e16635d88fa07b Adrián Larumbe 2024-09-24  2853  		pfile->stats.cycles += group->fdinfo.data.cycles;
e16635d88fa07b Adrián Larumbe 2024-09-24  2854  		pfile->stats.time += group->fdinfo.data.time;
e16635d88fa07b Adrián Larumbe 2024-09-24  2855  		group->fdinfo.data.cycles = 0;
e16635d88fa07b Adrián Larumbe 2024-09-24  2856  		group->fdinfo.data.time = 0;
e16635d88fa07b Adrián Larumbe 2024-09-24  2857  		mutex_unlock(&group->fdinfo.lock);
e16635d88fa07b Adrián Larumbe 2024-09-24  2858  	}
e16635d88fa07b Adrián Larumbe 2024-09-24  2859  }
e16635d88fa07b Adrián Larumbe 2024-09-24  2860  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
