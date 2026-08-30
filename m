Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2111A25F988
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Aug 2026 19:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788116808; cv=none; b=eXffsbq0IMV1HWHHiJWDtQGZp7mK3QKkUy1XR70phcDUBG6LgdjAAqZhLS8+Fa2S7TU4dKC/smEN3ZXjP0n8YLRJedlNcAMB5AhMB4WQGICeS8Rq6xmm08+uELUUiBoZGafQH1ZHVMTJocG3eCkaV9K1SL8NCJ+uY4l+99HK67Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788116808; c=relaxed/simple;
	bh=oBUpoaEcpQrZbzdDkVZLSmu1zo8HDjtknAbFDD4xlnQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fR7gUm8gDDPUqlEY55m1eJu55Z89xpHw3W9yYBnm1aBWODSeG37BJvnS9o8rZDX0XfgsuCwJZeER3d4UZcQ7t5vrV8/v1VfDueNgFDCn7v+rhFMU+FtCFtqiUB09lSMbMkNt4743ivixjtJSuiDIZCqi/8ZOzY0Mx4tahE4O2uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFlwyb7w; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFlwyb7w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788116807; x=1819652807;
  h=date:from:to:cc:subject:message-id;
  bh=oBUpoaEcpQrZbzdDkVZLSmu1zo8HDjtknAbFDD4xlnQ=;
  b=QFlwyb7w4Lbhw2Wz+2ys52g2ZEvs+frVtNw4nC/PhBh7XLxz4i/KMNiN
   CdzXcQmmm7dY9EMoDzMSgoqrEtC1JjmWPiqn6pB5+6u0A7jvV7iqrBekb
   IlTkqkQSRh0U98+7b9wERO7ccdrGhNcDVXik7roa25ubGc6RkVTBl676F
   LdaYYFM/yWpN0ijdKJIb9M6eV26XIpyAgG7hv8jd9qZ3G7CPMuV4nohD8
   ILVTKKCkwN6K7BZerxpMQgwfMgYTeoFJGRkNIvAFIFt0Ic0bWK1MyJJIF
   rzEs8y3vaXgnVvi/i/M0qtdqQAAFzIG97kzFbx/4iFQRAw+NPpAjcxzDZ
   A==;
X-CSE-ConnectionGUID: UG9Wrv3JRsq5rqnBXSxC7w==
X-CSE-MsgGUID: Gy3ZK2zORFOHvJlEqsyZBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="111307641"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="111307641"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 12:06:46 -0700
X-CSE-ConnectionGUID: sULDP31AQUWX7rT+e+cBog==
X-CSE-MsgGUID: voGJrc6dRAePqUSNdawgDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="292115697"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 30 Aug 2026 12:06:44 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0krV-00000000EBc-1PEO;
	Sun, 30 Aug 2026 19:06:38 +0000
Date: Mon, 31 Aug 2026 03:06:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/afs/symlink.c:130 afs_do_read_symlink() error: we
 previously assumed 'vnode->directory' could be null (see line 96)
Message-ID: <202608310304.A6eXczSz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: David Howells <dhowells@redhat.com>
CC: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cf72cbb39da84b6f02f90c07f33b102fc10b16f0
commit: c0410adf3da6db46f3513411fcf95e63c2f1d1ad afs: Fix the locking used by afs_get_link()
date:   4 months ago
:::::: branch date: 2 days ago
:::::: commit date: 4 months ago
config: m68k-randconfig-r071-20260830 (https://download.01.org/0day-ci/archive/20260831/202608310304.A6eXczSz-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c0410adf3da6 ("afs: Fix the locking used by afs_get_link()")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608310304.A6eXczSz-lkp@intel.com/

smatch warnings:
fs/afs/symlink.c:130 afs_do_read_symlink() error: we previously assumed 'vnode->directory' could be null (see line 96)

vim +130 fs/afs/symlink.c

c0410adf3da6db David Howells 2026-05-12   79  
c0410adf3da6db David Howells 2026-05-12   80  /*
c0410adf3da6db David Howells 2026-05-12   81   * Read a symlink in a single download.
c0410adf3da6db David Howells 2026-05-12   82   */
c0410adf3da6db David Howells 2026-05-12   83  static ssize_t afs_do_read_symlink(struct afs_vnode *vnode)
c0410adf3da6db David Howells 2026-05-12   84  {
c0410adf3da6db David Howells 2026-05-12   85  	struct afs_symlink *symlink;
c0410adf3da6db David Howells 2026-05-12   86  	struct iov_iter iter;
c0410adf3da6db David Howells 2026-05-12   87  	ssize_t ret;
c0410adf3da6db David Howells 2026-05-12   88  	loff_t i_size;
c0410adf3da6db David Howells 2026-05-12   89  
c0410adf3da6db David Howells 2026-05-12   90  	i_size = i_size_read(&vnode->netfs.inode);
c0410adf3da6db David Howells 2026-05-12   91  	if (i_size > PAGE_SIZE - 1) {
c0410adf3da6db David Howells 2026-05-12   92  		trace_afs_file_error(vnode, -EFBIG, afs_file_error_dir_big);
c0410adf3da6db David Howells 2026-05-12   93  		return -EFBIG;
c0410adf3da6db David Howells 2026-05-12   94  	}
c0410adf3da6db David Howells 2026-05-12   95  
c0410adf3da6db David Howells 2026-05-12  @96  	if (!vnode->directory) {
c0410adf3da6db David Howells 2026-05-12   97  		size_t cur_size = 0;
c0410adf3da6db David Howells 2026-05-12   98  
c0410adf3da6db David Howells 2026-05-12   99  		ret = netfs_alloc_folioq_buffer(NULL,
c0410adf3da6db David Howells 2026-05-12  100  						&vnode->directory, &cur_size, PAGE_SIZE,
c0410adf3da6db David Howells 2026-05-12  101  						mapping_gfp_mask(vnode->netfs.inode.i_mapping));
c0410adf3da6db David Howells 2026-05-12  102  		vnode->directory_size = PAGE_SIZE - 1;
c0410adf3da6db David Howells 2026-05-12  103  		if (ret < 0)
c0410adf3da6db David Howells 2026-05-12  104  			return ret;
c0410adf3da6db David Howells 2026-05-12  105  	}
c0410adf3da6db David Howells 2026-05-12  106  
c0410adf3da6db David Howells 2026-05-12  107  	iov_iter_folio_queue(&iter, ITER_DEST, vnode->directory, 0, 0, PAGE_SIZE);
c0410adf3da6db David Howells 2026-05-12  108  
c0410adf3da6db David Howells 2026-05-12  109  	/* AFS requires us to perform the read of a symlink as a single unit to
c0410adf3da6db David Howells 2026-05-12  110  	 * avoid issues with the content being changed between reads.
c0410adf3da6db David Howells 2026-05-12  111  	 */
c0410adf3da6db David Howells 2026-05-12  112  	ret = netfs_read_single(&vnode->netfs.inode, NULL, &iter);
c0410adf3da6db David Howells 2026-05-12  113  	if (ret >= 0) {
c0410adf3da6db David Howells 2026-05-12  114  		i_size = ret;
c0410adf3da6db David Howells 2026-05-12  115  		if (i_size > PAGE_SIZE - 1) {
c0410adf3da6db David Howells 2026-05-12  116  			trace_afs_file_error(vnode, -EFBIG, afs_file_error_dir_big);
c0410adf3da6db David Howells 2026-05-12  117  			return -EFBIG;
c0410adf3da6db David Howells 2026-05-12  118  		}
c0410adf3da6db David Howells 2026-05-12  119  		vnode->directory_size = i_size;
c0410adf3da6db David Howells 2026-05-12  120  
c0410adf3da6db David Howells 2026-05-12  121  		/* Copy the symlink. */
c0410adf3da6db David Howells 2026-05-12  122  		symlink = kmalloc_flex(struct afs_symlink, content, i_size + 1,
c0410adf3da6db David Howells 2026-05-12  123  				       GFP_KERNEL);
c0410adf3da6db David Howells 2026-05-12  124  		if (!symlink)
c0410adf3da6db David Howells 2026-05-12  125  			return -ENOMEM;
c0410adf3da6db David Howells 2026-05-12  126  
c0410adf3da6db David Howells 2026-05-12  127  		refcount_set(&symlink->ref, 1);
c0410adf3da6db David Howells 2026-05-12  128  		symlink->content[i_size] = 0;
c0410adf3da6db David Howells 2026-05-12  129  
c0410adf3da6db David Howells 2026-05-12 @130  		const char *s = kmap_local_folio(folioq_folio(vnode->directory, 0), 0);
c0410adf3da6db David Howells 2026-05-12  131  
c0410adf3da6db David Howells 2026-05-12  132  		memcpy(symlink->content, s, i_size);
c0410adf3da6db David Howells 2026-05-12  133  		kunmap_local(s);
c0410adf3da6db David Howells 2026-05-12  134  
c0410adf3da6db David Howells 2026-05-12  135  		afs_replace_symlink(vnode, symlink);
c0410adf3da6db David Howells 2026-05-12  136  	}
c0410adf3da6db David Howells 2026-05-12  137  
c0410adf3da6db David Howells 2026-05-12  138  	if (!fscache_cookie_enabled(netfs_i_cookie(&vnode->netfs))) {
c0410adf3da6db David Howells 2026-05-12  139  		netfs_free_folioq_buffer(vnode->directory);
c0410adf3da6db David Howells 2026-05-12  140  		vnode->directory = NULL;
c0410adf3da6db David Howells 2026-05-12  141  		vnode->directory_size = 0;
c0410adf3da6db David Howells 2026-05-12  142  	}
c0410adf3da6db David Howells 2026-05-12  143  
c0410adf3da6db David Howells 2026-05-12  144  	return ret;
c0410adf3da6db David Howells 2026-05-12  145  }
c0410adf3da6db David Howells 2026-05-12  146  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
