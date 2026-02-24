Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE7D396D07
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 12:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936185; cv=none; b=qc/6/RjsYvdQafPKgD8/msX5hkfqIYOgJvnHRFcyv0KsjxXCrOUynkMoGIbWPR5fE4xW23/cuU2bXN0NZyfkiDq1y335Lujzf9ons7dkyvYOAx63QjfuujILGns3DJGskZFlOBYxnkvHu4FMhykV10vPjD1WSwjW42Gkzr+o9Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936185; c=relaxed/simple;
	bh=j7rn2VrPnP/fLQFtkcQp1gI8Z7xQhY+cMaqnKAbWNZ4=;
	h=Date:From:To:Subject:Message-ID; b=T6Qt/kTXfCu/E3BxLuWEirUDjBnbxgCy8lAKQPC+yJHVmxIC4ghea3AZry6f4yfLmouflqZoEc3Y8WPuaqZbpyTtBllpMnxqgyMr5dG3hRspPg+1QnavfFHk3IaG5MTpQC/UU3pRpn24fjZh/QcTepXlbAd8WGahKMAYT1iz08U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gMazetNn; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gMazetNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771936184; x=1803472184;
  h=date:from:to:subject:message-id;
  bh=j7rn2VrPnP/fLQFtkcQp1gI8Z7xQhY+cMaqnKAbWNZ4=;
  b=gMazetNnxGY06tbj//wLb5R4yBWoUUszTH4UvicRwAmpMa4BjolyVddw
   CvLNPf8BrKK7QAaAjeMTfEMfoHEjsh+BCbkQVhaV3N4Mjz94cYZXy7mkc
   d2+mGuryga8OFpVmnwvuX3CPzpf0jUXg2xqRPcJpanCm+CSOMl1+jxdL/
   1IcdurAcTqxYv7YNE6TcCZLVMEGoFo+Weoy5ibqnJLmdQhmP0bEJbjPip
   zkPr+MSx5ICfo2GtwnPjf3viD2v/rsL0P0yD7/FClsb3bwk7PGjS6X5VR
   HcmzEMYS/U4cCVChPOA5zeY5O4Sf0QsVhhMhLdFHrIwQ1UvH/DmDXBGG/
   w==;
X-CSE-ConnectionGUID: F+u9ahmQRBG4LFeRZ0AS7Q==
X-CSE-MsgGUID: tMjVO0TtTwizeOwhumzzJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72823106"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72823106"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:29:44 -0800
X-CSE-ConnectionGUID: cj5aieiLSnqZ3LaYUyvFhg==
X-CSE-MsgGUID: F7W59QUMSv6jXiA21yh1uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="253617643"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 24 Feb 2026 04:29:44 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vurXo-000000005HP-3vKZ
	for oe-kbuild@lists.linux.dev;
	Tue, 24 Feb 2026 12:29:40 +0000
Date: Tue, 24 Feb 2026 13:29:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arnd-playground:randconfig-7.1-next 686/733] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202602241322.gzBw8PQQ-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.1-next
head:   76f9bd9e344ecd3faf7bdadedc7027b64a6f2d63
commit: bc2f7acdb1b52a47b7f91cabc11147e068f8b3c8 [686/733] temp padding
:::::: branch date: 2 hours ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260224/202602241322.gzBw8PQQ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#1747: FILE: include/uapi/linux/netfilter/xt_statistic.h:40:
+	__u32 :32;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
