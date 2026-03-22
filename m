Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3A11F30AD
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 01:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774143766; cv=none; b=fsJgp0fYdm93nTMNhtXw6qu260UhqzsQVgV8sanua0hJrEfKxsoeRCoIqUG47jiDuFeAseslIN4X5mBk8A1F2rasTJxkMiP3k0bjHjx2kx3vp7WwaD9KrB9tUT6p/vw2LThvldEa8aqLcIDRoBaDaHIOm3X+P3iEk371s7bq31E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774143766; c=relaxed/simple;
	bh=lhM4pX2rlbNGUlcMB9etB1Lo74PIARk/mnAQhbXQw28=;
	h=Date:From:To:Subject:Message-ID; b=ufNfnko6040XfBEHId2HflynMhNtpvITdceUlXWiUAJM7xgfqfU0slWWfXFlbWt3NRUsD6BJl8KQ/JWbt0c7Mtbdw8IYXlkkJ2+KLMbsagkzue2FUouNEpTd/jDcFLxH08KMdThBf39rLgLm7kyhm8cpy8lSU1V6IbiKUDTnwhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwAA9494; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwAA9494"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774143763; x=1805679763;
  h=date:from:to:subject:message-id;
  bh=lhM4pX2rlbNGUlcMB9etB1Lo74PIARk/mnAQhbXQw28=;
  b=RwAA9494CyOoXf2Wu67xMkFL9F6H7Zf8A1umg2vTsbGtnu/bQQttR/g0
   4z3NQoc7wJYt4KrqbSk+0VRIWD/YVY13KGBF5PKD5ux+iCa1Rjv3X7/SD
   vWbP5fXuuns+KgU4SWHUERYZr+QGOS9Nc/jmlhr8o8SRuPFfSzE1ERlSY
   kRah0iNu1RRpuzXo9Q7tUpNzQVoLgwoeb1eqUHIUECJN/0zHbXwnd1bMT
   U/z+LUErU/+J2WbWICOQ0fu0XSZVrBokIusnINr+hc6v9ajdWsFosoWwU
   0CCtOP31ESKCFI7DxrdGRZz1ATmVoQ5NVGbNxesKKhfmbv7AhnEvdbCQA
   w==;
X-CSE-ConnectionGUID: rBIxovwxRl2+i+Tb1Cu7Mw==
X-CSE-MsgGUID: BTD0Be4IS5Ohiix9tDjsHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75256852"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="75256852"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 18:42:43 -0700
X-CSE-ConnectionGUID: 5ohXZRNYSb6NEFsBa0RqIw==
X-CSE-MsgGUID: 8wggQWjOQZi3Q7/VoGC38A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="223634795"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 21 Mar 2026 18:42:42 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w47pv-000000006Fh-3MkE
	for oe-kbuild@lists.linux.dev;
	Sun, 22 Mar 2026 01:42:39 +0000
Date: Sun, 22 Mar 2026 02:41:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-new 378/504] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'to'
Message-ID: <202603220240.9gGSUKsX-lkp@intel.com>
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
TO: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   c51ea78c5466be89914cbfbe2618dea67026c2b1
commit: 4a8a084860291054f35eb71a1245b0b30f2af72b [378/504] mm/vma: add vma_flags_empty(), vma_flags_and(), vma_flags_diff_pair()
:::::: branch date: 53 minutes ago
:::::: commit date: 53 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260322/202603220240.9gGSUKsX-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#24: 
  and appended to to create a new vma_flags_t value, with additional flags

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#68: 
The series mostly focuses on the the VMA specific code, especially that

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
