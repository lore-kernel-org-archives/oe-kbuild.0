Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA38167DB4
	for <oe-kbuild@lists.linux.dev>; Wed, 29 May 2024 23:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717025057; cv=none; b=uzYNcgDLkxCwYQm5JCERSPz4o6+6aINngBdDehLZPcCxpRgnRMVxXpKw1jmcu5sOJ7AM7Lyq7hc/zwIMduQIDeWB74kR0+rrXtyEe2KRjYbDR9wMcjp74YIkI5z+Nt6mey4hNnRKS0gphe429KXS3xYDth4nzU0aqVq1i6TwYaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717025057; c=relaxed/simple;
	bh=GGVcLYCamDE5iBLBMmZz4ET4HExMrh/ptWAisyW4WBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=om/udDCx5cugZkpUnmVckXEszDcNHYxBfORGDV6fOs8Nq2S1fjMSYIOKMq1MNub6/Va3XZWhA76UCNvNjCw5C+iZQlVPZ+s+GN/UHzVvUoUfzPsN95NoLMLJ7HAHWQezUzqE6bZKKUwGuWwxowwZu8cLg1EgljbVHfpB26IWJsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TW8rU/Ht; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TW8rU/Ht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717025055; x=1748561055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GGVcLYCamDE5iBLBMmZz4ET4HExMrh/ptWAisyW4WBc=;
  b=TW8rU/HtgFcxXcBhffBAf4Kv2jrjpJ0uyo1sKrDlqof2YqwX7rGKexFA
   GM0v5mP7VEFAA9REAcRxMp2zE17nGZw9kBA6U3jdygVMBmCElZeA/fX9b
   9AWQ15TQhLYKEx+/bNl/ivl9yXi39SF2DJPktyfa8CVCF1ZQaRQ29VsQS
   hoLjytSw2o5wFuMF6V5FcKIPDs+Tn6jWJ0BGNUHjiQYPNIUmYFy+dpEzF
   e7qdW9bEArdKXrGuH7Pjr6mekSVqVsUBmSUD5kDe7QufLJvC1QJKhcaeK
   WDMNLNpdv40JJ13jmI6ignpYdi4QTGC5lT5jwzixudxnDCPIuU93p9S44
   w==;
X-CSE-ConnectionGUID: bGM5fe9mSyeMJW7pRqhNOg==
X-CSE-MsgGUID: nFD2eQw+SaGv0dVRTDih+A==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24880576"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="24880576"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 16:24:10 -0700
X-CSE-ConnectionGUID: oaGR+8MwRuOxMCiwMat5EQ==
X-CSE-MsgGUID: E84lwp9XRtWgayMoM3U0rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="35701235"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 May 2024 16:24:08 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCSeM-000EJv-0W;
	Wed, 29 May 2024 23:24:06 +0000
Date: Thu, 30 May 2024 07:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:bcachefs-testing 53/79] fs/bcachefs/fs.c:1747
 bch2_remount() error: uninitialized symbol 'ret'.
Message-ID: <202405300719.uaipPzZD-lkp@intel.com>
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
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Thomas Bertschinger <tahbertschinger@gmail.com>
CC: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   fb868ed1f18b44700bfe55b8a39aa7d1244cbdc5
commit: 6223304fab6387f4fdefd0681dd88a76b06f960f [53/79] bcachefs: use new mount API
:::::: branch date: 3 hours ago
:::::: commit date: 23 hours ago
config: x86_64-randconfig-161-20240529 (https://download.01.org/0day-ci/archive/20240530/202405300719.uaipPzZD-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405300719.uaipPzZD-lkp@intel.com/

smatch warnings:
fs/bcachefs/fs.c:1747 bch2_remount() error: uninitialized symbol 'ret'.

vim +/ret +1747 fs/bcachefs/fs.c

1c6fdbd8f2465d Kent Overstreet     2017-03-16  1711  
6223304fab6387 Thomas Bertschinger 2024-05-27  1712  static int bch2_remount(struct super_block *sb, int *flags,
6223304fab6387 Thomas Bertschinger 2024-05-27  1713  			struct bch_opts opts)
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1714  {
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1715  	struct bch_fs *c = sb->s_fs_info;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1716  	int ret;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1717  
62719cf33c3ad6 Kent Overstreet     2023-12-23  1718  	opt_set(opts, read_only, (*flags & SB_RDONLY) != 0);
62719cf33c3ad6 Kent Overstreet     2023-12-23  1719  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1720  	if (opts.read_only != c->opts.read_only) {
1ada160618d66b Kent Overstreet     2020-06-15  1721  		down_write(&c->state_lock);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1722  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1723  		if (opts.read_only) {
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1724  			bch2_fs_read_only(c);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1725  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1726  			sb->s_flags |= SB_RDONLY;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1727  		} else {
134915f3d38d83 Kent Overstreet     2019-03-21  1728  			ret = bch2_fs_read_write(c);
134915f3d38d83 Kent Overstreet     2019-03-21  1729  			if (ret) {
134915f3d38d83 Kent Overstreet     2019-03-21  1730  				bch_err(c, "error going rw: %i", ret);
1ada160618d66b Kent Overstreet     2020-06-15  1731  				up_write(&c->state_lock);
5c1ef830f67860 Kent Overstreet     2022-09-18  1732  				ret = -EINVAL;
5c1ef830f67860 Kent Overstreet     2022-09-18  1733  				goto err;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1734  			}
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1735  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1736  			sb->s_flags &= ~SB_RDONLY;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1737  		}
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1738  
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1739  		c->opts.read_only = opts.read_only;
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1740  
1ada160618d66b Kent Overstreet     2020-06-15  1741  		up_write(&c->state_lock);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1742  	}
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1743  
96dea3d599dbc3 Kent Overstreet     2023-09-12  1744  	if (opt_defined(opts, errors))
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1745  		c->opts.errors = opts.errors;
5c1ef830f67860 Kent Overstreet     2022-09-18  1746  err:
5c1ef830f67860 Kent Overstreet     2022-09-18 @1747  	return bch2_err_class(ret);
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1748  }
1c6fdbd8f2465d Kent Overstreet     2017-03-16  1749  

:::::: The code at line 1747 was first introduced by commit
:::::: 5c1ef830f6786059f85bebe7501b63dffed0b633 bcachefs: Errcodes can now subtype standard error codes

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
