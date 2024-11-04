Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69D083CD3
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 22:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730759568; cv=none; b=PPlGBijfOBeC1gIyEELXZ9SSvF3uK6/cHiCTLKxYMWbQvn4NauFRiViZzbDfkJ0ABPfR15sa8FambVopeC7pb2YjYOpSRKLdsoVRsOwDEcXu2bYNPuO5nj0eZO0eGnxQ+AezCE1Lx78KhA6YVa1DnEACmFUo/l3iTqTmHPwA7JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730759568; c=relaxed/simple;
	bh=KeFcpiW905U/maB/pVIYUPJGE/9Lourmpx0vGTTZcN0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bqB6z59isJAKvBMPybQ6C1h/zATOzb9oc0Vp2YHSWL9wdE3YXZVDE8lpOYq0zvWPhcLE+13DpLXa5LuJLxgwyD4I5tGW2wgLNzXDE40PDVdrTi7SIKNyjw/sCDSvlRWXRba+44ggFPtQlD/7KRyxCTXdrCaY6tTbgHtG0mhux64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PmhVAPxI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PmhVAPxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730759566; x=1762295566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KeFcpiW905U/maB/pVIYUPJGE/9Lourmpx0vGTTZcN0=;
  b=PmhVAPxIs7oAtia9zjgbyVpzTVXtGSL1Rab3d9Uy3N5T12ffl9gBXALd
   lGIgEXgXzGnL3AZC8Be7Wlqkh6bdHqYpXMt+EGrUndBXX1duJWKPFNLdc
   g2RFXY1D2ZQIu5Gq6osUb8RLEZDNXyBPXeMr5XNyLpuKxeCm4A6n8lKTS
   Ai3e5HdM/6+ytOcJ9/gj6ZXpOim286tG2dxLdpiqxN3YEzYYM0OVYVydn
   5qxSMSpXVuft9OB7xUby1dscDcao5uiSukZFnuqHSSi3HuLmjjOAbO+uI
   BKc00gvbkKLTF4jOAzRFB1+yR0JcwEV/vUUxBeHOF4GUHp42JZVjOaCOA
   w==;
X-CSE-ConnectionGUID: mIy5vYR/SK2OsnPH1o0wRA==
X-CSE-MsgGUID: zVBs2zFSSwiuFvVrDTMLxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="41870956"
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="41870956"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 14:32:46 -0800
X-CSE-ConnectionGUID: ZNEpdxe7ReKcmlyVJdlVoQ==
X-CSE-MsgGUID: 9nUHZrqQRYCakfeONT9NMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,258,1725346800"; 
   d="scan'208";a="87727287"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Nov 2024 14:32:44 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t85cn-000lLj-2r;
	Mon, 04 Nov 2024 22:32:41 +0000
Date: Tue, 5 Nov 2024 06:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/btrfs/compression.c:195:12-13: WARNING opportunity for max()
Message-ID: <202411050617.txfg27Bt-lkp@intel.com>
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
head:   557329bcecc2f55e134db8974953b32b69db9d15
commit: 4cea422a776558ccf84e918205d0c162a516502c btrfs: use shrinker for compression page pool
date:   11 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 11 months ago
config: x86_64-randconfig-103-20241104 (https://download.01.org/0day-ci/archive/20241105/202411050617.txfg27Bt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411050617.txfg27Bt-lkp@intel.com/

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
