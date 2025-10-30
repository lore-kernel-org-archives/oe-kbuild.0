Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1ACC354ADA
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Oct 2025 11:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761823656; cv=none; b=qMJCqj0zEKX1RQKcNXUcVWx5wgzghXdhEc+sJHahNI2M07vryc/IKB2PQZ/mFfNLsAx8WB59UmhiyZ48UHnoTbmX/nkyMeNXVR7fuj6akfqKPG5L+yzHblqFAnfZ2GtxuYbDemPtkf5QkopQ7IJtNvQT/IGpbBi2NiMH+rTf4YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761823656; c=relaxed/simple;
	bh=Lh+edDBHdU9bKMYiSXCmrXaHcP7i38VQxftCAbILXRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ba5UmoPleo77KnV7yEy84ipnzvPwz57y7QVUHEkAjAWNL9jhAep+LECMSJDd0gGCDP8FcWKgP8X/eZj+B2IQyM24bweTMrP0YNw9rKpfxJgORX6DZ0rS7SDQj2q+rEMLMYJBRZSHbLauH4rMy8e/jUB50J+MxmCIxyqJA6W3wyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAOb9BWW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAOb9BWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761823655; x=1793359655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lh+edDBHdU9bKMYiSXCmrXaHcP7i38VQxftCAbILXRc=;
  b=OAOb9BWWR8KN00L1WrkKBWclXaIx1CHStXMu/CePlpcTeOR0ihv6wv2j
   TZTaolGYtGMDxb3H2wiirI1nN3ssxGMJ8okmf7inlZk7+Z6dJ5ig9bFPd
   FxIGaMG7qTFGz7++kKhmqzQIRrsiqp+EGNJL3atYaRfP38yI6HpV6d+3y
   ykBmOdBMBpzc+Kn1RZNkVAYSkhXwvy9Clpmb7IOl/6v/7BnotObB55g7X
   IleFLl2Rzk6f7hedLOGosoVGZ3XF7q0wznR/voi56K2+v7Qn6er8fQMCL
   FrJgNi69MeyZ2wffOoVaGRSQSsND03dOd7iCQUY1go+TgaP0nxrwFIVLv
   Q==;
X-CSE-ConnectionGUID: s8ie1tfPTKujLIsoLxnZ3Q==
X-CSE-MsgGUID: X56RZa/CQcKh9dzuNGsz/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="62984218"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="62984218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 04:27:34 -0700
X-CSE-ConnectionGUID: UDXKtLQZRESv4dF9S4pTkg==
X-CSE-MsgGUID: wFUgaOHyQKSVYIxJiWsktA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; 
   d="scan'208";a="191094046"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 30 Oct 2025 04:27:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEQoU-000Lt2-39;
	Thu, 30 Oct 2025 11:27:30 +0000
Date: Thu, 30 Oct 2025 19:26:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/misc/mei/main.c:482:1-7: preceding lock on line 466
Message-ID: <202510301941.OD7eyuMN-lkp@intel.com>
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
TO: Alexander Usyskin <alexander.usyskin@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 2b5c4cb2c008f01182f87f529cb104bc5bc80418 mei: retry connect if interrupted by link reset
date:   6 weeks ago
:::::: branch date: 34 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-102-20251030 (https://download.01.org/0day-ci/archive/20251030/202510301941.OD7eyuMN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510301941.OD7eyuMN-lkp@intel.com/

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
