Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AF930594E
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Mar 2026 23:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774654238; cv=none; b=iTo1W5bbnLLqBQXz7dPHQEoVj0lWibA7/shkH7H6hXNY7JHnbE6nt87nD0qMjDacC6ddeNSBYxemCEhOXwiHTigaxgDOy9zXce2XFDKrIvQ99SceN6OSkCYScGaulq9+TtVHL2m3QFBgpGsEKPD4Drcnbe8rgKmD8QwFPVjpPfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774654238; c=relaxed/simple;
	bh=fCJhKcNVAa4fNKfvhXffM+YZUECKafTGdbL2k6Wg8kI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b3lPNp7gH6cwDMPz7dq54z9FH6CZzaEU71LT/BbiVutph28SaEPwJ1BFFD2+tGr2r75wqSjzqiUpbgbxeKg8k646yKVgRiRrALFQY1ilXBnXtQ55D/o1va8NQqrfwh4etJo1mCXHInGgunVL8isEC56m9sDbUr/RXMXATHNGObk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYbtAS7B; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYbtAS7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774654237; x=1806190237;
  h=date:from:to:cc:subject:message-id;
  bh=fCJhKcNVAa4fNKfvhXffM+YZUECKafTGdbL2k6Wg8kI=;
  b=JYbtAS7BsumQgb5GtWo0AMz+gFxeewg1wIIMGLbc69YExrDD1HH9ZaJe
   NkvGrY12TawwuRnK2TEeUkScdGlIxuc6X1h2QXyZAkOk14wVN7B3iJu5i
   KpKKs0Guj5IXJuWvPMwPU1OqvCPYleiw2pWYEuwUrdc3uKZmW7Umy7nab
   PCtzaY590PsepzVRgv0n7BdVTAyobTXpa+KMCJN8lh+pKp7p4dwOjT3o2
   jGE8cLznJaKDBJisMtuTlhF4iWBXn+MX8vdzcStInGxhx/AbgSF3bef5l
   w4WtHVkrxI97bTSm6KoiWmH/0winISkaT0jp+XqrmeaF73BKxkeb3bMjh
   Q==;
X-CSE-ConnectionGUID: K5c3ja65Q66tsVfp89IzSQ==
X-CSE-MsgGUID: ZlmzCY6qSo6h5ToO1mtIXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="63287590"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="63287590"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 16:30:36 -0700
X-CSE-ConnectionGUID: j6Gb+3fDTXGuoRYYhJTJ3g==
X-CSE-MsgGUID: 70YEpPIWQC+fGioODgw4Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="230235248"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 16:30:35 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6GdM-00000000Asj-2UnE;
	Fri, 27 Mar 2026 23:30:32 +0000
Date: Sat, 28 Mar 2026 07:30:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/ext4/inode.c:4758 check_igot_inode() warn: missing unwind
 goto?
Message-ID: <202603280739.cx4SRYnV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jann Horn <jannh@google.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Jan Kara <jack@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   46b513250491a7bfc97d98791dbe6a10bcc8129d
commit: 642335f3ea2b3fd6dba03e57e01fa9587843a497 ext4: don't treat fhandle lookup of ea_inode as FS corruption
date:   12 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-141-20260322 (https://download.01.org/0day-ci/archive/20260328/202603280739.cx4SRYnV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603280739.cx4SRYnV-lkp@intel.com/

New smatch warnings:
fs/ext4/inode.c:4758 check_igot_inode() warn: missing unwind goto?

Old smatch warnings:
fs/ext4/inode.c:2469 mpage_prepare_extent_to_map() warn: missing error code 'err'

vim +4758 fs/ext4/inode.c

e254d1afac83fd Eryu Guan     2018-05-10  4734  
642335f3ea2b3f Jann Horn     2024-11-29  4735  static int check_igot_inode(struct inode *inode, ext4_iget_flags flags,
642335f3ea2b3f Jann Horn     2024-11-29  4736  			    const char *function, unsigned int line)
b3e6bcb94590de Theodore Ts'o 2023-05-23  4737  {
642335f3ea2b3f Jann Horn     2024-11-29  4738  	const char *err_str;
642335f3ea2b3f Jann Horn     2024-11-29  4739  
b3e6bcb94590de Theodore Ts'o 2023-05-23  4740  	if (flags & EXT4_IGET_EA_INODE) {
642335f3ea2b3f Jann Horn     2024-11-29  4741  		if (!(EXT4_I(inode)->i_flags & EXT4_EA_INODE_FL)) {
642335f3ea2b3f Jann Horn     2024-11-29  4742  			err_str = "missing EA_INODE flag";
642335f3ea2b3f Jann Horn     2024-11-29  4743  			goto error;
642335f3ea2b3f Jann Horn     2024-11-29  4744  		}
2bc7e7c1a3bc9b Theodore Ts'o 2023-05-23  4745  		if (ext4_test_inode_state(inode, EXT4_STATE_XATTR) ||
642335f3ea2b3f Jann Horn     2024-11-29  4746  		    EXT4_I(inode)->i_file_acl) {
642335f3ea2b3f Jann Horn     2024-11-29  4747  			err_str = "ea_inode with extended attributes";
642335f3ea2b3f Jann Horn     2024-11-29  4748  			goto error;
642335f3ea2b3f Jann Horn     2024-11-29  4749  		}
b3e6bcb94590de Theodore Ts'o 2023-05-23  4750  	} else {
642335f3ea2b3f Jann Horn     2024-11-29  4751  		if ((EXT4_I(inode)->i_flags & EXT4_EA_INODE_FL)) {
642335f3ea2b3f Jann Horn     2024-11-29  4752  			/*
642335f3ea2b3f Jann Horn     2024-11-29  4753  			 * open_by_handle_at() could provide an old inode number
642335f3ea2b3f Jann Horn     2024-11-29  4754  			 * that has since been reused for an ea_inode; this does
642335f3ea2b3f Jann Horn     2024-11-29  4755  			 * not indicate filesystem corruption
642335f3ea2b3f Jann Horn     2024-11-29  4756  			 */
642335f3ea2b3f Jann Horn     2024-11-29  4757  			if (flags & EXT4_IGET_HANDLE)
642335f3ea2b3f Jann Horn     2024-11-29 @4758  				return -ESTALE;
642335f3ea2b3f Jann Horn     2024-11-29  4759  			err_str = "unexpected EA_INODE flag";
642335f3ea2b3f Jann Horn     2024-11-29  4760  			goto error;
b3e6bcb94590de Theodore Ts'o 2023-05-23  4761  		}
642335f3ea2b3f Jann Horn     2024-11-29  4762  	}
642335f3ea2b3f Jann Horn     2024-11-29  4763  	if (is_bad_inode(inode) && !(flags & EXT4_IGET_BAD)) {
642335f3ea2b3f Jann Horn     2024-11-29  4764  		err_str = "unexpected bad inode w/o EXT4_IGET_BAD";
642335f3ea2b3f Jann Horn     2024-11-29  4765  		goto error;
642335f3ea2b3f Jann Horn     2024-11-29  4766  	}
642335f3ea2b3f Jann Horn     2024-11-29  4767  	return 0;
642335f3ea2b3f Jann Horn     2024-11-29  4768  
642335f3ea2b3f Jann Horn     2024-11-29  4769  error:
642335f3ea2b3f Jann Horn     2024-11-29  4770  	ext4_error_inode(inode, function, line, 0, err_str);
642335f3ea2b3f Jann Horn     2024-11-29  4771  	return -EFSCORRUPTED;
b3e6bcb94590de Theodore Ts'o 2023-05-23  4772  }
b3e6bcb94590de Theodore Ts'o 2023-05-23  4773  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
