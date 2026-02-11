Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BAA305E1F
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Feb 2026 05:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770786864; cv=none; b=MfPX4evBJEAh9SxvNoBuEuiqxD8PtcUjt7N2m/j0Cwk9FX7NfmL4iZw1ONq/252vPT4B5Cg5GaNZa9JQEC3OFV3khoRMytM2v6s7AOHZoz2z+wmLm7e+4BixiKCFu5ON2adJFzD4poT/rRaSJxRDhsuWvYnVeCkboZqJ3Hd1mRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770786864; c=relaxed/simple;
	bh=5P5yJwL41IyOA9oM6lserv804HED6L7fVpoN/q43LQk=;
	h=Date:From:To:Subject:Message-ID; b=aPqQCckWINdCh9mdT60WkkdWL2pAqG5SZfmCQMOEJeghXdN9iwFn/gTXVVaiHthhBDy/mrYyF4qBctRYiSSftuH/O9O6UTh4zSzyp+qgu9HXjTRPDmSb3CqtcDcubPZ5GzrN8GOoR2kRDOL7QGyYUrdZS1W6USpY+vnvK4yWWY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KroNIYI0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KroNIYI0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770786864; x=1802322864;
  h=date:from:to:subject:message-id;
  bh=5P5yJwL41IyOA9oM6lserv804HED6L7fVpoN/q43LQk=;
  b=KroNIYI0HNupXZB11w1dre267m9YsABpiBakjw8ZlrXobSBGW0lAvW91
   iL6iAPtnr7eJUQizAyLCScS4A6Gd8HLNVYmRgeymBe0O1/Fty4v6omJ5V
   PY0uHWEp3V1JoPxQZL9q24tyPlnSEnmKW0CTPDrZNGt95xyovf9sRn8WJ
   s34D34K+bNOYn3lAkXKP8j1xkYPs66GpY4qvQYttUkm5LrL6wLvP5Ce8W
   Kqtwmtw0rBenaMH3l0i21va1OxODCnXvO69Kj7CDMOKrEfMMGVRpjBCMe
   eTcwcoPvx7JuQ41qPmhZ536SnZHuqRcGpomWReMyvtmIag8vBTooHC0S0
   A==;
X-CSE-ConnectionGUID: U60vkxlZTY+EFyrTYjpBDw==
X-CSE-MsgGUID: ztbdaVxBTcuEi5THqdq8LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="97383822"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="97383822"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 21:14:23 -0800
X-CSE-ConnectionGUID: WVboPDatQT2DseAle8JBQg==
X-CSE-MsgGUID: CvuuRUrZQr293eEw+wx9oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="241985013"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2026 21:14:23 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq2YO-00000000119-3Jvh
	for oe-kbuild@lists.linux.dev;
	Wed, 11 Feb 2026 05:14:20 +0000
Date: Wed, 11 Feb 2026 06:13:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [kdave-btrfs-devel:misc-6.20 139/147] checkpatch:
 WARNING:BAD_SIGN_OFF: Unexpected content after email: 'David Sterba
 <dsterba@suse.com>,', should be: 'David Sterba <dsterba@suse.com>'
Message-ID: <202602110657.5smdlBUW-lkp@intel.com>
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
TO: Adarsh Das <adarshdas950@gmail.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-6.20
head:   864bab7e8219f9260c99a487d2a2a84dc6f76f64
commit: db1549dfbb9d61a416ec3384f1a91e1bfee61b73 [139/147] btrfs: handle unexpected exact match in btrfs_set_inode_index_count()
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260211/202602110657.5smdlBUW-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'David Sterba <dsterba@suse.com>,', should be: 'David Sterba <dsterba@suse.com>'
#13: 
Reviewed-by: David Sterba <dsterba@suse.com>,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
