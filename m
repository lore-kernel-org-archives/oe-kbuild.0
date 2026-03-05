Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7DC26A1AF
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680606; cv=none; b=X+P+pqvELovxN3yd+2pjRV1ZX9d+HSHv6OL+H5TB2Cgrile1JCzEqO9xZOLI2WEOlRYkKa7euxSpIdN2PnqSe1UYGl1hqNLWKQ+efe3pAYtty1IfMLON1cB2UKacKG0lY4jbWYb2dU4BgKYOSvoTEtiQQrCu1jXoBoe9leI0Xm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680606; c=relaxed/simple;
	bh=6wNXUbYNepydB+OcQHUh0vGseJsJL+1R4GEwM1fys5M=;
	h=Date:From:To:Subject:Message-ID; b=aWJzDVhLWKyPEphCRWDm383RWsz0z+ByG/CkJVenZiNSnKIpQoYJDBm79TxxJkycyMLlY28TtdZvvHUyIZkPeJxWyqhuyXGop//WLr5cxzDY3PlNzTAG7vfI5uSGrw5QuEno//Yh0bDXBpSEPi6C2gIuSwM3/ow74RvoVgLRugI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lY+nOcn+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lY+nOcn+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680604; x=1804216604;
  h=date:from:to:subject:message-id;
  bh=6wNXUbYNepydB+OcQHUh0vGseJsJL+1R4GEwM1fys5M=;
  b=lY+nOcn+Uv6TlQ/uhHbxPoeS9MR9XjiafYloB7A7gq1A56Mh7b1Yruf0
   ofn1zW7BYKevSMQo6yKYWVOFqP+lEW7YocqjHHe4mwFY10eTfz12q1+R7
   xPZCY9dmx7EYRxXm/jnf08h5pAfR5DqMHtcgYyUHnziYJGT4qyDty9vnO
   j+o43PN6AHoF/2Uup+iHn7EL6KUTv0TqIwyGzeNk60wVRCyG7fwRCn1e/
   dkKpgw673GuZeKt265pAYNs4GqYjD54KfJghid0A+oDA96CvwjDSqmjmH
   +JsgYKAbURfkJnCH0BAMN4rFTSUEirAU0xa/Yr4dQef+ufUsBWc0ZjhOE
   w==;
X-CSE-ConnectionGUID: vnlEh2QZTlCO2Rv7/Avixg==
X-CSE-MsgGUID: +hk/8ydwSt2bEXlCMGkINQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91328583"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="91328583"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:16:41 -0800
X-CSE-ConnectionGUID: P/ZPSbCOR1WpYDh0yvTs3g==
X-CSE-MsgGUID: DGX5PuTkSq+BNSOWgYMAFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="249014379"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 04 Mar 2026 19:16:40 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzCX-000000001vX-34fc
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:16:37 +0000
Date: Thu, 05 Mar 2026 04:15:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 455/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050454.MrJ8o2SE-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: efba9eacaf9feb44fa23d1ae245d251d73518642 [455/467] phy: mediatek: convert tphy fops to read/write iterators
:::::: branch date: 70 minutes ago
:::::: commit date: 70 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050454.MrJ8o2SE-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#26: FILE: drivers/phy/mediatek/phy-mtk-tphy.c:448:
+static ssize_t u2_phy_params_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#60: FILE: drivers/phy/mediatek/phy-mtk-tphy.c:563:
+static ssize_t u3_phy_params_write(struct kiocb *iocb, struct iov_iter *from){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
