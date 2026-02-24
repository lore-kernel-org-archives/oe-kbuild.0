Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75229396B97
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 12:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935764; cv=none; b=X35qzXekFvzk6s4LGR0u5RRkr9FHLAxRqz2+rxBmdIwMH2wDIdK5I845+uX6hNflvwyHoOStRDJ3KeJe9C5BPVsRnoTc2DwanCyAczfnZVkU2Xgftf7qAbzPgqU7CcvnqmBN5CePYguNhDZPe7oYNHMIhoyWOjD0grKeYGUGl6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935764; c=relaxed/simple;
	bh=xoO4z9w4x88lgY1RA156kZFJpdeZqSLT9ILV6/pnUcY=;
	h=Date:From:To:Subject:Message-ID; b=eA2g4wbSLTGb0031640XeqTMppOkg90CMaLN7xB4AMKuH/KPT++wwr+06gBC1tRVgnE0j/Q/DJZVRWRJMNkGc3ifaN3LiOVKWRewwI04l5/solpQrM0n9VobaHiPrQpVFMDhYBNnmW6+OmHEye0Df1LyBCEEntJ9aSawBq31MUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCdQKQyF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCdQKQyF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771935763; x=1803471763;
  h=date:from:to:subject:message-id;
  bh=xoO4z9w4x88lgY1RA156kZFJpdeZqSLT9ILV6/pnUcY=;
  b=lCdQKQyF8Jad+oJ/D/9DqoDNRXg7XEtp8A0TaEBYhwY5nq0JRXAqxDb7
   4d7NZ3cBr7ts6EMPll4fPG9RG7BFuGzxceoBJQ1TcC08h/TBxFGqlKU4e
   +J6bH00GG2NZn0FRxKEsAsZEwmVG/59yD7LGpoGsoQMvPfdSpIdU0HZP3
   tVvcifFEiAJ4geS1u5VviCoXen+8zbu+0yDUfk3w0Y0uMqB58/SpaP4Z8
   YBAFpr6tB2MJ6paLp6SmrmWp3o78krpQhCDXw/qpOfZc7SIfVx7qyCyNg
   tDUR/LfqVvVLDvcuTidoZjoYI0m36VCBdBtL9+35WE8CSmKFpaczoME77
   g==;
X-CSE-ConnectionGUID: 8BCp66h4SsC05e/BjV9AFA==
X-CSE-MsgGUID: fkkHrgVQREOnTp8EWc6B/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="76557323"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="76557323"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:22:43 -0800
X-CSE-ConnectionGUID: tpQpuAAIToukXwqrsBFd7Q==
X-CSE-MsgGUID: P5j07u9XSo6Emg5D/wVx/Q==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 24 Feb 2026 04:22:42 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vurR2-000000005GV-1d03
	for oe-kbuild@lists.linux.dev;
	Tue, 24 Feb 2026 12:22:40 +0000
Date: Tue, 24 Feb 2026 13:22:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arnd-playground:randconfig-7.1-next 569/733] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202602241308.k58tbc2p-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.1-next
head:   76f9bd9e344ecd3faf7bdadedc7027b64a6f2d63
commit: ed23591f32649da86946c138851f8a0566cd6dc0 [569/733] powerpc: kvm: allocate kvmppc_gs_parser off stack
:::::: branch date: 2 hours ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260224/202602241308.k58tbc2p-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#232: FILE: arch/powerpc/kvm/test-guest-state-buffer.c:384:
+		return PTR_ERR(gsp);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
