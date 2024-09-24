Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99EDB7F7DB
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Sep 2024 06:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727160791; cv=none; b=uxElg1YvgPm30ym4rysiOlT/vFZ//hq820QYDcGfl5aJcjcLZWytdbBJagj/ns8TkiCs0vaKqAJheO+l1msyQVp3Iqdm4izxOdu6n+n+nXkEcoKBQRa7Ly4wI2CbXckBoxfRb/jXiI0q5aq67b0Ltkndx9GCh87KfTDT4w0dUIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727160791; c=relaxed/simple;
	bh=2zlOyuXywd6XNMZYS3V8lDOXb+w1KhBhwrIBwuuqUo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dNzv3+DKsbwLh3MCkaSi9mfR+lCQxHFaoUqNtv6jM1CVXloMgnD61c01xUUd6gJPhY5CO+JLT46zP0u5viFCH7r+kQ8H+5567jRMVlwWD9qB+ae3xUFoHNvakd36JhIgFvK3sALrvjJvwP3lhDbglfP77EGx0qcJFGItZxZPsVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IbQ7sXZS; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IbQ7sXZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727160790; x=1758696790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2zlOyuXywd6XNMZYS3V8lDOXb+w1KhBhwrIBwuuqUo8=;
  b=IbQ7sXZSIGRxB36Pat9+3tl16NhHl1t/9bDeDLcS2fCMttAL5DBVkhx9
   nSD6TqXinNyx8MYyTo05l47BRwYsE3sxc4B3UjqNLsJx9+e76VNgtNSWc
   k6XEIOy4iJoPqlJErjN9w3zqNgkzzwLQp9UwdBZvKGkVRwQknxVYlWaBM
   0x36QRn1LXKCZ6xHEsmu8vLY65fEQWggIxpRVkZd04qkPJ4t03pTjvmeG
   Zjz8YDcRUmvn71PRDwfUVfplaecNo2S/3e30DWzzIEtp2xQYM/kEF2Gg/
   8JeH0SmddoV28dov5oZ4AGloLfHJeZie29OfPVzUc/3Hgw/peeb0Z3CyL
   w==;
X-CSE-ConnectionGUID: SBeP3ClmTN+XNpooNNu7AQ==
X-CSE-MsgGUID: 1LUSp3exSHOuKu19L1PGtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="51554663"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="51554663"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 23:53:08 -0700
X-CSE-ConnectionGUID: B/SDka0FQaqJQmLnikmivg==
X-CSE-MsgGUID: pOQ6tIoxRpK3Gs0x1M4OEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="71757962"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Sep 2024 23:53:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sszQ0-000I3F-0D;
	Tue, 24 Sep 2024 06:53:04 +0000
Date: Tue, 24 Sep 2024 14:52:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/opts.c:461 bch2_opts_to_text() warn: Function too hairy.
  No more merges.
Message-ID: <202409241440.G4japrG1-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   abf2050f51fdca0fd146388f83cddd95a57a008d
commit: 3621ecc10f831f4fd27784083dfaf5b8481098b5 bcachefs: bch2_opts_to_text()
date:   3 days ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 days ago
config: sparc-randconfig-r071-20240923 (https://download.01.org/0day-ci/archive/20240924/202409241440.G4japrG1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409241440.G4japrG1-lkp@intel.com/

smatch warnings:
fs/bcachefs/opts.c:461 bch2_opts_to_text() warn: Function too hairy.  No more merges.

vim +461 fs/bcachefs/opts.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  445  
3621ecc10f831f Kent Overstreet 2024-09-07  446  void bch2_opts_to_text(struct printbuf *out,
3621ecc10f831f Kent Overstreet 2024-09-07  447  		       struct bch_opts opts,
3621ecc10f831f Kent Overstreet 2024-09-07  448  		       struct bch_fs *c, struct bch_sb *sb,
3621ecc10f831f Kent Overstreet 2024-09-07  449  		       unsigned show_mask, unsigned hide_mask,
3621ecc10f831f Kent Overstreet 2024-09-07  450  		       unsigned flags)
3621ecc10f831f Kent Overstreet 2024-09-07  451  {
3621ecc10f831f Kent Overstreet 2024-09-07  452  	bool first = true;
3621ecc10f831f Kent Overstreet 2024-09-07  453  
3621ecc10f831f Kent Overstreet 2024-09-07  454  	for (enum bch_opt_id i = 0; i < bch2_opts_nr; i++) {
3621ecc10f831f Kent Overstreet 2024-09-07  455  		const struct bch_option *opt = &bch2_opt_table[i];
3621ecc10f831f Kent Overstreet 2024-09-07  456  
3621ecc10f831f Kent Overstreet 2024-09-07  457  		if ((opt->flags & hide_mask) || !(opt->flags & show_mask))
3621ecc10f831f Kent Overstreet 2024-09-07  458  			continue;
3621ecc10f831f Kent Overstreet 2024-09-07  459  
3621ecc10f831f Kent Overstreet 2024-09-07  460  		u64 v = bch2_opt_get_by_id(&opts, i);
3621ecc10f831f Kent Overstreet 2024-09-07 @461  		if (v == bch2_opt_get_by_id(&bch2_opts_default, i))
3621ecc10f831f Kent Overstreet 2024-09-07  462  			continue;
3621ecc10f831f Kent Overstreet 2024-09-07  463  
3621ecc10f831f Kent Overstreet 2024-09-07  464  		if (!first)
3621ecc10f831f Kent Overstreet 2024-09-07  465  			prt_char(out, ',');
3621ecc10f831f Kent Overstreet 2024-09-07  466  		first = false;
3621ecc10f831f Kent Overstreet 2024-09-07  467  
3621ecc10f831f Kent Overstreet 2024-09-07  468  		bch2_opt_to_text(out, c, sb, opt, v, flags);
3621ecc10f831f Kent Overstreet 2024-09-07  469  	}
3621ecc10f831f Kent Overstreet 2024-09-07  470  }
3621ecc10f831f Kent Overstreet 2024-09-07  471  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
