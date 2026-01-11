Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626451552FD
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Jan 2026 03:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768101523; cv=none; b=tvjNJ1at2RPB1ncn7Fn4zIgY3P4ASjSa2LLuCAa5BQV51ewOkxWFUN3xaReblp7WqQW0qXPFrXEQcTkn+2C++kjQ3FxAmOSBNxahlvChgHffOMZejGit3aX/gtmEwmfk0WZtDIzzic62H9/UgRi+7EqqjFxjyjUEa9bUjlInic8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768101523; c=relaxed/simple;
	bh=U8fbpqEdeM6w7gAx53Fcn5RO3/X8UX8yomLxWqMd6/Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fJFMy2DbRQomwXwEDL96QAHmE8d8BfcN3Iqnh/7x8w0y5wi9xSvhQPsFcPbLH50F5Rqf5I9BKrCUAmGcp+rhFVARvE+eQV2RK6+2gaGu2X/3ibZfI8dzXKeqcL18UG7AVXd+SCALJ5z2yZ6fZEL3WfT1VqEb5VYZ97ZGICuRglI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XV5o8hTK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XV5o8hTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768101522; x=1799637522;
  h=date:from:to:cc:subject:message-id;
  bh=U8fbpqEdeM6w7gAx53Fcn5RO3/X8UX8yomLxWqMd6/Y=;
  b=XV5o8hTKyVmaYyE+BKSJCghkWnpSkkTUvjyBKm+BkqgPr2dOl3BQX6lw
   wbitYX6pIYgrHk7ProsZmp1bEB4TsVX5Ii7i+5coO6POE1nnxebH809zd
   WAuzdlhvMo24nxqKkjmf/dvcLiAupSUOY8kq4vuAizzVEOxV7Cb0cbIJ2
   Avr04yAGB/UQww6mQE4jUUZ5/Yx2AouHdi07AmpDbzao1Tqvg4vRxOqvv
   8eclCMcqA1Gn1+s3dL5W624qODFQT6vB9okc6j/4aWTMpG1KY6sWKpU6o
   SWib+O7gHi3N5ukWHfSLAIullll5PlCb6YcbTYDUb8eLPFjJVgVeymF7v
   Q==;
X-CSE-ConnectionGUID: OrZn/XjNRGua9NUlE+iU0w==
X-CSE-MsgGUID: pdHfmcQNR+qifaoh6zkr/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11667"; a="80791669"
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="80791669"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2026 19:18:41 -0800
X-CSE-ConnectionGUID: 6NPva31/TpCvMt7UU3KmwQ==
X-CSE-MsgGUID: MEpyzqmTTBOwQ2OKIoKAFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,217,1763452800"; 
   d="scan'208";a="241302599"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Jan 2026 19:18:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1velyP-000000009WS-2qqn;
	Sun, 11 Jan 2026 03:18:37 +0000
Date: Sun, 11 Jan 2026 11:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/gup.o: warning: objtool: __get_user_pages+0x340:
 unreachable instruction
Message-ID: <202601111141.raJppYfV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   97313d6113ab4362ad15076f65560e65288fbcb8
commit: 624bde3465f660e54a7cd4c1efc3e536349fead5 loongarch: Use ASM_REACHABLE
date:   1 year, 1 month ago
:::::: branch date: 10 hours ago
:::::: commit date: 1 year, 1 month ago
config: loongarch-randconfig-r053-20260108 (https://download.01.org/0day-ci/archive/20260111/202601111141.raJppYfV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260111/202601111141.raJppYfV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601111141.raJppYfV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/gup.o: warning: objtool: __get_user_pages+0x340: unreachable instruction
   mm/gup.o: warning: objtool: get_user_pages_remote+0x178: unreachable instruction
   mm/gup.o: warning: objtool: get_user_pages+0x14c: unreachable instruction
   mm/gup.o: warning: objtool: get_user_pages_unlocked+0x14c: unreachable instruction
   mm/gup.o: warning: objtool: __gup_longterm_locked+0x12c: unreachable instruction
   mm/gup.o: warning: objtool: faultin_page_range+0x120: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
