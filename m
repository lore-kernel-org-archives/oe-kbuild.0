Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4558312803
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Nov 2025 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763404780; cv=none; b=iDZ+Wq6we6vrigeoKo8tTvuwnJtk9IC1CdlMuIHfubrK6KVWQeDLi32/KmahshiU5c9+Vd7+w9w9Noyg0+ZFTefAaSr4rSLy5v4QI8w+ZASVTVL5aSMv3R+5MA10xtipazgJT4pPKwPOygZbFUiDf95nkUnrQU9jSjBxkbWZTjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763404780; c=relaxed/simple;
	bh=X4P9kABVpjQNtVyqfyX8PasIJ6lb4zHZJsacsLVuO9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ikWJqGmZpQ5+dJ5VLYKZwoXzdMzmiGnFUMUWUupfdQYgPwlqsZaDn8FwYcgPDzSTCgSHrPPgC+1z/g7uiz2uqhL9boKytmKQO+Dr07GEwxzgW261cR4j5z11OHucZUsQYunDPUR6ZQKlrgKC7A7SDli+lxZcktpaxxEEoS9KkEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WmJDB2Ya; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WmJDB2Ya"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763404778; x=1794940778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X4P9kABVpjQNtVyqfyX8PasIJ6lb4zHZJsacsLVuO9s=;
  b=WmJDB2YaziFWdNIjVgGTLcFviR+pkTQeKF89ILVP5kf4FblMFPQCbxpI
   TGq+KxzckENzPFvM/NPwNLoNAFmE1UeQ/1DHHEB3MSIQNOyn0Ku7JBW5h
   6Mt9+7tCT+3gnLbQPLOFtqdjXuSMRBBPpJcEmW2Sm/64LlSxqsmzDwVuw
   FQecS4M47nV7s8ZzmIvqiAYqaXtabT0io+26Hb+h4xe9GS0vTgKxCgHv8
   iNUPZ4WBf7+DBtzqpkSoqDMBl6gdo9PRPrUs4BFXKMtH01dGfpC9IBz5C
   q3jeUD8fQPadbGQ4O/wyZ/ADqTcBGjN9pyO9e900ocP1ae85AwvcqWAKw
   g==;
X-CSE-ConnectionGUID: Ip4NUml7TfWaBbN+LQ0r/A==
X-CSE-MsgGUID: p3TJx0mnQ7SY4YkUxSSeWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="69262103"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="69262103"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 10:39:38 -0800
X-CSE-ConnectionGUID: blWxTJ7WTY2hZK4Q3GxPrQ==
X-CSE-MsgGUID: 3zRKUdlkR42iTby6OHTwiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="189814834"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Nov 2025 10:39:37 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL48U-0000wN-30;
	Mon, 17 Nov 2025 18:39:34 +0000
Date: Tue, 18 Nov 2025 02:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [melver:ctx-analysis/dev 23/35] drivers/s390/char/con3215.c:871
 con3215_notify() error: uninitialized symbol 'flags'.
Message-ID: <202511180208.3QZn5zQi-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   171c60881ab1f2e223402792a86f1241143252ad
commit: 40ec378c19b6cf8b1de72e4bd43f2848ac61fcde [23/35] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: s390-randconfig-r073-20251117 (https://download.01.org/0day-ci/archive/20251118/202511180208.3QZn5zQi-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511180208.3QZn5zQi-lkp@intel.com/

New smatch warnings:
drivers/s390/char/con3215.c:871 con3215_notify() error: uninitialized symbol 'flags'.
drivers/s390/char/con3270.c:2126 con3270_notify() error: uninitialized symbol 'flags'.
arch/s390/kernel/debug.c:1203 debug_event_common() error: uninitialized symbol 'flags'.
arch/s390/kernel/debug.c:1236 debug_exception_common() error: uninitialized symbol 'flags'.
arch/s390/kernel/debug.c:1284 __debug_sprintf_event() error: uninitialized symbol 'flags'.
arch/s390/kernel/debug.c:1320 __debug_sprintf_exception() error: uninitialized symbol 'flags'.
arch/s390/kernel/lgr.c:147 lgr_info_log() error: uninitialized symbol 'flags'.

Old smatch warnings:
drivers/s390/char/con3270.c:1665 tty3270_escape_sequence() warn: format string contains unusual character '\x1b'

vim +/flags +871 drivers/s390/char/con3215.c

^1da177e4c3f41 Linus Torvalds       2005-04-16  852  
^1da177e4c3f41 Linus Torvalds       2005-04-16  853  /*
4ae46db99cd884 Guilherme G. Piccoli 2022-04-27  854   * The below function is called as a panic/reboot notifier before the
4ae46db99cd884 Guilherme G. Piccoli 2022-04-27  855   * system enters a disabled, endless loop.
4ae46db99cd884 Guilherme G. Piccoli 2022-04-27  856   *
4ae46db99cd884 Guilherme G. Piccoli 2022-04-27  857   * Notice we must use the spin_trylock() alternative, to prevent lockups
4ae46db99cd884 Guilherme G. Piccoli 2022-04-27  858   * in atomic context (panic routine runs with secondary CPUs, local IRQs
4ae46db99cd884 Guilherme G. Piccoli 2022-04-27  859   * and preemption disabled).
^1da177e4c3f41 Linus Torvalds       2005-04-16  860   */
4ae46db99cd884 Guilherme G. Piccoli 2022-04-27  861  static int con3215_notify(struct notifier_block *self,
4ae46db99cd884 Guilherme G. Piccoli 2022-04-27  862  			  unsigned long event, void *data)
^1da177e4c3f41 Linus Torvalds       2005-04-16  863  {
^1da177e4c3f41 Linus Torvalds       2005-04-16  864  	struct raw3215_info *raw;
^1da177e4c3f41 Linus Torvalds       2005-04-16  865  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds       2005-04-16  866  
^1da177e4c3f41 Linus Torvalds       2005-04-16  867  	raw = raw3215[0];  /* console 3215 is the first one */
4ae46db99cd884 Guilherme G. Piccoli 2022-04-27  868  	if (!spin_trylock_irqsave(get_ccwdev_lock(raw->cdev), flags))
4ae46db99cd884 Guilherme G. Piccoli 2022-04-27  869  		return NOTIFY_DONE;
1f3307cf3aac88 Thomas Richter       2022-09-20  870  	raw3215_make_room(raw, RAW3215_BUFFER_SIZE, false);
520a4e3728c214 Martin Schwidefsky   2006-12-04 @871  	spin_unlock_irqrestore(get_ccwdev_lock(raw->cdev), flags);
^1da177e4c3f41 Linus Torvalds       2005-04-16  872  
4ae46db99cd884 Guilherme G. Piccoli 2022-04-27  873  	return NOTIFY_DONE;
2332ce1a97963b Holger Smolinski     2008-10-10  874  }
2332ce1a97963b Holger Smolinski     2008-10-10  875  

:::::: The code at line 871 was first introduced by commit
:::::: 520a4e3728c214db6e91ade7b70443c2b9382de0 [S390] 3215 device locking.

:::::: TO: Martin Schwidefsky <schwidefsky@de.ibm.com>
:::::: CC: Martin Schwidefsky <schwidefsky@de.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
