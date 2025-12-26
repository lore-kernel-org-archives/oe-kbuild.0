Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F1353E0B
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 15:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766762248; cv=none; b=mHjmiXBqULbnLsXEpfzsoMLjE9AXzLPkqZKhz2ogfKJcB26P59tBIm7QMmY97SAmuc/UPMDOoi6yzLVPuw2lMch5InPeCFxPajWU8RmrwWv3U8QWRoKjmTsc0FnznSETLW/+I6dL3CNIYjUTMtlik2purAihpS9rkJgt+enZLDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766762248; c=relaxed/simple;
	bh=aTQdZR0YZXVIx3OlYXMDtb7EAAuzf8/WOg9KDv9fsVY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jMoMpcRl0XGmBnXL7N49NdZh/0qxxsXJVWLRhGVU+G+1Szdu0TLIoV2VCm9Syh4rlxxvMpWP3Ss3TNp3SwM6yC2hHA5cZ3fzgWPNl6wFjdy20L4A2Jbl3hpm19wOJRgBw2PB/QiLPscuO0NxZW6whG0mZCbunPkdCFIpZMgWFeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MJSMrgGh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MJSMrgGh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766762247; x=1798298247;
  h=date:from:to:subject:message-id:mime-version;
  bh=aTQdZR0YZXVIx3OlYXMDtb7EAAuzf8/WOg9KDv9fsVY=;
  b=MJSMrgGhIzecgyS3aMw9iVe15HV1zYtDkgxb1ZXfF5czhTIWSOrRCTFT
   lNgDjbMN1YU68IZ6Zwb3QxfxmhIk2+137QmncHvtpnfxz8bahOoJ64+fM
   p20eY4Cm9QOltimb54nAGCgUWtWtTq4/76SBJ+nmVmDPk/dZKyYpAjKMJ
   HPbiLmy4eRHeAWw2L4hXbisbwFRDljvbu2UFDkQ+QQCdM5F6R+UIhjgZ3
   fhejz5Koz/Cbpip1mV+GqpOAWCtx0u9107GtNv12dSUHMS4mnwrBqEgKy
   +eL45fCs0uDY6EX+6v3Z8fkOwEjBB5ez9z01jtuk/KQwXfGhhfRgmcpLQ
   w==;
X-CSE-ConnectionGUID: 6O5tijfiScGPEEWAjul+aQ==
X-CSE-MsgGUID: KKSTUAgcSNaWIyqtlh3yXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68398443"
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="68398443"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 07:17:26 -0800
X-CSE-ConnectionGUID: XsrAIKrOTHuj6K+LojYtVg==
X-CSE-MsgGUID: WObRW4XaT2qXJyEXUVjzpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,178,1763452800"; 
   d="scan'208";a="204901419"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Dec 2025 07:17:26 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ9ZD-000000006uO-1Zy1
	for oe-kbuild@lists.linux.dev;
	Fri, 26 Dec 2025 15:17:23 +0000
Date: Fri, 26 Dec 2025 16:16:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [ieee1394-linux1394:for-linus 1/1] checkpatch: WARNING:BAD_SIGN_OFF:
 Co-developed-by: should not be used to attribute nominal patch author
 'Thomas Fourier <fourier.thomas@gmail.com>'
Message-ID: <202512261601.RImDoDr6-lkp@intel.com>
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
TO: Thomas Fourier <fourier.thomas@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git for-linus
head:   c48c0fd0e19684b6ecdb4108a429e3a4e73f5e21
commit: c48c0fd0e19684b6ecdb4108a429e3a4e73f5e21 [1/1] firewire: nosy: Fix dma_free_coherent() size
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251226/202512261601.RImDoDr6-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Thomas Fourier <fourier.thomas@gmail.com>'
#10: 
Co-developed-by: Thomas Fourier <fourier.thomas@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
