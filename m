Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E273A9D9D
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Apr 2026 21:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775855719; cv=none; b=lpnHAFGvegDIHzCl2hyzWVSeiitxRCt+0IOFavwbbZCo99NDrQiZjzRPgTaS7hcx4yo3iI896cfywjGaEXsJDVV16PLJziAIxqKimp6UDFP4HeTEM4AjlxeEqu8zPG4o1+Ec5LyrknoWWkeDaSEoetiHPHCEmtLnrnmzsUXr3rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775855719; c=relaxed/simple;
	bh=P4X3YTiHIE9qoXA2Io+ObDC+kQ+KERsFMDQMxGQOEBg=;
	h=Date:From:To:Subject:Message-ID; b=nEhhSk5C7SPXdYY5nbF2aTfVxVrfmA1lK8FSZV4RnpAQmNq6yxK/kNGV673zp6mhmkDA7CLr79GnCvWaYzBDaIdSQiWTrkD1Drd5EtIhYg237ExkW8m6w8nZJluyJsSpO1PB8kEL9V4VQpzzqW1glDITpXCZ9d7i9GH2ViVzDK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EU0saejY; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EU0saejY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775855714; x=1807391714;
  h=date:from:to:subject:message-id;
  bh=P4X3YTiHIE9qoXA2Io+ObDC+kQ+KERsFMDQMxGQOEBg=;
  b=EU0saejYp57xwVhTDtG1W3wohuu3xwaqdPmyZ4xQK4pmYHNZOXhmsmKH
   FTxAqblF+ka24JHR/lcIPrp1HyJhPZgiI9in7PFBQcnBpWLBa40i1TiLg
   2FAHBs5cs+kZkwlRDBFBSXxqP0z1vOWKsODOg6cK+OgkTvfZ/qO3Ei52l
   gyLXqOv8cQO+WNuL2cxVuxRZKCEQgTS+UHAuzKJzWX0zL+vaN27EJbg0B
   dACppEIE14i3xPKGDNjdc+dr1yAS0vdPVZ2LZeDDX8S2N0CjqfGp61YU5
   uHyRNRHUES5KBc0VI1JW2P6tvKb13xsojEjD86vSwCz72YM0uadqGZW35
   A==;
X-CSE-ConnectionGUID: /iNFrW71RsW6Ib+cpTFTOg==
X-CSE-MsgGUID: IIdLNiIjT4m5sqPuYRJJ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76954691"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76954691"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 14:15:13 -0700
X-CSE-ConnectionGUID: OEuXwREfRg6MUGzSSRaYtg==
X-CSE-MsgGUID: 92pqdLgxSeqMk1HnGAax3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="233257200"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 10 Apr 2026 14:15:13 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBJC2-00000000Awz-2Dmb
	for oe-kbuild@lists.linux.dev;
	Fri, 10 Apr 2026 21:15:10 +0000
Date: Fri, 10 Apr 2026 23:14:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tip:timers/urgent 2/2] checkpatch: WARNING:MINMAX: min()
 should probably be min_t(int64_t, delta, dev->max_delta_ns)
Message-ID: <202604102323.jrffJzk2-lkp@intel.com>
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
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
head:   d6e152d905bdb1f32f9d99775e2f453350399a6a
commit: d6e152d905bdb1f32f9d99775e2f453350399a6a [2/2] clockevents: Prevent timer interrupt starvation
:::::: branch date: 23 minutes ago
:::::: commit date: 23 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260410/202604102323.jrffJzk2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(int64_t, delta, dev->max_delta_ns)
#106: FILE: kernel/time/clockevents.c:333:
+		delta = min(delta, (int64_t) dev->max_delta_ns);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
