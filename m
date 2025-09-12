Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC2B2ED87A
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Sep 2025 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757695259; cv=none; b=fufAhpwTP4ohhd2fTowe+d1J+qu9WakKRI71ikReZSBOWsk0NIdL1Kh5eOWFIUbTeog0lH04mG6+WIqkjzTAM66TuFDwrrLSB14Ey783K5Yw3AqmP2c4HcTXYViI+i8ALqNTUpysfDqQl3Tz8/xzH+u8X96UYVgHVpQclyneWOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757695259; c=relaxed/simple;
	bh=bKwayLvo0rs5uQfjchYNy0CGEu1nxZ/hNDHSilCZADY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dwsA0iUI9pcnNVm0XsT7/zO8j7BBJHwIQYTJwCuTcf0IzY5fO4E9JwSmjKS2t1WDVZZYZ8NWX8ySWqTTiYSfa2AOwlDWEBxO2FSfII32IxD+PGUC2sUwwSgEX5cOBAiBNOmMFx4kA1R7MO8weoMhZvKL1bLkQjd17YYpAIVlIuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BfMg7sb5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BfMg7sb5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757695257; x=1789231257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bKwayLvo0rs5uQfjchYNy0CGEu1nxZ/hNDHSilCZADY=;
  b=BfMg7sb554aOyYhrjW9viVZRLCfwpcxKA1SaUcRs1rtiFwzLZaPg9GR1
   /zyPBZA6AqrH6+hKy07uXr4f8FJsnBebeMrJwIMohZYm/KUWfTNi9bF9W
   dE8l7+8yNJQYSs7PSP4pOt3YMeD7t/Kf/THwZ3uDuifHdbvA+8KipOkYJ
   8wjIssJgVNXlMXk60fxxeDx5sg6rI/nQSAWq4N/qVMm1K3MS1OTTS83be
   YRsfVVK5IhDB6lE2iF5lY9qIptB4Z1PB/s7tFo7glNoT5B+dSE0oXGg53
   lPKTD9ZnSRhCbaT3mTON8Cfyd9AQ24j5NrbJD5a6rkuUA877ILSgDlpFW
   Q==;
X-CSE-ConnectionGUID: u9ldkFNIS06RobhprcxMug==
X-CSE-MsgGUID: bcw7Zdw+Rz+iouV2giD1rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11551"; a="60190831"
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="60190831"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 09:40:57 -0700
X-CSE-ConnectionGUID: 0lzRDi2IQvaFAvroV050IQ==
X-CSE-MsgGUID: oUkYlVeeTuGjS8fJ7UZpBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,259,1751266800"; 
   d="scan'208";a="173307436"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 12 Sep 2025 09:40:56 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ux6pR-00016y-20;
	Fri, 12 Sep 2025 16:40:53 +0000
Date: Sat, 13 Sep 2025 00:40:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:bcachefs-testing 409/413] fs/bcachefs/sysfs.c:811
 sysfs_opt_store() error: we previously assumed 'ca' could be null (see line
 806)
Message-ID: <202509130045.dqS8rJDb-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   bb2535dc2fde90827c6c5f396f650218c1708fa2
commit: 3da259c787a77ffffc7289a3b34b5d2bd862b446 [409/413] bcachefs: bch2_set_rebalance_needs_scan_device()
:::::: branch date: 12 hours ago
:::::: commit date: 15 hours ago
config: hexagon-randconfig-r071-20250912 (https://download.01.org/0day-ci/archive/20250913/202509130045.dqS8rJDb-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509130045.dqS8rJDb-lkp@intel.com/

smatch warnings:
fs/bcachefs/sysfs.c:811 sysfs_opt_store() error: we previously assumed 'ca' could be null (see line 806)

vim +/ca +811 fs/bcachefs/sysfs.c

1c6fdbd8f2465d Kent Overstreet 2017-03-16  763  
8b294a9b5c1447 Kent Overstreet 2025-03-11  764  static ssize_t sysfs_opt_store(struct bch_fs *c,
8b294a9b5c1447 Kent Overstreet 2025-03-11  765  			       struct bch_dev *ca,
8b294a9b5c1447 Kent Overstreet 2025-03-11  766  			       enum bch_opt_id id,
8b294a9b5c1447 Kent Overstreet 2025-03-11  767  			       const char *buf, size_t size)
1c6fdbd8f2465d Kent Overstreet 2017-03-16  768  {
8b294a9b5c1447 Kent Overstreet 2025-03-11  769  	const struct bch_option *opt = bch2_opt_table + id;
8b294a9b5c1447 Kent Overstreet 2025-03-11  770  	int ret = 0;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  771  
f0cc5d2931378b Kent Overstreet 2022-03-06  772  	/*
f0cc5d2931378b Kent Overstreet 2022-03-06  773  	 * We don't need to take c->writes for correctness, but it eliminates an
f0cc5d2931378b Kent Overstreet 2022-03-06  774  	 * unsightly error message in the dmesg log when we're RO:
f0cc5d2931378b Kent Overstreet 2022-03-06  775  	 */
c9b1d94a2196fc Kent Overstreet 2025-04-18  776  	if (unlikely(!enumerated_ref_tryget(&c->writes, BCH_WRITE_REF_sysfs)))
f0cc5d2931378b Kent Overstreet 2022-03-06  777  		return -EROFS;
f0cc5d2931378b Kent Overstreet 2022-03-06  778  
8b294a9b5c1447 Kent Overstreet 2025-03-11  779  	char *tmp = kstrdup(buf, GFP_KERNEL);
f0cc5d2931378b Kent Overstreet 2022-03-06  780  	if (!tmp) {
f0cc5d2931378b Kent Overstreet 2022-03-06  781  		ret = -ENOMEM;
f0cc5d2931378b Kent Overstreet 2022-03-06  782  		goto err;
f0cc5d2931378b Kent Overstreet 2022-03-06  783  	}
1c6fdbd8f2465d Kent Overstreet 2017-03-16  784  
8b294a9b5c1447 Kent Overstreet 2025-03-11  785  	u64 v;
8b294a9b5c1447 Kent Overstreet 2025-03-11  786  	ret =   bch2_opt_parse(c, opt, strim(tmp), &v, NULL) ?:
c93cee090d7386 Kent Overstreet 2025-08-27  787  		bch2_opt_hook_pre_set(c, ca, 0, id, v, true);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  788  	kfree(tmp);
1c6fdbd8f2465d Kent Overstreet 2017-03-16  789  
1c6fdbd8f2465d Kent Overstreet 2017-03-16  790  	if (ret < 0)
f0cc5d2931378b Kent Overstreet 2022-03-06  791  		goto err;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  792  
e882906929c55a Kent Overstreet 2025-05-14  793  	bool is_sb = opt->get_sb || opt->get_member;
e882906929c55a Kent Overstreet 2025-05-14  794  	bool changed = false;
e882906929c55a Kent Overstreet 2025-05-14  795  
e882906929c55a Kent Overstreet 2025-05-14  796  	if (is_sb) {
e882906929c55a Kent Overstreet 2025-05-14  797  		changed = bch2_opt_set_sb(c, ca, opt, v);
e882906929c55a Kent Overstreet 2025-05-14  798  	} else if (!ca) {
e882906929c55a Kent Overstreet 2025-05-14  799  		changed = bch2_opt_get_by_id(&c->opts, id) != v;
e882906929c55a Kent Overstreet 2025-05-14  800  	} else {
e882906929c55a Kent Overstreet 2025-05-14  801  		/* device options that aren't superblock options aren't
e882906929c55a Kent Overstreet 2025-05-14  802  		 * supported */
e882906929c55a Kent Overstreet 2025-05-14  803  		BUG();
e882906929c55a Kent Overstreet 2025-05-14  804  	}
c2250847043901 Kent Overstreet 2024-10-24  805  
c79eb06da4c34f Kent Overstreet 2025-04-15 @806  	if (!ca)
c79eb06da4c34f Kent Overstreet 2025-04-15  807  		bch2_opt_set_by_id(&c->opts, id, v);
80be08cdb5a822 Kent Overstreet 2025-03-13  808  
3da259c787a77f Kent Overstreet 2025-08-23  809  	/* XXX: add a superblock bit to make this transactional */
3da259c787a77f Kent Overstreet 2025-08-23  810  	if (id == Opt_durability)
3da259c787a77f Kent Overstreet 2025-08-23 @811  		bch2_set_rebalance_needs_scan_device(c, ca->dev_idx);
3da259c787a77f Kent Overstreet 2025-08-23  812  
c79eb06da4c34f Kent Overstreet 2025-04-15  813  	if (changed)
041ac8a7a4b4d1 Kent Overstreet 2025-08-27  814  		bch2_opt_hook_post_set(c, ca, 0, id, v);
80be08cdb5a822 Kent Overstreet 2025-03-13  815  
f0cc5d2931378b Kent Overstreet 2022-03-06  816  	ret = size;
f0cc5d2931378b Kent Overstreet 2022-03-06  817  err:
c9b1d94a2196fc Kent Overstreet 2025-04-18  818  	enumerated_ref_put(&c->writes, BCH_WRITE_REF_sysfs);
f0cc5d2931378b Kent Overstreet 2022-03-06  819  	return ret;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  820  }
8b294a9b5c1447 Kent Overstreet 2025-03-11  821  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
