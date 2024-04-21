Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB67C63B
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Apr 2024 00:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713659895; cv=none; b=htVIRP4mXyDWVK0WkZDAUXg/W7PRkjEmefI4IHvUwZmKCvyfYhw5fdMTBdx5KvG1fI4HG18Ev0RVNkumDFRaBf0mUssTKPwgb2JCy+W4Ki3Oie7ukAMdP6LRyNp5Y0svuQg0CsplJzQn2sjZwb5GeNPqCqmObF+vzZaNqdkkXps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713659895; c=relaxed/simple;
	bh=GNWQDdYA5/3iP5LH+BI8LKFxkJW73Zzoq6EsLP1mDKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=phg13aXDLM+SCJ8yuToXysVsWTidkMq42R81Aut2GlhdRQwOeDHrveyo7BLdy6wJDvM2C1sHtkojBzDfkmyL8aSZxrPSedLfaJ5Xj5rKCLNO8+3UJrti1X3VPv6UfwsZ4IURfr+1RnUn4+KWcyQRYal2wwIXlwM1g86VU2RKTmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZmHJ9IT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZmHJ9IT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713659894; x=1745195894;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GNWQDdYA5/3iP5LH+BI8LKFxkJW73Zzoq6EsLP1mDKo=;
  b=HZmHJ9ITDy3GdCcxYoLz7828ROOtomvKb27CcofufkQsUeivpDy9TWdQ
   YHd3L2K88pmcSlqMLmXj5Rx+0TWlvcoUoXd5bmpkHAkQDyxccQt6J23Ja
   /JvsQ+OVFvUqpr79M96ap76vVontXZN5xlRof9wiXeXP26wJhBTgdI1o+
   6A9wnlJdRUllTFzHo0mZG3a3L0+b/DYy4dJ6cDhWg12YptgtCGpG+9Eei
   eDTPaebo0ylQQ+Bd0fWE+ydCfDkPA712ipVC+p0/10+fWmVbFwgyXoM9G
   ysqlYVCBK09KCuna+eLW9oZ5WeQ1GzJehp8nTVT49hPdPWCXO+sF5z19L
   g==;
X-CSE-ConnectionGUID: lq/zCklqT+m2cGsFsG/D+A==
X-CSE-MsgGUID: B6KWUNhzQHGgDJfWdZph8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="20630784"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="20630784"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 17:38:13 -0700
X-CSE-ConnectionGUID: Pl0oGGQLScyEYqDj2L/5rQ==
X-CSE-MsgGUID: kgev0n03STOlgPjTd4OzJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="61115824"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Apr 2024 17:38:12 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryLDd-000Bao-0m;
	Sun, 21 Apr 2024 00:38:09 +0000
Date: Sun, 21 Apr 2024 08:38:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6797/7122] seal_elf.c:undefined reference to
 `sys_mprotect'
Message-ID: <202404210810.9nYl2GMd-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Jeff Xu <jeffxu@chromium.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a35e92ef04c07bd473404b9b73d489aea19a60a8
commit: 93934a4ca8eadf5f74fe2c7c79de3d30a8603793 [6797/7122] selftest mm/mseal read-only elf memory segment
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240421/202404210810.9nYl2GMd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404210810.9nYl2GMd-lkp@intel.com/

All errors (new ones prefixed by >>):

   seal_elf.c: In function 'test_seal_elf':
   seal_elf.c:140:45: warning: format '%s' expects argument of type 'char *', but argument 5 has type 'char (*)[5]' [-Wformat=]
     140 |                 if (sscanf(line, "%lx-%lx %4s %*x %*x:%*x %*u %255[^\n]",
         |                                           ~~^
         |                                             |
         |                                             char *
     141 |                         &addr_start, &addr_end, &prot, &filename) == 4) {
         |                                                 ~~~~~
         |                                                 |
         |                                                 char (*)[5]
   seal_elf.c:140:69: warning: format '%[^
      ' expects argument of type 'char *', but argument 6 has type 'char (*)[256]' [-Wformat=]
     140 |                 if (sscanf(line, "%lx-%lx %4s %*x %*x:%*x %*u %255[^\n]",
         |                                                               ~~~~~~^~
         |                                                                     |
         |                                                                     char *
     141 |                         &addr_start, &addr_end, &prot, &filename) == 4) {
         |                                                        ~~~~~~~~~     
         |                                                        |
         |                                                        char (*)[256]
   seal_elf.c:110:13: warning: unused variable 'size' [-Wunused-variable]
     110 |         int size = 0;
         |             ^~~~
   /usr/bin/ld: /tmp/ccl7501S.o: in function `test_seal_elf':
>> seal_elf.c:(.text+0x7af): undefined reference to `sys_mprotect'
>> /usr/bin/ld: seal_elf.c:(.text+0x82c): undefined reference to `sys_mprotect'
   /usr/bin/ld: seal_elf.c:(.text+0xa4e): undefined reference to `sys_mprotect'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
