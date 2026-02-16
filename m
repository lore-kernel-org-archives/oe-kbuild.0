Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2542EC54D
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 20:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771275396; cv=none; b=L0Kn8A7i2Xi0eyP0dLLHRiS8OUAUvf4YxRo6kJANdH/9wZD1mHNKuB8UBzimkLXgsGbsSRiQlNhMFPrZKC5RCWXvWaiJpnUnk56m1ZIqUKJFX5id7OELahBF0cfbg5FMojBaZMfylQOgkcWOepbLxP6HDH8s9vjEzep+kPKgG/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771275396; c=relaxed/simple;
	bh=qh7G1T/rIQmSWTukufTEp/RQVQV13xpu/7Wo+Lcqz48=;
	h=Date:From:To:Subject:Message-ID; b=S+JIIL5JPAgLKSPpmrt8vlEksNpakZDQfgwZYBnGTXTMX/fxWHoNOELOV72PQNTtboQ2aKNZyfcTd/J2hBHw3x/Zeza1seEtQvEaEtfM/XiJl94d7PUtYCVi0rdYUwZcS4dGaWrXpjQDsuRn8QbmwCw5OjMN3tUZyQ9MZHB+LAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CMNrQmgZ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CMNrQmgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771275395; x=1802811395;
  h=date:from:to:subject:message-id;
  bh=qh7G1T/rIQmSWTukufTEp/RQVQV13xpu/7Wo+Lcqz48=;
  b=CMNrQmgZTVbQ3VnJxQ6wI8mPKx1wmZTF1y+Jii3G0H3+4KLYVh6BBMfV
   m1X+pPEFb5udHcyeRmTinT3dugkZmauoedArOJIRjh5m6u0bqgphEC7wO
   QW8So03/N3C7lqZ/COQLXmJDk0M8T4iHdGtonVrBeXWk93M8o2rDtcM1B
   RvEeL+cFivGWjqn775dbiV1HDOb4+wv0m6FfgxruSUNsrikgpTgr5DJIU
   2PGHcLKyb83dCiO3QzdCbNal8WwjR1Z75QQ7wipowSA4ext9cx6HtO3tv
   Jv4hrueMk1C8+MPMmDASIVC7o5qq9zZteRThaXryeNdqZDvEyfXkcGQB8
   g==;
X-CSE-ConnectionGUID: k3Gv8O6zQSOmUSU0CIkBGQ==
X-CSE-MsgGUID: KyFaBw+QSLmQzU5KkwPgpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72064742"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="72064742"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 12:56:35 -0800
X-CSE-ConnectionGUID: GjAT5xK7TJO31BADbPuOzA==
X-CSE-MsgGUID: XVjPn1vnRdGiYxzESb5hFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="244288822"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 16 Feb 2026 12:56:34 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs5dv-000000002bh-3Bhc
	for oe-kbuild@lists.linux.dev;
	Mon, 16 Feb 2026 20:56:31 +0000
Date: Mon, 16 Feb 2026 21:56:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 27/41] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202602162141.Vb91G046-lkp@intel.com>
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
TO: Richard Kuo <rkuo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   62702f080dc2ac995b8515a4e564fac852471147
commit: dd59a24d47331a5c7830b9e105e7986be52b9b07 [27/41] hexagon: add SM8150 platform support
:::::: branch date: 18 minutes ago
:::::: commit date: 21 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260216/202602162141.Vb91G046-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#164: FILE: arch/hexagon/boot/dts/sm8150.dts:126:
+ * each time we hit a key.
+*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
