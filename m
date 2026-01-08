Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40252494F0
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 04:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767846607; cv=none; b=mUfwyEBVJZz4dQ8Rjtf+v9BThoFWvCmKUX76PqGDDB4Fwxv9nqQg6KtgUqos0Ggii9d9y/WCN1XItws+k0mWtxMpl2vEuvNUPu0leleQzUxAmgXlmBCDzrjoDS1OyGs+hhrgwGNdNp6WVDOetq6k+8c/NSd5uabBLLbrVTHyPIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767846607; c=relaxed/simple;
	bh=zfZDOR4qmhDgA2qzVH8oXejf1Tv4V80BgegIEyBL/vE=;
	h=Date:From:To:Subject:Message-ID; b=LGocbDi37AcG65t2t5VR6T0fcLlhyMfWxRQjZvIN/He0YCPmF5JwUqqfd2nxbH8P3NG6gvnwDt5mel8Cq9IRWvms/rxTFU44kxWXeVrvo0ght7LUpW/UGynD5aq+4HRzssPBqj8ehY0yAHxtXVw8WGmjjdt6XEyF8oqFQIfC3L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2csHnHU; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2csHnHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767846606; x=1799382606;
  h=date:from:to:subject:message-id;
  bh=zfZDOR4qmhDgA2qzVH8oXejf1Tv4V80BgegIEyBL/vE=;
  b=d2csHnHUiSbgObZCrQCXp0pdqi7wsPpRVlnoSdbJ/EqzyARMFGPzuIuA
   9QvGCCMw358YMvS4uxnV6shavgh7FVnTlTyaldQXXBDJY7nG0KE0rNmvA
   2FH8DlmygdxqZFeAGOLY+5bi9T+wpw/6eB6EWiC9J/Z6SI8QEWxSjSCb6
   jH9AbAKh/JUGMbsGborCMXKt06sCCA5Iv6DNu25NV9+VAIIaBGcPkS1fs
   4hVsuYxjNrTd/oMdVPojOCovvx4HZkE6uMiFhoRAmbxIuOO1siM3qWO0g
   +xQUo4YJ1YlTEz/aORW3/6cwTq5EDsDwpybHNOYqOoNBWQlc3yEuET3Lq
   A==;
X-CSE-ConnectionGUID: Y4ituEnXTE6gfOZJsx2big==
X-CSE-MsgGUID: bk5uwRPlTGiwEetn7PaP1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86810209"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="86810209"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 20:30:05 -0800
X-CSE-ConnectionGUID: x5egNUNUSn2oDtgUathQjA==
X-CSE-MsgGUID: UsrxhEuJQOCKR5ptNJ9IkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="202885739"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 07 Jan 2026 20:30:04 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdhes-000000001gW-0vpV
	for oe-kbuild@lists.linux.dev;
	Thu, 08 Jan 2026 04:30:02 +0000
Date: Thu, 08 Jan 2026 05:29:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-new 250/251] checkpatch: WARNING:BAD_SIGN_OFF:
 Co-developed-by: should not be used to attribute nominal patch author 'Yosry
 Ahmed <yosry.ahmed@linux.dev>'
Message-ID: <202601080538.DrWM7A6m-lkp@intel.com>
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
TO: Yosry Ahmed <yosry.ahmed@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   d4afb788b8ed7652762e9c56121f57cec4733f03
commit: c2f8158bebcaf80d1a1d0c5541202698cf9447a0 [250/251] zsmalloc: simplify read begin/end logic
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260108/202601080538.DrWM7A6m-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Yosry Ahmed <yosry.ahmed@linux.dev>'
#16: 
Co-developed-by: Yosry Ahmed <yosry.ahmed@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
