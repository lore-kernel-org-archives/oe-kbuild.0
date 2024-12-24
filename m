Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A59A21106
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Dec 2024 04:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735013186; cv=none; b=pDrx5Utn/yn4Bb2JXwaCFy5bo54OvpulwH05r/HbRnwY+AXRKN/nCb0913bjbgOpAw8GXIrQH0Y6g3vXe2eekH4NRiIJQT4pACEy6+q2CH6JnYrYthtaxnIMbWQ0kuf2OIhwm5Wd+DI2HkAsOFey/1TyJMqz1jgbteCMqh/l3Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735013186; c=relaxed/simple;
	bh=HuZrgevXitkBHNXA6EbXGD/AlXj83N6Op4emmrVLS2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ESAcg0AWx42WnTgkcbIn+JGG2z+dALe4qfeWUIh0bvqxlk96TI6BEukC2q4bOsQvmvfJxeacxqNFys/xlvfedzWyC3FfosaUTIcAuGoaSrOG7AeU6sVuN8vvRNGilpBqdixbir0WwO/BjqPIuuKupT7HMmekLTjzHMNai5TexIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U5Q6sm/p; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U5Q6sm/p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735013185; x=1766549185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HuZrgevXitkBHNXA6EbXGD/AlXj83N6Op4emmrVLS2Y=;
  b=U5Q6sm/pGbxvwFylwxiFb47LwPIaJ47z4r8qGdbvNrzRikEUCmHnerqr
   sDk2gXGXtB4S0bsk4jw6ydoqEc8jKOLCheL/dDfFdB4DYwGrj627IwTtC
   vLnYKzjRMpjsQfssgGxAA4cFVX+R6BMuFOSVNhj8aIt5A4lrcJSJvianD
   T5xAvB29KFayIO6Ccg/BKq3lBv057+QRaksBvP28D98t3dWKb58uOv/Hz
   fYouDYMma9S9SqvQl5/Z43rREi7vMxIhy5Vxe16THQ9f9lTwYf7t1QR+i
   8obYp3Y0MLmvGlp0xKS1/dmbTJ9dFNWruEdsx9janL/aVYcU2vkfnfYNy
   g==;
X-CSE-ConnectionGUID: wp3zzohwTymg8pHG/Ob10w==
X-CSE-MsgGUID: hQSCi+MoQ9yRObsEFHFFcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="35640357"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; 
   d="scan'208";a="35640357"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 20:06:25 -0800
X-CSE-ConnectionGUID: RGW/NlqMQjK6UzywOGWxtA==
X-CSE-MsgGUID: oX0PCEEKS/Gbfh6oHxXMLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99857729"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Dec 2024 20:06:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPwBZ-0000o6-0n;
	Tue, 24 Dec 2024 04:06:21 +0000
Date: Tue, 24 Dec 2024 12:05:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: internal error: arch/alpha/kernel/core_marvel.c:815 SQL error #2:
 near "and": syntax error
Message-ID: <202412241210.y7zYxtwV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f07044dd0df0c9d0ad177c3098b62ccddb735a2d
commit: a4184174be36369c3af8d937e165f28a43ef1e02 alpha: drop pre-EV56 support
date:   8 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 8 months ago
config: alpha-randconfig-r073-20241224 (https://download.01.org/0day-ci/archive/20241224/202412241210.y7zYxtwV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412241210.y7zYxtwV-lkp@intel.com/

New smatch warnings:
internal error: arch/alpha/kernel/core_marvel.c:815 SQL error #2: near "and": syntax error
internal error: arch/alpha/kernel/core_marvel.c:815 SQL: 'select * from return_states where  and type = 1044 and parameter = -1 and key = '$' limit 1;'

Old smatch warnings:
arch/alpha/kernel/core_marvel.c:614 marvel_pci_tbi() warn: statement has no effect 8

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
