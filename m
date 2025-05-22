Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC932198E6F
	for <oe-kbuild@lists.linux.dev>; Thu, 22 May 2025 04:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747888702; cv=none; b=lx3CH+hlzFXne8Te7+PSR1WPFJmTwqk/cuDPH3D3l3AAVNjaHh95Nk1iiGWi8O9fpZC5KSmpSZibQu0hfGpYwp04gNmPRw3sp/viCIMUCTNytW7y7l3tqX8Vi4DIapsOIbsBeuY6wwo39Ti6d/7q2uEEWRDEzR+96XBbs54taRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747888702; c=relaxed/simple;
	bh=UadUG7NUQiQDdDri83vORblw08Mi4kmWTiT/wjcRhmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q7t/SY6kIE//nBjcfZB8NLYCMOPKcags6PG59JcoGfduu7FHnamtNudIwzhbu6rSWwIxc7ib+DPm45h5cD52VHv5CcTHwONIDa470hw5D6dDnqOsGE6ahDaFSHvffSeGijATQlBpm9JzTpqJaHZ+dFSLQXklosfpKPJLeoQx9as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwbTcASw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwbTcASw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747888697; x=1779424697;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UadUG7NUQiQDdDri83vORblw08Mi4kmWTiT/wjcRhmY=;
  b=VwbTcASw2TE0gMdzrhAOF9ApmeqZ3YIAmVVtiASF0Q92YeAWG8DQmaqK
   1y7u/wO9XSpM9+zVuwE7YVzbANdVAI/gVf7ZWmcDrLSpxPId/D5uhOVB7
   QEaOxiAOip9LyAZKScSnL0c9WgqcIExVofJyEf027N9kyKVaZWHmzOG8a
   nk6SB+cc8vL0SySF1r7Xeh352YYOxHKN0+i1n6HzIxqxQQDe+lUup74EX
   CRwOspipfj3IAWk/Qz6lqxA2jcqJp2kscw++t05lGBsRaKhIhl2jtijWa
   vB4BYVu2b6sAuI1Wu+eUlCStvDXpyrMzusqccXUFzaWJpbJmYL1gD9H3g
   A==;
X-CSE-ConnectionGUID: nxRq3PQlR9eMYiv0F79sOQ==
X-CSE-MsgGUID: eOZM5+cORWm0t3n/i/zJGg==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="53691124"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="53691124"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 21:38:15 -0700
X-CSE-ConnectionGUID: fAzWEo3AT2W5hJ82GkuLlQ==
X-CSE-MsgGUID: Zzj39sJeQSmOXe/Zaf3tPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140928032"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 May 2025 21:37:58 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHxgq-000Ouj-0a;
	Thu, 22 May 2025 04:37:56 +0000
Date: Thu, 22 May 2025 12:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10969/12618] drivers/md/dm-mpath.c:2104
 probe_active_paths() warn: mixing irqsave and irq
Message-ID: <202505221209.UJOI2rXT-lkp@intel.com>
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
TO: Benjamin Marzinski <bmarzins@redhat.com>
CC: Mikulas Patocka <mpatocka@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7bac2c97af4078d7a627500c9bcdd5b033f97718
commit: 5c977f1023156938915c57d362fddde8fad2b052 [10969/12618] dm-mpath: Don't grab work_mutex while probing paths
:::::: branch date: 17 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-141-20250521 (https://download.01.org/0day-ci/archive/20250522/202505221209.UJOI2rXT-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505221209.UJOI2rXT-lkp@intel.com/

smatch warnings:
drivers/md/dm-mpath.c:2104 probe_active_paths() warn: mixing irqsave and irq

vim +2104 drivers/md/dm-mpath.c

7734fb4ad98c3f Kevin Wolf         2025-04-29  2082  
7734fb4ad98c3f Kevin Wolf         2025-04-29  2083  /*
7734fb4ad98c3f Kevin Wolf         2025-04-29  2084   * Probe all active paths in current_pg to find out whether they still work.
7734fb4ad98c3f Kevin Wolf         2025-04-29  2085   * Fail all paths that do not work.
7734fb4ad98c3f Kevin Wolf         2025-04-29  2086   *
7734fb4ad98c3f Kevin Wolf         2025-04-29  2087   * Return -ENOTCONN if no valid path is left (even outside of current_pg). We
7734fb4ad98c3f Kevin Wolf         2025-04-29  2088   * cannot probe paths in other pgs without switching current_pg, so if valid
7734fb4ad98c3f Kevin Wolf         2025-04-29  2089   * paths are only in different pgs, they may or may not work. Additionally
7734fb4ad98c3f Kevin Wolf         2025-04-29  2090   * we should not probe paths in a pathgroup that is in the process of
7734fb4ad98c3f Kevin Wolf         2025-04-29  2091   * Initializing. Userspace can submit a request and we'll switch and wait
7734fb4ad98c3f Kevin Wolf         2025-04-29  2092   * for the pathgroup to be initialized. If the request fails, it may need to
7734fb4ad98c3f Kevin Wolf         2025-04-29  2093   * probe again.
7734fb4ad98c3f Kevin Wolf         2025-04-29  2094   */
7734fb4ad98c3f Kevin Wolf         2025-04-29  2095  static int probe_active_paths(struct multipath *m)
7734fb4ad98c3f Kevin Wolf         2025-04-29  2096  {
7734fb4ad98c3f Kevin Wolf         2025-04-29  2097  	struct pgpath *pgpath;
5c977f10231569 Benjamin Marzinski 2025-05-15  2098  	struct priority_group *pg = NULL;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2099  	unsigned long flags;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2100  	int r = 0;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2101  
7734fb4ad98c3f Kevin Wolf         2025-04-29  2102  	spin_lock_irqsave(&m->lock, flags);
5c977f10231569 Benjamin Marzinski 2025-05-15  2103  	if (test_bit(MPATHF_DELAY_PG_SWITCH, &m->flags)) {
5c977f10231569 Benjamin Marzinski 2025-05-15 @2104  		wait_event_lock_irq(m->probe_wait,
5c977f10231569 Benjamin Marzinski 2025-05-15  2105  				    !test_bit(MPATHF_DELAY_PG_SWITCH, &m->flags),
5c977f10231569 Benjamin Marzinski 2025-05-15  2106  				    m->lock);
5c977f10231569 Benjamin Marzinski 2025-05-15  2107  		/*
5c977f10231569 Benjamin Marzinski 2025-05-15  2108  		 * if we waited because a probe was already in progress,
5c977f10231569 Benjamin Marzinski 2025-05-15  2109  		 * and it probed the current active pathgroup, don't
5c977f10231569 Benjamin Marzinski 2025-05-15  2110  		 * reprobe. Just return the number of valid paths
5c977f10231569 Benjamin Marzinski 2025-05-15  2111  		 */
5c977f10231569 Benjamin Marzinski 2025-05-15  2112  		if (m->current_pg == m->last_probed_pg)
5c977f10231569 Benjamin Marzinski 2025-05-15  2113  			goto skip_probe;
5c977f10231569 Benjamin Marzinski 2025-05-15  2114  	}
5c977f10231569 Benjamin Marzinski 2025-05-15  2115  	if (!m->current_pg || m->is_suspending ||
5c977f10231569 Benjamin Marzinski 2025-05-15  2116  	    test_bit(MPATHF_QUEUE_IO, &m->flags))
5c977f10231569 Benjamin Marzinski 2025-05-15  2117  		goto skip_probe;
5c977f10231569 Benjamin Marzinski 2025-05-15  2118  	set_bit(MPATHF_DELAY_PG_SWITCH, &m->flags);
5c977f10231569 Benjamin Marzinski 2025-05-15  2119  	pg = m->last_probed_pg = m->current_pg;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2120  	spin_unlock_irqrestore(&m->lock, flags);
7734fb4ad98c3f Kevin Wolf         2025-04-29  2121  
7734fb4ad98c3f Kevin Wolf         2025-04-29  2122  	list_for_each_entry(pgpath, &pg->pgpaths, list) {
5c977f10231569 Benjamin Marzinski 2025-05-15  2123  		if (pg != READ_ONCE(m->current_pg) ||
5c977f10231569 Benjamin Marzinski 2025-05-15  2124  		    READ_ONCE(m->is_suspending))
5c977f10231569 Benjamin Marzinski 2025-05-15  2125  			goto out;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2126  		if (!pgpath->is_active)
7734fb4ad98c3f Kevin Wolf         2025-04-29  2127  			continue;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2128  
7734fb4ad98c3f Kevin Wolf         2025-04-29  2129  		r = probe_path(pgpath);
7734fb4ad98c3f Kevin Wolf         2025-04-29  2130  		if (r < 0)
7734fb4ad98c3f Kevin Wolf         2025-04-29  2131  			goto out;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2132  	}
7734fb4ad98c3f Kevin Wolf         2025-04-29  2133  
7734fb4ad98c3f Kevin Wolf         2025-04-29  2134  out:
5c977f10231569 Benjamin Marzinski 2025-05-15  2135  	spin_lock_irqsave(&m->lock, flags);
5c977f10231569 Benjamin Marzinski 2025-05-15  2136  	clear_bit(MPATHF_DELAY_PG_SWITCH, &m->flags);
5c977f10231569 Benjamin Marzinski 2025-05-15  2137  	if (test_and_clear_bit(MPATHF_NEED_PG_SWITCH, &m->flags)) {
5c977f10231569 Benjamin Marzinski 2025-05-15  2138  		m->current_pgpath = NULL;
5c977f10231569 Benjamin Marzinski 2025-05-15  2139  		m->current_pg = NULL;
5c977f10231569 Benjamin Marzinski 2025-05-15  2140  	}
5c977f10231569 Benjamin Marzinski 2025-05-15  2141  skip_probe:
5c977f10231569 Benjamin Marzinski 2025-05-15  2142  	if (r == 0 && !atomic_read(&m->nr_valid_paths))
5c977f10231569 Benjamin Marzinski 2025-05-15  2143  		r = -ENOTCONN;
5c977f10231569 Benjamin Marzinski 2025-05-15  2144  	spin_unlock_irqrestore(&m->lock, flags);
5c977f10231569 Benjamin Marzinski 2025-05-15  2145  	if (pg)
5c977f10231569 Benjamin Marzinski 2025-05-15  2146  		wake_up(&m->probe_wait);
7734fb4ad98c3f Kevin Wolf         2025-04-29  2147  	return r;
7734fb4ad98c3f Kevin Wolf         2025-04-29  2148  }
7734fb4ad98c3f Kevin Wolf         2025-04-29  2149  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
