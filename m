Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728BD178CDE
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Nov 2024 14:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730730321; cv=none; b=EhXfRDUekPlPh+6wq4bBwU8C0+AP1hveZhDybXYpSxiU9JthGnlqI6is49g4EkB9dEEQDAZWiK9srVkw4skrBWgaJEx7W9n5O92EYxNSH4TUCd0h4Xog2DKQ1/HNu8a7amBy7/dd00Yu2KN+SicWsaRK808OYS4o5FR3BoHN7KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730730321; c=relaxed/simple;
	bh=aYWcuCqt/OglqZVxwlHr+qHb4S/LbWN5FSmwgIRfFrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M2v7TKx4w5EJp3UtITrc/1Z6yCrPxI2cNuBISSGyARsdKL8WkhhEK42zC4bfGFLbKOr3nHpREl96wkIV8s+Cn+rFUKnv31+mUMiJe/OOenIt5VnCFz6GJxGrIHfZRueXzm5OY3tXUVp4m2SNJ/X8U9Xwhl9NknbzOxRfEP4KKP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YENYPGBI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YENYPGBI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730730319; x=1762266319;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aYWcuCqt/OglqZVxwlHr+qHb4S/LbWN5FSmwgIRfFrM=;
  b=YENYPGBILC8Y7bI3SKsvPe2sEkjVhmnAvNqC1CrfejCTnVrzrZjWeAr4
   hJfrYbQHWO6AGagMB+LNgkYwBKb7innOJNTnhgQhWlHIpB8P4tjJ1hfbR
   1leoKzI3zkgO7Py1bQZ5Wd2FYsAplLTUD0XKwdfw5tsohX4xhA12Mzc//
   +9vHOEC50MWz06dcum702vLaRbakiIWgJegm2czC1UvLcuuSwch780e4Z
   aPjfyWBOGtn7PwIeZ8GjjjOeCQXvesjjzr2VTGRIeAVQwrEqt7y512wPI
   fIjBAk0PrrULz5EJPrYMMcyKk2O7dqA5k3//kFbbhw70C1FhXkuS770XS
   w==;
X-CSE-ConnectionGUID: 9ISuvNE4QM2BT8TDF5HRqw==
X-CSE-MsgGUID: aTyzhGhLTMuJBAyo9IJI2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52993362"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52993362"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:25:16 -0800
X-CSE-ConnectionGUID: sDurnRNdTgSrL0GegaJ4xg==
X-CSE-MsgGUID: 0ui5BlyWSfyy40ofAO0cxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="84113963"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2024 06:25:16 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7y13-000ku2-1Z;
	Mon, 04 Nov 2024 14:25:13 +0000
Date: Mon, 4 Nov 2024 22:24:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/5] xfs: add infrastructure to support AF allocation
 algorithm
Message-ID: <202411042202.Kp6I9Ntp-lkp@intel.com>
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
In-Reply-To: <20241104014439.3786609-5-zhangshida@kylinos.cn>
References: <20241104014439.3786609-5-zhangshida@kylinos.cn>
TO: zhangshida <starzhangzsd@gmail.com>
TO: djwong@kernel.org
TO: dchinner@redhat.com
TO: leo.lilong@huawei.com
TO: wozizhi@huawei.com
TO: osandov@fb.com
TO: xiang@kernel.org
TO: zhangjiachen.jaycee@bytedance.com
CC: linux-xfs@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: zhangshida@kylinos.cn
CC: starzhangzsd@gmail.com

Hi zhangshida,

kernel test robot noticed the following build warnings:

[auto build test WARNING on xfs-linux/for-next]
[also build test WARNING on linus/master v6.12-rc6 next-20241104]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhangshida/xfs-add-two-wrappers-for-iterating-ags-in-a-AF/20241104-094751
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20241104014439.3786609-5-zhangshida%40kylinos.cn
patch subject: [PATCH 4/5] xfs: add infrastructure to support AF allocation algorithm
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-161-20241104 (https://download.01.org/0day-ci/archive/20241104/202411042202.Kp6I9Ntp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411042202.Kp6I9Ntp-lkp@intel.com/

New smatch warnings:
fs/xfs/libxfs/xfs_bmap.c:3767 xfs_bmap_btalloc_best_length_iterate_afs() error: uninitialized symbol 'error'.

Old smatch warnings:
fs/xfs/libxfs/xfs_bmap.c:6126 xfs_bmap_split_extent() warn: iterator 'i' not incremented

vim +/error +3767 fs/xfs/libxfs/xfs_bmap.c

85843327094f9de Dave Chinner 2023-02-13  3743  
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3744  static int
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3745  xfs_bmap_btalloc_best_length_iterate_afs(
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3746  	struct xfs_bmalloca	*ap,
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3747  	struct xfs_alloc_arg	*args,
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3748  	int			stripe_align)
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3749  {
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3750  	struct xfs_mount	*mp = ap->ip->i_mount;
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3751  	int			error;
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3752  	unsigned int i;
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3753  
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3754  	args->curr_af = 0;
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3755  
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3756  	for (i = 0; args->curr_af < mp->m_sb.sb_agcount; i++) {
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3757  		args->next_af = mp->m_sb.sb_agcount - mp->m_af[i];
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3758  		error = xfs_bmap_btalloc_best_length(ap, args, stripe_align);
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3759  		if (error || args->fsbno != NULLFSBLOCK)
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3760  			break;
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3761  
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3762  		args->curr_af = args->next_af;
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3763  		/* Exit LOWMODE when going to the next AF. */
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3764  		ap->tp->t_flags &= ~XFS_TRANS_LOWMODE;
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3765  	}
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3766  
0d8c7e0ac00c17e Shida Zhang  2024-11-04 @3767  	return error;
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3768  }
0d8c7e0ac00c17e Shida Zhang  2024-11-04  3769  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
