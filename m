Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C64B33D6EB
	for <oe-kbuild@lists.linux.dev>; Sat, 10 Jan 2026 06:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768026815; cv=none; b=k6xS00GCpbwBm0WBipTI80wV+iQtEKDpJDgKFAJH8NVOcvNruhJCz3bPslpjtJON50ut8XAjnprfFuBTLws9VgN18HAxtZpCaPEH3+fHngWUiLV36v6h5vFV6Zoi9/zKbvVLGzITTS+8rhoE7zATCeihlhHD8ElxfzdWZcZyME8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768026815; c=relaxed/simple;
	bh=YeKzCG+yyFho3j1eJRueo3+JG+bRd96ipx6d4mIc5sU=;
	h=Date:From:To:Subject:Message-ID; b=c4OQGoSmFfuNu/FaBX/LRWEzZEUc4yQLRsJoyPs05JohKbcZwefVPfeEQ/JgwRw8FTwm0aLDUpRnptHrC8y/0RneFdI1O3xb5gjOVp4Po1PaRTRC3/Ofabd5lR8C5hFdL9pbbWU9W4yzoERHmHpqcrouIFh6xq7pHbRZjpYorPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LiAwjvXw; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiAwjvXw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768026814; x=1799562814;
  h=date:from:to:subject:message-id;
  bh=YeKzCG+yyFho3j1eJRueo3+JG+bRd96ipx6d4mIc5sU=;
  b=LiAwjvXwHtVRFJuTp1z4rPeFoHhtsa6zdDvNnzF5ol3kdOLvUGEO4VPx
   ot4UAMQZpahbdo5U/7qDuV01KABTGDaC53YsaBnwXfB/gNgNwlPNX7sQc
   TySt3zuzvgvq2gSz5Ywezfv4MXB6aKFbcgEDBEPCwmxmYg16PwhqOGrC+
   I/v942iMNkb1v3BLegSSLJIKNdA0nBh4cbLONID9EI7JPqWWCRu6WIuTM
   5Z36msoTeG9APjY4ziXkKR8W2FucLhacOctz49Sxmdz6lDKsqloVLCVXs
   jT6DdfdH0YJ5yft049JbKqX0yoP+Rd12domhkerYcOiknEHAW6/gi2QJL
   w==;
X-CSE-ConnectionGUID: H6zeQev5Q3e5fkBxeKBj8w==
X-CSE-MsgGUID: hQDDsXYGS0SkXWlyy/iKdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="94870532"
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="94870532"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 22:33:33 -0800
X-CSE-ConnectionGUID: EwLKr1QKR2eQ0uOxN/8mKQ==
X-CSE-MsgGUID: /RrHtY39TTyaWyFKhV4zNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,215,1763452800"; 
   d="scan'208";a="203268465"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jan 2026 22:33:32 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veSXS-000000002Hc-28PO
	for oe-kbuild@lists.linux.dev;
	Sat, 10 Jan 2026 06:33:30 +0000
Date: Sat, 10 Jan 2026 07:33:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/090-spi-hid 17/20] checkpatch:
 WARNING:MINMAX: min() should probably be min_t(size_t,
 dockchannel->fifo_size, count)
Message-ID: <202601100758.qAovfjnf-lkp@intel.com>
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
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   4398719b8c5fadb107fd2d4e44637d36a5d5ecc9
commit: c76440711dfdd8ff32f1ee5b7357f738b86fadd2 [17/20] soc: apple: Add DockChannel driver
:::::: branch date: 11 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20260110/202601100758.qAovfjnf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(size_t, dockchannel->fifo_size, count)
#255: FILE: drivers/soc/apple/dockchannel.c:195:
+	size_t threshold = min((size_t)dockchannel->fifo_size, count);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
