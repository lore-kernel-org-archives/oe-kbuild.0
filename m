Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0489B26CE1A
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 02:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764211115; cv=none; b=XJb5BBYXmRhkqi92bf27+/qu5AsPDprTCmz8lCT+uBg1vehjmGMoMYPW+Mb6BeFByYGfDsyETmWxWA1xpLATQCDX1fGGg+ia8Z7V+CpT81ezuW4dZSJni/FjejE0m/16HsbRXtTO8yCj4x6gWDTlI2duRxArLWLUJ6zDLGtXamo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764211115; c=relaxed/simple;
	bh=ZWdwOaNjyMtVza9tD57IDUu5UQizEn0q2G7C5IKuju4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qHfuMJTkV69WtTw9SluSPz2UjD+PXjv+/jV2NFz17Vq3eoXiZ4D9mhz3QcvyG0jrqt3jEDjBkHEdm34msjupvQlUEKJ/Tjnbrv6CSAbEsaGzfBn24SD6Q4ZBu0Ju28HV4VUb1QEkvkortkgaph1bHqh3JC0DqdkefSMytnl3C0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KO3u5PZO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KO3u5PZO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764211114; x=1795747114;
  h=date:from:to:subject:message-id:mime-version;
  bh=ZWdwOaNjyMtVza9tD57IDUu5UQizEn0q2G7C5IKuju4=;
  b=KO3u5PZOlsTmT+jQOUAWtEy6j2bot6HIMXpuJCVN3cEkckwWATGxmz87
   wbA0NkBdLl1amD/kj1S1wEMtXuEc7aLQmtD1jD2M3soXj7xGxRN+CbClr
   HeN8hRIjQYMdhYIZeBaS+wK5limeK9LaIGl+baESU3Y9lHYSbEBUKoOpI
   3pLpI/d9EHm6dUIMEqtEHpFM3dqSl8Pu9n4Qjg6Kj41TQukOM5tQH7+Bo
   Y2RjmqPDY/11Ijk7VZMC03JxkhEnCodMLCNpxQCfzhWZK4ZyXO7fqLzcI
   /o+RgXO4tg8zEJQA5bNFvwCGjpND63MEMGObf+vdLBydL7Dvnk2BdTSAc
   w==;
X-CSE-ConnectionGUID: hoSSOibNTSyOZeIYBFhSew==
X-CSE-MsgGUID: WP3TaT8qQUWMMouHFi4uxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65442252"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="65442252"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 18:38:33 -0800
X-CSE-ConnectionGUID: 7RTgeko9Q+y4qtKEmqScug==
X-CSE-MsgGUID: 7iDOTP58RTeC4x0WsuP+zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="198059667"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 26 Nov 2025 18:38:33 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vORtv-000000001aZ-02o1
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 02:38:31 +0000
Date: Thu, 27 Nov 2025 03:38:11 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 7/82] checkpatch:
 WARNING:SPACING: space prohibited between function name and open parenthesis
 '('
Message-ID: <202511270348.DQxJRuB5-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   69ff58bd20a3f25ce91f1ff72a2063b65463142b
commit: d28263dba28e643c7da6ae0db7dd1beff269149e [7/82] xfs: start creating infrastructure for health monitoring
:::::: branch date: 33 minutes ago
:::::: commit date: 34 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270348.DQxJRuB5-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#61: FILE: fs/xfs/libxfs/xfs_fs.h:1052:
+#define XFS_IOC_HEALTH_MONITOR	_IOW ('X', 68, struct xfs_health_monitor)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
