Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADAAA352F8F
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Jan 2026 17:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767720259; cv=none; b=I4JIOAuBrLgs0Ji3Wrzsz743+YqdI9G12js9YzmVgoW3OAg5S3ZwXhQTZ+p1RbfYPRg+wl/dp9ugAsC5Y+3qKDBOK/xx1TZTSmFNzLVE3yw7Q90C1L20/4TsCWwqTyDgiKK0lDsPX8Ht3zW3EFcYK9aaX5l1V04sPaax8UqswZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767720259; c=relaxed/simple;
	bh=2ceBQNp72LX5fN7LJNIqQhQV5XOCXftbVsC9pCb1ils=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jSjqYmplPgduaONUXz/O00CGUkirGN9AbMWgndxYy9tF2WpKQiFf81hi2ZY9DnQwF/SGya0HkQEjhzQrdq7NLIdsXkNpXfjUwMOjs4gVb69WIcytGJgXz9sEdBwKvYOZmoav6AHlOD/fIEusS6Q0hLHmzqM2UX6JxXTlp1Hwv2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QX7ezEb8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QX7ezEb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767720258; x=1799256258;
  h=date:from:to:cc:subject:message-id;
  bh=2ceBQNp72LX5fN7LJNIqQhQV5XOCXftbVsC9pCb1ils=;
  b=QX7ezEb8AEsAq37vabdvr8Ds+lyMQtCraCTzqP0Rw3EKfyT6WdNe4J7w
   HQEY1rpNb5sgR7Isql1RUFCLWoMCG0PN0CwSv3bjpJ6rYqjcBgTeiigUP
   JH3/nBfTp6mY22NfQtH3thUNbPt+6Svo5cl2ZhYv9MG8/2HFshCLoZa4j
   XhAz3O+ySLFoj07I3WeCjMmTa0AMMWfLfQcHx6tZXBscmnU4nh2Uu+vzO
   ZbOskcKnsnGFpO56BrZcLZ+28OoVdU/la1qcJrrMFcaAJ3zjVUMYGrmoO
   OjR88SQK8LJMB6izaNRhJkb5dHRcAM8uX59C9zMHzrH8TSShKk7OCtjr4
   Q==;
X-CSE-ConnectionGUID: 2dQHqU27SjmFhI+CVJrw8A==
X-CSE-MsgGUID: nnYqdSU3QOOrESh9w6rEiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69251076"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="69251076"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 09:24:17 -0800
X-CSE-ConnectionGUID: qySiYfwsQgeNFk4sGeh/HA==
X-CSE-MsgGUID: mZVlKPa7Q86n3tCP3sFJpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; 
   d="scan'208";a="203161209"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 06 Jan 2026 09:24:16 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdAn0-000000002Bd-0iJj;
	Tue, 06 Jan 2026 17:24:14 +0000
Date: Wed, 07 Jan 2026 01:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [dhowells-fs:keys-pqc 6/8] crypto/rsassa-pss.c:397:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202601070119.ZykfQrqz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/rsassa-pss.c:397:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   7b32eec2a40ecddafbcbd35bda3ccd1c54477b05
commit: 29b26343159d8a81ca7c726c511d90de7814f8ec [6/8] crypto: Add RSASSA-PSS support
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: powerpc-randconfig-r134-20260106 (https://download.01.org/0day-ci/archive/20260107/202601070119.ZykfQrqz-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601070119.ZykfQrqz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601070119.ZykfQrqz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/rsassa-pss.c:397:1: sparse: sparse: bad integer constant expression
   crypto/rsassa-pss.c:397:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
>> crypto/rsassa-pss.c:397:1: sparse: sparse: bad integer constant expression
   crypto/rsassa-pss.c:397:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"

vim +397 crypto/rsassa-pss.c

29b26343159d8a David Howells 2026-01-05  396  
29b26343159d8a David Howells 2026-01-05 @397  MODULE_ALIAS_CRYPTO("rsassa-pss");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
