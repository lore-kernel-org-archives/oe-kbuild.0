Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E49B242910
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 06:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782197417; cv=none; b=cgaBNWOZ6gtcToq5i3pQXQ9jIKGnNbmkXxsLOGzTjVXqP/j6FRBCg4huGVQhUTQrK64szpFSQHfvoj9OkFp5sbMeKLF3onZf9V+mJZvciPwrooSJ+vjiBn5Si0EsKULxiR4d8K5+Zhr65iGCc4hEPisbN0KJq0cqS7vsgLDu6Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782197417; c=relaxed/simple;
	bh=xDTSLAORlJuqfW1q9LuWJH8MoUi//DkVZ7MJftKGTAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CJbjN3h56bnskuQg0T5LJ6xUIAcUkSNkLNwXbfg0MiJcS3aCp75IjXYQk1BVNgObstFUiegQzJzFSBD6xxFvISIFrUS0HiqlrXmnAn/3FfzcVhNqHj1tooEmFIjjGgTUXVqyxEDQaTdS7MFOopptmT7Zn9jqJcWVwntTRZGgteE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XP6kS0RQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XP6kS0RQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782197416; x=1813733416;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xDTSLAORlJuqfW1q9LuWJH8MoUi//DkVZ7MJftKGTAY=;
  b=XP6kS0RQUO3qx86EsgPJ7yYiORv5Rydu637P1ND1ZPaXviXedjI+jALU
   ZqOt5aKhdJTdhob+r3pnsCAW5DrdGpfc6w38n7lHEFJ5HQrntpON5xy5A
   cWgfTHL/75bLls72Dr7S0yR8aKAqPxjHzXLbHI5dZ/bAkoBMRwS09n/J+
   hDJLQFxATbUXP7wvqcHtfEKASrtr4lnWvobQvi2g58m7uKLw0XYFskfoH
   FXHN6tdHt4x1eWm8XIleN6g2PJXXtABJ9dXyHYdWCAndEWDPxPvbfB8rN
   z7X0+7FTdqpvDBy5EhqlhgkLD4lxFA6zjOnFfNFabay7lZKZ3WVs4Sohy
   w==;
X-CSE-ConnectionGUID: iF3GbS5AQK+Jmnmmk7Q1aw==
X-CSE-MsgGUID: klJLX1YHTiuiUGjkAc4oUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="83025390"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="83025390"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 23:50:15 -0700
X-CSE-ConnectionGUID: 2Iia8u1JQ/OS31kAIbWxQQ==
X-CSE-MsgGUID: 4YXMhX09TpW+xIh5gME29Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="253774623"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Jun 2026 23:50:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbuxW-000000002Iz-393k;
	Tue, 23 Jun 2026 06:50:11 +0000
Date: Tue, 23 Jun 2026 14:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:korg/b4/vdso-arch-clockmodes 3/5] find:
 'arch/csky/include/generated/uapi/asm': No such file or directory
Message-ID: <202606231422.3scGTzld-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git korg/b4/vdso-arch-clockmodes
head:   7145c58a41a91ecd43150c53b21c4d82f7e024cc
commit: 5418f662ee90802bef3cbeb90df15f0b4c3f7c84 [3/5] find 1
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260623=
/202606231422.3scGTzld-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260623/202606231422.3scGTzld-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606231422.3scGTzld-lkp@intel.com/

All errors (new ones prefixed by >>):

>> find: 'arch/csky/include/generated/uapi/asm': No such file or directory
>> find: 'arch/csky/include/generated/asm': No such file or directory

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
