Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA373081A2
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Mar 2026 22:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773787204; cv=none; b=JcYVpx7PT+eRmnX8g+PtwDtGePnI3XMwPpifamJwNpE4fwv6EpqIsAhUrFX6sQjc+rXD/9d+rz2Gzx7qvtblpVhC0CtMtv+lEULNluLnIEGSAIqVWf3Yf8+liKa+lbKnCSRUxBkBbSs5c56diyLdBg3RBBQNmxp4wGL5SBlgw+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773787204; c=relaxed/simple;
	bh=9J4DycXt6VW0LZB1g0as93UqOsXehlqFbEnKAohlhaA=;
	h=Date:From:To:Subject:Message-ID; b=TOQLWeOcKtOQtCGEaEEwTp1ZdKzG3PPDiuSSQWtgpBOpQvgsjPEdxAtChtWJjHNEUDDi61SKJaQw9o7ZIKTsFk+hqvw/QLrB6ICRbI7TDaKdNsPgV14ebxvPqlfo5TeRZvrcPwWhjxkL2mF4RoFFqnbMZ+1hmpgVcNg/I9ufQQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YPq2RVZX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YPq2RVZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773787203; x=1805323203;
  h=date:from:to:subject:message-id;
  bh=9J4DycXt6VW0LZB1g0as93UqOsXehlqFbEnKAohlhaA=;
  b=YPq2RVZX4c5NkjVPITDCKlvpViEcqPl5AZy8trrPCbhokbG/MWwUpRMj
   OyAWFKEKpybYRXiwYqwmejjka1lgdWAixXhnwJbA3mSQj2QH4ANQilmRv
   +Zdquk4XhauDFRxx0m+SCyyPBlEXASjfovVIiHTP+0MHoQgXwbqbn5hv7
   jdQhya2LNBwVLNdtz1haG41xi6sBtLP2g3QX6+xME3eNUGWx77WMZOgbB
   T2N6/ylRU4RVzlK0QP797c5pFt1mFaAaNUnIzjLM0wkOWarGvNUGeXsPT
   0DHa5DYMmsvVr3V6FuspvKN8jxDEsCGWEnLqq2frx98ecI2dObZhM6wr4
   Q==;
X-CSE-ConnectionGUID: VsnJ8Lb7SQaEoeV1Y6iOJg==
X-CSE-MsgGUID: dog/JXY2QeWSYJVI2DD3Dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="78733955"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="78733955"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:40:02 -0700
X-CSE-ConnectionGUID: MG1LfSbMSHeVMDxIbzY0uQ==
X-CSE-MsgGUID: cfqGf85hQV2rZNOHQcsgRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="222633117"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 17 Mar 2026 15:40:02 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2d4x-000000004Wz-36Dx
	for oe-kbuild@lists.linux.dev;
	Tue, 17 Mar 2026 22:39:59 +0000
Date: Tue, 17 Mar 2026 23:39:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tnguy-next-queue:200GbE 3/15] checkpatch:
 WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Larysa Zaremba
 <larysa.zaremba@intel.com>i', should be: 'Larysa Zaremba
 <larysa.zaremba@intel.com> (i)'
Message-ID: <202603172321.Yd0dWIkg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Phani R Burra <phani.r.burra@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git 200GbE
head:   913b9119e14d992557d2df5f8f1b9aebb91d2709
commit: c5bb8a53fc025b25dd737ae98f6afe8db4967c23 [3/15] libie: add PCI device initialization helpers to libie
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260317/202603172321.Yd0dWIkg-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Larysa Zaremba <larysa.zaremba@intel.com>i', should be: 'Larysa Zaremba <larysa.zaremba@intel.com> (i)'
#18: 
Signed-off-by: Larysa Zaremba <larysa.zaremba@intel.com>i

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
