Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CB71400C
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Feb 2026 23:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770938976; cv=none; b=ZgddDAdnhx/T4SZx3Q6OzZ93D05SsgWs6D+Msk9ND9WtwSG1ZrJr/6nn87i2ux+goCIX1H1+Wfqmb14bO8sNhyfam5uI8G04CKdRsLBV6EOuVrTG9/39Ony7GO9TkKxmnLUIRn/Kk+wFyVw07IWeaIh//91UKm5bW74NvcLc6Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770938976; c=relaxed/simple;
	bh=WVOjhoxKj2OBdW5gJxjsdQONM3F7sfoOl0BUgLj3TeA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GmSKykTQEIDtcaPeWfteLuzWRqbWKXe0uVM6F3OqAvE1xKeEj8GPpwDfZcHhXrJZ2eFaDM+8y+yrwhv1oX4X0SXUi140rYwh45eXZGWCeiAV0J4g/CB262pB0a77vitLvTe9nPRMIm/G8VYZGKk4FJw2J9pPyAJ3qzBbOphGJeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g8lwTzzk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g8lwTzzk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770938974; x=1802474974;
  h=date:from:to:cc:subject:message-id;
  bh=WVOjhoxKj2OBdW5gJxjsdQONM3F7sfoOl0BUgLj3TeA=;
  b=g8lwTzzkn9LDF4A/ZD2s5ZQfAjOKMKZGnsx/6mTpIpo17BbJH0K1NWjm
   oLNFfesMezucvUvdFvu66rSdVIGSkOTAFM89bPFSBv8wdnSFKtLA7APEQ
   k2XpE1wG5J/bIi9z2vmmAwdi8RHdmXEWV8V5ExPLSVATJI71ved6CFg/r
   Fc7ZKYan8InvLn0hFHwgxQLGgWvk7aRTOxWXok2Qrupe1i08WVkljEMEU
   iLyUzp1h+8wg4zd6FwTAGwgtfP71wz4MGUVE8NG7IdbWA1zMZbTASZcqX
   E2U8OCjyMxgk+S7fiow/L9PWdSj6rtAHVqohU0eUo1b8eXX8Q8CRW1cNu
   g==;
X-CSE-ConnectionGUID: /q08WzdCQ7ifdl8qGy5m1Q==
X-CSE-MsgGUID: qstvuPYWTWWguPs6CNMhHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71323413"
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="71323413"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 15:29:33 -0800
X-CSE-ConnectionGUID: yP5VoQY6QiuZeeZrztzgIA==
X-CSE-MsgGUID: g3eU43ulQWyHINMGuw/eOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,287,1763452800"; 
   d="scan'208";a="212587500"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 12 Feb 2026 15:29:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqg7m-00000000u3U-0cRH;
	Thu, 12 Feb 2026 23:29:30 +0000
Date: Fri, 13 Feb 2026 07:29:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: arch/sh/kernel/kprobes.c:75 This comment starts
 with '/**', but isn't a kernel-doc comment. Refer to
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202602130759.4tE60uq2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>
CC: linux-doc@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   582a1ef360a05bff4350bbf6e383f61d26b804f0
commit: 292eca3163218f2185a8eabe59f4a576bb9e05f8 docs: kdoc: fix logic to handle unissued warnings
date:   3 weeks ago
:::::: branch date: 50 minutes ago
:::::: commit date: 3 weeks ago
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20260213/202602130759.4tE60uq2-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602130759.4tE60uq2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602130759.4tE60uq2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: arch/sh/kernel/kprobes.c:75 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
    * If an illegal slot instruction exception occurs for an address

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
