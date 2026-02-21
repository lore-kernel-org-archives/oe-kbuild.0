Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E848731A542
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Feb 2026 01:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771635719; cv=none; b=F5gYi9gub1xaAbjZHuDoSTtqt3Lc+hy+mNflbVRH0U1P/hNt3cnshQyaZXqydSatURq2lMbjLJRc47cdCVDLU8E3wW10yakQuP0u4JQfmN0dynsq9yHvMeiOSnLh/2fh8uk9vq06F/laQNHuBX8mbIv6h+D1oAZxos7UZEIkS80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771635719; c=relaxed/simple;
	bh=BJpWWX+ne/SzFOKVllkkTlyyR2JJbPDsfA619YECRts=;
	h=Date:From:To:Subject:Message-ID; b=aZxBdlOnst65XF081ueqUdmiDVFAE/PMto7CGcbZN9feaIYQFrqWnplH9v92rMee2EyLY8Py/XUu3xA/tXHHZVjUfS+fY1M0H2/4y+0UACf0W5Zh9UZM/ZCOv0cZ4+CfUn8Dd5OwD7E31qIHPaJp/gG7oeAPBSKMusnCRhgjoJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWzaGMq6; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWzaGMq6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771635717; x=1803171717;
  h=date:from:to:subject:message-id;
  bh=BJpWWX+ne/SzFOKVllkkTlyyR2JJbPDsfA619YECRts=;
  b=aWzaGMq6LNJUq97cgGip0X6ZQlz5LYvXr39S8BO5GBZHdIq+vbMdNDTP
   WvVMNloKxODgQzq6Bl1OP6IeRSc/QJ2AFZO5ZcigST54O67k7+WjYqUGW
   02rdbXtpLZIY6IP2GKry9hObyNX6ZRhw/RGXGGQqrRG564iw1GcYUIFei
   2EtZav2O+ubgrpa+JRyv0e8TI8LP5jL7DedDtLqX4XA+yZ9542Buedzxx
   Oin3HNEH+iraHnRhZPYBlsMZegJQ3/ssyocwafqZ441OvimR4xGl3KthB
   erk+LbwlX12sDir15HViCHgk1kg6plrlPDP6R0ANdjkzSzFfdwGyKbySZ
   w==;
X-CSE-ConnectionGUID: aVdx2CoWTDSQ/B2pTUsGBA==
X-CSE-MsgGUID: EZ7iHc8KT9qyLVpbCXsXww==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="72793129"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="72793129"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2026 17:01:57 -0800
X-CSE-ConnectionGUID: y9DzikneTCWDoVxVWMiwJw==
X-CSE-MsgGUID: iVSQ/2mWSDSTrAhn1rNuOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; 
   d="scan'208";a="219510294"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 20 Feb 2026 17:01:56 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtbNZ-000000004Jt-3751
	for oe-kbuild@lists.linux.dev;
	Sat, 21 Feb 2026 01:01:53 +0000
Date: Sat, 21 Feb 2026 02:00:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-new 89/102] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Helge Deller <deller@gmx.de>		[parisc]',
 should be: 'Helge Deller <deller@gmx.de> (parisc)'
Message-ID: <202602210239.2iuMCxT3-lkp@intel.com>
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
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   a6fdc327de4678e54b5122441c970371014117b0
commit: 24ea0a15e26225e395527225a9a130daab4d789a [89/102] arch, mm: consolidate empty_zero_page
:::::: branch date: 20 minutes ago
:::::: commit date: 20 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260221/202602210239.2iuMCxT3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Helge Deller <deller@gmx.de>		[parisc]', should be: 'Helge Deller <deller@gmx.de> (parisc)'
#45: 
Acked-by: Helge Deller <deller@gmx.de>		[parisc]

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Helge Deller <deller@gmx.de>		[parisc]', should be: 'Helge Deller <deller@gmx.de> (parisc)'
#46: 
Tested-by: Helge Deller <deller@gmx.de>		[parisc]

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Magnus Lindholm <linmag7@gmail.com>	[alpha]', should be: 'Magnus Lindholm <linmag7@gmail.com> (alpha)'
#50: 
Acked-by: Magnus Lindholm <linmag7@gmail.com>	[alpha]

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Dinh Nguyen <dinguyen@kernel.org>	[nios2]', should be: 'Dinh Nguyen <dinguyen@kernel.org> (nios2)'
#51: 
Acked-by: Dinh Nguyen <dinguyen@kernel.org>	[nios2]

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Andreas Larsson <andreas@gaisler.com>	[sparc]', should be: 'Andreas Larsson <andreas@gaisler.com> (sparc)'
#52: 
Acked-by: Andreas Larsson <andreas@gaisler.com>	[sparc]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
