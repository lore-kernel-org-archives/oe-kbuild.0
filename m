Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C792C4ACC89
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Sep 2026 15:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398911; cv=none; b=IxlOQch70MtjHCtN+d+ThQGEI5SvembpgcD0QoNIvYs4CF70ommdxw+77nstZSdVsq+H+6tOOxDK0Y2sSjMOzXhrY1Y60SWeee/1Ns0QWog5Q9sJIRMizbeMzl1s5kNIT5Vzscu/vPEv0c6SPX8DBdYd00Rv8wUBgKf+XZM/0cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398911; c=relaxed/simple;
	bh=/xY8NZklJfEYLmfWxj1I1RTAg3M/DjxeJeWtoKgDL7g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MNygLCwbsrn9pXE9TugS8Ntv1PcDSPItbWVFvok27P2u503q75M4eVAFItBubvqYUeDDByBOPurbcKw27lySGalwy2g8FD32PJs1+pn0zT2js32INW/J7Z8BnUuOYi3BYByY564ex3xU+dW/7UO0YHGtVYyEDi5yUIo3Aq3RMmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TjHdI6L9; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TjHdI6L9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789398908; x=1820934908;
  h=date:from:to:cc:subject:message-id;
  bh=/xY8NZklJfEYLmfWxj1I1RTAg3M/DjxeJeWtoKgDL7g=;
  b=TjHdI6L9zoVenr+BcYYKFixbz5fNAHrg8Mf2WddQu5A61JRdQcSDMkvv
   pisW9OCeg6JciY6HeP8Ufg+Oijbogto5VXfkB1WEhNjfjpltd6G6pmWx5
   sqhaRueFCgadVlcq/mpGSMK4QE2Xg2SdjoLo4dHT9bkYnG6lt2q74M65h
   YRCGvgmTypy3faAHR4L6VhrTCXzu1JE0mHw4pVipbvFR59KvzvRu5RZuH
   W20o4W1pgVYmKNB+p7f3qpDQx6qMx+2HJ2+tsY5IHV2v+mksRNUcsG0cK
   EqLtphqk1CDqE4aMNPfpvb+uDUmLSvV7VI3bTPhSe64LHZ6PM8vwK1i2V
   g==;
X-CSE-ConnectionGUID: V/5PTy9eSV6x4ACQeOH0mQ==
X-CSE-MsgGUID: LPvNQ76ATROBOFmbu5mjVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="262612"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="262612"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 08:15:02 -0700
X-CSE-ConnectionGUID: DjstjkSORdqCcStsF0V0sA==
X-CSE-MsgGUID: osE7oC6VTAuXB7Xi/1eihw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="268985371"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 Sep 2026 08:15:00 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x68OY-000000000Cb-0L2y;
	Mon, 14 Sep 2026 15:14:58 +0000
Date: Mon, 14 Sep 2026 17:14:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/misc/mei/main.c:482:1-7: preceding lock on line 466
Message-ID: <202609141711.sxkwRfL6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexander Usyskin <alexander.usyskin@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
commit: 2b5c4cb2c008f01182f87f529cb104bc5bc80418 mei: retry connect if interrupted by link reset
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-104-20260913 (https://download.01.org/0day-ci/archive/20260914/202609141711.sxkwRfL6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2b5c4cb2c008 ("mei: retry connect if interrupted by link reset")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609141711.sxkwRfL6-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/misc/mei/main.c:482:1-7: preceding lock on line 466

vim +482 drivers/misc/mei/main.c

ab841160d907bf drivers/staging/mei/main.c Oren Weil         2011-05-15  398  
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  399  /**
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  400   * mei_ioctl_connect_client - the connect to fw client IOCTL function
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  401   *
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  402   * @file: private data of the file object
aa207a05f95abc drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  403   * @in_client_uuid: requested UUID for connection
aa207a05f95abc drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  404   * @client: IOCTL connect data, output parameters
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  405   *
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  406   * Locking: called under "dev->device_lock" lock
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  407   *
a8605ea2c20c2b drivers/misc/mei/main.c    Alexander Usyskin 2014-09-29  408   * Return: 0 on success, <0 on failure.
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  409   */
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  410  static int mei_ioctl_connect_client(struct file *file,
aa207a05f95abc drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  411  				    const uuid_le *in_client_uuid,
aa207a05f95abc drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  412  				    struct mei_client *client)
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  413  {
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  414  	struct mei_device *dev;
d320832f646660 drivers/misc/mei/main.c    Tomas Winkler     2014-08-24  415  	struct mei_me_client *me_cl;
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  416  	struct mei_cl *cl;
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  417  	int rets;
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  418  
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  419  	cl = file->private_data;
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  420  	dev = cl->dev;
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  421  
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  422  	if (cl->state != MEI_FILE_INITIALIZING &&
79563db9ddd379 drivers/misc/mei/main.c    Tomas Winkler     2015-01-11  423  	    cl->state != MEI_FILE_DISCONNECTED)
79563db9ddd379 drivers/misc/mei/main.c    Tomas Winkler     2015-01-11  424  		return  -EBUSY;
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  425  
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  426  retry:
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  427  	/* find ME client we're trying to connect to */
aa207a05f95abc drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  428  	me_cl = mei_me_cl_by_uuid(dev, in_client_uuid);
f4e06246183f18 drivers/misc/mei/main.c    Alexander Usyskin 2016-02-07  429  	if (!me_cl) {
631ae0c01010ba drivers/misc/mei/main.c    Alexander Usyskin 2025-07-17  430  		cl_dbg(dev, cl, "Cannot connect to FW Client UUID = %pUl\n",
aa207a05f95abc drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  431  			in_client_uuid);
f4e06246183f18 drivers/misc/mei/main.c    Alexander Usyskin 2016-02-07  432  		rets = -ENOTTY;
f4e06246183f18 drivers/misc/mei/main.c    Alexander Usyskin 2016-02-07  433  		goto end;
f4e06246183f18 drivers/misc/mei/main.c    Alexander Usyskin 2016-02-07  434  	}
f4e06246183f18 drivers/misc/mei/main.c    Alexander Usyskin 2016-02-07  435  
f4e06246183f18 drivers/misc/mei/main.c    Alexander Usyskin 2016-02-07  436  	if (me_cl->props.fixed_address) {
f4e06246183f18 drivers/misc/mei/main.c    Alexander Usyskin 2016-02-07  437  		bool forbidden = dev->override_fixed_address ?
f4e06246183f18 drivers/misc/mei/main.c    Alexander Usyskin 2016-02-07  438  			 !dev->allow_fixed_address : !dev->hbm_f_fa_supported;
f4e06246183f18 drivers/misc/mei/main.c    Alexander Usyskin 2016-02-07  439  		if (forbidden) {
631ae0c01010ba drivers/misc/mei/main.c    Alexander Usyskin 2025-07-17  440  			cl_dbg(dev, cl, "Connection forbidden to FW Client UUID = %pUl\n",
aa207a05f95abc drivers/misc/mei/main.c    Alexander Usyskin 2020-08-18  441  				in_client_uuid);
f4e06246183f18 drivers/misc/mei/main.c    Alexander Usyskin 2016-02-07  442  			rets = -ENOTTY;
f4e06246183f18 drivers/misc/mei/main.c    Alexander Usyskin 2016-02-07  443  			goto end;
f4e06246183f18 drivers/misc/mei/main.c    Alexander Usyskin 2016-02-07  444  		}
80fe6361540fd7 drivers/misc/mei/main.c    Tomas Winkler     2013-05-07  445  	}
80fe6361540fd7 drivers/misc/mei/main.c    Tomas Winkler     2013-05-07  446  
631ae0c01010ba drivers/misc/mei/main.c    Alexander Usyskin 2025-07-17  447  	cl_dbg(dev, cl, "Connect to FW Client ID = %d\n", me_cl->client_id);
631ae0c01010ba drivers/misc/mei/main.c    Alexander Usyskin 2025-07-17  448  	cl_dbg(dev, cl, "FW Client - Protocol Version = %d\n", me_cl->props.protocol_version);
631ae0c01010ba drivers/misc/mei/main.c    Alexander Usyskin 2025-07-17  449  	cl_dbg(dev, cl, "FW Client - Max Msg Len = %d\n", me_cl->props.max_msg_length);
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  450  
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  451  	/* prepare the output buffer */
d320832f646660 drivers/misc/mei/main.c    Tomas Winkler     2014-08-24  452  	client->max_msg_length = me_cl->props.max_msg_length;
d320832f646660 drivers/misc/mei/main.c    Tomas Winkler     2014-08-24  453  	client->protocol_version = me_cl->props.protocol_version;
631ae0c01010ba drivers/misc/mei/main.c    Alexander Usyskin 2025-07-17  454  	cl_dbg(dev, cl, "Can connect?\n");
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  455  
d49ed64a6e3f73 drivers/misc/mei/main.c    Alexander Usyskin 2015-05-04  456  	rets = mei_cl_connect(cl, me_cl, file);
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  457  
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  458  	if (rets && cl->status == -EFAULT &&
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  459  	    (dev->dev_state == MEI_DEV_RESETTING ||
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  460  	     dev->dev_state == MEI_DEV_INIT_CLIENTS)) {
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  461  		/* in link reset, wait for it completion */
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  462  		mutex_unlock(&dev->device_lock);
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  463  		rets = wait_event_interruptible_timeout(dev->wait_dev_state,
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  464  							dev->dev_state == MEI_DEV_ENABLED,
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  465  							dev->timeouts.link_reset_wait);
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18 @466  		mutex_lock(&dev->device_lock);
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  467  		if (rets < 0) {
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  468  			if (signal_pending(current))
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  469  				rets = -EINTR;
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  470  			goto end;
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  471  		}
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  472  		if (dev->dev_state != MEI_DEV_ENABLED) {
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  473  			rets = -ETIME;
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  474  			goto end;
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  475  		}
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  476  		mei_me_cl_put(me_cl);
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  477  		goto retry;
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  478  	}
2b5c4cb2c008f0 drivers/misc/mei/main.c    Alexander Usyskin 2025-09-18  479  
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  480  end:
79563db9ddd379 drivers/misc/mei/main.c    Tomas Winkler     2015-01-11  481  	mei_me_cl_put(me_cl);
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08 @482  	return rets;
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  483  }
9f81abdac36296 drivers/misc/mei/main.c    Tomas Winkler     2013-01-08  484  

:::::: The code at line 482 was first introduced by commit
:::::: 9f81abdac3629629a246fdc9e2a7c01ffd52ce8a mei: implement mei_cl_connect function

:::::: TO: Tomas Winkler <tomas.winkler@intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
