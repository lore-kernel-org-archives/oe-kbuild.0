Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2A21DC198
	for <oe-kbuild@lists.linux.dev>; Thu,  2 Apr 2026 02:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775095278; cv=none; b=FTBRczkkLaZ+Me3lWdlfOab0T7TIaU3eahYMar+RwhK7qISJLsSxOJxdxhVcKzpT9uao1TPhExxDwRVryf8IWV3Wt6B3G8AVg2hw4L/L7TeKyKc57n0Qi0QbkIjDwqnTXlXm+umZjXAIii/2qVdXoRqPCgZMf8ZUT/lWGRDyBko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775095278; c=relaxed/simple;
	bh=yUOfeP5LqtXmGa2NmoVIByiZA1QkIwmJBZsHy5oYh+o=;
	h=Date:From:To:Subject:Message-ID; b=PjJ6RuncSZs46s6e8OZ6VR6Vqk9JXwmw7+ac+7b29jFiIIVUmN3GDQwX3x9fwGEgfyNz2HQhGdDMnf5VGsbNOLXJY8uw4LNrcOQ/ZltJTev0Xg+HeMjjhWZseuPT7p8m3XBZqKjnVhQxmgiXx273+GZP7rL44LFE1MLRJCPZ+jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jVy76XS1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jVy76XS1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775095276; x=1806631276;
  h=date:from:to:subject:message-id;
  bh=yUOfeP5LqtXmGa2NmoVIByiZA1QkIwmJBZsHy5oYh+o=;
  b=jVy76XS15CD+fanjwll7ZpqG2iSiVQd2HQ72Os2H7GxVkLItB5RdSvvT
   8bgNFrvL1XlDdrPEML7097Hk5CBZjoerculbqZyXNOxE46sqeE22qhh34
   420EBf4frzDIxJF95V1btsfJkX+Vv1e9neFOZUA795gWfOhnPPkQgneYL
   ZXpkRfREk6RBiiQryljJHMg8qXQR3SksFXaIzwGiOshuHASrpW2dZxnT6
   yl0DOxEXMg9asjlWfA4OuqnMvgF1Qhs0V+5Cn4YSdc6Dw+UShtt9Uw/PP
   ZasWzikkNmfKPxVqoMdSRXJL0kp+7RhvJHzLjau6A/zusl0k9Hw60qLn1
   A==;
X-CSE-ConnectionGUID: HQSIdhwyRKyEXvDnHTeXGQ==
X-CSE-MsgGUID: T4MXjwbYTiidiaMBwJ+eeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="98760914"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="98760914"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 19:01:16 -0700
X-CSE-ConnectionGUID: MRruqHMLSYKHkhv9JdobfQ==
X-CSE-MsgGUID: fXdteIuxQdSFc2kvh3tIgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="250046332"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 01 Apr 2026 19:01:15 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w87Mv-000000008xx-2DWj
	for oe-kbuild@lists.linux.dev;
	Thu, 02 Apr 2026 02:01:13 +0000
Date: Thu, 02 Apr 2026 04:00:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [agd5f:drm-next-7.1 30/71] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202604020307.bH6aKhuM-lkp@intel.com>
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
TO: Lincheng Ku <Lincheng.Ku@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-7.1
head:   8b3e8fa6d7bdab292447a43f70532db437d5d4f5
commit: 096bff6706eb105954bb45f8e8f3e37f05d10d0e [30/71] drm/amd/dc: Add link output control for DPIA
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260402/202604020307.bH6aKhuM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#38: FILE: drivers/gpu/drm/amd/display/dc/link/hwss/link_hwss_dpia.c:149:
+	/* Ensure initialization order matches the declaration in link_hwss.h
+     * for strict compiler compliance and consistency across HWSS implementations

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
