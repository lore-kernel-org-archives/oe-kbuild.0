Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CB3323B63F
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 19:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454685; cv=none; b=QOYVlR8eeBAqy4mdjgXXl/PuG7vrHWh7MeQSPTY+n8OVSuG3ABpWzTLB2pVp33rfLM0fiLKN9jNuPdD6FwZeMGLvFxpqkjANvrFSl+59nVQK7a1fmAzb81iIRwvksVce0qsi+NzSNRF0DAEA3kN4XwdJWKPv7RQ9G9e84agpX/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454685; c=relaxed/simple;
	bh=RjFCnBD2cq++61FDdZSx45VfCgX0RarT7jsSD3kynkw=;
	h=Date:From:To:Subject:Message-ID; b=XRc7AKxmZCNuD502SrvIa4KvEp60B0BlPaSKp4bYYevsnhAB6X4ifloP0vReT8EbiSxhyo+UdcovL6Ja/DLHxd5r1mOE6BAdp6MfPhKWBIZ35hZojlUwv6EU30o2/XnsAmzfUcyqXUlWyiyAQakXUT5K5j6rGFg2+6J2xBheCQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJvWYtSB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJvWYtSB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769454684; x=1800990684;
  h=date:from:to:subject:message-id;
  bh=RjFCnBD2cq++61FDdZSx45VfCgX0RarT7jsSD3kynkw=;
  b=bJvWYtSBCMjR4+/DkpMgq5F9SLnfZKQvCClutO8+SkNjbf32Q4cvII73
   4PZfgJWgWPE6s5SKSlCaA/mjDDYcDtP4eKJ2vmSz7VA7AchNmx32TKeMd
   KKon3sIXZw1GJppS8ld02vYANfX2lCI47oOD/pQk78gjiA3tIM67a+Bsk
   C0uJynML16rtfucfPZmSfWYspPjMO8wAMfbGKSTe5hQKgZ3uJngdqZRsl
   9EU3K74P1DL96BVWIB5cZW2OMfuD+qtCVp2xyFp2oFSoYv9Z9VmQavKNJ
   3bs1AtxRfbgpVYe0mIwKFmahDiMpGKIxIxwBfDo7I9bQjvi5moUEMIPom
   g==;
X-CSE-ConnectionGUID: hCXxE6ujRnqCrej8vC30JQ==
X-CSE-MsgGUID: /tYoGNCpTeujP4lUuSxV7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="88217563"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="88217563"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 11:11:24 -0800
X-CSE-ConnectionGUID: Pu/9+ggiSeOZ5I7EkkNDrw==
X-CSE-MsgGUID: DDCMd7GOTn2/GFcqvJa3pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="245366373"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Jan 2026 11:11:23 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkRzc-000000001Zx-2XZr
	for oe-kbuild@lists.linux.dev;
	Mon, 26 Jan 2026 19:11:20 +0000
Date: Mon, 26 Jan 2026 20:10:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jlelli:upstream/deadline-kselftest-b4 5/7] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude
 claude-sonnet-4-5@20250929'
Message-ID: <202601262057.NnAY8TYy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Juri Lelli <juri.lelli@redhat.com>

tree:   https://github.com/jlelli/linux.git upstream/deadline-kselftest-b4
head:   aea63057473e6e0111adc778d8eb9a897137b840
commit: e3357e50d93c2f644a66f68eaf764dc84f4f35d0 [5/7] selftests/sched: Integrate SCHED_DEADLINE tests into kselftest framework
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260126/202601262057.NnAY8TYy-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude claude-sonnet-4-5@20250929'
#24: 
Co-developed-by: Claude claude-sonnet-4-5@20250929

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
