Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A4A29A2
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Aug 2025 07:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754291007; cv=none; b=tiGnezaMB2q2kIsSxDbLtmgIKBjZNYXinTlUSWpqHzmS5SxNZXpCLSVzUzjtOKgHiN9KUjYw7/aUZ5DUbIa6FBbnyPzU++rcrJhOXARFeh0NKdBs/EI8F2yPlewaEf+zFXqz+NzFK2LkKgYL0S/q3maf6MpM1L2eCU9yvpnimpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754291007; c=relaxed/simple;
	bh=AmqJuuL2VqeF+XAiEd1wj0xfGAzN6Gukz0HeP0KMhUs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WE2zkpzXDTCLy9XdIlybNOIK1GvhKOTwm0tBcZIiX5CvWW36Xlwf6MSqvgXH7yNZ9G3j8U/Tzc9qa1Atzgxkf6RFKbYjYAYaxLv+yd6LzAyrQjGU2nZoYg2I0dFrMrKDPaiRvY2VzhCQ5As874da4pvshogwYCxt8EzZGSAUTG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jFCo3ECB; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFCo3ECB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754291005; x=1785827005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AmqJuuL2VqeF+XAiEd1wj0xfGAzN6Gukz0HeP0KMhUs=;
  b=jFCo3ECBStll9FE1f4KrjDqmwTtMj8lS7nB3xz8uvTBnEH+aezAaaPjX
   fFf0oNECLA4nVOdHxbxUF1ViQanBNOp0/gbSf36zwPNbAiHKUn7AGY9dp
   mF4nPgJmbvs7qWMOvMafNBlc0G8XSMdoGmX65HagoDxyxsgyv4KnCpkm4
   jDlWZyyAoY8qTRxH6Pnz3iyXQo0EKYiax/w7Ej2Iq6dGwIye1K93mpaee
   KxydGDoKI7cARr6cKHnNgFf2KQ2ZqoRNeWqZHzC75cWju1cOlxqBhvuvp
   695uipZ/hgpvauOU36FT9qs1GLQqmb2u+8Cf2oz6OWd76gXsdG7zWQsTu
   w==;
X-CSE-ConnectionGUID: Fh8VduMCS3yHVPmURmdtfA==
X-CSE-MsgGUID: p8ffsOw9RQmkHGNBOOPNUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="55740519"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="55740519"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 00:03:25 -0700
X-CSE-ConnectionGUID: gUTIP22cQROKXN6K7AHJww==
X-CSE-MsgGUID: ht2a6BUlSPW9iHCydpg0DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="163632127"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Aug 2025 00:03:23 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uipE9-0006qy-1F;
	Mon, 04 Aug 2025 07:03:21 +0000
Date: Mon, 4 Aug 2025 15:02:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:cap-analysis/dev 23/34] drivers/atm/nicstar.c:2720 ns_poll()
 error: uninitialized symbol 'flags'.
Message-ID: <202508041444.S1nIuUSk-lkp@intel.com>
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
TO: elver@google.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git cap-analysis/dev
head:   f1cc5c884f88ed0d4f9619b9d8b6e75d35d226d9
commit: 923690c2dd26667fc024a705aa97abb62f4f3a1f [23/34] compiler-capability-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 8 hours ago
:::::: commit date: 12 hours ago
config: x86_64-randconfig-161-20250804 (https://download.01.org/0day-ci/archive/20250804/202508041444.S1nIuUSk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508041444.S1nIuUSk-lkp@intel.com/

New smatch warnings:
drivers/atm/nicstar.c:2720 ns_poll() error: uninitialized symbol 'flags'.

Old smatch warnings:
drivers/atm/nicstar.c:1747 push_scqe() warn: mixing irqsave and irq

vim +/flags +2720 drivers/atm/nicstar.c

^1da177e4c3f41 Linus Torvalds             2005-04-16  2693  
e99e88a9d2b067 Kees Cook                  2017-10-16  2694  static void ns_poll(struct timer_list *unused)
^1da177e4c3f41 Linus Torvalds             2005-04-16  2695  {
^1da177e4c3f41 Linus Torvalds             2005-04-16  2696  	int i;
^1da177e4c3f41 Linus Torvalds             2005-04-16  2697  	ns_dev *card;
^1da177e4c3f41 Linus Torvalds             2005-04-16  2698  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds             2005-04-16  2699  	u32 stat_r, stat_w;
^1da177e4c3f41 Linus Torvalds             2005-04-16  2700  
^1da177e4c3f41 Linus Torvalds             2005-04-16  2701  	PRINTK("nicstar: Entering ns_poll().\n");
098fde114bf665 chas williams - CONTRACTOR 2010-05-29  2702  	for (i = 0; i < num_cards; i++) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  2703  		card = cards[i];
9a694c1de396e2 Lance Roy                  2018-10-04  2704  		if (!spin_trylock_irqsave(&card->int_lock, flags)) {
^1da177e4c3f41 Linus Torvalds             2005-04-16  2705  			/* Probably it isn't worth spinning */
^1da177e4c3f41 Linus Torvalds             2005-04-16  2706  			continue;
^1da177e4c3f41 Linus Torvalds             2005-04-16  2707  		}
^1da177e4c3f41 Linus Torvalds             2005-04-16  2708  
^1da177e4c3f41 Linus Torvalds             2005-04-16  2709  		stat_w = 0;
^1da177e4c3f41 Linus Torvalds             2005-04-16  2710  		stat_r = readl(card->membase + STAT);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2711  		if (stat_r & NS_STAT_TSIF)
^1da177e4c3f41 Linus Torvalds             2005-04-16  2712  			stat_w |= NS_STAT_TSIF;
^1da177e4c3f41 Linus Torvalds             2005-04-16  2713  		if (stat_r & NS_STAT_EOPDU)
^1da177e4c3f41 Linus Torvalds             2005-04-16  2714  			stat_w |= NS_STAT_EOPDU;
^1da177e4c3f41 Linus Torvalds             2005-04-16  2715  
^1da177e4c3f41 Linus Torvalds             2005-04-16  2716  		process_tsq(card);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2717  		process_rsq(card);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2718  
^1da177e4c3f41 Linus Torvalds             2005-04-16  2719  		writel(stat_w, card->membase + STAT);
^1da177e4c3f41 Linus Torvalds             2005-04-16 @2720  		spin_unlock_irqrestore(&card->int_lock, flags);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2721  	}
^1da177e4c3f41 Linus Torvalds             2005-04-16  2722  	mod_timer(&ns_timer, jiffies + NS_POLL_PERIOD);
^1da177e4c3f41 Linus Torvalds             2005-04-16  2723  	PRINTK("nicstar: Leaving ns_poll().\n");
^1da177e4c3f41 Linus Torvalds             2005-04-16  2724  }
^1da177e4c3f41 Linus Torvalds             2005-04-16  2725  

:::::: The code at line 2720 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
