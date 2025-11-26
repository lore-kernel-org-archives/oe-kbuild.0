Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A807F340DB0
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 20:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187771; cv=none; b=bXynbdAVrPwuPY2xo7vD/JZGc0WIj03uqHLvDEuY5bzuEXvbDYTojO7+9LSIlLw7+K/f84aImCHKGbKBmeALokXbKnrS3cnNz4b38NIHqW5wFMGJpQZ4246cUoA9vfOPQ0fPHM3W76bLUAYhx6UznRUYkIOLe8aWQn6DTbiOBqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187771; c=relaxed/simple;
	bh=xn2ape3dh3Qps5ruMTYyMs9GJEimvdFdo5YMRfbKJ8M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fYt20s0EUXLdrCFg9uh9apzXgiuo2vzb3/o3dcyHhHj/IZ+dq6R3yGs1uRj+R2/ErGJYVGC1JYCVIJCeEbzCoub/uQoL7ebU/dJJCV1vJeJTEqVR3AC7scyMLkKbw+rujJob23secDJUsYhiiExLqCdSW5sKMH1bbgKi0a4Yd1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WWUjaKuX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WWUjaKuX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764187769; x=1795723769;
  h=date:from:to:subject:message-id:mime-version;
  bh=xn2ape3dh3Qps5ruMTYyMs9GJEimvdFdo5YMRfbKJ8M=;
  b=WWUjaKuX1kyWG/zVo/elNPr0ZswHRcia7geP8ANEaw0v1/O+FDjMqvDB
   jUpLSmM4bqQNqlDmNww9QnVEirHo21lG7r7961/PlhC6ZVY9Q5F2bXXC1
   hcy/LEQsBicr3KAy74wJAr4sKdf4ko/nCuSNYBgifWi6WqYCg+Qz2I32d
   FCGV1jz18nCWMEazNnecF2BGjraFpcuF1EOULTvzkrUK51V/7lOXAUblE
   bBX6ipZE7ZOitlcrqIs+SBCwRSvHKS8idpT7vJW6dFU7CtHiOUR36x+FC
   tzhYUtkN+wSb+qrNdhxfZE1//s78paoizObjcWNPAS5Yzrkkt3usEVU42
   A==;
X-CSE-ConnectionGUID: 6zhvQq5PTwSVPGLzhbBl2g==
X-CSE-MsgGUID: c5YAXuYiSE6b4AQRj6YokQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77597404"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="77597404"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 12:09:29 -0800
X-CSE-ConnectionGUID: 41bRjMPPTMKTASGQGsG0eQ==
X-CSE-MsgGUID: dRn5rNz0TH2+uCmf29G5Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192289482"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 26 Nov 2025 12:09:26 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLpO-000000001UH-1L48
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 20:09:26 +0000
Date: Wed, 26 Nov 2025 21:08:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 999/999] checkpatch: ERROR:SPACING: space required
 after that close brace '}'
Message-ID: <202511262102.QmpzAhIL-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   e336760f1aaba6ace6f898616fd9234c99fd82fd
commit: e336760f1aaba6ace6f898616fd9234c99fd82fd [999/999] bcachefs: BCH_PATH_TRACEPOINTS()
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262102.QmpzAhIL-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that close brace '}'
#673: FILE: fs/bcachefs/debug/trace.h:58:
+	static inline void trace_##n(struct bch_fs *c, const char *s) {}\

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
