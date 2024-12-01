Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693522CA8
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Dec 2024 04:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733028735; cv=none; b=uZy6Q23ImAPTfIRQDdG7cL/RiVvwJ0ny/NfUnAnLWSqx7ILiAMWt8lt1EJxi2UXpE6shzgsJE0b1qWPRgwzZu46HX8aohxothe/9fUmrUE8T3xTJDD+YoGDGEmufvjxn8ZOMurDfs6tuqGDapcM+F4tbIrHK559yG9pol/wYKmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733028735; c=relaxed/simple;
	bh=X4vtoChud8h445UW/r6VQgFo7MwyuM8D/sofLMtESts=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOa9TSBqMMKT+Zacfj11h6NezercGpqPT1kDb65tJqyvvnmBcXfU0Ff/go5i3w8D9wJc330uPvQnCPaWxRp+EsCRCpaMOMiItNUuXZc0rx7WXoogb2g7WQoc1bo67cVKPLcWNF+VS+bM9zqxsoIOVRGxAyAUFlc7ULYiu728Nxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WrxcfCqQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrxcfCqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733028733; x=1764564733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X4vtoChud8h445UW/r6VQgFo7MwyuM8D/sofLMtESts=;
  b=WrxcfCqQir2vDh3fsu7aE+FjgqN1AA8e0a/DneM37BwPTm88PJjajjYr
   Guouewi+kiAM4bQ4b3Raoz3z5InTQoBdjG4W4Net2qyEIe9cbjV2cJUJX
   K/NEAdEDO2QNuwrndJ5xkkpr/Vno/jrZk+25t0Zqi1124F5YZ9NVhyeGB
   f3TuGM4d8YDnTfJHn0rqSS0svbYn0zKZ4WhTLYnuTj1S4qQSJkt8TnVJq
   y3sajjp7Z33nhMMApqBfvV4G0Kx6td2k+GAWGZ3ADIA/8CKnarbM2rBEh
   ONlsr6VbiObCfm31LyEx2Fn27Mmu8+R3OpvLamTM/EcfHrJCOnjzWdm+L
   A==;
X-CSE-ConnectionGUID: YxjX99t7Td2Aw0SG/mHRag==
X-CSE-MsgGUID: u0QAagMvSn+e1ROOmMKq3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="44579918"
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="44579918"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 20:52:12 -0800
X-CSE-ConnectionGUID: YYcPkX6dQDqefJpESu6geQ==
X-CSE-MsgGUID: udnCRrK1THe7Z7xaWPFcMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,199,1728975600"; 
   d="scan'208";a="93622219"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 Nov 2024 20:52:11 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHbvA-0001FU-1H;
	Sun, 01 Dec 2024 04:51:29 +0000
Date: Sun, 1 Dec 2024 12:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/xfs/scrub/orphanage.c:495:9-16: Missing call to dput() at line
 501.
Message-ID: <202412011221.4Ql7F01r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Darrick J. Wong" <djwong@kernel.org>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bcc8eda6d34934d80b96adb8dc4ff5dfc632a53a
commit: 5e1c7d0b29f7e05b01e448d2579a469cf3a0d350 xfs: invalidate dentries for a file before moving it to the orphanage
date:   7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 months ago
config: parisc-randconfig-r054-20241115 (https://download.01.org/0day-ci/archive/20241201/202412011221.4Ql7F01r-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412011221.4Ql7F01r-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/orphanage.c:495:9-16: Missing call to dput() at line 501.

vim +495 fs/xfs/scrub/orphanage.c

73597e3e42b4a1 Darrick J. Wong 2024-04-15  460  
73597e3e42b4a1 Darrick J. Wong 2024-04-15  461  /*
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  462   * Invalidate all dentries for the name that was added to the orphanage
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  463   * directory, and all dentries pointing to the child inode that was moved.
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  464   *
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  465   * There should not be any positive entries for the name, since we've
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  466   * maintained our lock on the orphanage directory.
73597e3e42b4a1 Darrick J. Wong 2024-04-15  467   */
73597e3e42b4a1 Darrick J. Wong 2024-04-15  468  static void
73597e3e42b4a1 Darrick J. Wong 2024-04-15  469  xrep_adoption_zap_dcache(
73597e3e42b4a1 Darrick J. Wong 2024-04-15  470  	struct xrep_adoption	*adopt)
73597e3e42b4a1 Darrick J. Wong 2024-04-15  471  {
73597e3e42b4a1 Darrick J. Wong 2024-04-15  472  	struct qstr		qname = QSTR_INIT(adopt->xname->name,
73597e3e42b4a1 Darrick J. Wong 2024-04-15  473  						  adopt->xname->len);
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  474  	struct xfs_scrub	*sc = adopt->sc;
73597e3e42b4a1 Darrick J. Wong 2024-04-15  475  	struct dentry		*d_orphanage, *d_child;
73597e3e42b4a1 Darrick J. Wong 2024-04-15  476  
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  477  	/* Invalidate all dentries for the adoption name */
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  478  	d_orphanage = d_find_alias(VFS_I(sc->orphanage));
73597e3e42b4a1 Darrick J. Wong 2024-04-15  479  	if (!d_orphanage)
73597e3e42b4a1 Darrick J. Wong 2024-04-15  480  		return;
73597e3e42b4a1 Darrick J. Wong 2024-04-15  481  
73597e3e42b4a1 Darrick J. Wong 2024-04-15  482  	d_child = d_hash_and_lookup(d_orphanage, &qname);
73597e3e42b4a1 Darrick J. Wong 2024-04-15  483  	while (d_child != NULL) {
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  484  		trace_xrep_adoption_invalidate_child(sc->mp, d_child);
73597e3e42b4a1 Darrick J. Wong 2024-04-15  485  
73597e3e42b4a1 Darrick J. Wong 2024-04-15  486  		ASSERT(d_is_negative(d_child));
73597e3e42b4a1 Darrick J. Wong 2024-04-15  487  		d_invalidate(d_child);
73597e3e42b4a1 Darrick J. Wong 2024-04-15  488  		dput(d_child);
73597e3e42b4a1 Darrick J. Wong 2024-04-15  489  		d_child = d_lookup(d_orphanage, &qname);
73597e3e42b4a1 Darrick J. Wong 2024-04-15  490  	}
73597e3e42b4a1 Darrick J. Wong 2024-04-15  491  
73597e3e42b4a1 Darrick J. Wong 2024-04-15  492  	dput(d_orphanage);
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  493  
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  494  	/* Invalidate all the dentries pointing down to this file. */
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22 @495  	while ((d_child = d_find_alias(VFS_I(sc->ip))) != NULL) {
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  496  		trace_xrep_adoption_invalidate_child(sc->mp, d_child);
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  497  
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  498  		d_invalidate(d_child);
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  499  		dput(d_child);
5e1c7d0b29f7e0 Darrick J. Wong 2024-04-22  500  	}
73597e3e42b4a1 Darrick J. Wong 2024-04-15 @501  }
73597e3e42b4a1 Darrick J. Wong 2024-04-15  502  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
