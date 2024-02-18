Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437DFD52D
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Feb 2024 09:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708247967; cv=none; b=Vu//+z1veOmd8wSuaGw9EwNyjEU4HHdb9pHqOH8QKls/i+0QGRlCZe09zhkIRsYhgiza9HFaH351rWgDg6mZSLskJGME6L1SwC1qeGun82kStiZg4j1BRzDVjX8x/XLIi/GUsje887LgbGUG64PnZM7wN1P4FLL30Yi3uNkL9AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708247967; c=relaxed/simple;
	bh=8NZJa0xFqWfBHve0XsVD0WFT8qqBucNsXa6CQ+fGhsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=djIvc1cvkzWp2ETkLY6bR+0GApjzZK3c9nzrx5pEHChUNdYmFwKAury4LO96RbAI5RCv1EFuNLsv8FKdowr21Kwo0R8Y6p9xgYHpco5I3cuTh3QBxTe1yK349MRebq7eZQr/6LGhccLvVxCiyDm/4YNtdgopCQ+83v8bgY3RS1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKE/hZ7b; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKE/hZ7b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708247965; x=1739783965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8NZJa0xFqWfBHve0XsVD0WFT8qqBucNsXa6CQ+fGhsg=;
  b=SKE/hZ7be5FgFIMuKEinqsq5X6VsVTIkcVb5t2FEmcus2+L/vqeK9UdB
   KmSfcCd4KDxbQAoxFqp2Hutvv0HXAZeCmIrPfqfD7Vl+MmQ8e052bQELo
   /uLNAPnpTDX5gbYhFTmBbTUYrDTPBqWnSwboZHMAC/9vX/1RYgB/gJz0t
   xfpxJvkdBY/aXl48YjCjkeFoyeod2C0NacatYr6Cpd/RKA+2k7TZtUiEW
   /6825UXX6TzalxMiAb4jk5DM0PkKPQ//squ2R/Y8VfFlMqdWqWo3uRpxS
   I6j9JnCQWou3Dg/arQfE4ru3pkQQ8UQlSIV2q9bVkj2Zm14jIv7Zw6Il2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10987"; a="2199716"
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="2199716"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2024 01:19:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,168,1705392000"; 
   d="scan'208";a="4588805"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 18 Feb 2024 01:19:23 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rbdKS-0002vQ-1q;
	Sun, 18 Feb 2024 09:19:20 +0000
Date: Sun, 18 Feb 2024 17:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net-next 06/11] net: mctp: provide a more specific tag
 allocation ioctl
Message-ID: <202402181713.OQAPBmZC-lkp@intel.com>
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
In-Reply-To: <424009ba3e320ae93eb6bd44ef5e474aa5c9221f.1708071380.git.jk@codeconstruct.com.au>
References: <424009ba3e320ae93eb6bd44ef5e474aa5c9221f.1708071380.git.jk@codeconstruct.com.au>
TO: Jeremy Kerr <jk@codeconstruct.com.au>
TO: netdev@vger.kernel.org
CC: Matt Johnston <matt@codeconstruct.com.au>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Simon Horman <horms@kernel.org>
CC: David Howells <dhowells@redhat.com>
CC: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Liang Chen <liangchen.linux@gmail.com>
CC: Johannes Berg <johannes.berg@intel.com>

Hi Jeremy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeremy-Kerr/net-mctp-avoid-confusion-over-local-peer-dest-source-addresses/20240216-163203
base:   net-next/main
patch link:    https://lore.kernel.org/r/424009ba3e320ae93eb6bd44ef5e474aa5c9221f.1708071380.git.jk%40codeconstruct.com.au
patch subject: [PATCH net-next 06/11] net: mctp: provide a more specific tag allocation ioctl
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: parisc-randconfig-r081-20240218 (https://download.01.org/0day-ci/archive/20240218/202402181713.OQAPBmZC-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402181713.OQAPBmZC-lkp@intel.com/

smatch warnings:
net/mctp/af_mctp.c:389 mctp_ioctl_tag_copy_from_user() warn: was && intended here instead of ||?

vim +389 net/mctp/af_mctp.c

8f601a1e4f8c84 Jeremy Kerr 2021-07-29  352  
28828bad95a357 Jeremy Kerr 2024-02-16  353  /* helpers for reading/writing the tag ioc, handling compatibility across the
28828bad95a357 Jeremy Kerr 2024-02-16  354   * two versions, and some basic API error checking
28828bad95a357 Jeremy Kerr 2024-02-16  355   */
28828bad95a357 Jeremy Kerr 2024-02-16  356  static int mctp_ioctl_tag_copy_from_user(unsigned long arg,
28828bad95a357 Jeremy Kerr 2024-02-16  357  					 struct mctp_ioc_tag_ctl2 *ctl,
28828bad95a357 Jeremy Kerr 2024-02-16  358  					 bool tagv2)
28828bad95a357 Jeremy Kerr 2024-02-16  359  {
28828bad95a357 Jeremy Kerr 2024-02-16  360  	struct mctp_ioc_tag_ctl ctl_compat;
28828bad95a357 Jeremy Kerr 2024-02-16  361  	unsigned long size;
28828bad95a357 Jeremy Kerr 2024-02-16  362  	void *ptr;
28828bad95a357 Jeremy Kerr 2024-02-16  363  	int rc;
28828bad95a357 Jeremy Kerr 2024-02-16  364  
28828bad95a357 Jeremy Kerr 2024-02-16  365  	if (tagv2) {
28828bad95a357 Jeremy Kerr 2024-02-16  366  		size = sizeof(*ctl);
28828bad95a357 Jeremy Kerr 2024-02-16  367  		ptr = ctl;
28828bad95a357 Jeremy Kerr 2024-02-16  368  	} else {
28828bad95a357 Jeremy Kerr 2024-02-16  369  		size = sizeof(ctl_compat);
28828bad95a357 Jeremy Kerr 2024-02-16  370  		ptr = &ctl_compat;
28828bad95a357 Jeremy Kerr 2024-02-16  371  	}
28828bad95a357 Jeremy Kerr 2024-02-16  372  
28828bad95a357 Jeremy Kerr 2024-02-16  373  	rc = copy_from_user(ptr, (void __user *)arg, size);
28828bad95a357 Jeremy Kerr 2024-02-16  374  	if (rc)
28828bad95a357 Jeremy Kerr 2024-02-16  375  		return -EFAULT;
28828bad95a357 Jeremy Kerr 2024-02-16  376  
28828bad95a357 Jeremy Kerr 2024-02-16  377  	if (!tagv2) {
28828bad95a357 Jeremy Kerr 2024-02-16  378  		/* compat, using defaults for new fields */
28828bad95a357 Jeremy Kerr 2024-02-16  379  		ctl->net = MCTP_INITIAL_DEFAULT_NET;
28828bad95a357 Jeremy Kerr 2024-02-16  380  		ctl->peer_addr = ctl_compat.peer_addr;
28828bad95a357 Jeremy Kerr 2024-02-16  381  		ctl->local_addr = MCTP_ADDR_ANY;
28828bad95a357 Jeremy Kerr 2024-02-16  382  		ctl->flags = ctl_compat.flags;
28828bad95a357 Jeremy Kerr 2024-02-16  383  		ctl->tag = ctl_compat.tag;
28828bad95a357 Jeremy Kerr 2024-02-16  384  	}
28828bad95a357 Jeremy Kerr 2024-02-16  385  
28828bad95a357 Jeremy Kerr 2024-02-16  386  	if (ctl->flags)
28828bad95a357 Jeremy Kerr 2024-02-16  387  		return -EINVAL;
28828bad95a357 Jeremy Kerr 2024-02-16  388  
28828bad95a357 Jeremy Kerr 2024-02-16 @389  	if (!(ctl->local_addr != MCTP_ADDR_ANY ||
28828bad95a357 Jeremy Kerr 2024-02-16  390  	      ctl->local_addr != MCTP_ADDR_NULL))
28828bad95a357 Jeremy Kerr 2024-02-16  391  		return -EINVAL;
28828bad95a357 Jeremy Kerr 2024-02-16  392  
28828bad95a357 Jeremy Kerr 2024-02-16  393  	return 0;
28828bad95a357 Jeremy Kerr 2024-02-16  394  }
28828bad95a357 Jeremy Kerr 2024-02-16  395  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
