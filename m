Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BA11FE44A
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Dec 2025 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765459327; cv=none; b=c512sVJCdM1llW2vdxVbt5/dZLG0gt8yLn1evtI40qP82tjUAcQaGVVW02pMvmsLk51hiHH6IaiqHoM8yW1/9ePf9bCIaV0i/FaJ+OsZ2OcjepEef9DwiVgVwrpOG0GAwXMHXhuUXfP9UmMP9ng9Pp8v32p6DTBuw+JxHfuyj4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765459327; c=relaxed/simple;
	bh=lw675epauqzufZf8ZdUqT2VtQeN9OVVJrvACQas0rSc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fo2y44t6X3W/YbdcVwIVttSLSuifyCRXdPQ4SuU24UD0yPu2jbYETWrLxwxGfDtaG6xs/xRavn8T9i0/hhimJaExxuu7Gat1ta9ek0FBIBeIejs2CbcFVwaEC78JiQlWcC9ToevzJfopAbyde3FIrF7Qk3ty3zZI4x9PsmAYZS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=INR8BS4N; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="INR8BS4N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765459325; x=1796995325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lw675epauqzufZf8ZdUqT2VtQeN9OVVJrvACQas0rSc=;
  b=INR8BS4Nz8TFeXwymonFkeXSr5g2aAkNBXKZ3NdtTWCNd2V7kzpcKj70
   VTd9o5uhEddTZyH/EmV+WdjhsG53Z+lthDKa7ZrNSbhrrmC7Rz/RLgr1Y
   wu9+RJBBgoqqsAiA2s2S+oteQI6SeklftHbAUYZZnzGJIAxqE6T/T66Wm
   3XZGYgvys67+xbQS9lgTk1JWbUaAEWKk+hI+2sZ3hmEnXOBULHvRdQVIJ
   EonA96zCQl7YNltAtLZLJflN+tVqVF1Vt6la7RfV6fge5sotLJeC+H4M+
   ecCZC7H47jprfDpzY8FDWwok37lMG9dhb5B6jDmRR1Qb5Y3nzdy4Kv0ps
   Q==;
X-CSE-ConnectionGUID: P4U1/TuxSMCY2nCOAnHMQg==
X-CSE-MsgGUID: dVOd/tMJQEe3l24fNKHYeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78057902"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78057902"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:22:04 -0800
X-CSE-ConnectionGUID: J7QG6zolTTa6ynRNUn35Ig==
X-CSE-MsgGUID: Wi+kS29ZQjOHfabMpCLKHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201708265"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Dec 2025 05:22:02 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTgcK-000000004gh-0FHZ;
	Thu, 11 Dec 2025 13:22:00 +0000
Date: Thu, 11 Dec 2025 21:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ext4/inode.c:4758 check_igot_inode() warn: missing unwind goto?
Message-ID: <202512112154.9CEvzBcI-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Jann Horn <jannh@google.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: 642335f3ea2b3fd6dba03e57e01fa9587843a497 ext4: don't treat fhandle lookup of ea_inode as FS corruption
date:   8 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 months ago
config: arm-randconfig-r072-20251210 (https://download.01.org/0day-ci/archive/20251211/202512112154.9CEvzBcI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512112154.9CEvzBcI-lkp@intel.com/

New smatch warnings:
fs/ext4/inode.c:4758 check_igot_inode() warn: missing unwind goto?

Old smatch warnings:
fs/ext4/inode.c:2469 mpage_prepare_extent_to_map() warn: missing error code 'err'
fs/ext4/inode.c:6304 ext4_page_mkwrite() error: uninitialized symbol 'get_block'.

vim +4758 fs/ext4/inode.c

e254d1afac83fd4 Eryu Guan     2018-05-10  4734  
642335f3ea2b3fd Jann Horn     2024-11-29  4735  static int check_igot_inode(struct inode *inode, ext4_iget_flags flags,
642335f3ea2b3fd Jann Horn     2024-11-29  4736  			    const char *function, unsigned int line)
b3e6bcb94590dea Theodore Ts'o 2023-05-23  4737  {
642335f3ea2b3fd Jann Horn     2024-11-29  4738  	const char *err_str;
642335f3ea2b3fd Jann Horn     2024-11-29  4739  
b3e6bcb94590dea Theodore Ts'o 2023-05-23  4740  	if (flags & EXT4_IGET_EA_INODE) {
642335f3ea2b3fd Jann Horn     2024-11-29  4741  		if (!(EXT4_I(inode)->i_flags & EXT4_EA_INODE_FL)) {
642335f3ea2b3fd Jann Horn     2024-11-29  4742  			err_str = "missing EA_INODE flag";
642335f3ea2b3fd Jann Horn     2024-11-29  4743  			goto error;
642335f3ea2b3fd Jann Horn     2024-11-29  4744  		}
2bc7e7c1a3bc9bd Theodore Ts'o 2023-05-23  4745  		if (ext4_test_inode_state(inode, EXT4_STATE_XATTR) ||
642335f3ea2b3fd Jann Horn     2024-11-29  4746  		    EXT4_I(inode)->i_file_acl) {
642335f3ea2b3fd Jann Horn     2024-11-29  4747  			err_str = "ea_inode with extended attributes";
642335f3ea2b3fd Jann Horn     2024-11-29  4748  			goto error;
642335f3ea2b3fd Jann Horn     2024-11-29  4749  		}
b3e6bcb94590dea Theodore Ts'o 2023-05-23  4750  	} else {
642335f3ea2b3fd Jann Horn     2024-11-29  4751  		if ((EXT4_I(inode)->i_flags & EXT4_EA_INODE_FL)) {
642335f3ea2b3fd Jann Horn     2024-11-29  4752  			/*
642335f3ea2b3fd Jann Horn     2024-11-29  4753  			 * open_by_handle_at() could provide an old inode number
642335f3ea2b3fd Jann Horn     2024-11-29  4754  			 * that has since been reused for an ea_inode; this does
642335f3ea2b3fd Jann Horn     2024-11-29  4755  			 * not indicate filesystem corruption
642335f3ea2b3fd Jann Horn     2024-11-29  4756  			 */
642335f3ea2b3fd Jann Horn     2024-11-29  4757  			if (flags & EXT4_IGET_HANDLE)
642335f3ea2b3fd Jann Horn     2024-11-29 @4758  				return -ESTALE;
642335f3ea2b3fd Jann Horn     2024-11-29  4759  			err_str = "unexpected EA_INODE flag";
642335f3ea2b3fd Jann Horn     2024-11-29  4760  			goto error;
b3e6bcb94590dea Theodore Ts'o 2023-05-23  4761  		}
642335f3ea2b3fd Jann Horn     2024-11-29  4762  	}
642335f3ea2b3fd Jann Horn     2024-11-29  4763  	if (is_bad_inode(inode) && !(flags & EXT4_IGET_BAD)) {
642335f3ea2b3fd Jann Horn     2024-11-29  4764  		err_str = "unexpected bad inode w/o EXT4_IGET_BAD";
642335f3ea2b3fd Jann Horn     2024-11-29  4765  		goto error;
642335f3ea2b3fd Jann Horn     2024-11-29  4766  	}
642335f3ea2b3fd Jann Horn     2024-11-29  4767  	return 0;
642335f3ea2b3fd Jann Horn     2024-11-29  4768  
642335f3ea2b3fd Jann Horn     2024-11-29  4769  error:
642335f3ea2b3fd Jann Horn     2024-11-29  4770  	ext4_error_inode(inode, function, line, 0, err_str);
642335f3ea2b3fd Jann Horn     2024-11-29  4771  	return -EFSCORRUPTED;
b3e6bcb94590dea Theodore Ts'o 2023-05-23  4772  }
b3e6bcb94590dea Theodore Ts'o 2023-05-23  4773  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
