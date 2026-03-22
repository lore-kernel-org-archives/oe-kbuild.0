Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A279518050
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Mar 2026 21:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774216378; cv=none; b=oIVl6a0RkfjMadjVsze6qhnuP+2+0HKiL9fOPKmlcVfaFjI8O7GMFToCS0g4SxeXbEOjW/rmh/won8JjqSox7JA8MQJdpoZYvxJC+LQFw4MECj7GC0ygjqdgSyiKxRhSw8I80Zz8Smv3rljjjBmU4zI+fcgc4TdsUPBAox5CAxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774216378; c=relaxed/simple;
	bh=FD8OhFdgKYRRaLjAjxWJInLU4hUn4Vn/PpQzTEmb02I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qdHbDZVMm6PiNr1GhNENYj7cmB8kRo2sjpNG1ZJygFvp4eSYoLfKWKUbsQ3IQWJ5fomNrVccePnxbvSHDtcLTAVZVoZ9gA6OhrL9fJwsdiPxjoUAd9lnbnfwhwc9OaDnb5n2KLXSbsDEr4DQnnJAVpPGbaLyvfFTwBND4xu/KcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVh3IVbL; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVh3IVbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774216376; x=1805752376;
  h=date:from:to:subject:message-id:mime-version;
  bh=FD8OhFdgKYRRaLjAjxWJInLU4hUn4Vn/PpQzTEmb02I=;
  b=AVh3IVbLUy5vbN2ZFVmi1gB1TvtNQXW42sNQWpd9ptagU8JcaodZYwSV
   llgQRG2Jonlro5Qs6bncZfceHLCzvRZ/YzT0K1oRg2jRAQyroW5C1+tKY
   h0rpFzZdkIvb5pzi5nu2tTYFGG0FDkvDuFQauDktjh7tL5+qeOF2gVhxy
   c2sr9Kx25tuSWccfF1AWf2f4TQ+D/PewxmiHOkMEizK86iV84/KvlvU+d
   fVQHWAK38hCfanRoAWwc+qXFa4OPXQZG3ueYzwzrWdR4WUTTHxNJ5GyWx
   oZr4O1RXmqyFHqoqyccW7CrQ//XM2bVktTmaXFyGzF+LyMcKxN/2D73JY
   g==;
X-CSE-ConnectionGUID: LrpWXMXKRa+T+ptsBPz1sw==
X-CSE-MsgGUID: JYGFULKNSgOykRLAOJzyKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="85532952"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="85532952"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 14:52:56 -0700
X-CSE-ConnectionGUID: TR7ZZgp4SoOxYjBjx+4qiA==
X-CSE-MsgGUID: Q7j5HKg3StC+/beAvs8aaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="219523583"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 22 Mar 2026 14:52:55 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4Qj7-000000006SZ-1wH9
	for oe-kbuild@lists.linux.dev;
	Sun, 22 Mar 2026 21:52:53 +0000
Date: Sun, 22 Mar 2026 22:52:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH wireless-next v4 06/14] wifi: cfg80211: add proximity
 detection capabilities to PMSR
Message-ID: <202603222237.WE3oeepc-lkp@intel.com>
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
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260320175938.2547288-7-peddolla.reddy@oss.qualcomm.com>
References: <20260320175938.2547288-7-peddolla.reddy@oss.qualcomm.com>
TO: Peddolla Harshavardhan Reddy <peddolla.reddy@oss.qualcomm.com>
TO: johannes@sipsolutions.net

Hi Peddolla,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9ac76f3d0bb2940db3a9684d596b9c8f301ef315]

url:    https://github.com/intel-lab-lkp/linux/commits/Peddolla-Harshavardhan-Reddy/wifi-cfg80211-restrict-LMR-feedback-check-to-TB-and-non-TB-ranging/20260322-182534
base:   9ac76f3d0bb2940db3a9684d596b9c8f301ef315
patch link:    https://lore.kernel.org/r/20260320175938.2547288-7-peddolla.reddy%40oss.qualcomm.com
patch subject: [PATCH wireless-next v4 06/14] wifi: cfg80211: add proximity detection capabilities to PMSR
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260322/202603222237.WE3oeepc-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Kavita'
#36: 
Co-developed-by: Kavita Kavita <kavita.kavita@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
