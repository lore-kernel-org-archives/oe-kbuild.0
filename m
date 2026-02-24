Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B869536AB74
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 12:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936005; cv=none; b=kNkAQJn1liGMTsIHQsR+ThPbnYtsgs1nJ8p9aqTpMauUy/RPoenACHevdwl52ACeEBMiFcBzYckZ23+hrhxrAY6qV12Sa2rtbuYwQACA/0PUS6izttUH8FxD6gIHBH0KCj2zl4GJFx+K24eRsNAhDI6rB+FyzK2Q7nmbOAs93Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936005; c=relaxed/simple;
	bh=LJVU5V2MeEaeHJPNJB9jG7/n08tp4tRncOu//kHUiig=;
	h=Date:From:To:Subject:Message-ID; b=MEkn00lqgm/1zQsXMkgmJUvkQ38WQ48IfrKCLDvzeZ6ag6nuGYbJli9gxymjKYEznnQ3s+JaisF2U4JyguFGvcZyUgDKuC2rvodyGhP58eJ1XcS/aCnSWb52XXoVE3VSFVtXnV775rXUP5v1wTwr1EYTv6BRH31BXNl+DqXWzuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2gYYu8C; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2gYYu8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771936004; x=1803472004;
  h=date:from:to:subject:message-id;
  bh=LJVU5V2MeEaeHJPNJB9jG7/n08tp4tRncOu//kHUiig=;
  b=R2gYYu8Cryv45sZHEkcFZ6mhUV3h3Gq3qcF1eFcKggZ31Ye7NPywsnGL
   kCIhy6N+UVyE8zYWQ6E6rkWL9bWLLztwb0zLl1ignAUHRmr+eqDBg6ReG
   7c5S6Dd0KjcCBjzz0/Zrgo+OKlnrUfg0+XBzuzmp3Xn3sLg5FmlxBu8O0
   okx9DNYQn64I2HsrL4Ike5/YFreW5P+ZEXnoK3ElxquvyWTnWRkL317JR
   5qbo4jnLEjG+3Qvn8T8GKPVJt6TBFjNmSLl4+vVY/EPpwivzDS6Ni3ZC6
   Au4vZx//bGI7cCWD7I9OR8R0nhj94uAYsv+Uvkoq0CP4g1T7OBRzZa6RU
   A==;
X-CSE-ConnectionGUID: mzMh4SvJRQmWYpNt+m9Ejg==
X-CSE-MsgGUID: ELqmOzP8Qf6akIxU1Q9YVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72921397"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72921397"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:26:44 -0800
X-CSE-ConnectionGUID: cPjgDMBVTDaKb7SmFDp9kg==
X-CSE-MsgGUID: gTlkNeOcSmOyy/e0V+/mYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="214129530"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Feb 2026 04:26:42 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vurUu-000000005Gp-2PeB
	for oe-kbuild@lists.linux.dev;
	Tue, 24 Feb 2026 12:26:40 +0000
Date: Tue, 24 Feb 2026 13:26:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [arnd-playground:randconfig-7.1-next 653/733] checkpatch:
 ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
Message-ID: <202602241302.7MmeURl3-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.1-next
head:   76f9bd9e344ecd3faf7bdadedc7027b64a6f2d63
commit: 33b91cdd217c0d8551990053ea94f80272317f04 [653/733] Revert "[SUBMITTED 20250807] mtd: dc21285: fix bytewise memcpy()"
:::::: branch date: 2 hours ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260224/202602241302.7MmeURl3-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#29: FILE: drivers/mtd/maps/dc21285.c:132:
+	d.x[0] = *((uint8_t*)from);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
