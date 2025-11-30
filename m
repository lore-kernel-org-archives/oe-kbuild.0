Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2651B87C9
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Nov 2025 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764511642; cv=none; b=Xh0a3Cp/FlXu6dBEM98QmM2+Ui790bhfNMiDTepHE1Rw4NjbJZgGanjlxyt9u7zTpX7UMYi5FhP1m0UteTmndnSsT23XAYOTbZwDwtd3gSMBkS1g0qMk7zz/gjSUM7EmYWvT7jLaQxJmDHPuv3kLAn5VnwXi7r79D8AJc96wExg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764511642; c=relaxed/simple;
	bh=dNipOdpJT607dodZ6UK+pV6rlnkcc/h/Zlagfve1C2o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tav44qOYBOqoGxDixB4m7qafFLl2lZDTtJr2TNC4dSAcFci82Xfx9TjfHl+TqCYFsNkKnZQI826xcrjLw67tGS/hMsTt/n/zpspvtrOcHqFgWexXhFsgq4t1f2e1075zvYXcnx3wew6MvCMPvY+OtKBQgS7C9lzwojruEkUUUso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jNCsdJXg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jNCsdJXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764511640; x=1796047640;
  h=date:from:to:subject:message-id:mime-version;
  bh=dNipOdpJT607dodZ6UK+pV6rlnkcc/h/Zlagfve1C2o=;
  b=jNCsdJXgekfvBG0ExPWSRnX65B6fjv8DK2do/n7DXqopK0WteKk6pTdB
   e+jLyD+9+qX3VwEVX8yJDTFmdh0F1GWb+jwMAUseY7zE/qM/+hOKSnGu1
   kAQFW2SL8ASDgd+Rx95DS912fTeIyQz78fMY0cMHxXtN9SK3UgF2W7siF
   2BHH5iAKI7TcQOwf9C2ZyfdnBWDgKJ56HexFJ+USW+51R1dHWqI7S8PB+
   SPwjyo3YeABRGUFqm67APBAkG9V4JkD6ubhZS67iwqWM7eXRYMTdwUGf5
   FLNxfmJ/BbbaEpgPm82RM9bdLKnRNIaJCpcf1YvuUFcc/YfXh4mpDC+lc
   A==;
X-CSE-ConnectionGUID: aaa+wT46T3WrR6/t81Yg9A==
X-CSE-MsgGUID: 6TgaIuFnQpCwjlB5EcUKaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66351125"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="66351125"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 06:07:19 -0800
X-CSE-ConnectionGUID: YWhgnaJfT2GXysq0REb8iQ==
X-CSE-MsgGUID: MMDhsjzkTKeSd5ExNSFOrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="192967116"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 30 Nov 2025 06:07:19 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPi56-000000002Xx-3YcQ
	for oe-kbuild@lists.linux.dev;
	Sun, 30 Nov 2025 14:07:16 +0000
Date: Sun, 30 Nov 2025 15:06:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:for-6.19/block 39/111] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'the'
Message-ID: <202511301558.D4RA7iwp-lkp@intel.com>
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
TO: Keith Busch <kbusch@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git for-6.19/block
head:   c1536df9427dc90ec796fb755adcad3cfc469ac7
commit: 262a3dd04e729386bececffeb095d31f7a9c43d5 [39/111] null_blk: single kmap per bio segment
:::::: branch date: 35 minutes ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251130/202511301558.D4RA7iwp-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'the'
#6: 
Rather than kmap the the request bio segment for each sector, do

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
