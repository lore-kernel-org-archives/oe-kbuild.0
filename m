Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F99E14A0BC
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Dec 2025 15:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766331485; cv=none; b=eT+PZO/BD/IOPobb5yLLOTt93FOIhLG4hc4NQNr0jJhGxzsLStWw8RD9+MwhX+HaxvBvuY3Fn5gEs4cIZmTZoJPbmJMJEcJ/JPtoM6mWlPVavXfaootU/Bws+UQmbsca+Bi5/p8aIxvULQ7jt/CozQfLOrwHHpEQDC61uY9KDnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766331485; c=relaxed/simple;
	bh=buVybJgYjm1KAoNrUP+vrdOpqsmnI6vMucAUoG0CrIc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EF5PBxgKe8hbX6ZUMIgjQrQwogn9TrEzDN2vtDliGuj2UQtkuufvpGJeWMFs3hgqO66lwoDGaSFq4euUdYOHKyPC6vowp5t0Aaj/kz9uDBwy5XpQJLmZ896Sif3Kuxwe6wqG0oREbTM+ZIiPSnbZNwkUjHKEd5R6Lu468+vkOTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DrhBSXiZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DrhBSXiZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766331484; x=1797867484;
  h=date:from:to:subject:message-id:mime-version;
  bh=buVybJgYjm1KAoNrUP+vrdOpqsmnI6vMucAUoG0CrIc=;
  b=DrhBSXiZi8R8UCxBlQu3EUK81R38XAc49mFbM0oCECY90vli53U9W/8u
   0cZ1IRrW4bTfx5PO59SihXNGN08Z2YlzrOLKcOYq4/tHYiDnWWRm5bbn2
   1LNu4wkrWQufE4lhDTRe6e4vMs86kYZWxeQQyPGQTYrBEkxbN1jLzD1qB
   HG6+OfAKO/qIyqiWx+wvKWKgsv9TpSvUEqNu9yC9OWvl5ym7CBfBnFpjO
   b0YIJ1UXxIL1+Zos/4juusxoyq7q06w4kgoLP7IMvdBlczcnxsaouzqRS
   N98IJ6Qia9BCIFMBhxlzs3xK670tpqaDmXnrYz1b9X5iEawIOQm9FLBG3
   Q==;
X-CSE-ConnectionGUID: nO0ieFcESES2so7eVd6eqg==
X-CSE-MsgGUID: /3wqY81BSGWiZOXMKfCPEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78847501"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78847501"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 07:38:03 -0800
X-CSE-ConnectionGUID: 1JRc3uvHQmm0ByM/AwPX2A==
X-CSE-MsgGUID: fnJuojR/TDquubv1hN/35w==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2025 07:38:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXLVR-0000000058S-0i4H
	for oe-kbuild@lists.linux.dev;
	Sun, 21 Dec 2025 15:38:01 +0000
Date: Sun, 21 Dec 2025 16:37:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/200-dcp 164/246] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'it'
Message-ID: <202512211602.dm6fDYiC-lkp@intel.com>
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
commit: b9c92aa0ced9c7b25e08f468432197883fec3810 [164/246] drm: apple: Prefer RGB SDR modes
:::::: branch date: 3 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251221/202512211602.dm6fDYiC-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'it'
#7: 
when it it would require DSC. For example 12-bit 4k 60 Hz YCbCr 4:4:4

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
