Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63286156F45
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Dec 2024 08:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733214129; cv=none; b=N9HkxFQrxdRVM7bM9uDbjqy7UAK5Sr4FeqFUcFg9cq2T6+aVuyABIStul9msg21Cvb3IHTVrJZ8FMlDmYtYwP1f2dTlJ9FMdEVXktBMbxa6yVKW2a0xBbGLU45o862KoDxnVaO+hjIpsvFbC9qp+5Z54hp5b/0c97TGZOUQ39mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733214129; c=relaxed/simple;
	bh=XKPKAfzQPJr1VhyiYh5OxnjyUuQnhbwKqx1OJVT8KmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YFuBUAwrCBD1BEgVv2hSsmtSDKd9wDLHgrKC99AweAdYrenoxUIDsewyYzPUXL0/4TK91ClVVDl6fjolrLZ0ghOawxF8MA+tIsajOxQsvHJVXnZkt+mMxlX8hNVOqSen0Lm2VxGX4bEoBlcL5xjnOQjwdN4/mWX2iMfCp7NXKN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MldO5OO8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MldO5OO8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733214128; x=1764750128;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XKPKAfzQPJr1VhyiYh5OxnjyUuQnhbwKqx1OJVT8KmE=;
  b=MldO5OO8yT6JLkLr/ResABlDPA85w4XaSWTwJpbrdJgJYcgQASwtTy5P
   xolpKvGM4Faf+ISY80SAuB9nov4BGKQcR32lJbNC/Xzcil4nFdQSeqYIx
   PmYpdeQZtOI3iGqm7rU51auS4AMX7i6dxh5mQYL9tW8MfK68iN1jMqf1Q
   OZeOw5xtXMu9MwxyVNP1DX1QbOPUlzc9lTVNSWm/zoeygrXL62DtGLpEE
   iLQLVcx44ZpiRX5D7Fim1SlK+nlaGhPBduPxpRe6Pb+TjpDYsuZ2mEKKh
   BLaQEgivtxMFqDwtd43b1Anh9XG4XoPEASr+H6Jso+9yi91ak9+QbbCT0
   A==;
X-CSE-ConnectionGUID: Hy+UsFGvTgmqo4dhFy3YCQ==
X-CSE-MsgGUID: nU5929OnT8+DDgqjkVlq+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="44797825"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="44797825"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2024 00:22:07 -0800
X-CSE-ConnectionGUID: fvUK8nOoTOSqnQ6v3X/mmg==
X-CSE-MsgGUID: YGe4nAf6S7acfI0mtwd5SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="97796156"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Dec 2024 00:22:05 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIOAV-0000Ma-0Q;
	Tue, 03 Dec 2024 08:22:03 +0000
Date: Tue, 3 Dec 2024 16:21:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/alpha/kernel/termios.c:27 user_termio_to_kernel_termios() warn:
 potential spectre issue 'termios->c_cc' [w]
Message-ID: <202412031644.YUAzioy8-lkp@intel.com>
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
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cdd30ebb1b9f36159d66f088b61aee264e649d7a
commit: 1d5d66825610bb7be23e2229731261c8e99eaa28 termios: uninline conversion helpers
date:   2 years, 3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 2 years, 3 months ago
config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241203/202412031644.YUAzioy8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412031644.YUAzioy8-lkp@intel.com/

smatch warnings:
arch/alpha/kernel/termios.c:27 user_termio_to_kernel_termios() warn: potential spectre issue 'termios->c_cc' [w]

vim +27 arch/alpha/kernel/termios.c

1d5d66825610bb7 Al Viro 2022-08-20   4  
1d5d66825610bb7 Al Viro 2022-08-20   5  int user_termio_to_kernel_termios(struct ktermios *termios,
1d5d66825610bb7 Al Viro 2022-08-20   6  						struct termio __user *termio)
1d5d66825610bb7 Al Viro 2022-08-20   7  {
1d5d66825610bb7 Al Viro 2022-08-20   8  	struct termio v;
1d5d66825610bb7 Al Viro 2022-08-20   9  	bool canon;
1d5d66825610bb7 Al Viro 2022-08-20  10  
1d5d66825610bb7 Al Viro 2022-08-20  11  	if (copy_from_user(&v, termio, sizeof(struct termio)))
1d5d66825610bb7 Al Viro 2022-08-20  12  		return -EFAULT;
1d5d66825610bb7 Al Viro 2022-08-20  13  
1d5d66825610bb7 Al Viro 2022-08-20  14  	termios->c_iflag = (0xffff0000 & termios->c_iflag) | v.c_iflag;
1d5d66825610bb7 Al Viro 2022-08-20  15  	termios->c_oflag = (0xffff0000 & termios->c_oflag) | v.c_oflag;
1d5d66825610bb7 Al Viro 2022-08-20  16  	termios->c_cflag = (0xffff0000 & termios->c_cflag) | v.c_cflag;
1d5d66825610bb7 Al Viro 2022-08-20  17  	termios->c_lflag = (0xffff0000 & termios->c_lflag) | v.c_lflag;
1d5d66825610bb7 Al Viro 2022-08-20  18  	termios->c_line = (0xffff0000 & termios->c_lflag) | v.c_line;
1d5d66825610bb7 Al Viro 2022-08-20  19  
1d5d66825610bb7 Al Viro 2022-08-20  20  	canon = v.c_lflag & ICANON;
1d5d66825610bb7 Al Viro 2022-08-20  21  	termios->c_cc[VINTR]  = v.c_cc[_VINTR];
1d5d66825610bb7 Al Viro 2022-08-20  22  	termios->c_cc[VQUIT]  = v.c_cc[_VQUIT];
1d5d66825610bb7 Al Viro 2022-08-20  23  	termios->c_cc[VERASE] = v.c_cc[_VERASE];
1d5d66825610bb7 Al Viro 2022-08-20  24  	termios->c_cc[VKILL]  = v.c_cc[_VKILL];
1d5d66825610bb7 Al Viro 2022-08-20  25  	termios->c_cc[VEOL2]  = v.c_cc[_VEOL2];
1d5d66825610bb7 Al Viro 2022-08-20  26  	termios->c_cc[VSWTC]  = v.c_cc[_VSWTC];
1d5d66825610bb7 Al Viro 2022-08-20 @27  	termios->c_cc[canon ? VEOF : VMIN]  = v.c_cc[_VEOF];
1d5d66825610bb7 Al Viro 2022-08-20  28  	termios->c_cc[canon ? VEOL : VTIME] = v.c_cc[_VEOL];
1d5d66825610bb7 Al Viro 2022-08-20  29  
1d5d66825610bb7 Al Viro 2022-08-20  30  	return 0;
1d5d66825610bb7 Al Viro 2022-08-20  31  }
1d5d66825610bb7 Al Viro 2022-08-20  32  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
