Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935AC1C3038
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Dec 2024 21:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733952243; cv=none; b=rcY0aGGXu7HuE0QtH9HbPpIy7abUKipyMqvtXc/S1xaE4EPBLZ4Vi92CFK1/mIi6GZFQin3gXHSmyD15qoJ0VBGyjVN6xneO/ehUR1biEZeSDpOujiX4OCwdxIBquqILIm9n6cmhrD/BdBMUAEFvIHLRkUn9NZ7kCb7t6P4QV5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733952243; c=relaxed/simple;
	bh=I5uYVxmqU9+5u1CcMd4+c+ZyVUngkfHOVnTY14XJnes=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lwp/uJyjncDgmU/vQwsr+yF2MDfqUXvXSPABc6yRScdhWg0y7CRs6gUoDgZzD6OpNMsEt3uH1PY1ElYPXFebu0Aj9uQeETGp6BN7eF5XKVIrEo0+ZTacJIooYyj+52bSHaTSetSgUO/yLlFGl67ph9uNa7AqdoEjOpQ613LrQf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMyPqqAP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMyPqqAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733952241; x=1765488241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I5uYVxmqU9+5u1CcMd4+c+ZyVUngkfHOVnTY14XJnes=;
  b=lMyPqqAPN9Zz9tIPTaBh7hb+Glk8WZ3jt5neqvKwAd2cb+Rkw3bfoeT7
   CW+xhEH1owFs2GWZu3DoJS1TXvMUSjWKrdwXYasG/3fKr5v12GmARC+bW
   YxpF7vtT9CjkS9edoEvxoqAI61q6ujTBx8vRj0kNKHXfN03r0iuKEeC4X
   Ys0pYTwS20QEKkphCHjBzQaJ0vuHheE41aXJbRhxmVgc9HbxCp6Lt31wC
   bVDmj5SPL93l1G3GLP59i5YtsSCJ5FbddAW2imSQu+loiRpkZnjkekgYA
   XChbnQQqXnx3hg9Q5HPsck6CDsLlEecj9BSzYoai4Fr6fsBG+fgF1ksZ8
   A==;
X-CSE-ConnectionGUID: b9hBy05mT3yylNISULOa8w==
X-CSE-MsgGUID: 3zWCIHiWTLunrRjdey5MWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="33666834"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; 
   d="scan'208";a="33666834"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 13:23:59 -0800
X-CSE-ConnectionGUID: 2QllzenRRPWB6kcl3akb1w==
X-CSE-MsgGUID: P5B2/QBfQNy6Sd7/Wz6A3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126930421"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Dec 2024 13:23:57 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLUBW-00076H-2r;
	Wed, 11 Dec 2024 21:23:54 +0000
Date: Thu, 12 Dec 2024 05:23:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/mmc/host/mxcmmc.c:626 mxcmci_transfer_data() error:
 uninitialized symbol 'stat'.
Message-ID: <202412120506.bXdOWCxb-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>
CC: Ulf Hansson <ulf.hansson@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f92f4749861b06fed908d336b4dee1326003291b
commit: 12658af54f2ed10d812dcd0a769d62cb9e9291e5 mmc: mxcmmc: Use sg_miter for PIO
date:   10 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-r073-20241209 (https://download.01.org/0day-ci/archive/20241212/202412120506.bXdOWCxb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412120506.bXdOWCxb-lkp@intel.com/

smatch warnings:
drivers/mmc/host/mxcmmc.c:626 mxcmci_transfer_data() error: uninitialized symbol 'stat'.

vim +/stat +626 drivers/mmc/host/mxcmmc.c

d96be879ff46975 Sascha Hauer  2009-01-06  590  
d96be879ff46975 Sascha Hauer  2009-01-06  591  static int mxcmci_transfer_data(struct mxcmci_host *host)
d96be879ff46975 Sascha Hauer  2009-01-06  592  {
d96be879ff46975 Sascha Hauer  2009-01-06  593  	struct mmc_data *data = host->req->data;
12658af54f2ed10 Linus Walleij 2024-01-27  594  	struct sg_mapping_iter sgm;
12658af54f2ed10 Linus Walleij 2024-01-27  595  	int stat;
12658af54f2ed10 Linus Walleij 2024-01-27  596  	u32 *buf;
d96be879ff46975 Sascha Hauer  2009-01-06  597  
d96be879ff46975 Sascha Hauer  2009-01-06  598  	host->data = data;
d96be879ff46975 Sascha Hauer  2009-01-06  599  	host->datasize = 0;
12658af54f2ed10 Linus Walleij 2024-01-27  600  	sg_miter_start(&sgm, data->sg, data->sg_len,
12658af54f2ed10 Linus Walleij 2024-01-27  601  		       (data->flags & MMC_DATA_READ) ? SG_MITER_TO_SG : SG_MITER_FROM_SG);
d96be879ff46975 Sascha Hauer  2009-01-06  602  
d96be879ff46975 Sascha Hauer  2009-01-06  603  	if (data->flags & MMC_DATA_READ) {
12658af54f2ed10 Linus Walleij 2024-01-27  604  		while (sg_miter_next(&sgm)) {
12658af54f2ed10 Linus Walleij 2024-01-27  605  			buf = sgm.addr;
12658af54f2ed10 Linus Walleij 2024-01-27  606  			stat = mxcmci_pull(host, buf, sgm.length);
d96be879ff46975 Sascha Hauer  2009-01-06  607  			if (stat)
12658af54f2ed10 Linus Walleij 2024-01-27  608  				goto transfer_error;
12658af54f2ed10 Linus Walleij 2024-01-27  609  			host->datasize += sgm.length;
d96be879ff46975 Sascha Hauer  2009-01-06  610  		}
d96be879ff46975 Sascha Hauer  2009-01-06  611  	} else {
12658af54f2ed10 Linus Walleij 2024-01-27  612  		while (sg_miter_next(&sgm)) {
12658af54f2ed10 Linus Walleij 2024-01-27  613  			buf = sgm.addr;
12658af54f2ed10 Linus Walleij 2024-01-27  614  			stat = mxcmci_push(host, buf, sgm.length);
d96be879ff46975 Sascha Hauer  2009-01-06  615  			if (stat)
12658af54f2ed10 Linus Walleij 2024-01-27  616  				goto transfer_error;
12658af54f2ed10 Linus Walleij 2024-01-27  617  			host->datasize += sgm.length;
d96be879ff46975 Sascha Hauer  2009-01-06  618  		}
d96be879ff46975 Sascha Hauer  2009-01-06  619  		stat = mxcmci_poll_status(host, STATUS_WRITE_OP_DONE);
d96be879ff46975 Sascha Hauer  2009-01-06  620  		if (stat)
12658af54f2ed10 Linus Walleij 2024-01-27  621  			goto transfer_error;
d96be879ff46975 Sascha Hauer  2009-01-06  622  	}
12658af54f2ed10 Linus Walleij 2024-01-27  623  
12658af54f2ed10 Linus Walleij 2024-01-27  624  transfer_error:
12658af54f2ed10 Linus Walleij 2024-01-27  625  	sg_miter_stop(&sgm);
12658af54f2ed10 Linus Walleij 2024-01-27 @626  	return stat;
d96be879ff46975 Sascha Hauer  2009-01-06  627  }
d96be879ff46975 Sascha Hauer  2009-01-06  628  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
