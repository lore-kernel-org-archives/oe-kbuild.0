Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202FB1E32CF
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 19:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766343669; cv=none; b=qGqKA9PfP+WD1YUGj6m4fRJlEegfSPc/w2a6JdSbt0JRRRcoNCO11HQkyXdZ7s3mDv8B3U5Gx0CpakGpvSuLmCIWpoQlAKXlS/IKPqB5rlJBlIG0qbGBe6VFECWp4HQOP8MEd41FfkZbuUmueS6C+SO9sDvQidWSzhW4iXbL8AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766343669; c=relaxed/simple;
	bh=pxiGccqkzoBo6O3djJslv2V5y0vL9VxxMAkq/Glk/3o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NJNu1aADdZvj5q2b78hU2spPK1P75nUzz9hMF/n1EFytnjCmxByWaNClDHxr1zz1jx8G10/stzpgl3zGm1v9l0ITePs5wIl2RRyj1duwyJiyYUWsDsM0krkJ1purDzQ8Rs1QYPrPL2JfMtajvqOurBzgvwNZOW712TpTGPOwsJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mWEuRgzj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mWEuRgzj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766343668; x=1797879668;
  h=date:from:to:subject:message-id:mime-version;
  bh=pxiGccqkzoBo6O3djJslv2V5y0vL9VxxMAkq/Glk/3o=;
  b=mWEuRgzjcwkXdInZmBNb93VuvgACnTsk0be6ELJWBcGTszM0pvgOtLqc
   +PLmgtdI38pzwAff0+bYHPlz+fbJjZampC78XhZ/Mj/4EVMzAuhGWOfcz
   HUdWw1Rf/yJ1NRfOWFI2kyzkqpYpxNG3HwRTV3z/tUg+GrLfyZcA7jWMM
   6WX/FQRvsfU0h6Q7OR68Yqe4xCkrRjBVH8DxVsN+1iyKf6Mmc0jkwD9g7
   KvfzeICTV/VYJNNYugJU1uYZ37VzI4t18M0uszbVStzUVneZ3QYAL1CiF
   t25qfWFecpPd9gnBphcKzJD3wausFUnBm0de4vmsiXT1v0VH4effVPERn
   Q==;
X-CSE-ConnectionGUID: HC7zFS/mTvK/Z/WVXEQROQ==
X-CSE-MsgGUID: EqhoABNKQ/W+aHSm1EYWtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68293743"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68293743"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 11:01:07 -0800
X-CSE-ConnectionGUID: v08NrixfRL+e4JDpUCVXmw==
X-CSE-MsgGUID: uRKGpcwCTrSTBubXpfDpHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="236762125"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 21 Dec 2025 11:01:07 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXOfw-000000005Ci-1T3P
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 19:01:04 +0000
Date: Sun, 21 Dec 2025 20:00:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal-linus-next:linus-next 20/20] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'claude-opus-4-5-20251101'
Message-ID: <202512212002.lyRqTbg1-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linus-next.git linus-next
head:   490c187d462dea48b1033d8cd400682ea55337d3
commit: 490c187d462dea48b1033d8cd400682ea55337d3 [20/20] objtool: fix build failure due to missing libopcodes check
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512212002.lyRqTbg1-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-5-20251101'
#27: 
Assisted-by: claude-opus-4-5-20251101

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
