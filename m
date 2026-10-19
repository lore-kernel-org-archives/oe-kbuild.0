Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792438013;
	b=MVg0GMYrkcc0s5mmxQwEX2UYT9BCLy91wNcXYCDB9sJ3NFKTn+khcQBMJNWYTqg/odbB
	 j5c56Pb89KvuWz1fmb+1ZokaSssOgRoJ9xsVIaOHO/p8LDGkkOrmGovV08hfgdmIe4AoX
	 u2buH/b8UDzH1HtD1kPiEknc2abKP9tw5p3WqlLS7ByMNZP9btu1XBix1Agb80q5FLDEY
	 RSuRdrvkXJ6bJL+2h6uCG77d6rRgtDZNe7K72sSbzdiq9YP1c6Q5qE4c1dnJcKk9QQ2SN
	 QQj3HqbPmNnJddcbGEIyaESwFbRawST2z0MmttaCYYYD91aSb9q7yJZ7vLONwjcOd3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792438013;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=24F/ponevSkXVglabqA55Nlw6jsYPbmKsS34X97PfjQ=;
	b=eTvaEWS4VNeHi5B3gVOqaDV+PrTzb3Re34SPCLGkYr5haK0b6NPj71VFbhN3NxGY8j84
	 7xCnLVyRhlf85KeFNIEbEMxOgW2CMMlKbkMN3di9Ip531hP8duANFq0aIVxFTt2kX0Eau
	 10WKlCmdzcfn1iUYR2TgkDz6/EW7qvfvic2J5HGCOSdykXk1BzvgBa6XktAeM4AWY6Bxw
	 sN6E+3PnnX+Rn7qIhzSg7rBQ7dfRVZfboLUgTuh0vjEipPvyNeVcRKHYVbYHlZkdYiaeY
	 qL+6xCXp9WpIGhYO4WQRGT0cs9ttQnl6hIp8Ws7WSnFhcvok7LPOaaBXAS6X23+9ivw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PnoXXlDJ;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7AB606A31B
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 19:26:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A7AB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PnoXXlDJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792438013; x=1823974013;
  h=date:from:to:cc:subject:message-id;
  bh=UJzxJ3kcC3o9/2x5jKg7Yooz8UhTag7X0GbvJhKuY0A=;
  b=PnoXXlDJSwQE6ZYJiC4KHGuS/TPPZBIZkEikAGBiKqNCfNKs8aHheU7q
   jlQUpT5HzmDAz70DW6Q4XZwAU42KunUHU1ZF7ssF57ieHKwNBrjsxAzU0
   YkD2Op9KYOBgwF0Ff3JOPnInGT0cnrZ4JAmZRflVzJ8JJQky8u7RJweCt
   mmKiaphDMWCFxOD1sqWTTglK90jnyMXNmFmp251YAeRbIiLMs+lC9qKBf
   8hAPWM7/OMWGJdHiFuxVmUkRCKMjczGNYawX4rpC0rQISz9pBY6xGMiY8
   kcNUcZ/VHc0CRoJ+tWRlOTXwp43LVY5C20m0Z8Qj1k8nitA6qXNDt3j2D
   A==;
X-CSE-ConnectionGUID: aNHS+QISSu+Tpt63CeqE8g==
X-CSE-MsgGUID: 3Rew9+tiTZyc61ElvFIt0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1233314"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="1233314"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 12:26:52 -0700
X-CSE-ConnectionGUID: 1L9eAy4qS1+EVheXhmJJjw==
X-CSE-MsgGUID: 8oy2j4ODRZGRWkWjdrU2CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="3080613"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 19 Oct 2026 12:26:50 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIt0S-000000005r5-2VtL;
	Mon, 19 Oct 2026 19:26:48 +0000
Date: Mon, 19 Oct 2026 21:26:11 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cel:nfsd-testing 47/288] fs/nfsd/nfs4state.c:6197
 nfsd4_deleg_recall_rejected() warn: inconsistent returns '&clp->cl_lock'.
Message-ID: <202610192154.oZWxX8ca-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Chuck Lever <cel@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   b4e06bef38843c8b909d0b4317dfaaf87dba6d72
commit: bbfa823f624d41e85ebca929ac77dc2182cadfed [47/288] NFSD: Destroy a recalled delegation the client does not hold
:::::: branch date: 26 hours ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-2200-20261019 (https://download.01.org/0day-ci/archive/20261019/202610192154.oZWxX8ca-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610192154.oZWxX8ca-lkp@intel.com/

New smatch warnings:
fs/nfsd/nfs4state.c:6197 nfsd4_deleg_recall_rejected() warn: inconsistent returns '&clp->cl_lock'.

Old smatch warnings:
fs/nfsd/nfs4state.c:9065 init_lock_stateid() warn: inconsistent returns '&stp->st_mutex'.

vim +6197 fs/nfsd/nfs4state.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  6174  
bbfa823f624d41 Chuck Lever    2026-08-02  6175  /*
bbfa823f624d41 Chuck Lever    2026-08-02  6176   * cl_lock orders this against a laundromat reaping @dp: either
bbfa823f624d41 Chuck Lever    2026-08-02  6177   * revoke_delegation() observes dl_recall_rejected and destroys @dp, or
bbfa823f624d41 Chuck Lever    2026-08-02  6178   * it reached cl_revoked first and @dp is released here instead.
bbfa823f624d41 Chuck Lever    2026-08-02  6179   */
bbfa823f624d41 Chuck Lever    2026-08-02  6180  static void nfsd4_deleg_recall_rejected(struct nfs4_delegation *dp)
bbfa823f624d41 Chuck Lever    2026-08-02  6181  {
bbfa823f624d41 Chuck Lever    2026-08-02  6182  	struct nfs4_client *clp = dp->dl_stid.sc_client;
bbfa823f624d41 Chuck Lever    2026-08-02  6183  
bbfa823f624d41 Chuck Lever    2026-08-02  6184  	spin_lock(&clp->cl_lock);
bbfa823f624d41 Chuck Lever    2026-08-02  6185  	if (dp->dl_stid.sc_status & (SC_STATUS_CLOSED | SC_STATUS_FREED |
bbfa823f624d41 Chuck Lever    2026-08-02  6186  				     SC_STATUS_ADMIN_REVOKED)) {
bbfa823f624d41 Chuck Lever    2026-08-02  6187  		spin_unlock(&clp->cl_lock);
bbfa823f624d41 Chuck Lever    2026-08-02  6188  		return;
bbfa823f624d41 Chuck Lever    2026-08-02  6189  	}
bbfa823f624d41 Chuck Lever    2026-08-02  6190  	if (dp->dl_stid.sc_status & SC_STATUS_FREEABLE) {
bbfa823f624d41 Chuck Lever    2026-08-02  6191  		dp->dl_stid.sc_status |= SC_STATUS_CLOSED;
bbfa823f624d41 Chuck Lever    2026-08-02  6192  		/* this function drops ->cl_lock */
bbfa823f624d41 Chuck Lever    2026-08-02  6193  		nfsd4_drop_revoked_stid(&dp->dl_stid);
bbfa823f624d41 Chuck Lever    2026-08-02  6194  		return;
bbfa823f624d41 Chuck Lever    2026-08-02  6195  	}
bbfa823f624d41 Chuck Lever    2026-08-02  6196  	dp->dl_recall_rejected = true;
bbfa823f624d41 Chuck Lever    2026-08-02 @6197  	spin_unlock(&clp->cl_lock);
bbfa823f624d41 Chuck Lever    2026-08-02  6198  }
bbfa823f624d41 Chuck Lever    2026-08-02  6199  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
