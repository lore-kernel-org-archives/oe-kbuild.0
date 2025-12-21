Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174892F745D
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 12:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766318702; cv=none; b=kb4gbH7zBCZFpCDVUc1wXZnKIpQeYtshbVi7OTuZAS1udmrozpvGTvDjCgpwnYEFGvdtpveeF+3Q3N6N64GuU5ioO8BDWVgfEU3nX8dr6b4NZ9wXYG+y41oOYp0BQ3+MgqcrJKpznQ9cQfPkIdMtoED3xG7L/vhkP8bPCK7ugW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766318702; c=relaxed/simple;
	bh=StnMFPEhlLuQAI+mXWgRdoD4zHiROMttY9iHyOo35LE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V2thyrbZmbuTMAG2PkvyfV3ao1SxDuO+qZ2j3tS2Y7bFv1DPNAddd0LMD6TKpXYjSMtYCzrTr57li37T0q5cF6Ws+M0/RykY/ecpBUuvSuJqHMHEuoRc0j2aeFY/hVfKmVJTMrkOubrLQaMQa6YpjNrCfGPmla9axQ7k7quukvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4i0MVyx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4i0MVyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766318700; x=1797854700;
  h=date:from:to:subject:message-id:mime-version;
  bh=StnMFPEhlLuQAI+mXWgRdoD4zHiROMttY9iHyOo35LE=;
  b=n4i0MVyxWwDxpYH+fdO5wvI5D64goVeDrcHgh0PG3ZBGDpqu6sggbaWs
   0EmaBcOy7nEegt9GdS7bBwU/0EqfhvFdPTUO986Xebffmt+irMRupyUNq
   QJ9++CpF1JleN7hSg4M0hrxboxW1fYwkeuoKzigAFbTfIprf7WYuYVFkv
   vJzXEDwarn/uw9cz6xpDtRYQwtM0vmoRZbc5dYMHqc4/WqU8/SfyI33/U
   ua8Irr+Cx6yEXdv0rwlInoPkjBvsqSvmUZGmLtnOPFPUcQ+FqoQOoRb/i
   TLoPEwkmRbyH9suLWM0vbzJkydnkNI/yahX2DkpU4DDR6ivfaZPzxe3PO
   A==;
X-CSE-ConnectionGUID: 5/GpDIKARuWFA03GWg31eA==
X-CSE-MsgGUID: TYRfPeF5SP+OcgJKaYdE4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68357393"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68357393"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 04:05:00 -0800
X-CSE-ConnectionGUID: ilwGLQPFQ6e+fZc21aJ6OA==
X-CSE-MsgGUID: nSK2EN+lQ0+OSIQtEUUhZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203419453"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 21 Dec 2025 04:05:00 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXIBE-00000000526-3XT1
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 12:04:56 +0000
Date: Sun, 21 Dec 2025 13:04:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal-linus-next:linus-next 19/19] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'claude-opus-4-5-20251101'
Message-ID: <202512211334.do26BmnI-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   f898b6520b7c457168584c2145fe3cf2c6444822
commit: f898b6520b7c457168584c2145fe3cf2c6444822 [19/19] fuse: fix iomap_folio_state uptodate mismatch on full folio writes
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211334.do26BmnI-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-5-20251101'
#39: 
Assisted-by: claude-opus-4-5-20251101

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
