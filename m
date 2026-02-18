Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B113321CA
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Feb 2026 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771407381; cv=none; b=RXBZDj8pbHInXmRij5+eT8ovRWwsktRN8PuU+cuDOqjmrXSOFDfc8pUd3guczZJcQEqDKLvEnC4oFWtd1tr4bf2TCnsYzzBWDhoRgdlPZYiHVM+6wcbHa+G2outlfUcWqE5FGlJRbILw8HO/M1hNhDObmKAlaAjb5rs744L97/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771407381; c=relaxed/simple;
	bh=56k0qixcDSjRfxVxa5vKFvMILDZVVq8VeoHvOV/qUKQ=;
	h=Date:From:To:Subject:Message-ID; b=U9BtYXTvqriwHnYsvf91VBiuimHGPP4XSkM+g3dTyWTPJmItjhg3CZ7LtLft9snLiT8bjGfFRIqvPvADsjoNKW+nxncLEqIEfZBiI/9gYxi4wxPsnhjIAUbhwc47Z1LfC7dvKiyxCFWNuxxigNoriRUUJu3pA/9iVXoBpkPR5Ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eDaP1dG7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eDaP1dG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771407380; x=1802943380;
  h=date:from:to:subject:message-id;
  bh=56k0qixcDSjRfxVxa5vKFvMILDZVVq8VeoHvOV/qUKQ=;
  b=eDaP1dG7GKCr5QRfwvRabxMghxUIaARGJcpYyJ6YAsO60PEqBnsDRTNL
   H5ApU7E859lHqm2fqIPli7oxCcypOYOcyYGjt68pokWKDW2XwTAE4fQz7
   CQLSidgN0quvcoj0Wm8FNQDr9tU720mOV3BkCAsrsIfgrsH29CHzgM0de
   YAwl0yKLDdC3sbPWQ6zby6z11tyAGGRJXtWGQF74+q0KeZR+mh56kcp3b
   7uGcDqhwkBgrVSma3BueRzv4pgHYU//2bIiYvsHfU/gvKaD4sHxgnJkrj
   XFVn2j0iY8WQt3KSel1J4Ws+Jh4wdpfuMD6AuvPdF13nRwH5oGBar1UhG
   g==;
X-CSE-ConnectionGUID: o0BO0NmuTRWVW7cArVO5OQ==
X-CSE-MsgGUID: Hc9OrJ94T0i5ob+TiJvdIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="95107127"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="95107127"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 01:36:19 -0800
X-CSE-ConnectionGUID: mS/PzvWoRlG39jQogfq0Uw==
X-CSE-MsgGUID: QMT3WvcaT5GErPFgldA2qg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 18 Feb 2026 01:36:18 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsdyh-000000003YC-3s5u
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Feb 2026 09:36:15 +0000
Date: Wed, 18 Feb 2026 10:35:48 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jlelli:upstream/deadline-demotion 4/4] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude Code:Sonnet 4.5'
Message-ID: <202602181034.agO6Vaka-lkp@intel.com>
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
TO: Juri Lelli <juri.lelli@redhat.com>

tree:   https://github.com/jlelli/linux.git upstream/deadline-demotion
head:   351ce1967ed402e8ced9800621dbea4045c708dc
commit: 351ce1967ed402e8ced9800621dbea4045c708dc [4/4] DEBUG selftests/sched: Add simple demonstration of SCHED_DEADLINE demotion
:::::: branch date: 7 minutes ago
:::::: commit date: 7 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260218/202602181034.agO6Vaka-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude Code:Sonnet 4.5'
#23: 
Assisted-by: Claude Code:Sonnet 4.5

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
