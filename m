Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C6023B63F
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 19:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454687; cv=none; b=X8PCCnGPtM9VOp/gCqvWtNScxFO8f5lJoToq40amvdGPx9onOctZcnJCn4oxVqqez1QP/qPDYBohqCEnjDkSf7mqGbU0SfIerd6b1lqesOTlg85ay8WH26wFzkYyNe9mMalhT4JQaPVPQLeS6dzMmKKrodfjlHbfgPy21bM/PMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454687; c=relaxed/simple;
	bh=L90zWWBRyHgv5/p6kaAYly75u9RNsRu7EGGQ/D9Ggo0=;
	h=Date:From:To:Subject:Message-ID; b=pbrvdjEfZPGD/QC41zHF+6LGuhNc4rGLyaY03M8i/Y9G1GUj8NnJvOv59x1XqQxXQ/1HH34WhAO/IZP1675solXbJJrXI+irAuDvhKaXzaypwTaLoKNT7AOkp2ssRA2aHkym6yAhAelArpPps4gDL+6Ui0Il22madk2F66ajDwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1L/QVeC; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1L/QVeC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769454686; x=1800990686;
  h=date:from:to:subject:message-id;
  bh=L90zWWBRyHgv5/p6kaAYly75u9RNsRu7EGGQ/D9Ggo0=;
  b=T1L/QVeCbeKqO+1X0gYoPwR+cbWvrptSHEAqg6VCwQKjk7YEmyVmESUz
   craaHMeIR0DiWghFtB+2V8x37GQVqIAJci2GEzdLz2HMzzSVlW9N1cuni
   hSgbwEbrA4rsJdSQQ3YIZm/SiIV8wBcM3JXWPw80H3NIrz1gpTff3zbwk
   wEQ2DbQHBp3AWMEW06B/REeF8XXFohN7ubZ0d6ZeddQS4jV6K6TZcDRYY
   V8uhyp/7PCAP70w9VLdPMFW5N9ThGrcSzGcE9aOL9mj4nHq7wZflH8fHH
   B8NMVvRbBNDai/lJ50ZW9BZnrI3EnuP1ShKon0ZUvPXJSiEsw49O67xsT
   A==;
X-CSE-ConnectionGUID: hmpYzlEnR5mEKD8+w11I5Q==
X-CSE-MsgGUID: ikqaV1DFRymmvJuyTWLudQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70699316"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70699316"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 11:11:23 -0800
X-CSE-ConnectionGUID: Oq/v2eq/T0a33wIDMpkysg==
X-CSE-MsgGUID: UTNcD2lpR2yyrayrfo07FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212735796"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Jan 2026 11:11:23 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkRzc-000000001Zz-2h8y
	for oe-kbuild@lists.linux.dev;
	Mon, 26 Jan 2026 19:11:20 +0000
Date: Mon, 26 Jan 2026 20:10:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jlelli:upstream/deadline-kselftest-b4 6/7] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude
 claude-sonnet-4-5@20250929'
Message-ID: <202601262005.nOl7Ym1x-lkp@intel.com>
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
TO: Juri Lelli <juri.lelli@redhat.com>

tree:   https://github.com/jlelli/linux.git upstream/deadline-kselftest-b4
head:   aea63057473e6e0111adc778d8eb9a897137b840
commit: 9ce7de2edf38b16a0cea9adf23b95fbe24ce31db [6/7] selftests/sched: Add SCHED_DEADLINE bandwidth tests to kselftest
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260126/202601262005.nOl7Ym1x-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude claude-sonnet-4-5@20250929'
#22: 
Co-developed-by: Claude claude-sonnet-4-5@20250929

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
