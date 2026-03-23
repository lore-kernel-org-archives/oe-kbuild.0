Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6213446A7
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 08:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774255495; cv=none; b=cEr1VdG1f6iPWsmlNg3etIQ8McApglmPJmEydU4vPTXJqn1MZVmv5+Uuo+h/P/mfuIZ0dszDWS0T6taDYLnnI3H86/s0L+yuxdJOD/xWFYJno+QJ9XpvOsLqW6qwn3Xmu/fqaqXV8dmLb23iCh8iJUiU1jBAWUHtO9MFs9dHfZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774255495; c=relaxed/simple;
	bh=UKR/cXwmFKYxCMdBkKcmi3+rz8vp4AvhQl8pX/BqX94=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FAF2i0RrsvwU2DlIC9hW7vUGKAL/MTUoDEH8xGdg0YtVEd5Rvy+IvhZCgyuDa4GF36eiGs1k3LgDgUS6m/7lbtQPdH8/V1DmIs6z2BFXxpEfaJIBIpJDA8zWzsZ3Sg2DfY7VIbek3EcDPgDur3RT2wvPiAqSieoNrLePOU6yhy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gg7w2n4k; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gg7w2n4k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774255492; x=1805791492;
  h=date:from:to:cc:subject:message-id;
  bh=UKR/cXwmFKYxCMdBkKcmi3+rz8vp4AvhQl8pX/BqX94=;
  b=Gg7w2n4kzANXBk2kJzbiLY0QsfVFniC67Z+iA6IDegPfUm8HKGVwk/u+
   v4IbWHpp/nW5WZ2BrtDA+NSnNEh56ePrqScN2geD8NIsX7STy2tbQiSgV
   q8n6ykfJ6Vh7LcGxG73x6G2IerTGauXLWlXa65rc48j+g18zYiPEt0Asn
   gLcA/vvZkz1dgxT07dNcsfCsaEy5dIaPTufSZpSpwcNVwuLfwo8ofZ50B
   T6U/ZnHh1t1gzAdYfb0eSGjzG9K/jXUxmz6Xg+axzlFYU4CZV3k9GhXiq
   TSh6qeBAlkNYX0ywrZGneS7IO2gGe8rIjo8m5nBXB7SHa1WRPucGjOQtD
   A==;
X-CSE-ConnectionGUID: kfZGduJoSwO1ECsLxY3GJg==
X-CSE-MsgGUID: 3pZicJHFRiG9RalF7U3wyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="79154302"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="79154302"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 01:44:51 -0700
X-CSE-ConnectionGUID: eb08830TQZiYXhfxSFmsnA==
X-CSE-MsgGUID: p2E2pXFnQIqOEf+J1qGghg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="228431063"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Mar 2026 01:44:50 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4atz-000000000Cz-37jM;
	Mon, 23 Mar 2026 08:44:47 +0000
Date: Mon, 23 Mar 2026 16:44:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-misc:lib-raid6 38/43] lib/raid/raid6/algos.c:233
 raid6_init() error: we previously assumed 'raid6_recov_algo' could be null
 (see line 231)
Message-ID: <202603231635.lDG5Nqae-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/misc.git lib-raid6
head:   f423762908f818de59bf73cf8f6c1bb45c5e595a
commit: f55e55f57cdf67f3a296020f500a509a9f5cf16c [38/43] raid6: use static call for recovery
:::::: branch date: 3 hours ago
:::::: commit date: 18 hours ago
config: csky-randconfig-r073-20260323 (https://download.01.org/0day-ci/archive/20260323/202603231635.lDG5Nqae-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603231635.lDG5Nqae-lkp@intel.com/

smatch warnings:
lib/raid/raid6/algos.c:233 raid6_init() error: we previously assumed 'raid6_recov_algo' could be null (see line 231)

vim +/raid6_recov_algo +233 lib/raid/raid6/algos.c

f701d589aa34d7 drivers/md/raid6algos.c Dan Williams      2009-03-31  217  
9a3dea8a55b79c lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-21  218  static int __init raid6_init(void)
9a3dea8a55b79c lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-21  219  {
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22  220  	/*
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22  221  	 * Architectures providing arch_raid6_init must add all PQ generation
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22  222  	 * algorithms they want to consider in arch_raid6_init(), including
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22  223  	 * the generic ones using raid6_algo_add_default() if wanted.
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22  224  	 */
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22  225  	arch_raid6_init();
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22  226  
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22  227  	/*
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22  228  	 * Architectures don't have to set a recovery algorithm, we'll just pick
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22  229  	 * the generic integer one if none was set.
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22  230  	 */
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22 @231  	if (!raid6_recov_algo)
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22  232  		raid6_recov_algo_add(&raid6_recov_intx1);
f55e55f57cdf67 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-21 @233  	static_call_update(raid6_recov_2data_impl, raid6_recov_algo->data2);
f55e55f57cdf67 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-21  234  	static_call_update(raid6_recov_datap_impl, raid6_recov_algo->datap);
ac4562d1ee37c6 lib/raid/raid6/algos.c  Christoph Hellwig 2026-03-22  235  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
