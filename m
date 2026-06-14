Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C56A31D366
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Jun 2026 06:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781418388; cv=none; b=ntxDj7V21mCZMw32TQJS8NXUzAgy3DnR1ZP3accqnoif1hkgfuFsdRI/GON1F/iiY34lIQ+ZrbcpItU52YaB2+CGBy1mbRhNVI2C9sTRJgMB7fIX5MwjR5DqG3SfS8m203CGRnnwKd8ll2X0qVlDel7JpetiLozIGRC3ZiPslvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781418388; c=relaxed/simple;
	bh=M/8sQM1XtMKA6yMCTZZaXGEdgEC3VFpR3XRevnSxPqo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Swagz4vPdyxNCOS5svq9Vnb5DRhY6PA0UoSDs2Skikc+9Poa1cv2bI5/bg72HllqxD2sKYpZXoS3xfpoQovXkpOEXWoljRVMXyhBfZ1usEkYK5qePKTRHFp+Pw67g9Ysa5uwAYW94yP5k+NHcecXLH48N5mcWbTxHzq2HJEh8cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MTEOUBHV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MTEOUBHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781418386; x=1812954386;
  h=date:from:to:cc:subject:message-id;
  bh=M/8sQM1XtMKA6yMCTZZaXGEdgEC3VFpR3XRevnSxPqo=;
  b=MTEOUBHVEVuGCh2BCxcj1fP9PiAPndx+yzF3lKV3yXhbRdF2t+pWAA4f
   zB0ruAvgpE80+pYa/bL/6VLIM4DtX7nTnuxehdaCtpIa8YQ0FUFjpzvut
   PGW8b5IAzDo5L9OiQgiyUi3uy4siTkZqWYjxbP+F6Lg0Lu7dRUyVfVTQK
   j10Xhkxt8R4oI5/ZXMUc87WoQh0oBxz1nByHLnyVfRhoCGKYEJJuR/fvO
   bWNnZ4zrRlTbmAmVHmUzOYd61bYY59gfXkPAAO5mBWSMW7dpIx1gpEMUV
   REYNJKsp09ARPqB31mAnT9Jxn/pMF8ppKyFxv0aibcqu7L5gPlRTOpZX8
   Q==;
X-CSE-ConnectionGUID: hykUkq1/QzCTI5kqylc8dA==
X-CSE-MsgGUID: VXFXFW6QTC2cXAsOXd1GvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="92514227"
X-IronPort-AV: E=Sophos;i="6.24,204,1774335600"; 
   d="scan'208";a="92514227"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 23:26:26 -0700
X-CSE-ConnectionGUID: 2deqb5GDQJuBeW/v1VN/iA==
X-CSE-MsgGUID: QWLgTwt7QgOFwYd8caF8ug==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2026 23:26:25 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYeIZ-00000000Qd4-0K7h;
	Sun, 14 Jun 2026 06:26:23 +0000
Date: Sun, 14 Jun 2026 14:25:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7969/13763] {standard input}:19653:
 Error: branch out of range
Message-ID: <202606141449.KQ7xiSro-lkp@intel.com>
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
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Peter Oberparleiter <oberpar@linux.ibm.com>

Hi Konstantin,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c425609d6ac4012c8bbf01ec2e10e801b1923a7b
commit: 56cb9b7d96b28a1173a510ab25354b6599ad3a33 [7969/13763] gcov: use atomic counter updates to fix concurrent access crashes
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: mips-allmodconfig (https://download.01.org/0day-ci/archive/20260614/202606141449.KQ7xiSro-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260614/202606141449.KQ7xiSro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606141449.KQ7xiSro-lkp@intel.com/

All errors (new ones prefixed by >>):

   Assembler messages:
>> {standard input}:19653: Error: branch out of range

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
