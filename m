Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2033F4119
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 19:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778787447; cv=none; b=cQk76e9jjFKV4N/P6PH1Ijps1NGcIZMWuWwC+Wr1g3ZIKqyhIo3YgyYCiqKCItTt/e11h6TyJGFrnRub2JP6GZU99mAgz2KiTkcoCMZBySc9rBMKT7706l/estqQCzFvWvhvWsPNVuH0hKpEMuwRIR9qSbKyTo8JRi1wPIdwUyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778787447; c=relaxed/simple;
	bh=LaAM8mcoR9V8sMpLG/g8KBgKNCS80gM394JFoIXn1Kg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hnNsp49qei/JLYCfrolE5w1T9vH6mzpst1BSaUe1G9SzCER3AdyCLHGLPoGhFXWpFqwQwmqGt6uMYhe72u172yCti4QWwsjayajJfc2TS+iklPOPJz+gKrIZyD8IO08v07kANaEFUzle7+GoBEDT1az6ldlDc1w+9SSknI2F9kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b67a5OHM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b67a5OHM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778787446; x=1810323446;
  h=date:from:to:cc:subject:message-id;
  bh=LaAM8mcoR9V8sMpLG/g8KBgKNCS80gM394JFoIXn1Kg=;
  b=b67a5OHMLhVs6oDy46ozYkFiXKbCWu8cK9tLFjr/s1BAXJOMD6OXfis1
   Fkh49at1J6u0cBhzoycFf1xRlewJrhRLplh06ZfuRDTUcevAzfT45MmEM
   8f3Y1kwXtNvCwDiBG+tg3WRXXtgFMe94caSa1Cf//E3FUusKyCKFm2Mfv
   LyHhaYf3b2Zdpu1NxcplPiZw3Ltba7r43OtbWYA0hsfvPW6ui8PquJm6C
   RPYjRXp7ye0//Iyx1PUzEAJ+H/6VTfH/OCwTRUUUoL5k3Qe09fpvaO9uF
   n/kKZzHCEQpbY1BrYE1xI7ke2gcGJpZVScyVTcYvQeQomdf+gpyuPedSR
   Q==;
X-CSE-ConnectionGUID: otMNXPvwTNC9PDxUpFI34w==
X-CSE-MsgGUID: qSqhPcA8R+KovS/yp+bTww==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="105198230"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="105198230"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 12:37:25 -0700
X-CSE-ConnectionGUID: j7BJIbqAQYeI5hHHiD2Dhg==
X-CSE-MsgGUID: JqIrocRET2G0oBQX8UQcuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="232081524"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 May 2026 12:37:23 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNbs1-00000000719-2K85;
	Thu, 14 May 2026 19:37:21 +0000
Date: Fri, 15 May 2026 03:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [brauner-vfs:vfs.fixes 30/31] fs/afs/symlink.c:130
 afs_do_read_symlink() error: we previously assumed 'vnode->directory' could
 be null (see line 96)
Message-ID: <202605150307.KNKEp1AH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: David Howells <dhowells@redhat.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.fixes
head:   45205929a3a3310e4978f4097d8ed4fca36b2c32
commit: c0410adf3da6db46f3513411fcf95e63c2f1d1ad [30/31] afs: Fix the locking used by afs_get_link()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-r073-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150307.KNKEp1AH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605150307.KNKEp1AH-lkp@intel.com/

smatch warnings:
fs/afs/symlink.c:130 afs_do_read_symlink() error: we previously assumed 'vnode->directory' could be null (see line 96)

vim +130 fs/afs/symlink.c

c0410adf3da6db4 David Howells 2026-05-12   79  
c0410adf3da6db4 David Howells 2026-05-12   80  /*
c0410adf3da6db4 David Howells 2026-05-12   81   * Read a symlink in a single download.
c0410adf3da6db4 David Howells 2026-05-12   82   */
c0410adf3da6db4 David Howells 2026-05-12   83  static ssize_t afs_do_read_symlink(struct afs_vnode *vnode)
c0410adf3da6db4 David Howells 2026-05-12   84  {
c0410adf3da6db4 David Howells 2026-05-12   85  	struct afs_symlink *symlink;
c0410adf3da6db4 David Howells 2026-05-12   86  	struct iov_iter iter;
c0410adf3da6db4 David Howells 2026-05-12   87  	ssize_t ret;
c0410adf3da6db4 David Howells 2026-05-12   88  	loff_t i_size;
c0410adf3da6db4 David Howells 2026-05-12   89  
c0410adf3da6db4 David Howells 2026-05-12   90  	i_size = i_size_read(&vnode->netfs.inode);
c0410adf3da6db4 David Howells 2026-05-12   91  	if (i_size > PAGE_SIZE - 1) {
c0410adf3da6db4 David Howells 2026-05-12   92  		trace_afs_file_error(vnode, -EFBIG, afs_file_error_dir_big);
c0410adf3da6db4 David Howells 2026-05-12   93  		return -EFBIG;
c0410adf3da6db4 David Howells 2026-05-12   94  	}
c0410adf3da6db4 David Howells 2026-05-12   95  
c0410adf3da6db4 David Howells 2026-05-12  @96  	if (!vnode->directory) {
c0410adf3da6db4 David Howells 2026-05-12   97  		size_t cur_size = 0;
c0410adf3da6db4 David Howells 2026-05-12   98  
c0410adf3da6db4 David Howells 2026-05-12   99  		ret = netfs_alloc_folioq_buffer(NULL,
c0410adf3da6db4 David Howells 2026-05-12  100  						&vnode->directory, &cur_size, PAGE_SIZE,
c0410adf3da6db4 David Howells 2026-05-12  101  						mapping_gfp_mask(vnode->netfs.inode.i_mapping));
c0410adf3da6db4 David Howells 2026-05-12  102  		vnode->directory_size = PAGE_SIZE - 1;
c0410adf3da6db4 David Howells 2026-05-12  103  		if (ret < 0)
c0410adf3da6db4 David Howells 2026-05-12  104  			return ret;
c0410adf3da6db4 David Howells 2026-05-12  105  	}
c0410adf3da6db4 David Howells 2026-05-12  106  
c0410adf3da6db4 David Howells 2026-05-12  107  	iov_iter_folio_queue(&iter, ITER_DEST, vnode->directory, 0, 0, PAGE_SIZE);
c0410adf3da6db4 David Howells 2026-05-12  108  
c0410adf3da6db4 David Howells 2026-05-12  109  	/* AFS requires us to perform the read of a symlink as a single unit to
c0410adf3da6db4 David Howells 2026-05-12  110  	 * avoid issues with the content being changed between reads.
c0410adf3da6db4 David Howells 2026-05-12  111  	 */
c0410adf3da6db4 David Howells 2026-05-12  112  	ret = netfs_read_single(&vnode->netfs.inode, NULL, &iter);
c0410adf3da6db4 David Howells 2026-05-12  113  	if (ret >= 0) {
c0410adf3da6db4 David Howells 2026-05-12  114  		i_size = ret;
c0410adf3da6db4 David Howells 2026-05-12  115  		if (i_size > PAGE_SIZE - 1) {
c0410adf3da6db4 David Howells 2026-05-12  116  			trace_afs_file_error(vnode, -EFBIG, afs_file_error_dir_big);
c0410adf3da6db4 David Howells 2026-05-12  117  			return -EFBIG;
c0410adf3da6db4 David Howells 2026-05-12  118  		}
c0410adf3da6db4 David Howells 2026-05-12  119  		vnode->directory_size = i_size;
c0410adf3da6db4 David Howells 2026-05-12  120  
c0410adf3da6db4 David Howells 2026-05-12  121  		/* Copy the symlink. */
c0410adf3da6db4 David Howells 2026-05-12  122  		symlink = kmalloc_flex(struct afs_symlink, content, i_size + 1,
c0410adf3da6db4 David Howells 2026-05-12  123  				       GFP_KERNEL);
c0410adf3da6db4 David Howells 2026-05-12  124  		if (!symlink)
c0410adf3da6db4 David Howells 2026-05-12  125  			return -ENOMEM;
c0410adf3da6db4 David Howells 2026-05-12  126  
c0410adf3da6db4 David Howells 2026-05-12  127  		refcount_set(&symlink->ref, 1);
c0410adf3da6db4 David Howells 2026-05-12  128  		symlink->content[i_size] = 0;
c0410adf3da6db4 David Howells 2026-05-12  129  
c0410adf3da6db4 David Howells 2026-05-12 @130  		const char *s = kmap_local_folio(folioq_folio(vnode->directory, 0), 0);
c0410adf3da6db4 David Howells 2026-05-12  131  
c0410adf3da6db4 David Howells 2026-05-12  132  		memcpy(symlink->content, s, i_size);
c0410adf3da6db4 David Howells 2026-05-12  133  		kunmap_local(s);
c0410adf3da6db4 David Howells 2026-05-12  134  
c0410adf3da6db4 David Howells 2026-05-12  135  		afs_replace_symlink(vnode, symlink);
c0410adf3da6db4 David Howells 2026-05-12  136  	}
c0410adf3da6db4 David Howells 2026-05-12  137  
c0410adf3da6db4 David Howells 2026-05-12  138  	if (!fscache_cookie_enabled(netfs_i_cookie(&vnode->netfs))) {
c0410adf3da6db4 David Howells 2026-05-12  139  		netfs_free_folioq_buffer(vnode->directory);
c0410adf3da6db4 David Howells 2026-05-12  140  		vnode->directory = NULL;
c0410adf3da6db4 David Howells 2026-05-12  141  		vnode->directory_size = 0;
c0410adf3da6db4 David Howells 2026-05-12  142  	}
c0410adf3da6db4 David Howells 2026-05-12  143  
c0410adf3da6db4 David Howells 2026-05-12  144  	return ret;
c0410adf3da6db4 David Howells 2026-05-12  145  }
c0410adf3da6db4 David Howells 2026-05-12  146  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
