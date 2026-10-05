Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F7C36DA0A
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 18:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791226061; cv=none; b=lFTSsv3ObTdHqYR+ae4VNSwNQo68ZcbNHujoiJlLrwU6N+V9cepiuIEe5JoowSUXWNvRjGqXEfwQRwBlNHqBrViSxs556eXnnfdgMfEXPvfav8uQAcExEALEpI50lfy4sMsudTKYvyMKLg9J/X0lLsFrrb08jBX+ZY0eXHushko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791226061; c=relaxed/simple;
	bh=ot+SDDyGYWb0hmgC9BI7BaH+jCid9QFvmXYiZ7w2F1Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=psUpj3wI05leUo0LxQmji5EGdvkzY2U8rWGvaoDGZfCH+11rIApYEbFwFdBtQq5+iD+tNnQPA7gwtivvvRe4GOGgOTPcY59D0Oim5iC0sua1BXuZ+nbrCy5pvRTFXtdWMdGJK+435NeoSQ9Lgo9AnP16rueQOdFcQRPVJAw+cf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RiH27z8g; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiH27z8g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791226060; x=1822762060;
  h=date:from:to:cc:subject:message-id;
  bh=ot+SDDyGYWb0hmgC9BI7BaH+jCid9QFvmXYiZ7w2F1Y=;
  b=RiH27z8gDGv87kx2qvQDxmEEoJZlTo9LIB3VMt8giSYqFkix9Xz91Nti
   S/nFliPnL909K4+njGYELJ7E54f9BUNnFI0YxOZYEf6aSxeV9R82RyxAM
   7bH243Ql8QaLgjwQmIBpURDuC7P3+jbSBXQ30oGMZmXjULCmHl3WhF3Jg
   jUOdNv2Bqm5q9ZJZTpSwBacZ1q4GSxurtleWbzoGwneWNnLvF5RZK3AKw
   pSORYKo5uguvuVdI+E+NgcPnk6gKs7CJvwp2Y74kjkMYsdfBJkxnXgHO/
   MZRAwPlFJSY+MKDv4+fUFSrzsxR0hKtRoNN4pw2mtRNt5RL3EvojzXTVW
   Q==;
X-CSE-ConnectionGUID: o9gZxGP7QCGWRJSOow+xGg==
X-CSE-MsgGUID: xp3EIXcjQ2q5voC6XeFp6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94616168"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="94616168"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 11:47:38 -0700
X-CSE-ConnectionGUID: eO133qfNSE++b4GdLkliHw==
X-CSE-MsgGUID: hB434l6DSB6BdHT+KGjIYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="273294836"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 05 Oct 2026 11:47:36 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDnio-000000000Gj-2kNS;
	Mon, 05 Oct 2026 18:47:34 +0000
Date: Mon, 05 Oct 2026 20:46:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/smb/smbdirect/mr.c:129:2-12: second lock on line 129
Message-ID: <202610052030.0N95LYJg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Stefan Metzmacher <metze@samba.org>
CC: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   67f0943b394d920b6c142aad8c6af94340342ae7
commit: 1249c01aa42160e40bc765ba5a3cde751491ff0a smb: smbdirect: move fs/smb/common/smbdirect/ to fs/smb/smbdirect/
date:   6 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 6 months ago
config: sparc64-randconfig-r2103-20261005 (https://download.01.org/0day-ci/archive/20261005/202610052030.0N95LYJg-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 195c81658995a4b7531c30a12c5aef6cf2bbd671)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1249c01aa421 ("smb: smbdirect: move fs/smb/common/smbdirect/ to fs/smb/smbdirect/")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610052030.0N95LYJg-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/smbdirect/mr.c:129:2-12: second lock on line 129
--
>> fs/smb/smbdirect/mr.c:492:0-1: preceding lock on line 414
   fs/smb/smbdirect/mr.c:381:1-7: preceding lock on line 291

vim +129 fs/smb/smbdirect/mr.c

de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  117  
89df0942907894a fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-10-27  118  void smbdirect_connection_destroy_mr_list(struct smbdirect_socket *sc)
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  119  {
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  120  	struct smbdirect_mr_io *mr, *tmp;
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  121  	LIST_HEAD(all_list);
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  122  	unsigned long flags;
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  123  
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  124  	spin_lock_irqsave(&sc->mr_io.all.lock, flags);
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  125  	list_splice_tail_init(&sc->mr_io.all.list, &all_list);
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  126  	spin_unlock_irqrestore(&sc->mr_io.all.lock, flags);
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  127  
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  128  	list_for_each_entry_safe(mr, tmp, &all_list, list) {
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19 @129  		mutex_lock(&mr->mutex);
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  130  
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  131  		smbdirect_mr_io_disable_locked(mr);
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  132  		list_del(&mr->list);
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  133  		mr->socket = NULL;
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  134  
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  135  		/*
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  136  		 * No kref_put_mutex() as it's already locked.
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  137  		 *
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  138  		 * If smbdirect_mr_io_free_locked() is called
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  139  		 * and the mutex is unlocked and mr is gone,
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  140  		 * in that case kref_put() returned 1.
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  141  		 *
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  142  		 * If kref_put() returned 0 we know that
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  143  		 * smbdirect_mr_io_free_locked() didn't
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  144  		 * run. Not by us nor by anyone else, as we
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  145  		 * still hold the mutex, so we need to unlock.
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  146  		 *
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  147  		 * If the mr is still registered it will
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  148  		 * be dangling (detached from the connection
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  149  		 * waiting for smbd_deregister_mr() to be
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  150  		 * called in order to free the memory.
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  151  		 */
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  152  		if (!kref_put(&mr->kref, smbdirect_mr_io_free_locked))
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  153  			mutex_unlock(&mr->mutex);
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  154  	}
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  155  }
de5ef8ec3c4694b fs/smb/common/smbdirect/smbdirect_mr.c Stefan Metzmacher 2025-09-19  156  

:::::: The code at line 129 was first introduced by commit
:::::: de5ef8ec3c4694b9ad665eeea7321202a85474b6 smb: smbdirect: introduce smbdirect_mr.c with client mr code

:::::: TO: Stefan Metzmacher <metze@samba.org>
:::::: CC: Steve French <stfrench@microsoft.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
