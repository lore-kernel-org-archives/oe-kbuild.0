Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1D69444
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 05:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTJR83Ih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699247700; x=1730783700;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KFw7CbUIBmME5dC0HwRojjaRlMnezaZqTcGHsqwHZGw=;
  b=HTJR83IhfUxEH/H9iRB1MACXAvcgi4Mw5jkm3Y2DPRy/yfpQ4i/0mxL7
   IvRBI693P58ZdeWFxIOiP8gPS5XnLEVBVjYUhNarJbTtbmIiysgZ2jB8C
   k3sk5A8reb61ih44YSyXTG1dpzXdAbgf/wGYu2tlCj2/traQAJGn4tWUs
   QMwe01Xe1v7gi87AFOBAXGRRI94QPIzR5tvk1EcAAqawmvhvwRRq9xTcH
   Hty4NhZsfgi84q5TGeYnq2RWZW7XIJzhf45OFVSJ7c/LjQWIwcFojZ2Rg
   APycnaLXs13YXjb0GW/2wqgC1NnRGPfS55+BMnmuw8VvI2ixmFU8YkO8U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455692087"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="455692087"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 21:14:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="712094291"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="712094291"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 05 Nov 2023 21:14:58 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzrwu-00068B-08;
	Mon, 06 Nov 2023 05:14:56 +0000
Date: Mon, 6 Nov 2023 13:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/super.c:396 __bch2_fs_read_write() warn: missing unwind
 goto?
Message-ID: <202311061320.PGYyDFEl-lkp@intel.com>
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
TO: Kent Overstreet <kmo@daterainc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: 5f5c74661713327309f124e247de61db6729bc3d bcachefs: Start copygc when first going read-write
date:   2 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231106/202311061320.PGYyDFEl-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231106/202311061320.PGYyDFEl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311061320.PGYyDFEl-lkp@intel.com/

New smatch warnings:
fs/bcachefs/super.c:396 __bch2_fs_read_write() warn: missing unwind goto?

Old smatch warnings:
fs/bcachefs/super.c:1923 bch2_fs_open() warn: variable dereferenced before IS_ERR check 'c' (see line 1914)

vim +396 fs/bcachefs/super.c

134915f3d38d83 Kent Overstreet 2019-03-21  343  
e731d466d2ba02 Kent Overstreet 2019-12-26  344  static int __bch2_fs_read_write(struct bch_fs *c, bool early)
134915f3d38d83 Kent Overstreet 2019-03-21  345  {
134915f3d38d83 Kent Overstreet 2019-03-21  346  	struct bch_dev *ca;
134915f3d38d83 Kent Overstreet 2019-03-21  347  	unsigned i;
134915f3d38d83 Kent Overstreet 2019-03-21  348  	int ret;
134915f3d38d83 Kent Overstreet 2019-03-21  349  
aae15aafcd43ec Kent Overstreet 2021-04-24  350  	if (test_bit(BCH_FS_INITIAL_GC_UNFIXED, &c->flags)) {
aae15aafcd43ec Kent Overstreet 2021-04-24  351  		bch_err(c, "cannot go rw, unfixed btree errors");
aae15aafcd43ec Kent Overstreet 2021-04-24  352  		return -EROFS;
aae15aafcd43ec Kent Overstreet 2021-04-24  353  	}
aae15aafcd43ec Kent Overstreet 2021-04-24  354  
134915f3d38d83 Kent Overstreet 2019-03-21  355  	if (test_bit(BCH_FS_RW, &c->flags))
134915f3d38d83 Kent Overstreet 2019-03-21  356  		return 0;
134915f3d38d83 Kent Overstreet 2019-03-21  357  
619f5bee86b558 Kent Overstreet 2019-04-17  358  	/*
619f5bee86b558 Kent Overstreet 2019-04-17  359  	 * nochanges is used for fsck -n mode - we have to allow going rw
619f5bee86b558 Kent Overstreet 2019-04-17  360  	 * during recovery for that to work:
619f5bee86b558 Kent Overstreet 2019-04-17  361  	 */
619f5bee86b558 Kent Overstreet 2019-04-17  362  	if (c->opts.norecovery ||
619f5bee86b558 Kent Overstreet 2019-04-17  363  	    (c->opts.nochanges &&
619f5bee86b558 Kent Overstreet 2019-04-17  364  	     (!early || c->opts.read_only)))
619f5bee86b558 Kent Overstreet 2019-04-17  365  		return -EROFS;
330581f16f3041 Kent Overstreet 2019-04-05  366  
2c944fa12dc731 Kent Overstreet 2021-03-19  367  	bch_info(c, "going read-write");
2c944fa12dc731 Kent Overstreet 2021-03-19  368  
134915f3d38d83 Kent Overstreet 2019-03-21  369  	ret = bch2_fs_mark_dirty(c);
134915f3d38d83 Kent Overstreet 2019-03-21  370  	if (ret)
134915f3d38d83 Kent Overstreet 2019-03-21  371  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  372  
c0960603e2d42d Kent Overstreet 2022-04-17  373  	clear_bit(BCH_FS_CLEAN_SHUTDOWN, &c->flags);
2340fd9d27c480 Kent Overstreet 2020-05-24  374  
b9004e8576b1c2 Kent Overstreet 2022-12-02  375  	/*
b9004e8576b1c2 Kent Overstreet 2022-12-02  376  	 * First journal write must be a flush write: after a clean shutdown we
b9004e8576b1c2 Kent Overstreet 2022-12-02  377  	 * don't read the journal, so the first journal write may end up
b9004e8576b1c2 Kent Overstreet 2022-12-02  378  	 * overwriting whatever was there previously, and there must always be
b9004e8576b1c2 Kent Overstreet 2022-12-02  379  	 * at least one non-flush write in the journal or recovery will fail:
b9004e8576b1c2 Kent Overstreet 2022-12-02  380  	 */
b9004e8576b1c2 Kent Overstreet 2022-12-02  381  	set_bit(JOURNAL_NEED_FLUSH_WRITE, &c->journal.flags);
b9004e8576b1c2 Kent Overstreet 2022-12-02  382  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  383  	for_each_rw_member(ca, c, i)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  384  		bch2_dev_allocator_add(c, ca);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  385  	bch2_recalc_capacity(c);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  386  
5f5c7466171332 Kent Overstreet 2022-10-17  387  	ret = bch2_gc_thread_start(c);
5f5c7466171332 Kent Overstreet 2022-10-17  388  	if (ret) {
5f5c7466171332 Kent Overstreet 2022-10-17  389  		bch_err(c, "error starting gc thread");
5f5c7466171332 Kent Overstreet 2022-10-17  390  		return ret;
5f5c7466171332 Kent Overstreet 2022-10-17  391  	}
5f5c7466171332 Kent Overstreet 2022-10-17  392  
5f5c7466171332 Kent Overstreet 2022-10-17  393  	ret = bch2_copygc_start(c);
5f5c7466171332 Kent Overstreet 2022-10-17  394  	if (ret) {
5f5c7466171332 Kent Overstreet 2022-10-17  395  		bch_err(c, "error starting copygc thread");
5f5c7466171332 Kent Overstreet 2022-10-17 @396  		return ret;
5f5c7466171332 Kent Overstreet 2022-10-17  397  	}
5f5c7466171332 Kent Overstreet 2022-10-17  398  
134915f3d38d83 Kent Overstreet 2019-03-21  399  	if (!early) {
134915f3d38d83 Kent Overstreet 2019-03-21  400  		ret = bch2_fs_read_write_late(c);
134915f3d38d83 Kent Overstreet 2019-03-21  401  		if (ret)
134915f3d38d83 Kent Overstreet 2019-03-21  402  			goto err;
134915f3d38d83 Kent Overstreet 2019-03-21  403  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  404  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
