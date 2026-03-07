Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89949330664
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 12:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772888055; cv=none; b=fe0ZL8WPYsOXAoErH6Yp/mIDT/pYM74VbGl2Mh6FY2n3oqfR/Jz6bqzKf9iszK/ESRj18hi/f0RiUE73Sdnbn/fsEQtaDIlg1EC83WDlnyecgbptJFy+G4wd4O4GvF+LaqVRug0uZ4JBmEeelfV9EuQUAmAhh6b2liwrt6Dl+kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772888055; c=relaxed/simple;
	bh=zHQ6EqmGsXhaLDiZqrb/Y9sHQKqtaf3MJ3bXLHonsYs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WMfQC6yL2reOZSL29Q3NNOU0HHj015Q2neyIduf71jceoz548ipLYkgfRcrym7OrIE1DSH8KcpPYIjOF3WKkmJcLnb11w7mKY5pJ0CFw6w1KGOni58GrlzdqgyiDmIzSRpQWzrosuK+55K9kf7mm93+sxzNmvBFmj35u4/fka98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DCKPke1+; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DCKPke1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772888055; x=1804424055;
  h=date:from:to:cc:subject:message-id;
  bh=zHQ6EqmGsXhaLDiZqrb/Y9sHQKqtaf3MJ3bXLHonsYs=;
  b=DCKPke1+lEfpeyIfHWHWnpeuycijuZyKrzXjasI3y2p00Exr2NpepAh0
   KDCGd0685GFMNy9xyZl2fjwAL/6JEXzJrepAjpjGeR7pdGozQV/toEUov
   gSYSX9jaOwHd6zY6UodVAjSZgxSDfJZ7E91X50mASDbnuuHN1cZww3bby
   nnUB2R8fbjcpGNJ88z2sulY3iDOgObnmSSIDx5pv0Aa1Vs3MyBFJfh0EZ
   7QPD9NlqFqGy29Fz4BI8uYdoeX1qG96FyZ+N5pjMPnYM99a4GMg1dupQf
   p8VV5ezswJZvOgcFpYqzUQx4i+YlNf+42uFAxlipTcPgTbIcHSDSRjKtj
   A==;
X-CSE-ConnectionGUID: 79SXVs/OQ6WA2kfRZx2yPQ==
X-CSE-MsgGUID: Hxd+j01nQEKPXKxpeEMG3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="74054500"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="74054500"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 04:54:14 -0800
X-CSE-ConnectionGUID: 1zG9damjQdKbE/oybOt3Hw==
X-CSE-MsgGUID: 2xYgiNKnS3ad5R1NAom2kg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="217427433"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Mar 2026 04:54:14 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyrAY-000000001zJ-21Ll;
	Sat, 07 Mar 2026 12:54:10 +0000
Date: Sat, 07 Mar 2026 20:53:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 115/471] drivers/hid/hid-wiimote-debug.c:142
 wiidebug_drm_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202603072023.GowFKNYd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: 7dfd9f363e6d79bc842bf6e7fa86541a21142fef [115/471] drivers/hid: convert to read/write iterators
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: x86_64-randconfig-161-20260307 (https://download.01.org/0day-ci/archive/20260307/202603072023.GowFKNYd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603072023.GowFKNYd-lkp@intel.com/

smatch warnings:
drivers/hid/hid-wiimote-debug.c:142 wiidebug_drm_write() warn: potential spectre issue 'buf' [w]

vim +/buf +142 drivers/hid/hid-wiimote-debug.c

43d782ae80b826 David Rheinsberg 2011-11-17  124  
7dfd9f363e6d79 Jens Axboe       2024-04-05  125  static ssize_t wiidebug_drm_write(struct kiocb *iocb, struct iov_iter *from)
43d782ae80b826 David Rheinsberg 2011-11-17  126  {
7dfd9f363e6d79 Jens Axboe       2024-04-05  127  	struct seq_file *sf = iocb->ki_filp->private_data;
51103c70bf8d48 David Rheinsberg 2013-05-05  128  	struct wiimote_debug *dbg = sf->private;
7dfd9f363e6d79 Jens Axboe       2024-04-05  129  	size_t s = iov_iter_count(from);
43d782ae80b826 David Rheinsberg 2011-11-17  130  	unsigned long flags;
43d782ae80b826 David Rheinsberg 2011-11-17  131  	char buf[16];
43d782ae80b826 David Rheinsberg 2011-11-17  132  	ssize_t len;
43d782ae80b826 David Rheinsberg 2011-11-17  133  	int i;
43d782ae80b826 David Rheinsberg 2011-11-17  134  
43d782ae80b826 David Rheinsberg 2011-11-17  135  	if (s == 0)
43d782ae80b826 David Rheinsberg 2011-11-17  136  		return -EINVAL;
43d782ae80b826 David Rheinsberg 2011-11-17  137  
43d782ae80b826 David Rheinsberg 2011-11-17  138  	len = min((size_t) 15, s);
7dfd9f363e6d79 Jens Axboe       2024-04-05  139  	if (!copy_from_iter_full(buf, len, from))
43d782ae80b826 David Rheinsberg 2011-11-17  140  		return -EFAULT;
43d782ae80b826 David Rheinsberg 2011-11-17  141  
0d57eb8758c865 David Rheinsberg 2013-05-05 @142  	buf[len] = 0;
43d782ae80b826 David Rheinsberg 2011-11-17  143  
43d782ae80b826 David Rheinsberg 2011-11-17  144  	for (i = 0; i < WIIPROTO_REQ_MAX; ++i) {
43d782ae80b826 David Rheinsberg 2011-11-17  145  		if (!wiidebug_drmmap[i])
43d782ae80b826 David Rheinsberg 2011-11-17  146  			continue;
43d782ae80b826 David Rheinsberg 2011-11-17  147  		if (!strcasecmp(buf, wiidebug_drmmap[i]))
43d782ae80b826 David Rheinsberg 2011-11-17  148  			break;
43d782ae80b826 David Rheinsberg 2011-11-17  149  	}
43d782ae80b826 David Rheinsberg 2011-11-17  150  
43d782ae80b826 David Rheinsberg 2011-11-17  151  	if (i == WIIPROTO_REQ_MAX)
0d57eb8758c865 David Rheinsberg 2013-05-05  152  		i = simple_strtoul(buf, NULL, 16);
43d782ae80b826 David Rheinsberg 2011-11-17  153  
43d782ae80b826 David Rheinsberg 2011-11-17  154  	spin_lock_irqsave(&dbg->wdata->state.lock, flags);
d76f89e13a0439 David Rheinsberg 2013-05-05  155  	dbg->wdata->state.flags &= ~WIIPROTO_FLAG_DRM_LOCKED;
43d782ae80b826 David Rheinsberg 2011-11-17  156  	wiiproto_req_drm(dbg->wdata, (__u8) i);
d76f89e13a0439 David Rheinsberg 2013-05-05  157  	if (i != WIIPROTO_REQ_NULL)
d76f89e13a0439 David Rheinsberg 2013-05-05  158  		dbg->wdata->state.flags |= WIIPROTO_FLAG_DRM_LOCKED;
43d782ae80b826 David Rheinsberg 2011-11-17  159  	spin_unlock_irqrestore(&dbg->wdata->state.lock, flags);
43d782ae80b826 David Rheinsberg 2011-11-17  160  
43d782ae80b826 David Rheinsberg 2011-11-17  161  	return len;
43d782ae80b826 David Rheinsberg 2011-11-17  162  }
43d782ae80b826 David Rheinsberg 2011-11-17  163  

:::::: The code at line 142 was first introduced by commit
:::::: 0d57eb8758c865a70dd05f7c6a857acd996167fa HID: wiimote: fix DRM debug-attr to correctly parse input

:::::: TO: David Herrmann <dh.herrmann@gmail.com>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
