Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEFDD195
	for <oe-kbuild@lists.linux.dev>; Mon, 12 May 2025 02:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747017373; cv=none; b=qJ08pbzzs9Y1HXKU6uteu/TVIyrs7RlX0ERwEeotxFRyym3FjlNzhcnqieHInSr5hr1y0QnpytBvXxxzj4yPy94hjSmbmyX9n8eV7iXv0aGgUz0vCSvtlGV0KF04fNDN6S4TbFPUzX8ZkZuL1O1NEZkaRo45gfP1VWk+13PiY/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747017373; c=relaxed/simple;
	bh=a67gq70Je4HSnjbN1JB6SHXaHLC/Q8UtzbJzn1X8+zc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hct/Ea1zPBoAzBWF1qK7q0VKItZj181aHnasTOH50Ca85SfWPHsYWxsbOqJgLeeBgzga+7zeIjdqAMovXXR/crOfj9Ics+nvOuFtloAQ6Dt2Cxp2SQDR5218uHRjPuPgM8CxOzJt9NH3+XcK/WUl2gHREXm3+pxPPOlcpH0YIkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L6DTfw0U; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L6DTfw0U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747017372; x=1778553372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a67gq70Je4HSnjbN1JB6SHXaHLC/Q8UtzbJzn1X8+zc=;
  b=L6DTfw0Usw6QJeeaOJ5FjKvi0NQrq8e5lSpWcrex6Nz0VSbpvRBMBWJv
   5YrVSA3Wr0hjxk4T2HLoTDyfgAvp6OYzWWNDWJRMMcy50KiRJyaSPoVo4
   Nm/BeoQ7tVXtLtN7u7AsuOqpLpBuZkE2vPrPASI6mjO683Zm/Snkytv7v
   ZV+1BgMet2GsJg6yrz29Lemcdx+x0Flig8TXcRC3yoAzOK6J48tSGWS+2
   Ab4O1dqtD0pMOS6/wrFmgCwZdEen5Lk3Rv1UpGq62Kab9k+szXN6EhD72
   SiIIgW9QkWaE3Qub1olSABDnn9b2LcbawlAlJEWxFiMxkA23kIiRdkW90
   w==;
X-CSE-ConnectionGUID: C2n4pGWJQHqAgzOx2w2pWg==
X-CSE-MsgGUID: QvJ9mEgESNSdn+rQQVkmdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="59461237"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="59461237"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 19:36:09 -0700
X-CSE-ConnectionGUID: JW7uudFzQmm1glEI5r5Yww==
X-CSE-MsgGUID: /3n2lenUT2+ydlMKCd51fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137628010"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 May 2025 19:36:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEJ1T-000E7d-0D;
	Mon, 12 May 2025 02:36:07 +0000
Date: Mon, 12 May 2025 10:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1270/10031] mm/shmem.o: warning: objtool:
 shmem_writeout+0x47c: unreachable instruction
Message-ID: <202505121038.iDUsVwlb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: Christian Brauner <brauner@kernel.org>
CC: Baolin Wang <baolin.wang@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ed61cb3d78d585209ec775933078e268544fe9a4
commit: 7b73c12c6ebf006ad496f0e38a605d92dfe05157 [1270/10031] shmem: Add shmem_writeout()
:::::: branch date: 3 days ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505121038.iDUsVwlb-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505121038.iDUsVwlb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505121038.iDUsVwlb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/loongarch/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:34,
                    from mm/shmem.c:24:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:303:34: warning: missing braces around initializer [-Wmissing-braces]
     303 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:559:16: note: in expansion of macro '__swp_entry_to_pmd'
     559 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
>> mm/shmem.o: warning: objtool: shmem_writeout+0x47c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
