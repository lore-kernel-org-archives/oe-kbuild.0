Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51271196C7C
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 22:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778452313; cv=none; b=rA/FpmZjY/Ddl7CalcZ60sk52YFuIc3WKnw6+bdqIOYYFJy2cU5MmM9nqCA2pcq5DGklxnon4Ivm1K7nq/Kb/GgqNue7zDbO5a0+TVWVEsCvGeAvWWPV2clR4vd2p/MXGIJ0D+iS5F9b2B0/+lDI6qkPp/ZU4YUleJEY7sC+gzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778452313; c=relaxed/simple;
	bh=/HdCy75dO9ZesECa6m5bUTahZ2C/JexVZSdC2OhpovY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=A2WhTliV0+tIKhT+Ufu8QqCWTNgfSsFXOOrUETo1g5RARprFy+aY42w4RBHOQuFwbAjOUGL+04k1UD1mG/is4yJF1rP1I0brE1v5EbC4YknqU9nhxJAU8YKaYkl8l1FYs2dFWAgDGGYclze6/eC0X06GLhwuzx0LIx+OrwWOhYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jtFD517v; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jtFD517v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778452311; x=1809988311;
  h=date:from:to:cc:subject:message-id;
  bh=/HdCy75dO9ZesECa6m5bUTahZ2C/JexVZSdC2OhpovY=;
  b=jtFD517v+7FbEAFbWvy+SD0ZBTSIf/MJ1GE6I8KL3Lxlfw234bgrjUgP
   +tXNFWfnOKSKKfLuQTQ+m28DTvAWKPpe6nBh0RTHk136QD5bl30UcNfS9
   TgFYKzkM3K5+33revNxwHuySpAXyOZVrwiLUY2VM3iLf/gb0JNt1YsZYT
   tuhufkLTUMnggwT1VJ4gLMgdrS6ouXixjEkCqAnQP88oZehbdsaDx5/B5
   Xr+dcPINxBs7HHlejDFNhcFGv6gFWrHLVpgTWfVBc9hzG84jhiFfWxf59
   o3iCa+s1XR0f2wHAeMhSRuIQEeFjsLvk0knsMpHZdU5FVacPu+tn8EKSe
   w==;
X-CSE-ConnectionGUID: 1mRWLpCTQxCfiZzFPHm49Q==
X-CSE-MsgGUID: +beKhOc8RM2qWtlz19mlJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="78486912"
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="78486912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 15:31:50 -0700
X-CSE-ConnectionGUID: 8cQ32wPdSR2PHqKZ/AXnGg==
X-CSE-MsgGUID: H783vT4vTKKBuTrRg5X6SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,228,1770624000"; 
   d="scan'208";a="260756722"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 May 2026 15:31:50 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMCge-000000007oe-0LuR;
	Sun, 10 May 2026 22:31:48 +0000
Date: Mon, 11 May 2026 00:31:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rppt:mm-selftest/v4 37/55]
 hugetlb_fault_after_madv.c:81:46: warning: format '%lu' expects a matching
 'long unsigned int' argument
Message-ID: <202605110038.pcd6uWCz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Mike Rapoport <rppt@kernel.org>
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git mm-selftest/v4
head:   54ada66ccb76f29a7ec168bfa00b7dc818b44df3
commit: bd4425c38dd8747668403780d9d1f0504400c701 [37/55] selftests/mm: hugetlb_fault_after_madv: add setup of HugeTLB pages
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260511/202605110038.pcd6uWCz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110038.pcd6uWCz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605110038.pcd6uWCz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   hugetlb_fault_after_madv.c: In function 'main':
>> hugetlb_fault_after_madv.c:81:46: warning: format '%lu' expects a matching 'long unsigned int' argument [-Wformat=]
      81 |                 ksft_exit_skip("Not enough %lu Kb pages\n");
         |                                            ~~^
         |                                              |
         |                                              long unsigned int

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
