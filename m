Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E321626F291
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jan 2026 20:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767559112; cv=none; b=Om17sV08I1Vx/aAUlxlMEVtRYscf2B7z2Dmn1BUJotl9oFbsHT7wXzzyGH1Y6GZlkCmtqDk2gejyYUbaMw7XUzsBFkrS7/KJ3fY2KS5X3Lr+tLcGUrrwS/qAfGMQcvsjUBCX1LzJKq5Pc7k3j3oR75vvE2hmiYzaZAVmKYWAlMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767559112; c=relaxed/simple;
	bh=OyAeDbz3bmj3YnWi5KFxxoSX1fq5UtsC/yRp6NIMxnw=;
	h=Date:From:To:Subject:Message-ID; b=MfSkUhak2fyI4293YftCLp0OH0IKru8rBoTcTwbDo2xq0dPTneKdchQm8WrJsvYDcHaVhREd2IJOo6uQSezEP4AxZrdC34Z8mejqq0kexcMW1tZ4nADV/fiAXfWnD4f2IRPdnWvGZHmUqegnumGYzdF4S6GVteUZafabkPyaAJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2sPF5cq; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2sPF5cq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767559111; x=1799095111;
  h=date:from:to:subject:message-id;
  bh=OyAeDbz3bmj3YnWi5KFxxoSX1fq5UtsC/yRp6NIMxnw=;
  b=C2sPF5cqZ33ol+PFde8s8RODAYl+nZy6lUfTIXVNDiPu21AsmBQR21ec
   dcc57hTlKEMYstJCA78/90dbvKYySi9IZXAKn0tTqJWJtAnyBZtFIvEZr
   IxsbvvTjXf3VPpZUcBYqwl6sV60A6a52Y9iQ93IqYnRxEmvit/MnOoj9w
   YeEMTf7cDyQRnrmPUzM8NvAkanqTWL6VtwsmeWSghnxIQVLtLelMKljq3
   2IVuENM+SFLMLUW1VFX6cmzFPk7Zvymcd5fZ20syLjKtdh1oOtk5y8u9R
   6MnmaYTiXGKofr6wSF4iyxjJ+fzO60YFMo8LEy98p9JMiD51oTRj/rzkU
   w==;
X-CSE-ConnectionGUID: JD7diVOhTYeAfbBWSEioew==
X-CSE-MsgGUID: DgYOh9drS5KtqVhWlHwVdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="72786892"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="72786892"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 12:38:30 -0800
X-CSE-ConnectionGUID: xeXyzx3QQ2mbZSXedJClTQ==
X-CSE-MsgGUID: 1LOEP/DtTN6boepmJh0Mpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="201873407"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 Jan 2026 12:38:29 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcUrr-000000000xD-2Bcx
	for oe-kbuild@lists.linux.dev;
	Sun, 04 Jan 2026 20:38:27 +0000
Date: Sun, 04 Jan 2026 21:38:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arm-platforms:kvm-arm64/feat_idst 9/9] checkpatch:
 ERROR:SPACING: space required before the open parenthesis '('
Message-ID: <202601042141.5ITdJVd5-lkp@intel.com>
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
TO: Marc Zyngier <maz@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/feat_idst
head:   a6f09b67bc3f51507c977effd53be736b8c26a1e
commit: a6f09b67bc3f51507c977effd53be736b8c26a1e [9/9] KVM: arm64: selftests: Add a test for FEAT_IDST
:::::: branch date: 83 minutes ago
:::::: commit date: 83 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260104/202601042141.5ITdJVd5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#64: FILE: tools/testing/selftests/kvm/arm64/idreg-idst.c:31:
+	} while(0)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
