Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B0D41C62
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Feb 2026 01:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771293222; cv=none; b=QtSda2DfhVVXEGHMJ8zAr4z+txFtfFqpuNb7aoZ39vvW7kKMpuKvydrLlA7DiDoo8aec6l7i1SlWvH6byBdAulVpGX9UyX5TrGd3an2MAW7t1v6ZiJTWL71HHjfL4f2yXwBec6Dw51wwO2rPP1niOra2FwpcoVcS4jhtS0O+n9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771293222; c=relaxed/simple;
	bh=70QLiwAd7GA3OPMxir+OKCovBCe5FgSAWuDfdv1RnKM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GQy5j8SN8IY5DasOhIczDkgTbFs8OSiddfo+BkGTZUHIxjJveXxoRyXXnERZFOrmj5u8enaG88BrLD1YCbhOeN3f1T83VryQMHgl2AyQtfKS7YASWnLObc5RnWSyBkKOJ5AVkKSwsE6Pt/kQTnQtzslJJXmjg9fZ1B988kILvT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CExEVdQi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CExEVdQi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771293222; x=1802829222;
  h=date:from:to:subject:message-id:mime-version;
  bh=70QLiwAd7GA3OPMxir+OKCovBCe5FgSAWuDfdv1RnKM=;
  b=CExEVdQiJ0V2hQgUK/XIR4/Y541nfdxp3n+WR2wJb8voCwF0d78zAFY7
   yxUC28ilrdk+l5Qpc+Cfuf8eF9CZWldP4qoRe4jGLQrDzbfw9PYzmvgh8
   0kRoUM97gK+TJ6RyrIMvVbMeqTEVfYrWH+Im42ZvYI4cG6ml1SFv7VAsS
   gvy1tMyTxeGTNgLMkCJSenksZ8QL2AO/EfwcaDtOOA2/T60V5Rem6jc95
   SGJiYdYAn2PEVy+F5waGZST/LzWHAoG+O8oon16yQYKg3jSlEvKg09oFt
   rF0i9otzr8WcfGRKOyHDrq1wwj/PF3rm0xevXu/KsZZ94XwON/+cIssss
   Q==;
X-CSE-ConnectionGUID: ApE3E2L3S0WB/NUyqC8Pbg==
X-CSE-MsgGUID: vuAGluBxRUKQm3KDdT4mJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="59932873"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="59932873"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 17:53:41 -0800
X-CSE-ConnectionGUID: eTyGR8VgROqZrFSY8DMsqA==
X-CSE-MsgGUID: dI/tEL/NS9CXFDApM3SCSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="213759774"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 16 Feb 2026 17:53:40 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsAHQ-000000002iB-35Hd
	for oe-kbuild@lists.linux.dev;
	Tue, 17 Feb 2026 01:53:36 +0000
Date: Tue, 17 Feb 2026 02:53:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH bpf-next 1/2] selftests/bpf: fix flaky build_id test
Message-ID: <202602170256.17LGdu5s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <885ba23ec2bb641329efdd179a12bca14818384a.1771267122.git.grbell@redhat.com>
References: <885ba23ec2bb641329efdd179a12bca14818384a.1771267122.git.grbell@redhat.com>
TO: Gregory Bell <grbell@redhat.com>
TO: bpf@vger.kernel.org

Hi Gregory,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Bell/selftests-bpf-fix-flaky-build_id-test/20260217-031831
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/885ba23ec2bb641329efdd179a12bca14818384a.1771267122.git.grbell%40redhat.com
patch subject: [PATCH bpf-next 1/2] selftests/bpf: fix flaky build_id test
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260217/202602170256.17LGdu5s-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#41: FILE: tools/testing/selftests/bpf/uprobe_multi.c:114:
+	if (!build_id_resident){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
