Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B881A2C0B
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 01:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766538949; cv=none; b=AcfY/QHiIKgM/pclIjS8Px2vlJKCuHRMAC07bXgu3i7FV+UymmnQgNBh9svTZ9VuTkfluq8rm9yx09NrQBGw2/aVnEoDQYmumoPDnyf5RCRBRIoMLog/lSnl/uYWp3zz7D69BdGhmS7QwpGJdV8nxObiql7cSoH0EzS269fzok0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766538949; c=relaxed/simple;
	bh=Y1On+ePlHTwGUNUygRqRFG5Lu3uTxbnKUcy9nGDAjkY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+07kZIZvmCUaRLybrhcDnr5ZBWiBm/ZqV9j1LoCWGmwaeOKRRp9QQMF1H9zLTDaK+ridPQh03SjjVNRP3efYibUrplNbRg+3iMF53Zs+TtpI+0fIt/CXJhYT5DFUgSHTNFxIJWvCFpwTFsxLsVbYvwzORFmLQyMYG8Yq4jhFWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O1FEz83N; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O1FEz83N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766538948; x=1798074948;
  h=date:from:to:subject:message-id:mime-version;
  bh=Y1On+ePlHTwGUNUygRqRFG5Lu3uTxbnKUcy9nGDAjkY=;
  b=O1FEz83NPF8JSAp0B5/siU+tSS0E7frN1o3jin1cPUTtEnGqhs0dyU1B
   JPbA+MCyzrx7N5jB/wbnkRR0dNUMFa1ajX1OrNtXJ6GCSOFP23i/CnxTX
   8i33e6+5X7+v8VbyZ0fEEC/Kfj7HPpsy/C6/5Slk5dgcBzQCzJ0Q2QNLN
   NvUn2KstvUL6tDi+oq/l1p3PzouWZ+OWwqbAtXhata1AtwWPQVWFHj/G5
   XZ2Z3LfY+NmXreOYR7G8Yp7jzt6eiSoZTSI6gcLcPCdbq8F9lqQsVolZO
   nStoOx8pdbITwdk+h98bwVTCrpdcJvXWo82PYftU0ezwryjXvNaJ0k7iu
   A==;
X-CSE-ConnectionGUID: SH8rfzjnS/SBeDVM5lDPIw==
X-CSE-MsgGUID: RWHfjsvGT9C9pi/Fr0bMIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79746589"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="79746589"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 17:15:46 -0800
X-CSE-ConnectionGUID: KVUMd/S6TC6lxK15j4xJMw==
X-CSE-MsgGUID: aoIvocOORnCbEGVEmM9d9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199814727"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 23 Dec 2025 17:15:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYDTb-0000000062m-34iR
	for oe-kbuild@lists.linux.dev;
	Wed, 24 Dec 2025 01:15:43 +0000
Date: Wed, 24 Dec 2025 02:15:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-hotfixes-stable 27/27] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'claude-opus-4-5-20251101'
Message-ID: <202512240237.a8PjYG4M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-hotfixes-stable
head:   d6b5a8d6f142ad0a8e45181f06e70b4746c4abc3
commit: d6b5a8d6f142ad0a8e45181f06e70b4746c4abc3 [27/27] mm/ksm: fix pte_unmap_unlock of wrong address in break_ksm_pmd_entry
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251224/202512240237.a8PjYG4M-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-5-20251101'
#33: 
Assisted-by: claude-opus-4-5-20251101

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
