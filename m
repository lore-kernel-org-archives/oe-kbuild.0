Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F671365A13
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 06:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775196759; cv=none; b=SRjHg4rB+0y5thlTeeyqhSudSqydF9QlwwKQLW4agE8TpqN+tYb/6+a82QXCjLSzlC6UAjRqDQnmIZNaO7mcA3OejuevV7cX6Dc8sQYqIycIjkbp5/Ns6UclBY4PskS54dUVXRR9VZ/MZSs4r+Nfa6JX7dkhSb7t5VudhxbYCNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775196759; c=relaxed/simple;
	bh=ZRl9ovlyAFWDNX0gzLp3LI1c4K0Gexn89uf1PiLfaek=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=bhlWPI9EtSLhFcfbqg2RyRRiF0YMyzOWnoVVI8eTdhB+dacdD3FeiLAEdZAt655MCWdRvbmiog1Aw1Q8KJawYzVgUIbg1dSdE3FqglHuQ4GaqF32yGdHWNYImU6a6YdwnSdQyK7YRR2ihp6nULgRX9bSd2E+87WW/HCzs3j5oew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XV8j0xLd; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XV8j0xLd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775196752; x=1806732752;
  h=date:from:to:subject:message-id:mime-version;
  bh=ZRl9ovlyAFWDNX0gzLp3LI1c4K0Gexn89uf1PiLfaek=;
  b=XV8j0xLdgTmxGG3S3h5SP3+3KueXyq1edSWDTDa7FjhDNvBYt4pnLEM0
   RVCyOSFgMAm/opz0KcE6yQQNRl/UTRJCOcklYMOnMnydapu3aC9ycqTcC
   aEjFTSLSSz0CKI7+4KMc2+MS5/60QVSIedbW1LLqT2OkQsz+XgZNG5U2j
   9pilJSswzcqlC21ELpw6+xnsqXukSgFNNeK7lKDnIWwVml0bU2q5NEHsA
   SrNiHmw4wOu68JKpDzQJArAn+PPA8d3bc51fpTuu6e0gO6GpLK41heJzH
   0omSRIGBYgHnhQN2MHL+5rxixBlkMK3cP5vHp7NovJlSWb1L3bYH036fk
   w==;
X-CSE-ConnectionGUID: q20JWkkDQpui3zOSc8HJOQ==
X-CSE-MsgGUID: bFDts/FKRh+9kuni8WyRSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76326614"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76326614"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 23:12:30 -0700
X-CSE-ConnectionGUID: QYomWzmZR1KrOtJuQxda0g==
X-CSE-MsgGUID: OywzKr7VTTmf50Hhp8x9DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="228809300"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 02 Apr 2026 23:12:30 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8Xlc-000000009En-0p2I
	for oe-kbuild@lists.linux.dev;
	Fri, 03 Apr 2026 06:12:28 +0000
Date: Fri, 03 Apr 2026 08:12:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: 
 =?us-ascii?Q?[linux-review:Christoph-Hellwig/xfs-add-a-separate-tracepo?=
 =?us-ascii?Q?int-for-stealing-an-open-zone-for-GC/20260403-012713?= 9/9]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'open'
Message-ID: <202604030835.OwDSWLM5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Christoph Hellwig <hch@lst.de>

tree:   https://github.com/intel-lab-lkp/linux/commits/Christoph-Hellwig/xfs-add-a-separate-tracepoint-for-stealing-an-open-zone-for-GC/20260403-012713
head:   935df09a5592b519085b4c52a28deadffef0e0a9
commit: 935df09a5592b519085b4c52a28deadffef0e0a9 [9/9] xfs: untangle the open zones reporting in mountinfo
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260403/202604030835.OwDSWLM5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'open'
#8: 
the number of open open GC zones.  While that has to be either 0 or 1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
