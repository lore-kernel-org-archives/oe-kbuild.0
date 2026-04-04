Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA041F03D2
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Apr 2026 11:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775302557; cv=none; b=X4ehftkz5TtqC4YsCEH6TeckcesHjnIGLikg2vfWIG+ieXlzIY0f1tIEaiZJbGyInWp6/YEYjdAoViLBbIjGCultMhovojxI/Phtdvp5jtwfU6fQQoFyl32OQk1FPChrJ78TVIM5b/D5TJbY9K1EMSNtDe75XeW7ChtGTdS5Sj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775302557; c=relaxed/simple;
	bh=XZn33is3YoaadIZEaTL0w06jhaNTpRTr97KQq87eoyE=;
	h=Date:From:To:Subject:Message-ID; b=K/XkVXFwu7CmXigQ3ZVE3j5h5L5gnVG3GUUjhQ9g7XhFBN+rjUBdtQlfKGrakm3wurMPCwzQp8of6mMkXU5wDYs4Ko+42mUw5/+sw+H+JsDoyqK4RpfFAO8ibWwFjZmg86pE4qbdLA27MtU0fdgfqMi5kGMw4MhWr3e/AMM8EaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gOnIT8mB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gOnIT8mB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775302555; x=1806838555;
  h=date:from:to:subject:message-id;
  bh=XZn33is3YoaadIZEaTL0w06jhaNTpRTr97KQq87eoyE=;
  b=gOnIT8mBncAgSeAJnbKNHW2KsWSDYWPoEpfUQOx9EmC+fFD7xHfeWAtU
   wLeFT98+y7a5ex/grP6xY5+bOV2CPm72qzI/fz4judJpaOcUPWu+aE1UQ
   RkN59uP1pWUarRd4fql1FC44EbJKB00m2JunyS8nt4RapKYLIdCMQkKFE
   NsIiI+qGG+SSMc0bcff0MISGY6QoswWMTChMxRNHF5fcuuWuH3sg/6Vhd
   jk7Vil2sWp1zK8XELXO8e8u04ejYk24/Afe8prcAhUXnS/jfG4ZZGkiFJ
   7DMdiRiYhcqidx+02dMgqDZkXfzOIxT6NJyhwS0828/sMvIB7ZcTO1/Hy
   A==;
X-CSE-ConnectionGUID: qFDQVfxlShuzsTB0oADXIA==
X-CSE-MsgGUID: KCwwTGG0TO6Lksevcz5LRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76233140"
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="76233140"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2026 04:35:55 -0700
X-CSE-ConnectionGUID: dlQnOoTBSCWp2fuuhHx1Cw==
X-CSE-MsgGUID: a9taSKNNTc2jag2ndf19Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="231500160"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Apr 2026 04:35:54 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8zI8-000000009aT-066E
	for oe-kbuild@lists.linux.dev;
	Sat, 04 Apr 2026 11:35:52 +0000
Date: Sat, 04 Apr 2026 13:35:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bp:timers 1/1] checkpatch: WARNING:MINMAX: min() should
 probably be min_t(int64_t, delta, dev->max_delta_ns)
Message-ID: <202604041322.xOxRTTUt-lkp@intel.com>
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
TO: "Borislav Petkov (AMD)" <bp@alien8.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bp/bp.git timers
head:   032a77941147600009e84ed7b4eeeaf64a241f39
commit: 032a77941147600009e84ed7b4eeeaf64a241f39 [1/1] WIP
:::::: branch date: 21 minutes ago
:::::: commit date: 21 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260404/202604041322.xOxRTTUt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(int64_t, delta, dev->max_delta_ns)
#111: FILE: kernel/time/clockevents.c:334:
+		delta = min(delta, (int64_t) dev->max_delta_ns);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
