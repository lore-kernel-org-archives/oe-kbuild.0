Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768E039DBDB
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Apr 2026 23:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776381765; cv=none; b=AUV7fQyQMz/IOGrLvX8gKZDaK4SWFD4aRZ+FyTHuCiEZmdj7kkAnvCStDYJRYfIj1e0IJvd7n/Va+FENtJ+TlhdRhWp0SHAvTLzgjPBOdmjV+iPMekDL0O7pMCm9pzWp4wf8qNPF06jaa8k+MNqJe/Hc0wrhl39rGH4EhSwGTVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776381765; c=relaxed/simple;
	bh=0HqD6lvd+frR8nRSoDl+IyEB+Ly/yw8GuwsAE9d/qLQ=;
	h=Date:From:To:Subject:Message-ID; b=YnziCXUstjEksLzWl0bxsp6pJjtoqUcZ7IzPfEQW+O3LV5OlgeECfN+everiMxs0dhywfYstXxs8DFJRc1VcQKjvx64aTRExgvXOR5zYHVWUV5SMUEgMyVo4CRh5OnplGC6UF1VsYcc0zoSumYdzg3r541UGIDUHQ1cNlhrgIxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HOwvr459; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HOwvr459"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776381764; x=1807917764;
  h=date:from:to:subject:message-id;
  bh=0HqD6lvd+frR8nRSoDl+IyEB+Ly/yw8GuwsAE9d/qLQ=;
  b=HOwvr459nX0Wv9Mc85KojTfTjBIXyC6BqMlJzItIgRawz1HaDtKtSLYV
   rEizmiWtOLoBcEIsRylNqMFyivl8Ec2oYMAfT1W2RpzIzeuBE4Fa+pr3y
   hlPWEkTGO3RsWWtC5xfaDQ2ub2BUr8kYrj7NHpa6LTI/g8xAqKy+sDAOh
   Mgjl58+K/cCo1haHe304aM+xI8q77N13PDu5bp0qFONp6QFwCG8sUKh6W
   bYv3cLUlcBFF+3bfShPJfQ/0m7LnYkBW9n5OTvA9slSxyaKCtuxHkUHLx
   YywYWePZAii8Pelm1PUhDRlKd9fWlVU2VFki3jgmuDnKoTyJoeYAhosd+
   Q==;
X-CSE-ConnectionGUID: MorruGWhTZupd+eJG3bHHw==
X-CSE-MsgGUID: AaEX02wqQqWFCLARrqsC6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77408652"
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="77408652"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 16:22:44 -0700
X-CSE-ConnectionGUID: uyappQGUTvCnf5rgH0Bw6Q==
X-CSE-MsgGUID: xVS3CR9CSVeJa9UdeobfdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,183,1770624000"; 
   d="scan'208";a="230799269"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 16 Apr 2026 16:22:43 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDW2j-0000000018j-1Psr
	for oe-kbuild@lists.linux.dev;
	Thu, 16 Apr 2026 23:22:41 +0000
Date: Fri, 17 Apr 2026 01:21:44 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [kvms390:sae-part1 4/27] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202604170128.01CfV10E-lkp@intel.com>
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
TO: Steffen Eiden <seiden@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git sae-part1
head:   c8ef958593be02ec09131a1f5e2744a98b6c01a1
commit: 20bb0172aa62c38d868d0e61f3bb57d225697efa [4/27] arm64: Provide arm64 UAPI for other host architectures
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260417/202604170128.01CfV10E-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1476: FILE: include/uapi/linux/kvm-generic.h:1299:
+/* Available with KVM_CAP_TSC_CONTROL for a vCPU, or with
+*  KVM_CAP_VM_TSC_CONTROL to set defaults for a VM */

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
