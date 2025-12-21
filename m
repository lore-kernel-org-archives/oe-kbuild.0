Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B102FFDF9
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331607; cv=none; b=fXw7TFJlWAkgclKWHbRlx/YGQCXN1IO8deXFdtshxC7uZ3G71fYJRO5DcjS0s2Y9oXcc38pZam5tlGZC5RN2KhXF3LiMMJO+Xesj16Gle4pkoPtFgR+7VWIMBBgUr9kzSMictCXslS/jkyoBL47Z0uVo8u8rWpyOE8gNyiGlWmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331607; c=relaxed/simple;
	bh=XE1V+Gq1AoRAwuayaK9nDgF2we5ineyN1zfkibEijwk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WzNa+SathJacCCa+TBhOcxSfIqXrvdaQFZU2PnhpKtJNYP7lsuZek3WPRG5pKeC07Fzob5USnimTt6eM1J1TkLPwLAqBz5jkeQzCYbbfvG/yaTg9YassUuMJ2LHHP7TjJhvmIqXCYZWTJyhPu1/pRDCxuCFlmJDBLCZaTDaDVc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lcpDwFMs; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lcpDwFMs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331606; x=1797867606;
  h=date:from:to:subject:message-id:mime-version;
  bh=XE1V+Gq1AoRAwuayaK9nDgF2we5ineyN1zfkibEijwk=;
  b=lcpDwFMsgdMZE7PJ3pPUZVa5NhU4VJbchdJpQKyH9jnsJlQQpQXjrQ1h
   rrGeqFLirQNJz6QBd6juTYEG4zC9/QtURVFwecYqGvPI39LDmYMTqujfe
   tkLuXJwvnmDxkWRY7DLZrNaNdoNptOUe6nm8+oAupbNxcS6epPMOEqWJi
   B7sLsx6VOHtBoeF7O28i8O8cs23GfduWsSWTUTROOztfchh4ZHPM81bwO
   CozwA5UEui2UJ/W0l2JS+uDjWxUcTUqPG8pxvsi6/DdAcR41vgRN2WuSz
   73SaHz5WDfEWOO4ZaZ9PdJuiH1l0+3fDUNfumn8TC0x5dbZoBPwRPG754
   A==;
X-CSE-ConnectionGUID: qeMO2h/MQKWacpTaGpHZ9A==
X-CSE-MsgGUID: o1RNnT2iR5WO9Fl/OmMavQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68090781"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="68090781"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:40:04 -0800
X-CSE-ConnectionGUID: C5nFqs6/Qmi3kwiO8zYKOQ==
X-CSE-MsgGUID: E/TntnnQRTexnbnNgxak+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="199347363"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 21 Dec 2025 07:40:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLXN-0000000058w-24aH
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:40:01 +0000
Date: Sun, 21 Dec 2025 16:39:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 206/246] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'against'
Message-ID: <202512211619.scJ06KYA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/200-dcp
head:   a505a983517df0d2df38e87cb1898c518fdf9740
commit: e11df5b2f3fc4a6dec1306c52942fbdd9c04096b [206/246] drm: apple: afk: Optionally match against EPICName
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211619.scJ06KYA-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'against'
#15: 
So match against against EPICName which is consistent in all cases.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
