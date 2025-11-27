Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B2623AB95
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 02:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764211235; cv=none; b=mpMlJsC9TaEPYPFn3g/n/6yY7DuCu+mCnX36GV+0ZRGy9qumpceppWn38M5rYx+a5DGqJTlGylNSNvHqS6gMwzSp69UXQwi83TZoWpluQogdJNNFUDTUcznpFO1I+JBox3uDCbfemTOt/4bPxsu036jgDVW5oPfH5IX4mbnNI+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764211235; c=relaxed/simple;
	bh=HG1s1Nqjd/QWOsa1PlIBOv39jE+o24kXVBRECH3u6qU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VW0SZfn8GSx8k3v7xdf8ICGJczTk2VzeBhuMF6vX0x5KV+ZzSIP/ox+GAGlGpUBAIQs40uglwVtsjb0kNF8Pe3qa3vyBTWaMuQhDuVtb6YWOvt1mDF50MKZagGHU1mEnFayd60q2k/3cyS09IaC7ayoGJnEmYcqxNvbENbyzPcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DApSmWOb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DApSmWOb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764211235; x=1795747235;
  h=date:from:to:subject:message-id:mime-version;
  bh=HG1s1Nqjd/QWOsa1PlIBOv39jE+o24kXVBRECH3u6qU=;
  b=DApSmWObUPsTq7ixiX83hwKDlCzQgjkXAzsEYiWiY6Ggqc8+oAEJBYYE
   yViF3hYwUktq0grryMpFhIrqvdr8Z4aVAkEaaL5Lz/nY3M57jdcBki7JK
   6GKDblHUdlx+uUZFHUpBT6sg+Wu/0iA4x4HwlHQxECZX0LbMLMMMRlqlE
   L9OO9Y66njCNCbfLHuXgBuVnpGQUuVxTVN5wXJE2hy4Iw+CZpJnWPQTE9
   Uz3iCDLO2zS9tbXr93KjCQgowg0TQEiTl1E10rlDyqbLyMyMWlbcAVpIR
   IzBH5Myftr1NX9GjJ7u3KKWpA1IwnKkS+1dQ3360X6V9FRsGatkXLQCHw
   w==;
X-CSE-ConnectionGUID: A55iOGn7QdeoBoCZXtoVwg==
X-CSE-MsgGUID: ryb4pXdtTYyQY+2cDzxw4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="69877460"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="69877460"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 18:40:34 -0800
X-CSE-ConnectionGUID: /O7zROjvSlK8rJnROsVx/Q==
X-CSE-MsgGUID: NFhgmJchT2uFo3ChtZ9weQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="198226081"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Nov 2025 18:40:33 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vORvr-000000001at-0rII
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 02:40:31 +0000
Date: Thu, 27 Nov 2025 03:40:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 30/82] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'code'
Message-ID: <202511270300.nC8Zlnhb-lkp@intel.com>
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
commit: 4a3699ff1c256ab3648d80345dfb8d49819b58bf [30/82] fuse: make debugging configurable at runtime
:::::: branch date: 36 minutes ago
:::::: commit date: 36 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270300.nC8Zlnhb-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'code'
#28: FILE: fs/fuse/Kconfig:104:
+	  Say N here if you don't want any debugging code code compiled in at

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
