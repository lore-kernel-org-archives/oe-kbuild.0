Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097321;
	b=1X2q9giW2aClyvh6faW8KHQhoWwPc70T40yMrK8fg6E5oR08UfVGU0amPQ5haaHE3vhb
	 jJONgL4RcjYrUOZYmhlbv1L5pKLVayRT7LdXpr+h4ZK/sYerpiT9zKlCxTDyX/oo0ySzd
	 2ERVQNvHktTiIo5PbUs/dRSm3GmIAewi5vgQltG0dnnn3GAdqyMghnRY29+1tWlH+LnF7
	 /f7aWWqzoUb1y/rx0i7gwxkIm5OHPjO2u1vNM7uIhbHN1brv/6O1r/uHFJDOLS7jUrdq2
	 MSBJKzJqnb9epu9JpY2YppAAjyN9mIgGyeCIGhPkqbpAcGD7RKzaCVL+a/ykGHgX5fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097321;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=AxLXM+8P6XwYDSv3fVlphFyxaI5ZZNRO1dtEiFOEvzY=;
	b=cT0Z1UoGu+tXgbOEHiSRp2oqLcf1StxkQEkU3l5prCfN/PafxZ4RHMO3+3Au9L4mitdW
	 oGhWrw28r2IzsSylMofv+PaFCV8XTLJH/9a6s465tNxOb0zJ85DNUEA4IumUTfvucVCev
	 1LNa5E97MlILAeiHhgFqwkXSJjJBVdG/lsHcGbRDea05yZt5+lpNEvSWwSIPWUSCMdwO5
	 V1dyHomqnHsmryRExd+lSSd+mr8cK4mRpz4F09QCv4okkGg59RtF9/E/5wCfYuiGL0H60
	 +BMOpGMYFz5Z38mFvaGz+zb0FqHJlFoRZm0cJxZpy0CI7NST4no7Itp1/kbF+/qHNiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NXjN6Ebq;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81E9606A324
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Nov 2026 14:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E81E9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NXjN6Ebq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795097321; x=1826633321;
  h=date:from:to:cc:subject:message-id;
  bh=PUsOsudoDu6x5wObzKMUxIeQLl9DB2Db5ToT4egYw6c=;
  b=NXjN6EbqWGhPA1YmJow8CfXSA7Fu6LYByxoOq/PTmdneR3Cz4ZuKOSBX
   Kk7OXUC7ypSW2kYxVLlQCIJCisHedd/Q2Bmzciz1fUetAFhV34ZNS7RHU
   DSJZK2CoHxTq8y5fKL+sbVgoLfv6xo/pDIaSwsv11MD8CbhhGxJw58KKg
   RCEiCviqOidBhyxub82dQJv47LQzFbTU+3omNJNX4jnfQz6P8AZuEyQJc
   nCyfHbGSx1qf5IDXur1+HIfv/w5LEuMUANUvZ/zuT0q5/8B+zyPyjuCG4
   FiqDETv6XYuivqTuJQ/AVdnOo3hga0F/5i2VVnhdiV8Dg11mHMKAqwZay
   A==;
X-CSE-ConnectionGUID: 3dz81ZRdSdy/EU3DF+Pozw==
X-CSE-MsgGUID: qOPKpbjIQxCz2SEGqvzn5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3975021"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3975021"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2026 06:04:31 -0800
X-CSE-ConnectionGUID: p1I14UxmRyWowDM6nLjKew==
X-CSE-MsgGUID: 3uBP4benTHqEPu58H1zStA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="10824827"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 19 Nov 2026 06:04:29 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xU2kV-000000003nB-2oiT;
	Thu, 19 Nov 2026 14:04:27 +0000
Date: Thu, 19 Nov 2026 15:04:19 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: security/keys/encrypted-keys/encrypted.o: warning: objtool:
 sg_assign_page+0x1c: unreachable instruction
Message-ID: <20261119145511.j58zQhXv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
commit: 26513781d1b3a1e8b4b576ed62751d604a69b374 mm: cache struct page for empty_zero_page and return it from ZERO_PAGE()
date:   8 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r2302-20261115 (https://download.01.org/0day-ci/archive/20261119/20261119145511.j58zQhXv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261119/20261119145511.j58zQhXv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 26513781d1b3 ("mm: cache struct page for empty_zero_page and return it from ZERO_PAGE()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261119145511.j58zQhXv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> security/keys/encrypted-keys/encrypted.o: warning: objtool: sg_assign_page+0x1c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
