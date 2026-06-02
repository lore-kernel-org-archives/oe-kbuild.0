Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8902D35F5E0
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jun 2026 06:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780381970; cv=none; b=O+DHmWgn7QiDYb/r8OEeiCAKl4STWU3fI5pVU2np96QE9CSbQxX+q6+QOWN4rEY4mrXzTfIK0qSPPLaVX5oR12d0OK0XElDIbvO9rBb0lNLtK539f1ORi6OBKGxnh6DeJKVWUmGnINzGOynuaxLlZWneCOJdrgR2iYNFtZxgdgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780381970; c=relaxed/simple;
	bh=U3JPlQMCEAvOtCfPpB7E7Pip349aCItvhvMT5XEBLB4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JSE7O5MLgadMXNrJPtn5qtzSs6YijeDAO0L+rzHZNTMWbKnRJBu0eLHFpM9jZymN4DpRkn2oYdg85ncLCbzpYpUjsV/eWesrL+/CbUyfEX9Tr83/rtd809TR3Ey5lF261spN9ZZ+dHihaPlOIulWb/zvzfvQNzaHuPT0x1AqIsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Da/f27SG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Da/f27SG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780381968; x=1811917968;
  h=date:from:to:cc:subject:message-id;
  bh=U3JPlQMCEAvOtCfPpB7E7Pip349aCItvhvMT5XEBLB4=;
  b=Da/f27SGinoFiZ0yhOle8xgdoeAIVQhzK5nSCpVj6E2eTGZdZBk4wOT9
   cvfJK5Z5aiCYm7uB85nf9FQOPRleVt5YJyOt+k9FCn9kflnPK6QoWI++r
   /9WAzwdnvqwUvrNXoNaiagmYKned8z8GFc2Qmlig4N0zJqmSzMIUjZdh9
   vk8/BYD2IFRiDfKwJsXAUnC5lyBq8Zj89LsBkPb0Bur2pYMVtGUmewZBl
   STe1p6WkACk+3RfimsGQAwzio+nSCZHdAUws4ktsr712SZt4w3risBTIQ
   gW214lLicKe0U0kwPKW8FwFs0ZdL2T0k3BwlE1AunWiO/ndoTlF9OFUxZ
   A==;
X-CSE-ConnectionGUID: oYO4yHSuQKuGMH/5GZrWxg==
X-CSE-MsgGUID: DmOc/0n5RjaHOivFjWk52g==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="68703429"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="68703429"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 23:32:48 -0700
X-CSE-ConnectionGUID: plhCn3U2REaFbagg1xVwhA==
X-CSE-MsgGUID: dxMxhfwUQZqEeF1vdbVwug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="248741661"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Jun 2026 23:32:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUIg7-00000000Bbg-49pw;
	Tue, 02 Jun 2026 06:32:43 +0000
Date: Tue, 02 Jun 2026 14:32:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/misc/mei/main.c:482:1-7: preceding lock on line 466
Message-ID: <202606021422.qWcbUC4Y-lkp@intel.com>
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
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: 2b5c4cb2c008f01182f87f529cb104bc5bc80418 mei: retry connect if interrupted by link reset
date:   9 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-r053-20260602 (https://download.01.org/0day-ci/archive/20260602/202606021422.qWcbUC4Y-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2b5c4cb2c008 ("mei: retry connect if interrupted by link reset")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606021422.qWcbUC4Y-lkp@intel.com/

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
