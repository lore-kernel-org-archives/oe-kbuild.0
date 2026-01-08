Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B8D7494
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Jan 2026 04:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767846547; cv=none; b=LHX0ui5OjEqyplipKwEegjWmY/xlj6+zBSp2cUIzQiwO1M22vnYHz4SzTC+RpBOD8GNI8yE0QP8AtxIHAW0QzFC9YmHSkNc4oHMLlRF9+pfamSCN6pYQ3tBr/EDBkKLaeSaQ3eQboIV/DDd/7TC9xy3NTMbQApXQGdNuvI/JTtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767846547; c=relaxed/simple;
	bh=7K5n2ot4/3jvxCNnEIMoI4xS5Mg2HxvpoGbvY/5ge5I=;
	h=Date:From:To:Subject:Message-ID; b=S2rg5u8cFy2+k0q+KNYz48uYXHsp2TyYGAAewpuPHCvyrK9UnzMi/JGpgKgxU2+ACgQvfgBL37Ej5OjuW7dIcxAZ2Wfd13vwBZoHCY9yqcjk3Vuc4BMi7GHjSX7obIUJ28vcIzye3Goz/TPWqJu9M0XSoMALyXlvrc1t5x1XI5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m3ze0+Pt; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m3ze0+Pt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767846546; x=1799382546;
  h=date:from:to:subject:message-id;
  bh=7K5n2ot4/3jvxCNnEIMoI4xS5Mg2HxvpoGbvY/5ge5I=;
  b=m3ze0+PtL/c9ZyQVKPZHoGziojhSU5oiQnl2NNZfluyAqlBUqBl08qe6
   SeyS5s5kD0WVeENPGoFn/bhvqyYE9GE3wPpqd796DiMlnxJ8JHnsMaAzF
   Y9R7JEhBIquoHGeqhxg5R5dPRYlIrNepqHA1dULTz4Y4Y1Yu/k0kMQI0r
   8lURCNacUCx+vylO6utYZTqfytiXB1KDrZV0/yX3kf1xNEK73W/iWLC6I
   xhAxn9EiziCrn8KO39k7akoYh791/w/iXgx5010fIhKgxZ062fT8CYX52
   r2bt8lMlt6U9Y2dUMoP/jn5jNYxq9H3u3xnAvLNh4LQdngZNdc4C808xV
   g==;
X-CSE-ConnectionGUID: iL13S2E3Su29WpvYY2dnvA==
X-CSE-MsgGUID: j8WFmubYSgCGZ7VCyG0Isg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="86639960"
X-IronPort-AV: E=Sophos;i="6.21,209,1763452800"; 
   d="scan'208";a="86639960"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 20:29:05 -0800
X-CSE-ConnectionGUID: RU71uRt/RKGt6PUrc0NXWg==
X-CSE-MsgGUID: hbQ/7bQcScKwB+t+tY6lwA==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2026 20:29:04 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdhdu-000000001gS-0lwN
	for oe-kbuild@lists.linux.dev;
	Thu, 08 Jan 2026 04:29:02 +0000
Date: Thu, 08 Jan 2026 05:28:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-new 249/251] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Yosry Ahmed <yosry.ahmed@linux.dev>
	[zsmalloc & zswap]', should be: 'Yosry Ahmed <yosry.ahmed@linux.dev>
 (zsmalloc & zswap)'
Message-ID: <202601080531.pIMh2iQ1-lkp@intel.com>
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
TO: Sergey Senozhatsky <senozhatsky@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   d4afb788b8ed7652762e9c56121f57cec4733f03
commit: 05fcbf04ce0b3a1daa9fa89be6f04fb78c9a17ae [249/251] zsmalloc: use actual object size to detect spans
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260108/202601080531.pIMh2iQ1-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Yosry Ahmed <yosry.ahmed@linux.dev>	[zsmalloc & zswap]', should be: 'Yosry Ahmed <yosry.ahmed@linux.dev> (zsmalloc & zswap)'
#19: 
Reviewed-by: Yosry Ahmed <yosry.ahmed@linux.dev>	[zsmalloc & zswap]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
