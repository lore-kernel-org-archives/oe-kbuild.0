Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B28C1684A3
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 22:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728167192; cv=none; b=mAB/RYpWi6jkpIEuKhqds0DKGsRG2FIH9uw7VCh7C9Ed2cDGj+kz/uVm5Xq4RbgSm6tgYsLa3zUHu2H4T5KQR1AfcHtmZPT5lPmAEIyP6SgRzIFRdElGCwvb5hPst8GuKa2B++0zGsDEI7rpSM+uQsr5GrO9ShzbmUKrWmeMRUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728167192; c=relaxed/simple;
	bh=3LsP6YA8JtqvFw+J9noahUx0ru2R4eNNjQQQkekivf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qzaO/MvrIhpn2z4tUDBsUZYbSGDtttYgzMOMXFEy0E/Lz7AsHaKc0FwguiTgRmL3gOOaTf4dAGFp1BfS0Egy2Bw8ksryTJnvjjuLHEoNbsvNM42D5Dg1ZbdfHiAM4tG2J+5dDUSH+MWPnyEnH4itv11kQo3LfVXYzPWpsw6Z8Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=In2HJAmd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="In2HJAmd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728167191; x=1759703191;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3LsP6YA8JtqvFw+J9noahUx0ru2R4eNNjQQQkekivf8=;
  b=In2HJAmdoTb22d+VfMz7aGYq1bcIrAh37rZZYAKAYgFeroBkJ/TfLN+W
   O6d/lQ+xggRUFFI4z1I0QDAUra/AMBfR81SU//8UzADUOq0WMuFLJuEX2
   jIHfSPVQlulgAjjOwXk/X5EY2s3+caCBdVoZGnZhsyNevvYj4UROKg8v5
   AN+9iK5TUauKzJonuHi8gk6ZZq04o/TCP/4nEKF7tUhS7NvMyGyuv7e/P
   5eTAHIGV5F7aMDr0oUbeCLHwWMKUjm+S5G/XNQPKC53GEnWDaKcuBV7G8
   /E1VPqKRA4F1qOJWtCvTlcCbBKYnHCQRGVEZudqh6gSGTTQAFhIAm1QiE
   Q==;
X-CSE-ConnectionGUID: v20yXWj5StKw493icrtCWg==
X-CSE-MsgGUID: TrVqkBJ8QFy9zBzMrz6s0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="27244482"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="27244482"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 15:26:30 -0700
X-CSE-ConnectionGUID: vq89dTaWTC2ri5nIxnJo0A==
X-CSE-MsgGUID: faLmPZLTRsqScJC30beRKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="79639571"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Oct 2024 15:26:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxDEI-0003PS-2w;
	Sat, 05 Oct 2024 22:26:26 +0000
Date: Sun, 6 Oct 2024 06:26:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ambarus:mailbox-request-v1 1/1] drivers/mailbox/mailbox.c:543
 mbox_free_channel() warn: variable dereferenced before check 'chan' (see
 line 540)
Message-ID: <202410060657.bzHprVZf-lkp@intel.com>
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
TO: Tudor Ambarus <tudor.ambarus@linaro.org>

tree:   https://github.com/ambarus/linux-0day mailbox-request-v1
head:   1f2e24358cc2d39e5a26ef0a6b0fe65920f04caf
commit: 1f2e24358cc2d39e5a26ef0a6b0fe65920f04caf [1/1] maybox: add simple async mechanism to empower controllers
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: sparc64-randconfig-r073-20241005 (https://download.01.org/0day-ci/archive/20241006/202410060657.bzHprVZf-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410060657.bzHprVZf-lkp@intel.com/

smatch warnings:
drivers/mailbox/mailbox.c:543 mbox_free_channel() warn: variable dereferenced before check 'chan' (see line 540)

vim +/chan +543 drivers/mailbox/mailbox.c

dfabde206aa10a Lee Jones     2015-05-11  532  
2b6d83e2b8b7de Jassi Brar    2014-06-12  533  /**
2b6d83e2b8b7de Jassi Brar    2014-06-12  534   * mbox_free_channel - The client relinquishes control of a mailbox
2b6d83e2b8b7de Jassi Brar    2014-06-12  535   *			channel by this call.
2b6d83e2b8b7de Jassi Brar    2014-06-12  536   * @chan: The mailbox channel to be freed.
2b6d83e2b8b7de Jassi Brar    2014-06-12  537   */
2b6d83e2b8b7de Jassi Brar    2014-06-12  538  void mbox_free_channel(struct mbox_chan *chan)
2b6d83e2b8b7de Jassi Brar    2014-06-12  539  {
1f2e24358cc2d3 Tudor Ambarus 2024-10-03 @540  	struct mbox_controller *mbox = chan->mbox;
2b6d83e2b8b7de Jassi Brar    2014-06-12  541  	unsigned long flags;
2b6d83e2b8b7de Jassi Brar    2014-06-12  542  
2b6d83e2b8b7de Jassi Brar    2014-06-12 @543  	if (!chan || !chan->cl)
2b6d83e2b8b7de Jassi Brar    2014-06-12  544  		return;
2b6d83e2b8b7de Jassi Brar    2014-06-12  545  
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  546  	if (mbox->ops->shutdown)
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  547  		mbox->ops->shutdown(chan);
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  548  
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  549  	if (mbox->ops->send_request)
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  550  		return module_put(mbox->dev->driver->owner);
2b6d83e2b8b7de Jassi Brar    2014-06-12  551  
2b6d83e2b8b7de Jassi Brar    2014-06-12  552  	/* The queued TX requests are simply aborted, no callbacks are made */
2b6d83e2b8b7de Jassi Brar    2014-06-12  553  	spin_lock_irqsave(&chan->lock, flags);
2b6d83e2b8b7de Jassi Brar    2014-06-12  554  	chan->cl = NULL;
2b6d83e2b8b7de Jassi Brar    2014-06-12  555  	chan->active_req = NULL;
33cd7123ac0ba5 Sudeep Holla  2017-09-28  556  	if (chan->txdone_method == TXDONE_BY_ACK)
2b6d83e2b8b7de Jassi Brar    2014-06-12  557  		chan->txdone_method = TXDONE_BY_POLL;
2b6d83e2b8b7de Jassi Brar    2014-06-12  558  
1f2e24358cc2d3 Tudor Ambarus 2024-10-03  559  	module_put(mbox->dev->driver->owner);
2b6d83e2b8b7de Jassi Brar    2014-06-12  560  	spin_unlock_irqrestore(&chan->lock, flags);
2b6d83e2b8b7de Jassi Brar    2014-06-12  561  }
2b6d83e2b8b7de Jassi Brar    2014-06-12  562  EXPORT_SYMBOL_GPL(mbox_free_channel);
2b6d83e2b8b7de Jassi Brar    2014-06-12  563  

:::::: The code at line 543 was first introduced by commit
:::::: 2b6d83e2b8b7de82331a6a1dcd64b51020a6031c mailbox: Introduce framework for mailbox

:::::: TO: Jassi Brar <jaswinder.singh@linaro.org>
:::::: CC: Jassi Brar <jaswinder.singh@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
