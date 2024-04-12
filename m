Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9B253E15
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Apr 2024 10:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712916288; cv=none; b=LcWfu+E/CRGE8EHYbdQ3s/TWkOYZiEuQpHUgWd1U8GFRRcMWzLTH7+VNiAdsjsHIZcvE7QlekIFaWt3zN10UfXrAUK0oV1KbkwDS3OPU51JK45d25UtSM+jw4AAEOS88qkDleFY2np0idC797SzhTiacx4rwZvdbb3B0RdBxh5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712916288; c=relaxed/simple;
	bh=6z83OpoNci9Njlu/5yhZzlBlNcgtS7kt8NgZRyZHToI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M3vDiwwyUTyTJ39JiSSbrC+VHB+Mu27BZkQZ3ZPAqvx3K1RxQRm/d1cl7tjXr6xPulcyOIaUlIMQUE6g2kspm3hCIs9cvVomrvNaHwBzNJWLnBjTMRSBkVQHea5TQYSFu9bSpRbXgU9ZXAYjtHUckUCoJBJ/O5RO7y5+lqbsTB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l3LxZAzV; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l3LxZAzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712916284; x=1744452284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6z83OpoNci9Njlu/5yhZzlBlNcgtS7kt8NgZRyZHToI=;
  b=l3LxZAzVdMlrt/Mhtn1a3J/BLlhvghEeOjWLccNmeFO+yQrHZeGM6rQp
   htPjnb0ZNG7OZT9Arnou7idD5G61vKCb+dRask5x8RhSoOELngaRugaXr
   7D5pkOe9uQKkWqqIiR5yo0H7k2sxRjAx1rBWKfOgWCFH4L2q8kV0NTMfc
   kuAIIpIO6WwiTtOux4YLQmcfukmHOwLek+zEtMO7CGV23ZG0wTt40NUem
   wuyS0bjyGtP9N/7JPIpftG3EIYxs69v69SlXYM3nyrxCKXVMykrAPSzdh
   +liGe5mEQvKc+iKuMtEQ2eaKghR0G87i2DaH0M5vlBznOBUDW0dqAvsSB
   A==;
X-CSE-ConnectionGUID: yk5kmaPHSZmjC0Uj8G8LFQ==
X-CSE-MsgGUID: J+LNeLy/Qqy95i/tCMc5Lg==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="8226150"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="8226150"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 03:04:43 -0700
X-CSE-ConnectionGUID: 9w1NusgPSpyd44+MnOxZNg==
X-CSE-MsgGUID: djpakIW4TnaB1+iclUzOXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; 
   d="scan'208";a="25977156"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 Apr 2024 03:04:41 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvDlu-0009fB-2R;
	Fri, 12 Apr 2024 10:04:38 +0000
Date: Fri, 12 Apr 2024 18:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 118/438] drivers/hid/hid-wiimote-debug.c:142
 wiidebug_drm_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202404121846.6YVqmGcc-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   8e79f6c3d0a118031e843758491803e38794f6e8
commit: d34a3b4a89f09108ccd3a5a391f19134f945fcfb [118/438] drivers/hid: convert to read/write iterators
:::::: branch date: 15 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-161-20240412 (https://download.01.org/0day-ci/archive/20240412/202404121846.6YVqmGcc-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404121846.6YVqmGcc-lkp@intel.com/

smatch warnings:
drivers/hid/hid-wiimote-debug.c:142 wiidebug_drm_write() warn: potential spectre issue 'buf' [w]

vim +/buf +142 drivers/hid/hid-wiimote-debug.c

43d782ae80b8266 David Rheinsberg 2011-11-17  124  
d34a3b4a89f0910 Jens Axboe       2024-04-05  125  static ssize_t wiidebug_drm_write(struct kiocb *iocb, struct iov_iter *from)
43d782ae80b8266 David Rheinsberg 2011-11-17  126  {
d34a3b4a89f0910 Jens Axboe       2024-04-05  127  	struct seq_file *sf = iocb->ki_filp->private_data;
51103c70bf8d483 David Rheinsberg 2013-05-05  128  	struct wiimote_debug *dbg = sf->private;
d34a3b4a89f0910 Jens Axboe       2024-04-05  129  	size_t s = iov_iter_count(from);
43d782ae80b8266 David Rheinsberg 2011-11-17  130  	unsigned long flags;
43d782ae80b8266 David Rheinsberg 2011-11-17  131  	char buf[16];
43d782ae80b8266 David Rheinsberg 2011-11-17  132  	ssize_t len;
43d782ae80b8266 David Rheinsberg 2011-11-17  133  	int i;
43d782ae80b8266 David Rheinsberg 2011-11-17  134  
43d782ae80b8266 David Rheinsberg 2011-11-17  135  	if (s == 0)
43d782ae80b8266 David Rheinsberg 2011-11-17  136  		return -EINVAL;
43d782ae80b8266 David Rheinsberg 2011-11-17  137  
43d782ae80b8266 David Rheinsberg 2011-11-17  138  	len = min((size_t) 15, s);
d34a3b4a89f0910 Jens Axboe       2024-04-05  139  	if (!copy_from_iter_full(buf, len, from))
43d782ae80b8266 David Rheinsberg 2011-11-17  140  		return -EFAULT;
43d782ae80b8266 David Rheinsberg 2011-11-17  141  
0d57eb8758c865a David Rheinsberg 2013-05-05 @142  	buf[len] = 0;
43d782ae80b8266 David Rheinsberg 2011-11-17  143  
43d782ae80b8266 David Rheinsberg 2011-11-17  144  	for (i = 0; i < WIIPROTO_REQ_MAX; ++i) {
43d782ae80b8266 David Rheinsberg 2011-11-17  145  		if (!wiidebug_drmmap[i])
43d782ae80b8266 David Rheinsberg 2011-11-17  146  			continue;
43d782ae80b8266 David Rheinsberg 2011-11-17  147  		if (!strcasecmp(buf, wiidebug_drmmap[i]))
43d782ae80b8266 David Rheinsberg 2011-11-17  148  			break;
43d782ae80b8266 David Rheinsberg 2011-11-17  149  	}
43d782ae80b8266 David Rheinsberg 2011-11-17  150  
43d782ae80b8266 David Rheinsberg 2011-11-17  151  	if (i == WIIPROTO_REQ_MAX)
0d57eb8758c865a David Rheinsberg 2013-05-05  152  		i = simple_strtoul(buf, NULL, 16);
43d782ae80b8266 David Rheinsberg 2011-11-17  153  
43d782ae80b8266 David Rheinsberg 2011-11-17  154  	spin_lock_irqsave(&dbg->wdata->state.lock, flags);
d76f89e13a04396 David Rheinsberg 2013-05-05  155  	dbg->wdata->state.flags &= ~WIIPROTO_FLAG_DRM_LOCKED;
43d782ae80b8266 David Rheinsberg 2011-11-17  156  	wiiproto_req_drm(dbg->wdata, (__u8) i);
d76f89e13a04396 David Rheinsberg 2013-05-05  157  	if (i != WIIPROTO_REQ_NULL)
d76f89e13a04396 David Rheinsberg 2013-05-05  158  		dbg->wdata->state.flags |= WIIPROTO_FLAG_DRM_LOCKED;
43d782ae80b8266 David Rheinsberg 2011-11-17  159  	spin_unlock_irqrestore(&dbg->wdata->state.lock, flags);
43d782ae80b8266 David Rheinsberg 2011-11-17  160  
43d782ae80b8266 David Rheinsberg 2011-11-17  161  	return len;
43d782ae80b8266 David Rheinsberg 2011-11-17  162  }
43d782ae80b8266 David Rheinsberg 2011-11-17  163  

:::::: The code at line 142 was first introduced by commit
:::::: 0d57eb8758c865a70dd05f7c6a857acd996167fa HID: wiimote: fix DRM debug-attr to correctly parse input

:::::: TO: David Herrmann <dh.herrmann@gmail.com>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
