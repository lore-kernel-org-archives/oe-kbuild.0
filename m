Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CD72C08B1
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 03:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764215077; cv=none; b=D/8mBo+u2pD9TqU2Un+quRC/DU9lBdn38eB9p7JDPXGZ7QpO7cNwDd7WAAFkbfePtW3tknN7d0Vf8oCLRXGjwHvvVmSFslfsy6LkcB0hnfSkRMk5x0XOsu72AHEq+CPoe4T8JhF3cVXovvsinQM615P6L83x/QiTI+DPucosrt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764215077; c=relaxed/simple;
	bh=lKp8LxnD/Gf+xk8Zrs56h+i5PF4xN2h84cIsx0sJzSk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FzZa2cqWKrFoifmicMoP2eWsD1rOHEIgOCuNc9yBtPUrNSq2tkQi3GuHRmXSElb9e+SW61TVZF2P3Hl/orkNXgVDRvh+T1s1fjiqTk3JIpT1wpjFJM1Zi/q7sxrovWVA/9aaeL/nK0/2heTzrruZ8Km8BjgICVjGw2w/s6Dcg4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cqjcTXch; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cqjcTXch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764215075; x=1795751075;
  h=date:from:to:subject:message-id:mime-version;
  bh=lKp8LxnD/Gf+xk8Zrs56h+i5PF4xN2h84cIsx0sJzSk=;
  b=cqjcTXchkpjjB2f/REmd3o7FQ+e6DKoO+xKTbddyGDbHvziBI/WKvZgU
   6lzfXeoukPNEhPlH3inIh21BnQm10942BlrtskN+t+M3EuK1uDsY8GYhf
   CQH0qQ4CHpHZqme/3gfCV8YN/YOzDNR8zj1VXbYXsFT/nJ3y+zK/x/dmO
   D0uXwoXhYSl0aubLlMGPMzg5DlXXhQvrkezq+LA72mLIUNYK1r3b0L+/S
   CrstK7vFBog0m06zeQh+lBk8WpTCzy77jn870te2dFYybzRUunCLOng/S
   ItTgs3SFLMhYK3GtDvJbmhCOHCgXLd6y/p37LyxmbaxJnlWMLLQUzGHF2
   A==;
X-CSE-ConnectionGUID: ay4EPZTZTxyqaX7T4DLWyg==
X-CSE-MsgGUID: Ad98YvQPRo6iqADFwG4V3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66206916"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66206916"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 19:44:34 -0800
X-CSE-ConnectionGUID: ctGgR4OGQeOLcpQg17n1TA==
X-CSE-MsgGUID: zlrPcvATR9WCI8VqogBBGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="193343205"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 26 Nov 2025 19:44:33 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOSvn-000000001bd-3KFF
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 03:44:31 +0000
Date: Thu, 27 Nov 2025 04:44:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:djwong-wtf 83/83] checkpatch: WARNING:SPACING: space
 prohibited between function name and open parenthesis '('
Message-ID: <202511270404.jHzpsRyP-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git djwong-wtf
head:   6264703eb4053f7664baf4d186f67a62d71036f8
commit: 6264703eb4053f7664baf4d186f67a62d71036f8 [83/83] xfs: upgrade filesystem features
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270404.jHzpsRyP-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#27: FILE: fs/xfs/libxfs/xfs_fs.h:1223:
+#define XFS_IOC_ADDFEATURE	_IOW ('X', 71, __u64)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
