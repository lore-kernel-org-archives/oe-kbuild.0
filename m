Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559D11E8851
	for <oe-kbuild@lists.linux.dev>; Mon, 21 Oct 2024 14:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729521493; cv=none; b=IQfzzorGgeu6jC7lp0kl/4ukxvhBcw1dbRwbagLyZBFnq7i5NCu+Bm1Wef6urzqr8Y62eHnZLHcGVcmQiKsqjNOwH4AfKtqp/fGPEOmbPTT7dswP17YQ4zW2sdIW51cKmLUrGWAWbiFiUa99UBX70snCy56kaA/0SUOlGJDaP3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729521493; c=relaxed/simple;
	bh=xpCjrMGM3vARGh+mTk2B4jTbT+0UJv+39aapicTkyEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6Eon/swzD/7Ac2KkQup4WGiZJAITmLjrN5B18aZEG6A2DxWdb0jzUAm8M2E3UOfcdrl9yACrG+5R666hpJq0RmPMU7KmpANun5ODCr0XRdyci6w8R6J4Kq3x5YBUeAlS2rwUuxw4n6FtzieSz6TQNWGf1LX/go0UM0qBblgj44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncHzAojc; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncHzAojc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729521492; x=1761057492;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xpCjrMGM3vARGh+mTk2B4jTbT+0UJv+39aapicTkyEw=;
  b=ncHzAojczRRD2Dqf81D92butVjVwbGdXbXyrq8jLBvOdqjqkDPOH/Wym
   kAlKcq54IbfQt5nv7SGVLeUxMTllep5d25nCLICnWeC943LCfEA0Qggj9
   /4T8bc5YC/8mXaRLPHO0n1MqxvAaQZJb1P4V6Wol9Hn6fz+GzBVhYTvwH
   iAcHZgwVpYHq5z6jxaSR6F+UXYlITuMvbndj5sQy6D6u5wnSJNLot+tR/
   NYsykay7R+GTr6DLQEU+RhjKlfsZg++4/FqdqZSwfHyiUvSUB79EY1BUx
   1SOBqs/kdmcOtgbylorJWtWd7KlroQ++SZX3aKZl6icmklnqcOWSIgW6X
   g==;
X-CSE-ConnectionGUID: YZdgIZwBTZK7fuzEObNv+Q==
X-CSE-MsgGUID: dwcmkP+8RUKyJ1yC/J0URw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32691563"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="32691563"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2024 07:38:11 -0700
X-CSE-ConnectionGUID: a8MJhWi+QTabjNxsqf+G/w==
X-CSE-MsgGUID: Gwpi+Ze+TyizASax4wR6bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,221,1725346800"; 
   d="scan'208";a="84156546"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 21 Oct 2024 07:38:09 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 327ED1E0; Mon, 21 Oct 2024 17:38:07 +0300 (EEST)
Date: Mon, 21 Oct 2024 17:38:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild@lists.linux.dev, Dan Carpenter <error27@gmail.com>
Subject: Re: drivers/mmc/host/atmel-mci.c:2552 atmci_probe() warn: passing
 zero to 'dev_err_probe'
Message-ID: <ZxZnT6sg4H-F-MmW@black.fi.intel.com>
References: <202410210023.6s07Bozp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202410210023.6s07Bozp-lkp@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Oct 20, 2024 at 10:42:52PM +0800, kernel test robot wrote:
> BCC: lkp@intel.com
> CC: oe-kbuild-all@lists.linux.dev
> CC: linux-kernel@vger.kernel.org
> TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> CC: Ulf Hansson <ulf.hansson@linaro.org>
> 
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
> commit: e38063b94324bc1409a29d699c73938c3d008126 mmc: atmel-mci: Switch to use dev_err_probe()
> date:   6 months ago
> :::::: branch date: 17 hours ago
> :::::: commit date: 6 months ago
> config: arm-randconfig-r072-20241016 (https://download.01.org/0day-ci/archive/20241021/202410210023.6s07Bozp-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202410210023.6s07Bozp-lkp@intel.com/
> 
> New smatch warnings:
> drivers/mmc/host/atmel-mci.c:2552 atmci_probe() warn: passing zero to 'dev_err_probe'

...

> 965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2529  	/* We need at least one slot to succeed */
> 965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2530  	nr_slots = 0;
> 965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2531  	ret = -ENODEV;
> 0a454e95230886 Andy Shevchenko             2024-04-25  2532  	if (host->pdata[0].bus_width) {
> 0a454e95230886 Andy Shevchenko             2024-04-25  2533  		ret = atmci_init_slot(host, &host->pdata[0],
> 2c96a293bbd6b3 Ludovic Desroches           2011-08-11  2534  				0, ATMCI_SDCSEL_SLOT_A, ATMCI_SDIOIRQA);
> 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2535  		if (!ret) {
> 965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2536  			nr_slots++;
> 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2537  			host->buf_size = host->slot[0]->mmc->max_req_size;
> 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2538  		}
> 7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2539  	}
> 0a454e95230886 Andy Shevchenko             2024-04-25  2540  	if (host->pdata[1].bus_width) {
> 0a454e95230886 Andy Shevchenko             2024-04-25  2541  		ret = atmci_init_slot(host, &host->pdata[1],
> 2c96a293bbd6b3 Ludovic Desroches           2011-08-11  2542  				1, ATMCI_SDCSEL_SLOT_B, ATMCI_SDIOIRQB);
> 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2543  		if (!ret) {
> 965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2544  			nr_slots++;
> 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2545  			if (host->slot[1]->mmc->max_req_size > host->buf_size)
> 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2546  				host->buf_size =
> 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2547  					host->slot[1]->mmc->max_req_size;
> 7a90dcc2d7ceb6 Ludovic Desroches           2012-05-16  2548  		}
> 7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2549  	}
> 7d2be0749a5909 Haavard Skinnemoen          2008-06-30  2550  
> 04d699c3643fbf Rob Emanuele                2009-09-22  2551  	if (!nr_slots) {
> e38063b94324bc Andy Shevchenko             2024-04-25 @2552  		dev_err_probe(dev, ret, "init failed: no slot defined\n");
> 965ebf33ea5afb Haavard Skinnemoen          2008-09-17  2553  		goto err_init_slot;
> 04d699c3643fbf Rob Emanuele                2009-09-22  2554  	}

Smatch is wrong. When nr_slots == 0, ret is guaranteed to be defined
either with -ENODEV, or with the returned (non-zero!) code from atmci_init_slot().
Did I miss anything?

-- 
With Best Regards,
Andy Shevchenko


