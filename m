Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364FD3E559C
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 15:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772811122; cv=none; b=Opc325HJkE1ZNLWB7PWVzTUmQhmMiMD57V7pDRrQwdmlUsOxAdZ1Eai7/XJFRm52LXN3Gco40kYo8YS2n8qOOuuJTDrIHE0TqYdkPZDSEOfWXdKeQzQxfhwnBPUWGdUx9W9FvV96KO3uxtWIc9y+l1ukXKUCWCK016Y6n5tiSOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772811122; c=relaxed/simple;
	bh=WEJ8+Wl6yehD9BTpZ6SxJFZnFEqU0tUXBtrMCM++rS4=;
	h=Date:From:To:Subject:Message-ID; b=h5Qfwk/7DMnaiv2HUq9uub8tSHad45aMuRheJnIOJ7b82nu4DXmn0QxR0NqQs9+ntkBhacSwSPh4g9Aeum4/3QvjWFDGrusjx/A5vQ/tI6WWjTdZd0FtuJALqzZFV6Roy9KXkv4RVWbJwMfvGWKTysXIPksE4/yl+aPc7mCueWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwDo9dtW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwDo9dtW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772811119; x=1804347119;
  h=date:from:to:subject:message-id;
  bh=WEJ8+Wl6yehD9BTpZ6SxJFZnFEqU0tUXBtrMCM++rS4=;
  b=GwDo9dtWRNY/kXvl+yOerkLvfbPUNCPvCLY/kU21HSk4j/o7QVu6AFYI
   YMgGpW1O0NBEkF91omSuyVZfR7a30DBqTIFr3HPlxbuPW0v0X/Hufc1pC
   zg208riuUuRXXs5A3nLd4aEffpS3lP1P8Z8PQLWx0I6QS7/s4S9loVuyh
   bewQzfgW6G/ekOiftU60v/veBWIQu7GTN/VwktK83/I3a6TlFzzj9P4k9
   bPx0YfK7fRYtpm56uUKYbzD++fIeYBzsAPI4cdq6+iXozDwdq7vBH8xUb
   gJ35LTagwmVLiJ2AR3UUfMzrqvONWZMTHogKR/wgZ6JD+eWF+Fy+jBDSe
   Q==;
X-CSE-ConnectionGUID: 8ZSQBmM7SQ2mTZn7zmqEew==
X-CSE-MsgGUID: /O4a752cQgmGC5UTd5VeyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73996087"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="73996087"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 07:31:58 -0800
X-CSE-ConnectionGUID: 0Lq3beTjQouT7FctdbFuNA==
X-CSE-MsgGUID: EFRUt7dlSQaVZwl61Jr6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="216794060"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2026 07:31:57 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyX9f-000000002Gn-2fu3
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Mar 2026 15:31:55 +0000
Date: Fri, 06 Mar 2026 16:31:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [wsa:renesas/x5h/mfis-single-driver 7/10] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'for'
Message-ID: <202603061602.KsO9gfYO-lkp@intel.com>
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
TO: Wolfram Sang <wsa-dev@sang-engineering.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/x5h/mfis-single-driver
head:   e921fc1b87b0832d20c6be75629cbc3414a30af0
commit: 6ecce4e5a8f756332e5a1c3bb1012dd512816333 [7/10] soc: renesas: Add Renesas R-Car MFIS driver
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260306/202603061602.KsO9gfYO-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'for'
#402: FILE: include/dt-bindings/mailbox/renesas,r8a78000-mfis.h:3:
+ * Constants for for the mailbox part of the Renesas MFIS IP core.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
