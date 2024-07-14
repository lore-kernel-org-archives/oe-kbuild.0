Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CED63C8
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jul 2024 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720967059; cv=none; b=rAehQtpVE0odceE2HIZnWrt9gDvmmcucPpUFoNymZp3JjfnxRhSBRjaPrddeYxTdsTtSMPeuqu4i7doxKlnSGGZfXLzk22HktEqAVt+vyjF0ylKNlvVxtwRS0N/443fqJIe3/dm4rQcjnGXDzW+uh9fXuRW2Pt5rookfmE0r3Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720967059; c=relaxed/simple;
	bh=0uumgDQLR4TB+baqxML290HqrOg8+z1izCaG22t9tKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bIIDtgxyNSrTY+XzKEIYKNVcDKiyFNpgpAQBub9cwPI0aKJ2+iIbfXOdr7FBquqeCfhuSmTZRCqYAKh+I2GzHBy8umdvpUq6G1zToanilQRlNObMuGCojyaehw4qnUtyqV4oQHfgYTLu36qOOmz8r9kB2iwoZp/az3alTPG5SBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QSRWQED5; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QSRWQED5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720967058; x=1752503058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0uumgDQLR4TB+baqxML290HqrOg8+z1izCaG22t9tKE=;
  b=QSRWQED5ZwrWF/WPeu9eDvXVwF2/AOQumWECwfiDea5PydGKEL7HYwOC
   k/NltZHARJ0VclVNTZwNSXZ+RO2m6PEHv8oKRID+/RBNwC95wCFNEo6nc
   9gVIPtVYpb+TkhKIEWUzvS6xCEE+HYg9peeVWQsqEtxKbFVyMO7UVyn2x
   9ilwdpcvswWXYdfTVi4knZcggg8/0tbAfo54vfIe3e+FRIy/9i8GPXCJh
   U0xbYxWzJ9OMlnrS++oE166xUoJMpOzjV+BWPkdDJMH3iT5YD8nccm/JI
   39N+g0hJKfAK4y60pvthpFVLvu76HK/XJUifmmbfjy5WskqOf2jhi0mT5
   A==;
X-CSE-ConnectionGUID: q4eDXN63TfKOHGHzYv9R6A==
X-CSE-MsgGUID: QQhAmW5+SZG1CnNIBfGo5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="12542836"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="12542836"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 07:24:17 -0700
X-CSE-ConnectionGUID: B6DV+9eoTWurPfLfG5I1IA==
X-CSE-MsgGUID: nzvnKy1KTjuGS+o/5dFEag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="54207030"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Jul 2024 07:24:16 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sT097-000dUI-0u;
	Sun, 14 Jul 2024 14:24:13 +0000
Date: Sun, 14 Jul 2024 22:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cip:linux-4.19.y-cip-rt-rebase 96/9999] kernel/softirq.c:973
 __tasklet_schedule_common() warn: inconsistent returns 'flags'.
Message-ID: <202407142205.22hVCdHd-lkp@intel.com>
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
TO: Pavel Machek <pavel@denx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   642e819a3c30d3536e6d66a631b761886a0316e7
commit: 62d0a2a30cd01fabc7f6555df2cfae7dd3d9fad8 [96/9999] tasklet: Address a race resulting in double-enqueue
:::::: branch date: 2 days ago
:::::: commit date: 4 years, 3 months ago
config: i386-randconfig-141-20240714 (https://download.01.org/0day-ci/archive/20240714/202407142205.22hVCdHd-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407142205.22hVCdHd-lkp@intel.com/

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
