Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1628E29BDA2
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765444313; cv=none; b=c0e0qj+a5f30QYTb4JgA9BTPlolHj17mgeuQJ6s6BbzmHDj1cUM9BtcMqM64B1+eK6eaGxVorl6JG7eZdKfMDHFxi9MQ2iCHO0v9TiIhHqH7BdS7hQUv+SjhBlxQBvEHA3EHB65VdCMLMG/ViUGfsPRMCchAMI+cfAKI7yGUNFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765444313; c=relaxed/simple;
	bh=P1tpo6pQWIEiqvuGHorcBaY2bxUX3CIPZqHctF7yPHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yhi/ZnZ6/885i2ZIv/loOyIo9I7bqOGsa+vixnx7bdHYpNXs5Cjygi8XotCh82wvM2iDupx0Fax4+3Wq1sbpYBuQDlPLFR2clM2/j1QNM6WEOrBggIs7fgjKbN0dJoKfg9gl0zC3qyhG2EyH1nztK+TrVywNZri6bjKV8oCzaUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFOeUVDM; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFOeUVDM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765444312; x=1796980312;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P1tpo6pQWIEiqvuGHorcBaY2bxUX3CIPZqHctF7yPHM=;
  b=bFOeUVDMKlHWXlJIteiITalUJ+YNNP4N6WEtRO4fWg4LKTn8BSGFoYh1
   R6s/gf87H0jIZUlbUvEUAfDiHcKB5DTe9TgQ+skYHhnU2oODcErIkRK/1
   V8YxgyCyyWp/wy1l0tekw8DWk5mkheDuEEnW8QuS09lbVdB40cA0j32gI
   tS7rvOIc5r3GrQZ456PaYndfVl2kczsgyci2dpI43ZSisurIUfPqnX9V9
   q695kkFhT9EythyvQx1/cG9ZRQ/sff7/W4lZCyx4hu4os1sWfTQ6ZMxHd
   N6Dqwu598r/8/S/ZcU8d++uiFtNvk4BxyG+ybCsLw0hvcrlF4UajML1VM
   Q==;
X-CSE-ConnectionGUID: opqv7gAxRqCZiIgWcKQTVQ==
X-CSE-MsgGUID: WkdO2Ck0SjeV7Qsa/QO3Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="54970533"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="54970533"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 01:11:52 -0800
X-CSE-ConnectionGUID: Gl9xdBm2Q+aFj3W7Jh7iFA==
X-CSE-MsgGUID: GDWp3VT0QnqBLcwURbdJMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="197574952"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Dec 2025 01:11:50 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTciC-000000004Rn-163U;
	Thu, 11 Dec 2025 09:11:48 +0000
Date: Thu, 11 Dec 2025 17:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/file.c:1340 replace_fd() warn: inconsistent returns
 '&files->file_lock'.
Message-ID: <202512111738.E1nJl76a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 708c04a5c2b78e22f56e2350de41feba74dfccd9 fs: always return zero on success from replace_fd()
date:   4 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 months ago
config: i386-randconfig-r071-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111738.E1nJl76a-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512111738.E1nJl76a-lkp@intel.com/

smatch warnings:
fs/file.c:1340 replace_fd() warn: inconsistent returns '&files->file_lock'.

vim +1340 fs/file.c

8280d161722437 Al Viro           2012-08-21  1317  
8280d161722437 Al Viro           2012-08-21  1318  int replace_fd(unsigned fd, struct file *file, unsigned flags)
8280d161722437 Al Viro           2012-08-21  1319  {
8280d161722437 Al Viro           2012-08-21  1320  	int err;
8280d161722437 Al Viro           2012-08-21  1321  	struct files_struct *files = current->files;
8280d161722437 Al Viro           2012-08-21  1322  
8280d161722437 Al Viro           2012-08-21  1323  	if (!file)
8760c909f54a82 Eric W. Biederman 2020-11-20  1324  		return close_fd(fd);
8280d161722437 Al Viro           2012-08-21  1325  
8280d161722437 Al Viro           2012-08-21  1326  	if (fd >= rlimit(RLIMIT_NOFILE))
08f05c49749ee6 Al Viro           2012-10-31  1327  		return -EBADF;
8280d161722437 Al Viro           2012-08-21  1328  
8280d161722437 Al Viro           2012-08-21  1329  	spin_lock(&files->file_lock);
8280d161722437 Al Viro           2012-08-21  1330  	err = expand_files(files, fd);
8280d161722437 Al Viro           2012-08-21  1331  	if (unlikely(err < 0))
8280d161722437 Al Viro           2012-08-21  1332  		goto out_unlock;
708c04a5c2b78e Thomas Weiﬂschuh  2025-08-05  1333  	err = do_dup2(files, file, fd, flags);
708c04a5c2b78e Thomas Weiﬂschuh  2025-08-05  1334  	if (err < 0)
708c04a5c2b78e Thomas Weiﬂschuh  2025-08-05  1335  		return err;
708c04a5c2b78e Thomas Weiﬂschuh  2025-08-05  1336  	return 0;
8280d161722437 Al Viro           2012-08-21  1337  
8280d161722437 Al Viro           2012-08-21  1338  out_unlock:
8280d161722437 Al Viro           2012-08-21  1339  	spin_unlock(&files->file_lock);
8280d161722437 Al Viro           2012-08-21 @1340  	return err;
8280d161722437 Al Viro           2012-08-21  1341  }
8280d161722437 Al Viro           2012-08-21  1342  

:::::: The code at line 1340 was first introduced by commit
:::::: 8280d16172243702ed43432f826ca6130edb4086 new helper: replace_fd()

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
