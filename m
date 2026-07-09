Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0469733ADA3
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 21:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783630893; cv=none; b=gPvKZ2m5Q4iADX8s/vKbQD99rjrH/o2EXtF/WmNc8Liny5Exid/p2j+Mv+EPEAwMtbWNKXd87xR8rZYTjXOTfXU2D5cT5OF5T0VEOEOtzVwAnxzqPpppL5BbM6DnaSife0lo2Du1+xVVru8v6LwwhOIlKo3tMODfoJx0hJ2LOKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783630893; c=relaxed/simple;
	bh=s1jbM4fH0Y94O5d0sk7XaDgCvMiMCxrH4WOEwAdQaM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kPtuL6jF65b6EpDLDjf1S+lHe1aGGHFXerdrIGwU2y/jg4XpRqJf7CrZ05sa5IEB2ZO/sQGEgvqx7bCASTMnWpjKtmbbo4DeJBlcsylWpkNx8XpZ9VD9qI5ybPVDIGVjx0YWfhGqSEmGrsZegafuhYZZDu14fNdtmKp3jfzQSVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=juHipcMU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="juHipcMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783630891; x=1815166891;
  h=date:from:to:cc:subject:message-id;
  bh=s1jbM4fH0Y94O5d0sk7XaDgCvMiMCxrH4WOEwAdQaM0=;
  b=juHipcMU2rVnSqhX/5ibkXyI6pFHEfC/05FLrdPBE9SciNM61lZGT11l
   t0PAQY33bXb7vFVqGovaSwMEce2FPKRVP39WugUSM+4dJ3yloa/oAMRu0
   CNq99zQRqnnMBNm30valJjcs22IX61jvcHy9XPACW8GH8Izuybp96p32N
   W7NZgh/4X9oGv6DctfP/Dw5QIZ1kOWsXlYlvsB1JyNQ5CTIdKb9+ARz+R
   tqS5VNfeAv+XPuT4oxBB+990NtvaD2cVgiwQxAvDXnpYJKetIgj61TB8r
   9kLyI6Zu8dfiEUsxt0JCb4IshNi1r6cCu3lrJJxN0hin3fn9gfyrphArZ
   g==;
X-CSE-ConnectionGUID: so9lHyCfRyapJmdDg5aKyQ==
X-CSE-MsgGUID: 1QJacBhNTiyeW7wa4BTZwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88158074"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88158074"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 14:01:30 -0700
X-CSE-ConnectionGUID: 5RgjpgABRV+zDRh83Q+0Ew==
X-CSE-MsgGUID: OU4mwrraQky2yCsM5BYKIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255347643"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 09 Jul 2026 14:01:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whvs6-00000000I8Z-19dY;
	Thu, 09 Jul 2026 21:01:26 +0000
Date: Fri, 10 Jul 2026 05:01:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [chrome-os:chromeos-6.6 58/58] fs/eventpoll.c:1015:2-11:
 second lock on line 1000
Message-ID: <202607100414.Z0ou7Sj8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   e6b498a810705c8763e0d87b16a41ff43b253489
commit: b76f18ffc7719b98cf9c7866e300cfa7da899d4f [58/58] FROMGIT: eventpoll: kill __ep_remove()
:::::: branch date: 15 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-r064-20260710 (https://download.01.org/0day-ci/archive/20260710/202607100414.Z0ou7Sj8-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607100414.Z0ou7Sj8-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/eventpoll.c:1015:2-11: second lock on line 1000

vim +1015 fs/eventpoll.c

7699acd1341c63f Davide Libenzi    2007-05-10   982  
b611967de4dc5c5 Davide Libenzi    2006-10-11   983  /*
7699acd1341c63f Davide Libenzi    2007-05-10   984   * This is called from eventpoll_release() to unlink files from the eventpoll
7699acd1341c63f Davide Libenzi    2007-05-10   985   * interface. We need to have this facility to cleanup correctly files that are
7699acd1341c63f Davide Libenzi    2007-05-10   986   * closed without being removed from the eventpoll interface.
b611967de4dc5c5 Davide Libenzi    2006-10-11   987   */
7699acd1341c63f Davide Libenzi    2007-05-10   988  void eventpoll_release_file(struct file *file)
b611967de4dc5c5 Davide Libenzi    2006-10-11   989  {
7699acd1341c63f Davide Libenzi    2007-05-10   990  	struct eventpoll *ep;
44cdc1d952e3f7a Al Viro           2020-09-27   991  	struct epitem *epi;
58c9b016e128552 Paolo Abeni       2023-03-22   992  	bool dispose;
58c9b016e128552 Paolo Abeni       2023-03-22   993  
58c9b016e128552 Paolo Abeni       2023-03-22   994  	/*
58c9b016e128552 Paolo Abeni       2023-03-22   995  	 * Use the 'dying' flag to prevent a concurrent ep_clear_and_put() from
58c9b016e128552 Paolo Abeni       2023-03-22   996  	 * touching the epitems list before eventpoll_release_file() can access
58c9b016e128552 Paolo Abeni       2023-03-22   997  	 * the ep->mtx.
58c9b016e128552 Paolo Abeni       2023-03-22   998  	 */
58c9b016e128552 Paolo Abeni       2023-03-22   999  again:
58c9b016e128552 Paolo Abeni       2023-03-22 @1000  	spin_lock(&file->f_lock);
58c9b016e128552 Paolo Abeni       2023-03-22  1001  	if (file->f_ep && file->f_ep->first) {
58c9b016e128552 Paolo Abeni       2023-03-22  1002  		epi = hlist_entry(file->f_ep->first, struct epitem, fllink);
b76f18ffc7719b9 Christian Brauner 2026-06-26  1003  		WRITE_ONCE(epi->dying, true);
58c9b016e128552 Paolo Abeni       2023-03-22  1004  		spin_unlock(&file->f_lock);
58c9b016e128552 Paolo Abeni       2023-03-22  1005  
58c9b016e128552 Paolo Abeni       2023-03-22  1006  		/*
58c9b016e128552 Paolo Abeni       2023-03-22  1007  		 * ep access is safe as we still own a reference to the ep
58c9b016e128552 Paolo Abeni       2023-03-22  1008  		 * struct
b611967de4dc5c5 Davide Libenzi    2006-10-11  1009  		 */
7699acd1341c63f Davide Libenzi    2007-05-10  1010  		ep = epi->ep;
58c9b016e128552 Paolo Abeni       2023-03-22  1011  		mutex_lock(&ep->mtx);
b76f18ffc7719b9 Christian Brauner 2026-06-26  1012  
b76f18ffc7719b9 Christian Brauner 2026-06-26  1013  		ep_unregister_pollwait(ep, epi);
b76f18ffc7719b9 Christian Brauner 2026-06-26  1014  
b76f18ffc7719b9 Christian Brauner 2026-06-26 @1015  		spin_lock(&file->f_lock);
b76f18ffc7719b9 Christian Brauner 2026-06-26  1016  		__ep_remove_file(ep, epi, file);
b76f18ffc7719b9 Christian Brauner 2026-06-26  1017  		dispose = __ep_remove_epi(ep, epi);
b76f18ffc7719b9 Christian Brauner 2026-06-26  1018  
d47de16c7221968 Davide Libenzi    2007-05-15  1019  		mutex_unlock(&ep->mtx);
58c9b016e128552 Paolo Abeni       2023-03-22  1020  
521e9ff0b67c66a Linus Torvalds    2025-07-09  1021  		if (dispose && ep_refcount_dec_and_test(ep))
58c9b016e128552 Paolo Abeni       2023-03-22  1022  			ep_free(ep);
58c9b016e128552 Paolo Abeni       2023-03-22  1023  		goto again;
b611967de4dc5c5 Davide Libenzi    2006-10-11  1024  	}
58c9b016e128552 Paolo Abeni       2023-03-22  1025  	spin_unlock(&file->f_lock);
b611967de4dc5c5 Davide Libenzi    2006-10-11  1026  }
b611967de4dc5c5 Davide Libenzi    2006-10-11  1027  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
