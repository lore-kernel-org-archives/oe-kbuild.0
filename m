Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA11B79C8
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 18:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764269386; cv=none; b=TbFnGQk4OpyFKmYABi3FInpqJlVdLYp3fk3dh25Z8RYQzIu+XWWntmLuJea+xzI+wZf/k+j6YQfYIVd5nYmJLfuWJu0DJY85DIpuQtXqM677JlqpL/m6MBGUY3azOuYnNzPaQveObjBhX3IoFJCLwUD1TpNqaEk1vqYLYBY3ZUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764269386; c=relaxed/simple;
	bh=3oScHeTmLet6Rf5vvRwxBadwLdaCZcBUvN8gXG+9cIU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HDjRVhB2zl4X4YZRUl4O7Ri3jYKkQ6IYM8QS2eNdRPDWoKg34DJMETU3hEtnl07SG96tAPFY0BoHFzxWqcCHgqDuBm9825MNhsSJ+strP6bCvfKSFRIt3eSY91OuH98qj3IDJFOP3bsc+l2V4Td/HrtD9XD455pLnYr/r8bKr6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L3kB4Uj5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3kB4Uj5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764269385; x=1795805385;
  h=date:from:to:subject:message-id:mime-version;
  bh=3oScHeTmLet6Rf5vvRwxBadwLdaCZcBUvN8gXG+9cIU=;
  b=L3kB4Uj5Ej1+Tz1aKQcWecOKO+CmoymRr7faHuW6dBD6Vi0H838sAZG3
   yUJAlsxl3QNc/5BDBMBG1lxD/7Qb5epN7gJVdAWi7NQFp5RM3AEiT7mlv
   jQS9nZ0DHPGc+vWgLbhSx7S80Utqq7Am/559PkXDqFpTsQsYMxEq1XRDw
   3tZrIQqib83kJXqmBbT9sCRMq2VGRRQrLTGfMtLzsjJx5JifRVNJmJJxg
   zv7V5liyAtxR9y01Z1ZpSkYEcu/RHFZffwTlxa8SpXiViuGbjExfSCz47
   LgYn+mRVNiBZ91QF0doJ9qpDEUCWU3AgMq3ygNWCSkA3ABnyRnt1UtyuG
   A==;
X-CSE-ConnectionGUID: P/sP7XRlSSeEO3A227lgZQ==
X-CSE-MsgGUID: tLPD0qY1TwuSvAKCVHY4Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="77679027"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="77679027"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 10:49:44 -0800
X-CSE-ConnectionGUID: kIi65n8+TwqVFAuQAeuKEA==
X-CSE-MsgGUID: 1i8ri6sdRiWKjzhpZspUcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="193184236"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 27 Nov 2025 10:49:43 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOh3l-000000001on-3sey
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 18:49:41 +0000
Date: Thu, 27 Nov 2025 19:48:50 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [conor:riscv-dt-for-next 7/16] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'with'
Message-ID: <202511271936.olSu6Hku-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git riscv-dt-for-next
head:   a4aad736716d345d98c0eecbb0061fc9b6e578a1
commit: 56dfdf2da1cf6261eaeb4259dee27201f2800691 [7/16] MAINTAINERS: degrade RISC-V MISC SOC SUPPORT to Odd Fixes
:::::: branch date: 87 minutes ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511271936.olSu6Hku-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'with'
#12: 
new SiFive demo chips have been done in partnership with with other

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
