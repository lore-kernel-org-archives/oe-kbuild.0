Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9806168B1
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741338445; cv=none; b=i3yHj4njoqyud98ieGsKWLnSB3+LTSIADHFcqg8p+fHI9lLX/ofRSQ5z0QDvFJlHYhD3205nK/RhpRbW4K7dhlrT/efsTREGS/qWoSRy/fG/RL/TXX7bAhPY//wE3pxQuuSjTDwtPRfhY2BpQkOFDVvibrusHiRSQRwldcTvbQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741338445; c=relaxed/simple;
	bh=mWf3efOalElH/cNdKWRvTo/LKk3pnr8IJc9SzQnn4RY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=buNHI1jxXT2nswM0hnwdq5o+/o9s5VEXCw948lLGJvrNdetV/8cI2cPY99lSORS+5tJoswADFa8i0cVwvQ/Dd3jgzTlGKtCGPl38unQi9GEf3g1UgfuzYwiK/ZylV7EkLVJlIC/3+pWQ4g+j4SIZLJVrqTQ0z3cHfzXfshudv64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tj1ZoKMK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tj1ZoKMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741338444; x=1772874444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mWf3efOalElH/cNdKWRvTo/LKk3pnr8IJc9SzQnn4RY=;
  b=Tj1ZoKMKuhjjGKKRunOwWhw9PiNaSefsQFEc1sfcSyJMrYYjIutHiuFH
   lXV1DhSHnP7PQxGunp2/QFFpuKRM4PZADbMIGbfss939ChHVoHvOkrJpb
   MK0BvoSMieC2PXslnkhYW5EJyuE0McoXcabp78c0kYGvLutoZD7Z1VDUe
   ygzjWGJXwjOerx95tusR2yFK/tV+DHDZvACikpLMzW0jsMzSRoeySMWVQ
   JY/KcsNnbTZcy7++HAgg5P5XaxQMoUi3BswjT97ihU6BCVm2dr/VB+6pP
   U47C9k6rGj4zaxcruG9XA0k4FJeDHhwroBEsRo/Rli+IjFdSz5H+jBTb5
   A==;
X-CSE-ConnectionGUID: Nfq6A1JRTPSSt0uwV3IqVg==
X-CSE-MsgGUID: NIVBvc8nTBady42pZ01bWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42610251"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="42610251"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 01:07:23 -0800
X-CSE-ConnectionGUID: KJoBlYfwRb6P/cWnyKbKKg==
X-CSE-MsgGUID: l49MSgq5QFWaY4dqVbDptQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="150067968"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Mar 2025 01:07:22 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqTfr-0000CJ-1u;
	Fri, 07 Mar 2025 09:07:19 +0000
Date: Fri, 7 Mar 2025 17:06:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cel:nfsd-testing 36/53] fs/nfsd/nfs4state.c:6894 deleg_reaper()
 warn: test_and_set_bit() takes a bit number
Message-ID: <202503071639.y8jBhHg7-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   312e8dc9f5f591a4927b4786a25840ef381c97d9
commit: e5655a15d29be9422731a1791fc4b92e70b79f7f [36/53] nfsd: eliminate cl_ra_cblist and NFSD4_CLIENT_CB_RECALL_ANY
:::::: branch date: 18 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250307/202503071639.y8jBhHg7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503071639.y8jBhHg7-lkp@intel.com/

New smatch warnings:
fs/nfsd/nfs4state.c:6894 deleg_reaper() warn: test_and_set_bit() takes a bit number

Old smatch warnings:
fs/nfsd/nfs4state.c:3234 nfs4_cb_getattr() warn: test_and_set_bit() takes a bit number
fs/nfsd/nfs4state.c:5427 nfsd_break_one_deleg() warn: test_and_set_bit() takes a bit number
fs/nfsd/state.h:786 nfsd4_try_run_cb() warn: test_and_set_bit() takes a bit number
fs/nfsd/nfs4state.c:8024 init_lock_stateid() warn: inconsistent returns '&stp->st_mutex'.

vim +6894 fs/nfsd/nfs4state.c

7746b32f467b38 Dai Ngo     2022-09-14  6877  
44df6f439a1790 Dai Ngo     2022-11-16  6878  static void
44df6f439a1790 Dai Ngo     2022-11-16  6879  deleg_reaper(struct nfsd_net *nn)
44df6f439a1790 Dai Ngo     2022-11-16  6880  {
44df6f439a1790 Dai Ngo     2022-11-16  6881  	struct list_head *pos, *next;
44df6f439a1790 Dai Ngo     2022-11-16  6882  	struct nfs4_client *clp;
44df6f439a1790 Dai Ngo     2022-11-16  6883  
44df6f439a1790 Dai Ngo     2022-11-16  6884  	spin_lock(&nn->client_lock);
44df6f439a1790 Dai Ngo     2022-11-16  6885  	list_for_each_safe(pos, next, &nn->client_lru) {
44df6f439a1790 Dai Ngo     2022-11-16  6886  		clp = list_entry(pos, struct nfs4_client, cl_lru);
f933659f330644 Chuck Lever 2025-01-14  6887  
f933659f330644 Chuck Lever 2025-01-14  6888  		if (clp->cl_state != NFSD4_ACTIVE)
f933659f330644 Chuck Lever 2025-01-14  6889  			continue;
f933659f330644 Chuck Lever 2025-01-14  6890  		if (list_empty(&clp->cl_delegations))
f933659f330644 Chuck Lever 2025-01-14  6891  			continue;
f933659f330644 Chuck Lever 2025-01-14  6892  		if (atomic_read(&clp->cl_delegs_in_recall))
f933659f330644 Chuck Lever 2025-01-14  6893  			continue;
e5655a15d29be9 Jeff Layton 2025-02-20 @6894  		if (test_and_set_bit(NFSD4_CALLBACK_RUNNING, &clp->cl_ra->ra_cb.cb_flags))
f933659f330644 Chuck Lever 2025-01-14  6895  			continue;
f933659f330644 Chuck Lever 2025-01-14  6896  		if (ktime_get_boottime_seconds() - clp->cl_ra_time < 5)
f933659f330644 Chuck Lever 2025-01-14  6897  			continue;
f933659f330644 Chuck Lever 2025-01-14  6898  		if (clp->cl_cb_state != NFSD4_CB_UP)
44df6f439a1790 Dai Ngo     2022-11-16  6899  			continue;
44df6f439a1790 Dai Ngo     2022-11-16  6900  
44df6f439a1790 Dai Ngo     2022-11-16  6901  		/* release in nfsd4_cb_recall_any_release */
10396f4df8b75f Jeff Layton 2024-04-05  6902  		kref_get(&clp->cl_nfsdfs.cl_ref);
44df6f439a1790 Dai Ngo     2022-11-16  6903  		clp->cl_ra_time = ktime_get_boottime_seconds();
44df6f439a1790 Dai Ngo     2022-11-16  6904  		clp->cl_ra->ra_keep = 0;
5826e09bf3dd44 Dai Ngo     2024-02-17  6905  		clp->cl_ra->ra_bmval[0] = BIT(RCA4_TYPE_MASK_RDATA_DLG) |
5826e09bf3dd44 Dai Ngo     2024-02-17  6906  						BIT(RCA4_TYPE_MASK_WDATA_DLG);
638593be55c0b3 Dai Ngo     2022-11-16  6907  		trace_nfsd_cb_recall_any(clp->cl_ra);
e5655a15d29be9 Jeff Layton 2025-02-20  6908  		nfsd4_run_cb(&clp->cl_ra->ra_cb);
44df6f439a1790 Dai Ngo     2022-11-16  6909  	}
e5655a15d29be9 Jeff Layton 2025-02-20  6910  	spin_unlock(&nn->client_lock);
44df6f439a1790 Dai Ngo     2022-11-16  6911  }
44df6f439a1790 Dai Ngo     2022-11-16  6912  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
