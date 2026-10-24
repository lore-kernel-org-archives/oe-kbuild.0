Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792871289;
	b=Dn38d5I9V23hZXpwSZguuJPPAK/jauIEQvUFmu7ng8wvhy9CW3eex0O1Jjc21FaZp0sh
	 DwHGCOYBX6W3bq1ym1DuwOKlojA/eUul/s3Cdr/oFKqYPwxLNoP/W07PVLflBoyWq2u1W
	 KgzYKrXIltumnBUGuYRZ2z4bBSGW9exXDYG4iqHQ+Tl34FKydwWH2VIDsoB3/i28KC7hH
	 4+i2D5Cso++hrZtzfyVPMWdUVO0D0RD/DYT2TxRQIQuOrzcNsqul/TKEWCaCEu1QUoAvS
	 zrKKi1POA5eXBcuRmO+4+JNqZ0W/5zRfwTl8ZbIKXVpoiP0u1tIy/U8B2l3oFlmYuiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792871289;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AEEL2VxkWgpAxkcd3dbeSknFAQh1zC8PUlkho8QTsUg=;
	b=p5lgToa1gGisnb/tBFU1alkHKppqYcQXn30f4lZSlT6tyyKO17iTba3WvL2dhf1k3VUk
	 Yl0ij6u/QDSkngG8Oie6gMj8aOJZdMiph8bj8o1x1ZIXhFqKJ/su0uW27CDlu8a5U70hH
	 2Ajik3eoPuAn6DO1fcYx2z73A8NuNxJRoLHzyoxfMpIl/tKK2MDZrSYhohi4nyLqomo14
	 P9Bwy4BwNAC1qR68cvcHNHdkAUJ01qb6alqTUWsd3uf/fqjG8tpCuOgpcylMZyt17Ocd2
	 7fxNvKi6Jga7DOcKH0970fJ/+xYEa46VbMCPRmOCPc8GVrRCjb5tCFBJb2Wt8kG3ZVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="I/3pO7Jx";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34886606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Oct 2026 19:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34886606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I/3pO7Jx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792871287; x=1824407287;
  h=date:from:to:cc:subject:message-id;
  bh=WqNUTJINsKQrSTg+PsRtpAbMVVcfc3bMmsa01719y6s=;
  b=I/3pO7JxAKBTzcyv8SYeHPz2U49A+nvnwT9jA55W22SNSiPjTGzk87cZ
   2fvB4nwllYv67Pv8akrKRGIKuXRk8jimMQ+hln0y+UvwzPPCehO3pBHXn
   KGaA+wP+Iwi112pXjf9dVvTZDp9w08QUF9UaW3FHRvbLhwba6EsBKDJuj
   C3wDquJQT3GFyIy0GXAA4b1sYxtSCh2ivYsPs2+Et9Jwwt/cnx7H4rwTN
   h8jIMhcc0Q/TWk8J1LzA+MfNR6CR/oe6AnTai1nzuXDXnNZrH7+JI3rbn
   NuVILcmUVoCJSJsHgF3OTHj0UWLAW1r/umFZEVVpQhvIg2Guux9QCuGxc
   A==;
X-CSE-ConnectionGUID: PyvXuv70Qvy5uAXR3CwJFw==
X-CSE-MsgGUID: n7foA3NYTKGls7tP3rDInQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1619698"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1619698"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 12:48:06 -0700
X-CSE-ConnectionGUID: tO4RsuRLSwSKECeemF8/NA==
X-CSE-MsgGUID: Ow+WWZ6XTGKLQN7DUDkwPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="4036857"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 24 Oct 2026 12:48:06 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKhil-000000003RP-12Nn;
	Sat, 24 Oct 2026 19:48:03 +0000
Date: Sat, 24 Oct 2026 21:47:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:vfs-7.5.super 62/65] fs/super.c:177
 super_lock() warn: missing unwind goto?
Message-ID: <202610242131.8KUVdKA5-lkp@intel.com>
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
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christian Brauner <brauner@kernel.org>
CC: Josef Bacik <josef@toxicpanda.com>

Hi Christian,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-7.5.super
head:   2c8a968b488c134d05ccefff890270ac8ab899a8
commit: 3af63add349c1aeaee12fb571e5af95635aa83ab [62/65] super: let super_lock() wait for a superblock being shut down
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: nios2-randconfig-r2202-20261024 (https://download.01.org/0day-ci/archive/20261024/202610242131.8KUVdKA5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610242131.8KUVdKA5-lkp@intel.com/

smatch warnings:
fs/super.c:177 super_lock() warn: missing unwind goto?
fs/super.c:177 super_lock() warn: missing unwind goto?

vim +177 fs/super.c

7c4c683849ac80 Christian Brauner 2026-10-23  123  
5d2b0f2107aa50 Christian Brauner 2026-10-23  124  /**
5d2b0f2107aa50 Christian Brauner 2026-10-23  125   * super_lock - wait for superblock to become ready and lock it
5d2b0f2107aa50 Christian Brauner 2026-10-23  126   * @sb: superblock to wait for
5d2b0f2107aa50 Christian Brauner 2026-10-23  127   * @flags: SUPER_LOCK_* flags
5d2b0f2107aa50 Christian Brauner 2026-10-23  128   *
5d2b0f2107aa50 Christian Brauner 2026-10-23  129   * If the superblock has neither passed through vfs_get_tree() or
5d2b0f2107aa50 Christian Brauner 2026-10-23  130   * generic_shutdown_super() yet wait for it to happen. Either superblock
5d2b0f2107aa50 Christian Brauner 2026-10-23  131   * creation will succeed and SB_BORN is set by vfs_get_tree() or we're
5d2b0f2107aa50 Christian Brauner 2026-10-23  132   * woken and we'll see SB_DYING.
5d2b0f2107aa50 Christian Brauner 2026-10-23  133   *
5d2b0f2107aa50 Christian Brauner 2026-10-23  134   * With SUPER_LOCK_EXCL s_umount is taken for writing, otherwise for reading.
3af63add349c1a Christian Brauner 2026-10-23  135   *
3af63add349c1a Christian Brauner 2026-10-23  136   * A superblock which is being shut down is not waited for unless
3af63add349c1a Christian Brauner 2026-10-23  137   * SUPER_LOCK_WAIT_SHUTDOWN is passed.  That is for those who have nothing to
3af63add349c1a Christian Brauner 2026-10-23  138   * do on a superblock which is going away, but who promise their caller that
3af63add349c1a Christian Brauner 2026-10-23  139   * what it had to write has been written, or who must not carry on while the
3af63add349c1a Christian Brauner 2026-10-23  140   * filesystem is still being written out.  The wait is over once
3af63add349c1a Christian Brauner 2026-10-23  141   * generic_shutdown_super() is done with @sb, and -ENOENT is still returned.
3af63add349c1a Christian Brauner 2026-10-23  142   *
3af63add349c1a Christian Brauner 2026-10-23  143   * With SUPER_LOCK_KILLABLE all the waiting can be cut short by a fatal
3af63add349c1a Christian Brauner 2026-10-23  144   * signal.  That is only for callers which give up altogether when they are
3af63add349c1a Christian Brauner 2026-10-23  145   * killed.  If what comes after the wait happens either way, the wait must
3af63add349c1a Christian Brauner 2026-10-23  146   * not be cut short.
5d2b0f2107aa50 Christian Brauner 2026-10-23  147   *
5d2b0f2107aa50 Christian Brauner 2026-10-23  148   * The caller must have acquired a temporary reference on @sb->s_passive.
5d2b0f2107aa50 Christian Brauner 2026-10-23  149   *
5d2b0f2107aa50 Christian Brauner 2026-10-23  150   * Return: 0 if SB_BORN was set and with s_umount held. Without s_umount held,
5d2b0f2107aa50 Christian Brauner 2026-10-23  151   *         -ENOENT if the superblock is being shut down or SB_DYING was set,
5d2b0f2107aa50 Christian Brauner 2026-10-23  152   *         -EINTR or -ERESTARTSYS if the task was killed.
5e87491415217d Christian Brauner 2023-08-18  153   */
5d2b0f2107aa50 Christian Brauner 2026-10-23  154  static __must_check int super_lock(struct super_block *sb,
5d2b0f2107aa50 Christian Brauner 2026-10-23  155  				   enum super_lock_flags_t flags)
5e87491415217d Christian Brauner 2023-08-18  156  {
5d2b0f2107aa50 Christian Brauner 2026-10-23  157  	unsigned int state = TASK_UNINTERRUPTIBLE;
5d2b0f2107aa50 Christian Brauner 2026-10-23  158  	int ret;
5d2b0f2107aa50 Christian Brauner 2026-10-23  159  
5d2b0f2107aa50 Christian Brauner 2026-10-23  160  	if (flags & SUPER_LOCK_KILLABLE)
5d2b0f2107aa50 Christian Brauner 2026-10-23  161  		state = TASK_KILLABLE;
be167baa28da9a Josef Bacik       2026-10-21  162  
5e87491415217d Christian Brauner 2023-08-18  163  	lockdep_assert_not_held(&sb->s_umount);
5e87491415217d Christian Brauner 2023-08-18  164  
a99d496efb788a Josef Bacik       2026-10-21  165  	/*
a99d496efb788a Josef Bacik       2026-10-21  166  	 * The last active reference is dropped with s_umount held, which
a99d496efb788a Josef Bacik       2026-10-21  167  	 * stays held until SB_DYING is set, and there is no getting a new
a99d496efb788a Josef Bacik       2026-10-21  168  	 * one.  All there is to find at the end of that wait is SB_DYING,
a99d496efb788a Josef Bacik       2026-10-21  169  	 * and it can be a long one: the filesystem is written out first.
a99d496efb788a Josef Bacik       2026-10-21  170  	 */
a99d496efb788a Josef Bacik       2026-10-21  171  	if (!atomic_read(&sb->s_active))
3af63add349c1a Christian Brauner 2026-10-23  172  		goto dying;
a99d496efb788a Josef Bacik       2026-10-21  173  
b30850c58b5b9b Christian Brauner 2023-11-27  174  	/* wait until the superblock is ready or dying */
5d2b0f2107aa50 Christian Brauner 2026-10-23  175  	ret = super_wait(sb, SB_BORN | SB_DYING, state);
be167baa28da9a Josef Bacik       2026-10-21  176  	if (ret)
be167baa28da9a Josef Bacik       2026-10-21 @177  		return ret;
b30850c58b5b9b Christian Brauner 2023-11-27  178  
b30850c58b5b9b Christian Brauner 2023-11-27  179  	/* Don't pointlessly acquire s_umount. */
b30850c58b5b9b Christian Brauner 2023-11-27  180  	if (super_flags(sb, SB_DYING))
3af63add349c1a Christian Brauner 2026-10-23  181  		goto dying;
b30850c58b5b9b Christian Brauner 2023-11-27  182  
5d2b0f2107aa50 Christian Brauner 2026-10-23  183  	ret = __super_lock(sb, flags);
be167baa28da9a Josef Bacik       2026-10-21  184  	if (ret)
be167baa28da9a Josef Bacik       2026-10-21  185  		return ret;
5e87491415217d Christian Brauner 2023-08-18  186  
5e87491415217d Christian Brauner 2023-08-18  187  	/*
5e87491415217d Christian Brauner 2023-08-18  188  	 * Has gone through generic_shutdown_super() in the meantime.
5e87491415217d Christian Brauner 2023-08-18  189  	 * @sb->s_root is NULL and @sb->s_active is 0. No one needs to
5e87491415217d Christian Brauner 2023-08-18  190  	 * grab a reference to this. Tell them so.
5e87491415217d Christian Brauner 2023-08-18  191  	 */
f0cd988016f679 Christian Brauner 2023-10-24  192  	if (sb->s_flags & SB_DYING) {
5d2b0f2107aa50 Christian Brauner 2026-10-23  193  		super_unlock(sb, flags);
3af63add349c1a Christian Brauner 2026-10-23  194  		goto dying;
f0cd988016f679 Christian Brauner 2023-10-24  195  	}
5e87491415217d Christian Brauner 2023-08-18  196  
b30850c58b5b9b Christian Brauner 2023-11-27  197  	WARN_ON_ONCE(!(sb->s_flags & SB_BORN));
be167baa28da9a Josef Bacik       2026-10-21  198  	return 0;
be167baa28da9a Josef Bacik       2026-10-21  199  
3af63add349c1a Christian Brauner 2026-10-23  200  dying:
3af63add349c1a Christian Brauner 2026-10-23  201  	if (flags & SUPER_LOCK_WAIT_SHUTDOWN) {
3af63add349c1a Christian Brauner 2026-10-23  202  		ret = super_wait(sb, SB_DYING, state);
3af63add349c1a Christian Brauner 2026-10-23  203  		if (ret)
3af63add349c1a Christian Brauner 2026-10-23  204  			return ret;
c61f54949db7b5 Josef Bacik       2026-10-21  205  	}
3af63add349c1a Christian Brauner 2026-10-23  206  	return -ENOENT;
6174e0c41df7a7 Josef Bacik       2026-10-21  207  }
6174e0c41df7a7 Josef Bacik       2026-10-21  208  

:::::: The code at line 177 was first introduced by commit
:::::: be167baa28da9a1df7fe384c4edeb9fb1c07772d fs: make a mount waiting on another mount killable

:::::: TO: Josef Bacik <josef@toxicpanda.com>
:::::: CC: Christian Brauner <brauner@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
