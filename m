Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8061990AF
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 12:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728478795; cv=none; b=Q+Db1p6cJ3Ef5n3E3MTJefsRtyTIG6rsVRErQxVVWgU/ak4a8j21DRQ2QXchg33v4C9f5rhjV/dh7Wsoa1+2KxldCNJuD/thgeWNw6k6f/oMQcaWduE7BN6ztpGEv1dDe45v/jX/iP1gYssnoNPSguPAh0QIspbrdJFQD1dFYOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728478795; c=relaxed/simple;
	bh=N3ZuRzGd4ppYdPMWyzoQ6J+kxmPss3/7okBilCkocjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EtjQYoi10qAHE0Uag3tMT5GMD56kZvvqytQSjBLXzubDbkekkebjZEDf2/I5R6/vbMkvS5LJbgXtLzeBzuSBB/2jN5N/LNckd6oDJdsk3Sibt7h1G9jPr2xBZOuXy1mRCyQttRKyVsTbq7yV4h7FOkv+hMdkv4EHO08EK0bG3Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A40FqH1E; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A40FqH1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728478794; x=1760014794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N3ZuRzGd4ppYdPMWyzoQ6J+kxmPss3/7okBilCkocjE=;
  b=A40FqH1E2BANac6nceApRRBjiBBFw+odUmUKLKFh6yRY2Ea+5PPW2AyR
   Lr+eSSQWNHjGMSkeH6esE+Nvf9/CQC4XvDlGlmAyJhaL0EgD6uLiC+ZbQ
   CAJrDomc0+2WV2UqIEPA1DJjPo+fHyVxSV/ERqeuaR2uEUu9dJnXAZn5u
   bWe1B95fwdOgk9qdTVT4tu4aMg3O8qHFldeoR47aH2u0pTsR7rhFpODPb
   lTE95kGB4vCljmsXDu2VH3YH6az4aMEoi/Ce1I2y6+6YZaXt6A07Zh2ai
   C3wYPcxeZ7/WXvIUp1i0YxIkHKrs9g/Sze5W4IpIQOdyyM6ReRcytmn9B
   g==;
X-CSE-ConnectionGUID: Tiof6YztT/Gs3oXuWvq9Jg==
X-CSE-MsgGUID: sis4z0XoSv28J0bf6z8xMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="39167864"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="39167864"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 05:59:53 -0700
X-CSE-ConnectionGUID: fQ69Vsm/QvCZS+ZXq/MyDw==
X-CSE-MsgGUID: 3/dfQMhVTSCb2SqS7B5NbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="76340128"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Oct 2024 05:59:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syWIA-0009EW-14;
	Wed, 09 Oct 2024 12:59:50 +0000
Date: Wed, 9 Oct 2024 20:59:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/compression.c:195:12-13: WARNING opportunity for max()
Message-ID: <202410092048.kB47Ar0k-lkp@intel.com>
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
TO: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   75b607fab38d149f232f01eae5e6392b394dd659
commit: 4cea422a776558ccf84e918205d0c162a516502c btrfs: use shrinker for compression page pool
date:   10 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-054-20241009 (https://download.01.org/0day-ci/archive/20241009/202410092048.kB47Ar0k-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410092048.kB47Ar0k-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/btrfs/compression.c:195:12-13: WARNING opportunity for max()

vim +195 fs/btrfs/compression.c

4cea422a776558 David Sterba 2023-11-15  183  
4cea422a776558 David Sterba 2023-11-15  184  static unsigned long btrfs_compr_pool_count(struct shrinker *sh, struct shrink_control *sc)
4cea422a776558 David Sterba 2023-11-15  185  {
4cea422a776558 David Sterba 2023-11-15  186  	int ret;
4cea422a776558 David Sterba 2023-11-15  187  
4cea422a776558 David Sterba 2023-11-15  188  	/*
4cea422a776558 David Sterba 2023-11-15  189  	 * We must not read the values more than once if 'ret' gets expanded in
4cea422a776558 David Sterba 2023-11-15  190  	 * the return statement so we don't accidentally return a negative
4cea422a776558 David Sterba 2023-11-15  191  	 * number, even if the first condition finds it positive.
4cea422a776558 David Sterba 2023-11-15  192  	 */
4cea422a776558 David Sterba 2023-11-15  193  	ret = READ_ONCE(compr_pool.count) - READ_ONCE(compr_pool.thresh);
4cea422a776558 David Sterba 2023-11-15  194  
4cea422a776558 David Sterba 2023-11-15 @195  	return ret > 0 ? ret : 0;
4cea422a776558 David Sterba 2023-11-15  196  }
4cea422a776558 David Sterba 2023-11-15  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
