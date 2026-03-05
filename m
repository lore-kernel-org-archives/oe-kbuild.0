Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17D930EF92
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 22:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772748410; cv=none; b=ZM9aMroEdHnnGaISN43D6a/Ho2BOkA/p4wUPGAbz0sqU8SF4Fowre8wBQ16zi4hYr7wQ0wFvtFEg8dcpQLE8zRRjZRHOqXelsi6Um8hf5GR+wu/B+4qghAIWKnpo2B3Spf0lJPvFrCTdtrs1FgRiYSPaRkGn4v+38CMx+kmy4yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772748410; c=relaxed/simple;
	bh=3uP1uNBWGtUHXdu5k1wvvjSjxyx+ppI5Ht7jRWrdxiU=;
	h=Date:From:To:Subject:Message-ID; b=aMYRK65XZA+nZojR7z4nDttlRK80uH6wumz0WkXTVbHcW8tWSJZ2Fe3C3mibhmyxJezBcQfx6z0KRCbF3NM8z2xWDKvxqiet/NBKQ6bXc5yq1Bzkf/iSh+ZzrMGPGhkUz045xtMyfzqOPh20DL77RWX9P5TOEXjtyIJgmG1kwis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRhO2ALo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRhO2ALo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772748409; x=1804284409;
  h=date:from:to:subject:message-id;
  bh=3uP1uNBWGtUHXdu5k1wvvjSjxyx+ppI5Ht7jRWrdxiU=;
  b=VRhO2ALomDvdDshTYjtiFEsEYhDrbTBLVF2ZPw+uDpZB22PbwOYTIWCD
   /AO3jdEMIszxA0Thg0+N8qTPoSTSzUG1KEFJhF9+SEfzui9BnDzO356Yz
   sA6QVCe9WYBsPwmFBiLyRYirmAwls4KOqujvYJvWCUG008EuygJgiAR3w
   aYS7pmjIW6Yh8chhLFpOZzxN+lFFCRmsfVb6FDBABgEJcmtscGYww35l+
   /odK0N3GMJQIw2aWjggy+QYfBObj2KlC7skAQbZ0RygvzczzzPg5klZ1Z
   BUeIRvNmuFW0GRIOrX3w+o68zTKnY8cO3bVxn04Pp5rG5WEn9D/eK5TDu
   A==;
X-CSE-ConnectionGUID: aaajTrdKQkuo6MkjKcWP7Q==
X-CSE-MsgGUID: K5F812FTTditLkOdwpx0hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="73724476"
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="73724476"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 14:06:48 -0800
X-CSE-ConnectionGUID: uxAekbrLQdeswsmeA7CCMQ==
X-CSE-MsgGUID: 8+lQFDQJQRiCQWwTedBCPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,103,1770624000"; 
   d="scan'208";a="215566780"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2026 14:06:47 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyGqD-0000000024P-25IE
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 22:06:45 +0000
Date: Thu, 05 Mar 2026 23:06:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [conor:tsu 10/10] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'represents'
Message-ID: <202603052354.jp2jZ4XC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor+lkp@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git tsu
head:   caabb51b836b75217ed258f9ecefe2791396d806
commit: caabb51b836b75217ed258f9ecefe2791396d806 [10/10] net: macb: rework usrio refclk selection code
:::::: branch date: 72 minutes ago
:::::: commit date: 72 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603052354.jp2jZ4XC-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'represents'
#38: 
Change the new capability flag so that it actually represents represents

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
