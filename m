Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEF52D8382
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Feb 2026 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771316749; cv=none; b=Xg1dveTc46yIXYdV5Q8YQ9GeiXLVO3a6DeoG9o2T/d9CJSEOKwMTlYAwXyRlZZLVZj16M0zUsbcjSmbHLWgIKptngd7n2km2sgguvUS1lyVYmh/+idfDoPwZqku+13xmbOaM/461u5ssFQBMXgt1u+7iR9BQ+hAiw6JZI2y4REk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771316749; c=relaxed/simple;
	bh=SmnaOiJm6pf92SL5BX185FZcC+0nrLNMLPBNVFajEC8=;
	h=Date:From:To:Subject:Message-ID; b=Q+FIwQG0LBPceB/M240PA1dX+FtYD9Tkjef8EkJmmPurOxzm9Q5yIWpwjF/AiFiQElJX887usgJffQwQFUF+zP/jrWRYdKHW7Qdnn6LehDbHdJ2NUvHTsIYBonzxestYRP9nGxy3uq3BbNamHehVyGQNcvIH6O3EbzuLg3dG2cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6BaETd3; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6BaETd3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771316748; x=1802852748;
  h=date:from:to:subject:message-id;
  bh=SmnaOiJm6pf92SL5BX185FZcC+0nrLNMLPBNVFajEC8=;
  b=C6BaETd3c9SIRYmi4Zot9ksldDEsGzFDPxyErIctMxx6BHiPgCh7+iIK
   HIluFdqVo0fsN5ozP2g8GCdf1T/630+Rnz3Gp/ab+4hJrMmp1hbqrGU6v
   w793CUxpAHUikLU5rvUKarz0G4Kgk49xzUUDrooEwrMJ6oa3xHQG5+22W
   4ZhwgefJtoeaG8lPco55PYJx+IdbhL6tW+58nAtfTHCYEgUrJMcYfhsDo
   TV3zK2YtDXV8gx0gUUtHzQlC2YF4dEhZNt0N1eCDooShLj9f1+OHh8wme
   Js0sjvTRb6iO85xRtE2zjW14zyN5qfhRzmtu9jSN1cLgCxtDlpYSL1D7B
   w==;
X-CSE-ConnectionGUID: bVJAkdK7RzWXIqh3Yb30/Q==
X-CSE-MsgGUID: FHISLqxuSTeJspTX54nJjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72373227"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="72373227"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 00:25:47 -0800
X-CSE-ConnectionGUID: EzJ/xlJzT6quCkneP5lsPg==
X-CSE-MsgGUID: /7GCcppwRK6fLkx/h68m4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="217776676"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 17 Feb 2026 00:25:46 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsGOu-000000002rx-1Jg0
	for oe-kbuild@lists.linux.dev;
	Tue, 17 Feb 2026 08:25:44 +0000
Date: Tue, 17 Feb 2026 09:25:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jirislaby:devel 6/28] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Nick Kossifidis <mickflemm@gmail.com>,',
 should be: 'Nick Kossifidis <mickflemm@gmail.com>'
Message-ID: <202602170902.FGoz6ccz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   7dfaca63ccbb107c245cabdb86641954abc5284e
commit: 05ba8a29f12027920169b6018ceca97e3f02d202 [6/28] wifi: ath5k: do not access array OOB
:::::: branch date: 9 minutes ago
:::::: commit date: 9 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260217/202602170902.FGoz6ccz-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Nick Kossifidis <mickflemm@gmail.com>,', should be: 'Nick Kossifidis <mickflemm@gmail.com>'
#47: 
Cc: Nick Kossifidis <mickflemm@gmail.com>,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
