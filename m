Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED14614A4F9
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 12:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741350969; cv=none; b=NnTRfWGdX/7AzBdIgWVYCxFNQxJ54peSmtl7ac53cKOpZNe6wdoanQ7twFVb9Guq5+tT/d5TLXTnH+CGb2dLJh2COpzc8yvRefOE0Z9LnIPVvASj3hNmQUwnhg1/PDPsFa50UZE3lGv9sGGJ2NhNNExxBt2DkkYZldlhxzqzNkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741350969; c=relaxed/simple;
	bh=CAo2t1OI2tTJlndjOM/tRLe3Pvy8fEMhB6pfYRKsOCU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n7Oy16gu4vs5FydKKej5UzgPUyVyzQN+REQYhwK7ulgmW37k8yKlpNh9fS+ULuvyxtGVQZrJC4I6l0+Zd3ksLiezH9fV0Qa2vJDA1qZkWKii13C1jn/dIksa8gatSeI7W8DXzQZmfUe/fmA+4hNTkX+6R4B82rsRSVTGv6yULcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uwx+0eQ+; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uwx+0eQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741350967; x=1772886967;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CAo2t1OI2tTJlndjOM/tRLe3Pvy8fEMhB6pfYRKsOCU=;
  b=Uwx+0eQ+DWzZ+repf3vBlDDJxl5BVumCyPyNEIH7SCJ8A4WtpRCoYt9p
   YczF5TQCGL6JzE3ShnYnAUGy/+lfyV3kh9ctEgYeYxJ2TJnxzUBX5Jgy+
   hI5r1cfYV1ibVmvlg1pkwC5k0MuQgqFau8DDaH+eK3DUn51Gl7y6cbLxz
   ldSUYgs4NRaXTxULtNFsbt2INN3XMlATHGx40f58xNNur8kbL8h8AZ41e
   baEjAtRRe9KUld6kEs3/GSHhbXHfXZ0xgjiDzrrsZxA9CvGFM2pPoWMYL
   5ysaZzyQFNiy2QuhvWnxI6wOtPEUWVLOeLrcVBb9bh9bk2rZOh4Pbsng/
   A==;
X-CSE-ConnectionGUID: dVjfRDIcSBKGLW3nJawTKw==
X-CSE-MsgGUID: vvGUASWgRMOF2kiiBHusAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="64837776"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="64837776"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 04:36:06 -0800
X-CSE-ConnectionGUID: 6y+xpk7tThWpF8wOEIB87w==
X-CSE-MsgGUID: T6HK1pztROKRa1dM0j89Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="142542877"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Mar 2025 04:36:05 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqWvq-0000Ta-36;
	Fri, 07 Mar 2025 12:36:02 +0000
Date: Fri, 7 Mar 2025 20:35:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 8204/9634] fs/nfsd/nfs4state.c:3235
 nfs4_cb_getattr() warn: set_bit() takes a bit number
Message-ID: <202503072054.8X4dthV4-lkp@intel.com>
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
TO: Jeff Layton <jlayton@kernel.org>
CC: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   565351ae7e0cee80e9b5ed84452a5b13644ffc4d
commit: 7ba68ad0210d54eb26c499eabd85022fb38ccbf2 [8204/9634] nfsd: replace CB_GETATTR_BUSY with NFSD4_CALLBACK_RUNNING
:::::: branch date: 27 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250307/202503072054.8X4dthV4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503072054.8X4dthV4-lkp@intel.com/

New smatch warnings:
fs/nfsd/nfs4state.c:3235 nfs4_cb_getattr() warn: set_bit() takes a bit number

Old smatch warnings:
fs/nfsd/nfs4state.c:3228 nfs4_cb_getattr() warn: test_and_set_bit() takes a bit number
fs/nfsd/nfs4state.c:5428 nfsd_break_one_deleg() warn: test_and_set_bit() takes a bit number
fs/nfsd/nfs4state.c:6895 deleg_reaper() warn: test_and_set_bit() takes a bit number
fs/nfsd/state.h:783 nfsd4_try_run_cb() warn: test_and_set_bit() takes a bit number
fs/nfsd/nfs4state.c:8025 init_lock_stateid() warn: inconsistent returns '&stp->st_mutex'.

vim +3235 fs/nfsd/nfs4state.c

c5967721e10636 Dai Ngo     2024-02-15  3222  
c5967721e10636 Dai Ngo     2024-02-15  3223  static void nfs4_cb_getattr(struct nfs4_cb_fattr *ncf)
c5967721e10636 Dai Ngo     2024-02-15  3224  {
c5967721e10636 Dai Ngo     2024-02-15  3225  	struct nfs4_delegation *dp =
c5967721e10636 Dai Ngo     2024-02-15  3226  			container_of(ncf, struct nfs4_delegation, dl_cb_fattr);
c5967721e10636 Dai Ngo     2024-02-15  3227  
7ba68ad0210d54 Jeff Layton 2025-02-20  3228  	if (test_and_set_bit(NFSD4_CALLBACK_RUNNING, &ncf->ncf_getattr.cb_flags))
c5967721e10636 Dai Ngo     2024-02-15  3229  		return;
7ba68ad0210d54 Jeff Layton 2025-02-20  3230  
c5967721e10636 Dai Ngo     2024-02-15  3231  	/* set to proper status when nfsd4_cb_getattr_done runs */
c5967721e10636 Dai Ngo     2024-02-15  3232  	ncf->ncf_cb_status = NFS4ERR_IO;
c5967721e10636 Dai Ngo     2024-02-15  3233  
7ba68ad0210d54 Jeff Layton 2025-02-20  3234  	/* ensure that wake_bit is done when RUNNING is cleared */
7ba68ad0210d54 Jeff Layton 2025-02-20 @3235  	set_bit(NFSD4_CALLBACK_WAKE, &ncf->ncf_getattr.cb_flags);
7ba68ad0210d54 Jeff Layton 2025-02-20  3236  
c5967721e10636 Dai Ngo     2024-02-15  3237  	refcount_inc(&dp->dl_stid.sc_count);
c5967721e10636 Dai Ngo     2024-02-15  3238  	nfsd4_run_cb(&ncf->ncf_getattr);
c5967721e10636 Dai Ngo     2024-02-15  3239  }
c5967721e10636 Dai Ngo     2024-02-15  3240  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
