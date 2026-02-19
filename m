Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209B3253359
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Feb 2026 22:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771540726; cv=none; b=IJhDlnHC5TJL088qifTimZGG0RLZInEyVCTOg++QQ+B5MVtzKTfU8LqgnWbb9y0l/JBSMdnJFczOGN1TVrjRo/VhbCdeIp5Fxme/KjIIBJ7//WXsTcnEQg1ZAKNmyBNrqx5VLO4ZUqFL0Sj6UwNkCB20hHpCAjb+rWLPASF/IVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771540726; c=relaxed/simple;
	bh=/CpQmLLkkisNqHi3eZSyqx29DxcwADuh0lFK+ieyfz0=;
	h=Date:From:To:Subject:Message-ID; b=DHx5oyPaHpHYTnYiQxkNtYYGgcTfDIP3tAMNntdfMAf3+h2xHqJhQp/b/LfVP7pdAD7pN1C476HHz7PDt9HojvOSGkU0SygsFNmNdRFoNuKViX5YS5NeZ6VZDO3dRizp7XB/sY+t1XRA8ElJl3IYztiYl2pnjh0XJBvSU3JY8QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Of5fp2RW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Of5fp2RW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771540725; x=1803076725;
  h=date:from:to:subject:message-id;
  bh=/CpQmLLkkisNqHi3eZSyqx29DxcwADuh0lFK+ieyfz0=;
  b=Of5fp2RWixc6+jDbieIlbLCb1mTeM7raPu1NoTyizb3vZYjfAexjdrK5
   DUz8w+Li+uUX4poDPxFkiNkUr/09vUm/sDJNEkWrPlbBrQZfBaIwdMUSO
   RGfQSFG2THAUbPpodPqwLvvKjrTYjhV5Z2U5RU3bZMhzLk05IqOzTLCtd
   FDt1xphIi1H954hJNw7veTKkRYSYz53n70QX1E8yHa7tnErXsjFv6Fr9L
   6RZ4EPW0kqrXYhU5/rBdaybIT15N49x9Zzb00MALyUf3HrDfzyjsjAflj
   5OYPVsHv9cCvivHNTbmlbnVLn+Utpqc/EZxo0WllgPbewimSQhVTWpGM7
   w==;
X-CSE-ConnectionGUID: e0TUVlxrT5yUuLLOWa6Ssg==
X-CSE-MsgGUID: uhLgUd3dTrKzQhRjDIvWvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="76503295"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="76503295"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 14:38:45 -0800
X-CSE-ConnectionGUID: ClsZwZX0R/y+Avto7mb1/A==
X-CSE-MsgGUID: BKxCeSMrR92WYGNJVqvsWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="237657365"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 Feb 2026 14:38:43 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtCfR-0000000044U-3SDd
	for oe-kbuild@lists.linux.dev;
	Thu, 19 Feb 2026 22:38:41 +0000
Date: Thu, 19 Feb 2026 23:38:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 38/42] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner
 <tglx@kernel.org'
Message-ID: <202602192326.dhSMbCVC-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   999dcca32838c24ad84b897eff67f18554b21aa2
commit: cc0169c1be1213529867578f552fcfa6acc025b8 [38/42] rbtree: Provide rbtree with links
:::::: branch date: 27 minutes ago
:::::: commit date: 27 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260219/202602192326.dhSMbCVC-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner <tglx@kernel.org'
#31: 
Signed-off-by: Thomas Gleixner <tglx@kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
