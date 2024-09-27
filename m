Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E305188CAF
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 22:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727476191; cv=none; b=Rwb7ziI1P47Kdx0Pnn8+y0G0NNVzLS/p59tuRx8OYXOlWPeEWla7sc+EfVN6argltUfVq0FY9TEV/C4uXICQH0hMsLZ5pgwv23HWPM8yJC68Tfz5p7UbdbGZj7EHxnsevCOQBJXe6UKB5iuKl6spB8xW+hQXsCLSSh+IBnIP4rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727476191; c=relaxed/simple;
	bh=/bjOr303etYPzKXi+RNKLC4YNjKsQeL4m3l/i3Byb4M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ef+zb34qq3T9DWNFc+UtSMsNjT/edD0vEMU5IwKPADy6kyA2GI5jye5kMCxO70kbS8OtiRgjYaDdrDhO+swtI5fKPEO0dZNJVCP6KDsgtx0NvWNqZz/NvWMLcnptPaDfZwPo3vkTr4MZALYp2G9Kd+U/LfWcV/e7sxNiMMdj3qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDcOVGs/; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDcOVGs/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727476189; x=1759012189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/bjOr303etYPzKXi+RNKLC4YNjKsQeL4m3l/i3Byb4M=;
  b=mDcOVGs/hL5Qr8kC825kfbSz3MHrNPDPMl05uMJrU/mLbuYD70knpcnb
   1t2QIVlTEkifDdDTJbVJ5Wu6ilV/Uz8MT2RDn8RqUkA1O3kXOWLcoCVML
   Nxh4OaNRPkZ+fONBQHiv+ZQaXh9Uua6tYsI/tj7AtENHZlGakJdH5WAV9
   YrOVt+f+oEY941ZVOvIqH2OsY48ECRtdF4BcNbCa8Tb3sgObDzJHkSjT8
   HBvjROxt9yrM3pIhOTqozuioiAtcOS7nZAN6nQx1yZrlZZkx7QHMYCURm
   m/PX/SZ9lYyHVAlu/bHwsI4W9LYsJrzV9xlycsJcECYQ+H2IQEZ7VbbEe
   Q==;
X-CSE-ConnectionGUID: kG73TaXQSJ+ccON3iCRAYQ==
X-CSE-MsgGUID: rmvk5gPeQYSPOsdlRGXBZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26766281"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="26766281"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 15:29:49 -0700
X-CSE-ConnectionGUID: AwPrZWrnQOisiVBNBrXmmw==
X-CSE-MsgGUID: QJhm1C/AQ+6zTlnX8biJ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72734670"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 27 Sep 2024 15:29:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suJT7-000MhD-2F;
	Fri, 27 Sep 2024 22:29:45 +0000
Date: Sat, 28 Sep 2024 06:29:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cip:linux-4.19.y-cip-rt-rebase 96/9999] kernel/softirq.c:973
 __tasklet_schedule_common() warn: inconsistent returns 'flags'.
Message-ID: <202409280623.vGQgQ1pn-lkp@intel.com>
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
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   67ac3270c7aaf93810ea5b43e2bf8361b683718e
commit: 62d0a2a30cd01fabc7f6555df2cfae7dd3d9fad8 [96/9999] tasklet: Address a race resulting in double-enqueue
:::::: branch date: 4 days ago
:::::: commit date: 4 years, 5 months ago
config: i386-randconfig-141-20240927 (https://download.01.org/0day-ci/archive/20240928/202409280623.vGQgQ1pn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409280623.vGQgQ1pn-lkp@intel.com/

smatch warnings:
kernel/softirq.c:973 __tasklet_schedule_common() warn: inconsistent returns 'flags'.

vim +/flags +973 kernel/softirq.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  928  
6498ddad301c7a Ingo Molnar    2018-02-27  929  static void __tasklet_schedule_common(struct tasklet_struct *t,
6498ddad301c7a Ingo Molnar    2018-02-27  930  				      struct tasklet_head __percpu *headp,
6498ddad301c7a Ingo Molnar    2018-02-27  931  				      unsigned int softirq_nr)
^1da177e4c3f41 Linus Torvalds 2005-04-16  932  {
6498ddad301c7a Ingo Molnar    2018-02-27  933  	struct tasklet_head *head;
^1da177e4c3f41 Linus Torvalds 2005-04-16  934  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds 2005-04-16  935  
^1da177e4c3f41 Linus Torvalds 2005-04-16  936  	local_irq_save(flags);
4a8c8d729198e3 Ingo Molnar    2011-11-29  937  	if (!tasklet_trylock(t)) {
4a8c8d729198e3 Ingo Molnar    2011-11-29  938  		local_irq_restore(flags);
4a8c8d729198e3 Ingo Molnar    2011-11-29  939  		return;
4a8c8d729198e3 Ingo Molnar    2011-11-29  940  	}
4a8c8d729198e3 Ingo Molnar    2011-11-29  941  
6498ddad301c7a Ingo Molnar    2018-02-27  942  	head = this_cpu_ptr(headp);
4a8c8d729198e3 Ingo Molnar    2011-11-29  943  again:
4a8c8d729198e3 Ingo Molnar    2011-11-29  944  	/* We may have been preempted before tasklet_trylock
4a8c8d729198e3 Ingo Molnar    2011-11-29  945  	 * and __tasklet_action may have already run.
4a8c8d729198e3 Ingo Molnar    2011-11-29  946  	 * So double check the sched bit while the takslet
4a8c8d729198e3 Ingo Molnar    2011-11-29  947  	 * is locked before adding it to the list.
4a8c8d729198e3 Ingo Molnar    2011-11-29  948  	 */
4a8c8d729198e3 Ingo Molnar    2011-11-29  949  	if (test_bit(TASKLET_STATE_SCHED, &t->state)) {
62d0a2a30cd01f Zhang Xiao     2020-03-17  950  		if (test_and_set_bit(TASKLET_STATE_CHAINED, &t->state)) {
62d0a2a30cd01f Zhang Xiao     2020-03-17  951  			tasklet_unlock(t);
62d0a2a30cd01f Zhang Xiao     2020-03-17  952  			return;
62d0a2a30cd01f Zhang Xiao     2020-03-17  953  		}
48f20a9a9488c4 Olof Johansson 2008-03-04  954  		t->next = NULL;
6498ddad301c7a Ingo Molnar    2018-02-27  955  		*head->tail = t;
6498ddad301c7a Ingo Molnar    2018-02-27  956  		head->tail = &(t->next);
6498ddad301c7a Ingo Molnar    2018-02-27  957  		raise_softirq_irqoff(softirq_nr);
4a8c8d729198e3 Ingo Molnar    2011-11-29  958  		tasklet_unlock(t);
4a8c8d729198e3 Ingo Molnar    2011-11-29  959  	} else {
4a8c8d729198e3 Ingo Molnar    2011-11-29  960  		/* This is subtle. If we hit the corner case above
4a8c8d729198e3 Ingo Molnar    2011-11-29  961  		 * It is possible that we get preempted right here,
4a8c8d729198e3 Ingo Molnar    2011-11-29  962  		 * and another task has successfully called
4a8c8d729198e3 Ingo Molnar    2011-11-29  963  		 * tasklet_schedule(), then this function, and
4a8c8d729198e3 Ingo Molnar    2011-11-29  964  		 * failed on the trylock. Thus we must be sure
4a8c8d729198e3 Ingo Molnar    2011-11-29  965  		 * before releasing the tasklet lock, that the
4a8c8d729198e3 Ingo Molnar    2011-11-29  966  		 * SCHED_BIT is clear. Otherwise the tasklet
4a8c8d729198e3 Ingo Molnar    2011-11-29  967  		 * may get its SCHED_BIT set, but not added to the
4a8c8d729198e3 Ingo Molnar    2011-11-29  968  		 * list
4a8c8d729198e3 Ingo Molnar    2011-11-29  969  		 */
4a8c8d729198e3 Ingo Molnar    2011-11-29  970  		if (!tasklet_tryunlock(t))
4a8c8d729198e3 Ingo Molnar    2011-11-29  971  			goto again;
4a8c8d729198e3 Ingo Molnar    2011-11-29  972  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16 @973  	local_irq_restore(flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  974  }
6498ddad301c7a Ingo Molnar    2018-02-27  975  

:::::: The code at line 973 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
