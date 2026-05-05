Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DAE3D1CC0
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 10:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777977710; cv=none; b=pL5GOHx+2lLy6IRS0SP9UlXHxMXwnmh6JGUp128YkbDY8J0GEixGMUtUYT7CYDz/CaeIRizQTtd20nuyAuZxkcAAR6RYdm/wNqBApVdLvGqUFUivuERGsA8dicrsl57Yxw5msRHJpl3VTsBwYTHTJYrCyZJPxN9hA84330w+rns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777977710; c=relaxed/simple;
	bh=SKXEDxzjmf6p/NkLy6/S+Q6Vy4rkz5Ae4D4XaCRhzw8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l+xo+gXSb9f03aDA/5RhnUJYzpX1xkJngCXkcUOd3U1yFu/pT3UmtokRTmRNvV8hybzROOoNvWS8GFawWABY/I+R+/ATKRVnj4QNpXg1RLwBfrJTQf6bheXVYOQhivurInjVVEIZm2HARileWpymYdr+0ZYz9N742C4kYHFKfr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKhVGNqP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKhVGNqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777977708; x=1809513708;
  h=date:from:to:cc:subject:message-id;
  bh=SKXEDxzjmf6p/NkLy6/S+Q6Vy4rkz5Ae4D4XaCRhzw8=;
  b=GKhVGNqP6btVKpq4IwV7mePI29PHEU3+J0nG0mvYh5VITxwKrsQT2Tdi
   /saVAdCDUlTw/eGEgAQgF4XdVUiMpJAVf1n/iT9gj2Dx6xJvThDTjGkzf
   195W55jph6KvVV64kzI7VutOTaJdVvKTqS0z37zxnhpIbUXI2nBSjATek
   gH9jQZ/30GMtyxqqe3QwFVDOjMhVp18YfxkYIflMCTsTVWc9oBWYY717g
   oVyyYogqHnyIfUyilOhqdrwDQE8B6vs9YcGANiMyv3qemOPyn3deaV9Ip
   egQ2seTjBH4JDEnqwf6wM7Hn4iahUNQPhyGrlf8i7nv81e38r1s/PnM2d
   Q==;
X-CSE-ConnectionGUID: UNuYMJMETeeg7VmW9CF5sQ==
X-CSE-MsgGUID: cxmQbXmQTg+w614kIpqO0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="78943134"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="78943134"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 03:41:48 -0700
X-CSE-ConnectionGUID: 3iPmxnNvRxezSX2WF5tzEQ==
X-CSE-MsgGUID: LLlpgUW9SgmnvB30h0shQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; 
   d="scan'208";a="237549638"
Received: from lkp-server01.sh.intel.com (HELO 9ec114424ce8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 May 2026 03:41:47 -0700
Received: from kbuild by 9ec114424ce8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKDDk-0000000005D-1skp;
	Tue, 05 May 2026 10:41:44 +0000
Date: Tue, 05 May 2026 18:41:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/staging/most/video/video.c:176:22-23: WARNING
 opportunity for min()
Message-ID: <202605051807.kGilkgXt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

Hi Tiwei,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   1 year ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year ago
config: um-randconfig-r061-20260505 (https://download.01.org/0day-ci/archive/20260505/202605051807.kGilkgXt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a0e2cb6a9063 ("um: Add VFIO-based virtual PCI driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605051807.kGilkgXt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/staging/most/video/video.c:176:22-23: WARNING opportunity for min()

vim +176 drivers/staging/most/video/video.c

3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  150  
1b10a0316e2d5e2 drivers/staging/most/video/video.c    Christian Gromm 2017-11-21  151  static ssize_t comp_vdev_read(struct file *filp, char __user *buf,
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  152  			      size_t count, loff_t *pos)
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  153  {
1b10a0316e2d5e2 drivers/staging/most/video/video.c    Christian Gromm 2017-11-21  154  	struct comp_fh *fh = filp->private_data;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  155  	struct most_video_dev *mdev = fh->mdev;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  156  	int ret = 0;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  157  
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  158  	if (*pos)
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  159  		return -ESPIPE;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  160  
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  161  	if (!mdev)
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  162  		return -ENODEV;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  163  
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  164  	/* wait for the first buffer */
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  165  	if (!(filp->f_flags & O_NONBLOCK)) {
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  166  		if (wait_event_interruptible(mdev->wait_data, data_ready(mdev)))
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  167  			return -ERESTARTSYS;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  168  	}
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  169  
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  170  	if (!data_ready(mdev))
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  171  		return -EAGAIN;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  172  
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  173  	while (count > 0 && data_ready(mdev)) {
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  174  		struct mbo *const mbo = get_top_mbo(mdev);
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  175  		int const rem = mbo->processed_length - fh->offs;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24 @176  		int const cnt = rem < count ? rem : count;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  177  
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  178  		if (copy_to_user(buf, mbo->virt_address + fh->offs, cnt)) {
8f6f9ed15d679ad drivers/staging/most/aim-v4l2/video.c Christian Gromm 2016-06-06  179  			v4l2_err(&mdev->v4l2_dev, "read: copy_to_user failed\n");
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  180  			if (!ret)
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  181  				ret = -EFAULT;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  182  			return ret;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  183  		}
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  184  
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  185  		fh->offs += cnt;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  186  		count -= cnt;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  187  		buf += cnt;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  188  		ret += cnt;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  189  
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  190  		if (cnt >= rem) {
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  191  			fh->offs = 0;
e494df039df0fc7 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2016-06-06  192  			spin_lock_irq(&mdev->list_lock);
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  193  			list_del(&mbo->list);
e494df039df0fc7 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2016-06-06  194  			spin_unlock_irq(&mdev->list_lock);
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  195  			most_put_mbo(mbo);
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  196  		}
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  197  	}
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  198  	return ret;
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  199  }
3d31c0cb6c127b1 drivers/staging/most/aim-v4l2/video.c Christian Gromm 2015-07-24  200  

:::::: The code at line 176 was first introduced by commit
:::::: 3d31c0cb6c127b1d943b610065a05decf821998c Staging: most: add MOST driver's aim-v4l2 module

:::::: TO: Christian Gromm <christian.gromm@microchip.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
