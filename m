Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEC6378D7D
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 05:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772602768; cv=none; b=ZBawofHhZyjwYH0ktuSi8mI6OoQ8xIedbVpA6kRGOJGbimw86rqMbBtBH3cBz6BWojKIT/Eu1oAIUlhEsgB51vwfCo2DeJXABE9z9JED/pbzIefkMZyipiJ7RaNqQik3AkF4/tys7LHzIZwX00ItEF7/napadX9O1n4ayvUIzyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772602768; c=relaxed/simple;
	bh=bQ3C6yNtU8RJKv0qaod6x17fn7evw4tQpDvpAGYCyx0=;
	h=Date:From:To:Subject:Message-ID; b=Ol7Tr29KLlePpwrIkioKD57GYdnkFdao/A5sbYiZcsM3TrmRhl6dJ3BDSiJGCYMe+c5kFt6JjzjvUVxlemaaTrBwRiUPViAcKbc2qzeG2ZqM9kN/aTllcwVOYYOO8wFrwvU4RoBVafoBihC4HGSZ5PElAmFyq9ooXRpQaDoH0jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aPHJfcEy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPHJfcEy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772602768; x=1804138768;
  h=date:from:to:subject:message-id;
  bh=bQ3C6yNtU8RJKv0qaod6x17fn7evw4tQpDvpAGYCyx0=;
  b=aPHJfcEyUMSk0qfiVeGHeAw+gkHfjH8AKwgPlYReclgMy0a7roVi738z
   ntt/kXqI5c610jw1lAAkB+ZbWOcc6Zd/QOwlna9RGhnYppHMgCiYdGZr4
   xVP8YqnbHr38h+w3wCPAMsFUCWFEkmZRt7X4cj1heQYH+huGDE8/+xPnC
   oPoAGg655kbp8h4SZC/e0cpyjYm4rMuVhNITuK46LR4zFYUoVf+nxK162
   pSi17kJ5e4SCkl7Yw7P5A+ks/rFh7fJhHgj0D0IKXkoQoUImoN99M0ttS
   QQ0kAcXTtn7H1DV+ZebTgLd+1Ke6ZCnpwkeATtKf5BTR2SLzM320k7I7p
   g==;
X-CSE-ConnectionGUID: 3cBz8fWiTB+xEzDErGP9rA==
X-CSE-MsgGUID: uyczNkwGTTun94TkiXsl3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73356464"
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="73356464"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 21:39:27 -0800
X-CSE-ConnectionGUID: gOQEI9D/RXejQ2H0m0+1ig==
X-CSE-MsgGUID: uH8a0a7dTgqCosnIZ8ai/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,323,1763452800"; 
   d="scan'208";a="221207589"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 03 Mar 2026 21:39:26 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxex9-000000001dh-47yk
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 05:39:24 +0000
Date: Wed, 04 Mar 2026 06:38:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [docs:docs-next 10/20] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'nfsd'
Message-ID: <202603040610.l82V5vKk-lkp@intel.com>
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
TO: Daniel Pereira <danielmaraboo@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/docs/linux.git docs-next
head:   d20e945e9fe631381dc426eaeaddeed0eb47935a
commit: 9a7bf1dc886f8c6becac4af7a0c2d17db2ae66b8 [10/20] docs: pt_BR: translate process/changes.rst
:::::: branch date: 11 hours ago
:::::: commit date: 7 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603040610.l82V5vKk-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'nfsd'
#417: FILE: Documentation/translations/pt_BR/process/changes.rst:383:
+  mount -t nfsd nfsd /proc/fs/nfsd

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
