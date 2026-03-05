Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A848F3368AE
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 04:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772684922; cv=none; b=Y6948ztT9UP63GNQloQlejT/cOemQBRY/m3bKMkKviikK+jbrvQ/KejdlhLsFrjYujdK8z/tLdWtxyeUZ3Ofc3jBlJEv7qS+fKXzzkTAm21jlD81ubWdh0DO8FcOMBAJMG4sPXcxEGWpnTIHCQFqSfFTJzycgFx+gsO36HygPe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772684922; c=relaxed/simple;
	bh=bZtoo+D/qQ3O2fJYMPFVnl8fjRRRpXCAbsAozGAG6H8=;
	h=Date:From:To:Subject:Message-ID; b=GrmiMzgwHAbtWyDNpRoWx03fqlDWSAK70DbXU97N3nH+7bPbHzDjBBlY8Gppa5tBGG8dKnSDICorRtBAGr6+v08MUf8wWHqzrY5fNX3eznSbKCEVExT+dNbvdrHpn23F39VjjbxSAjuoL/B3oj+8XGXlaoPx88cxgtEOOozgBkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AmMFMPxr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AmMFMPxr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772684921; x=1804220921;
  h=date:from:to:subject:message-id;
  bh=bZtoo+D/qQ3O2fJYMPFVnl8fjRRRpXCAbsAozGAG6H8=;
  b=AmMFMPxrHPSt2lPUF6/pe53u37qsOMQh2GPg50cbtqBAPRfBMmhTBMzh
   vaA/tA6Sh5e+8FaFObtpEszdo/B9bzSEheRKThL8rYQlKn8Brcy3NdGt/
   C1VRnfgG3y7mme0t3IAx2evzH0O8mdybNnauIS0diVO/IxXXUnwpHf4rt
   aFdlA7srRKPs9IF53MboIWNTUEGn9NDdikvjEggi/ffru2Y4oXOvbpErJ
   TCdZUW932hvGPdqWOF3WGxwM3JJoD7ZpVjBEAZ49hVmuqCehA/vHJYdrb
   R3l4bPaC3+Ma0q9xF78VmmOjr9ZCsc/7rAOvJTV3ftuf6Kr1Urcbz6XCA
   g==;
X-CSE-ConnectionGUID: p/164pvjTCKqboPUoFFXzg==
X-CSE-MsgGUID: 9J/chanSRRiL8rYnkB1URw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73882942"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73882942"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 20:28:41 -0800
X-CSE-ConnectionGUID: 3/XEjQDNQXmZuVrvDUK3bA==
X-CSE-MsgGUID: jPycPuD7SnKQa1uQH3x9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="216840556"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2026 20:28:41 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vy0KE-000000001x7-3LhY
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 04:28:38 +0000
Date: Thu, 05 Mar 2026 05:27:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 15/18] checkpatch: ERROR:SPACING:
 space required before that '*' (ctx:OxV)
Message-ID: <202603050509.7HtNxcFX-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   686692b47cf68e6920487b5fba12882fe5b4541d
commit: fd2a40502548201c416fde1c34a0983ed49e14a0 [15/18] bcachefs: add get_ext/set_ext infrastructure for bch_sb_field_ext options
:::::: branch date: 78 minutes ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050509.7HtNxcFX-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before that '*' (ctx:OxV)
#149: FILE: fs/bcachefs/opts.c:287:
+		.set_ext	= type_compatible_or_null(SET_##_sb_opt,*SET_BCH2_NO_EXT_OPT),	\
 		        	                                        ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
