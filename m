Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793623134;
	b=L0CoIJTAFqdaPZ7TqO8Z+PVRF3Qa+8PqBdQckpIUsZVmENvTLHrMF9sBLtNAdSADXMdo
	 nSqorCQY+xdwR3bOIQAsgA5tTa7qfmH4lX+aSOLP/5tL3oFQdKukdgBNaBMdEhRGR0+Dw
	 XBxpl+/zNs+FUnFJXz/YQtyL0IMfSS0uvkzJcm8yE4yNRrf1H2D7XYX3ulVtEUz+8BhXy
	 9/pjkjmXmnBRl0vo4uPPb2bRwWjBrzqOIXUH2LxosyDNDuSRHnD+PBs/b5FhkYgEIbTLO
	 uKmDoaoX6ueZEprESzj7jgDvdfxxzvOlmZsIQ+AEcf0cMFJQpJADfGXBpuNWMjFkDLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623134;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=quhFUhTXo6lNbhiHsUEpirAP95BsbX1MkBIGkikWYpc=;
	b=ClePqvMd7r1rI42Me2NGiP/4U4evjCh4iyvurG/eEzPkXtCo6dydQ6HOXV+UOfD4QXvv
	 4/QABt2kwknupf28+aCciqot++IoJc84MSr1OydtPriCgegy67oS2Zh8nQNqf9wL7bFIU
	 OFOYVUD5XzpR0t43nbpPWaKWRhKtxMwd8/lSayzIa3aQZObF2ot5Pplo0+CoUUST205H4
	 v9dxDoQSWKm8MR3mGwZWs4g3aIw57cRQkjMxJpMLpr1cAKuHBdHmcBqtRIYxpUYLnGYvj
	 ATutGTA1tEJEvs+K5csT3UVRLumGkLjMOx/k8SWZ4mJlboRNjbn/ErNp3EfNgqSOyzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jNgAboL1;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF043606A326
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Nov 2026 12:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF043606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jNgAboL1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793623133; x=1825159133;
  h=date:from:to:cc:subject:message-id;
  bh=vNDPpBs03igMKAWc5WeulUCKmxyUtSDjTJKDVgcAdB4=;
  b=jNgAboL1oG1FXSQ8sIy3SoisyUoMzvS7K3u9WRIx9rrQt4dQCajTBOSc
   dbmyZ43y43rQcX+JVV1xPsjL7dwtomRIdhYT9dSM4eOzKCyrEkxB3z4ev
   ISWBoC4uDRpbxoxMEAS41k2NnHePYD4DsYSZSLIOiqRczD66C6g68P9wq
   eJ0qmL9dw454oC1FEtmtKMj6BKOr8cd/NjHZ53+NtF5MuB/fWqQYEz3FF
   Madn6e1N7X4QG26mnAdeffIwb7/PrTTcaxwmo+MR5nduHeQi6cmxEA06O
   88fH+baQyizxuV6nV3UKIpsPuVd2GRVFgWC4WKhVaaTjhT9yvp6r3s2BO
   w==;
X-CSE-ConnectionGUID: LiWzP+8QRDmpdgy+QcSTiw==
X-CSE-MsgGUID: GKRX7507QriNao+8h8aXlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2199581"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2199581"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 04:38:52 -0800
X-CSE-ConnectionGUID: JVlrL2a4SeOLKcsWWGHixg==
X-CSE-MsgGUID: 1QraDbenSliKpr85QULy7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="7926137"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 02 Nov 2026 04:38:52 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNrJJ-000000008XP-1A3Y;
	Mon, 02 Nov 2026 12:38:49 +0000
Date: Mon, 02 Nov 2026 13:38:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm/kernel/signal.c:59 preserve_iwmmxt_context() warn:
 maybe return -EFAULT instead of the bytes remaining?
Message-ID: <202611021331.rgL6vy6h-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
commit: 4486f02005ea01b59174ecb1dc7115883eb7b994 ARM: mark IWMMXT as deprecated
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-r2201-20261102 (https://download.01.org/0day-ci/archive/20261102/202611021331.rgL6vy6h-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4486f02005ea ("ARM: mark IWMMXT as deprecated")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611021331.rgL6vy6h-lkp@intel.com/

smatch warnings:
arch/arm/kernel/signal.c:59 preserve_iwmmxt_context() warn: maybe return -EFAULT instead of the bytes remaining?

vim +59 arch/arm/kernel/signal.c

^1da177e4c3f415 Linus Torvalds    2005-04-16  30  
269583559cdd8ab Dave Martin       2017-06-30  31  static int preserve_iwmmxt_context(struct iwmmxt_sigframe __user *frame)
^1da177e4c3f415 Linus Torvalds    2005-04-16  32  {
69b0475456ff7ef Hugh Dickins      2005-10-29  33  	char kbuf[sizeof(*frame) + 8];
69b0475456ff7ef Hugh Dickins      2005-10-29  34  	struct iwmmxt_sigframe *kframe;
ce184a0dee92a0a Dave Martin       2017-06-30  35  	int err = 0;
^1da177e4c3f415 Linus Torvalds    2005-04-16  36  
^1da177e4c3f415 Linus Torvalds    2005-04-16  37  	/* the iWMMXt context must be 64 bit aligned */
69b0475456ff7ef Hugh Dickins      2005-10-29  38  	kframe = (struct iwmmxt_sigframe *)((unsigned long)(kbuf + 8) & ~7);
ce184a0dee92a0a Dave Martin       2017-06-30  39  
ce184a0dee92a0a Dave Martin       2017-06-30  40  	if (test_thread_flag(TIF_USING_IWMMXT)) {
85fe068123aa11d Daniel Jacobowitz 2006-06-24  41  		kframe->magic = IWMMXT_MAGIC;
85fe068123aa11d Daniel Jacobowitz 2006-06-24  42  		kframe->size = IWMMXT_STORAGE_SIZE;
69b0475456ff7ef Hugh Dickins      2005-10-29  43  		iwmmxt_task_copy(current_thread_info(), &kframe->storage);
ce184a0dee92a0a Dave Martin       2017-06-30  44  	} else {
ce184a0dee92a0a Dave Martin       2017-06-30  45  		/*
ce184a0dee92a0a Dave Martin       2017-06-30  46  		 * For bug-compatibility with older kernels, some space
ce184a0dee92a0a Dave Martin       2017-06-30  47  		 * has to be reserved for iWMMXt even if it's not used.
ce184a0dee92a0a Dave Martin       2017-06-30  48  		 * Set the magic and size appropriately so that properly
ce184a0dee92a0a Dave Martin       2017-06-30  49  		 * written userspace can skip it reliably:
ce184a0dee92a0a Dave Martin       2017-06-30  50  		 */
73839798af7ebc6 Julien Thierry    2018-09-11  51  		*kframe = (struct iwmmxt_sigframe) {
73839798af7ebc6 Julien Thierry    2018-09-11  52  			.magic = DUMMY_MAGIC,
73839798af7ebc6 Julien Thierry    2018-09-11  53  			.size  = IWMMXT_STORAGE_SIZE,
73839798af7ebc6 Julien Thierry    2018-09-11  54  		};
^1da177e4c3f415 Linus Torvalds    2005-04-16  55  	}
^1da177e4c3f415 Linus Torvalds    2005-04-16  56  
73839798af7ebc6 Julien Thierry    2018-09-11  57  	err = __copy_to_user(frame, kframe, sizeof(*kframe));
73839798af7ebc6 Julien Thierry    2018-09-11  58  
ce184a0dee92a0a Dave Martin       2017-06-30 @59  	return err;
ce184a0dee92a0a Dave Martin       2017-06-30  60  }
ce184a0dee92a0a Dave Martin       2017-06-30  61  

:::::: The code at line 59 was first introduced by commit
:::::: ce184a0dee92a0a333236a26478e304dca29a3df ARM: 8687/1: signal: Fix unparseable iwmmxt_sigframe in uc_regspace[]

:::::: TO: Dave Martin <Dave.Martin@arm.com>
:::::: CC: Russell King <rmk+kernel@armlinux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
