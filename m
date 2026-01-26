Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0691922A4EB
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 19:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454685; cv=none; b=rn6JcsvlfMjrLWESDzg81NJNym6DrVxBG0+Xv3vRbpZNnB2hJvjw2qnw9vSLKmH8/87ZnGfYyOi5O0HVASNx2mezSWCpOpCOYha+9GF3YPO7A1MKEt8zyA4QZb57qOxmxFqfyIqbZ1DONy076CiLFdenz8x6EAhflV1Z4JshzeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454685; c=relaxed/simple;
	bh=0L7Y41LwkwqxI2ZzZORrAg4YIyca78aFT8chUzNiRos=;
	h=Date:From:To:Subject:Message-ID; b=qaZ4CZIUjVLwflFVq3bjuPR9xO5Maw5M9OT7FNeLcgntDtfpUFtEE+uVsAG+fdAJb3SAurkuqeKoYINRK9j6GYHQEreZ1qlLks94eA1Qq5y7MBP3iI62brB+ONKRgtwMD94tz1XBGklTPYXQEbcfZzsEAxBW/sykScU8YCgTYlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fy7TJ0PR; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fy7TJ0PR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769454684; x=1800990684;
  h=date:from:to:subject:message-id;
  bh=0L7Y41LwkwqxI2ZzZORrAg4YIyca78aFT8chUzNiRos=;
  b=Fy7TJ0PR1+Ctnhe/PEtL3y7yyuH5AyqC9mNg1m0Nqyi2dhUOAIJgcf4L
   ZXMzDOufYQZC4nn/MzmETZiBlrR7f63NBM1ZhzKLrQsQU9hg57um0hzIX
   paWAYA1JEutZ/5mYB5l3Qj7NXqoBVMIAkTNH08gfKrJtg7QG0fndCMdHL
   J/RF8ROrG14+heGY/s7snwGLM4DtqCDAK2+eI3qmY7romqSE+6Er8Lewf
   GFPwnFKQhR9DUZkJshJv5wD5zoSiDPuMD6DtUt1VFuwqdiyUaJgjsq3uL
   yItruVYLxOY5xAgtt19qBFrvJsO+ngPI7i0VmSQuqrE67b+/+VcAyenUu
   g==;
X-CSE-ConnectionGUID: BxGKHnTPTeu9JIYkpsLXOg==
X-CSE-MsgGUID: AN7f3y0QQxWawdyiPma1lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70699315"
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="70699315"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 11:11:23 -0800
X-CSE-ConnectionGUID: vyQg7olBTlCNLvm6WmGDUg==
X-CSE-MsgGUID: WE+BX6XGQzicrhun+0SV1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,255,1763452800"; 
   d="scan'208";a="212735797"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Jan 2026 11:11:23 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkRzc-000000001a2-2qVQ
	for oe-kbuild@lists.linux.dev;
	Mon, 26 Jan 2026 19:11:20 +0000
Date: Mon, 26 Jan 2026 20:10:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jlelli:upstream/deadline-kselftest-b4 7/7] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude
 claude-sonnet-4-5@20250929'
Message-ID: <202601262012.7tCmlKGb-lkp@intel.com>
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
commit: aea63057473e6e0111adc778d8eb9a897137b840 [7/7] selftests/sched: Add SCHED_DEADLINE fair_server tests to kselftest
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260126/202601262012.7tCmlKGb-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude claude-sonnet-4-5@20250929'
#34: 
Co-developed-by: Claude claude-sonnet-4-5@20250929

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
