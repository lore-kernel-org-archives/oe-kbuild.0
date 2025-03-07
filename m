Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14BE1974FE
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Mar 2025 06:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741327939; cv=none; b=BLt7mRGZ4unqcdq3TW/TsCm65DEb+ddrGWr0LbmWTvhz8H5tGgkewJPkvS+mvQVyOr2VVuNB1zVbHOp0ZvCKk2lADOaUDW9uDHVh8bwEuDa8lxOhhM8BtIBsIJEVyMZJD2mW0pfuIeAU1wVMYqMYkp/xKqxPz4Q777wGC+/dRFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741327939; c=relaxed/simple;
	bh=vhYmDQrikBuucIKrUSe32EAv48XjHs8i8dkwFR5p7PM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F41b6KcmoXFZMelQAtoRsmal871II3BbV1UvlAMhHTx/GS26o6eG8TWfe8oSQrhWbt1oczkUm7a52dquOXDu5iq3GunDf1twNkjxrL0BDRWzijTES9hYjVsgs1SxdyDvt4LGHucqPG8o0H8mkqfndNyZ7kMUBIaO1pG/7qghQN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g47jxH6T; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g47jxH6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741327939; x=1772863939;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vhYmDQrikBuucIKrUSe32EAv48XjHs8i8dkwFR5p7PM=;
  b=g47jxH6TOTDs23tBddP5aYJQN31pHknVSr50Qb+f2uNCT8Jc3DY13xqY
   xz9BdAgRqf1bQG9YR3fomkUlcWJgnNof5lO+GjJ2DlXmesXLAAVoAetZR
   deSrte+Fbd0PsdbNv/Yg6la2iMbySxThi4DPmxqJjAzqbheXFIbtfoY/x
   7izp0kvTGI8p0iEO2z89EXH8pEedhK5MYk4m2rq5xCTi6EHhUXRAdX9rz
   TAyyUqybBgXqBA1EbhOwnl/bOJ4GjFlTMCI0wKmMQYEhP4euCZrwxvflg
   2MsqWyxLIJob24frshdcj0N2O+rHv4BvHSSuBRhHdtd41WjGkYoQgzRuF
   g==;
X-CSE-ConnectionGUID: lJ9zbpkLQ/aAmTzUV52RjQ==
X-CSE-MsgGUID: zRjuUAOdQgqRbTF4ZlfB6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53356951"
X-IronPort-AV: E=Sophos;i="6.14,228,1736841600"; 
   d="scan'208";a="53356951"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 22:12:18 -0800
X-CSE-ConnectionGUID: zbJF5zfCS5i8VLNoIBFL0g==
X-CSE-MsgGUID: AwKYbavmRqi1cILjtHvH8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120155014"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Mar 2025 22:12:15 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqQwH-00004R-2u;
	Fri, 07 Mar 2025 06:12:08 +0000
Date: Fri, 7 Mar 2025 14:10:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [cel:nfsd-testing 35/53] fs/nfsd/state.h:788 nfsd4_try_run_cb()
 warn: test_and_set_bit() takes a bit number
Message-ID: <202503071428.Y4kljIky-lkp@intel.com>
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
TO: Jeff Layton <jlayton@kernel.org>
CC: Chuck Lever <chuck.lever@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-testing
head:   312e8dc9f5f591a4927b4786a25840ef381c97d9
commit: f94ac2bc823ffbabc5c88c38e63a1e6635f8a6cd [35/53] nfsd: prevent callback tasks running concurrently
:::::: branch date: 15 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250307/202503071428.Y4kljIky-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503071428.Y4kljIky-lkp@intel.com/

New smatch warnings:
fs/nfsd/state.h:788 nfsd4_try_run_cb() warn: test_and_set_bit() takes a bit number
fs/nfsd/nfs4state.c:3235 nfs4_cb_getattr() warn: test_and_set_bit() takes a bit number
fs/nfsd/nfs4state.c:5428 nfsd_break_one_deleg() warn: test_and_set_bit() takes a bit number
fs/nfsd/state.h:788 nfsd4_try_run_cb() warn: test_and_set_bit() takes a bit number
fs/nfsd/nfs4callback.c:1315 nfsd41_destroy_cb() warn: clear_bit() takes a bit number
fs/nfsd/nfs4layouts.c:347 nfsd4_recall_file_layout() warn: test_and_set_bit() takes a bit number

Old smatch warnings:
fs/nfsd/nfs4proc.c:382 nfsd4_create_file() warn: 'child' is an error pointer or valid
fs/nfsd/nfs4state.c:8034 init_lock_stateid() warn: inconsistent returns '&stp->st_mutex'.

vim +788 fs/nfsd/state.h

f94ac2bc823ffb Jeff Layton 2025-02-20  785  
f94ac2bc823ffb Jeff Layton 2025-02-20  786  static inline void nfsd4_try_run_cb(struct nfsd4_callback *cb)
f94ac2bc823ffb Jeff Layton 2025-02-20  787  {
f94ac2bc823ffb Jeff Layton 2025-02-20 @788  	if (!test_and_set_bit(NFSD4_CALLBACK_RUNNING, &cb->cb_flags))
f94ac2bc823ffb Jeff Layton 2025-02-20  789  		WARN_ON_ONCE(!nfsd4_run_cb(cb));
f94ac2bc823ffb Jeff Layton 2025-02-20  790  }
f94ac2bc823ffb Jeff Layton 2025-02-20  791  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
