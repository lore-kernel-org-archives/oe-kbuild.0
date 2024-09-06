Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CEA3B1A2
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Sep 2024 06:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725605447; cv=none; b=AapisPm7t2FtWDxX6v6U4E8p3eJ+N5tJ347Yin4YcXy14PAFSs2QJlVmopitYrWQ6a2U7wM4reLOlpo1sAMQD6HLJbH8AxfH9fG2v2dCjKKAnKqqcCxfqbDENRkm3v7IlVo7OMcStGZJwDpKLaQxwhkoVUMZdhfjTSo+J7PHfps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725605447; c=relaxed/simple;
	bh=a5C2b+tcOW9HGvUUpuBdDEC5c3gZVYI8FESmYicnyFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NPq5K/clvm3Gi/6KT8PEtDLwhucJt3hc+X+6NGxpnNLyA/htBPjvOWA0qTKTCqSR/xbbqVcF+SVMCmKWxuYabEjyPYyPcWbWtgxfsI4k62Zf/UAG6FtYkFapqJBIhqQWNGw+Ew7KEKi3HK4+oVFwnp6LpAGLPVlVNz7GD7R6Hy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QoO8zDHe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QoO8zDHe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725605445; x=1757141445;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a5C2b+tcOW9HGvUUpuBdDEC5c3gZVYI8FESmYicnyFk=;
  b=QoO8zDHewXnoGCARnDUot2bIRZWwVJ9auqdDnX233z8HfVHovkxACZqB
   eA+ENgpjLw9HapqZZJ3dbYW9HNSDgIGD92yGHAQknBCt14duzLrQRRMoA
   XU90cwPyJrYXW8pFuen51gTnw1LHfxr++EMMtceP8jgcJRuuUujBvIzov
   PLR28RhdC0+5EVTmSgxl8PQDoPWdbIJ0k4cAqucEzP0LUkd1TFurqgMjP
   ASYLjsrkac0ppw0bUoiutXzVQMsRd4kTzLa4dma8azioDssjXSbPKeNEw
   mzELt46JxfLpFLEhFXHcFb4kkz3Oc0hWPTXG3M56GVKbhWf9u19/Pb25g
   w==;
X-CSE-ConnectionGUID: lWMDf5kaTnGbBPuidUecMA==
X-CSE-MsgGUID: XQDDSAmGR6eOt2GxCZEmdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24509414"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="24509414"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 23:50:35 -0700
X-CSE-ConnectionGUID: iA8uDm/JRvqs9tJD+sB3OA==
X-CSE-MsgGUID: eIR7aAq8QCiGeNvkjRNDvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="70020660"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Sep 2024 23:50:33 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smSnf-000Alj-0G;
	Fri, 06 Sep 2024 06:50:31 +0000
Date: Fri, 6 Sep 2024 14:50:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/md/dm-integrity.c:521 sb_mac() error: __builtin_memcmp()
 'actual_mac' too small (64 vs 448)
Message-ID: <202409061401.44rtN1bh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@google.com>
CC: Mike Snitzer <snitzer@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b831f83e40a24f07c8dcba5be408d93beedc820f
commit: 070bb43ab01e891db1b742d4ddd7291c7f8d7022 dm integrity: use crypto_shash_digest() in sb_mac()
date:   10 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 months ago
config: i386-randconfig-141-20240906 (https://download.01.org/0day-ci/archive/20240906/202409061401.44rtN1bh-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409061401.44rtN1bh-lkp@intel.com/

smatch warnings:
drivers/md/dm-integrity.c:521 sb_mac() error: __builtin_memcmp() 'actual_mac' too small (64 vs 448)

vim +/actual_mac +521 drivers/md/dm-integrity.c

1f9fc0b826119f Mikulas Patocka   2018-07-03  491  
09d85f8d8909ec Mikulas Patocka   2021-01-21  492  static int sb_mac(struct dm_integrity_c *ic, bool wr)
09d85f8d8909ec Mikulas Patocka   2021-01-21  493  {
09d85f8d8909ec Mikulas Patocka   2021-01-21  494  	SHASH_DESC_ON_STACK(desc, ic->journal_mac);
09d85f8d8909ec Mikulas Patocka   2021-01-21  495  	int r;
070bb43ab01e89 Eric Biggers      2023-10-28  496  	unsigned int mac_size = crypto_shash_digestsize(ic->journal_mac);
070bb43ab01e89 Eric Biggers      2023-10-28  497  	__u8 *sb = (__u8 *)ic->sb;
070bb43ab01e89 Eric Biggers      2023-10-28  498  	__u8 *mac = sb + (1 << SECTOR_SHIFT) - mac_size;
09d85f8d8909ec Mikulas Patocka   2021-01-21  499  
070bb43ab01e89 Eric Biggers      2023-10-28  500  	if (sizeof(struct superblock) + mac_size > 1 << SECTOR_SHIFT) {
09d85f8d8909ec Mikulas Patocka   2021-01-21  501  		dm_integrity_io_error(ic, "digest is too long", -EINVAL);
09d85f8d8909ec Mikulas Patocka   2021-01-21  502  		return -EINVAL;
09d85f8d8909ec Mikulas Patocka   2021-01-21  503  	}
09d85f8d8909ec Mikulas Patocka   2021-01-21  504  
09d85f8d8909ec Mikulas Patocka   2021-01-21  505  	desc->tfm = ic->journal_mac;
09d85f8d8909ec Mikulas Patocka   2021-01-21  506  
09d85f8d8909ec Mikulas Patocka   2021-01-21  507  	if (likely(wr)) {
070bb43ab01e89 Eric Biggers      2023-10-28  508  		r = crypto_shash_digest(desc, sb, mac - sb, mac);
09d85f8d8909ec Mikulas Patocka   2021-01-21  509  		if (unlikely(r < 0)) {
070bb43ab01e89 Eric Biggers      2023-10-28  510  			dm_integrity_io_error(ic, "crypto_shash_digest", r);
09d85f8d8909ec Mikulas Patocka   2021-01-21  511  			return r;
09d85f8d8909ec Mikulas Patocka   2021-01-21  512  		}
09d85f8d8909ec Mikulas Patocka   2021-01-21  513  	} else {
070bb43ab01e89 Eric Biggers      2023-10-28  514  		__u8 actual_mac[HASH_MAX_DIGESTSIZE];
0ef0b4717aa684 Heinz Mauelshagen 2023-02-01  515  
070bb43ab01e89 Eric Biggers      2023-10-28  516  		r = crypto_shash_digest(desc, sb, mac - sb, actual_mac);
09d85f8d8909ec Mikulas Patocka   2021-01-21  517  		if (unlikely(r < 0)) {
070bb43ab01e89 Eric Biggers      2023-10-28  518  			dm_integrity_io_error(ic, "crypto_shash_digest", r);
09d85f8d8909ec Mikulas Patocka   2021-01-21  519  			return r;
09d85f8d8909ec Mikulas Patocka   2021-01-21  520  		}
070bb43ab01e89 Eric Biggers      2023-10-28 @521  		if (memcmp(mac, actual_mac, mac_size)) {
09d85f8d8909ec Mikulas Patocka   2021-01-21  522  			dm_integrity_io_error(ic, "superblock mac", -EILSEQ);
82bb85998cc9a3 Michael Weiß      2021-09-04  523  			dm_audit_log_target(DM_MSG_PREFIX, "mac-superblock", ic->ti, 0);
09d85f8d8909ec Mikulas Patocka   2021-01-21  524  			return -EILSEQ;
09d85f8d8909ec Mikulas Patocka   2021-01-21  525  		}
09d85f8d8909ec Mikulas Patocka   2021-01-21  526  	}
09d85f8d8909ec Mikulas Patocka   2021-01-21  527  
09d85f8d8909ec Mikulas Patocka   2021-01-21  528  	return 0;
09d85f8d8909ec Mikulas Patocka   2021-01-21  529  }
09d85f8d8909ec Mikulas Patocka   2021-01-21  530  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
