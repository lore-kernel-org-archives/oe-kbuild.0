Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2375E55A
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 23:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773010946; cv=none; b=TOjqO5naPrE5bDKtZx1xW7YPBmhe4t9X9hUJgJNGK6G2JddSe14NijegT+i3W9wCYtAZp6eMxDik665B83u3RB96M46K7Zx4qI1zoy7n8mugmhL5xPku1hCjDEBEOUs7J6WUPpgsvPefjf/CTRjWPzJuKPSWdK5b1pRVtl+Sn8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773010946; c=relaxed/simple;
	bh=4jgPIIcptMBlIVAO3VsViSdmBcKM2OSBNuI6JkGWPFQ=;
	h=Date:From:To:Subject:Message-ID; b=uMebiGIbiRL4GEXHREKC5pv6NXOczJRder2IX4LduAadweyd3OiRKq4L+/qJgF4a4/kr9oaINUlefgMo7gkUN/eStyZztNnfz5cCxUgsjHQj5Jk4JV7UdWtQ73FQ4cF/mTlwwK3IgcTxSpf0TqgFwcq5YzPAK1p5bMdIVr6TzKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FiZ30Wen; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FiZ30Wen"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773010945; x=1804546945;
  h=date:from:to:subject:message-id;
  bh=4jgPIIcptMBlIVAO3VsViSdmBcKM2OSBNuI6JkGWPFQ=;
  b=FiZ30Wen7di5x6G1d7BXWpyEGwBSk/MYhx6kgRKntQn06qbpmRqDLyNB
   NdX1oWrPdRO/Tlta2yx4LiR8i/k1k8Va161n3esS5/mkaJmKDfRp6k2uQ
   CBBBJUbOxXSeErknYmQp/hgMcYWhpUk5TAEO+/wPWt99Y4z6He9fcPmAf
   BTmB8FVGh52C11RIgjZrymAfF8xgMU24GQGkf0GIR/DNjrFpjxtzhs70z
   AvneMNcGKAE8/cShRIhiYCYMcNYj+/cvRTsn2iFCR9IeZyna+WwRYyloR
   l8dConrPHgTuU6ZfcSlP62diPtBVK43mayJ3RDo7jiZyjy1tUvmrkPo1b
   w==;
X-CSE-ConnectionGUID: 2P1EOB75Sa6qlB8uk7IcVw==
X-CSE-MsgGUID: n5u1awUNRtSIgglL4GKU6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85387812"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85387812"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 16:02:24 -0700
X-CSE-ConnectionGUID: KFqbxc5ZROKJpqSuRiI/+A==
X-CSE-MsgGUID: l47eIrcWTV2hKi1tMx0LdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="219549412"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 08 Mar 2026 16:02:23 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzN8f-000000002kb-0uIE
	for oe-kbuild@lists.linux.dev;
	Sun, 08 Mar 2026 23:02:21 +0000
Date: Mon, 09 Mar 2026 00:02:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-new 206/330] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Leon Romanovsky <leon@kernel.org>
	[drivers/infiniband]', should be: 'Leon Romanovsky <leon@kernel.org>
 (drivers/infiniband)'
Message-ID: <202603082342.0LWT9Pgd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "David Hildenbrand (Arm)" <david@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   167400fd4c51f9e5ea8fc9d33c89c938799be4be
commit: 9858ac26d447f971537a7cd23625f88177a02c6e [206/330] mm: rename zap_vma_ptes() to zap_special_vma_range()
:::::: branch date: 44 minutes ago
:::::: commit date: 44 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260308/202603082342.0LWT9Pgd-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Leon Romanovsky <leon@kernel.org>	[drivers/infiniband]', should be: 'Leon Romanovsky <leon@kernel.org> (drivers/infiniband)'
#21: 
Acked-by: Leon Romanovsky <leon@kernel.org>	[drivers/infiniband]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
