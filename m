Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CEAEC0
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 01:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742003514; cv=none; b=PyOQiG6Ysc3h/+Pwc9LniwntWfE1dl2CQH9enPmqiESFd1P6wtjJY2WSMyn+/MlfE0VxEplho2hrUdUblZQH11LRSLJr3ekoTwn04CQKmPRlgIpnTyh8DR9FuX2NkWc8bnuJDM1q/MdUCgsgTm3byuuCEEYBKQ3DT5vF9QeZAF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742003514; c=relaxed/simple;
	bh=C2hN7kZcGT/XRPXSQoI6xpStJoY0mqAsH/30sMZveS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YaiYxCStwY9l1y5CDV8dbIsVdqzq52FH2ddIjYxiQ/t3JT/VIKMLq6Ed1PE3iHFg//mYap1kOtKDspkiobohznrRGWAotSO+LcLXvx+WFODnehtcp34hMn8xXhrx3CUQWOhym1NeFeUmzgQsy/Hi/KjiFm2aDh9AflLddWFP2uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGR2lI3g; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGR2lI3g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742003512; x=1773539512;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=C2hN7kZcGT/XRPXSQoI6xpStJoY0mqAsH/30sMZveS8=;
  b=oGR2lI3grS/CrvPVvha2WeWlW6gB5mzmUKT63Jp4FNUxJXQjT/fxOl7n
   8W58dQvhOw+pb6mu9aia25Q//D9N36OxInWRBMRntmH0yn8kx5PisaziB
   8+4CwqTGjiE4XGJNHtKFYnZtqTDJ03Cc6Lna29NbBqB//Xk72Pz6kF9oS
   yxDoAuGfygz3OqMvoxjdvyrhEiIY/oHgfWeuWJfvYzgrdznYyhyLaUYz3
   NSvpOB6OYVgwZklmf6rQvAQLTKfoQU810mBa7d7saz02dgS+T3WEBAAyb
   iJyaIUka8+j/Y6Mlay+/VM71aUvsG0AyhjuBjtqkpwY1pciosp1gOFIAX
   A==;
X-CSE-ConnectionGUID: Mw4QrD9pSueHq5pfPvwD9A==
X-CSE-MsgGUID: j0+9y1WnR/2qX1CcGfN1CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="54540495"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="54540495"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 18:51:50 -0700
X-CSE-ConnectionGUID: FayGbUDfS7ejNYZYwAwViA==
X-CSE-MsgGUID: WmrOuPtqSzWCR/w7ljh9vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="122387743"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Mar 2025 18:51:48 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttGgj-000Az5-1c;
	Sat, 15 Mar 2025 01:51:45 +0000
Date: Sat, 15 Mar 2025 09:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/usb/gadget/function/f_fs.c:1021 ffs_epfile_io() warn: 'ep'
 can also be NULL
Message-ID: <202503150959.Y7gphwDY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Paul Cercueil <paul@crapouillou.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a29967be967eebf049e89edb14c4edf9991bc929
commit: 799970a5b15deec8bbcb098b11a73d8acc55d075 usb: gadget: functionfs: Factorize wait-for-endpoint code
date:   1 year, 1 month ago
:::::: branch date: 83 minutes ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-randconfig-161-20250315 (https://download.01.org/0day-ci/archive/20250315/202503150959.Y7gphwDY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503150959.Y7gphwDY-lkp@intel.com/

New smatch warnings:
drivers/usb/gadget/function/f_fs.c:1021 ffs_epfile_io() warn: 'ep' can also be NULL

Old smatch warnings:
drivers/usb/gadget/function/f_fs.c:1044 ffs_epfile_io() warn: 'ep' can also be NULL
drivers/usb/gadget/function/f_fs.c:1064 ffs_epfile_io() warn: 'ep' can also be NULL
drivers/usb/gadget/function/f_fs.c:1113 ffs_epfile_io() warn: 'ep' can also be NULL

vim +/ep +1021 drivers/usb/gadget/function/f_fs.c

799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   957  
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   958  static ssize_t ffs_epfile_io(struct file *file, struct ffs_io_data *io_data)
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   959  {
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   960  	struct ffs_epfile *epfile = file->private_data;
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   961  	struct usb_request *req;
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   962  	struct ffs_ep *ep;
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   963  	char *data = NULL;
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   964  	ssize_t ret, data_len = -EINVAL;
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   965  	int halt;
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   966  
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   967  	/* Are we still active? */
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   968  	if (WARN_ON(epfile->ffs->state != FFS_ACTIVE))
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   969  		return -ENODEV;
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   970  
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   971  	ep = ffs_epfile_wait_ep(file);
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   972  	if (IS_ERR(ep))
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   973  		return PTR_ERR(ep);
799970a5b15deec drivers/usb/gadget/function/f_fs.c Paul Cercueil         2024-01-30   974  
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05   975  	/* Do we halt? */
2e4c7553cd6f9c6 drivers/usb/gadget/f_fs.c          Robert Baldyga        2014-02-10   976  	halt = (!io_data->read == !epfile->in);
b3591f67b9f9607 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04   977  	if (halt && epfile->isoc)
b3591f67b9f9607 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04   978  		return -EINVAL;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05   979  
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   980  	/* We will be using request and read_buffer */
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   981  	ret = ffs_mutex_lock(&epfile->mutex, file->f_flags & O_NONBLOCK);
8704fd73bf5658b drivers/usb/gadget/function/f_fs.c Greg Kroah-Hartman    2020-11-27   982  	if (ret)
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   983  		goto error;
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   984  
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05   985  	/* Allocate & copy */
7fa6803483ed215 drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2013-12-09   986  	if (!halt) {
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   987  		struct usb_gadget *gadget;
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   988  
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   989  		/*
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   990  		 * Do we have buffered data from previous partial read?  Check
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   991  		 * that for synchronous case only because we do not have
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   992  		 * facility to ‘wake up’ a pending asynchronous read and push
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   993  		 * buffered data to it which we would need to make things behave
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   994  		 * consistently.
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   995  		 */
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   996  		if (!io_data->aio && io_data->read) {
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   997  			ret = __ffs_epfile_read_buffered(epfile, &io_data->data);
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   998  			if (ret)
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21   999  				goto error_mutex;
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1000  		}
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1001  
f0f42204d0cc04a drivers/usb/gadget/f_fs.c          Andrzej Pietrasiewicz 2014-01-20  1002  		/*
f0f42204d0cc04a drivers/usb/gadget/f_fs.c          Andrzej Pietrasiewicz 2014-01-20  1003  		 * if we _do_ wait above, the epfile->ffs->gadget might be NULL
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1004  		 * before the waiting completes, so do not assign to 'gadget'
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1005  		 * earlier
f0f42204d0cc04a drivers/usb/gadget/f_fs.c          Andrzej Pietrasiewicz 2014-01-20  1006  		 */
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1007  		gadget = epfile->ffs->gadget;
f0f42204d0cc04a drivers/usb/gadget/f_fs.c          Andrzej Pietrasiewicz 2014-01-20  1008  
97839ca4b06ab27 drivers/usb/gadget/f_fs.c          Chao Bi               2014-04-14  1009  		spin_lock_irq(&epfile->ffs->eps_lock);
97839ca4b06ab27 drivers/usb/gadget/f_fs.c          Chao Bi               2014-04-14  1010  		/* In the meantime, endpoint got disabled or changed. */
97839ca4b06ab27 drivers/usb/gadget/f_fs.c          Chao Bi               2014-04-14  1011  		if (epfile->ep != ep) {
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1012  			ret = -ESHUTDOWN;
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1013  			goto error_lock;
97839ca4b06ab27 drivers/usb/gadget/f_fs.c          Chao Bi               2014-04-14  1014  		}
c993c39b86398c6 drivers/usb/gadget/function/f_fs.c Al Viro               2015-01-31  1015  		data_len = iov_iter_count(&io_data->data);
219580e64f035bb drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2013-12-09  1016  		/*
219580e64f035bb drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2013-12-09  1017  		 * Controller may require buffer size to be aligned to
219580e64f035bb drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2013-12-09  1018  		 * maxpacketsize of an out endpoint.
219580e64f035bb drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2013-12-09  1019  		 */
c993c39b86398c6 drivers/usb/gadget/function/f_fs.c Al Viro               2015-01-31  1020  		if (io_data->read)
c993c39b86398c6 drivers/usb/gadget/function/f_fs.c Al Viro               2015-01-31 @1021  			data_len = usb_ep_align_maybe(gadget, ep->ep, data_len);
4833a94eb383f5b drivers/usb/gadget/function/f_fs.c Fei Yang              2019-06-12  1022  
4833a94eb383f5b drivers/usb/gadget/function/f_fs.c Fei Yang              2019-06-12  1023  		io_data->use_sg = gadget->sg_supported && data_len > PAGE_SIZE;
97839ca4b06ab27 drivers/usb/gadget/f_fs.c          Chao Bi               2014-04-14  1024  		spin_unlock_irq(&epfile->ffs->eps_lock);
219580e64f035bb drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2013-12-09  1025  
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1026  		data = ffs_alloc_buffer(io_data, data_len);
8704fd73bf5658b drivers/usb/gadget/function/f_fs.c Greg Kroah-Hartman    2020-11-27  1027  		if (!data) {
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1028  			ret = -ENOMEM;
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1029  			goto error_mutex;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1030  		}
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1031  		if (!io_data->read &&
cbbd26b8b1a6af9 drivers/usb/gadget/function/f_fs.c Al Viro               2016-11-01  1032  		    !copy_from_iter_full(data, data_len, &io_data->data)) {
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1033  			ret = -EFAULT;
9353afbbfa7b107 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1034  			goto error_mutex;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1035  		}
2e4c7553cd6f9c6 drivers/usb/gadget/f_fs.c          Robert Baldyga        2014-02-10  1036  	}
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1037  
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1038  	spin_lock_irq(&epfile->ffs->eps_lock);
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1039  
7fa6803483ed215 drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2013-12-09  1040  	if (epfile->ep != ep) {
7fa6803483ed215 drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2013-12-09  1041  		/* In the meantime, endpoint got disabled or changed. */
7fa6803483ed215 drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2013-12-09  1042  		ret = -ESHUTDOWN;
7fa6803483ed215 drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2013-12-09  1043  	} else if (halt) {
cdff9f8ee1688f7 drivers/usb/gadget/function/f_fs.c Jerry Zhang           2017-08-11  1044  		ret = usb_ep_set_halt(ep->ep);
cdff9f8ee1688f7 drivers/usb/gadget/function/f_fs.c Jerry Zhang           2017-08-11  1045  		if (!ret)
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1046  			ret = -EBADMSG;
8704fd73bf5658b drivers/usb/gadget/function/f_fs.c Greg Kroah-Hartman    2020-11-27  1047  	} else if (data_len == -EINVAL) {
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1048  		/*
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1049  		 * Sanity Check: even though data_len can't be used
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1050  		 * uninitialized at the time I write this comment, some
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1051  		 * compilers complain about this situation.
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1052  		 * In order to keep the code clean from warnings, data_len is
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1053  		 * being initialized to -EINVAL during its declaration, which
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1054  		 * means we can't rely on compiler anymore to warn no future
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1055  		 * changes won't result in data_len being used uninitialized.
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1056  		 * For such reason, we're adding this redundant sanity check
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1057  		 * here.
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1058  		 */
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1059  		WARN(1, "%s: data_len == -EINVAL\n", __func__);
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1060  		ret = -EINVAL;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1061  	} else if (!io_data->aio) {
ef15088440e2b34 drivers/usb/gadget/function/f_fs.c Changbin Du           2015-12-29  1062  		bool interrupted = false;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1063  
2e4c7553cd6f9c6 drivers/usb/gadget/f_fs.c          Robert Baldyga        2014-02-10  1064  		req = ep->req;
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1065  		if (io_data->use_sg) {
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1066  			req->buf = NULL;
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1067  			req->sg	= io_data->sgt.sgl;
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1068  			req->num_sgs = io_data->sgt.nents;
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1069  		} else {
2e4c7553cd6f9c6 drivers/usb/gadget/f_fs.c          Robert Baldyga        2014-02-10  1070  			req->buf = data;
d2450c6937018d4 drivers/usb/gadget/function/f_fs.c Peter Chen            2019-12-12  1071  			req->num_sgs = 0;
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1072  		}
c0d31b3c3d9a025 drivers/usb/gadget/function/f_fs.c David Cohen           2014-10-13  1073  		req->length = data_len;
2e4c7553cd6f9c6 drivers/usb/gadget/f_fs.c          Robert Baldyga        2014-02-10  1074  
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1075  		io_data->buf = data;
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1076  
fb1f16d74e263ba drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1077  		init_completion(&io_data->done);
fb1f16d74e263ba drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1078  		req->context  = io_data;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1079  		req->complete = ffs_epfile_io_complete;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1080  
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1081  		ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
8704fd73bf5658b drivers/usb/gadget/function/f_fs.c Greg Kroah-Hartman    2020-11-27  1082  		if (ret < 0)
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1083  			goto error_lock;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1084  
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1085  		spin_unlock_irq(&epfile->ffs->eps_lock);
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1086  
fb1f16d74e263ba drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1087  		if (wait_for_completion_interruptible(&io_data->done)) {
0698f0209d8032e drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1088  			spin_lock_irq(&epfile->ffs->eps_lock);
0698f0209d8032e drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1089  			if (epfile->ep != ep) {
0698f0209d8032e drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1090  				ret = -ESHUTDOWN;
0698f0209d8032e drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1091  				goto error_lock;
0698f0209d8032e drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1092  			}
ef15088440e2b34 drivers/usb/gadget/function/f_fs.c Changbin Du           2015-12-29  1093  			/*
ef15088440e2b34 drivers/usb/gadget/function/f_fs.c Changbin Du           2015-12-29  1094  			 * To avoid race condition with ffs_epfile_io_complete,
ef15088440e2b34 drivers/usb/gadget/function/f_fs.c Changbin Du           2015-12-29  1095  			 * dequeue the request first then check
ef15088440e2b34 drivers/usb/gadget/function/f_fs.c Changbin Du           2015-12-29  1096  			 * status. usb_ep_dequeue API should guarantee no race
ef15088440e2b34 drivers/usb/gadget/function/f_fs.c Changbin Du           2015-12-29  1097  			 * condition with req->complete callback.
ef15088440e2b34 drivers/usb/gadget/function/f_fs.c Changbin Du           2015-12-29  1098  			 */
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1099  			usb_ep_dequeue(ep->ep, req);
0698f0209d8032e drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1100  			spin_unlock_irq(&epfile->ffs->eps_lock);
fb1f16d74e263ba drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1101  			wait_for_completion(&io_data->done);
fb1f16d74e263ba drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1102  			interrupted = io_data->status < 0;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1103  		}
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1104  
c662a31be755f5e drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1105  		if (interrupted)
c662a31be755f5e drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1106  			ret = -EINTR;
fb1f16d74e263ba drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1107  		else if (io_data->read && io_data->status > 0)
fb1f16d74e263ba drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1108  			ret = __ffs_epfile_read_data(epfile, data, io_data->status,
c662a31be755f5e drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1109  						     &io_data->data);
c662a31be755f5e drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-05-21  1110  		else
fb1f16d74e263ba drivers/usb/gadget/function/f_fs.c Linyu Yuan            2022-06-10  1111  			ret = io_data->status;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1112  		goto error_mutex;
30bf90ccdec1da9 drivers/usb/gadget/function/f_fs.c Vincent Pelletier     2017-11-26  1113  	} else if (!(req = usb_ep_alloc_request(ep->ep, GFP_ATOMIC))) {
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1114  		ret = -ENOMEM;
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1115  	} else {
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1116  		if (io_data->use_sg) {
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1117  			req->buf = NULL;
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1118  			req->sg	= io_data->sgt.sgl;
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1119  			req->num_sgs = io_data->sgt.nents;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1120  		} else {
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1121  			req->buf = data;
d2450c6937018d4 drivers/usb/gadget/function/f_fs.c Peter Chen            2019-12-12  1122  			req->num_sgs = 0;
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1123  		}
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1124  		req->length = data_len;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1125  
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1126  		io_data->buf = data;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1127  		io_data->ep = ep->ep;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1128  		io_data->req = req;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1129  		io_data->ffs = epfile->ffs;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1130  
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1131  		req->context  = io_data;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1132  		req->complete = ffs_epfile_async_io_complete;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1133  
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1134  		ret = usb_ep_queue(ep->ep, req, GFP_ATOMIC);
8704fd73bf5658b drivers/usb/gadget/function/f_fs.c Greg Kroah-Hartman    2020-11-27  1135  		if (ret) {
f63ec55ff904b2f drivers/usb/gadget/function/f_fs.c Sriharsha Allenki     2020-03-26  1136  			io_data->req = NULL;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1137  			usb_ep_free_request(ep->ep, req);
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1138  			goto error_lock;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1139  		}
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1140  
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1141  		ret = -EIOCBQUEUED;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1142  		/*
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1143  		 * Do not kfree the buffer in this function.  It will be freed
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1144  		 * by ffs_user_copy_worker.
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1145  		 */
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1146  		data = NULL;
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1147  	}
48968f8d5f2234f drivers/usb/gadget/f_fs.c          Robert Baldyga        2014-03-10  1148  
48968f8d5f2234f drivers/usb/gadget/f_fs.c          Robert Baldyga        2014-03-10  1149  error_lock:
48968f8d5f2234f drivers/usb/gadget/f_fs.c          Robert Baldyga        2014-03-10  1150  	spin_unlock_irq(&epfile->ffs->eps_lock);
ae76e13477d8de0 drivers/usb/gadget/function/f_fs.c Michal Nazarewicz     2016-01-04  1151  error_mutex:
48968f8d5f2234f drivers/usb/gadget/f_fs.c          Robert Baldyga        2014-03-10  1152  	mutex_unlock(&epfile->mutex);
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1153  error:
73103c7f958b995 drivers/usb/gadget/function/f_fs.c Fei Yang              2019-03-19  1154  	if (ret != -EIOCBQUEUED) /* don't free if there is iocb queued */
772a7a724f69d25 drivers/usb/gadget/function/f_fs.c Andrzej Pietrasiewicz 2018-11-14  1155  		ffs_free_buffer(io_data);
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1156  	return ret;
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1157  }
ddf8abd2599491c drivers/usb/gadget/f_fs.c          Michal Nazarewicz     2010-05-05  1158  

:::::: The code at line 1021 was first introduced by commit
:::::: c993c39b86398c627afda36b45dc92de655e213e gadget/function/f_fs.c: use put iov_iter into io_data

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
