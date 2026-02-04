Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47C534FF6E
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Feb 2026 04:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770180127; cv=none; b=Hgy4rDdK25Ayi629Mg3TXZq9M20cl3GKAlvYBgMWnj3tgMNhNMMUIZg0z3hgDtEsFE9u+VhfTcRW/AtfTtlY9GS/jDZc7V2fMkG4O00ZJ3LTY4t1Ulgg9hzcRmpST21dMRV1036UgfFHFzBgB0TWqZbw6vy5JyaH0jseAweRfnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770180127; c=relaxed/simple;
	bh=Nx37cZHFZtOLFe+0zCZTPNk1Hdk6dQ4Pk2936EPqcQ8=;
	h=Date:From:To:Subject:Message-ID; b=HOfbyGBADNPDTDIUUOkvuQ4SGUyOnh8BsTPnd+m8PFqhhGbsNKa2BsBa5WT8bSPhixFr2nnsERES+S2OvgpANgcPseBw5zRCX0VxbRia0t1vt/bIj7/12kMD8u3I4SHQIVQ2Dsj9s89mEY7dO1k1rI8ByY83mq6pEmrzu5L7Fbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eix4E+Lc; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eix4E+Lc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770180122; x=1801716122;
  h=date:from:to:subject:message-id;
  bh=Nx37cZHFZtOLFe+0zCZTPNk1Hdk6dQ4Pk2936EPqcQ8=;
  b=Eix4E+LcNLheT2i4qp7PAjm6UMoj+1nbYy3YvshvuyvkMz/iXEVPVulJ
   4GoeI3/X6bLB0caK84XbdpeZxXSZhkek2vg0uyDCRsohkD4qA5iu1xixR
   w1UHS4ik4D8UNo/JAlkY5CxPRB98o7gsHpEVM1WoJcGAyLMmmWtaoHsqg
   jHoRgOoMkKI0gvyVi6NyUdFtLpQHMxuC32zuFUFA+RWVUM3U8c3qKJJCC
   TQ+LQsUA7N2zdCNVPj839FcKbo/yQ5cwpa3yH1CYZSwSNcuG1HYTqHuTW
   eMbUi/4vff6j7TtQTMoNDYnOZyyA2gZM35zBwpS6T3Qqf2GNGzRKuRCsp
   w==;
X-CSE-ConnectionGUID: qogoegE0SDa1UksAE3J5PQ==
X-CSE-MsgGUID: VqigXdICTIK00TgwMwvcBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71397597"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71397597"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 20:41:59 -0800
X-CSE-ConnectionGUID: d+sHXpfITmCjlKbj5ABv/Q==
X-CSE-MsgGUID: PFPHV+SoT827HbQyOfszdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="247653307"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 03 Feb 2026 20:41:59 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnUiC-000000003aH-0XzE
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Feb 2026 04:41:56 +0000
Date: Wed, 04 Feb 2026 05:41:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [mkp-scsi:for-next 32/33] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'get'
Message-ID: <202602040533.n9AHhOxf-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mkp/scsi.git for-next
head:   1982257570b84dc33753d536dd969fd357a014e9
commit: e17f0d4cc006265dd92129db4bf9da3a2e4a4f66 [32/33] scsi: buslogic: Reduce stack usage
:::::: branch date: 67 minutes ago
:::::: commit date: 69 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260204/202602040533.n9AHhOxf-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'get'
#18: 
   do. Marking this one as noinline means that the stack slots get get

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
