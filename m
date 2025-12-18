Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8C1309F0B
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 05:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766035482; cv=none; b=R6JulTxPI9GFvfLExA+cOcWSEnd/DNuMJobf9BkagvMYdOuyxpcvJFo+Qv55sU/bTckrKigHdCQhcX2NB1sXgpvylYW5BmtZuO4Cq4RZr+XhAeSTGpsN1FX1UFrhfFARXDtk/6hqcmLlurFYBTWSefCahGVmdQMiROlFLTQfoMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766035482; c=relaxed/simple;
	bh=KcVCQHPAe75BFuvzn3nRLTTYq9pYMgMU8ennyKCT8C4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D0rO0Os7y/XlTQZqkc/fumknKEUNHx1lqZtjGkvW56adekvMzDw8ZTZDphxZP8AYTtokmutA8+Ta/5J4OBiBGXuCviSfsU6/wDYDvLleV54ZbEUeBQboZ8xs/f5ZTfQu0vecu2M3sxBq2nUVUbGI9piii4gb51OXnqCCRdmL4ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ibn2k8Jv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ibn2k8Jv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766035479; x=1797571479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KcVCQHPAe75BFuvzn3nRLTTYq9pYMgMU8ennyKCT8C4=;
  b=ibn2k8JveQxvrN6+moRvhJ28oIzSWgTRZFYbj4AL3b1VL8lMOdz5spMU
   KYkVXiAdN6mmc5n/SU4bNIOhfp9CiAG5BrM07h2kvZbBcSoR8GdOjm+c6
   Jowlqkn93HnzCcusS7JEWumlg3gsxK/FKIKU6evBIzvBqPftapmcGnU+o
   EAof7JiucNL1hqoiAt4vy1Vl1fu7uvn0cMmldXyWQz2MhRsXEWJaj6sLD
   r5jfinX3Tq+HIhLE7F/wWBW0rJFbbzjlG8w4O9na6GZ46qXxWi43uLurT
   qoVm96HDYZ+dUpdqpSDbzsxmRjyp/g+IoQtB6pOzDInLQ14KLz2vKN70G
   g==;
X-CSE-ConnectionGUID: D0y6wgThTzixcPeM6dZt+Q==
X-CSE-MsgGUID: zSnUO/HNT3WYqrxYqWWm7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="70560504"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="70560504"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 21:24:38 -0800
X-CSE-ConnectionGUID: g1pSFVCgSW6R0/GvYsxtnQ==
X-CSE-MsgGUID: JoLTqXE2SRuqZjJ1Gx4Uig==
X-Ironport-Invalid-End-Of-Message: True
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="203005068"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Dec 2025 21:24:37 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW6V8-000000001d5-2BKK;
	Thu, 18 Dec 2025 05:24:34 +0000
Date: Thu, 18 Dec 2025 13:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn: can
 'dev_data' even be NULL?
Message-ID: <202512181322.nBkDZbGb-lkp@intel.com>
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
TO: Herbert Xu <herbert@gondor.apana.org.au>

Hi Herbert,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 35c5097f737a164b3afe23d07698db95061f0db8 crypto: ti - Enable compile testing for dthev2
date:   3 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 3 months ago
config: s390-randconfig-r071-20251217 (https://download.01.org/0day-ci/archive/20251218/202512181322.nBkDZbGb-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512181322.nBkDZbGb-lkp@intel.com/

smatch warnings:
drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn: can 'dev_data' even be NULL?

vim +/dev_data +44 drivers/crypto/ti/dthev2-common.c

52f641bc63a4665 T Pratham 2025-08-20  34  
52f641bc63a4665 T Pratham 2025-08-20  35  struct dthe_data *dthe_get_dev(struct dthe_tfm_ctx *ctx)
52f641bc63a4665 T Pratham 2025-08-20  36  {
52f641bc63a4665 T Pratham 2025-08-20  37  	struct dthe_data *dev_data;
52f641bc63a4665 T Pratham 2025-08-20  38  
52f641bc63a4665 T Pratham 2025-08-20  39  	if (ctx->dev_data)
52f641bc63a4665 T Pratham 2025-08-20  40  		return ctx->dev_data;
52f641bc63a4665 T Pratham 2025-08-20  41  
52f641bc63a4665 T Pratham 2025-08-20  42  	spin_lock_bh(&dthe_dev_list.lock);
52f641bc63a4665 T Pratham 2025-08-20  43  	dev_data = list_first_entry(&dthe_dev_list.dev_list, struct dthe_data, list);
52f641bc63a4665 T Pratham 2025-08-20 @44  	if (dev_data)
52f641bc63a4665 T Pratham 2025-08-20  45  		list_move_tail(&dev_data->list, &dthe_dev_list.dev_list);
52f641bc63a4665 T Pratham 2025-08-20  46  	spin_unlock_bh(&dthe_dev_list.lock);
52f641bc63a4665 T Pratham 2025-08-20  47  
52f641bc63a4665 T Pratham 2025-08-20  48  	return dev_data;
52f641bc63a4665 T Pratham 2025-08-20  49  }
52f641bc63a4665 T Pratham 2025-08-20  50  

:::::: The code at line 44 was first introduced by commit
:::::: 52f641bc63a46657b1d72d902fcee30ab1233c7b crypto: ti - Add driver for DTHE V2 AES Engine (ECB, CBC)

:::::: TO: T Pratham <t-pratham@ti.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
