Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AE31AAA0F
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jan 2025 19:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737142469; cv=none; b=bM3dfp5en8EjuI7U1OJd1rn0dDV3OxRw114KL9KaoaOHCm/OcncBOT1jOPTCMgAO0/AGyOhOr39X2zBtkPpneHLdXZwKEkIm2Eux1GtLq9ghbbKd4numY6aiKizI3Q+rjSjy6AjeelgKu2xwruOTWFYT6zPZfp4Qu37bUFxUXho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737142469; c=relaxed/simple;
	bh=eYapKWhZMBvDuLsy8ioOPo8wkEfIXXxTyPZrHWYMmbk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LA8SrxCGjff7UyWrruVDgutKR4iHNV/XbJUTGJrGtPtCrY3cA87L6FJIpZWKSYWAsRjxwUZwTcyxqQysVzJ7Q8pzQsftJa6KrrakZLb2B9onx3nydQR0Vs64OyZF4ZadSnmHKzqWDw+hbUK5mXRI1dtLQ7w5kn3tFd/mnLvUQk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9CDtiIQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9CDtiIQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737142467; x=1768678467;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eYapKWhZMBvDuLsy8ioOPo8wkEfIXXxTyPZrHWYMmbk=;
  b=E9CDtiIQLgJqtqAgOJG8VIz9KjJlxEEa59IkFcay3xMyqoyYsLZihEEY
   P2xqGY2yPGNlrmFg0A5nsfwZBB3RjQzbRs91lFcBENc8YxkUWKLD9RMOd
   rkAjxuV6OJjfPsgcZmV5NY9L3Tj6EmUgrOj8wx+A8MvjdhqLmcTTUETw7
   6xmwSKwGwjyX5TYAQ1bdXm8XYtbTfcF80FvV5Ju6SDy4k0lBB3pfSKbcp
   9vIQ09wgtlB+s9KP4UKJ+8rMDhd3W/QqatjAE7xzP6sgsLQr+Wf6PIE0K
   4KYthw74Eb/65uTW/jsLq9qxX0cXcQgGB6jGE+4dGq+IH3VvGTm+ZnzBM
   A==;
X-CSE-ConnectionGUID: puN5WCy9RM+W+iCFfLF7fA==
X-CSE-MsgGUID: rki2hU6KSmmUNYgJk1xTVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="41353041"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="41353041"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 11:34:27 -0800
X-CSE-ConnectionGUID: wps+FuBdRjW9ZFOSejRV2Q==
X-CSE-MsgGUID: uQI+Y6XnRcyXM4Rrn0Fl2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106777945"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Jan 2025 11:34:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYs6p-000Tdf-2W;
	Fri, 17 Jan 2025 19:34:23 +0000
Date: Sat, 18 Jan 2025 03:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-6.6 1826/1826]
 arch/arm64/kernel/virtcca_cvm_tsi.c:67:17-18: WARNING opportunity for
 kfree_sensitive/kvfree_sensitive (memset at line 66)
Message-ID: <202501180327.DZDyrgLm-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: yangxiangkai <yangxiangkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a5cbe5b715d9cac271b2c6175e728f0c4167f675
commit: 721f4ea899ff2ab4e3283767cf125dc5952c1d15 [1826/1826] cvm_tsi: add support virtcca attestation
:::::: branch date: 16 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-r061-20250118 (https://download.01.org/0day-ci/archive/20250118/202501180327.DZDyrgLm-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501180327.DZDyrgLm-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/virtcca_cvm_tsi.c:67:17-18: WARNING opportunity for kfree_sensitive/kvfree_sensitive (memset at line 66)

vim +67 arch/arm64/kernel/virtcca_cvm_tsi.c

721f4ea899ff2ab chenzheng 2024-08-13  62  
721f4ea899ff2ab chenzheng 2024-08-13  63  static void __exit tmm_tsi_exit(void)
721f4ea899ff2ab chenzheng 2024-08-13  64  {
721f4ea899ff2ab chenzheng 2024-08-13  65  	if (token.buf != NULL) {
721f4ea899ff2ab chenzheng 2024-08-13 @66  		memset(token.buf, 0, GRANULE_SIZE * MAX_TOKEN_GRANULE_COUNT);
721f4ea899ff2ab chenzheng 2024-08-13 @67  		kfree(token.buf);
721f4ea899ff2ab chenzheng 2024-08-13  68  	}
721f4ea899ff2ab chenzheng 2024-08-13  69  	misc_deregister(&ioctl_dev);
721f4ea899ff2ab chenzheng 2024-08-13  70  	pr_warn("tmm_tsi: module unloaded.\n");
721f4ea899ff2ab chenzheng 2024-08-13  71  }
721f4ea899ff2ab chenzheng 2024-08-13  72  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
