Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FF510F9
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Nov 2023 01:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kh/WeKSb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698974829; x=1730510829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZD6E9wCrBhzeJwfQ+xdTw1ivL3Dogl4hzE6jtcrqbb4=;
  b=Kh/WeKSb5SWsMcZChe7uZT+JcNoR2hz6yPki1xgSS0H7WLmbZAqaKlxz
   r9uhhWuh6VrhGvsciyJPeoXia6gyJiBeeGbvL1Z6IrIWR9eqpErjU+de/
   A6zN6NMSL6zZ4Ig6r7QWJqOPz4JDN8KNUXriVoEhayYhGbTLxVR3Y+8/U
   yjl6jDN2CIOLOBnyTYCffgJ3iqFgexQs2Lxk9gADFWdPsbDyo/2a1xIJ5
   hHiJuJu9RJVoDQ8f/5YwV5nOSfm+G2c6JzNya238/etDFko6SWZC5iFN5
   7HWigSumHAQPdYRZTQRUcQ4TEu9t4zI5O26BHaz4kMKsae+nm1NEdk5V7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="391726689"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="391726689"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 18:27:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="905180662"
X-IronPort-AV: E=Sophos;i="6.03,272,1694761200"; 
   d="scan'208";a="905180662"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2023 18:27:01 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyixf-00025m-2L;
	Fri, 03 Nov 2023 01:26:59 +0000
Date: Fri, 3 Nov 2023 09:26:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/bcachefs/bkey_methods.c:292 __bch2_bkey_compat() warn: for
 statement not indented
Message-ID: <202311030945.2uhlxVAO-lkp@intel.com>
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
head:   4652b8e4f3ffa48c706ec334f048c217a7d9750d
commit: 41697f382cffc0e396dd832d19c78e69cdd10aa3 bcachefs: Fix for the bkey compat path
date:   11 days ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 days ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231103/202311030945.2uhlxVAO-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231103/202311030945.2uhlxVAO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311030945.2uhlxVAO-lkp@intel.com/

smatch warnings:
fs/bcachefs/bkey_methods.c:292 __bch2_bkey_compat() warn: for statement not indented

vim +292 fs/bcachefs/bkey_methods.c

39fb2983c58629 Kent Overstreet 2020-01-07  276  
39fb2983c58629 Kent Overstreet 2020-01-07  277  void __bch2_bkey_compat(unsigned level, enum btree_id btree_id,
39fb2983c58629 Kent Overstreet 2020-01-07  278  			unsigned version, unsigned big_endian,
39fb2983c58629 Kent Overstreet 2020-01-07  279  			int write,
39fb2983c58629 Kent Overstreet 2020-01-07  280  			struct bkey_format *f,
39fb2983c58629 Kent Overstreet 2020-01-07  281  			struct bkey_packed *k)
39fb2983c58629 Kent Overstreet 2020-01-07  282  {
39fb2983c58629 Kent Overstreet 2020-01-07  283  	const struct bkey_ops *ops;
39fb2983c58629 Kent Overstreet 2020-01-07  284  	struct bkey uk;
39fb2983c58629 Kent Overstreet 2020-01-07  285  	struct bkey_s u;
41697f382cffc0 Kent Overstreet 2020-04-24  286  	int i;
39fb2983c58629 Kent Overstreet 2020-01-07  287  
41697f382cffc0 Kent Overstreet 2020-04-24  288  	/*
41697f382cffc0 Kent Overstreet 2020-04-24  289  	 * Do these operations in reverse order in the write path:
41697f382cffc0 Kent Overstreet 2020-04-24  290  	 */
41697f382cffc0 Kent Overstreet 2020-04-24  291  
41697f382cffc0 Kent Overstreet 2020-04-24 @292  	for (i = 0; i < 4; i++)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
