Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D254A2FFFA4
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 16:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766335327; cv=none; b=bIGehe3pkMPm4lAODgGZKmCKYo80sZcw3pjCLbB35+FwJXnoUQqK3NUJZRlR3V3qGeVu6PiWeTaAkDuX9uK5f0f30buKx3xslYvlWtR5afBOtgY8N/Hy1MMnRKuE5rXuJ2codkCqpzKgMB2ZpVOrVPZVUTJl9IqeWnlZu01QIXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766335327; c=relaxed/simple;
	bh=nz5P+9nixXR2cdozmW1X/BotqjONjdh5ykKThx+2A3s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iNUXuMy6G4YMXIDIFEtoLrSy3n2vElNhDjJ/ClERoGMDWcdevJ+IOcCr8Oo5EcP+UynAX07aBOIOte8k9+HOcWPh2iaWF4SHTGgbcDyK9cam4v1sPDxOfDaAN/BBbTbdkrCSpuFDfj6AWivt4pFrIT6fFhirMo2hqlUNt1+FHSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aBoOohfq; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aBoOohfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766335326; x=1797871326;
  h=date:from:to:subject:message-id:mime-version;
  bh=nz5P+9nixXR2cdozmW1X/BotqjONjdh5ykKThx+2A3s=;
  b=aBoOohfq5dz4syY5wpdtKdpAnMfGFNlETaIbSkfN/l8Figdq9pnUHOaF
   SXFKKIrT0HQB8pquPDB2b/39H/rRUmBF+xR0BBLx6jkM1qpquWLbwZFUr
   cwRtPPUcj2wgZLJ5xzKPoeKn31mlRq/geCMBcG3c0aH2T2p3frRUOGAdH
   5K+VrZmGKeqrUTMB4EXuvnGKXXGihuxmT+S8v4RkjJGeJzRsy5b9KM72R
   dB9F3TgID96tcNYwBazadurmpesWbvObAi1+NTyYKyCtbD9VIJExbJaW+
   HLf28UkgYZi827ZPBYtJH18GK6QOFZJWQc2/vPHs1IhzoyZ9e5jRPFXKd
   A==;
X-CSE-ConnectionGUID: AH5/XX3nQk2R09atnYYjWg==
X-CSE-MsgGUID: lMk4QajTRsq7QamYVMsWPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68290431"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68290431"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 08:42:05 -0800
X-CSE-ConnectionGUID: 4uYC3iZBTfyRzWwNs5ODhQ==
X-CSE-MsgGUID: xU7fM8IcSqGjm/QeNV0FZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199234857"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2025 08:42:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXMVO-000000005Al-3BBf
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 16:42:02 +0000
Date: Sun, 21 Dec 2025 17:41:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal-linus-next:linus-next 19/19] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'claude-opus-4-5-20251101'
Message-ID: <202512211716.cktz0zRT-lkp@intel.com>
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
head:   f066ae6e6f9737c650c82a8b1ea221b5a0dd903b
commit: f066ae6e6f9737c650c82a8b1ea221b5a0dd903b [19/19] fuse: fix iomap_folio_state uptodate mismatch on full folio writes
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211716.cktz0zRT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'claude-opus-4-5-20251101'
#41: 
Assisted-by: claude-opus-4-5-20251101

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
