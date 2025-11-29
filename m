Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88BC61A267
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 21:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764452355; cv=none; b=HQHKe1nncdQipskaIjNmP8qIL5/nj1RR23zZNBdj2Ad4gZZGM3dJ3Xpo7TvYFySiY+eIXwJOr25Bsk3t/OC5sRbcJyuzqmZkRKXUEJubxEnet73RaFxg8ztdGxadCAzVNVOLBmo/m6cKm4BP1cqI3/bojDS/dKNnYf1AfxR//Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764452355; c=relaxed/simple;
	bh=AvIhLEwbYAx80ohUkTNkgDjCqp7tYxh6aXhaZILmACs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NwxRXY8gqcKqMcRjKpzBbp7ev1zgreGrZS1h8isZ0CRZnPCpABd86v7+Qkii3K5rdbya08q6NhDgX3TY/+p79LAkawi5YJOAr47qimKirxe/tZrCCRFmAdjq/ixCS0ddHbbA3sMBY6TZKZPJMZKXtq1PZuD+xrAtXTFQdRUp9go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgFxXcim; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgFxXcim"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764452354; x=1795988354;
  h=date:from:to:subject:message-id:mime-version;
  bh=AvIhLEwbYAx80ohUkTNkgDjCqp7tYxh6aXhaZILmACs=;
  b=NgFxXcimOsbPRmWPpXfkx7F3FNwPit9/L/T4bBx6F30pJH6Rf/9nPhMG
   QFGm9SFsX6e5KgofLXl9GPJM+Aow9p18z6GkuZBiABmyIQ/PMdXwlRuTA
   kiMAxlA8ctlaENIwOIaC0q8tXr4Ze1X77Fta36Y+0GInnLP3t92DxkzDU
   JqEO+e1dexd/Frl/vbyu25YqT/klvNn0hGesPYqUBizXoDoakKSY9YIcx
   6CqqDnZIl4PDKLKVJGHFkpEHkTq6/0aU/9swD5MXXY8v5xi+L9LKERH+0
   YunTLoAhO9bPcKdutyz3x2A3rYcFhxzlwKjjLy75XjfOlx4yBABkO0icT
   A==;
X-CSE-ConnectionGUID: fPkDdBvmRI6opkNrvTFavA==
X-CSE-MsgGUID: 8ArZ0kOqRWCd3Q9sZ575vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="65617047"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="65617047"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 13:39:13 -0800
X-CSE-ConnectionGUID: fPRU+uPmQCimO3/IcWsXIw==
X-CSE-MsgGUID: hK4PQpnbRE+2jZF5Fet4+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="193620529"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 29 Nov 2025 13:39:12 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPSes-000000002Px-1siO
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 21:39:10 +0000
Date: Sat, 29 Nov 2025 22:38:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 52/58] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'user'
Message-ID: <202511292222.Qc2Uwuid-lkp@intel.com>
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
TO: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   ef7b2f46f63cd48b4453a9634d910f211aeb9eff
commit: 7061130fb391944a0553e557e5c25abbbeaca115 [52/58] liveupdate: luo_flb: introduce File-Lifecycle-Bound global state
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511292222.Qc2Uwuid-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'user'
#25: 
This patch does not have current user user, but multiple streams depend on

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
