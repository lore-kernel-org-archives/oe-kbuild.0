Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792961318;
	b=NaYYvR2U60nMIdmjyOWNSscmVVCMjYQCoY7uI3UayvBcEONlNHK0GT3VLfU+3bR0yWVe
	 b2uI0x74lqcoTHiQRNY/zpLq8LXc1eZ2ENF6GxpdiJfLvpU/THvY5tAWKX8jMvnLSVA+g
	 RhIYsqxs8ZMlJsYMbBi8ModVkSGvyWrqM14wz3Pv9L2/6Qt8Pjx4I/tn2kCfv+v/iegrO
	 9+m8QVx+cZCo6r0MoHNE/fT2JcBRyBmKZwdzOJjzod+/wrtdR6WeWNU5NQhS2vMQ6Aab5
	 Ff2Dpb3XlifN4sqCY7tQGoVy+sDoaiooaz+h933xMOz22ffm+mBgxGNmPHxeIypMfCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792961318;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=N0MSafSKb9zKxSCsJwtqH+cHPhvH0fY86FiWCABBus0=;
	b=pGB7oVeIsKD6je9y6siEEl5fCKo/Kv6n9TpaRPNoqDKynU31E+k3jBNbPKJRY6TMVa2u
	 0qGGCdC8pd8B2Xlg/nHaGGEM92CMf87cp8G5FH8F//hiHx7nTLymJiizQiUSMnIn4MM1+
	 oyP9x/TlXgCue2r49HHHF9kFjoyNy6LKIcPeGtHKbiPZkLRfPGBFXUTJFUU5GPbXSUJGy
	 talWu9xS34ykStR7KcQu50mDippWFRyqRzAS8Y7SuvIMwJeFD/HL2L76Kqsk59B7O5Dwm
	 jy/8CK5pTDN7616uiGp9XXuLyNUUKnEoCB9fELD14hfnkYSQMONpDoD55RUY4ZlS8wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DOgc6Ym9;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F608606A31A
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Oct 2026 20:48:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F608606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DOgc6Ym9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792961316; x=1824497316;
  h=date:from:to:cc:subject:message-id;
  bh=z+xBmNglPigfckLq8EMeFGdD76ZjWQyjcuJLuTligC8=;
  b=DOgc6Ym9lADl2Hu5rFFQoJpoE6xQ/4CLaUBy5dFP0LNwF4tYR+6ZE+ph
   vj50hakS3xi7sFb/Abk+88HEE6BRJlTeOSAiFq63mPgvucv54k1h0sIEG
   vIeCUNmqonpp8+Iux39DRwUe0bV28Wr0XXMoK5i1KfeQRN3keCGapkKlY
   iTN5C/Tkv5428tCpdSFHPvEEH8mL30W/1jfmspBzNzu90O4J8HrARFGKv
   vlPYWhGsrWtafdGR2Ev5vro4V+DsT2Axl7TCf4PfWj4DrVEusQntD55bh
   NnWRQ8UGG+MvviSgIJNs5zfuMN1Cg88U1EYMX0Cvh7RU+2eF6sVW0uZly
   w==;
X-CSE-ConnectionGUID: LENqGDcRTc+ORXZ4jRzuhA==
X-CSE-MsgGUID: u0oqmm8lT5mEFMTlfe+UwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1632725"
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="1632725"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2026 13:48:36 -0700
X-CSE-ConnectionGUID: 3FVeJRmFRh6GYuDB2ChIRQ==
X-CSE-MsgGUID: H+uCmSfTRVuNlDLaXY21Kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,178,1787036400"; 
   d="scan'208";a="4114407"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 25 Oct 2026 13:48:35 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xL58q-000000003p1-2pmK;
	Sun, 25 Oct 2026 20:48:32 +0000
Date: Sun, 25 Oct 2026 21:48:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android13-5.15-lts 2/2]
 fs/eventpoll.c:1009:2-11: second lock on line 994
Message-ID: <202610252137.KYEUgiaP-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15-lts
head:   28ca5d8b733ed5c4ea847e57cc94f90cfa929e94
commit: 9208957e850335d35905a45e0041c09aac9ea5fb [2/2] UPSTREAM: eventpoll: kill __ep_remove()
:::::: branch date: 10 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-2102-20261025 (https://download.01.org/0day-ci/archive/20261025/202610252137.KYEUgiaP-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project a808f8ea7fdc61ead417bfe55e8ef5f728776aeb)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610252137.KYEUgiaP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/eventpoll.c:1009:2-11: second lock on line 994

vim +1009 fs/eventpoll.c

7699acd1341c63 Davide Libenzi    2007-05-10   976  
b611967de4dc5c Davide Libenzi    2006-10-11   977  /*
7699acd1341c63 Davide Libenzi    2007-05-10   978   * This is called from eventpoll_release() to unlink files from the eventpoll
7699acd1341c63 Davide Libenzi    2007-05-10   979   * interface. We need to have this facility to cleanup correctly files that are
7699acd1341c63 Davide Libenzi    2007-05-10   980   * closed without being removed from the eventpoll interface.
b611967de4dc5c Davide Libenzi    2006-10-11   981   */
7699acd1341c63 Davide Libenzi    2007-05-10   982  void eventpoll_release_file(struct file *file)
b611967de4dc5c Davide Libenzi    2006-10-11   983  {
7699acd1341c63 Davide Libenzi    2007-05-10   984  	struct eventpoll *ep;
44cdc1d952e3f7 Al Viro           2020-09-27   985  	struct epitem *epi;
f2451def095c17 Paolo Abeni       2023-03-22   986  	bool dispose;
f2451def095c17 Paolo Abeni       2023-03-22   987  
f2451def095c17 Paolo Abeni       2023-03-22   988  	/*
f2451def095c17 Paolo Abeni       2023-03-22   989  	 * Use the 'dying' flag to prevent a concurrent ep_clear_and_put() from
f2451def095c17 Paolo Abeni       2023-03-22   990  	 * touching the epitems list before eventpoll_release_file() can access
f2451def095c17 Paolo Abeni       2023-03-22   991  	 * the ep->mtx.
f2451def095c17 Paolo Abeni       2023-03-22   992  	 */
f2451def095c17 Paolo Abeni       2023-03-22   993  again:
f2451def095c17 Paolo Abeni       2023-03-22  @994  	spin_lock(&file->f_lock);
f2451def095c17 Paolo Abeni       2023-03-22   995  	if (file->f_ep && file->f_ep->first) {
f2451def095c17 Paolo Abeni       2023-03-22   996  		epi = hlist_entry(file->f_ep->first, struct epitem, fllink);
9208957e850335 Christian Brauner 2026-09-29   997  		WRITE_ONCE(epi->dying, true);
f2451def095c17 Paolo Abeni       2023-03-22   998  		spin_unlock(&file->f_lock);
f2451def095c17 Paolo Abeni       2023-03-22   999  
f2451def095c17 Paolo Abeni       2023-03-22  1000  		/*
f2451def095c17 Paolo Abeni       2023-03-22  1001  		 * ep access is safe as we still own a reference to the ep
f2451def095c17 Paolo Abeni       2023-03-22  1002  		 * struct
b611967de4dc5c Davide Libenzi    2006-10-11  1003  		 */
7699acd1341c63 Davide Libenzi    2007-05-10  1004  		ep = epi->ep;
f2451def095c17 Paolo Abeni       2023-03-22  1005  		mutex_lock(&ep->mtx);
9208957e850335 Christian Brauner 2026-09-29  1006  
9208957e850335 Christian Brauner 2026-09-29  1007  		ep_unregister_pollwait(ep, epi);
9208957e850335 Christian Brauner 2026-09-29  1008  
9208957e850335 Christian Brauner 2026-09-29 @1009  		spin_lock(&file->f_lock);
9208957e850335 Christian Brauner 2026-09-29  1010  		__ep_remove_file(ep, epi, file);
9208957e850335 Christian Brauner 2026-09-29  1011  		dispose = __ep_remove_epi(ep, epi);
9208957e850335 Christian Brauner 2026-09-29  1012  
d47de16c722196 Davide Libenzi    2007-05-15  1013  		mutex_unlock(&ep->mtx);
f2451def095c17 Paolo Abeni       2023-03-22  1014  
c36fff461c90c6 Linus Torvalds    2025-07-09  1015  		if (dispose && ep_refcount_dec_and_test(ep))
f2451def095c17 Paolo Abeni       2023-03-22  1016  			ep_free(ep);
f2451def095c17 Paolo Abeni       2023-03-22  1017  		goto again;
b611967de4dc5c Davide Libenzi    2006-10-11  1018  	}
f2451def095c17 Paolo Abeni       2023-03-22  1019  	spin_unlock(&file->f_lock);
b611967de4dc5c Davide Libenzi    2006-10-11  1020  }
b611967de4dc5c Davide Libenzi    2006-10-11  1021  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
